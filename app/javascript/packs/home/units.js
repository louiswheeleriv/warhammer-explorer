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

const listUnitsQuery = gql`
	{
		units {
			edges {
				node {
					id
					name
					faction
					detachmentSlot
				}
			}
		}
	}
`;

function UnitsTable() {
	const { loading, error, data } = useQuery(listUnitsQuery);

	if (loading) return <p>Loading...</p>;
	if (error) return <p>Error!</p>;

	var rows = data.units.edges.map(edge => edge.node).map(unitRow);
	return (
		<table>
			<thead>
				<tr>
					<th>Faction</th>
					<th>Unit</th>
					<th>Detachment Slot</th>
				</tr>
			</thead>
			<tbody>
				{rows}
			</tbody>
		</table>
	);
}

function unitRow(unit) {
	return (
		<tr key={unit.id}>
			<td>{unit.faction}</td>
			<td><a href={"unit/" + unit.id}>{unit.name}</a></td>
			<td>{unit.detachmentSlot}</td>
		</tr>
	);
}

function App() {
  return (
    <ApolloProvider client={client}>
			<UnitsTable />
    </ApolloProvider>
  );
}

render(<App />, document.getElementById("root"));
