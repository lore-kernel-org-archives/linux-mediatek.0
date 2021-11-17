Return-Path: <SRS0=BaWb=QE=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 788ECC433F5
	for <linux-mediatek@archiver.kernel.org>; Wed, 17 Nov 2021 09:39:42 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 42B0D60C4A
	for <linux-mediatek@archiver.kernel.org>; Wed, 17 Nov 2021 09:39:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 42B0D60C4A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eAIEwVDLX+1IEBm3aBEGSBozglKoPEAzc4wUfCMUUho=; b=Ld8CzYmladhRfs
	jdoLPGEceGO2T4S7SnQzIbMAWx1AwWkNAYUr7XUhyrI8ZWhkq4fchhcJL/C3FvQDD/BvoKdRwtYZ/
	Je/xNs2RI0DBN57f5NvTqXRO0VWP7qNygzeW1gKp8Q6R9F47rq69SMre3QFoOgzO+AwLmdXfpSL6U
	1fgX7HKmjh4oxAwRyNrX2hlSKWEt4FaGLCJgTN0yNE2rfVbsqG3JRRJAHh0KmewGmwaTz/vKxxXR/
	x12j+lpAI0UICWagmUqntdQd/M9wNUKUZOPwskTPc8Q0kHUctfSvrfPCS6tFDeTZjAEpYPN/B2PAD
	J1SynNZ/cr3GyTHQmCEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mnHPg-004JbU-Bq; Wed, 17 Nov 2021 09:39:32 +0000
Received: from mail-vi1eur05on2072.outbound.protection.outlook.com
 ([40.107.21.72] helo=EUR05-VI1-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mnHOo-004IyU-Sa
 for linux-mediatek@lists.infradead.org; Wed, 17 Nov 2021 09:38:40 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Opft1KRWgug+lbaeOgzvc1z9/rjMOseoxse6cOjaDcd98F/f1NVYS/G5HoPbLm34RdnJlUOLjryAE750RF/cR71YIUbRMUwXKHAMEsEnr5YNQte3Y/zy7X5yPAl9fZjAkGFeF/M5xe9dIAMtXojtQUJXECNNsY2NZPSyR7PBqpo25A+OXzzwlTkJrHndgttxASA+4gmvdYN7Xjt7Y/kC7n9r4ZS+23SSJbVa0+GXZuosj8cTLaT9UMo4KHbwOx2BmPpGZhvyxeydVsmUuVjC+ZcOGTczzEOarq31eZUiHS+bbh3dIBkBpt9yfFyxD0sVuYLUeCls6PMQ57uB+SW4FA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=K/TcaXutvCfzOqQoZbUtGznDhLVWnllTNgKTJn+BGJg=;
 b=HcxAZXbruEDLjRB8QvnmlA6K9LizPomKqCg5DQwARLBOJdifdvEP02eouov3S6qZcu5+pNB/jMTybtOgiLSY2ArosbZe9t9OnTlDbDKziCvyGw2GoaK2eoE04AXabVj3NxDU9/aYOaslSz8Jx1/CNkvvPJvTKDnVETwE5Z/xq/5X9P//RGcfQqmT/M+eHiuIg4qyuxYsoTpc/6VvQsSf1Vwf+VtLOmgDqdAIs2mTS8mmhTbpxrK8fEZygFkYdTAusTODgyfvRA6Go8NKuH8pwJxV2NbR9rav5uvM1hTBWzhHO5F1bXD82vzUOasjaf93jMRTyESiEUJnpZ0PlOj0bA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com; 
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=K/TcaXutvCfzOqQoZbUtGznDhLVWnllTNgKTJn+BGJg=;
 b=WXKjgkiy2iKDso9O9FU7yEcIPe+PICYMeClP7uCbPLn+K94BIxnKKO82l3JjrTaeLbW/CIbvRrcDpHvWnp9k7HvfmORyytY7rBtbBxL5hRsPI1Sl2UAnw9aVZTdqgjeeKsVEmdM0IIQukBFpIhtbz8ZUMBwig7/ImpnFSARM6PQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from VI1PR04MB5151.eurprd04.prod.outlook.com (2603:10a6:803:61::28)
 by VE1PR04MB6623.eurprd04.prod.outlook.com (2603:10a6:803:125::29)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.26; Wed, 17 Nov
 2021 09:38:32 +0000
Received: from VI1PR04MB5151.eurprd04.prod.outlook.com
 ([fe80::85af:f8be:aa99:ba5f]) by VI1PR04MB5151.eurprd04.prod.outlook.com
 ([fe80::85af:f8be:aa99:ba5f%3]) with mapi id 15.20.4690.027; Wed, 17 Nov 2021
 09:38:32 +0000
From: Daniel Baluta <daniel.baluta@oss.nxp.com>
To: broonie@kernel.org,
	alsa-devel@alsa-project.org
Cc: pierre-louis.bossart@linux.intel.com, lgirdwood@gmail.com,
 daniel.baluta@nxp.com, daniel.baluta@gmail.com, AjitKumar.Pandey@amd.com,
 Balakishore.pati@amd.com, vsreddy@amd.com, Julian.Schroeder@amd.com,
 vishnuvardhanrao.ravulapati@amd.com, linux-kernel@vger.kernel.org,
 yc.hung@mediatek.com, linux-mediatek@lists.infradead.org,
 =?UTF-8?q?P=C3=A9ter=20Ujfalusi?= <peter.ujfalusi@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
Subject: [PATCH 15/21] ASoC: SOF: tokens: add token for Mediatek AFE
Date: Wed, 17 Nov 2021 11:37:28 +0200
Message-Id: <20211117093734.17407-16-daniel.baluta@oss.nxp.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20211117093734.17407-1-daniel.baluta@oss.nxp.com>
References: <20211117093734.17407-1-daniel.baluta@oss.nxp.com>
X-ClientProxiedBy: AM3PR03CA0060.eurprd03.prod.outlook.com
 (2603:10a6:207:5::18) To VI1PR04MB5151.eurprd04.prod.outlook.com
 (2603:10a6:803:61::28)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (2a02:2f08:5706:b700:22bb:b216:ffff:73e1)
 by AM3PR03CA0060.eurprd03.prod.outlook.com (2603:10a6:207:5::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.19 via Frontend
 Transport; Wed, 17 Nov 2021 09:38:30 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ae85fa8f-1f72-49b1-bf05-08d9a9ae04e5
X-MS-TrafficTypeDiagnostic: VE1PR04MB6623:
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-Microsoft-Antispam-PRVS: <VE1PR04MB662383CF23CD88C38E5D8A03B89A9@VE1PR04MB6623.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2449;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: HUNybBq2UX+pUGwBtip6d6eTmDoBTilcrAHl2d7aAIzJIF25g018Jn0pLqMXyfU9O1gRL+rIFAdksxjBU15mkFW4N0N/s3X5QrhsQOnZeUuSb8LJrRoWRH9whCtUAoeHTr6fp4iXnU4xiTRL0KFV1UTGnCyi98BJufISmF/VDRhUwzEOeliNlFtgsgdvNcorNimEhJhncz8+ghPTjmcWdEzQqFXqV5bdcCOsuiAG4kKzmjJNLcD4W85dQZbOFj+e2wcAiEGeE26PAGW6Oa3FmoSeu3099Tb1jB9w1OwS+8miE9p1Fb2+ZVjpqTtRl3hi5LlSo/3mbQbwZfxjVdm0x9bJawrvMawqL1b+1Lrq//g8LH7WsdWXznXNkHoSvFJfhnjSsSm/Tok7uoP/txosfRuYIojkrRUdlYiD2ihwnWn57pXOWHyCD/vmtXHAy1hBogE29B54OtXQn4VXw0hujERWYXNHU1RbXgYsUlmpMuEQmF7vcaECtieeNFNqIhJnXyBgPzX/GdkE4fRa64Vcv9zsVdUSnZueyBBf8amGm60jet8dceVOCSGk5pX5tS8dBPGbu/GoaGtHADjh9Wwmqr4dlhsBqT7qdflVD38CLlny6aUDU/rbYiR/PrPPj3verAgJVbnEvxKfx2GbC5yvcg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR04MB5151.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(8936002)(1076003)(52116002)(6506007)(5660300002)(54906003)(8676002)(508600001)(186003)(86362001)(2616005)(6512007)(7416002)(44832011)(66556008)(66476007)(4326008)(66946007)(316002)(38100700002)(6486002)(2906002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YU9hdHRsUWhTVzdDandXYUUra2NVanNWNkwvTDdDMHEvT0xWYXgvV0YrWTR0?=
 =?utf-8?B?RzN6TWZ0S2x0ZWRrYmI4aWVRZVQvSWVFdDVocXdLN01hMHRyYkRVbk5EOUZv?=
 =?utf-8?B?NFFNNG5ZUFhhK0R4RzVTVTBGbXV4bUt3R2NyVU0xQXlpbU8rcDhjZUUwYUha?=
 =?utf-8?B?MkxjYmhXOWhXTlZCcjRrWGNYN2VDdjU2RW10RVovMWtwNjJPZHJKeW5sbnMv?=
 =?utf-8?B?Ry9NT0I3NTR1elJOSWRpWnVNOE9NNVNxWCtkQnFLVHpDaWhGSlRTa2J2N1M3?=
 =?utf-8?B?ZlRBSjZXT0Q2VW9XdzBScHFQSU5KYWlnU1A1ZGdmeDUvY3FNUzJjbU44eTl3?=
 =?utf-8?B?THVaRXpqY2FyUm5zdzA2U0lvaG1oSTJ2UnIwcEtjYzBQeHF6KzdabU1uRnZG?=
 =?utf-8?B?b1ppa1dGUy9XRzdrNVM1d3IyRWV6ZXBna21vLzVNMkJLckNEc3N6bGxTR2My?=
 =?utf-8?B?QnZxbkQ0bVZyOHd0MGorK2dNdFBvSHovZDNZVE9WNzZ0UHE3OWs1SGdlUUlr?=
 =?utf-8?B?RG9wcVVHNDFSaGNsNE1uWitRbWhRSHdFWGdmQnAveUZsSTljbytJL0Q0NHNz?=
 =?utf-8?B?ZzhCUEtZNWFDMnViWkFab0x5MEdnU0VBZUdDWDlnMU5vWGR3N2N5aGhKOHVv?=
 =?utf-8?B?SUtpWFo5eTJ0cVROY21YdmhZU1VqMGtmaTRGL1pYTXZwOENISW1TTVBGbFIw?=
 =?utf-8?B?ZlR6YWhOdXMza0twUlN6a2Z6aDZFV1Y0b0VRN0xLb0NJL0NqQkEwRmhSN3Z4?=
 =?utf-8?B?dXpyeS80RmJzZUkrWEQ3R1pkNVVGbjk5VnVuSGxsc2xHRnp0alh1Ny9GU2JP?=
 =?utf-8?B?RVdQZFpaZzBZZnRXNTVWa2FrRG40MnNzWkxiOUl5S0NMbHRvYWJKWUtnVFI4?=
 =?utf-8?B?UWF5bmllUUkrVFVERWduVWhMMXlXeUFzRklJK3NRb1lhL3lIK1RLT3NKUlJQ?=
 =?utf-8?B?QW1PYzE0QytNakJHbC9pbitRQS9WdGRuTTdSV1IrVGlkaFBweXlvV3lzRnpP?=
 =?utf-8?B?cU1YR00zRFlFay9kREtlREt5YzRDWms0WlZ2SmhHMDY5ZXVFUU04bkVrMExR?=
 =?utf-8?B?NmQyWG1Oeks2T2VXTng3cGl6Tk5qcGFwTnRJck9TTFA0VERTR3luOGNHVStv?=
 =?utf-8?B?MlRpNGlMZFJSVEJMV0ZGait1TDBCZStnM3hkVmRxZGpVYlBab2EvTUFGVUxI?=
 =?utf-8?B?QXRTcDh2Y1RzZnJWbmV2NVZBWlovUDBzMVJPVkNIbjBCdnExaUtTT0FwWXR2?=
 =?utf-8?B?d0N3K3ppSC9WbGZzSk1abG10MkFVMXIvR2trTGtLSkVRc3Jibm9Sc1BWNUNh?=
 =?utf-8?B?ckxTVkxLUHYzR3lUTFdLejhSY20vZGxhTW5ibXplUklTdDRKQU5XZG5yV1NI?=
 =?utf-8?B?bmgxanVLbjVXbHBuWmxTMklhRitQQkRBaDFKUlBSZzB4UTdFQ3JFUlovejJJ?=
 =?utf-8?B?Y1BiVUJ4NytBU1lHWUNrc2F2NWNJSEVzOUx2QXlUTWNCWkpMaXlDY2o2QWdZ?=
 =?utf-8?B?R0hBbnRqZXVveUJmZEpLVnp6b1I0L0dvT1FWMWhQRGRGWGN2aXJRRGZ0U0Ft?=
 =?utf-8?B?bGwvL2tUYkRnK2lqQlE3cjYyWDFpSUhDUDZFVm1XcTg3VWkvVThQTm8xYUxr?=
 =?utf-8?B?bU9lOHdMdFlMNGtrZGp4T09ldU1zd1RGWXpYQ1RSVTlqQk05MlVSS2FjVmh2?=
 =?utf-8?B?U3VpeUhTMXRXNXdnTmFwb0ZkVVgyRDVTenRQd2NuSVRUT0pTdkhrSXd0d21n?=
 =?utf-8?B?eEh1LzJOQmg0cUROUWtTZHltVmplYjNpeWd0eUlGaS95UHN0M1R0MVByNkVp?=
 =?utf-8?B?eHUrMmtCanltcjNBNGZveXZGRUR2QmJDMVlrbmhGYkl4MDJrMTlBMk9HMWNa?=
 =?utf-8?B?VDBvSGNUVFFEaXZTQzJtSnQrUWgxZndJUE9JKzhUVHA3TDVMQ01pcm15R1ZB?=
 =?utf-8?B?bEFBczZxTTBYMGtNVHo2eG4yR25XcE5HRVRreTUxNVVZVVVUS2E3Y0FZMVhL?=
 =?utf-8?B?QktUNzNuSEpEdEZuU2dPenZWOWMrQ01kQjlhWWFSN2NlVWpScmpnV245dXo1?=
 =?utf-8?B?NUI0elNtWWZGRjR2RkNuNzRncjBGak5KOHNaTW5pVzV0cXo0bGVEUDhZSGlx?=
 =?utf-8?B?SlZwMkZlNkZRSFhBbGxXc1NtcGlZbW1JN2daU3JTMkk0ZUFRZzl0T3F5M0lN?=
 =?utf-8?B?eHgzbDhpNFo0bW1jZ0Q5a2d1dEdpMHdWZkttb1UxOXFybHNRT21ncXd5aVly?=
 =?utf-8?Q?pBYUWJof9h3WC7Ofe6PFkoN1m5vSjpzfrFe9Gt7ES8=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ae85fa8f-1f72-49b1-bf05-08d9a9ae04e5
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5151.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Nov 2021 09:38:32.5622 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: I4mvp+Xn4t9ZMGrg3rnBKQlUq7lAybR3GERAyC4JS1yVFH4kuSzM3SRvJS9dywkJuJ4YmlFRRDZEqmaqLHRx5w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB6623
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211117_013839_024128_AF400C74 
X-CRM114-Status: UNSURE (   8.22  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

RnJvbTogWUMgSHVuZyA8eWMuaHVuZ0BtZWRpYXRlay5jb20+CgpBZGQgdGhlIGRlZmluaXRpb24g
Zm9yIE1lZGlhdGVrIGF1ZGlvIGZyb250IGVuZChBRkUpIHRva2VucyxpbmNsdWRlCkFGRSBzYW1w
bGluZyByYXRlLCBjaGFubmVscywgYW5kIGZvcm1hdC4KClNpZ25lZC1vZmYtYnk6IFlDIEh1bmcg
PHljLmh1bmdAbWVkaWF0ZWsuY29tPgpSZXZpZXdlZC1ieTogUMOpdGVyIFVqZmFsdXNpIDxwZXRl
ci51amZhbHVzaUBsaW51eC5pbnRlbC5jb20+ClJldmlld2VkLWJ5OiBQaWVycmUtTG91aXMgQm9z
c2FydCA8cGllcnJlLWxvdWlzLmJvc3NhcnRAbGludXguaW50ZWwuY29tPgpSZXZpZXdlZC1ieTog
UmFuamFuaSBTcmlkaGFyYW4gPHJhbmphbmkuc3JpZGhhcmFuQGxpbnV4LmludGVsLmNvbT4KUmV2
aWV3ZWQtYnk6IEthaSBWZWhtYW5lbiA8a2FpLnZlaG1hbmVuQGxpbnV4LmludGVsLmNvbT4KUmV2
aWV3ZWQtYnk6IEd1ZW5uYWRpIExpYWtob3ZldHNraSA8Z3Vlbm5hZGkubGlha2hvdmV0c2tpQGxp
bnV4LmludGVsLmNvbT4KUmV2aWV3ZWQtYnk6IERhbmllbCBCYWx1dGEgPGRhbmllbC5iYWx1dGFA
bnhwLmNvbT4KU2lnbmVkLW9mZi1ieTogRGFuaWVsIEJhbHV0YSA8ZGFuaWVsLmJhbHV0YUBueHAu
Y29tPgotLS0KIGluY2x1ZGUvdWFwaS9zb3VuZC9zb2YvdG9rZW5zLmggfCA1ICsrKysrCiAxIGZp
bGUgY2hhbmdlZCwgNSBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvaW5jbHVkZS91YXBpL3Nv
dW5kL3NvZi90b2tlbnMuaCBiL2luY2x1ZGUvdWFwaS9zb3VuZC9zb2YvdG9rZW5zLmgKaW5kZXgg
MDJiNzFhOGRlZWE0Li5iNzJmYTM4NWJlYmYgMTAwNjQ0Ci0tLSBhL2luY2x1ZGUvdWFwaS9zb3Vu
ZC9zb2YvdG9rZW5zLmgKKysrIGIvaW5jbHVkZS91YXBpL3NvdW5kL3NvZi90b2tlbnMuaApAQCAt
MTQwLDQgKzE0MCw5IEBACiAjZGVmaW5lIFNPRl9US05fSU5URUxfSERBX1JBVEUJCQkxNTAwCiAj
ZGVmaW5lIFNPRl9US05fSU5URUxfSERBX0NICQkJMTUwMQogCisvKiBBRkUgKi8KKyNkZWZpbmUg
U09GX1RLTl9NRURJQVRFS19BRkVfUkFURQkJMTYwMAorI2RlZmluZSBTT0ZfVEtOX01FRElBVEVL
X0FGRV9DSAkJCTE2MDEKKyNkZWZpbmUgU09GX1RLTl9NRURJQVRFS19BRkVfRk9STUFUCQkxNjAy
CisKICNlbmRpZgotLSAKMi4yNy4wCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KTGludXgtbWVkaWF0ZWsgbWFpbGluZyBsaXN0CkxpbnV4LW1lZGlhdGVr
QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9saW51eC1tZWRpYXRlawo=
