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

function UnitRows() {
	const { loading, error, data } = useQuery(listUnitsQuery);

	if (loading) return <tr><td>Loading...</td></tr>;
	if (error) return <tr><td>Error!</td></tr>;

	return data.units.edges.map(edge => edge.node).map(unitRow);
}

function unitRow(unit) {
	return (
		<tr key={unit.id}>
			<td>{unit.faction}</td>
			<td>{unit.name}</td>
			<td>{unit.detachmentSlot}</td>
		</tr>
	)
}

function App() {
  return (
    <ApolloProvider client={client}>
			<table>
				<thead>
					<tr>
						<th>Faction</th>
						<th>Unit</th>
						<th>Detachment Slot</th>
					</tr>
				</thead>
				<tbody>
					<UnitRows />
				</tbody>
			</table>
    </ApolloProvider>
  );
}

render(<App />, document.getElementById("root"));
