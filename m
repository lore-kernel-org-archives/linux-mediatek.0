Return-Path: <SRS0=DXFh=PU=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 26735C433F5
	for <linux-mediatek@archiver.kernel.org>; Mon,  1 Nov 2021 08:01:19 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E1C5660F70
	for <linux-mediatek@archiver.kernel.org>; Mon,  1 Nov 2021 08:01:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org E1C5660F70
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JRunhZDe2AAQl5tETYNngZbx5bJvecoPks9Z5PVdx7k=; b=H2zrGZa2jASz/T
	ruLsy2MXp9aEncu3zA1LLpWMpBKK2cBoOjFDdr7BTlkZ1FITSCBnQKz3zeOEqKZjJab6Tjb8HRJmY
	A4HDBxm8jKbQHW0KDAnB1y9uayA0xHew4gnGkO28n83R0VPUWfdaWcMGy92h6E011OnEhCdWWHWSV
	zHL0mwT+x2ZD9gN3EtcaxtatOa/EBSkQF/xPqaodoT7+5c1yrxNa18oAUEblHc29l8Lt9yk8Lh1Wc
	YMc1XfMT3pnqpMmydDAFXCpTGsVW13GlgSbXsekb65tmojlYTVARuHXKnTAQvxGpopIlAfkWV6eZ2
	5QzqYTT+pethUcBJS60w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mhSFf-00FbsG-TG; Mon, 01 Nov 2021 08:01:07 +0000
Received: from mail-eopbgr50044.outbound.protection.outlook.com ([40.107.5.44]
 helo=EUR03-VE1-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mhSFZ-00Fbm8-G0
 for linux-mediatek@lists.infradead.org; Mon, 01 Nov 2021 08:01:02 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kQw8agy4ZZ3AsGzBYBm+glKt265e0t+VTnPQlisKHixy3EC8462M7RqCX3ofNz7Lz2IbwYrrTiKCRGw4Owx/zTZKTCOZTThqH+9Y92u+sw6JHuUavp1JaEErD0Pglbj2y2zTQgUm/Iutcoril1exKfqPnALE8R0bq19yR0Ddyq2UehoFRG+LBSICv6CZxiYTnTC1f5/hWb4RTIMx9n6BEnHObgjvdnvdp66IIclU5iNTseQJ0c6NXRpW/mfIVyBkxGVqCzDrU0AdxxnwcokJXfvBqGIR/nELAdfS2P4vfbdOscmG7RN5EdVx2+fOGajY+6tfj9fFGvwt5lbijedNHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1q71ZX0OhL93dqzfgutAr7YL9qPpnE4lAhTciqDhHtA=;
 b=OLk8ZlPRcQP2ctavDyCyTo3x39oG/84dB8805GjsWVlV+mHPIVqGPJGMMej8pO/nBSvpP+BgQw+6CJUgpSFDZ4AhECrDn89lBaW4Vv7LPeyH20z56KT7xeQrxI7CzrShTmb2inekPsTJAhW9AaIAX/309NQ/TLAg4zIo6ByDr2AzoBMxcRluEY5fOBAK7EgtCv3XjnbXvQy6B2LRyUDFRPmu4MEyj3fdi22tI7iAeeWRlySk4wcQ64Kb0gfvXUy8FIdD6YRs/5xAbDWNmLKyLMGYiXyEd5uaum2U8Q+ifaNw0Llg2O33YOYL6Nlehky/u3wItJAoC3PMpo16cey04g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com; 
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1q71ZX0OhL93dqzfgutAr7YL9qPpnE4lAhTciqDhHtA=;
 b=CWr5eVfLgLe2EzoESluDzrj1MbcjhTq2OR8eMii1mw88UO11XTWBgpEN1eWUW27PD3s/VK+32OL6dhZR55tbjgAtdpS4b/nnGkYBbObOjp4g1210ufTk0PVvkm8WfhXrc4ZmksVTxL7gjDOLdlwagsKPFriXbzV/ibgYvrWgQi0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from VI1PR04MB5151.eurprd04.prod.outlook.com (2603:10a6:803:61::28)
 by VI1PR0401MB2430.eurprd04.prod.outlook.com (2603:10a6:800:2b::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4649.15; Mon, 1 Nov
 2021 08:00:56 +0000
Received: from VI1PR04MB5151.eurprd04.prod.outlook.com
 ([fe80::85af:f8be:aa99:ba5f]) by VI1PR04MB5151.eurprd04.prod.outlook.com
 ([fe80::85af:f8be:aa99:ba5f%3]) with mapi id 15.20.4649.019; Mon, 1 Nov 2021
 08:00:56 +0000
From: Daniel Baluta <daniel.baluta@oss.nxp.com>
To: broonie@kernel.org,
	alsa-devel@alsa-project.org
Cc: peter.ujfalusi@linux.intel.com, ranjani.sridharan@linux.intel.com,
 guennadi.liakhovetski@linux.intel.com, daniel.baluta@gmail.com,
 linux-mediatek@lists.infradead.org, kai.vehmanen@linux.intel.com,
 lgirdwood@gmail.com, pierre-louis.bossart@linux.intel.com,
 YC Hung <yc.hung@mediatek.com>, Daniel Baluta <daniel.baluta@nxp.com>
Subject: [PATCH 6/6] ASoC: SOF: mediatek: Add dai driver dsp ops callback for
 mt8195
Date: Mon,  1 Nov 2021 10:00:26 +0200
Message-Id: <20211101080026.297360-7-daniel.baluta@oss.nxp.com>
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
 Transport; Mon, 1 Nov 2021 08:00:54 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: fc06250b-86bd-4c82-9f66-08d99d0dbbbf
X-MS-TrafficTypeDiagnostic: VI1PR0401MB2430:
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-Microsoft-Antispam-PRVS: <VI1PR0401MB24301E8B0405C2D7583B3BB0B88A9@VI1PR0401MB2430.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1284;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: gixH+zPFUGQLFOeNwssajxmTA1CXsBuw6Mon77w2JOxxZ82wBqZsx+/oWq5fVVNhA5jsSh1PhLQfIN3GQ9T5JhZBgi3uPWu37tse0mG5PAlzVsjizDZqx4EjkJQcpOmQJi6d+ztz7Oq3tcOqdKStmDNQSq9xP19uPjjcksZ01DrA9R2+6BbUxfnAs0yP3ieGVstrFpk2IKJs+lOoct1ceCZ/0kOU+iF1nI9thXMjXgA+qc4Vq7hyEvSsPWhu+75zWFR+s7H3TzD/yCBEAf7L2U6V62AAMnhfMQgSWUJTAq90nYB++70I/2GnXSCpZHdCiK2GdgN6WVsHSHZRaZKQp4iIoQjbakRKrgGSTb3PNpjHpoD8xWjExwQg4u7TM/kN62WKOVHNCc8wLXD8F0WC8irFQ/s052ez4S1hD8EuwB3HvkJC+yC+GTdbyGnP+kWX0iHcPHnthPASh4RSfdevdxuptWEhuKG3RDUQrYhoUvxoTJrSpnpO2cBrOUqnSpmIDXENEiHUF5Afr66xfdNpT7rUf5sncdyJ8NTGJijnzZ1FvhE3SeB2jFePkvXYoIULq9tamwE+3EC9Ily/UiRn5v7l/WpKk50yLUQhONHStV/J9tCO/wp8T8gfGxjay+mj+v9pFsah8GCp/0+w4y42NA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR04MB5151.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(316002)(8676002)(508600001)(54906003)(6486002)(8936002)(6506007)(1076003)(5660300002)(52116002)(6666004)(44832011)(6512007)(66476007)(2906002)(7416002)(2616005)(66946007)(38100700002)(186003)(86362001)(66556008)(4326008);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MTJvc1RCOHE4cGFSQTBTOVdIMkRVZ3dmVzhhTlYyZ282eVhGYkxNUWxaenZo?=
 =?utf-8?B?QWZRTlAxbThLOHVKN3Z2TTNwQ0VGSXhmSHFEM1VLbWxZYUhJaU1ZR2xURHZy?=
 =?utf-8?B?cGxJRllpY2lHTlhFZVI0aWFMWURnU1VRZXNlVnd4VjFGNXpNejMyOEJyWUVi?=
 =?utf-8?B?bGdNY3pITzhSbCtRWXMyS1VQRFRYeDJCNXBiYk5BUUNPZ2F0VndYNE4rSjEx?=
 =?utf-8?B?K2VMSmdJR2toN09vOEJCZXh1SzVUaE9UTXZhZ3o2dVpzZnRXencwSmg3YXk4?=
 =?utf-8?B?QmhGK3dtMDdqK3VHOUlYdzJ2Q3hsbFZRQWNtaXVzVWlkaXBGRXdVd2QrWjY5?=
 =?utf-8?B?dEErdXg0NjhBN1k2S0VRVXNpSHRPWDZrNmoxUDJjS2hkY1k4cGZqUGMzeHNa?=
 =?utf-8?B?MmFuMjN1VXJseUhVMFUrU1dPc1hjN1k3K1ZncytacHRpcC9DTUlqUm9yaFFU?=
 =?utf-8?B?RzFMaThQeDA0Z29ha2ZwNHhoVngraWVKQUNQRU9aajVwNXoxT3ZIcUFYYkg0?=
 =?utf-8?B?ZTR4NDlwWXZkNjBOMUsxM1dGOGpVMXorZmUxWFVWdHRaVUFoNzgrVS92RUFK?=
 =?utf-8?B?ODVVL1NoaW84ZWNhbHFqWE9ZN1RSbExvUkErYThqQXpyVUZxR0RZT2s0Sjk4?=
 =?utf-8?B?V0dkaGw3L3paTnVXMmcxNHpyYjRzVFcrZWRGTTZGb1pwQ1lIUzA3Ky9zdXdU?=
 =?utf-8?B?OFN0N3dCWUZhSXZ2cW5ZQUhyTFVBYXFvRHJMSCtSeHVvV1JQUURhY3NmVFBC?=
 =?utf-8?B?QThtZkdVRkdhdHY2dndnY1F6ejhKWDJNN2VKSE14ZThOZlcwNlBrWGVwR3Nr?=
 =?utf-8?B?R1NkQkNlVmhKS2VmamIxR0daVjN0RnZaMlhKQ0JXUktyNkNPQ1c4d3BRQk1O?=
 =?utf-8?B?K3VpdFhJOW9GK2YwMEgxdW5XMUVyRFVrVi9FOXZQUFNDV3k5Y004MGpoSm1m?=
 =?utf-8?B?OU1OSFQrNEVJMGF5WllwOG5YOXVBTDBldVdmRnZRVkNlcGJ1ZjFTbTNzNmdV?=
 =?utf-8?B?RWNCd0JzWTc0Q3V4dHVtdlVPSlpUUWlWZzZ1VnBkTUJ4U3VyTHpORTF4aExG?=
 =?utf-8?B?cEJGdTZHMzZuU1VnT1UvaWNmaXdZYWtHY25qVmR0UXplbEdFRFczdlBXYnZq?=
 =?utf-8?B?VHZiUEtpQ0MvRkVpRUhRSk9YZ0VDQ0NqTVEvMnNFUHVLYzhWSld3R3VFZWtw?=
 =?utf-8?B?NFJNcVJrdVNxYS9JY1g5eVlXRDlyK3JWWWszZU4zekRZSmQ4YzFTdmdpSUpW?=
 =?utf-8?B?VWxYWmVGUGozSDd5NUZqV2MzWFFwQ2FnbUx5cGhrcWZpdUhoeUJUc2pyd2w4?=
 =?utf-8?B?eWtMMitwR2JIYitEalVzQ01sME82SHhtNWFFQ2xrMk9VSUUvY3ZMYXJLOEpR?=
 =?utf-8?B?cnVTODk5QkdtL0VrSm8veEozanNvRUhmZlM3dUJtcnF3MUkxMTRLbHV0Mlls?=
 =?utf-8?B?SVpGNDhlTU9NZVowbHl2bENhTDJsUk9hQVA1em11Qi9Oa3NYa3hSSDlVNE5y?=
 =?utf-8?B?b083NjNudyt4STBvTHhHK2ozR1ltQVBheEtPODNlZ3d2WTE0VWY5SkRjbThm?=
 =?utf-8?B?Z2UzbVgvU2RrcUdsU01RNHJqVlgvMU9tT3JEY2xMOUdDd0NvY3VBZkZ0NS9k?=
 =?utf-8?B?T1hraGFLdGFSWkkxZmNhMWJiQ1dCR3Q3MGRGNXMrSzQvdGwrWVdBanpDQmVC?=
 =?utf-8?B?OEVKaGxERnRJVG5BUjFJc3ZpSlEyZzlkZkhmVWo0MTNsVkhmK3lkcmpqOE51?=
 =?utf-8?B?ZDd4dzNXakptZm9VbVRib2RsbVRZdVA2cEhOMHVmdVdDK1dlWWZGbTE2a1lY?=
 =?utf-8?B?Q1dtTzdzbFV6bkJJbk41anBSZVFrVk4wTWUyRUxMcXhRSnBrOGZURXlTOU9Y?=
 =?utf-8?B?RlpVc0orWmw0d21nNHhXYVlkdWUvM0x5b25heDUxck5rN3ZBS2NLbXpSTWV4?=
 =?utf-8?B?amhzNEdQOG9URFVzbFJFUkV2dnJ5U1YwaGJQQUhPMkFsT3duN2RUc3NmN2lC?=
 =?utf-8?B?QjN6Q010Q0QvZURBNktsaDYwSXY4U29hRHE0VE9ZTXEvOGpyLzlnS0x5NWpF?=
 =?utf-8?B?emFMN3pWbTNCbkNRT2FobHA2bEJNMmppaEM4NzZOcUdzQTdJVnh2TkVNQXps?=
 =?utf-8?B?ZXlBS2RyY0tTT2xZMlZyRDc0cEJpZ2RBWGZEOVN4QTVDOGdqWWpSWGpMOWhT?=
 =?utf-8?B?TVI3RjNzNTZvcjN4WG55MEhVejNEU0RsQmoxb1JteFJHYW5HU2JXYTQ4V1c1?=
 =?utf-8?Q?stz99zmUWUx1lIBO4jYe8lQAzmKEBSy3xASXM+Rm4Y=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fc06250b-86bd-4c82-9f66-08d99d0dbbbf
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5151.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Nov 2021 08:00:56.1188 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9CDZbjyQchYSGWQh+7+/B8ZyWuCYltxNZZky2FxEERX51wPBwTVdmfG8pXPddCg/j9dtdCZJ+xYhcHZtR4b4Uw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0401MB2430
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211101_010101_570609_A15CE438 
X-CRM114-Status: UNSURE (   8.95  )
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
LWJ5OiBQaWVycmUtTG91aXMgQm9zc2FydCA8cGllcnJlLWxvdWlzLmJvc3NhcnRAbGludXguaW50
ZWwuY29tPgpSZXZpZXdlZC1ieTogUmFuamFuaSBTcmlkaGFyYW4gPHJhbmphbmkuc3JpZGhhcmFu
QGxpbnV4LmludGVsLmNvbT4KUmV2aWV3ZWQtYnk6IEthaSBWZWhtYW5lbiA8a2FpLnZlaG1hbmVu
QGxpbnV4LmludGVsLmNvbT4KUmV2aWV3ZWQtYnk6IEd1ZW5uYWRpIExpYWtob3ZldHNraSA8Z3Vl
bm5hZGkubGlha2hvdmV0c2tpQGxpbnV4LmludGVsLmNvbT4KU2lnbmVkLW9mZi1ieTogRGFuaWVs
IEJhbHV0YSA8ZGFuaWVsLmJhbHV0YUBueHAuY29tPgotLS0KIHNvdW5kL3NvYy9zb2YvbWVkaWF0
ZWsvbXQ4MTk1L210ODE5NS5jIHwgMzUgKysrKysrKysrKysrKysrKysrKysrKysrKysKIDEgZmls
ZSBjaGFuZ2VkLCAzNSBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvc291bmQvc29jL3NvZi9t
ZWRpYXRlay9tdDgxOTUvbXQ4MTk1LmMgYi9zb3VuZC9zb2Mvc29mL21lZGlhdGVrL210ODE5NS9t
dDgxOTUuYwppbmRleCA4OGRhNmMyZGUwNzAuLjk5MDc1NTk4YTM1YSAxMDA2NDQKLS0tIGEvc291
bmQvc29jL3NvZi9tZWRpYXRlay9tdDgxOTUvbXQ4MTk1LmMKKysrIGIvc291bmQvc29jL3NvZi9t
ZWRpYXRlay9tdDgxOTUvbXQ4MTk1LmMKQEAgLTI5OSw2ICsyOTksMzcgQEAgc3RhdGljIGludCBt
dDgxOTVfZ2V0X2Jhcl9pbmRleChzdHJ1Y3Qgc25kX3NvZl9kZXYgKnNkZXYsIHUzMiB0eXBlKQog
CXJldHVybiB0eXBlOwogfQogCitzdGF0aWMgc3RydWN0IHNuZF9zb2NfZGFpX2RyaXZlciBtdDgx
OTVfZGFpW10gPSB7Cit7CisJLm5hbWUgPSAiU09GX0RMMiIsCisJLnBsYXliYWNrID0geworCQku
Y2hhbm5lbHNfbWluID0gMSwKKwkJLmNoYW5uZWxzX21heCA9IDIsCisJfSwKK30sCit7CisJLm5h
bWUgPSAiU09GX0RMMyIsCisJLnBsYXliYWNrID0geworCQkuY2hhbm5lbHNfbWluID0gMSwKKwkJ
LmNoYW5uZWxzX21heCA9IDIsCisJfSwKK30sCit7CisJLm5hbWUgPSAiU09GX1VMNCIsCisJLmNh
cHR1cmUgPSB7CisJCS5jaGFubmVsc19taW4gPSAxLAorCQkuY2hhbm5lbHNfbWF4ID0gMiwKKwl9
LAorfSwKK3sKKwkubmFtZSA9ICJTT0ZfVUw1IiwKKwkuY2FwdHVyZSA9IHsKKwkJLmNoYW5uZWxz
X21pbiA9IDEsCisJCS5jaGFubmVsc19tYXggPSAyLAorCX0sCit9LAorfTsKKwogLyogbXQ4MTk1
IG9wcyAqLwogY29uc3Qgc3RydWN0IHNuZF9zb2ZfZHNwX29wcyBzb2ZfbXQ4MTk1X29wcyA9IHsK
IAkvKiBwcm9iZSBhbmQgcmVtb3ZlICovCkBAIC0zMjksNiArMzYwLDEwIEBAIGNvbnN0IHN0cnVj
dCBzbmRfc29mX2RzcF9vcHMgc29mX210ODE5NV9vcHMgPSB7CiAJLyogRmlybXdhcmUgb3BzICov
CiAJLmRzcF9hcmNoX29wcyA9ICZzb2ZfeHRlbnNhX2FyY2hfb3BzLAogCisJLyogREFJIGRyaXZl
cnMgKi8KKwkuZHJ2ID0gbXQ4MTk1X2RhaSwKKwkubnVtX2RydiA9IEFSUkFZX1NJWkUobXQ4MTk1
X2RhaSksCisKIAkvKiBBTFNBIEhXIGluZm8gZmxhZ3MgKi8KIAkuaHdfaW5mbyA9CVNORFJWX1BD
TV9JTkZPX01NQVAgfAogCQkJU05EUlZfUENNX0lORk9fTU1BUF9WQUxJRCB8Ci0tIAoyLjI3LjAK
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1t
ZWRpYXRlayBtYWlsaW5nIGxpc3QKTGludXgtbWVkaWF0ZWtAbGlzdHMuaW5mcmFkZWFkLm9yZwpo
dHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW1lZGlhdGVr
Cg==
