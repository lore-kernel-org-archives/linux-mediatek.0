Return-Path: <SRS0=mmGE=QF=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E62A2C433EF
	for <linux-mediatek@archiver.kernel.org>; Thu, 18 Nov 2021 10:08:38 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B63A86108B
	for <linux-mediatek@archiver.kernel.org>; Thu, 18 Nov 2021 10:08:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org B63A86108B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9RA09V3i55O5uKuzjvJDuAqiREum51a70vHAUjRLI/w=; b=jBMRdnIFSxzdBv
	2yRHtQt7vJxXee71iuBxVO0BCeAvpn9lcFqYdEXclDoQGLYg6m5b2/u6K81gfj8J1a9ozaiBwQyfi
	sWSgJrbRBsf27a3T00d1Vdxdy1Ahna2pQ2AS7WCnNJXv26WxvX95eEgauyDKwBkTHV1HoJtz1pbcW
	WPqSZWhZhBozFqrVh+AILVwYol0nwikXuD89yBNmCaFbL4x3pz3NwvXhxLTzbrxpahctUCoFPqwZi
	yeu64uF1RAePb20Lq1KDyuIAMys6BNfrL0fhWpLu6A3PUs6H03lVpxSMexIH811ElXhhf2AFCEbuS
	GJAWV9lFx+ph5wFAjnNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mneLG-007QTR-1F; Thu, 18 Nov 2021 10:08:30 +0000
Received: from mail-eopbgr80081.outbound.protection.outlook.com ([40.107.8.81]
 helo=EUR04-VI1-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mneLC-007QM6-AY
 for linux-mediatek@lists.infradead.org; Thu, 18 Nov 2021 10:08:27 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Lrg5YO3U9LqWq3NXyhOMMQziaIh5SwdQpaPWY6gN+ogiPqb+ssadqAg5XAjUMFn9Ee8hAob3c5Wy9Z4EnVYxBC8DpYmBImXCxk6i9I+wzn6wPgaVuWg+NXW//WFCyBq0T3tdlCqCt5V1JdMgYM/TF/lWpq/pAjMKcMYMIXgOZq6bUMVH8buQNVYhn1dUGGKmw8+cikX8puiEnTEsG///zbL7m5wO3WKHJMKifMItkb6jVR2o6MZiZcXwJi5iTpr2MeM7PEdGXFdCtbZFt6n01qLmNlBNYUPJecXgT01cwhqG9vhcwwpm3wjOVEhZyO5F+bQ+1M4UiexgC56vRZ2cZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3rLHhWr+VMdNdo8jPTd1t8rCkBuoynNxwXMACXCxzpw=;
 b=MJT4I1dWleiV94SlX6EWBogPwiN36iaOyny6rp6IF+XVqfVyeS/HfGJsOIMS/BycDPxm0xMODaZMkxFsSpe1hComB63I1igJ6hMdQamKKO88LjOYlw/76zcfffc31+PSoQ6JXN/a0BVYBdTp99EpX17wTxPY0fy1isy+HkhgJUs1p6iHmLKKwH6tSBaRB97HQur2PYReLCGbRJ8IdOTmR0zfBwefjfgUi/zRqmRBA+AvX8WDfYxXEt3K09sG+zi+r5AQFDi6YQA0ByXQvrg4PBUgk69N1fHQ5Wkbp/vWJGLG7KmWmrQUw47jg9wIC6WuutwJQIWf3eB/A3RCHrIQhw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com; 
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3rLHhWr+VMdNdo8jPTd1t8rCkBuoynNxwXMACXCxzpw=;
 b=RSaVGktFIeSlLmpaWLVFGHM/VDxzHjru4RttE8UQciC2lUP15+ZIvsg9mJ61cGrJPJPejHhYLWlHKNy64m0h5ODucAj9lXHmYLLQKQmdG6Sq5UFAr7rJdj4950jKhJRTD4rghWwL0zIKtT8VL/WXoGUxW8Xy+Tg36RApXlo9IEQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from VI1PR04MB5151.eurprd04.prod.outlook.com (2603:10a6:803:61::28)
 by VI1PR04MB4285.eurprd04.prod.outlook.com (2603:10a6:803:4a::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.19; Thu, 18 Nov
 2021 10:08:17 +0000
Received: from VI1PR04MB5151.eurprd04.prod.outlook.com
 ([fe80::85af:f8be:aa99:ba5f]) by VI1PR04MB5151.eurprd04.prod.outlook.com
 ([fe80::85af:f8be:aa99:ba5f%3]) with mapi id 15.20.4690.027; Thu, 18 Nov 2021
 10:08:17 +0000
From: Daniel Baluta <daniel.baluta@oss.nxp.com>
To: broonie@kernel.org,
	alsa-devel@alsa-project.org
Cc: pierre-louis.bossart@linux.intel.com, lgirdwood@gmail.com,
 daniel.baluta@nxp.com, daniel.baluta@gmail.com,
 linux-kernel@vger.kernel.org, yc.hung@mediatek.com,
 linux-mediatek@lists.infradead.org,
 =?UTF-8?q?P=C3=A9ter=20Ujfalusi?= <peter.ujfalusi@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
Subject: [PATCH v2 5/8] ASoC: SOF: Add mt8195 device descriptor
Date: Thu, 18 Nov 2021 12:07:46 +0200
Message-Id: <20211118100749.54628-6-daniel.baluta@oss.nxp.com>
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
 Transport; Thu, 18 Nov 2021 10:08:16 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 094c7214-8390-4b0d-2d27-08d9aa7b576c
X-MS-TrafficTypeDiagnostic: VI1PR04MB4285:
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-Microsoft-Antispam-PRVS: <VI1PR04MB42856CA85FAB670BEF93DA8DB89B9@VI1PR04MB4285.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1201;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: +Rnrvj67/Xvipbu2Qx9Kb22RSryCoM8t6aqTfjqrOwWuRlpidHWjRDCY5qRtRxU3EzqM1RTdUAMD0Xt7bfw99oB4yzl2i90bc0IY+Q44BH3ab7+DRm08f5mZnxjQ4o8iI2/4dfEmJKLK0+WkNbBOx25NkZW1gB5wgKxyjsUQC+pMnXu9e+9yMRbdtfXbUQ01fOtnKTyGBnJpCgklN48gnVbeg27nvdq6TAIU4SrMnaDs1LsKpm6XNnhDeHDSgihugEGbIFBh+72LLbkLvd4f0TNnxbpk6NgjnU86C4JpnSsgIXJd6T+yi2CCXNj+X3k/vnf3tWmEdeK5lTc8oZXYi1Ll3v74rtzawhU+dzndBfE0XTyDxpDX0AZCSPPeE5m0GgIVWJu/rZdOhR02IWehObNbx0AlFRuy3E5av9bLTgzgyT+KrJrjbYKMZQzimLdm3rBLQKc+YxHNRdzFKGeK1uretj4SwnSU+7amyntTCzNDv0GnRrflhfmn9zt0RTpWTFZaqg71iLo+A2gbeloz7A8hxIbO32TDCWhJeU4IPBODIFvNYSRcnAvBJ9vLzJPnl/AWhxPDUz558wLJp9TrKYNN3q85BLQOkXrTTJqF/J8E/xmX18RGIQuybHroKXFdAKT5BNJ2jNAcMRTMiJlQBg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR04MB5151.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(186003)(54906003)(8676002)(2616005)(4326008)(44832011)(86362001)(7416002)(38100700002)(316002)(508600001)(2906002)(52116002)(6506007)(6486002)(1076003)(6666004)(66556008)(8936002)(83380400001)(66946007)(66574015)(66476007)(5660300002)(6512007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?M2RpVWJkemJWOXV0a1BteUM4ZWx4MW1TNFlrY01QdkNKdmhQMW5mMzlwUDY5?=
 =?utf-8?B?SGU0THdhU2VtVERzbDlBTVVrYXpkbjRXNDhFK2lmYzFqWGxxVFNNd0ZtdjY4?=
 =?utf-8?B?dzhRK3hFR0NBTXowZ09ZZ3lDK3VXUmxzMjlRakZneW1GQXJnY2xNTDhpYWx0?=
 =?utf-8?B?VGJHalJmV1JySnB5YWwwVmNzWGdIK2RKUWxxZkxyRHJzeGUrNW5RYitwNy9v?=
 =?utf-8?B?R3RJN0dUakwvV2FBYTcxODJMejZoSWFwRkFmNFl4aFd4Z3B1REhrWVk1V0h4?=
 =?utf-8?B?bU15NVI1UE1sS1NmMHdLOXZhZU9iY2ZvU1Q2N3QraWovckZuQzhRQ2lIUFU5?=
 =?utf-8?B?RGpQbzhTamNQV1pOQzhkUE0xZTBFdEU4TEVMTGZFQ1RtQ0tFakZDRnJha241?=
 =?utf-8?B?RTJyaWtXeWtBZkhlb3o1RnRCVmdJdExqb1QrbW5iZk9vSnhsbVFhQldHV2hN?=
 =?utf-8?B?Sk1BOGUyWXhUZ01KZjcxODJ4Q3FyRG5zejMzNjNVZE9iaCtiU1hEWi9zWlVN?=
 =?utf-8?B?cmloLzVWZnZmbU5MM3ZPcFRMc3ZQRWdaeTZvVUREMWFyNmoxankxejU1bEdx?=
 =?utf-8?B?cDNmNVZCQVZ0TDhaR1piS2lCZy94SHZCT3h3YXFSUmxOWlYxSUZacVVwZDZN?=
 =?utf-8?B?czViNjB5VUNERzNmRk5yZUpONWF6U01BT05LRXUxQ2N2Ry9hMVg1ekVBOGd3?=
 =?utf-8?B?ZmJxZ0xEY2doZ1I1SUY5Z2tZT0dsZXFHWHB5eWl6Q04zZlRVODNwemNlZmtZ?=
 =?utf-8?B?N203TzIxNnRQdXkzR05RdU5MYUpmT1dPMGY0ejJ3a0dZaG5LVUM2eitQVWFL?=
 =?utf-8?B?MnpnbHBUeGt3TW9tR2pueWdMM1JCeGZkdmtYdlVsc1VHOUdNS3dDdkpwN2kr?=
 =?utf-8?B?Rkt3b1FJZ0NhclR6M1BVcUo5TTFWenI5RFpQVEcyaVp1ZnhnZW9yRzRDN0lR?=
 =?utf-8?B?N2hQYk54WUpJeVBoNmNidS9BaE1kLzJaUHRpdzNWY1VSM3pkc3BlMEFMSUll?=
 =?utf-8?B?Q2hESUk0M1pFVWhGWDd3Mm94dm5tUVVnN2dENzNpYVA4MVdmRUxwVThUOEgx?=
 =?utf-8?B?aHdHbDdJbXNvcEd0b3FsZ1d3THd1VUtOMnRGSE0zVFNvQTFiQ0U0NGFWQ0M5?=
 =?utf-8?B?bHIzSFBDdVM2ZkRPRjlubFo5TS8zQnhPWGUreHRab1plNVo4WmNQeHlrUU9r?=
 =?utf-8?B?M2phZ1BUdFI3WlJXQlhXYzBYMTRPYTZLZ2c2aGdVWVNsR2ZUWE51amJuczQy?=
 =?utf-8?B?Ti9nbXY4Rkl1MUtKTTdFcURadFQ2R25rZXNBWGtkbFlZa3I4aDFycUdPTUlN?=
 =?utf-8?B?WkMwQkdqeVg2WlBMemNYOTg4TnR1WmdTeVcvb3VKS1RIVTZiY2wxMk1adUZS?=
 =?utf-8?B?R2tKdlVkY0RRNVR1SEJTTU9kazUwODYxdktQN2ZpY0dOUnB2MWhBa1RDRFYr?=
 =?utf-8?B?ZjNuc1ZrOHZmbktWN2lVMEZzellqRmFHVUt4TDNBTG1rdmtnazkwOFpFUFMv?=
 =?utf-8?B?SUxTRXEzR2tGQmZRajhjWlY5eGhDSlA0aHRaaWl3cHB2dEJBOFIyRG0wRXpR?=
 =?utf-8?B?Z0F0cXZ2YUs5NXNGVitXZkdiejhLZlYrQ01sVWg2WFhXTXdrRkZ5cDNEbXJh?=
 =?utf-8?B?UnFFU2VReFdUYmJ2Rmp1MTN1bzBKUllvTTUwQUZBeWhNclJoSW9TbitZMGZ3?=
 =?utf-8?B?MDNTaHVLOFZMaGY1anBXemsySm11ZENhbDhRa1NPMCt1R0xteW93NmY5UGZw?=
 =?utf-8?B?MUNyVlJQS3Q1Zjc1MDBIUWtNRmtPN2IrQWFDd1Q3WDRVTGtqTlJWT1E2VlZS?=
 =?utf-8?B?cEdPWWxDN3RzNXA2UTVrT2YwREIwd0dENmErcVVXRXJNNGVPSDkvaGZZZWpL?=
 =?utf-8?B?NXhXaWRPSHRBeElGZHdzU0RTeW9maUliMVlZRUo3RjFDekxObHUzUVFOeTF5?=
 =?utf-8?B?N2VhandMZ1lITVdiQ3EzNldtTnhOWVBhWGk3WXI1YXlXZGxsUWtvT0l0SlJN?=
 =?utf-8?B?NTdYNGhmVUdDYy9ncTV3bFBqbk00ck0vZ3Y5a1grakx2MWluUDBXTWppanVL?=
 =?utf-8?B?WWlOOTdPZE92c1B4NEZ3N3J4UlJia0c2aHRQTkNzM2pyaVFvekU3d2lwd3Js?=
 =?utf-8?B?VmMxcEdobEJVd2drVzhBT3RFbTFaeit4OENQODNaNjkrVFBqZ0I3RkxpVllC?=
 =?utf-8?B?eEJNWkx2Wi90TjhRVVRDb1RLdGFlNnB0SGliTlp1ZTYrSGZSKy9maTJPc0Zt?=
 =?utf-8?Q?J16VQbDAGuEQTPuhMXbJNDsjwFlN0Z2V/jH1ABDd7I=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 094c7214-8390-4b0d-2d27-08d9aa7b576c
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5151.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2021 10:08:17.6860 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eEGDZ6b8T+UBdIiSIcSO9obVDGbqmNjZjTQaT56h0drVS4VyTmxfJAzTu+BXEtAy/iEl0pwSbt5wgIiRKmK1KQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB4285
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211118_020826_405992_506D45A8 
X-CRM114-Status: GOOD (  12.85  )
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
ZC9zb2Mvc29mL0tjb25maWcgYi9zb3VuZC9zb2Mvc29mL0tjb25maWcKaW5kZXggYjBjZGFiY2Zk
ZGU3Li5hYzM0YzMzMGNmMGMgMTAwNjQ0Ci0tLSBhL3NvdW5kL3NvYy9zb2YvS2NvbmZpZworKysg
Yi9zb3VuZC9zb2Mvc29mL0tjb25maWcKQEAgLTQyLDcgKzQyLDcgQEAgY29uZmlnIFNORF9TT0Nf
U09GX09GCiAJZGVwZW5kcyBvbiBPRiB8fCBDT01QSUxFX1RFU1QKIAloZWxwCiAJICBUaGlzIGFk
ZHMgc3VwcG9ydCBmb3IgRGV2aWNlIFRyZWUgZW51bWVyYXRpb24uIFRoaXMgb3B0aW9uIGlzCi0J
ICByZXF1aXJlZCB0byBlbmFibGUgaS5NWDggZGV2aWNlcy4KKwkgIHJlcXVpcmVkIHRvIGVuYWJs
ZSBpLk1YOCBvciBNZWRpYXRlayBkZXZpY2VzLgogCSAgU2F5IFkgaWYgeW91IG5lZWQgdGhpcyBv
cHRpb24uIElmIHVuc3VyZSBzZWxlY3QgIk4iLgogCiBjb25maWcgU05EX1NPQ19TT0ZfT0ZfREVW
CmRpZmYgLS1naXQgYS9zb3VuZC9zb2Mvc29mL3NvZi1vZi1kZXYuYyBiL3NvdW5kL3NvYy9zb2Yv
c29mLW9mLWRldi5jCmluZGV4IDg4NTQzMGE0MjIyNi4uNDEyY2JiODI0Yjg0IDEwMDY0NAotLS0g
YS9zb3VuZC9zb2Mvc29mL3NvZi1vZi1kZXYuYworKysgYi9zb3VuZC9zb2Mvc29mL3NvZi1vZi1k
ZXYuYwpAQCAtMTMsNiArMTMsNyBAQAogCiAjaW5jbHVkZSAib3BzLmgiCiAjaW5jbHVkZSAiaW14
L2lteC1vcHMuaCIKKyNpbmNsdWRlICJtZWRpYXRlay9tZWRpYXRlay1vcHMuaCIKIAogc3RhdGlj
IGNoYXIgKmZ3X3BhdGg7CiBtb2R1bGVfcGFyYW0oZndfcGF0aCwgY2hhcnAsIDA0NDQpOwpAQCAt
NTAsNiArNTEsMTUgQEAgc3RhdGljIHN0cnVjdCBzb2ZfZGV2X2Rlc2Mgc29mX29mX2lteDhtcF9k
ZXNjID0gewogCS5vcHMgPSAmc29mX2lteDhtX29wcywKIH07CiAjZW5kaWYKKyNpZiBJU19FTkFC
TEVEKENPTkZJR19TTkRfU09DX1NPRl9NVDgxOTUpCitzdGF0aWMgY29uc3Qgc3RydWN0IHNvZl9k
ZXZfZGVzYyBzb2Zfb2ZfbXQ4MTk1X2Rlc2MgPSB7CisJLmRlZmF1bHRfZndfcGF0aCA9ICJtZWRp
YXRlay9zb2YiLAorCS5kZWZhdWx0X3RwbGdfcGF0aCA9ICJtZWRpYXRlay9zb2YtdHBsZyIsCisJ
LmRlZmF1bHRfZndfZmlsZW5hbWUgPSAic29mLW10ODE5NS5yaSIsCisJLm5vY29kZWNfdHBsZ19m
aWxlbmFtZSA9ICJzb2YtbXQ4MTk1LW5vY29kZWMudHBsZyIsCisJLm9wcyA9ICZzb2ZfbXQ4MTk1
X29wcywKK307CisjZW5kaWYKIAogc3RhdGljIGNvbnN0IHN0cnVjdCBkZXZfcG1fb3BzIHNvZl9v
Zl9wbSA9IHsKIAkucHJlcGFyZSA9IHNuZF9zb2ZfcHJlcGFyZSwKQEAgLTEzMCw2ICsxNDAsOSBA
QCBzdGF0aWMgY29uc3Qgc3RydWN0IG9mX2RldmljZV9pZCBzb2Zfb2ZfaWRzW10gPSB7CiAjZW5k
aWYKICNpZiBJU19FTkFCTEVEKENPTkZJR19TTkRfU09DX1NPRl9JTVg4TSkKIAl7IC5jb21wYXRp
YmxlID0gImZzbCxpbXg4bXAtZHNwIiwgLmRhdGEgPSAmc29mX29mX2lteDhtcF9kZXNjfSwKKyNl
bmRpZgorI2lmIElTX0VOQUJMRUQoQ09ORklHX1NORF9TT0NfU09GX01UODE5NSkKKwl7IC5jb21w
YXRpYmxlID0gIm1lZGlhdGVrLG10ODE5NS1kc3AiLCAuZGF0YSA9ICZzb2Zfb2ZfbXQ4MTk1X2Rl
c2N9LAogI2VuZGlmCiAJeyB9CiB9OwotLSAKMi4yNy4wCgoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtbWVkaWF0ZWsgbWFpbGluZyBsaXN0Ckxp
bnV4LW1lZGlhdGVrQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5v
cmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tZWRpYXRlawo=
