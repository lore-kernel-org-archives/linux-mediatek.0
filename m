Return-Path: <SRS0=DXFh=PU=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 206A7C433EF
	for <linux-mediatek@archiver.kernel.org>; Mon,  1 Nov 2021 08:01:18 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C6CE560F70
	for <linux-mediatek@archiver.kernel.org>; Mon,  1 Nov 2021 08:01:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org C6CE560F70
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AYpWBWvFLOsXPMzur1xyghHm5blEj7oS46brI9jk+PU=; b=FE4QSg5pyuQzXG
	B7vw3n0+5xCm4Yt5pHli/neSXzQNig9+EfdxdxSMxXPA7jO9847hx0BmbakQDgEtZA/PyUKz7Fbe3
	/jlgXAA7TFRt0xT3jxEVH0rsCa6QFzYQpQa7WV0+ial3fy0J/q7tweBWz3nGov1yWtYjnVGodOBa0
	FKppzyt/FYDbNBQpX+uoJoRi2nyBYrquzXZnIq9zfJgIq3BnAMn9Gyb1cbT9eSYcv0WI/O8V6T9Bm
	yVWsZeOQaCUhijC/7eWMHTA7f3Oo1n8XCnv1TD3qFJfQstvt5VXVhjuHwIYQtRjvONmtuN4ePEOZ8
	HRLMgjjoA1xntXhUljxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mhSFd-00Fbre-TC; Mon, 01 Nov 2021 08:01:05 +0000
Received: from mail-eopbgr50044.outbound.protection.outlook.com ([40.107.5.44]
 helo=EUR03-VE1-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mhSFX-00Fbm8-Ot
 for linux-mediatek@lists.infradead.org; Mon, 01 Nov 2021 08:01:01 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cE14NhI/usy5G6AB7Gzcj+w526+2mptmyLU8KSSetRUnAK+SgjeQur13Ue1nBTW3uRJL+bkdAtzi6vokFTHhalaNtt8SQ77Mq8CfXqBgNjoZ/+yGwir0uUzjpS00uus4rq4L6qychM2rILWehZhcU9mwMoxw201IC8V5m/iQVBYgQfp3pM+5KBMSSOn8ytD/PnhmPW6pBYgNd3qbv41OzIxzqSD1n8chHddCoxoQDIJo7Thn6a344UBCP//pqAPR0LC27gYkZvh+y2xKxebJzXfeuNsrlUaRXugm312cug3i8NfXc9u41P0eCwvvBrdFsScHFS5RYsu9gVjNZb249g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cG8P/WfZcRAHN57UVOx+Wd+RrVgZpkhz13HcXc8Xm+8=;
 b=UvKUdJZl/htNWK9Mey3KudOjtV9peAage9DtcwUN+/X9StH+Bw9HwZDwSBtij5BI/lKMfdOjksuIgINBROvoC7GlePDZIGia6Q24KmtxSwVCLet6mj8wdx/ioYBSqheHt0pnCjbF0MN6UKGMuLKML5zSfGhNIpodZXUVPiMCPcMd/jFP4CA0q26Mgj+qdLrgy2QL5bw6sOczpG7EvgnUNQEQyP1qeoQIzGPdqlXxuAFC+ur9QI2NAf7sScJWPFH3DPyoZ12YMWhPqsRS8PZwkTenL/vk4XjDRUEn8+1izUfecM3vINwk8rIk4dkHF77tNQRkXVrjevlGxF6Xq0UIPw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com; 
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cG8P/WfZcRAHN57UVOx+Wd+RrVgZpkhz13HcXc8Xm+8=;
 b=bAL+m+UJvKI2Ew3oC435IQ/VBbtZ/7ap+7IRK+QpcQyVcDJoTT+iZYYFMNTnCfduRyGENCln0fp+3sAyrExjzN+DwxjgPVkwIjRC27Bs67Jek0BetpZ8GzynKgwjRvtbSrWWnz6T7ssBmqUSJS11zy1WbY3GP4xeHSWStTPM7eg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from VI1PR04MB5151.eurprd04.prod.outlook.com (2603:10a6:803:61::28)
 by VI1PR0401MB2430.eurprd04.prod.outlook.com (2603:10a6:800:2b::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4649.15; Mon, 1 Nov
 2021 08:00:54 +0000
Received: from VI1PR04MB5151.eurprd04.prod.outlook.com
 ([fe80::85af:f8be:aa99:ba5f]) by VI1PR04MB5151.eurprd04.prod.outlook.com
 ([fe80::85af:f8be:aa99:ba5f%3]) with mapi id 15.20.4649.019; Mon, 1 Nov 2021
 08:00:54 +0000
From: Daniel Baluta <daniel.baluta@oss.nxp.com>
To: broonie@kernel.org,
	alsa-devel@alsa-project.org
Cc: peter.ujfalusi@linux.intel.com, ranjani.sridharan@linux.intel.com,
 guennadi.liakhovetski@linux.intel.com, daniel.baluta@gmail.com,
 linux-mediatek@lists.infradead.org, kai.vehmanen@linux.intel.com,
 lgirdwood@gmail.com, pierre-louis.bossart@linux.intel.com,
 YC Hung <yc.hung@mediatek.com>, Daniel Baluta <daniel.baluta@nxp.com>
Subject: [PATCH 5/6] ASoC: SOF: Add mt8195 device descriptor
Date: Mon,  1 Nov 2021 10:00:25 +0200
Message-Id: <20211101080026.297360-6-daniel.baluta@oss.nxp.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20211101080026.297360-1-daniel.baluta@oss.nxp.com>
References: <20211101080026.297360-1-daniel.baluta@oss.nxp.com>
X-ClientProxiedBy: AM3PR07CA0070.eurprd07.prod.outlook.com
 (2603:10a6:207:4::28) To VI1PR04MB5151.eurprd04.prod.outlook.com
 (2603:10a6:803:61::28)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (2a02:2f08:5719:1500:cdb2:376b:257c:429a)
 by AM3PR07CA0070.eurprd07.prod.outlook.com (2603:10a6:207:4::28) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4669.9 via Frontend
 Transport; Mon, 1 Nov 2021 08:00:53 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1e7550ad-8ac4-4874-9e6b-08d99d0dbad4
X-MS-TrafficTypeDiagnostic: VI1PR0401MB2430:
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-Microsoft-Antispam-PRVS: <VI1PR0401MB2430DAE8622AC75EAF60C372B88A9@VI1PR0401MB2430.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1201;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: OT1v0NMNEVyYjCX3MI+b26GYWR40vFqDNFZPfHZxcfXUzZxDVf//lAVB5hdC51RU6aF1jxwsziS6LBoSGG8efRy9KDF012lFIOlb5eXU1DfwqGx620+kXYCjHvoC4HLFmRWBSoDxvjaHdpbz96TWqGAxKdUTz/Lx7z6x+XJZJzWN+JH+L4edU01DG3A0fyEDB8a/3dOmbBXTk1tpHoD4Q4m2uUDtfKmi8G+AvX6hUUDxvCf6JkdN+atZj0uB5SZsHJwCSrlGuk+59J95cQnUQsA3d+eUm5JdroDzvWoIC0emefvEvsvW6I+HfajOkEfWmiVWiFj7lQsb/fkVAWhXk6mHRuHnBfb4CF6jRzeYToQruFVo3x5kGhDFt1gX5Xm6MRZ68dpl7Bx9rs1xtk4yIHfQWaBB9OpIj7uJ+RFLIEJqQtvGVF8t94YHGWfxxMvZsJo30I5emQn9Z3SFC/aMYLEdc/AGofh/4KLQQ9XnWf33Gx44AwCojrjmQFUKwbj+rgzkcCw4TYwezscNbVmg86J4JqJIM31K+nUUuT+A/lOVmzfrN+7PxlozGKvZdUeXKCqYiWH+/NEaRW6eMDMoLCLQJYPQqM3S8dMb0918zoYdCgZTT5evVBRuYNTp2vIDRuNmdl2LaXSQ0BT/8IOqxQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR04MB5151.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(316002)(8676002)(508600001)(54906003)(6486002)(8936002)(6506007)(1076003)(5660300002)(66574015)(83380400001)(52116002)(6666004)(44832011)(6512007)(66476007)(2906002)(7416002)(2616005)(66946007)(38100700002)(186003)(86362001)(66556008)(4326008);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?c1dQdzJMNksvRTRGcE1RN2lSWGJ5UVlkWkVTenlFdXhBOHdESitFZnA1S2h0?=
 =?utf-8?B?SzAzajZpenlxalo2dmxBblVyVk9pWkwwMnlaejRGSU1wMFU4V3FtRXhLRXpq?=
 =?utf-8?B?YmgyT1RldWx5Y0RveDBMZThjUndLZnZ5VlprZWlvMmNjYUVPR3FXVW8wczVL?=
 =?utf-8?B?UFErRUZaVmM2eWttc3ZqWGNoMWZOUVlPdEdmRUVHQUYrVHBLM2xSMTR2S2g4?=
 =?utf-8?B?VDMwYnJrc050dTZrSlBCMEVadHZnSFJWd1BrUHJ5UHJHUEdNbWhxK1duVEtV?=
 =?utf-8?B?OGxmaENXb1VBSGVMeEltbE8veENMM1NPRWlQZytlVFJYK0loMnRmWm1Uc0t0?=
 =?utf-8?B?SWNLR0x3SHpENW5yWFh6aU16OEZDNDFCa2JCeEo2RjAvMTV2NEJhd3M1bFQx?=
 =?utf-8?B?WlJtSWk5WFozc0t3RkUwWUU0WWl5d1RMN0lpK01BTTlhMUJ5RElXWWtJQVFw?=
 =?utf-8?B?MW0rdzcwb3FMeWhyOGswb0JWZm5vQkRmclFlRG0wSUFKTEp4bjJUaWhUVWw4?=
 =?utf-8?B?L05RVXAwZ0hyUndzMjJ3YlQ1cE1ST09PKzZvTWdPb2dLbFFuRllpcit1R2sr?=
 =?utf-8?B?YlNuemxWajIrSWRjL29aeGlmVEdKZE04cFl5dkFmM3l1cEdpWjl6dXRWY0Jt?=
 =?utf-8?B?M0VEaUc2YURicGQvbHJQdTBRQ2F0R203bmlTTnBBTDB6QUtGdHpUcTFYeTRw?=
 =?utf-8?B?VS93eXhwM2lDeUpna3NtSnFLRDhwcm41ZWE0WjNuSjY1TnhJOGZuWGN3alEz?=
 =?utf-8?B?MTJFOGhpbEFKcmQra3pzdnNlOENhY3VvNzBoYkVBYmpEanNzeTlPaURXOGtt?=
 =?utf-8?B?YmNlUDNDZEkzM3hPejNUWlFRdmlmYkhjUUJOVno4TmRUaWtSZitnS1BHZ0lr?=
 =?utf-8?B?YVQydnNGK0FiVHhSK1k5VjU5NUdod3orZjNjakZPYklMOVhZZkgwWFVjZlU4?=
 =?utf-8?B?clFYL2hwTTFwU0xoUC9EOTFlWmg4aVlTYkxmdFFmOFY0MUs3YUR5QnoxR1pM?=
 =?utf-8?B?UVA1RmM3MGkwZkk4N09jaHBzSFJQWjd2dUxERC9EdG4zYnVJcGxYS2Qwc3NI?=
 =?utf-8?B?eVJrZ2RTMVBNMnkxTlpMZ3lROHd1RzRXbFM0Ukc3ME9Cajd6YlRpcXh0NXZB?=
 =?utf-8?B?WlFWN3JDVEw4VXNsVTBWYnVlRmZaaXpjaGdOL1BrREQ2dnp1Y09JT2pybUFH?=
 =?utf-8?B?UGxHUHl6cTNNcWVaZEdGQUYycFZ3dmNSNTE5ajBKVGV4dnZuU25tREw0dmdo?=
 =?utf-8?B?Y3pGZzJVWnNGOWcrMVJTQWp2R0JRZFFRdU9lV203WEVQTzY0bU4rZWlDVE5m?=
 =?utf-8?B?bEZYb1paNmlObDBvditFNG5MVUc2N3RQZnc4a29mdW41Y2xLRjBkMFJzdEZq?=
 =?utf-8?B?Z0l6VnBOcnZ0QlhlQzhrOFNFc0hYelJLVzBsd0JwMjhGZ1VjMjR1VWZybnBq?=
 =?utf-8?B?RWZJZ0tHVHg1TFNLQWp0SkJwalRmM0hxOUtFT2VJMlRJRFo1cW5OYVFSTFcr?=
 =?utf-8?B?T0RVYzdlYkZ6RXZZWTlDVFFWaVdSOUZIL2tydWJNS0R5NVgyN1dzM21md1ZR?=
 =?utf-8?B?VTk2Z0dhUmo2b1d6L2hFeW5oL1lENVpyYTVLVFBkbS9YaHlCeEMybXFnVjAv?=
 =?utf-8?B?ZUtiLzZVbFNEVlUzaXRoR3ZLdDdHcWRneHJabW9FQ3hVRTJ0T0hITk13T2RL?=
 =?utf-8?B?TE9vV2RlUnQrSkUxUFdqcTFIcU55T0t4S1JyREF0NjhhVGNTd2xYakpFbUxL?=
 =?utf-8?B?OW5sTEdhM0E0U1laVmJKditnSjZGbmlheTMzU2VpTm13SXFSRVJrQlBpL20z?=
 =?utf-8?B?aVVBZzFWVFFYOVdUdWlGeEpMN09ya0M3UE94TXNPRDZtUW5xNThURzdxWGdn?=
 =?utf-8?B?dlFUWmtrNU9USGozNGxSWmd0TktvUmh6U2t0Q3ZTTUs4Rmt1aUYwRmRHaDdn?=
 =?utf-8?B?bkNLOWY1Y2t4WjByYkp4YVVERmduZmNBSitBTE1ibjJ6b0JZRG93ZDNpaHJY?=
 =?utf-8?B?ckpWTXdYM01iY1NsN011cmhKa2xwbE55ZUNxb1hxeDM5T05MQTlrOXdmWEpV?=
 =?utf-8?B?WU51UmhhNzhFUFk0ZjFCKzF0MVltK3R6R0d0MmJVamNLOTlPODdSckxEUkRK?=
 =?utf-8?B?RUI3ZEdGWE9SS3k5cjhQNm9xL3hRd0hCQmNZbGFsTmV2UEhzclcwcjZZaHhY?=
 =?utf-8?B?YmFKS2lSeW9jemhwNURpWjhqRVhlMEZSbklkTU1yZTAxOWNrM0s1OUgvN2ZN?=
 =?utf-8?B?SUFqNGlPSzA4NkZ1eUh1eHRURzZjWXJLV3U3cVllVTRiWEo2Uk9mVXZvMUhI?=
 =?utf-8?Q?gNXkIbw4tDSRglK82g?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1e7550ad-8ac4-4874-9e6b-08d99d0dbad4
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5151.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Nov 2021 08:00:54.5747 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pj7h+X9deZmePj11gQdqwp2uiNcnR0TNBuoTkOOiytnJvIt1XvH6MwAJLje7UUYyEtnF0OYdJzphM2cbkjgWNw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0401MB2430
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211101_010059_839289_0C77501F 
X-CRM114-Status: GOOD (  12.26  )
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
aG92ZXRza2lAbGludXguaW50ZWwuY29tPgpTaWduZWQtb2ZmLWJ5OiBEYW5pZWwgQmFsdXRhIDxk
YW5pZWwuYmFsdXRhQG54cC5jb20+Ci0tLQogc291bmQvc29jL3NvZi9LY29uZmlnICAgICAgfCAg
MiArLQogc291bmQvc29jL3NvZi9zb2Ytb2YtZGV2LmMgfCAxMyArKysrKysrKysrKysrCiAyIGZp
bGVzIGNoYW5nZWQsIDE0IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQg
YS9zb3VuZC9zb2Mvc29mL0tjb25maWcgYi9zb3VuZC9zb2Mvc29mL0tjb25maWcKaW5kZXggZmQ2
YWUwNjI5YTFjLi4wMTQ3ZDA4OTU1M2YgMTAwNjQ0Ci0tLSBhL3NvdW5kL3NvYy9zb2YvS2NvbmZp
ZworKysgYi9zb3VuZC9zb2Mvc29mL0tjb25maWcKQEAgLTQyLDcgKzQyLDcgQEAgY29uZmlnIFNO
RF9TT0NfU09GX09GCiAJZGVwZW5kcyBvbiBPRiB8fCBDT01QSUxFX1RFU1QKIAloZWxwCiAJICBU
aGlzIGFkZHMgc3VwcG9ydCBmb3IgRGV2aWNlIFRyZWUgZW51bWVyYXRpb24uIFRoaXMgb3B0aW9u
IGlzCi0JICByZXF1aXJlZCB0byBlbmFibGUgaS5NWDggZGV2aWNlcy4KKwkgIHJlcXVpcmVkIHRv
IGVuYWJsZSBpLk1YOCBvciBNZWRpYXRlayBkZXZpY2VzLgogCSAgU2F5IFkgaWYgeW91IG5lZWQg
dGhpcyBvcHRpb24uIElmIHVuc3VyZSBzZWxlY3QgIk4iLgogCiBjb25maWcgU05EX1NPQ19TT0Zf
T0ZfREVWCmRpZmYgLS1naXQgYS9zb3VuZC9zb2Mvc29mL3NvZi1vZi1kZXYuYyBiL3NvdW5kL3Nv
Yy9zb2Yvc29mLW9mLWRldi5jCmluZGV4IDg4NTQzMGE0MjIyNi4uNDEyY2JiODI0Yjg0IDEwMDY0
NAotLS0gYS9zb3VuZC9zb2Mvc29mL3NvZi1vZi1kZXYuYworKysgYi9zb3VuZC9zb2Mvc29mL3Nv
Zi1vZi1kZXYuYwpAQCAtMTMsNiArMTMsNyBAQAogCiAjaW5jbHVkZSAib3BzLmgiCiAjaW5jbHVk
ZSAiaW14L2lteC1vcHMuaCIKKyNpbmNsdWRlICJtZWRpYXRlay9tZWRpYXRlay1vcHMuaCIKIAog
c3RhdGljIGNoYXIgKmZ3X3BhdGg7CiBtb2R1bGVfcGFyYW0oZndfcGF0aCwgY2hhcnAsIDA0NDQp
OwpAQCAtNTAsNiArNTEsMTUgQEAgc3RhdGljIHN0cnVjdCBzb2ZfZGV2X2Rlc2Mgc29mX29mX2lt
eDhtcF9kZXNjID0gewogCS5vcHMgPSAmc29mX2lteDhtX29wcywKIH07CiAjZW5kaWYKKyNpZiBJ
U19FTkFCTEVEKENPTkZJR19TTkRfU09DX1NPRl9NVDgxOTUpCitzdGF0aWMgY29uc3Qgc3RydWN0
IHNvZl9kZXZfZGVzYyBzb2Zfb2ZfbXQ4MTk1X2Rlc2MgPSB7CisJLmRlZmF1bHRfZndfcGF0aCA9
ICJtZWRpYXRlay9zb2YiLAorCS5kZWZhdWx0X3RwbGdfcGF0aCA9ICJtZWRpYXRlay9zb2YtdHBs
ZyIsCisJLmRlZmF1bHRfZndfZmlsZW5hbWUgPSAic29mLW10ODE5NS5yaSIsCisJLm5vY29kZWNf
dHBsZ19maWxlbmFtZSA9ICJzb2YtbXQ4MTk1LW5vY29kZWMudHBsZyIsCisJLm9wcyA9ICZzb2Zf
bXQ4MTk1X29wcywKK307CisjZW5kaWYKIAogc3RhdGljIGNvbnN0IHN0cnVjdCBkZXZfcG1fb3Bz
IHNvZl9vZl9wbSA9IHsKIAkucHJlcGFyZSA9IHNuZF9zb2ZfcHJlcGFyZSwKQEAgLTEzMCw2ICsx
NDAsOSBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IG9mX2RldmljZV9pZCBzb2Zfb2ZfaWRzW10gPSB7
CiAjZW5kaWYKICNpZiBJU19FTkFCTEVEKENPTkZJR19TTkRfU09DX1NPRl9JTVg4TSkKIAl7IC5j
b21wYXRpYmxlID0gImZzbCxpbXg4bXAtZHNwIiwgLmRhdGEgPSAmc29mX29mX2lteDhtcF9kZXNj
fSwKKyNlbmRpZgorI2lmIElTX0VOQUJMRUQoQ09ORklHX1NORF9TT0NfU09GX01UODE5NSkKKwl7
IC5jb21wYXRpYmxlID0gIm1lZGlhdGVrLG10ODE5NS1kc3AiLCAuZGF0YSA9ICZzb2Zfb2ZfbXQ4
MTk1X2Rlc2N9LAogI2VuZGlmCiAJeyB9CiB9OwotLSAKMi4yNy4wCgoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtbWVkaWF0ZWsgbWFpbGluZyBs
aXN0CkxpbnV4LW1lZGlhdGVrQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJh
ZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tZWRpYXRlawo=
