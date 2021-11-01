Return-Path: <SRS0=DXFh=PU=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 31D73C433FE
	for <linux-mediatek@archiver.kernel.org>; Mon,  1 Nov 2021 08:01:15 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E871A61038
	for <linux-mediatek@archiver.kernel.org>; Mon,  1 Nov 2021 08:01:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org E871A61038
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Zc3/e5EeYEfeoYLT0gsTe8NjKg0vgKu7T5tupeIjBYE=; b=Rc8gvExwWEiT7S
	PNH+ns/Hfi9sAn6F7oWk3mUxWnY973m5HzzkFxwQ4rhWVemO/03dqp72mxhByCrvl4DsosSv84Kvw
	w0C9JxnkebQjCYJiJ7wBYEKalKaaE7CrdL85lzLCJddDQDN8LD+FTJ4zouER3aY6dV4a3CQ4KkveN
	2Dw407UiS01u4vnbG+8Lqt6mjcvdWjYqFQzaydYDgbb1009yedkSBKXs0pbqFlFz0kLim8z7MyH8g
	ybLlnNnzLbVuWwCQ1jH/LPrCkxoZ2wjAcZhUBXO+laTVz9nSMfS0/wSV09cDZqrPbHBlMHwS8Gcg5
	Do4wDZBbsVGeeYPoJVeg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mhSFZ-00Fbpm-7f; Mon, 01 Nov 2021 08:01:01 +0000
Received: from mail-eopbgr50044.outbound.protection.outlook.com ([40.107.5.44]
 helo=EUR03-VE1-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mhSFV-00Fbm8-Pe
 for linux-mediatek@lists.infradead.org; Mon, 01 Nov 2021 08:00:59 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QT1qf1haEsgiGtUxS9M7WGmDBOF5fot4GivfYsCj4xu9Z4tOuca/uJfrEGVvVBe8Knc7C/R3UF9xeAlC/FoRo88KiVC0r550zhquBHfw4Q0eQDJqEePPSxp1cBStk4zv+ghCZhavOLzl9wMabyCSrC+DmclihN9WPGUerw+q4n9lip2YUPtxuXjvlxQCJqGqzxRgPvNc1C6sLeZTY67+eC/t3CIxU+mRIAuZgDtksL3f3HwlUUNMpoFowCx+XDky0a5WynFut2LQGi0agxRlDTmjJ5CG4S71/RLOIn6in3OCvetF4fbu3hPmq1Pn/M4joUINzESjEWER+h9+ErlAlw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=F1LywNPRrl9Cu1ZbF82MTzYSGrbHurHEZM0KMMfh3iM=;
 b=CHGdotp6UcLU1ksq5WcHcMyK19fjKuOzS5MnM4WRdfIvR0JcA9m7MIVYAdjHo72ayHeGxtAKl/mCXJqbnY4LDDtOHCzZaHgIxEpfYU/A8HPCLYokV2o+lqLLWH//ZdKWq0OIfhvyV+7SvIBLl/Tj1kppdwiX5uzfmZddqeqchAoyQqmNGOdOlMdjpHV/G2UxDjl4i8rzBS/91zLg+R5esGC2aqj3wjK4H1dmJxY5PkSG5o+1wvqcDXsfLmASusARcPvv4C/79qTfzqZlqdFkIEeWlgw+0RMO2UAzZyT5VTsaDtsPc+1UBHax8rWlqszcP6JA1p/TWq5Q/eiok1a/Lw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com; 
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=F1LywNPRrl9Cu1ZbF82MTzYSGrbHurHEZM0KMMfh3iM=;
 b=UyUS4FDKPmGykZGEGfmsrcWMaOZl7/uywMzSYVqUZ5YPpQdE3heWMCWUXeTiX7m/LklBv5CZNjHc27YMjPGpoBQWZuAw4+zKLTk5UeHbQBfHhKMfYHA9hEnnetTeL8jI943VOO6Ebcp1VdvQr96K6W43vYHElM8BiBwVw6Xy/O4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from VI1PR04MB5151.eurprd04.prod.outlook.com (2603:10a6:803:61::28)
 by VI1PR0401MB2430.eurprd04.prod.outlook.com (2603:10a6:800:2b::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4649.15; Mon, 1 Nov
 2021 08:00:53 +0000
Received: from VI1PR04MB5151.eurprd04.prod.outlook.com
 ([fe80::85af:f8be:aa99:ba5f]) by VI1PR04MB5151.eurprd04.prod.outlook.com
 ([fe80::85af:f8be:aa99:ba5f%3]) with mapi id 15.20.4649.019; Mon, 1 Nov 2021
 08:00:53 +0000
From: Daniel Baluta <daniel.baluta@oss.nxp.com>
To: broonie@kernel.org,
	alsa-devel@alsa-project.org
Cc: peter.ujfalusi@linux.intel.com, ranjani.sridharan@linux.intel.com,
 guennadi.liakhovetski@linux.intel.com, daniel.baluta@gmail.com,
 linux-mediatek@lists.infradead.org, kai.vehmanen@linux.intel.com,
 lgirdwood@gmail.com, pierre-louis.bossart@linux.intel.com,
 YC Hung <yc.hung@mediatek.com>, Daniel Baluta <daniel.baluta@nxp.com>
Subject: [PATCH 4/6] ASoC: SOF: mediatek: Add fw loader and mt8195 dsp ops to
 load firmware
Date: Mon,  1 Nov 2021 10:00:24 +0200
Message-Id: <20211101080026.297360-5-daniel.baluta@oss.nxp.com>
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
 Transport; Mon, 1 Nov 2021 08:00:51 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b3df016d-f463-4392-e28f-08d99d0db9ed
X-MS-TrafficTypeDiagnostic: VI1PR0401MB2430:
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-Microsoft-Antispam-PRVS: <VI1PR0401MB2430EEBBBB8AD62A8E6C8473B88A9@VI1PR0401MB2430.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1332;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: r9ke5Ptk5URX2ffJhAbv3FyoXA1BrUNXyUe8tUuS/P6u1Bri1cVGMvjB1pedLfW62ZnPiCEpHIsT6qObRJ6qVyY9K87kUsA0/fZSwwBn5UBRjaEDkETgbSx3bV5Ql/KFuvBqA+TV7xiJTOb7tLoqd3lMT+8XYTWkqUbnckC7LcKrxGzGZnf2doHjoUnv9YjJj/gQ2JaCzXbIJEad2379zR1OXZHdj38cS7gB7iEnLrLeElCAw1y4u+eSDmPoB2vE6y7Ngbyq7TQYOz2q5HSNiMBlO8Fuv/i1HoF3XRqNpFM2YOofzbn4ibFGVpKk8ke+BEaq/J/W6K1cSSLJ8xmI9ecIZ59zT0FeAvtLuXBfb6/e24rU3mMWPRlyX4atVwfqFjKkF++aYdbsonA56jNTmbvU29U2n7j9jY5XFE7ZvrdJ6GY4Gzy4oly+M6Xxme4+k4bq5lJ0+pzikVp1JTczhDD5bieFX90SnV+iYPAuFnaJFsg7a2oYZDatFTH/zSRpgN3tb/sgX7rNCnieLJuClKeLY3YWa8NfZIqhWkrBUvCoHN7py6JagexboXJkJgL46+7e2TY2VcFpXgbyRKb+ftJwuyv/lcW0Imoo9uoLYVKDHXMGjjKlHZ45kf3LilH1KKvaQhqhlbcvzn42aBLa8w==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR04MB5151.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(316002)(8676002)(508600001)(54906003)(6486002)(8936002)(6506007)(1076003)(5660300002)(66574015)(83380400001)(52116002)(6666004)(44832011)(6512007)(66476007)(2906002)(7416002)(2616005)(66946007)(38100700002)(186003)(86362001)(66556008)(4326008);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?LytLZkQ1RU1OTzg3MnJNbUF4WHRJNGpPakJROUNONzc4TWxpYU5DeE9OaTNS?=
 =?utf-8?B?aUU4Q21DQWZWcm44b1pBYmpaVkpvNzljYlFDTFFrV0lRVGsva1VhRHNIYSsz?=
 =?utf-8?B?WlFYc3A0QjcyMDFvbWRjQ1hrYUlJU1h0TGJIajRZZ0hZM04rS0RXRTNLZ0RF?=
 =?utf-8?B?MUdjYytXMS9BTUxuSlJpdjN1b0krVWUrWmhoelRlOG55NHo3aHltTUpkbHht?=
 =?utf-8?B?Mk16amEraSt1ai9xSlBWcm5yK0lVMnFOOGE5Z2NLaXpwbGRnZ0xyTmlXZ1ZH?=
 =?utf-8?B?SHRORUxCcFVGLy9mc2I2OTBmTlNDVlhjQS9FbmpoN0NsaXV3RTJ4YTd5eW1t?=
 =?utf-8?B?YmRhb1JpS0RNcUp5Q3FRWkYwTWR6b0JCaHdIQXA2dE1YZFFqNlRyVWVjb0pK?=
 =?utf-8?B?Q09XWkhIYnFlM2VIY3BSajZKc3JWdVFzeGNXa212RWw0Z3JoNncyZGNNTE9O?=
 =?utf-8?B?UDZ2TVE0WU9Dd3VOTGxMTFlwVnMxZDAySnp1OUVJUGdVZWdqS3VuQlFrYjFj?=
 =?utf-8?B?SitIN0VCb3d6QzdhVCs5ZTMxUTcwMmJiWHNQdTQ3Yk5pcHZrbktxSi9VTFBn?=
 =?utf-8?B?cG5DVlovZTFTOGlWaFJwbUtUSmpTUmFPR1hLczNBbDY2UDdvQlBDNWZZL3pk?=
 =?utf-8?B?M3FacDNGVWFQOW9qKzh5WTJSUGtNOWxubFFLaTErL3VyQS9hR1JBWGY5SGRI?=
 =?utf-8?B?YnpYc096ZnFpNVF4LzJNckhhNGRMQnVTT1lmVjMzaHFtb0JROGo4WjR2VXpa?=
 =?utf-8?B?RUxaUU85RVFHQ3JUcDcxZFZCTXJrYS9NOENMZUhlOHNZVlFaUzdaNUcvTGJz?=
 =?utf-8?B?THRVUFJiZU1vMElOWnVCeisvZndxdHBOd0lwbDdQcVZoUDA3NmZhMXhqVCtC?=
 =?utf-8?B?R2NwRkVrejZLL3M0OGhESnpjeGhiUEY4SllTVlFrV2RUN01aYjh2b3V4a0V1?=
 =?utf-8?B?U1lSd1J1TEsxUUtXdFBOdVJVSGhTcC94SUNEdU1VTzFhWnlPOHJEN3BkTmMx?=
 =?utf-8?B?MjdjdmtONDBTVFl1Y24yMlluaUpsN1FiSkNLVW1mMVZTeWErYmZwdXJzTUhq?=
 =?utf-8?B?Y3U2OFV1UmVTRWY0bTFRNUlRTnlMUEc3alg2SmVUR29uM1RoN2l6RE1yN3Fr?=
 =?utf-8?B?RkFmRisyRmlLUFJ1OTgrZkIvSUg2cXduc0xTMzdwWmN3cVJGWjNoQUswVCtF?=
 =?utf-8?B?Q3BIWmwxbEE4ckZnakxHQ25nTi9sWElGM21VWUhOUENqUys2K1E5WUdxRFBj?=
 =?utf-8?B?bWdtUGYxdmMxZFptbEEwZEtQT3hqMmRlUlRCOUxXT25IUG90OXVOb1VKRU95?=
 =?utf-8?B?WFFLcjB0OUVmd2JhYStrbE45aW1HWkY2RjVGc2dtYjdSckx0Zi9lclQvTk9l?=
 =?utf-8?B?Z3VScUtMK25zQVpMTVlhaStyR1RrRnRWUVd1NTBUL2pNaFdiSkVWVEE3Y0hw?=
 =?utf-8?B?OEM5RTNvbXhGN0Qrc3EwbUFrUmVPTHh5dmpZZTVaUDcyaUZnRlBvc2ZjeGRU?=
 =?utf-8?B?Q21SR1NMMGNvcVQxTHUrVE9rSytTcWQxOEhaYmNhM2NZL2FRL1FsSXlaZU8x?=
 =?utf-8?B?VUFrQktTc0VJdEI2d3FBMU0vQS9jZi9uSEhrSkFKT3IzdUZwMy80RUJJK21Z?=
 =?utf-8?B?QTZyOStJM2o5WDFoRXBDRC9jVTc1eU5WcWlramUzUnBKUUlnUUZpRi82UVgw?=
 =?utf-8?B?alpNRExGOWUxSVFIUk1DbGNYejhUUGxtSkF3VnA2aVNPamhIR0pzbkE5OE56?=
 =?utf-8?B?Z2xqbnFjSE1kK0hqdWg2Vk1ZU2NGWjZFbmJaTWVXRXhVOVBhWDRUNzRETDJB?=
 =?utf-8?B?OFhvcVhEN0ZVcUg4SjM0M3FqZzk3dVJkQnpzNnZkVk55RUJIUHlIcjdVQU9C?=
 =?utf-8?B?OVJFV3pna2NDWi9qeXBoeENpQnNVcWZWTXR1eDBhNGpBRmR4N05ERkM1TDNB?=
 =?utf-8?B?ekJpTURmRjlieWgrNXNNWG0veFR4c0o1RTA0RGt3T0Vwa3QvTDk2U3gxVDZ3?=
 =?utf-8?B?dko4RWttR2pFd2FnOXVBM0FBNlBXRWM0eFV0cStIMzE0V2JMblFxdzB0UTkw?=
 =?utf-8?B?YXBZN1FvYytoU2Q1REROQW9XTU9FdEJnRUo1NDBjdGljMTl1K3BzZEFOSnpl?=
 =?utf-8?B?UXNxeUo4b1l1eXB5R0x1SWpnMGFKVVFERUUvZ0NnNDFBa2hRMVVadm1pUWdu?=
 =?utf-8?B?UkxwSUk5bmhVL0htbWdEYjdTbkRURi8xMVlHWVgzaVU0NXRqTTZNeWpESjY4?=
 =?utf-8?B?NHBVUGtXbkl5NEJ1V0VyTHVmQlhvZG5BZ2JiZUpqTFFRN3RaVVZaVXRiMDhO?=
 =?utf-8?Q?xbeip03GKfIwk3VNOJ?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b3df016d-f463-4392-e28f-08d99d0db9ed
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5151.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Nov 2021 08:00:53.0735 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mZFXN04+v44lk3ZhJfuC1bmu7viMCNOTaBQfcsaS1bB8ZFAdpO8owhix30AHAUF/y8EimdVkarS+uGcYPGkUoQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0401MB2430
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211101_010057_884463_50FB21CE 
X-CRM114-Status: GOOD (  16.95  )
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
YWtob3ZldHNraSA8Z3Vlbm5hZGkubGlha2hvdmV0c2tpQGxpbnV4LmludGVsLmNvbT4KU2lnbmVk
LW9mZi1ieTogRGFuaWVsIEJhbHV0YSA8ZGFuaWVsLmJhbHV0YUBueHAuY29tPgotLS0KIHNvdW5k
L3NvYy9zb2YvbWVkaWF0ZWsvbXQ4MTk1L01ha2VmaWxlICAgICAgICB8ICAyICstCiBzb3VuZC9z
b2Mvc29mL21lZGlhdGVrL210ODE5NS9tdDgxOTUtbG9hZGVyLmMgfCA1NiArKysrKysrKysrKysr
KysrKysrCiBzb3VuZC9zb2Mvc29mL21lZGlhdGVrL210ODE5NS9tdDgxOTUuYyAgICAgICAgfCAg
OCArKysKIHNvdW5kL3NvYy9zb2YvbWVkaWF0ZWsvbXQ4MTk1L210ODE5NS5oICAgICAgICB8ICAz
ICsKIDQgZmlsZXMgY2hhbmdlZCwgNjggaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQogY3Jl
YXRlIG1vZGUgMTAwNjQ0IHNvdW5kL3NvYy9zb2YvbWVkaWF0ZWsvbXQ4MTk1L210ODE5NS1sb2Fk
ZXIuYwoKZGlmZiAtLWdpdCBhL3NvdW5kL3NvYy9zb2YvbWVkaWF0ZWsvbXQ4MTk1L01ha2VmaWxl
IGIvc291bmQvc29jL3NvZi9tZWRpYXRlay9tdDgxOTUvTWFrZWZpbGUKaW5kZXggYmYyM2Q4OGRi
ODI4Li42MGZjYTI0YzA2OGEgMTAwNjQ0Ci0tLSBhL3NvdW5kL3NvYy9zb2YvbWVkaWF0ZWsvbXQ4
MTk1L01ha2VmaWxlCisrKyBiL3NvdW5kL3NvYy9zb2YvbWVkaWF0ZWsvbXQ4MTk1L01ha2VmaWxl
CkBAIC0xLDQgKzEsNCBAQAogIyBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogKEdQTC0yLjAtb25s
eSBPUiBCU0QtMy1DbGF1c2UpCi1zbmQtc29mLW10ODE5NS1vYmpzIDo9IG10ODE5NS5vCitzbmQt
c29mLW10ODE5NS1vYmpzIDo9IG10ODE5NS5vIG10ODE5NS1sb2FkZXIubwogb2JqLSQoQ09ORklH
X1NORF9TT0NfU09GX01UODE5NSkgKz0gc25kLXNvZi1tdDgxOTUubwogCmRpZmYgLS1naXQgYS9z
b3VuZC9zb2Mvc29mL21lZGlhdGVrL210ODE5NS9tdDgxOTUtbG9hZGVyLmMgYi9zb3VuZC9zb2Mv
c29mL21lZGlhdGVrL210ODE5NS9tdDgxOTUtbG9hZGVyLmMKbmV3IGZpbGUgbW9kZSAxMDA2NDQK
aW5kZXggMDAwMDAwMDAwMDAwLi5lZDE4ZDYzNzllOTIKLS0tIC9kZXYvbnVsbAorKysgYi9zb3Vu
ZC9zb2Mvc29mL21lZGlhdGVrL210ODE5NS9tdDgxOTUtbG9hZGVyLmMKQEAgLTAsMCArMSw1NiBA
QAorLy8gU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IChHUEwtMi4wLW9ubHkgT1IgQlNELTMtQ2xh
dXNlKQorLy8KKy8vIENvcHlyaWdodCAoYykgMjAyMSBNZWRpYXRlayBDb3Jwb3JhdGlvbi4gQWxs
IHJpZ2h0cyByZXNlcnZlZC4KKy8vCisvLyBBdXRob3I6IFlDIEh1bmcgPHljLmh1bmdAbWVkaWF0
ZWsuY29tPgorLy8KKy8vIEhhcmR3YXJlIGludGVyZmFjZSBmb3IgbXQ4MTk1IERTUCBjb2RlIGxv
YWRlcgorCisjaW5jbHVkZSA8c291bmQvc29mLmg+CisjaW5jbHVkZSAibXQ4MTk1LmgiCisjaW5j
bHVkZSAiLi4vLi4vb3BzLmgiCisKK3ZvaWQgc29mX2hpZml4ZHNwX2Jvb3Rfc2VxdWVuY2Uoc3Ry
dWN0IHNuZF9zb2ZfZGV2ICpzZGV2LCB1MzIgYm9vdF9hZGRyKQoreworCS8qIEFEU1AgYm9vdHVw
IGJhc2UgKi8KKwlzbmRfc29mX2RzcF93cml0ZShzZGV2LCBEU1BfUkVHX0JBUiwgRFNQX0FMVFJF
U0VUVkVDLCBib290X2FkZHIpOworCisJLyogcHVsbCBoaWdoIFJ1blN0YWxsIChzZXQgYml0MyB0
byAxKSAqLworCXNuZF9zb2ZfZHNwX3VwZGF0ZV9iaXRzKHNkZXYsIERTUF9SRUdfQkFSLCBEU1Bf
UkVTRVRfU1csCisJCQkJQURTUF9SVU5TVEFMTCwgQURTUF9SVU5TVEFMTCk7CisKKwkvKiBwdWxs
IGhpZ2ggU3RhdFZlY3RvclNlbCB0byB1c2UgQWx0UmVzZXRWZWMgKHNldCBiaXQ0IHRvIDEpICov
CisJc25kX3NvZl9kc3BfdXBkYXRlX2JpdHMoc2RldiwgRFNQX1JFR19CQVIsIERTUF9SRVNFVF9T
VywKKwkJCQlEU1BfUkVTRVRfU1csIERTUF9SRVNFVF9TVyk7CisKKwkvKiB0b2dnbGUgIERSZXNl
dCAmIEJSZXNldCAqLworCS8qIHB1bGwgaGlnaCBEUmVzZXQgJiBCUmVzZXQgKi8KKwlzbmRfc29m
X2RzcF91cGRhdGVfYml0cyhzZGV2LCBEU1BfUkVHX0JBUiwgRFNQX1JFU0VUX1NXLAorCQkJCUFE
U1BfQlJFU0VUX1NXIHwgQURTUF9EUkVTRVRfU1csCisJCQkJQURTUF9CUkVTRVRfU1cgfCBBRFNQ
X0RSRVNFVF9TVyk7CisKKwkvKiBwdWxsIGxvdyBEUmVzZXQgJiBCUmVzZXQgKi8KKwlzbmRfc29m
X2RzcF91cGRhdGVfYml0cyhzZGV2LCBEU1BfUkVHX0JBUiwgRFNQX1JFU0VUX1NXLAorCQkJCUFE
U1BfQlJFU0VUX1NXIHwgQURTUF9EUkVTRVRfU1csCisJCQkJMCk7CisKKwkvKiBFbmFibGUgUERl
YnVnICovCisJc25kX3NvZl9kc3BfdXBkYXRlX2JpdHMoc2RldiwgRFNQX1JFR19CQVIsIERTUF9Q
REVCVUdCVVMwLAorCQkJCVBERUJVR19FTkFCTEUsCisJCQkJUERFQlVHX0VOQUJMRSk7CisKKwkv
KiByZWxlYXNlIFJ1blN0YWxsIChzZXQgYml0MyB0byAwKSAqLworCXNuZF9zb2ZfZHNwX3VwZGF0
ZV9iaXRzKHNkZXYsIERTUF9SRUdfQkFSLCBEU1BfUkVTRVRfU1csCisJCQkJQURTUF9SVU5TVEFM
TCwgMCk7Cit9CisKK3ZvaWQgc29mX2hpZml4ZHNwX3NodXRkb3duKHN0cnVjdCBzbmRfc29mX2Rl
diAqc2RldikKK3sKKwkvKiBDbGVhciB0byAwIGZpcnN0bHkgKi8KKwlzbmRfc29mX2RzcF93cml0
ZShzZGV2LCBEU1BfUkVHX0JBUiwgRFNQX1JFU0VUX1NXLCAweDApOworCisJLyogUlVOX1NUQUxM
IHB1bGwgaGlnaCBhZ2FpbiB0byByZXNldCAqLworCXNuZF9zb2ZfZHNwX3VwZGF0ZV9iaXRzKHNk
ZXYsIERTUF9SRUdfQkFSLCBEU1BfUkVTRVRfU1csCisJCQkJQURTUF9SVU5TVEFMTCwgQURTUF9S
VU5TVEFMTCk7Cit9CisKZGlmZiAtLWdpdCBhL3NvdW5kL3NvYy9zb2YvbWVkaWF0ZWsvbXQ4MTk1
L210ODE5NS5jIGIvc291bmQvc29jL3NvZi9tZWRpYXRlay9tdDgxOTUvbXQ4MTk1LmMKaW5kZXgg
OTQ1NjAxYTBkYzM3Li44OGRhNmMyZGUwNzAgMTAwNjQ0Ci0tLSBhL3NvdW5kL3NvYy9zb2YvbWVk
aWF0ZWsvbXQ4MTk1L210ODE5NS5jCisrKyBiL3NvdW5kL3NvYy9zb2YvbWVkaWF0ZWsvbXQ4MTk1
L210ODE5NS5jCkBAIC0zMDUsNiArMzA1LDkgQEAgY29uc3Qgc3RydWN0IHNuZF9zb2ZfZHNwX29w
cyBzb2ZfbXQ4MTk1X29wcyA9IHsKIAkucHJvYmUJCT0gbXQ4MTk1X2RzcF9wcm9iZSwKIAkucmVt
b3ZlCQk9IG10ODE5NV9kc3BfcmVtb3ZlLAogCisJLyogRFNQIGNvcmUgYm9vdCAqLworCS5ydW4J
CT0gbXQ4MTk1X3J1biwKKwogCS8qIEJsb2NrIElPICovCiAJLmJsb2NrX3JlYWQJPSBzb2ZfYmxv
Y2tfcmVhZCwKIAkuYmxvY2tfd3JpdGUJPSBzb2ZfYmxvY2tfd3JpdGUsCkBAIC0zMTgsNiArMzIx
LDExIEBAIGNvbnN0IHN0cnVjdCBzbmRfc29mX2RzcF9vcHMgc29mX210ODE5NV9vcHMgPSB7CiAJ
LyogbWlzYyAqLwogCS5nZXRfYmFyX2luZGV4CT0gbXQ4MTk1X2dldF9iYXJfaW5kZXgsCiAKKwkv
KiBtb2R1bGUgbG9hZGluZyAqLworCS5sb2FkX21vZHVsZQk9IHNuZF9zb2ZfcGFyc2VfbW9kdWxl
X21lbWNweSwKKwkvKiBmaXJtd2FyZSBsb2FkaW5nICovCisJLmxvYWRfZmlybXdhcmUJPSBzbmRf
c29mX2xvYWRfZmlybXdhcmVfbWVtY3B5LAorCiAJLyogRmlybXdhcmUgb3BzICovCiAJLmRzcF9h
cmNoX29wcyA9ICZzb2ZfeHRlbnNhX2FyY2hfb3BzLAogCmRpZmYgLS1naXQgYS9zb3VuZC9zb2Mv
c29mL21lZGlhdGVrL210ODE5NS9tdDgxOTUuaCBiL3NvdW5kL3NvYy9zb2YvbWVkaWF0ZWsvbXQ4
MTk1L210ODE5NS5oCmluZGV4IDQ4Y2JiYjVhYWNiNS4uOTI5NDI0MTgyMzU3IDEwMDY0NAotLS0g
YS9zb3VuZC9zb2Mvc29mL21lZGlhdGVrL210ODE5NS9tdDgxOTUuaAorKysgYi9zb3VuZC9zb2Mv
c29mL21lZGlhdGVrL210ODE5NS9tdDgxOTUuaApAQCAtMTAsNiArMTAsNyBAQAogI2RlZmluZSBf
X01UODE5NV9ICiAKIHN0cnVjdCBtdGtfYWRzcF9jaGlwX2luZm87CitzdHJ1Y3Qgc25kX3NvZl9k
ZXY7CiAKICNkZWZpbmUgRFNQX1JFR19CQVNFCQkJMHgxMDgwMzAwMAogI2RlZmluZSBTQ1BfQ0ZH
UkVHX0JBU0UJCQkweDEwNzI0MDAwCkBAIC0xNTIsNCArMTUzLDYgQEAgc3RydWN0IG10a19hZHNw
X2NoaXBfaW5mbzsKICNkZWZpbmUgRFJBTV9SRU1BUF9TSElGVAkxMgogI2RlZmluZSBEUkFNX1JF
TUFQX01BU0sJCShCSVQoRFJBTV9SRU1BUF9TSElGVCkgLSAxKQogCit2b2lkIHNvZl9oaWZpeGRz
cF9ib290X3NlcXVlbmNlKHN0cnVjdCBzbmRfc29mX2RldiAqc2RldiwgdTMyIGJvb3RfYWRkcik7
Cit2b2lkIHNvZl9oaWZpeGRzcF9zaHV0ZG93bihzdHJ1Y3Qgc25kX3NvZl9kZXYgKnNkZXYpOwog
I2VuZGlmCi0tIAoyLjI3LjAKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpMaW51eC1tZWRpYXRlayBtYWlsaW5nIGxpc3QKTGludXgtbWVkaWF0ZWtAbGlz
dHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2xpbnV4LW1lZGlhdGVrCg==
