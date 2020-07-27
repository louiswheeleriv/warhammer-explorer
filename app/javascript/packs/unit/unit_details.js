import React from "react";
import { render } from "react-dom";
import {
  ApolloClient,
  InMemoryCache,
  ApolloProvider,
  useQuery,
  gql
} from "@apollo/client";

const client = new ApolloClient({
  uri: "http://localhost:3000/graphql",
  cache: new InMemoryCache()
});

const UNIT_QUERY = gql`
	query Unit($unitId: ID!) {
		unit(id: $unitId) {
			id
			name
			faction
			detachmentSlot
			unitModels {
				edges {
					node {
						id
						name
						unitModelStatlines {
							edges {
								node {
									id
									movement
									weaponSkill
									ballisticSkill
									strength
									toughness
									wounds
									attacks
									leadership
									armorSave
								}
							}
						}
					}
				}
			}
		}
	}
`;

function UnitTopLevelDetails(data) {
	var { faction, name, detachmentSlot } = data.unit;
	return (
		<h2>{faction}: {name} ({detachmentSlot})</h2>
	);
}

function UnitModelsTable(data) {
	var rows = data.unit.unitModels.edges.map(edge => edge.node).map(unitModelRow);
	return (
		<table>
			<thead>
				<tr>
					<th>Model</th>
					<th>M</th>
					<th>WS</th>
					<th>BS</th>
					<th>S</th>
					<th>T</th>
					<th>W</th>
					<th>A</th>
					<th>Ld</th>
					<th>Sv</th>
				</tr>
			</thead>
			<tbody>
				{rows}
			</tbody>
		</table>
	);
}

function unitModelRow(unitModel) {
	var stats = unitModel.unitModelStatlines.edges[0].node;
	return (
		<tr key={unitModel.id}>
			<td>{unitModel.name}</td>
			<td>{stats.movement + '"'}</td>
			<td>{stats.weaponSkill + '+'}</td>
			<td>{stats.ballisticSkill + '+'}</td>
			<td>{stats.strength}</td>
			<td>{stats.toughness}</td>
			<td>{stats.wounds}</td>
			<td>{stats.attacks}</td>
			<td>{stats.leadership}</td>
			<td>{stats.armorSave + '+'}</td>
		</tr>
	);
}

function UnitDetails() {
	var variables = { unitId: recordId() };
	const { loading, error, data } = useQuery(UNIT_QUERY, { variables });

	if (loading) return <p>Loading...</p>;
	if (error) return <p>Error!</p>;

	return (
		<div>
			{UnitTopLevelDetails(data)}
			{UnitModelsTable(data)}
		</div>
	);
}

function App() {
	return (
    <ApolloProvider client={client}>
			<UnitDetails />
    </ApolloProvider>
  );
}

function recordId() {
	var path = window.location.pathname.split('/');
	return path[path.length - 1];
}

render(<App />, document.getElementById("root"));
