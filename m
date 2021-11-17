Return-Path: <SRS0=BaWb=QE=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2D71AC433FE
	for <linux-mediatek@archiver.kernel.org>; Wed, 17 Nov 2021 09:39:59 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EA78161284
	for <linux-mediatek@archiver.kernel.org>; Wed, 17 Nov 2021 09:39:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org EA78161284
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=w3OsB5Zoz0g44OlohsYNMycKVqaPXYLDPxTMgrXxRGY=; b=ntXlBkKK+6PLaA
	y/kKrPbrRJXRNsyBUoW3Prl72uV/Obkc4qk37pdBpx/faH86nkEzGXIRcCE2DjcnGyk7gtRcDK9Lg
	P0Az0TWGQ8DMxA6IkJHE0tcf8t2n/BAyPyxlncAQvgqc5PUWrSOZwqKQDxV8kwbXn0b+OvmbYRH8v
	ChetrMc6m7R50dWoCdHQ8Sm5AMB6w58A3EBAPpieYv/BcXrmG7HJDmiHv1gHovMF4r0AEw0ol7+g3
	bbMDYlPLBZzwCsE5dd3E3hmYM+drv/rmyxz6eA2LfvkOn/qaDsd38ERsLybrwvY8kIGaUdSPHJ4lV
	T/YEiePzaQxILV7rHTlg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mnHPw-004JmF-Bb; Wed, 17 Nov 2021 09:39:48 +0000
Received: from mail-db8eur05on2065.outbound.protection.outlook.com
 ([40.107.20.65] helo=EUR05-DB8-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mnHOt-004J61-VH
 for linux-mediatek@lists.infradead.org; Wed, 17 Nov 2021 09:38:45 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eVRv+pLB+lmzHBE0hz2fIlKWhVsZbOH5p+szjGHPWgIZvkH9m94UBcNol9nxQNfGjTvOWlw/RV+v2sSD50/IB5cR0Pi1Gct5Pze49kSSCtYw1EapB/Q3YlRN3m5y3+wy7LzBYdB5xychSy1IXY+YBMQ6I5RyzYhUD46YjofwY1pdA3X93UyJrmWTrnlwLYyqxupToPVP78hKYUhBrEy6bqOAUqg509oTE/oL0ZlqjXl9WTWUX0AxVoomYwwZh9ADcQJIem2nPWFGfYZlyRMpKgUNyhu0Dhh8UphrlAcL9M/h/isAesajDKe65+nWpvDACcn79BRgM+E8de7NzHuevA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7UjjWQcQXj7lwzktA08w1ckpS4ND2jsRngX7+9KTay0=;
 b=lqh3b4nejQAIOK7w/aNLCZxoe04aGW+a9WoUsyCPp5B77xIlaRxTR3RO8CJMoarQd/cIEmbhGY0qr1JUVDvvKYjzMpUP8wSezRaoL+gaLi4rkshGfAyVLzjKA+mRZGurmo5roL5jYP/2WQCR2V14utTOabzjXYbMMWo1JPJvWrQZtvLupX1xYAo7BRscs2+1NBO3VFTnqthYaFPDnUlv8OKzPxV5A2McEgZyLwPLBy4oNdPRR5yXbv2WevCNli4m9HIOlbCrfuSISVNkq7IPEuY6BTI0oawvPjMhy+c5QYDZP++rbs889zNnWAOEzo3Rol14YAG0zcsW7jqc8WWaow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com; 
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7UjjWQcQXj7lwzktA08w1ckpS4ND2jsRngX7+9KTay0=;
 b=bFfqewI+pE5sHtIuGSTsAXaPQ+8gSJexSo7Efnz815KzoidXYiNJe0RHe0p4H3mawwheE5JQw/rKDb/KrjdOK1Kk3/qOirp4FUDOsMQF1FvPbDmFyNwj2ely8qnId1eh2ktZoLibQMxTffPOEoGF6Ac3FbnCn5WivUwTNhcUl/8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from VI1PR04MB5151.eurprd04.prod.outlook.com (2603:10a6:803:61::28)
 by VI1PR04MB3039.eurprd04.prod.outlook.com (2603:10a6:802:b::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4669.16; Wed, 17 Nov
 2021 09:38:38 +0000
Received: from VI1PR04MB5151.eurprd04.prod.outlook.com
 ([fe80::85af:f8be:aa99:ba5f]) by VI1PR04MB5151.eurprd04.prod.outlook.com
 ([fe80::85af:f8be:aa99:ba5f%3]) with mapi id 15.20.4690.027; Wed, 17 Nov 2021
 09:38:38 +0000
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
Subject: [PATCH 18/21] ASoC: SOF: Add mt8195 device descriptor
Date: Wed, 17 Nov 2021 11:37:31 +0200
Message-Id: <20211117093734.17407-19-daniel.baluta@oss.nxp.com>
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
 Transport; Wed, 17 Nov 2021 09:38:37 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b8b9eb4c-1b1f-4333-472d-08d9a9ae08ae
X-MS-TrafficTypeDiagnostic: VI1PR04MB3039:
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-Microsoft-Antispam-PRVS: <VI1PR04MB3039D9932F329D3991E3CB8EB89A9@VI1PR04MB3039.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1060;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: kkHLOStE/Uqhklaw5LU2QdD2THQtEIgNEWoYLKL4EmanrSpLOpeSfnOWxLnPVNN/pRAlwMpjAArQXbPyZi2lQSY4HTvR7C5FhrdYye7cZ/I8n9wVoewEwnCcLFAM5okwIoLoNoObKb0NxwbF74aEV5t6f8qTjWQphh497tyK2TuKFlOoH11o5DCJpZW3Zw+JDYB7tSNVaseVRvz1dqubbpsvpn1cFpCqB3CB37QaugBQ1J4ZdbxI0f+4ZnKErV6PG6LiSSUlIthoyoju8UEIibeGQLcb1Y+hinQV9HrYT9TxNSqEXb32PY4ADxY2twnjIlQcRfARb86vrgyjEsY2ab5C2LGApQerv4ndxPtHC+xOA+lvIRx4mXuoXs2m8v1FxfCOGs6/TVCj9pUlLshOA0lq+Nf48zf0cwozS1VfDaKxiySUHgixhm/6r57y9ctzc5hI2UN54a3EqZmuZWddBS+UG8R/51zbD18JNl6RkjPzJlqTzHyY/Z8oilu7R0ICDAxY/6r12I0Cf38Xy7NNSEmo5orVvwM/eNYgKX/NYftCH+VLCoDWVptYjfC4c3pWXi8Vi55la4khnLqgaNG/I6WhOjaHIZrsn7D7j6dK+52/FmE0z8WzDpXSl8E/gdtu3R66ymfqkexlX90DCbc3AQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR04MB5151.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(66476007)(186003)(6666004)(44832011)(52116002)(6486002)(5660300002)(66556008)(6512007)(6506007)(4326008)(7416002)(2616005)(8936002)(8676002)(1076003)(2906002)(66946007)(83380400001)(508600001)(86362001)(316002)(66574015)(38100700002)(54906003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bzRnbTVic3FkSHZ5Y096dDRsa3BUeWcyODA0Y2VpZVE2SEJFL0FOUUZwVHlm?=
 =?utf-8?B?UGJyNTE5UVJ4NDlwNTNwajNvN2FpVGtabWVhaENlUXVzejNTSUpzalFVS3ZP?=
 =?utf-8?B?Q1lyVmtsVElNSW5zUlhJYlUrbExLL3Vmd2JEY1A4Mkl4dGlGZUN5emhVRE9P?=
 =?utf-8?B?bFJHNCtpeHhESmFvem8ycnlSS2cwc2dKNFNEdk1WNnh3cTFMSGNkeWdUOVZw?=
 =?utf-8?B?RGd4ci9odTVSejFXODhUdGRLSTdQZHN0TmNCR2J1Z1JMWEE3NXpRNjdCemFJ?=
 =?utf-8?B?U3FMbVFFMjZBZ213Y2RJZTRWUi9kTDZmM0FKNWFlaDU5QjNjd0dub1daYXNU?=
 =?utf-8?B?SVhBU0dwVWdNeFl3eDJJM2d1TFc5MzB4bzNZRzNVbEdmTlZSakJEeFRsSmVT?=
 =?utf-8?B?dTdDaTRrN0VjTm1Pa3NXdUppMnhmdDcybmhESG9ScWdrd2EwNFhjYTZ0ak1i?=
 =?utf-8?B?TTBSckUvaHNuT2JuYWRMTlp4QkZsaCtWWTNkQko1WWlUamd0K2xKYm1QU3BT?=
 =?utf-8?B?ZUE3cDdHRitYSElXVU9LR3ZsbzZPb05uUWhHMnZqemVJWHI1WGVTczgraU9h?=
 =?utf-8?B?c2pVam1UbEVQVE1uMVl6azhab1RZQjEySWM5bTg3SmtTVG82OHZSWFVObmp3?=
 =?utf-8?B?aEh5T2doY1RKb2tHaVhsT3QrY3lZZ0J0VGhNMkFGM2FkRDNTeXRzU09sUW5C?=
 =?utf-8?B?M2FJbWpEVG5sV0pUN0RTSHlOVDBEcmw0RlV0Q0hpN3RMaHA1MWNHYTcwSFZE?=
 =?utf-8?B?K3MxdHF0UThENW81T3dBcXoyQUtQWnRveWZnYVNyUWxzc2RibE80eUFYMzJr?=
 =?utf-8?B?eGFSR1pZVTJkUExDbnBlVlBMcnNiUjZFTXhXdFNzZDR0QWJvTGV3SFZwdjlO?=
 =?utf-8?B?am1vL1N1aUtGNDF6RmNOOXpYNFFRQTFJQzVmdUpTL3NLd25MaUlmQnNxbkFj?=
 =?utf-8?B?Q3BCZzlXTStrOEdDcXpuQ3NCUXdsOUEwWkJ0V3Jzb0I5SEYwQk1EcHB1eE9H?=
 =?utf-8?B?d3RpV0hrL04rQUdtbkZzQm9sdlpRZm9odmdDQ1pVQ1lpMDBpSnB0cTRFdjVN?=
 =?utf-8?B?Ui80VWs1RVRiVi9FZ0V0S0pUdnNGM3J2WW1GRFZHRzJZTHMvbkcwOHAvTkZ1?=
 =?utf-8?B?YXlSUFViVVgvRXBoWnBWdVhYNmVrYlJrY1kzdmhCaiszcE8wWC82cXkvdDYr?=
 =?utf-8?B?OTR0d1AxZWVOckpGbUt2M0E0ZGx5Z0l3TnozbThKYzQzZVNMNEc5Q1Z2QVlY?=
 =?utf-8?B?a2l0cnczYVUwUU1OTE9mWW1QaXI3Ri8xYW5yUnVQZTFPeEFzMlhSaWlxMjky?=
 =?utf-8?B?dUM2dEh3cXkraFFkMzNCZ3J4aEU5RVpXdVFpRzRwTmhiY3d0c1hVWlRsYlY4?=
 =?utf-8?B?WjFHbEV0R245OC8vcGV2MWFNb0VmSUp3NWNtaXRNL2krUjdONVlmYXZ4aTl1?=
 =?utf-8?B?V3ZCR3EzS2VORURwU29OYktVS2V3ZVgwc085MDZXZWFKWUJrYVgzNktZd2tn?=
 =?utf-8?B?UkRLNEZ4dmR1cjZLMnJqeUxUK3hKeXFuSmtKZmtQY0h6S0REVFRGRE80Y0Ju?=
 =?utf-8?B?VXJiSDl3TWJVT1c0cFhOd3ZqcUJLMWVZQnJ6S3Y1ZmxQMTJncHlWS0RJTm13?=
 =?utf-8?B?ZFJrc2JwWTFORmVTMDZWaE5OYUVYblNKZ1hNT1l2VmRzdGNBaEFvcG9ZZE1t?=
 =?utf-8?B?aXZUTXdldm80N1BkcUIraElSZ010a1kzUmprcHRPOXdZUnlRcERmV2VRdmFy?=
 =?utf-8?B?U3JtMkc5UkcrOCszUUxVZThEaVZuNm1LMHYxeTRoTmRZWGdveHZqNmFac1lI?=
 =?utf-8?B?Mk11d3FxNWVPaHcrY0tWc1lhNkFZQm1PSXRtaVR3TGJxc3Nkakd4aEFHTnpv?=
 =?utf-8?B?MTBGd0gxNmVYSldBcUFJMDlrWW9TL3Y1TzI0V1FpNnRJc2QxN1hESDF5WFpw?=
 =?utf-8?B?dFJFek85SmpyT0NsTUN4M0ptTXZGYlZaOStmc2VDTXZONWVxazNLTlJuZkQ0?=
 =?utf-8?B?UTJZWWJYbjBqSFE0MTU0VDJMc3ovVGN6RGo2NmpMTEU5V0tpRFpjL21YbU1n?=
 =?utf-8?B?UWJ0ZzQvRjlMaGJMQ1dXeXFwOUtValJWeVNvVXQ0dS83L1VJWHJuYnowWGtV?=
 =?utf-8?B?UStFMTRPQTVhUWZ0dGUvQU8vaW1remVUanFXV0hHZ21oMUk4dm1oQTQ3aHYw?=
 =?utf-8?B?NVVyWkhBNjJqVmRhbG5wWUJOSktoMy9kaWQwRDdyV2dhNkRZTFQxZmwyVVl2?=
 =?utf-8?Q?FYs4+ZwNgWH7BQLibb9imfsWGxbB9dH6DQqbs+uSQw=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b8b9eb4c-1b1f-4333-472d-08d9a9ae08ae
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5151.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Nov 2021 09:38:38.7157 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yzK7xyQJKh9h9b1U+sKJMGWSuqA/OKkO9CExvWJNvU10hT8xk0AmBt4/aoE1TjqG2Eu8tNXpRRn7LWH0aCXYxQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB3039
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211117_013844_087979_E8D6F2DE 
X-CRM114-Status: GOOD (  12.88  )
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

RnJvbTogWUMgSHVuZyA8eWMuaHVuZ0BtZWRpYXRlay5jb20+CgpBZGQgU09GIGRldmljZSBhbmQg
RFQgZGVzY3JpcHRvciBmb3IgTWVkaWF0ZWsgbXQ4MTk1IHBsYXRmb3JtLgoKU2lnbmVkLW9mZi1i
eTogWUMgSHVuZyA8eWMuaHVuZ0BtZWRpYXRlay5jb20+ClJldmlld2VkLWJ5OiBQw6l0ZXIgVWpm
YWx1c2kgPHBldGVyLnVqZmFsdXNpQGxpbnV4LmludGVsLmNvbT4KUmV2aWV3ZWQtYnk6IFBpZXJy
ZS1Mb3VpcyBCb3NzYXJ0IDxwaWVycmUtbG91aXMuYm9zc2FydEBsaW51eC5pbnRlbC5jb20+ClJl
dmlld2VkLWJ5OiBSYW5qYW5pIFNyaWRoYXJhbiA8cmFuamFuaS5zcmlkaGFyYW5AbGludXguaW50
ZWwuY29tPgpSZXZpZXdlZC1ieTogS2FpIFZlaG1hbmVuIDxrYWkudmVobWFuZW5AbGludXguaW50
ZWwuY29tPgpSZXZpZXdlZC1ieTogR3Vlbm5hZGkgTGlha2hvdmV0c2tpIDxndWVubmFkaS5saWFr
aG92ZXRza2lAbGludXguaW50ZWwuY29tPgpSZXZpZXdlZC1ieTogRGFuaWVsIEJhbHV0YSA8ZGFu
aWVsLmJhbHV0YUBueHAuY29tPgpTaWduZWQtb2ZmLWJ5OiBEYW5pZWwgQmFsdXRhIDxkYW5pZWwu
YmFsdXRhQG54cC5jb20+Ci0tLQogc291bmQvc29jL3NvZi9LY29uZmlnICAgICAgfCAgMiArLQog
c291bmQvc29jL3NvZi9zb2Ytb2YtZGV2LmMgfCAxMyArKysrKysrKysrKysrCiAyIGZpbGVzIGNo
YW5nZWQsIDE0IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9zb3Vu
ZC9zb2Mvc29mL0tjb25maWcgYi9zb3VuZC9zb2Mvc29mL0tjb25maWcKaW5kZXggNDFmOTdjNmNi
NGMxLi45Nzc4MzVmOWI5ODcgMTAwNjQ0Ci0tLSBhL3NvdW5kL3NvYy9zb2YvS2NvbmZpZworKysg
Yi9zb3VuZC9zb2Mvc29mL0tjb25maWcKQEAgLTQzLDcgKzQzLDcgQEAgY29uZmlnIFNORF9TT0Nf
U09GX09GCiAJc2VsZWN0IFNORF9TT0NfU09GCiAJaGVscAogCSAgVGhpcyBhZGRzIHN1cHBvcnQg
Zm9yIERldmljZSBUcmVlIGVudW1lcmF0aW9uLiBUaGlzIG9wdGlvbiBpcwotCSAgcmVxdWlyZWQg
dG8gZW5hYmxlIGkuTVg4IGRldmljZXMuCisJICByZXF1aXJlZCB0byBlbmFibGUgaS5NWDggb3Ig
TWVkaWF0ZWsgZGV2aWNlcy4KIAkgIFNheSBZIGlmIHlvdSBuZWVkIHRoaXMgb3B0aW9uLiBJZiB1
bnN1cmUgc2VsZWN0ICJOIi4KIAogY29uZmlnIFNORF9TT0NfU09GX0NPTVBSRVNTCmRpZmYgLS1n
aXQgYS9zb3VuZC9zb2Mvc29mL3NvZi1vZi1kZXYuYyBiL3NvdW5kL3NvYy9zb2Yvc29mLW9mLWRl
di5jCmluZGV4IDg4NTQzMGE0MjIyNi4uNDEyY2JiODI0Yjg0IDEwMDY0NAotLS0gYS9zb3VuZC9z
b2Mvc29mL3NvZi1vZi1kZXYuYworKysgYi9zb3VuZC9zb2Mvc29mL3NvZi1vZi1kZXYuYwpAQCAt
MTMsNiArMTMsNyBAQAogCiAjaW5jbHVkZSAib3BzLmgiCiAjaW5jbHVkZSAiaW14L2lteC1vcHMu
aCIKKyNpbmNsdWRlICJtZWRpYXRlay9tZWRpYXRlay1vcHMuaCIKIAogc3RhdGljIGNoYXIgKmZ3
X3BhdGg7CiBtb2R1bGVfcGFyYW0oZndfcGF0aCwgY2hhcnAsIDA0NDQpOwpAQCAtNTAsNiArNTEs
MTUgQEAgc3RhdGljIHN0cnVjdCBzb2ZfZGV2X2Rlc2Mgc29mX29mX2lteDhtcF9kZXNjID0gewog
CS5vcHMgPSAmc29mX2lteDhtX29wcywKIH07CiAjZW5kaWYKKyNpZiBJU19FTkFCTEVEKENPTkZJ
R19TTkRfU09DX1NPRl9NVDgxOTUpCitzdGF0aWMgY29uc3Qgc3RydWN0IHNvZl9kZXZfZGVzYyBz
b2Zfb2ZfbXQ4MTk1X2Rlc2MgPSB7CisJLmRlZmF1bHRfZndfcGF0aCA9ICJtZWRpYXRlay9zb2Yi
LAorCS5kZWZhdWx0X3RwbGdfcGF0aCA9ICJtZWRpYXRlay9zb2YtdHBsZyIsCisJLmRlZmF1bHRf
ZndfZmlsZW5hbWUgPSAic29mLW10ODE5NS5yaSIsCisJLm5vY29kZWNfdHBsZ19maWxlbmFtZSA9
ICJzb2YtbXQ4MTk1LW5vY29kZWMudHBsZyIsCisJLm9wcyA9ICZzb2ZfbXQ4MTk1X29wcywKK307
CisjZW5kaWYKIAogc3RhdGljIGNvbnN0IHN0cnVjdCBkZXZfcG1fb3BzIHNvZl9vZl9wbSA9IHsK
IAkucHJlcGFyZSA9IHNuZF9zb2ZfcHJlcGFyZSwKQEAgLTEzMCw2ICsxNDAsOSBAQCBzdGF0aWMg
Y29uc3Qgc3RydWN0IG9mX2RldmljZV9pZCBzb2Zfb2ZfaWRzW10gPSB7CiAjZW5kaWYKICNpZiBJ
U19FTkFCTEVEKENPTkZJR19TTkRfU09DX1NPRl9JTVg4TSkKIAl7IC5jb21wYXRpYmxlID0gImZz
bCxpbXg4bXAtZHNwIiwgLmRhdGEgPSAmc29mX29mX2lteDhtcF9kZXNjfSwKKyNlbmRpZgorI2lm
IElTX0VOQUJMRUQoQ09ORklHX1NORF9TT0NfU09GX01UODE5NSkKKwl7IC5jb21wYXRpYmxlID0g
Im1lZGlhdGVrLG10ODE5NS1kc3AiLCAuZGF0YSA9ICZzb2Zfb2ZfbXQ4MTk1X2Rlc2N9LAogI2Vu
ZGlmCiAJeyB9CiB9OwotLSAKMi4yNy4wCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KTGludXgtbWVkaWF0ZWsgbWFpbGluZyBsaXN0CkxpbnV4LW1lZGlh
dGVrQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1h
bi9saXN0aW5mby9saW51eC1tZWRpYXRlawo=
