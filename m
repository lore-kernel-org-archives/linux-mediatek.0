Return-Path: <SRS0=mmGE=QF=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17423C433F5
	for <linux-mediatek@archiver.kernel.org>; Thu, 18 Nov 2021 10:08:41 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D47C66108B
	for <linux-mediatek@archiver.kernel.org>; Thu, 18 Nov 2021 10:08:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D47C66108B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uL+R/2juQeKC41AKP1MwVAXFraaSyNqM1qKiAS+ISG4=; b=P+K9kiTEkdPqhq
	1pj1p34BQiUsDIV9dqGK6D8SK14oYhODArWjyDxuSY51dk7xmg23Ml0yPPKCaYg0qAGA1VGiydT2h
	F9tNPHc9oInPW2Er9aglY3z6U/HRtnmFNUt6w/iHfiiUn6E9SIKcUy+weOCs/lCXi7rjN3zlNA8eB
	84a/w0/7NqUlx/E48OkkbpoFhz6hNIGnneIqn18A1ghPljiSu6otEocFLnfidr4oYWwQli/nL5A4R
	xcuTVybg3WE/IhxnxaVZDC8RR727jjG0TdtrJZjQ27iCYC6H3y1eraI0p7V41TQcyoDLULDYMG7ZI
	yAzHJuaP03MLz97lqFtA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mneLI-007QVq-P6; Thu, 18 Nov 2021 10:08:32 +0000
Received: from mail-eopbgr80081.outbound.protection.outlook.com ([40.107.8.81]
 helo=EUR04-VI1-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mneLE-007QM6-3K
 for linux-mediatek@lists.infradead.org; Thu, 18 Nov 2021 10:08:29 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=f/cCkFYZhxwMpBjlCDJQek8r7PjE8dSQ+pb1AaRsKO8kGWkfC3cdDcsGVCpjnqZAd1xqMZoEWgH6VBfIaBfZMc+vXr56JI0VfHJNLF159Qa3r4h8yOPQCNozDQF6xY6ic2HDZyWLoUHZgN6Kk/eRrcFe2mB6+MkP30sejej5XnUlyTo2WUb9vVOzU1GKDXusee3Hen9ZD1gfyFW0reRdwuZa9ACsT4TNFE555GMDuPaU/Olto9f88q8SGiwq0ZRx/E5FaDGByGltg2QUhzfje2OwKkUzrj142FLTwSqh2+2GfDV1bGajQuumiwBMeuo5DmTPzxvTnIlw2vu2erhCfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LfCMsRTQHWceFWu6tp44o22ZVYte66A8Zl2PxavSv3g=;
 b=T0/1DSjlz42/HgEmbsZsbifvkEfb5eOr+VcJtp0tA6YatDZMp5u6sUlmSQvdsOc0fo48EoT+igwzGDGneb8W+U1BrElyUioJgnXyVvdr4JAZTLLfl/D3yzlTZEmwkP0OE5flHJLil04KMoWG6xwsasS7dvOCk9ZObGacibcvBzeshLKs0R9zww4LK/Ne/eDiqqhwr6S9a3Bdd9c+H75kTS+pWW1V+hlnAe+2H566bvR2JKuau2ZkuIrAozYVRFs1SWzjOXXuqIBZBPnOYND/+VwBVCD3uoy4d9gtebIGxn2/wPRWw2w8LPVj3SpeAINt7qwjcFLqoTBJZAhIIQD/DQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com; 
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LfCMsRTQHWceFWu6tp44o22ZVYte66A8Zl2PxavSv3g=;
 b=Is3xwVFxiEU1h8vp0fsYjjleJNIonUKyg9/cFhc/5GNh/pfT6jRgW97tlFhA7nfBtZMxyZWREABNgDRo6fntl+WcF8Cbg8mXrdxjT1bWAqaElSvkKtvSTqKSXcaPCj+2Y5gEDVqYDKyRVL8ehlWBCGkD5l0W484XyQeLPB5NHCo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from VI1PR04MB5151.eurprd04.prod.outlook.com (2603:10a6:803:61::28)
 by VI1PR04MB4285.eurprd04.prod.outlook.com (2603:10a6:803:4a::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.19; Thu, 18 Nov
 2021 10:08:19 +0000
Received: from VI1PR04MB5151.eurprd04.prod.outlook.com
 ([fe80::85af:f8be:aa99:ba5f]) by VI1PR04MB5151.eurprd04.prod.outlook.com
 ([fe80::85af:f8be:aa99:ba5f%3]) with mapi id 15.20.4690.027; Thu, 18 Nov 2021
 10:08:19 +0000
From: Daniel Baluta <daniel.baluta@oss.nxp.com>
To: broonie@kernel.org,
	alsa-devel@alsa-project.org
Cc: pierre-louis.bossart@linux.intel.com, lgirdwood@gmail.com,
 daniel.baluta@nxp.com, daniel.baluta@gmail.com,
 linux-kernel@vger.kernel.org, yc.hung@mediatek.com,
 linux-mediatek@lists.infradead.org,
 =?UTF-8?q?P=C3=A9ter=20Ujfalusi?= <peter.ujfalusi@linux.intel.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
Subject: [PATCH v2 6/8] ASoC: SOF: mediatek: Add dai driver dsp ops callback
 for mt8195
Date: Thu, 18 Nov 2021 12:07:47 +0200
Message-Id: <20211118100749.54628-7-daniel.baluta@oss.nxp.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20211118100749.54628-1-daniel.baluta@oss.nxp.com>
References: <20211118100749.54628-1-daniel.baluta@oss.nxp.com>
X-ClientProxiedBy: AM4PR0902CA0008.eurprd09.prod.outlook.com
 (2603:10a6:200:9b::18) To VI1PR04MB5151.eurprd04.prod.outlook.com
 (2603:10a6:803:61::28)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (2a02:2f08:5706:b700:863d:d4f3:969f:6fa)
 by AM4PR0902CA0008.eurprd09.prod.outlook.com (2603:10a6:200:9b::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.19 via Frontend
 Transport; Thu, 18 Nov 2021 10:08:17 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6fa336a2-d635-4222-2cd5-08d9aa7b5869
X-MS-TrafficTypeDiagnostic: VI1PR04MB4285:
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-Microsoft-Antispam-PRVS: <VI1PR04MB42859A99B6049BDEC431FF36B89B9@VI1PR04MB4285.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1284;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ugQn4vJJfLzhVzXIj+7ZDCJrFPMNt4UrrzWEYEPouYlOy0ATC0je/I/+98DOF2v+Q8lhRXwzyx2btY2DrHYFGHDgaqopYiTixeMDxnu1RhG6Hpaf0yYgEABVWXwusZZ+kmATHz3JzZ6v1eDpI2cu1HP+r4y3+EjVsy2FxTAGxu/KszsDVOBPN4Xtph6HmGJOGcpe8z9jmuH/6vAHyqK5DpzCB6BZ51hlHhYRsf/LsBjqCBq0a2tCS4l5lk1gUGIYeHF7SjZyK60FFMZXlJtbmJLq/fBQA6scKliCe8bmbCdjy70YG0N1vJPJLFZlT+V0B5SSp3P2vjCMJH2yPkE0RCiuJjxkG2INbd/W5qfoSFFLla8QHOuZ/yLhrjJd33NKNfJFQ8Iu0GyYfuLxbp6vgYdISmqPfrPOzp5A9aqfDTqObwhOaTG3E1Ig1g9XJ7+7loDrCHK1cgZJ9uVTrRvS2y8tLbUE3Oey6WRDceTWleoisOFJrf63NhmQYJAl2wBNW1XajpFPZ7ebQsO4Rb6MAbrzXwRqJgtCH+R8SvIPGCE8CdqtqDeY/fmVQoPgY6MK5nqx5CYCapHrB81QDS9lWhViGBS5yLTavvzUFbsfK7F9hKpYi7HRT8BsQNBrux77NWdwg4DchSdRXg1xPbNFyw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR04MB5151.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(186003)(54906003)(8676002)(2616005)(4326008)(44832011)(86362001)(7416002)(38100700002)(316002)(508600001)(2906002)(52116002)(6506007)(6486002)(1076003)(6666004)(66556008)(8936002)(66946007)(66476007)(5660300002)(6512007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?S0FDNU1VSGdMcmROdUdLU3NlcFhaZEtsVDFoVThvL1hNVnVjZTdtOTZQVjBB?=
 =?utf-8?B?Z1Y4MlVSTzlMT0E0TkF6V0hwdGF0c1BhN0hLeCtKSzhLRFhla1JNQ1RVcFNR?=
 =?utf-8?B?d0VaaElsZjV2OFJXN1Q1YytCT05teFFsVjAxaGo4eURGZExLUE9QV1lLWTRa?=
 =?utf-8?B?bHl3VlBybGt5ZGlNclBzL3pOV1NuZEhFcUd3aE1OZ3RjbFRNUTZueVdLY21m?=
 =?utf-8?B?R2lKWExZTGVpZ1ZjQ2FtVitWZnNhbVRscHdJejNPblpDVHdxL3Bwc3lXU0Vw?=
 =?utf-8?B?MUhSR0NGcjYrTWFrejhtQVRlUkdzM0pEY1FUdUM2RndtNE80aFFBaWhHWkQ5?=
 =?utf-8?B?QnZTYjJaU3BZWnM3ZE81UEVmdmJ0M01iZlBsbG43bDduckZBTkFha2c5aGE5?=
 =?utf-8?B?VzY0S21jVU4rVW54aVNicTRiM1Z1aXM5andscHowaFVSSjJTckk2MVlaNlF1?=
 =?utf-8?B?U0hrSFJITFo1RnJYM1VQUmIwanM3M3VaQXB1empvQVlMNTYxd2lFRGsvZVN2?=
 =?utf-8?B?cjQvZW9uMVNUQ2hiU1ZBRVpoWkIwVmZHdGZ5dnlCR2Yra2xuUXBGOGl5WEtl?=
 =?utf-8?B?ZUZkekxwSjhLaU1keHJXQWRQSWpyUi95KzdWUlRSdG9aUHdBZnIydmxRQTk3?=
 =?utf-8?B?QUI2aWJZNlJoWXQrcXhKYm5IRUVQMlBwUVhsaHBMWWlhTm9YYkVZc0RiV3Er?=
 =?utf-8?B?Rlc3RUZxZnc0T1Y2K1RFN0x2WEE3bmVRYTlBR2xDREYwbS9uN0YvVkVmVW5O?=
 =?utf-8?B?VGVjOWdSaWZIQTdRbmhPZWhkSUV5T2xZSjZibHpjNS9zWEEzS2lURjY5U0Nn?=
 =?utf-8?B?TDc4em9aSXZVQVRmdm9odmdlQ1JOamtTaDRSSHIvMlpqSitNUGIxbE9rTVpH?=
 =?utf-8?B?cmg3VHQxQWkrUTFVWFhTZ1MyQ3lBQUJ4OURWbnpCZ2NUVDFSbWdmbFlySmpa?=
 =?utf-8?B?M0dZcnc4Y2tJOGNIY29TdkJqcXlOYTk3ZXMzamhRd0NSb3R1elhaMmRsaGl4?=
 =?utf-8?B?UWVvQUJGYkZWVnR3RHFlOVd0TGkyOVNiazBjMmpmWGZheEVBa1lWOW5iUkMv?=
 =?utf-8?B?ZjFzU1VveTJuaGVQcFc2VzQwRzNrSyt1clpvNkhhVFhOc0s5V3kwblFsZkJP?=
 =?utf-8?B?K3B3dGNud2V3SEZLRHhsNjNvUE83ZEFLNjl4cnZVSWc5Y3JqU3QwYU85T3A5?=
 =?utf-8?B?SXpqSkhKM3VXejR1Ykc1ZktnTENoa3Nsc2NIb0pkSnlxK0loV1VpbGMvYnNu?=
 =?utf-8?B?WlRkUW9LM0dHNDVRNGFLSHZWQTR5YnFyTXU1Y2J5U0pIMmdiVVNUdUxkRXBK?=
 =?utf-8?B?dnQ0eWZpb0o1aEpCbEVzc1psK3NzWFBRMG9TSnAyWVJUUnRERW01TWRtY2cv?=
 =?utf-8?B?aDZ5bzdSWUt3b0ZSOVlEb1FwSnNkK09Gb2FyNFl2Qm9KS3VYRlpad1h4SVdV?=
 =?utf-8?B?WGRNTHBnVXFzLzZIREJZT0ZtNUhnWWN5NThPc3ZRL3N6OFJDbStRU1c4Wms4?=
 =?utf-8?B?cmx6SGZhRVFkZXIrMytjVnlOQnc4N2wvdCtXdE83N1RyTm1LY3dwNGU4cHpV?=
 =?utf-8?B?MnFPcDd5N1kyZVVpOWpSL3ViUTVwQW9weHkrQTZDVnpqREVWSXdIemRScVVw?=
 =?utf-8?B?V25WN3BtQ2VLRk92bGpRWi80cStpR0piVlVOUFltK3lmUVNiNURYamgwWHhp?=
 =?utf-8?B?UXdyN1VxMyszSVFvY2hKR3p5MnpFYWFkV0JwSWh3dDNGTGx0cWN6Tk5kQ2dT?=
 =?utf-8?B?bG42SDhuMlc5TWJqenF4RE5ab1BlZ0VSdGdsaGpPWXB3ZTJrYVpBVFpCVnZE?=
 =?utf-8?B?aU05aG1NTk1rV0orcXZwMnhkaUEraEVCZHI3TUJFVW1VcVZpR1VnZnVtUFZB?=
 =?utf-8?B?VEs1cUxjUERZR0hkekMyZmFlZWlWODYrU09MSE9tdUpVdTg3L0d5Vld0dzdS?=
 =?utf-8?B?bFhrdEhzcnJoWmZsYUdJeFZ5NW9VcFgzL285eHRNTFJTMXRMRzV1SzlDL2Vl?=
 =?utf-8?B?bjZWUXdCMnRiVnZwZGUwd0h2aDZOWXl6bVpZdHVuRXFlUU9hV01xL0VkS29V?=
 =?utf-8?B?YTN0bXpYQ01RV0dUcjh5clhZYndGT1ZJczgwcXZ2VER6ZEViMld6VUlhTyts?=
 =?utf-8?B?bXN2Z1A1ZjY5L3VKUlc0T1F5bGFTcHBXMkd3L3cxQnNyc09QeE03cmhlcXkr?=
 =?utf-8?B?QlFKUGN3YmxCbEtkNFVCS28xMFBLTHAwOFZUSXZTTll4bllRYjBUMkVNOXNx?=
 =?utf-8?Q?xwr/WZdklYrdEuKn3EsYa9REfBLEqPO5RSFc3/e0Ro=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6fa336a2-d635-4222-2cd5-08d9aa7b5869
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5151.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2021 10:08:19.3111 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mw1okgv/b+UL46B6IWFKv8VCDYMgqXp5MLbgfGuQtbVPTW8GEhaAw6zf/b1diNaidRhcJ19YVINDLiRvkKk3VQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB4285
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211118_020828_180844_220B5921 
X-CRM114-Status: UNSURE (   9.47  )
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

RnJvbTogWUMgSHVuZyA8eWMuaHVuZ0BtZWRpYXRlay5jb20+CgpBZGQgZHNwIG9wcyBjYWxsYmFj
ayB0byByZWdpc3RlciBBRkUgREwyL0RMMy9VTDQvVUw1IHNvZiBkYWkncyB3aXRoIEFMU0EKClNp
Z25lZC1vZmYtYnk6IFlDIEh1bmcgPHljLmh1bmdAbWVkaWF0ZWsuY29tPgpSZXZpZXdlZC1ieTog
UMOpdGVyIFVqZmFsdXNpIDxwZXRlci51amZhbHVzaUBsaW51eC5pbnRlbC5jb20+ClJldmlld2Vk
LWJ5OiBLYWkgVmVobWFuZW4gPGthaS52ZWhtYW5lbkBsaW51eC5pbnRlbC5jb20+ClJldmlld2Vk
LWJ5OiBEYW5pZWwgQmFsdXRhIDxkYW5pZWwuYmFsdXRhQG54cC5jb20+ClJldmlld2VkLWJ5OiBS
YW5qYW5pIFNyaWRoYXJhbiA8cmFuamFuaS5zcmlkaGFyYW5AbGludXguaW50ZWwuY29tPgpSZXZp
ZXdlZC1ieTogUGllcnJlLUxvdWlzIEJvc3NhcnQgPHBpZXJyZS1sb3Vpcy5ib3NzYXJ0QGxpbnV4
LmludGVsLmNvbT4KUmV2aWV3ZWQtYnk6IEd1ZW5uYWRpIExpYWtob3ZldHNraSA8Z3Vlbm5hZGku
bGlha2hvdmV0c2tpQGxpbnV4LmludGVsLmNvbT4KU2lnbmVkLW9mZi1ieTogRGFuaWVsIEJhbHV0
YSA8ZGFuaWVsLmJhbHV0YUBueHAuY29tPgotLS0KIHNvdW5kL3NvYy9zb2YvbWVkaWF0ZWsvbXQ4
MTk1L210ODE5NS5jIHwgMzUgKysrKysrKysrKysrKysrKysrKysrKysrKysKIDEgZmlsZSBjaGFu
Z2VkLCAzNSBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvc291bmQvc29jL3NvZi9tZWRpYXRl
ay9tdDgxOTUvbXQ4MTk1LmMgYi9zb3VuZC9zb2Mvc29mL21lZGlhdGVrL210ODE5NS9tdDgxOTUu
YwppbmRleCA4OGRhNmMyZGUwNzAuLjk5MDc1NTk4YTM1YSAxMDA2NDQKLS0tIGEvc291bmQvc29j
L3NvZi9tZWRpYXRlay9tdDgxOTUvbXQ4MTk1LmMKKysrIGIvc291bmQvc29jL3NvZi9tZWRpYXRl
ay9tdDgxOTUvbXQ4MTk1LmMKQEAgLTI5OSw2ICsyOTksMzcgQEAgc3RhdGljIGludCBtdDgxOTVf
Z2V0X2Jhcl9pbmRleChzdHJ1Y3Qgc25kX3NvZl9kZXYgKnNkZXYsIHUzMiB0eXBlKQogCXJldHVy
biB0eXBlOwogfQogCitzdGF0aWMgc3RydWN0IHNuZF9zb2NfZGFpX2RyaXZlciBtdDgxOTVfZGFp
W10gPSB7Cit7CisJLm5hbWUgPSAiU09GX0RMMiIsCisJLnBsYXliYWNrID0geworCQkuY2hhbm5l
bHNfbWluID0gMSwKKwkJLmNoYW5uZWxzX21heCA9IDIsCisJfSwKK30sCit7CisJLm5hbWUgPSAi
U09GX0RMMyIsCisJLnBsYXliYWNrID0geworCQkuY2hhbm5lbHNfbWluID0gMSwKKwkJLmNoYW5u
ZWxzX21heCA9IDIsCisJfSwKK30sCit7CisJLm5hbWUgPSAiU09GX1VMNCIsCisJLmNhcHR1cmUg
PSB7CisJCS5jaGFubmVsc19taW4gPSAxLAorCQkuY2hhbm5lbHNfbWF4ID0gMiwKKwl9LAorfSwK
K3sKKwkubmFtZSA9ICJTT0ZfVUw1IiwKKwkuY2FwdHVyZSA9IHsKKwkJLmNoYW5uZWxzX21pbiA9
IDEsCisJCS5jaGFubmVsc19tYXggPSAyLAorCX0sCit9LAorfTsKKwogLyogbXQ4MTk1IG9wcyAq
LwogY29uc3Qgc3RydWN0IHNuZF9zb2ZfZHNwX29wcyBzb2ZfbXQ4MTk1X29wcyA9IHsKIAkvKiBw
cm9iZSBhbmQgcmVtb3ZlICovCkBAIC0zMjksNiArMzYwLDEwIEBAIGNvbnN0IHN0cnVjdCBzbmRf
c29mX2RzcF9vcHMgc29mX210ODE5NV9vcHMgPSB7CiAJLyogRmlybXdhcmUgb3BzICovCiAJLmRz
cF9hcmNoX29wcyA9ICZzb2ZfeHRlbnNhX2FyY2hfb3BzLAogCisJLyogREFJIGRyaXZlcnMgKi8K
KwkuZHJ2ID0gbXQ4MTk1X2RhaSwKKwkubnVtX2RydiA9IEFSUkFZX1NJWkUobXQ4MTk1X2RhaSks
CisKIAkvKiBBTFNBIEhXIGluZm8gZmxhZ3MgKi8KIAkuaHdfaW5mbyA9CVNORFJWX1BDTV9JTkZP
X01NQVAgfAogCQkJU05EUlZfUENNX0lORk9fTU1BUF9WQUxJRCB8Ci0tIAoyLjI3LjAKCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1tZWRpYXRl
ayBtYWlsaW5nIGxpc3QKTGludXgtbWVkaWF0ZWtAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8v
bGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW1lZGlhdGVrCg==
