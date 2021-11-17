Return-Path: <SRS0=BaWb=QE=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 32F36C433FE
	for <linux-mediatek@archiver.kernel.org>; Wed, 17 Nov 2021 09:39:53 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EC9C260C4A
	for <linux-mediatek@archiver.kernel.org>; Wed, 17 Nov 2021 09:39:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org EC9C260C4A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qR9JDSsAnh7lBezsg7bKtIlN7kUH1AU4iHDcOXgHIrc=; b=3s32Pv2oif1BX+
	ovujxM5MDe+nwLr5wDX5sfcX+9fRsUkl1peBOiXr07lNalKFEIpSXo8e+DzVCWCgg4WZa9F/DoouV
	SdX2PgWigZUtMhMF27AbD8lF67vm/debkL3UoclIvO2P+bL+0cKPHtyWhK7s0obVGU2b4znGeDNVr
	JeQre+G4q7XoB1/V1xM+5GZCgWy0cCrGfhFv1dHkq1OKfE3BgrS5HRM5E5EFU/F+ibvzqHFrolBHd
	b9j3ir5JccoBnOL1g6lycTbfAZRXX2QzXluAs/1xscCSyEWs0UhRxJ5t1cZq29bs3J3qXkor/UZN7
	wrwbzmvk26RVEQ3TdWSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mnHPq-004Ji5-HA; Wed, 17 Nov 2021 09:39:42 +0000
Received: from mail-vi1eur05on2072.outbound.protection.outlook.com
 ([40.107.21.72] helo=EUR05-VI1-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mnHOs-004IyU-Te
 for linux-mediatek@lists.infradead.org; Wed, 17 Nov 2021 09:38:44 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IATM/a3SxjyiPOC4YS0ydwfPxklZmvXxEq8I5Ww3oZlFOtF9XjFI2p+FK4fsunF+gILp7/phAaEeKAeVQe3QWMghDok9A7p9aGScRq9O9VvygK6GCPzkeKMboh69mBtimlF6cnQrf1ffl6C65ESrfT/Lt0HURpIXf/AmPN7ILViJc6TXfsxYjLOyvxyObPhynjANWxvyAavNKd1RwD6FFS5zCsE56d090bVWi07IinIy9csIxwZMLrnHL92MX/3OTvPgxPMPLgdkJDkk2ZjXjeej2+2mi6LJZFuoXvd8AmcnZ7VRgMwlatsdWyFIXGqRtP7ynMMsdSIl3aiohKJjDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9AVYMsqdqT5aML5ASjU1X5aJtq7rcirF8wH6DONBBzQ=;
 b=JmDNoEryvPFZAs5wXjT5Febf9C9B4kUgm16h+nEdP8RY3H3nJZ1QJmQxqP28Vxa2RrYUBSPORujZx4C4qyAWdq9YkAA7U2h2nriS/uESgXBedi+lbOYEYdQMsWsSRXLZF1/tPRp3EnPD9pO+cC0G2K2FRlaUnBd0dQoecrd5nsEvzs3uznvwN5PaOacOIzFm/J+C3apvFXIx1ELJ61qKNt70+OBVL0AKMZuEa1iM+xNJNDZNtIgg5QObUnpMEdhNIAZESMDfXns+rZPUAvwKzzvdfEAGWijJ4dRQWLEB+1WQMNBhvEzybF9bz8e+xhMVUKm5l06eSv3pVtx9ttOCfw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com; 
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9AVYMsqdqT5aML5ASjU1X5aJtq7rcirF8wH6DONBBzQ=;
 b=IYgNiZdjv6oxwKwjKQXV+xWQqPvUi4d5wW6zT90abbI3QN+iTnGOeJQDvxO4zO1kXo4VrnC9RQPI9ulzgS4p+vhMYUzwa/fSxQDBtYuwViqAjoIyJkKAiNu64BbqC1xHHxnTfYecEZ/sR6fH4ex6byL6WCiHAAGdYVM0mNReNO0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from VI1PR04MB5151.eurprd04.prod.outlook.com (2603:10a6:803:61::28)
 by VE1PR04MB6623.eurprd04.prod.outlook.com (2603:10a6:803:125::29)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.26; Wed, 17 Nov
 2021 09:38:36 +0000
Received: from VI1PR04MB5151.eurprd04.prod.outlook.com
 ([fe80::85af:f8be:aa99:ba5f]) by VI1PR04MB5151.eurprd04.prod.outlook.com
 ([fe80::85af:f8be:aa99:ba5f%3]) with mapi id 15.20.4690.027; Wed, 17 Nov 2021
 09:38:36 +0000
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
Subject: [PATCH 17/21] ASoC: SOF: mediatek: Add fw loader and mt8195 dsp ops
 to load firmware
Date: Wed, 17 Nov 2021 11:37:30 +0200
Message-Id: <20211117093734.17407-18-daniel.baluta@oss.nxp.com>
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
 Transport; Wed, 17 Nov 2021 09:38:34 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 49bc8cf6-098a-4eb1-f4e8-08d9a9ae0775
X-MS-TrafficTypeDiagnostic: VE1PR04MB6623:
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-Microsoft-Antispam-PRVS: <VE1PR04MB66232F469A3B34847B84B5CEB89A9@VE1PR04MB6623.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1332;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 8Zssx2x38gZVAe6zZj6cLZ+a9zFTMRQlInkH3mvO049NZhrK7RgwKE+R7sKIs3NeoxX70TzlupTk6+slgYAVSh3fwYb0Jm2rpm4zOc+RpLR+faj1PPzeU+tFCERPe5t3QISylWZD2IzqiHk/JTbrhIx//DvLo3sMNEtwQhPoafoFgCLAAnIEkRJ0uiKkJc9D9Lj6wRU7bMn1NpBVliOMhI3YPUMaLQkIokrm9iEEp4aT8P+RXvE631FauponxAcxlO2Y+riplRCiJo2FdecMShc29VjNQQ0EQQ4YnDct5L628sFinYOqg7+lMaOPrnIgZWLuFN8AQqzpJF//lVI6WA4rFaurZGEdcehb7ACfEO3WaDPUCkWe1HqH82wKJQSsAWYVGJaT316IEGgnFp+X/DY+xBTXa4DDE5911xEtsdMFIVi+rHjpyYnSC+mixsUYQQPP5K1Lnfa0B/RB/UTsX4g1cs+psgwuiy/FtrEf8aoZf7Tg/3w09mRdgX+IMP5OsctU1HOR5TYS7/OFdOcwJn/2ttzjnLe3wx4stBU9qos8ac3OqdP6OAHpaP8Y8nkrqxatGGPO82pP2N3T8vdRRrE2LekkOv+XITfMNIYhXCFpyo5ITIvuFNM8f9H3aUI2diZBGN81LKcPKsjEc0GRjQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR04MB5151.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(8936002)(1076003)(52116002)(6506007)(5660300002)(54906003)(8676002)(508600001)(186003)(86362001)(6666004)(2616005)(6512007)(7416002)(83380400001)(66574015)(44832011)(66556008)(66476007)(4326008)(66946007)(316002)(38100700002)(6486002)(2906002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YU5GajFvV3dEZGp1M2xYaGt6ZGVFaE0weHM3ejhpVTJmYkxHQW0yY2t6cmtS?=
 =?utf-8?B?OXJ3SjBPVEtGWjQwTmhrVEt3bXB3RjlFUlVWWVo2RzE5WlhCczd3WG1DZ2Fj?=
 =?utf-8?B?dFFWWWFFekZkQ3FZeURRQlU2ZUQvNytESkRwZ3V0MUVDWlIyT1RnRkVZQWZM?=
 =?utf-8?B?S2pkUGlUOU1BQWVsbVZYL0xqSkhiSFBYOGNKLzZLWG9VbHNpaGtER2Z6V0ph?=
 =?utf-8?B?UVBFeEFOZVhEbnpTelNKeDFTM2NDb2hnZG5YK1lsZkpCaVE0eGw5c241d1BE?=
 =?utf-8?B?OUIxNjk4RENHeFBhclJpeW14RWdIckJWSW9oZlo2S2svRkxPbTZNZ255YUNW?=
 =?utf-8?B?SkdRM1pQdVl4ejFlUlFMNkdlaVlwUEN4bDJXcFZNU0dqRW5PNU9nUTZDd1Vn?=
 =?utf-8?B?MFlsU0toMVFjV0I0Y0pheDUwQTJURmRPMzVEcUJxRzhkaDZoa3lDVWwvUGs1?=
 =?utf-8?B?OHF4b2dGenJNaXNFdjI4RHB0S3M0ejV3K2gyUFNjbWd2dVU1eHljdVpTSE85?=
 =?utf-8?B?aFJIOVBMdFNqcnRhTGpBZjlyTDdCdEwwcU1xT3ppRG0yNEdFUk1SQ3ozSktt?=
 =?utf-8?B?WndBRHdaM2ZiQ2NHWmdPNm8relFNVEM0cVUvWnc0cWhPekpYYXRZTkdacld5?=
 =?utf-8?B?cWtMcHBDcENSVlV1d3piWi9nRDBabG02S2NHY1BpSFFMRmhwT005dk9iVzhF?=
 =?utf-8?B?Qm9jZzZUTUJueml5aE5vY0c2VWtQRWFmU3pFbHVoNFlIbXM5akMyVThQcjh4?=
 =?utf-8?B?WjVlbU5Cakt6WGZSb2tFR2duTnVXQ1I2a1FneTBkYlFyOXlEcURhRll1NnBi?=
 =?utf-8?B?NXJNaUJSSmVwWEFpdzdPZndLK09EcCtpZ0FMN3l2MFNSZC9KWHlXUUJEZFA5?=
 =?utf-8?B?REVFWWZWVkRFTXFNYlBmbzBDNW1XcFI4ZUtJTjVTRjhFQWFMdlllL3NuQWQ0?=
 =?utf-8?B?U3RwNFpZYUJ6K1RYSE9lenk5QUZZVG1YNWxZSkFCdTZPU0JoWjZnWitCc1BY?=
 =?utf-8?B?VEFmcmMySk0rbGwyeGFZZDZ2bDJ6V3R6TFd1WnpmV3RSdFpucGZ3NkJjdmdh?=
 =?utf-8?B?Q1NEWlEvNjIwVFJOTzZJUU54VFRLWEYzRmJUWnQ2WTUyNzV1RTlKamlqZFE4?=
 =?utf-8?B?ODR6R05uVW9Wc3B0TmpvQ2NuVmFFTkV5dGpxSlA5Skt2NGk2Y3Y2akhrYUk0?=
 =?utf-8?B?eGJ4SXV4L3FLYWxLYUt2YjhxV2FHczNrZ0p0U1A0NE52d2ZLckxlc1NxRklB?=
 =?utf-8?B?cU1PMHBzZHVlWlFYa1gzSmtkOXVyUTJjUFZaVG9pKytDcXAvemhiQnZoVWE4?=
 =?utf-8?B?ZzhMUHNFS1BGWE9sem5pVlJnVTAxdDNhdkpoUEJpZkVTSmJBa2ZXOFVsT1pU?=
 =?utf-8?B?akg1dEpRSGphOGZ2ZFUwbHhJeEw1d042cSttRVlVWDcwT3QrSm1IaEhSb1BC?=
 =?utf-8?B?NVdtTDZjdmFackNXN2p2b1BvREJWZWRDZUlraE84N0hXSXVFQXpyTkh4S1JW?=
 =?utf-8?B?dlNTdTJ4K0FrTkZJdzhkR1JZakVuTUZBUlpNd1VJZnpwamE3VXI4MFRsWlNT?=
 =?utf-8?B?K1ZoZGp6U1JTUCtJU0lXeEZaWmdPOWo4RDhPbUpza2hlZ0s4OVBKcmY2NVBj?=
 =?utf-8?B?WXZST1NWbDRGbjkyRndxaHhFRWpKdGhoV2pwcExZOGJZWEZrbHBCcTFuM294?=
 =?utf-8?B?ZGhtRHNTdWp1Y29Yc3hDazd1OTFCUDFWZXdtVWtLYmxQY1BPUVB2a3lkMVJo?=
 =?utf-8?B?RjF3ZUxGYXU4TnFqQkxFZ2hOdy9KNWxwUVQxQVhvelF3aWxoeS9SNm9FN3lO?=
 =?utf-8?B?OVh5V3NJR0RtOEVJV1U1UHJaTHRwZlI5ellDbGY0cjZMNnRDd3JKN2lEeEQr?=
 =?utf-8?B?bDBIQUZQS29yTWRGWitsWTVNcHJSR3BKVWF6YWVYYTZNOFM2SGFRNUhOeEYy?=
 =?utf-8?B?dkVXeXR3VkhqenFsMzdDYzNQUGVXMWU3akRTUkVJblZIcy9sMlBXQldkOTFG?=
 =?utf-8?B?K2x3MVlsSHNkYi9VUDNtbkNNVEsvcFJDOXJJVGtjWGNuckNyaXFNalFlSkUr?=
 =?utf-8?B?clUwOWovRDF6RTMwaGNlbzl6V0dJUlcrK1ZoR2NJTTFPMmNNS01yaDhMNjZH?=
 =?utf-8?B?Y2hnL1BzOXp0bzhoZWtpckcwOUg4ZEJIOWxoNkNQeVdBdGVMQ1ZPTkYyRTMz?=
 =?utf-8?B?VVpzUitLUDFhRDVHWkZnRUNEMzVtSGh3Tmx6ME9XV3RKd2pMckI2OFVjcGNE?=
 =?utf-8?Q?V+T/iFTHuA3undb5kXd7XX6d3Ka4X0ba/ArpVYEyHc=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 49bc8cf6-098a-4eb1-f4e8-08d9a9ae0775
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5151.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Nov 2021 09:38:36.6639 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WP9tkuGD0GuMz45ibjLTmWQEoLuRtSN+bp4e8jSdsfEvGtTQBGppIlZ4IehNr+fDEo41S37jZu/i1GR84gijMw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB6623
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211117_013843_024513_201B5C6A 
X-CRM114-Status: GOOD (  17.26  )
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

RnJvbTogWUMgSHVuZyA8eWMuaHVuZ0BtZWRpYXRlay5jb20+CgpBZGQgbXQ4MTk1LWxvYWRlciBt
b2R1bGUgd2l0aCBvcHMgY2FsbGJhY2sgdG8gbG9hZCBhbmQgcnVuIGZpcm13YXJlCm9uIG10ODE5
NSBwbGF0Zm9ybS4KClNpZ25lZC1vZmYtYnk6IFlDIEh1bmcgPHljLmh1bmdAbWVkaWF0ZWsuY29t
PgpSZXZpZXdlZC1ieTogUMOpdGVyIFVqZmFsdXNpIDxwZXRlci51amZhbHVzaUBsaW51eC5pbnRl
bC5jb20+ClJldmlld2VkLWJ5OiBQaWVycmUtTG91aXMgQm9zc2FydCA8cGllcnJlLWxvdWlzLmJv
c3NhcnRAbGludXguaW50ZWwuY29tPgpSZXZpZXdlZC1ieTogUmFuamFuaSBTcmlkaGFyYW4gPHJh
bmphbmkuc3JpZGhhcmFuQGxpbnV4LmludGVsLmNvbT4KUmV2aWV3ZWQtYnk6IEthaSBWZWhtYW5l
biA8a2FpLnZlaG1hbmVuQGxpbnV4LmludGVsLmNvbT4KUmV2aWV3ZWQtYnk6IEd1ZW5uYWRpIExp
YWtob3ZldHNraSA8Z3Vlbm5hZGkubGlha2hvdmV0c2tpQGxpbnV4LmludGVsLmNvbT4KUmV2aWV3
ZWQtYnk6IERhbmllbCBCYWx1dGEgPGRhbmllbC5iYWx1dGFAbnhwLmNvbT4KU2lnbmVkLW9mZi1i
eTogRGFuaWVsIEJhbHV0YSA8ZGFuaWVsLmJhbHV0YUBueHAuY29tPgotLS0KIHNvdW5kL3NvYy9z
b2YvbWVkaWF0ZWsvbXQ4MTk1L01ha2VmaWxlICAgICAgICB8ICAyICstCiBzb3VuZC9zb2Mvc29m
L21lZGlhdGVrL210ODE5NS9tdDgxOTUtbG9hZGVyLmMgfCA1NiArKysrKysrKysrKysrKysrKysr
CiBzb3VuZC9zb2Mvc29mL21lZGlhdGVrL210ODE5NS9tdDgxOTUuYyAgICAgICAgfCAgOCArKysK
IHNvdW5kL3NvYy9zb2YvbWVkaWF0ZWsvbXQ4MTk1L210ODE5NS5oICAgICAgICB8ICAzICsKIDQg
ZmlsZXMgY2hhbmdlZCwgNjggaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQogY3JlYXRlIG1v
ZGUgMTAwNjQ0IHNvdW5kL3NvYy9zb2YvbWVkaWF0ZWsvbXQ4MTk1L210ODE5NS1sb2FkZXIuYwoK
ZGlmZiAtLWdpdCBhL3NvdW5kL3NvYy9zb2YvbWVkaWF0ZWsvbXQ4MTk1L01ha2VmaWxlIGIvc291
bmQvc29jL3NvZi9tZWRpYXRlay9tdDgxOTUvTWFrZWZpbGUKaW5kZXggZGQyYjZlNGFmZmM5Li42
NmNkYzBlN2JmM2MgMTAwNjQ0Ci0tLSBhL3NvdW5kL3NvYy9zb2YvbWVkaWF0ZWsvbXQ4MTk1L01h
a2VmaWxlCisrKyBiL3NvdW5kL3NvYy9zb2YvbWVkaWF0ZWsvbXQ4MTk1L01ha2VmaWxlCkBAIC0x
LDMgKzEsMyBAQAogIyBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogKEdQTC0yLjAtb25seSBPUiBC
U0QtMy1DbGF1c2UpCi1zbmQtc29mLW10ODE5NS1vYmpzIDo9IG10ODE5NS5vCitzbmQtc29mLW10
ODE5NS1vYmpzIDo9IG10ODE5NS5vIG10ODE5NS1sb2FkZXIubwogb2JqLSQoQ09ORklHX1NORF9T
T0NfU09GX01UODE5NSkgKz0gc25kLXNvZi1tdDgxOTUubwpkaWZmIC0tZ2l0IGEvc291bmQvc29j
L3NvZi9tZWRpYXRlay9tdDgxOTUvbXQ4MTk1LWxvYWRlci5jIGIvc291bmQvc29jL3NvZi9tZWRp
YXRlay9tdDgxOTUvbXQ4MTk1LWxvYWRlci5jCm5ldyBmaWxlIG1vZGUgMTAwNjQ0CmluZGV4IDAw
MDAwMDAwMDAwMC4uZWQxOGQ2Mzc5ZTkyCi0tLSAvZGV2L251bGwKKysrIGIvc291bmQvc29jL3Nv
Zi9tZWRpYXRlay9tdDgxOTUvbXQ4MTk1LWxvYWRlci5jCkBAIC0wLDAgKzEsNTYgQEAKKy8vIFNQ
RFgtTGljZW5zZS1JZGVudGlmaWVyOiAoR1BMLTIuMC1vbmx5IE9SIEJTRC0zLUNsYXVzZSkKKy8v
CisvLyBDb3B5cmlnaHQgKGMpIDIwMjEgTWVkaWF0ZWsgQ29ycG9yYXRpb24uIEFsbCByaWdodHMg
cmVzZXJ2ZWQuCisvLworLy8gQXV0aG9yOiBZQyBIdW5nIDx5Yy5odW5nQG1lZGlhdGVrLmNvbT4K
Ky8vCisvLyBIYXJkd2FyZSBpbnRlcmZhY2UgZm9yIG10ODE5NSBEU1AgY29kZSBsb2FkZXIKKwor
I2luY2x1ZGUgPHNvdW5kL3NvZi5oPgorI2luY2x1ZGUgIm10ODE5NS5oIgorI2luY2x1ZGUgIi4u
Ly4uL29wcy5oIgorCit2b2lkIHNvZl9oaWZpeGRzcF9ib290X3NlcXVlbmNlKHN0cnVjdCBzbmRf
c29mX2RldiAqc2RldiwgdTMyIGJvb3RfYWRkcikKK3sKKwkvKiBBRFNQIGJvb3R1cCBiYXNlICov
CisJc25kX3NvZl9kc3Bfd3JpdGUoc2RldiwgRFNQX1JFR19CQVIsIERTUF9BTFRSRVNFVFZFQywg
Ym9vdF9hZGRyKTsKKworCS8qIHB1bGwgaGlnaCBSdW5TdGFsbCAoc2V0IGJpdDMgdG8gMSkgKi8K
KwlzbmRfc29mX2RzcF91cGRhdGVfYml0cyhzZGV2LCBEU1BfUkVHX0JBUiwgRFNQX1JFU0VUX1NX
LAorCQkJCUFEU1BfUlVOU1RBTEwsIEFEU1BfUlVOU1RBTEwpOworCisJLyogcHVsbCBoaWdoIFN0
YXRWZWN0b3JTZWwgdG8gdXNlIEFsdFJlc2V0VmVjIChzZXQgYml0NCB0byAxKSAqLworCXNuZF9z
b2ZfZHNwX3VwZGF0ZV9iaXRzKHNkZXYsIERTUF9SRUdfQkFSLCBEU1BfUkVTRVRfU1csCisJCQkJ
RFNQX1JFU0VUX1NXLCBEU1BfUkVTRVRfU1cpOworCisJLyogdG9nZ2xlICBEUmVzZXQgJiBCUmVz
ZXQgKi8KKwkvKiBwdWxsIGhpZ2ggRFJlc2V0ICYgQlJlc2V0ICovCisJc25kX3NvZl9kc3BfdXBk
YXRlX2JpdHMoc2RldiwgRFNQX1JFR19CQVIsIERTUF9SRVNFVF9TVywKKwkJCQlBRFNQX0JSRVNF
VF9TVyB8IEFEU1BfRFJFU0VUX1NXLAorCQkJCUFEU1BfQlJFU0VUX1NXIHwgQURTUF9EUkVTRVRf
U1cpOworCisJLyogcHVsbCBsb3cgRFJlc2V0ICYgQlJlc2V0ICovCisJc25kX3NvZl9kc3BfdXBk
YXRlX2JpdHMoc2RldiwgRFNQX1JFR19CQVIsIERTUF9SRVNFVF9TVywKKwkJCQlBRFNQX0JSRVNF
VF9TVyB8IEFEU1BfRFJFU0VUX1NXLAorCQkJCTApOworCisJLyogRW5hYmxlIFBEZWJ1ZyAqLwor
CXNuZF9zb2ZfZHNwX3VwZGF0ZV9iaXRzKHNkZXYsIERTUF9SRUdfQkFSLCBEU1BfUERFQlVHQlVT
MCwKKwkJCQlQREVCVUdfRU5BQkxFLAorCQkJCVBERUJVR19FTkFCTEUpOworCisJLyogcmVsZWFz
ZSBSdW5TdGFsbCAoc2V0IGJpdDMgdG8gMCkgKi8KKwlzbmRfc29mX2RzcF91cGRhdGVfYml0cyhz
ZGV2LCBEU1BfUkVHX0JBUiwgRFNQX1JFU0VUX1NXLAorCQkJCUFEU1BfUlVOU1RBTEwsIDApOwor
fQorCit2b2lkIHNvZl9oaWZpeGRzcF9zaHV0ZG93bihzdHJ1Y3Qgc25kX3NvZl9kZXYgKnNkZXYp
Cit7CisJLyogQ2xlYXIgdG8gMCBmaXJzdGx5ICovCisJc25kX3NvZl9kc3Bfd3JpdGUoc2Rldiwg
RFNQX1JFR19CQVIsIERTUF9SRVNFVF9TVywgMHgwKTsKKworCS8qIFJVTl9TVEFMTCBwdWxsIGhp
Z2ggYWdhaW4gdG8gcmVzZXQgKi8KKwlzbmRfc29mX2RzcF91cGRhdGVfYml0cyhzZGV2LCBEU1Bf
UkVHX0JBUiwgRFNQX1JFU0VUX1NXLAorCQkJCUFEU1BfUlVOU1RBTEwsIEFEU1BfUlVOU1RBTEwp
OworfQorCmRpZmYgLS1naXQgYS9zb3VuZC9zb2Mvc29mL21lZGlhdGVrL210ODE5NS9tdDgxOTUu
YyBiL3NvdW5kL3NvYy9zb2YvbWVkaWF0ZWsvbXQ4MTk1L210ODE5NS5jCmluZGV4IDk0NTYwMWEw
ZGMzNy4uODhkYTZjMmRlMDcwIDEwMDY0NAotLS0gYS9zb3VuZC9zb2Mvc29mL21lZGlhdGVrL210
ODE5NS9tdDgxOTUuYworKysgYi9zb3VuZC9zb2Mvc29mL21lZGlhdGVrL210ODE5NS9tdDgxOTUu
YwpAQCAtMzA1LDYgKzMwNSw5IEBAIGNvbnN0IHN0cnVjdCBzbmRfc29mX2RzcF9vcHMgc29mX210
ODE5NV9vcHMgPSB7CiAJLnByb2JlCQk9IG10ODE5NV9kc3BfcHJvYmUsCiAJLnJlbW92ZQkJPSBt
dDgxOTVfZHNwX3JlbW92ZSwKIAorCS8qIERTUCBjb3JlIGJvb3QgKi8KKwkucnVuCQk9IG10ODE5
NV9ydW4sCisKIAkvKiBCbG9jayBJTyAqLwogCS5ibG9ja19yZWFkCT0gc29mX2Jsb2NrX3JlYWQs
CiAJLmJsb2NrX3dyaXRlCT0gc29mX2Jsb2NrX3dyaXRlLApAQCAtMzE4LDYgKzMyMSwxMSBAQCBj
b25zdCBzdHJ1Y3Qgc25kX3NvZl9kc3Bfb3BzIHNvZl9tdDgxOTVfb3BzID0gewogCS8qIG1pc2Mg
Ki8KIAkuZ2V0X2Jhcl9pbmRleAk9IG10ODE5NV9nZXRfYmFyX2luZGV4LAogCisJLyogbW9kdWxl
IGxvYWRpbmcgKi8KKwkubG9hZF9tb2R1bGUJPSBzbmRfc29mX3BhcnNlX21vZHVsZV9tZW1jcHks
CisJLyogZmlybXdhcmUgbG9hZGluZyAqLworCS5sb2FkX2Zpcm13YXJlCT0gc25kX3NvZl9sb2Fk
X2Zpcm13YXJlX21lbWNweSwKKwogCS8qIEZpcm13YXJlIG9wcyAqLwogCS5kc3BfYXJjaF9vcHMg
PSAmc29mX3h0ZW5zYV9hcmNoX29wcywKIApkaWZmIC0tZ2l0IGEvc291bmQvc29jL3NvZi9tZWRp
YXRlay9tdDgxOTUvbXQ4MTk1LmggYi9zb3VuZC9zb2Mvc29mL21lZGlhdGVrL210ODE5NS9tdDgx
OTUuaAppbmRleCA0OGNiYmI1YWFjYjUuLjkyOTQyNDE4MjM1NyAxMDA2NDQKLS0tIGEvc291bmQv
c29jL3NvZi9tZWRpYXRlay9tdDgxOTUvbXQ4MTk1LmgKKysrIGIvc291bmQvc29jL3NvZi9tZWRp
YXRlay9tdDgxOTUvbXQ4MTk1LmgKQEAgLTEwLDYgKzEwLDcgQEAKICNkZWZpbmUgX19NVDgxOTVf
SAogCiBzdHJ1Y3QgbXRrX2Fkc3BfY2hpcF9pbmZvOworc3RydWN0IHNuZF9zb2ZfZGV2OwogCiAj
ZGVmaW5lIERTUF9SRUdfQkFTRQkJCTB4MTA4MDMwMDAKICNkZWZpbmUgU0NQX0NGR1JFR19CQVNF
CQkJMHgxMDcyNDAwMApAQCAtMTUyLDQgKzE1Myw2IEBAIHN0cnVjdCBtdGtfYWRzcF9jaGlwX2lu
Zm87CiAjZGVmaW5lIERSQU1fUkVNQVBfU0hJRlQJMTIKICNkZWZpbmUgRFJBTV9SRU1BUF9NQVNL
CQkoQklUKERSQU1fUkVNQVBfU0hJRlQpIC0gMSkKIAordm9pZCBzb2ZfaGlmaXhkc3BfYm9vdF9z
ZXF1ZW5jZShzdHJ1Y3Qgc25kX3NvZl9kZXYgKnNkZXYsIHUzMiBib290X2FkZHIpOwordm9pZCBz
b2ZfaGlmaXhkc3Bfc2h1dGRvd24oc3RydWN0IHNuZF9zb2ZfZGV2ICpzZGV2KTsKICNlbmRpZgot
LSAKMi4yNy4wCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KTGludXgtbWVkaWF0ZWsgbWFpbGluZyBsaXN0CkxpbnV4LW1lZGlhdGVrQGxpc3RzLmluZnJh
ZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51
eC1tZWRpYXRlawo=
