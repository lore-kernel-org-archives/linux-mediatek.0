Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06BDDC433EF
	for <linux-mediatek@archiver.kernel.org>; Wed,  9 Mar 2022 02:34:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=WjVLS9gMCPtJhzjS1rDwgFMy5EGHyAXY9vBJyCRz3Ic=; b=cHTg2UMov01cd+
	mJRrr2XI/ISgX7hxBTyhRHYDEuV37RWatRE9tBFk7Og6sY8mfPFbiImGi+MuA0qZY1HMCz7JEjgLm
	ahPkXPL3pZHEPWoJEKJOqPLUWPOp8a2f/eBXO09Ojc55cRJXx93XiGCK6L0iMgh1FnkdYu7y+s2er
	6b7NNeiqWcfAkG+VHYb846WtGsmdnortdozh5ur7IEVtJdfL+bGZ26ECXOsstpdq9S4mwTT0n+uT8
	AaHlLGKhM7rUZJSK1EaaiuAqANmT3itW5EWuZCmARFtc6M3lwDiwbDZXqZvmmOiGBJusKT92Fm8V8
	3ErP90Ux+7IbwU0gk+aw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nRm9l-006zub-1M; Wed, 09 Mar 2022 02:34:29 +0000
Received: from mail-co1nam11on2071d.outbound.protection.outlook.com
 ([2a01:111:f400:7eab::71d]
 helo=NAM11-CO1-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nRm9i-006ztr-0n; Wed, 09 Mar 2022 02:34:27 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NHsn4yY79KHUcp0dwerhlYN1ay0jUfpzMFsObqAJnjZ86q56gyFgO0iUMsR93bo42iNriWSGRzy5QtHFrZffjJe9t6gHhPbWt/Hnv6sYiBRegqCRR21Y6ReaVFYvB8vJRtLZbvjijm98MJssg/OcirUdj0PX+NZEnGg9gFE8uM09Hgo5ftVeodkvphh0nOg9otlPmVCe1N7+6MFQxPKLAQYqf8hCNgssT2o6jbPfcmIr1XQTEiOwyLkSDvMNfCNnuWy4mOAaYLfGz1YMEIgXTv5Ek4Tbx3HEaG/V0x6tU+KWojWXJQlfDMwfvjAz9fWkrZPvIKJuS2T4B8uBD0dXhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=COXdYI/y5yy2CEgoRm0pd5Y05CAS2g5nRSnfqM/kU2o=;
 b=dCij6ffcqEcHSPCad1J2MzANIDME8dB1sLLxrTKMmEnQhOIe9bEQv0kPnyOEpvcFTgZ6Hno0PAk9zh7Vy3toZ1A0MaCh4IhnXrEZ5JVRQB7ZrisnY38lt05C9uUQ74KU1PcBf2ARwVjRVDJE0w98kZaA7JNpBbEXTQb+F8n1KbC/sr6c6pYvd/pwHEHe+DSD8pgkj6qwNH22cCJ/77Ff6ZpezoGx7l/kmLejKmNlIhnLi0XMabWtmF5tTZDEHbg0DYa3dNMgxYkvS6PDXrzcK45EMGtYoeoGDAs0PUTmSNqXjPW/I0ZO2I8Uy/Cs4cOkIuDxD5pa48pvy7iGgDjK/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=analogixsemi.com; dmarc=pass action=none
 header.from=analogixsemi.com; dkim=pass header.d=analogixsemi.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=Analogixsemi.onmicrosoft.com; s=selector2-Analogixsemi-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=COXdYI/y5yy2CEgoRm0pd5Y05CAS2g5nRSnfqM/kU2o=;
 b=fa7MpmMZrXJlwrPDIUI3iQ+ZM0XUp7ty0jlAyvFQHCYsvlXsHG9gMPSlqg1A+fsoiIdPgGSX2LWUFS08z68smkEOQZIMUrcktpJKu7lNO+gwgDV6CBaBhTP+U8aKxb1Ff6u1be3iwNJ9f4L5m1CSfZrxfvmTw58xB8xkwY6L0FE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=analogixsemi.com;
Received: from BY5PR04MB6739.namprd04.prod.outlook.com (2603:10b6:a03:229::8)
 by BN6PR04MB0533.namprd04.prod.outlook.com (2603:10b6:404:96::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5038.14; Wed, 9 Mar
 2022 02:34:21 +0000
Received: from BY5PR04MB6739.namprd04.prod.outlook.com
 ([fe80::a865:6d10:c4a9:1142]) by BY5PR04MB6739.namprd04.prod.outlook.com
 ([fe80::a865:6d10:c4a9:1142%9]) with mapi id 15.20.5038.027; Wed, 9 Mar 2022
 02:34:20 +0000
From: Xin Ji <xji@analogixsemi.com>
To: Guenter Roeck <linux@roeck-us.net>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: bliang@analogixsemi.com, qwen@analogixsemi.com, jli@analogixsemi.com,
 Xin Ji <xji@analogixsemi.com>, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
Subject: [PATCH v9 1/3] usb: typec: tcpci: move tcpci.h to include/linux/usb/
Date: Wed,  9 Mar 2022 10:34:01 +0800
Message-Id: <20220309023404.1221453-1-xji@analogixsemi.com>
X-Mailer: git-send-email 2.25.1
X-ClientProxiedBy: HK2PR0401CA0012.apcprd04.prod.outlook.com
 (2603:1096:202:2::22) To BY5PR04MB6739.namprd04.prod.outlook.com
 (2603:10b6:a03:229::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b69299cb-a739-4144-d2fa-08da0175508b
X-MS-TrafficTypeDiagnostic: BN6PR04MB0533:EE_
X-Microsoft-Antispam-PRVS: <BN6PR04MB053317347FFDF775ED742BC5C70A9@BN6PR04MB0533.namprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: vrm2OG01gQYknciwAlmvri+9dusFKgZ2WyTHHOPdfb80AxWCjjUvMDGqqiFXcgVKYqgMJE7GFBXf9RBZuwsAGL98R4uk6nLHDAsnjpEVKLaYdURE2kDuRoiXNVELH3pVdIxlUPkoigCmmk/r0dIkKUGX57Eklhr9SQ8OSD3xkv0UkgAAy/qvO8LRe3cyGLlpkEPKR4V8Y4cBTX6ehaQgDGuIwsdVwKe5Uo5gzU+GPou546Zv/oz2tAGuCjjbJS2NR3H49oRuEr730v6+scotriG5aTXukUNX5Gu6s4KbuuGliFvm0GPl1rISSws/ubdDtFthE8T9WBp7f0crv5sSEcHQxU8WMZ9GXJsH/emaRKn9/ZeGITBhCDYXWuDBHExfENnT35SCXDTLYkpWO6XWMT4MUBdppuLSLu2X4tG4C+q+Uhd0+A65reKHoaUSndB/m3kf4wLsndwQLhc10iyGkvcWrx11BGHJhqztD8A2qFLCE/7lxX63xuz/+yWEdjMtlWziYKsn7iYVYu8v2UqW1Ys5z5+COXRf1uJjaD30T7nWCWjxxLrU0QQpqUvMuTzHViDzURxjcTlfsN6oLP42rm1wtdDVHSKlihwSCcuuWzylPJ15V0MY4kWtGNkFIbSyOzcbjZCnPcpEFr1+emsRbqP/WkwI1rxTk2fhzfX9D5a3C/iRuAF7TQi8kk7N2GlxrzyJR0hksNRBt0+zLo8wQQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR04MB6739.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(6506007)(38350700002)(38100700002)(6486002)(26005)(5660300002)(110136005)(8936002)(2616005)(8676002)(316002)(186003)(1076003)(66476007)(66556008)(508600001)(6666004)(6512007)(4326008)(86362001)(55236004)(36756003)(83380400001)(2906002)(52116002)(66946007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?KqVgbvPrWQAvXa0SLKr9APVoZPzILVPy4Tx/WQitlSVOg5f7s3syeSj4Ikdz?=
 =?us-ascii?Q?UisQhZWiL1n0JuCfd+39UH+iGeYTBP9N4LIQ3zdmCQg8EWVxFwuk4BCDG5SH?=
 =?us-ascii?Q?AZ1C9oKV7HQktYrfTE00IsidmAwutZDQHazIU8tkM+3JqIydfXgng/Zhdwpr?=
 =?us-ascii?Q?qLJacIaKKairjOXsO6SF8ZcDaYR2bNl3WxsLG63YYl8htr5p3dxIysfyGtGf?=
 =?us-ascii?Q?pR1vBYzj5NOv7YtSR4mgndznhhBNWkKvEidgJCWBVhEBysS82ZBnBHWdGyTW?=
 =?us-ascii?Q?Ry6qJPR5Qb/A37vyPLrBCpkkyRewRKxQV+ciDmjyg6bc95mivrIysFYRWXvn?=
 =?us-ascii?Q?SleUneqANs4ulnPEoLsUfx2zIXAOwaeh9CDXIaePxDfHXxwdrJtx9QFmf95y?=
 =?us-ascii?Q?gUgZqExiBb3IMEh1ah44yObhTu2Jv7NiW/DsyV4k1p1Er2dH9Oe6IBJqO0WI?=
 =?us-ascii?Q?G9fjd+Ap5D6ZOpl4BGzB5j0++436JbJZDrXR28cXGE5j67tnE8c/xVZEr+/R?=
 =?us-ascii?Q?cd5PpYiVoyd7Xs4/r/IuNDzR5Hm1UqtO9soPK+2zHiezSh/9V0SlLXgwOg9o?=
 =?us-ascii?Q?MmYqQRzqiE5eD2/mAD5VeqSuMptCUzsau2kE7VFKgXZfLtqul1GrMOmuHv8+?=
 =?us-ascii?Q?APeyBHBQ5+D2XnEnC29zo209zv+atayUZQClbJisBda/Rihq0DRzRhTYeDnJ?=
 =?us-ascii?Q?WZmL/BtadEfUjgcWTug6Kc2qLB0gDcXdQmzY0rcPqBeSNRgbgt0uXWjFZ1DU?=
 =?us-ascii?Q?SRKFBcTiHes7a49J7RMweWd96PBvGNHpoCyOct2h3zaDYQwXFZ3xiFla+3Cx?=
 =?us-ascii?Q?4nTvvcSv+jiVkURlEDI5NE6ix5hMp5CXk+FR/JhRSMthXBlVxHDnk//o+Hsj?=
 =?us-ascii?Q?1P4MgGtBE478wg0o/VMmZsaNpQTHJTshmJ37eqVh/gXXVrqrUwwFpf4qDFrd?=
 =?us-ascii?Q?2ax2BG4gNFj4s/evcG/ZSuICS7iVf/F4bapT+/LYYF+IyDSKkTshfcI+FTn5?=
 =?us-ascii?Q?4MHA2CeJtPUzgmBw5HF6J47Podtl93b9t1xeojZGtWe0ZdmgjIqGY8IgCHt4?=
 =?us-ascii?Q?l32bK0j6dytuuVr3oiYq9vGMqvDMZiUwfnX39JIKTyl5eox/3He9D3pcuLhw?=
 =?us-ascii?Q?MyuAv/5cMgJkbCTjEg84cZ4lLEh4Rdx3DRQbgLtcruT/lNzIzi3FA49ZHlIj?=
 =?us-ascii?Q?sN+9j9nIo/aoWVCezw6X23qVse9RpoyNGVPWMwWMHbAcx4OlEjZc1eBE4I9W?=
 =?us-ascii?Q?KaeUhzaCYNvtNxMjzZW3GvaGGghPLyb1ZwLXmNKA75jpMHFWkf/xRvAIBHHZ?=
 =?us-ascii?Q?D08Z8+4AtveneKCPlyUjPDXpJzWqwb+9hx5Em0544Z3aq13MtAheRSp1xVxA?=
 =?us-ascii?Q?1r5PRNRE3AEll/+QDRw3xH1ITvobWF6+fB6ZSbiVQ6uqcvISaF7zRqkquAMi?=
 =?us-ascii?Q?l4pmw2qyR8PIErPOAeAw/VIDuSNC4P3utQQJk7NX5vWSIbCLMZcCtFSzPXni?=
 =?us-ascii?Q?9Z7BkG/fNibVwuzOTBtSioRmghWJge2sOdQTpCcG2zcCxFB7N8TZac4UTjYM?=
 =?us-ascii?Q?v7Ow738HpnLjSlEdpnhY5mqoXnpHO+5jHWGZC1io5fUrAD1ERN2Z72X3S7DH?=
 =?us-ascii?Q?a9Uj3tFw70NV0g1abs3bwQA=3D?=
X-OriginatorOrg: analogixsemi.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b69299cb-a739-4144-d2fa-08da0175508b
X-MS-Exchange-CrossTenant-AuthSource: BY5PR04MB6739.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Mar 2022 02:34:20.2206 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b099b0b4-f26c-4cf5-9a0f-d5be9acab205
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eXeVn3lzfPvm3lVLuE9xHrna/+UHqE8tQG10k9nt7v0w7NI3MCQMygVbxHppNZB7Wk9dyPae39rAmJVhBbQmbQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR04MB0533
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220308_183426_094612_44598339 
X-CRM114-Status: GOOD (  10.52  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

USB PD controllers which consisting of a microcontroller (acting as the TCPM)
and a port controller (TCPC) - may require that the driver for the PD
controller accesses directly also the on-chip port controller in some cases.

Move tcpci.h to include/linux/usb/ is convenience access TCPC registers.

Signed-off-by: Xin Ji <xji@analogixsemi.com>

---
V8 -> V9: Add more commit message
V7 -> V8: Fix Guanter's comment, remove unnecessary explain

Signed-off-by: Xin Ji <xji@analogixsemi.com>
---
 drivers/usb/typec/tcpm/tcpci.c                        | 3 +--
 drivers/usb/typec/tcpm/tcpci_maxim.c                  | 3 +--
 drivers/usb/typec/tcpm/tcpci_mt6360.c                 | 3 +--
 drivers/usb/typec/tcpm/tcpci_rt1711h.c                | 2 +-
 {drivers/usb/typec/tcpm => include/linux/usb}/tcpci.h | 1 +
 5 files changed, 5 insertions(+), 7 deletions(-)
 rename {drivers/usb/typec/tcpm => include/linux/usb}/tcpci.h (99%)

diff --git a/drivers/usb/typec/tcpm/tcpci.c b/drivers/usb/typec/tcpm/tcpci.c
index e07d26a3cd8e..9c907296596f 100644
--- a/drivers/usb/typec/tcpm/tcpci.c
+++ b/drivers/usb/typec/tcpm/tcpci.c
@@ -13,11 +13,10 @@
 #include <linux/property.h>
 #include <linux/regmap.h>
 #include <linux/usb/pd.h>
+#include <linux/usb/tcpci.h>
 #include <linux/usb/tcpm.h>
 #include <linux/usb/typec.h>
 
-#include "tcpci.h"
-
 #define	PD_RETRY_COUNT_DEFAULT			3
 #define	PD_RETRY_COUNT_3_0_OR_HIGHER		2
 #define	AUTO_DISCHARGE_DEFAULT_THRESHOLD_MV	3500
diff --git a/drivers/usb/typec/tcpm/tcpci_maxim.c b/drivers/usb/typec/tcpm/tcpci_maxim.c
index df2505570f07..4b6705f3d7b7 100644
--- a/drivers/usb/typec/tcpm/tcpci_maxim.c
+++ b/drivers/usb/typec/tcpm/tcpci_maxim.c
@@ -11,11 +11,10 @@
 #include <linux/module.h>
 #include <linux/regmap.h>
 #include <linux/usb/pd.h>
+#include <linux/usb/tcpci.h>
 #include <linux/usb/tcpm.h>
 #include <linux/usb/typec.h>
 
-#include "tcpci.h"
-
 #define PD_ACTIVITY_TIMEOUT_MS				10000
 
 #define TCPC_VENDOR_ALERT				0x80
diff --git a/drivers/usb/typec/tcpm/tcpci_mt6360.c b/drivers/usb/typec/tcpm/tcpci_mt6360.c
index f1bd9e09bc87..9e0338bce7ef 100644
--- a/drivers/usb/typec/tcpm/tcpci_mt6360.c
+++ b/drivers/usb/typec/tcpm/tcpci_mt6360.c
@@ -11,10 +11,9 @@
 #include <linux/of.h>
 #include <linux/platform_device.h>
 #include <linux/regmap.h>
+#include <linux/usb/tcpci.h>
 #include <linux/usb/tcpm.h>
 
-#include "tcpci.h"
-
 #define MT6360_REG_VCONNCTRL1	0x8C
 #define MT6360_REG_MODECTRL2	0x8F
 #define MT6360_REG_SWRESET	0xA0
diff --git a/drivers/usb/typec/tcpm/tcpci_rt1711h.c b/drivers/usb/typec/tcpm/tcpci_rt1711h.c
index b56a0880a044..3291ca4948da 100644
--- a/drivers/usb/typec/tcpm/tcpci_rt1711h.c
+++ b/drivers/usb/typec/tcpm/tcpci_rt1711h.c
@@ -10,9 +10,9 @@
 #include <linux/i2c.h>
 #include <linux/interrupt.h>
 #include <linux/gpio/consumer.h>
+#include <linux/usb/tcpci.h>
 #include <linux/usb/tcpm.h>
 #include <linux/regmap.h>
-#include "tcpci.h"
 
 #define RT1711H_VID		0x29CF
 #define RT1711H_PID		0x1711
diff --git a/drivers/usb/typec/tcpm/tcpci.h b/include/linux/usb/tcpci.h
similarity index 99%
rename from drivers/usb/typec/tcpm/tcpci.h
rename to include/linux/usb/tcpci.h
index b2edd45f13c6..20c0bedb8ec8 100644
--- a/drivers/usb/typec/tcpm/tcpci.h
+++ b/include/linux/usb/tcpci.h
@@ -9,6 +9,7 @@
 #define __LINUX_USB_TCPCI_H
 
 #include <linux/usb/typec.h>
+#include <linux/usb/tcpm.h>
 
 #define TCPC_VENDOR_ID			0x0
 #define TCPC_PRODUCT_ID			0x2
-- 
2.25.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
