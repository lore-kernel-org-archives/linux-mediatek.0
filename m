Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F5ACCD98E2
	for <linux-mediatek@archiver.kernel.org>; Wed, 17 Jun 2026 04:37:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=igO4ZzTiWTfVX0v1XidgEG0TPm1OP1lWnu7q79IVhB4=; b=4OQgTqK7nPujTMDDKc+mnX/QO0
	n2QcQUc+QACe7xdPW0U8J8ytGP3wfjrOo7+t5AEvh2+onEGvvdNZ0BRHxX6Y78NEfT2bGixZevuo4
	bdo/NlVWzcNTWEq8TkdZXOrgnQUP6HR7m5bjqlKCllwRvvUstA8ksVHk3+tcwu2FcUTO94NvMGeVk
	HldA2gRmo+49w2rX29aSHksMnzca3Ii1a+S/wmLTZXLoHTygM4Yglkp4+i5CSro43NBup9EPozUxP
	ocqKQ8/89iQFWuHkmlDjYkQlm4IJtgDIv1KtmLaPtN1AHC/UT8PtwxARGSDbJc6knHnLSnG+CEtir
	AlKssOww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZi1e-0000000GbcG-0NF5;
	Wed, 17 Jun 2026 04:37:18 +0000
Received: from mail-northeuropeazlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c200::3] helo=DU2PR03CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZi1b-0000000Gbah-3Pt2
	for linux-mediatek@lists.infradead.org;
	Wed, 17 Jun 2026 04:37:16 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wGTp+8LgdhKyYkxdDSLlQt0Ye0mfTa7A5HfodFr83dxWbyimvvOaub0jGFtM/TebPSpyR+qRFpuk/4aN17V+RyGW5jFl3MMZT5lmwVJ7vSH0k1yJ3/hGKVWCt2bpGfN6+ciscqfpZhmhw8slSyrGCkGh8ukHs2osSmI7k1JFtEXq4HLLzAzROCOMx5BmnHxbst8LJ/I4pKRAgFyv2epuDwUNkEjncDO27gR09GaDHxEm1ks1yGNNjTX8xlG+G3nG1lyAVR3bFpntPDyv1CNnHqWgLi7QBwOpEnhEqVeqtiCeU5bM+dRpnJs814efIvESXKABDSX0SqvSMVSeFtSbUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=igO4ZzTiWTfVX0v1XidgEG0TPm1OP1lWnu7q79IVhB4=;
 b=lKEeAPkWUDJubWokE703K6kd/2Q7nzGsanfLMjna3xzzkylARmFibSIkjifZlaiv/quVGDSxmXFFDI5Co5GkdJeX6v6lGtlZ5jmkJM34Dfwu1TSgaJWCXsS9+rDoIdR/FcxAJBaJR5lzBJnMNvKrZIU8bYgDDHfWULmGB3uHDiURbzWQyDSbxKDJ3uXf8EWV02WMG2Be/GliGZloO340OScaJ26x3nVEp81xPxqOeQzkBBqCDxDwZ+UIQeZ43Wgg8tcNiu3Z4Q8a6OpOE2mALLIl/1GbDW8W5BM8ezFIwAPE6Q2hK1VCYnrTok7VxJ/mtmbdi5yOLKGw41PmdfU51Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=genexis.eu; dmarc=pass action=none header.from=iopsys.eu;
 dkim=pass header.d=iopsys.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iopsys.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=igO4ZzTiWTfVX0v1XidgEG0TPm1OP1lWnu7q79IVhB4=;
 b=bXuV+dc38FV/2TT595782nbeySmWAH61s9lk57Ktc7GUK5RPkR7NMvPVJcOuy5QfvWBTbsH/QzazOkFcc+ogHK/OpQ5EWTEKo9IPcaDecOtOpYK7Ft/RIm3UivA0s/UFzzkvwNyvFT5SBSHTaLG32KQlOKTdE/3Fm73A4d2PTZRMCFBJQmdwDyR7SFV2OhoydLHJP4B82U3bbM6HFQy/9cO9uzw9SW1NWiQztkXADb9LfS96wgVMqtdpvRQ2l5xUfnL/9/5yzVNJNW7lGqFDwiGtZKn2/SdlBfhnaX0J0kfXsZqSjp1TpJw3RYT7AOCcDgB5GAcLQwKji5ZMv1oZPw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=iopsys.eu;
Received: from DU2PR08MB10037.eurprd08.prod.outlook.com (2603:10a6:10:49a::20)
 by GV2PR08MB10384.eurprd08.prod.outlook.com (2603:10a6:150:b2::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.18; Wed, 17 Jun
 2026 04:37:04 +0000
Received: from DU2PR08MB10037.eurprd08.prod.outlook.com
 ([fe80::3c7:6d2e:8afe:e4dc]) by DU2PR08MB10037.eurprd08.prod.outlook.com
 ([fe80::3c7:6d2e:8afe:e4dc%5]) with mapi id 15.21.0113.013; Wed, 17 Jun 2026
 04:37:03 +0000
From: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
To: Linus Walleij <linusw@kernel.org>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Christian Marangi <ansuelsmth@gmail.com>,
	Benjamin Larsson <benjamin.larsson@genexis.eu>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	Markus Gothe <markus.gothe@genexis.eu>,
	Matheus Sampaio Queiroga <srherobrine20@gmail.com>
Cc: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
Subject: [PATCH v4 01/14] pinctrl: airoha: an7581: fix misprint in bitfield name
Date: Wed, 17 Jun 2026 07:36:41 +0300
Message-ID: <20260617043654.2790253-2-mikhail.kshevetskiy@iopsys.eu>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260617043654.2790253-1-mikhail.kshevetskiy@iopsys.eu>
References: <20260617043654.2790253-1-mikhail.kshevetskiy@iopsys.eu>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR5P281CA0052.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:f0::11) To DU2PR08MB10037.eurprd08.prod.outlook.com
 (2603:10a6:10:49a::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR08MB10037:EE_|GV2PR08MB10384:EE_
X-MS-Office365-Filtering-Correlation-Id: 789882a8-2c8b-4c37-4db5-08decc2a1442
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|52116014|376014|1800799024|366016|23010399003|38350700014|921020|22082099003|18002099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info: dx5VQ6IXo3C5rM3wYrVu+zC5VDXOYbKzdEU8GggWRMl4ttbzRWhuTCdK9CaMKJoykV8CPpLARSr8t8Zy4MoD3SY0mS40YhG8cHcQPuRzJSbhAxpgQksq5TC0Ytwlsn27lfFPzdhn01oogkfks+RVxqgAgckTFsu3kV9mZLNMkFyGgWF8YiQ9o15DKhGX26zOAum2E2eicO3BV8hRGYxoWm8rRQRZJJy9IVsWdqiCo+vDsGcOJBhJsvmOvSbmczlv9CVGH7bfwyXwIWw+vENmtvs5ULm6Cn0GrgrZ0w0/fbsF6AOvKKtU8R3astKICNi5OAqc8DnYJCs3ZsPul1meqrQ7QMq32bXFTb275fXGwpPE7+QC4MrfLwEeh6wX/BVjqHsDrNYSh1LGQyFZJY7mgUDJiGO990kje4+jM1Rj13BhlBQR6UTqT5TZlAUSALXDWKhCIxRDtxGaFAcUUREexm9dGJAe3H419WaW/Vg2/FPaG3gHn+K+TCE9mZ0XBAspdQhCY4gCBW1eKA8kDH2iWqqI4+Dp6yof6vKsUuuCK1ugT2Dizl+LDC68KdcvrdAH9eY+XSb5gO1pxY0TsNRNlh9j2YDcPXqmsNz/WshxrX2gb+78Avr0za9Er892PvqfYi/6uwPpZ5oID6dN6UkFZLcW5f/ronbq0ZkRjCCgIJDVmQyYJmsh4PvYzsqyWRDVKkrUogVhGDiFLG1EzH64z9fqOednqErw4iL5EqiXOEdllhqmY0hXx/7248DZK19/vx96jLn1RyCtS9QaeVwO1w==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR08MB10037.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(1800799024)(366016)(23010399003)(38350700014)(921020)(22082099003)(18002099003)(56012099006)(11063799006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?jW5q72VmAjQhNp54SqmWQogwHVr7tkwWVDnackztRMp84MG9jhoK33hw5Bcn?=
 =?us-ascii?Q?NrWXrujA+Zy5MLjFN1Rwokc8Osq38CQwsxJ09G+JouJZw4e8hKJZVU3lZqfv?=
 =?us-ascii?Q?JzAH8nKQRUiw5vaF7DKo0584eLjYzh5Dk75mQfoiJOUQYurKdZmTC/6LYFhf?=
 =?us-ascii?Q?GpFxRyMCSjBgGqpioM1vMQXOaGMhT39+BhRoshzZ4dMeEE4L17egTVvvRdY1?=
 =?us-ascii?Q?lQcBOcpU/ygGoh3ypRT21/NKPMfkPx2fgr3E5UVUinHslzT487IoFKza39oi?=
 =?us-ascii?Q?tBDUduESCU+nz8Sju3F0JN/JDZipc3vLLtCbog93nhrJEdyzFXWFOkBzuhJP?=
 =?us-ascii?Q?A4V1rBnSOGtTul8ee1RXq91sKBWO0nqp99YKe1ld1/WZtSvd1XfAiUZRqLnR?=
 =?us-ascii?Q?3E5XJxnVQmeL4C49DFEjjR4GcWYxo6txRFm8woBW53/RD4fQVXFBPjXvpvPu?=
 =?us-ascii?Q?vcp6hUB1/0t9HzAlDxyT5VZKXH1tqYifYBT9uTl0i3pCErzYiun5n9Yrj+OH?=
 =?us-ascii?Q?G3E4uRwAVkhHM3iHE6hkpaHaE7WPH3QYsP5gR5sswKINbOTGYMI/7xsDumE2?=
 =?us-ascii?Q?/vDgsNPHxC4W2Cqxanij49PjP5f0Xj2Rwsifrs54CG35NgNovZEhRBiEgHyI?=
 =?us-ascii?Q?d1N2HRnfH73UoXIYwyhXq7JBr84aPebvdzjWOcxgDEaFLrmZGhYIwuVTSlHl?=
 =?us-ascii?Q?Bf71DKBquf6fhrevReHup1R/grZm/JvunQBOgICmEPCzgbqjQTylaKSaT4Ec?=
 =?us-ascii?Q?jo8LAEirA3mhUEVBbI61EwRWw5CjpM31VLyYP3Q3iQnimCaTyhO+uLupxxI3?=
 =?us-ascii?Q?b4aZjub1y3yPjqFP3YdIs6yIVcb1r3h4KINGapq9A5ZuBJnD62B6N3gzFOCk?=
 =?us-ascii?Q?atxfM0cxAGlkRkr6FCkMkX2qVVj224DN9bYCFIS3jCaVo6159C10/clAjADQ?=
 =?us-ascii?Q?Br75n0auzDpib07kLf4JO9Wd6f9GLii14WZ7o82K9/06KcrmZ3c8E6PVqiJy?=
 =?us-ascii?Q?KqC01YiVYR/SBgi5bjQHLjessOCe6XTz6N0f+s8sh9SAKJOySD7R9oIHQU3f?=
 =?us-ascii?Q?4TLU5xHTDtcDfUCi0AJT2xSAFEtRBpjTfrRQlz9vsfQHLEmNppO+zZyILkz+?=
 =?us-ascii?Q?TQdJIGRXWDSl4b50G2B/zIFkqMGMr9Ygo0KFAXZJTOHxXwI6JLw7WWcxMs13?=
 =?us-ascii?Q?Er9073K6d+iZq0yzB9l0XuYkXeRqEsMvSFkHVrpZglYj3G/VT+TYbUIlLeG6?=
 =?us-ascii?Q?EVeVvG2dQFMKg5fjohN5G+GF4Ytpu3GrcsXMOi67O7+xISGn6RVTYJl+qJkl?=
 =?us-ascii?Q?DXTXPiaehy6U3jPhrc1aCJ6n6f2HR4uj2OYJg03ppi8KiqUzpXg72vM2K48W?=
 =?us-ascii?Q?jgXVN733N0QwKynVZDtxrSvbp2D2sPek/C1h54+rEbkLJAR5UZ02qV0lukLX?=
 =?us-ascii?Q?Bs0jlvwYOi5Zls8n5EJzMVysAwDrkX2SZiEDqPiHk1LBOIrs5EFbOZfwP4cy?=
 =?us-ascii?Q?to3sSuvyfy4f3PDT5yVvIUM951YlQO4Stckx9hpAzXzkPWD398rJQu34XE0m?=
 =?us-ascii?Q?ikllNC0xvAKyMqK5wo0ZBESL/irOjAF4LCU4dtnon9d368hr+yFhjWHPXESQ?=
 =?us-ascii?Q?ZLlNO9+Hy5ii643b5V1Auo/5hj5fc2VCdr+PPYN7QeNOl8YmaHNyUZ5QVYGL?=
 =?us-ascii?Q?JDP01ahGbWEVSZ91UeyR7hsDBsw0I1xiKGeVkHZpjaFgU4VFyVEP7sDxoS7B?=
 =?us-ascii?Q?BTd9EYAHeXvHmou9hSHZd5I5crlTCCMcYe5+N+KcR8brbUPtCCMr?=
X-OriginatorOrg: iopsys.eu
X-MS-Exchange-CrossTenant-Network-Message-Id: 789882a8-2c8b-4c37-4db5-08decc2a1442
X-MS-Exchange-CrossTenant-AuthSource: DU2PR08MB10037.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2026 04:37:03.5173
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8d891be1-7bce-4216-9a99-bee9de02ba58
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2mXwk+4eMkqWyXbkEdxAPbUnT1S3gRxRP+0dOQ6rNn1ru5joPUrwd3Lne31tEG6LPSYn4Vo8LO0YC6YFF7YF/6aDyyG3GPoeO6CCcJN0MSw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR08MB10384
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260616_213715_849661_50AD1AF6 
X-CRM114-Status: GOOD (  10.07  )
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

Fix misprint in bitfield name of GPIO_2ND_I2C_MODE register

Fixes: 1c8ace2d0725 ("pinctrl: airoha: Add support for EN7581 SoC")
Signed-off-by: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
---
 drivers/pinctrl/airoha/pinctrl-airoha.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/pinctrl/airoha/pinctrl-airoha.c b/drivers/pinctrl/airoha/pinctrl-airoha.c
index 04b4424c688b..63c82268aa82 100644
--- a/drivers/pinctrl/airoha/pinctrl-airoha.c
+++ b/drivers/pinctrl/airoha/pinctrl-airoha.c
@@ -49,7 +49,7 @@
 
 /* MUX */
 #define REG_GPIO_2ND_I2C_MODE			0x0214
-#define GPIO_MDC_IO_MASTER_MODE_MODE		BIT(14)
+#define GPIO_MDC_IO_MASTER_MODE_MASK		BIT(14)
 #define GPIO_I2C_MASTER_MODE_MODE		BIT(13)
 #define GPIO_I2S_MODE_MASK			BIT(12)
 #define GPIO_I2C_SLAVE_MODE_MODE		BIT(11)
@@ -1026,8 +1026,8 @@ static const struct airoha_pinctrl_func_group mdio_func_group[] = {
 		.regmap[0] = {
 			AIROHA_FUNC_MUX,
 			REG_GPIO_2ND_I2C_MODE,
-			GPIO_MDC_IO_MASTER_MODE_MODE,
-			GPIO_MDC_IO_MASTER_MODE_MODE
+			GPIO_MDC_IO_MASTER_MODE_MASK,
+			GPIO_MDC_IO_MASTER_MODE_MASK
 		},
 		.regmap[1] = {
 			AIROHA_FUNC_MUX,
@@ -1051,8 +1051,8 @@ static const struct airoha_pinctrl_func_group an7583_mdio_func_group[] = {
 		.regmap[1] = {
 			AIROHA_FUNC_MUX,
 			REG_GPIO_SPI_CS1_MODE,
-			GPIO_MDC_IO_MASTER_MODE_MODE,
-			GPIO_MDC_IO_MASTER_MODE_MODE
+			GPIO_MDC_IO_MASTER_MODE_MASK,
+			GPIO_MDC_IO_MASTER_MODE_MASK
 		},
 		.regmap_size = 2,
 	},
-- 
2.53.0


