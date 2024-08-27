Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2DBDCC5320E
	for <linux-mediatek@archiver.kernel.org>; Tue, 27 Aug 2024 07:42:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DRg08mbyMKNWqwz9M3WI6sAHJsF9WQNP3r2q+QHvS6I=; b=b9l+uLFnx/DNSe3GZGacMFzeVN
	Mq4FOPvszgWqrjOgslpuap4eetKZIf4tdoMcRVKnQbSQkQqCrDlZTQmGcucTU5IP4wVSgnGjEsrNN
	BMRUbTHlpp3ERu+3qPMHJ2Ur/+pSvhhc+WApneSd3yI5hiRYw11YOO/njJYlNywpcmKDLo0jWsnA9
	eiIdd1tC6mYDKaFhd5GM5zyI11jyQJq6Ig+Ve3Ga4EzAtpnktmmapqlIZ0PTu2tM2MBLX6KMnp9RU
	ACuZxhV8CJw3QqYVHQRVa1qY9oowVSqqHEwv70vWMOtXffESPquIj/2awyxUcB1I8TVDLY8Zb+X8N
	9OssCKuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1siqql-0000000AGNd-2TAL;
	Tue, 27 Aug 2024 07:42:47 +0000
Received: from mail-vi1eur05on20703.outbound.protection.outlook.com ([2a01:111:f403:2613::703] helo=EUR05-VI1-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1siqmi-0000000AFXC-2bHi;
	Tue, 27 Aug 2024 07:38:38 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cFbIdrkkUp67XfypHQRFB5ZiGtKrPw9TIygUxDdo6DoM3nDICcSRkOjvYtVn3lSPNzj5l1iaU4yXP7aU2aQD/uUdiVEvMKU9GNxygcNMfmz8E/rYMzvgOw65DeDKGT//DolROYEhRU/JZKE4yig45bVvfbPASxARx7qVyFEG+Y9nTq4BvcR3jN8Zq6HnQJEia5qf/rXWGKnEXz8GWhhPGFHx3i8s9mRjcCD8rOUhz6TGXQ7ElLir785u/phkn15F9R0DpjanITv37JVe6T1dLjkrkvOnh3N7atwk2CXpCuzUGGdhrPu8Jww2wIencU96pQDQSOl9L+ATdcNb1ik7Ow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DRg08mbyMKNWqwz9M3WI6sAHJsF9WQNP3r2q+QHvS6I=;
 b=CC6rqZX5O3hKrmhkdr9252yqApV8/wuZGko3FdIQ1cjJlKi8NufcX1pxMZ+IGGjbBLcfQLddShTn+yGqDr/Ku3LzSPj/AZJ1+vh5BqqJ7z5ZASlAiJC5vK1Wp0ZiLm1M7BiRpPmOWDyPV2peHZcJMlGcr/L+GT5QwxhIZI7CHv27gzCUjvstzYuzbYL4TO+3Ihz102/1FCuyFDoqHc8ScIiaaZkybJbFs/+sf6T3tUwSugb5U63VTGmnH5FB1sEfqIduB8e2Z332Upjrpav2sEtRxzogsmz4SHODWNHYDjx5b42rJ28u6itRvEvXuBTJ4Q+U00TfL5TQ/21vrqBfeg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=genexis.eu; dmarc=pass action=none header.from=genexis.eu;
 dkim=pass header.d=genexis.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=genexis.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DRg08mbyMKNWqwz9M3WI6sAHJsF9WQNP3r2q+QHvS6I=;
 b=BqY+cBBzbqEfhKC7O5/RSsEbozeNU3lLB4qlm8q425lp/MrGi1PpFIl5DM3aS8r1WJ/DIc6enonLGZa8HnG4418NeayExkR1qP7qV6SoK22TEv6MwEsCQ9cICGbys4aibzCDY1buE/werCoeKPIs9nzxtKlXrXBnDpy5c6x4JIw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=genexis.eu;
Received: from AM9PR08MB6034.eurprd08.prod.outlook.com (2603:10a6:20b:2db::18)
 by GVXPR08MB7797.eurprd08.prod.outlook.com (2603:10a6:150:5::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.14; Tue, 27 Aug
 2024 07:38:27 +0000
Received: from AM9PR08MB6034.eurprd08.prod.outlook.com
 ([fe80::9ead:b6bc:10eb:ef35]) by AM9PR08MB6034.eurprd08.prod.outlook.com
 ([fe80::9ead:b6bc:10eb:ef35%5]) with mapi id 15.20.7918.012; Tue, 27 Aug 2024
 07:38:27 +0000
Message-ID: <762294f5-73e8-4c48-b740-a163f15562f5@genexis.eu>
Date: Tue, 27 Aug 2024 09:38:24 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] dt-bindings: pinctrl: airoha: Add EN7581 pinctrl
 controller
To: Conor Dooley <conor@kernel.org>, Lorenzo Bianconi <lorenzo@kernel.org>
Cc: Christian Marangi <ansuelsmth@gmail.com>,
 Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Sean Wang <sean.wang@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 linux-mediatek@lists.infradead.org, linux-gpio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 upstream@airoha.com
References: <20240822-en7581-pinctrl-v2-0-ba1559173a7f@kernel.org>
 <20240822-en7581-pinctrl-v2-1-ba1559173a7f@kernel.org>
 <20240822-taste-deceptive-03d0ad56ae2e@spud>
 <aef3188d-5aaf-4f6d-addf-60066065ef9b@genexis.eu>
 <20240823-darkened-cartload-d2621f33eab8@spud>
 <66c8c50f.050a0220.d7871.f209@mx.google.com> <Zsj8bmBJhfUdH6qT@lore-desk>
 <20240826-kinsman-crunching-e3b75297088c@spud>
Content-Language: en-US
From: Benjamin Larsson <benjamin.larsson@genexis.eu>
In-Reply-To: <20240826-kinsman-crunching-e3b75297088c@spud>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: GV3PEPF00002BA7.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:144:1:0:6:0:19) To AM9PR08MB6034.eurprd08.prod.outlook.com
 (2603:10a6:20b:2db::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9PR08MB6034:EE_|GVXPR08MB7797:EE_
X-MS-Office365-Filtering-Correlation-Id: b853f8a3-993b-49f5-e4e0-08dcc66b3ce1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7416014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?eUR2dEhFY3dwbGFFdFZUN2MraWwzN1pkTUZyeDhPVENsQWVsZWYveHQ3V0d2?=
 =?utf-8?B?cGpLK1hNeFdQU2hOZjFQdmtYaU03Ri91SUw3L05iMHJCM1ZhQTkxSUhUdnF3?=
 =?utf-8?B?ejF0bHBLWE9sQ2lvN3VWb0tjWGxUdjFxVzNJemJROHVPTTZRZ0lHUGJlWXpO?=
 =?utf-8?B?QURIeVpIWm5ScWdSR1dkeGcyL2RpQkxvQU8rb3RZVURjOEVxMUd6b21BM05J?=
 =?utf-8?B?cnJ6dVBjZ1hqSnVpUm5hRWo5WXg2dTJTMnZEUlM5MnJOR0w2MllmMUhFbXBX?=
 =?utf-8?B?U1E0QXFXT3dUTGhMRUNsbEhLTkdqb3BnUXltK3N4RGNMcFYwRzJSTkNjL2pN?=
 =?utf-8?B?aWpGckFaaFBVM1JqbEFJcHF4TkdxNzYySlZ0M0pWeWhGekRMSHNwWFNvTXp6?=
 =?utf-8?B?dDQ2SnM3SlVBREltWXc1NzNXeGVhZkFNQmJuRmYwUG8xNFFMbmdqSlI5VnZF?=
 =?utf-8?B?VzRFVEpFS0Fja3MxT1ZhdHZhQTliVm55SVR0QU9kdkpIcjZ5MU41NFM4bXFN?=
 =?utf-8?B?a2JWbVNWaTVvSTNmVTZsZVhGYWdJZ2FZV1Vtblllb0FHQm9NWmdabFZ1U05x?=
 =?utf-8?B?V3ZQQ1cxalNEN1hHaXdhN3JuckF0R0lMeEhseW1VUFJrN2RzbnB2RnFTc1lZ?=
 =?utf-8?B?YTBjZm9vZG1weS9hUEVLM3UzM1NDTld6SEFtQWFVcWZ6VTFHOTlONlJtblk5?=
 =?utf-8?B?MzBRUFdhZWxGSURnZzlkT1FaWFFtYTA5TnZPVEdJWFpUQjlSblpscE53Ly9i?=
 =?utf-8?B?VDVmSHA1KytqTU1OeHgydk5ROFlnMEVxVjRDSm44Zy9yYXZudHpsSEtVKytB?=
 =?utf-8?B?cEwzbGVMc1J0UVg2RHFwbXBBWXF4S1cwUnl6ZjZrQlBNMnhaNnhHNzE1anBC?=
 =?utf-8?B?SFFZRkhJdWEyVWRISENDZTB4aHVoZlpjMkhkMjhMa3Y0M2dBR2MybTVqVnRP?=
 =?utf-8?B?N3VwRFZjYm5jZi9sdEl0eGNSYk1VbjgyaktFU2locmR1QytZV1hHRlJPanBo?=
 =?utf-8?B?N3lmM0JTQmgwb1o4TWNrekQ4d2JmR0tWRWd4TVZjekQ3WFF5eUpERmo4NGIy?=
 =?utf-8?B?V3pJQm9NU21YWUcyZ0prY0U2V1V6VU83eGdxdEdjM3pCdFFmK2pIS1ZZTlBz?=
 =?utf-8?B?NHo0OHNEcDhWV3RsQlYzazNMdXdVVnB4aDJlMnBVVDZDeHpWZ1FVVzZmOUxs?=
 =?utf-8?B?TnJqUWR3VGpmU1F4SzZZdlFZKzE2NFZOTm8xMjdrMU5qQUo2WGZweTF6QWpu?=
 =?utf-8?B?c3FJTUdLR1BZSWNZN2FwWEJUc3JwU3RBQlNxc3hYMXRpWHFyTTNpaEZvOE9i?=
 =?utf-8?B?TjBkNFh6eG9idU1xY2JTS201VllqSktqWEhlcytNdDJjK0d1alJmTUFlNkRK?=
 =?utf-8?B?TUZWaGY1c1ZJNHg4TXNSNDBMdExDaTY1Kzc1L2JCS001UndCY2RRL3dDKzhi?=
 =?utf-8?B?Q1F4UjQwRlJ1bFBwNGJqTGpRSjBLdGFyWjZBMFJSYlEva0pqVXFvcXRXa1RQ?=
 =?utf-8?B?VExEYTlGdHFCSnNzUDRoVUJBSnpkSWFsUURiR1BxZ0IwQkxTZ1JOVlR1bVh6?=
 =?utf-8?B?RGkxZ09FV2FqTHd2TmNZYk5KSDZOSXB4dFFJS3pDcXg0c1JyYUdkMFBCbVk0?=
 =?utf-8?B?bFEyNExmUnhJT1NOTHpiU1dBdEFkQTZUcFQ2eTh6YzMyYm9nSzIzb3U4WXQ1?=
 =?utf-8?B?cEJhUHNRWDM4aUZJVXY0Z1hyTDdVeXVoTEozNXB6WG5Jb0N5UGg1VjIwcHRS?=
 =?utf-8?Q?x+jdO+h2w5fn0u9xcg=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR08MB6034.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bmM0dXd3QUlJMVBBeXVXU203bnh5T0pUKzZaTHFwOXEvSDBFLzh6dk9mSzhq?=
 =?utf-8?B?SnNUeDFmdkpMM2YyaWsvVlltdG9jZ21CTGNxRHh5dzVlQUN6N3R1NUMwd1I5?=
 =?utf-8?B?Y2pOUnlMLzJzVE9SODF4T3dkeERnemo1SkRvWmw3bWJpTHRBajhxcCt2NExy?=
 =?utf-8?B?RElmLzRkcVYvUy9GZ1RKZXI3T2tJb09WV0JTVkRCV0dBc0tDSU5Qcm5td3pl?=
 =?utf-8?B?NHh1TFhFeVBPcStYQ0xROE1idWZsb2Q2OFVBSnBlMC9lRTVEbXFSNDlEaFpE?=
 =?utf-8?B?M1NNUlJhOGF1dThHSG16TUExRGtZSXBiR3hNbUF5U2J6L0VMRnRNaGt5eWUv?=
 =?utf-8?B?blFWOTdxa3pYcktpa2JEQU5lY0JlRlU3aDREb2tTMTIvQ1oxdDNNcmRMa0sx?=
 =?utf-8?B?TXVDYUc1aDNBS2lwTnphSW5venBUR2xwLzdrNlh2alF6d204UWx1OHk4bzRM?=
 =?utf-8?B?dkhpTTUyZlhIRzVKa1R5WkpXb2t0cytJNWcwSld0OUtza0FMT25ONk13d2cx?=
 =?utf-8?B?TzRlOTIyZksydnRJanVYTzdEeUYyTmJ4ekNOVEVPRW13WWJDRVRnS091Nmtn?=
 =?utf-8?B?QmFBb1ZQeEJOVGlhemJZeU5zRFA4QldiS2hrUXNCeXJDeEYxVDZwZ0w1MVhp?=
 =?utf-8?B?aHZzNTVTRGFSYy81c1JzWG4zaFFyM3F1NXBIbGcvZmk2OHYveVJmSlU1WDBz?=
 =?utf-8?B?Q0dkb1E5TjQ5dmNzeW56cXV0eWN1MnlmYWNPZ0grWG5JMGV5U2xrc1ROMHpj?=
 =?utf-8?B?WXE5S0pwOU5SZnRtZVhoYmMvcDEzY3dubEEyNHdjN2JOMFhOR2Y3bU81WkFD?=
 =?utf-8?B?bm1zRFhPUVBoZjcrY3ZMR0hGdFVZWHluUTlPRk5UbEpiWjI5L1c3TFM5OW9T?=
 =?utf-8?B?eXlhOURwbFZrMHdCUy9zVlRHdXhKQUdNLy9nL0ROZll0UjRkZjd1UGVNVzdG?=
 =?utf-8?B?cWtqMjBpMFZQZlFOVTR5dVozZ29YVVpiZWtIaWVSaUwxUVBzT2U4UkIvOFM5?=
 =?utf-8?B?K2l4anlWa0E0UDcyVGY1VXNhWC80enNKemQxR3BhNm1nOFVlNGU1VXV1Zkdq?=
 =?utf-8?B?dVNZMjdTRWlqZXNYU1B0dm1pbWJBeGJhVUJGVkZ0aHdmbElLNFBOQjQxeVBt?=
 =?utf-8?B?dVVTRUQ4UXhmS2F1VlVndVdnRWEvS0M2ejV1UHI4LzF4ZVFBbGM3UnVyOG9K?=
 =?utf-8?B?UnVRK0IzUVIvZE5zV0JYbk9hV2UwbmpUOGp3Q1dOQVdYbTJqUk1RMS9YR0kz?=
 =?utf-8?B?Q1JkK1ZnS3c5aytiVHo1ZFpBcmptR2ZSTGJGUENBS1JsSXhtVnlLQXAvYzZh?=
 =?utf-8?B?bnZERitkQWt0Z1k0QmNKV24rU2prdFlKYkt5L21NSU5EbUd0V1V3b3hyWXlQ?=
 =?utf-8?B?NytqbFNpckI2THRuQmpRN2FtQ0RjWDNIRlA0ZlZHMGNRS0ltNGJuOHRGcjg4?=
 =?utf-8?B?cXJVdEI1M09nbGNrNGlYZ0FPWW8rZlZnMEVwNDZBYUlnZzdNeEtieEpWaGk5?=
 =?utf-8?B?U0t0bTcxdUhVUWdzekxIY2hoZ3ltT3UwWnp2K3lCTXYzcExjOWJtbjA4NmY1?=
 =?utf-8?B?OTFBSWlsTjZpMVNQWGxYbUc2cEZ5dnJtOHpnYkp4TGdhZWF6QTJoSURoeEIx?=
 =?utf-8?B?dUxxVGhUaGhweEUxT3BBaGEvbDBsL2VnQ2VGTS8xSkI3d2dMZG5Uc1dtRW9Y?=
 =?utf-8?B?bklHSng2QXlFenovK3ZJR1N5U0RiSUhaVW9ra2h3VjIydmxLd1RKSmVySHN2?=
 =?utf-8?B?dzExK3J5OFJLOTIxRmJ0WXE5a2dyK1RaaExTOVJTUDVwYm5OTjB0OEFvbEo0?=
 =?utf-8?B?QzlIa1RId2luSWV0a0ZNSnJWM2o2MWdlWklLdW9ySzNlMzE3b0pNUmd0QVRD?=
 =?utf-8?B?azN5L2V0aE1RZm1sVkI1aDVybG5KYit3UG1rNUZuMmRZcU1rd1p4aGNvMXFC?=
 =?utf-8?B?akhwWFM2VDBZbGJLWHhvKzJYZm1aREVMMk8vaHMrbWpSTUg1eFJGN29iNXA4?=
 =?utf-8?B?SkxhakFYVk1FWnAwbHVVeVFRcTZxdGpxYWtPejJCUGdxTjl6a25Ca2g3Nmla?=
 =?utf-8?B?S1NUZUNQc3d4VTZhbGJncnlnWE5EUkRzYXFhQU44a0xTam4vSnpubHl1dnNl?=
 =?utf-8?B?bi9rd3FKTDhmQlVaSzB6ZTZHbm8vQXZ0SDZ3MjU4dllEOHhjLzlrcm5IemEy?=
 =?utf-8?B?cHc9PQ==?=
X-OriginatorOrg: genexis.eu
X-MS-Exchange-CrossTenant-Network-Message-Id: b853f8a3-993b-49f5-e4e0-08dcc66b3ce1
X-MS-Exchange-CrossTenant-AuthSource: AM9PR08MB6034.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Aug 2024 07:38:27.2348
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8d891be1-7bce-4216-9a99-bee9de02ba58
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HSepTR1VcQoL1bh9I5wMlaEvCQgW8+niOk2grddDzY4BHW2IyR8DtIGqgmQa9SLCCytDnh0low0ysgPKKdXZfsv2uuu0d5IIq+FytbHmlNY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR08MB7797
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240827_003837_001428_D4F49E04 
X-CRM114-Status: GOOD (  15.48  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi.

On 26/08/2024 19:07, Conor Dooley wrote:
> To clarify the hw architecture we are discussing about 3 memory regions:
>> - chip_scu: <0x1fa20000 0x384>
>> - scu: <0x1fb00020 0x94c>
>                    ^
> I'm highly suspicious of a register region that begins at 0x20. What is
> at 0x1fb00000?

Unknown, no documentation of those registers.


>
>> - gpio: <0x1fbf0200 0xbc>
> Do you have a link to the register map documentation for this hardware?

There is no public documentation, what is available is the current 
driver source and this (less useful) partial map here:

https://github.com/gchmiel/en7512_kernel5/blob/master/linux-5-new/arch/mips/include/asm/tc3162/tc3162.h#L860

Registers with FMAP and FLAP are parts of the PWM functionality.

>
>> The memory regions above are used by the following IC blocks:
>> - clock: chip_scu and scu
> What is the differentiation between these two different regions? Do they
> provide different clocks? Are registers from both of them required in
> order to provide particular clocks?

chip-scu contains the registers the clock driver handles. But scu has 
registers with the word clock in the description but both regions does 
not seem to be needed for a specific clock.

chip-scu contains pinctrl, iomux and clocks

scu contains random bits and functional muxes for serdes

>
>> - pinctrl (io-muxing/gpio_chip/irq_chip): chip_scu and gpio
> Ditto here. Are these actually two different sets of iomuxes, or are
> registers from both required to mux a particular pin?

io-muxes for pins are done in chip-scu, pwm muxing is done in the gpio 
register range together with chip-scu (ensure there are no conflicts).

MvH

Benjamin Larsson


