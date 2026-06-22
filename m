Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 311BACDB470
	for <linux-mediatek@archiver.kernel.org>; Mon, 22 Jun 2026 11:31:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yIk4uJD+uiOIdEPql6c4kq8qdSpisKJS6pkA2Z0nKWU=; b=lzSCdFh4S0QBgr4oOc4QUSe/m3
	Ax/6AjMdSaEr4IxyeQqd/A7NsY5e7mg6La2sHD18lyR88YBHNImdl74QC6Unq6/dmy7ykPTGqQZ+I
	7IE1oDDqpREq1pXnXVhua9QTW/Y1L5u5JXBjyh7FT/J+IozoYmf1KzykLdXVZJPjXJnd75HfEdoBi
	kGSLu7jhJGB9ynpD+CTFBl+Y1GXo6/LRGeJlDWi/KZ61S+WF4oj1aFq1Jn6HBgE9AFA63CtkNbcts
	7Yp+Ja5MEpo4CwkOWC2ISXqOtCVXlUiTVKWbxwL5I0Un/Uxd4VsSKF6F/twfXTBLsNoXYM8QlDKt7
	tPF0xm6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbcs3-00000004ugZ-3HcJ;
	Mon, 22 Jun 2026 11:31:19 +0000
Received: from mail-northeuropeazlp170100001.outbound.protection.outlook.com ([2a01:111:f403:c200::1] helo=DB3PR0202CU003.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbcs0-00000004uXZ-3HKQ
	for linux-mediatek@lists.infradead.org;
	Mon, 22 Jun 2026 11:31:17 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vPXDhif7tLWUCULQGD/ZKkJGQ2KAmvkvg96kcWF4exBQkyKglHkhmh5hxJdsaEXE8JFEO8zR4qLv5Myrd4ZC3iZVAEBI/SG+ch9f5OjIC7iVSnO8s6ccEymztKSvv16C5CbMIQp6kt09yzEMicW8MBUaEMl6s2QdJV86/Xuw1F2P5TZx92/h20BiAuaasKY+FIOZ/HrcNvWwqjdxUuPeI6HTLUmT4rucarl63y2o/42jP8NYngSTmTY/XnDCYakyeiQM6tYKuioawAXoODzGIiZEWzD9psCBWg1+NO8Z0U8xC1LMMGvkQqntYFGRNPGyW3iBwNUvPNM/61jFVNloyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yIk4uJD+uiOIdEPql6c4kq8qdSpisKJS6pkA2Z0nKWU=;
 b=y4NR7OnpMl7acAQJD0lX1Quez0PzL72olhKMRy2jdcJQhaneHI+t6CGriQlOlmzJdwPEXNevIkVGgRg2ZhOhTC+vvi2WS8Ise05b03w8Alz8xTIE196EF49tz0U4tff7PMvJKziPgltdj/4EsYBTyUtm/XfzgC0uU1LECgrvU7fhDGSHUYR1WBYkfSC4m4IkshvafcuW2Pxg9W/mdUrQVni+73DEGorr6S4x03533TMIMg8M0s2sw8woS0EefmxVfmEEviy1smkJ9AJOxzqBNe/BJKqMH0SFBALSlolxegU3f/y0I4psV+ZfUbnw5F/bfZ1tUtzm2laVIwORljOr7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=genexis.eu; dmarc=pass action=none header.from=iopsys.eu;
 dkim=pass header.d=iopsys.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iopsys.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yIk4uJD+uiOIdEPql6c4kq8qdSpisKJS6pkA2Z0nKWU=;
 b=e6+ilu3YVOayR5GRlWcnw5/sKASojqTwR8idfjRWSN1t0eEunjgAfZ8VcKd8Na7125a1ewK3MnAIqdgGfbCV9LrkN++PYMOLRI6fmgG0azUw0V1UPbQ5sJkt57BbM8DE21iDkvULtwVPAwSuzwNRmr21T891sbboBFitgGGhWY8lpJkb4rhODxHfB7/w3YjrUawp5FW7JdrkRs/glbxDc00oXpHpgYquXz16UiP4GDFr71VupDwf+ly8yV7Bx2oPy4lOkpebwqiMG9FsPj6EfCkVIRh/AtHU8farWHU1fx8PJ5YLB22bLnH/gHz6UYl1vHZrFnzglz9ejimyAVPpxg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=iopsys.eu;
Received: from DU2PR08MB10037.eurprd08.prod.outlook.com (2603:10a6:10:49a::20)
 by AS2PR08MB8334.eurprd08.prod.outlook.com (2603:10a6:20b:556::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.139.19; Mon, 22 Jun
 2026 11:31:08 +0000
Received: from DU2PR08MB10037.eurprd08.prod.outlook.com
 ([fe80::3c7:6d2e:8afe:e4dc]) by DU2PR08MB10037.eurprd08.prod.outlook.com
 ([fe80::3c7:6d2e:8afe:e4dc%5]) with mapi id 15.21.0113.013; Mon, 22 Jun 2026
 11:31:08 +0000
From: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
To: Linus Walleij <linusw@kernel.org>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Christian Marangi <ansuelsmth@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Benjamin Larsson <benjamin.larsson@genexis.eu>,
	linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	Markus Gothe <markus.gothe@genexis.eu>,
	Matheus Sampaio Queiroga <srherobrine20@gmail.com>
Cc: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
Subject: [PATCH v5 10/16] pinctrl: airoha: an7583: rename registers to match its an7583 names
Date: Mon, 22 Jun 2026 14:30:40 +0300
Message-ID: <20260622113046.3619139-11-mikhail.kshevetskiy@iopsys.eu>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260622113046.3619139-1-mikhail.kshevetskiy@iopsys.eu>
References: <20260622113046.3619139-1-mikhail.kshevetskiy@iopsys.eu>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: AS4P250CA0021.EURP250.PROD.OUTLOOK.COM
 (2603:10a6:20b:5e3::7) To DU2PR08MB10037.eurprd08.prod.outlook.com
 (2603:10a6:10:49a::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR08MB10037:EE_|AS2PR08MB8334:EE_
X-MS-Office365-Filtering-Correlation-Id: 09421fc2-a5f1-4dca-def1-08ded051c110
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|52116014|376014|23010399003|1800799024|38350700014|921020|11063799006|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: I7SHVT3A13mBWiiOrd9O2m5Ffwe6KLV6eTP+dWPIx+IconqvfnkKlt3ebtFdEJ8KLGrLfAeXA7lz6Yupj5VqYFK46oJr/zO/2WXp2wtoJ/7IIF8Ni0oRBx5a42Q7X/tBEy0bx+Y9N4S361KpRRX08h3faA4yfdHwux4SKHYDQMKly1jZBUDVK/9QN7c8Lt8oQkBD9as+P7sJ1WME81wZ8wtap/H6Nwyl92GCDV68je3NwF9vMU51tPOJRTAkRrtWfNTkAziqzDsmCbcTTXlkB5Lu97RHLtZ6TSKllrCMbHrXhrj8GsoytzdwGQ5aIIGzFg07LyfIF3hq999DnxL5fUVxUYzBJx6Qn5TVeqWab//xk4puflj3JU8AhBqzf+1oggI9fh8EZ3TDvb5OkX5US3sVx0x3NKs02jWVz253I44Wg5LR9o5kF7vNAPYG1QY9cmS1WLW+qfsHrXmFgLdwHE3B7MwSFJCO+ldTuE6qDMUiDHGvFXZFgfzCix8UxlVmhnVkXd5xxCy0JkicRd5Amsk7JxB3W4/DLSnTnRbpNWaDrZqXBUPaUN4gou8hUPTv4XlMkG+XLu5UwDy04Ld33OwXPNvSEmeTNAJ2btKjTbH0QVORXZ957/dsD6ENzidmWu9Z7CctKA1US5eIFRC6gHngraq9WXlkfNnTGDmq8Iqn8OTeO+GrM/q/rBmmgHWFRUmCikHOquAeuPIMff4GbTR9F0WQ0fkWfNIM3/RBBDc=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR08MB10037.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(376014)(23010399003)(1800799024)(38350700014)(921020)(11063799006)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?W4p8exkvuKNOqnqfU3sXTNH4XBNm/p1Ft4+s55sODln55hyF47DHAMQ4vnK2?=
 =?us-ascii?Q?mXiSOdNpY1+K2+uh+t6nhN3uwKmiKg0ux2Q9fjOxXwPwynJ+fcImq/T9pmAi?=
 =?us-ascii?Q?pFkPhiSlErrWu0vYwDvlC+VLW50oVYFBYDVK9SzOggFBzXiXcajhAxynqlLN?=
 =?us-ascii?Q?7CGdnKqzUQpUcFO6w3AT2lfmh0EafT2d+P1kLBgSS9SETC/RvEJ0spfDL2Uj?=
 =?us-ascii?Q?MEgr/0lxWZx2HGsG8AZ3DmLHkXuCkYFfe6uLQzgUbD7XcIYUEJb+BGoCAtWh?=
 =?us-ascii?Q?NS7FfbLujjzoAOfzgbS4x91mulzvKTNZmp9/zNqfj6QGcGS8UTYzKlljWDzE?=
 =?us-ascii?Q?hsseScaprNstpqS72bArzlUBjTLz8v1TzNcArk9OJO3h+iPlTy4co6Ley5wG?=
 =?us-ascii?Q?e8yXecuiFG68tT8mW02lt9rJ7QMU5wdh2yIBV+VaYMApAw5Q1b2sJBOhoBEK?=
 =?us-ascii?Q?6SKzEJmzHa7vp+zFcapS8eoy2PWEv0htk0eTD9UEWCusj9s0lscRT1txAMqM?=
 =?us-ascii?Q?HTjMBphecSaaZydN3dSYUv7EVXerV9wSbNIp4CXpqOwlxAubHgyWpMqpCkda?=
 =?us-ascii?Q?dwxDITASyXkAoal+Nx2e1IE0b/0R91SxVR+0759B0WARwwMp+vO/eNaWRsKu?=
 =?us-ascii?Q?oMZ0AtKuQfMRuYtX3JEKs/51t8pD4iS+NpOY8w8tPifjLHREecAFBQ/bIu4V?=
 =?us-ascii?Q?knvuHRBPGYbKKt2JHptGuUtjktlaM3tbhFGQ9GBLxD+Nz2NehIkpSk0JCynI?=
 =?us-ascii?Q?rlGSKF4cVtjaOJ+6desdn0Slfqw/uGXXOYGQdlOwYYApt1bvR7QMG5UhuU20?=
 =?us-ascii?Q?y/oQBRZ5dKBqxX/UWP/nNH+DYJyqHlzq6/HyMkIBnuxEe5Uqt5Ct67XqA0Y/?=
 =?us-ascii?Q?089ET1XQF9RYz4qsxbMjv8MPX2iUv4yxaFptAahZNyTozfJmc/IwT88iWHNV?=
 =?us-ascii?Q?jxzd/xAGXBeV8i8Pg6yg9dCLfYADTa+LaPaMa+sMHMW4nmm1Kheg9LUpJCY+?=
 =?us-ascii?Q?kCcvjn4KpV0BzKFIjhdpVl/HpbkL0CKnf2IC/fZL0KMwdgMjBPt9CBw/R7G4?=
 =?us-ascii?Q?fl66pfwrSIfL9/zhvNOcfr2266eQ01McUOOlbXkglMGWZHKGbRbSk2FeKWdI?=
 =?us-ascii?Q?xWYDX9g4H9CkSb2280s40IPIg+Hr0AcntbaycUVnW8KZc37D6X+PmWa/AB0t?=
 =?us-ascii?Q?CuyyizMvbHEgzzZuDRM5ajUkDGgz19JSHTojrlu64pDp/DCGVlU158JWaSxp?=
 =?us-ascii?Q?GkeKlX9rg0EBt7sqgRNOBUJEVyWKDIghQC7R+FRe5zQUthQeq1DorEl7gozX?=
 =?us-ascii?Q?yznVpyUoVlTrgKKay3uYrXLteGhlFYD24WvqsynMWrGCwfDAVGHoPQ2EZoFr?=
 =?us-ascii?Q?ievShXyJflZbT0LrmdNUMwqUI3XxJ18SIOfz1aw5dCVOkqFkSPTDZ0TIm4uB?=
 =?us-ascii?Q?v6xdeR/vhXu5sXJVFMbxZoLwk2AT/s7dMa0IXHO/wwasO2xtEbP+5cm9WsVg?=
 =?us-ascii?Q?jXLYnCJSVkVqWH8jTK7TLbK8WKokmigEM/8jUmU2P1DNtPcZ7MOngoGZxEB+?=
 =?us-ascii?Q?KUs3PiPfr+i2Lqta5vKpEXBrxH35ygnjMlNrQRLu6DmVnSJxDzaMjDFEM2bN?=
 =?us-ascii?Q?eo+yKIMk0nWh+V7s0FcNIIo4FZgYOhlnPw6FUJUUJMRpSmswx7FX0hN2UNcG?=
 =?us-ascii?Q?8nNr2IDgOoaJIrSvKtEpTnqMUQssyr7NmRcmNpkd3ahb/u+tqLeEUoGDf57N?=
 =?us-ascii?Q?SasS3dAp1awjgLptCLJrsEkeKLLM9gM=3D?=
X-OriginatorOrg: iopsys.eu
X-MS-Exchange-CrossTenant-Network-Message-Id: 09421fc2-a5f1-4dca-def1-08ded051c110
X-MS-Exchange-CrossTenant-AuthSource: DU2PR08MB10037.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jun 2026 11:31:08.4960
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8d891be1-7bce-4216-9a99-bee9de02ba58
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1wHSY3dpalf24pdZ4FJjp3ru+4eNQSRNJvBZbsqAnP04us8R8Xx5aW/zi4JZepWdNSTvr+2yQJIu2pixCdHgkOCbroGMSHxqFEgwsDdCnGE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR08MB8334
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260622_043116_823967_C9D0870A 
X-CRM114-Status: GOOD (  11.24  )
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

In the an7581 case the register at 0x1FA20214 is called RG_GPIO_2ND_I2C_MODE.
The same register in the an7583 case is called RG_SW_TOD_1PPS_MODE.

Let's rename this register to avoid potential confuse.

Signed-off-by: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
---
 drivers/pinctrl/airoha/pinctrl-an7583.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/pinctrl/airoha/pinctrl-an7583.c b/drivers/pinctrl/airoha/pinctrl-an7583.c
index d4fbb12fc639..2f2dbba50b76 100644
--- a/drivers/pinctrl/airoha/pinctrl-an7583.c
+++ b/drivers/pinctrl/airoha/pinctrl-an7583.c
@@ -8,7 +8,7 @@
 #include "airoha-common.h"
 
 /* MUX */
-#define REG_GPIO_2ND_I2C_MODE			0x0214
+#define REG_SW_TOD_1PPS_MODE			0x0214
 #define GPIO_LAN3_LED1_MODE_MASK		BIT(10)
 #define GPIO_LAN3_LED0_MODE_MASK		BIT(9)
 #define GPIO_LAN2_LED1_MODE_MASK		BIT(8)
@@ -302,7 +302,7 @@
 		.name = (gpio),						\
 		.regmap[0] = {						\
 			AIROHA_FUNC_MUX,				\
-			REG_GPIO_2ND_I2C_MODE,				\
+			REG_SW_TOD_1PPS_MODE,				\
 			(mux_val),					\
 			(mux_val),					\
 		},							\
@@ -320,7 +320,7 @@
 		.name = (gpio),						\
 		.regmap[0] = {						\
 			AIROHA_FUNC_MUX,				\
-			REG_GPIO_2ND_I2C_MODE,				\
+			REG_SW_TOD_1PPS_MODE,				\
 			(mux_val),					\
 			(mux_val),					\
 		},							\
@@ -640,7 +640,7 @@ static const struct airoha_pinctrl_func_group tod_1pps_func_group[] = {
 		.name = "pon_tod_1pps",
 		.regmap[0] = {
 			AIROHA_FUNC_MUX,
-			REG_GPIO_2ND_I2C_MODE,
+			REG_SW_TOD_1PPS_MODE,
 			PON_TOD_1PPS_MODE_MASK,
 			PON_TOD_1PPS_MODE_MASK
 		},
@@ -649,7 +649,7 @@ static const struct airoha_pinctrl_func_group tod_1pps_func_group[] = {
 		.name = "gsw_tod_1pps",
 		.regmap[0] = {
 			AIROHA_FUNC_MUX,
-			REG_GPIO_2ND_I2C_MODE,
+			REG_SW_TOD_1PPS_MODE,
 			GSW_TOD_1PPS_MODE_MASK,
 			GSW_TOD_1PPS_MODE_MASK
 		},
-- 
2.53.0


