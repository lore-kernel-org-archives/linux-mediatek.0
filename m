Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 514A0C53209
	for <linux-mediatek@archiver.kernel.org>; Mon, 27 Jul 2026 17:42:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=h3SuXE1btSQ3inCvpWtCmdqZ2Bv82V1SgemnDaB+awY=; b=qPxHTnx0CpK9KcOu35PHUzD5q3
	ZMVxaqvoMt7l5scQN98o5LCAOuCJnsgu2koseRySrpKlxqlBpcvhcCErJjy182o+t7lLEoRhTZ22W
	s3VYh/7x3HgH0y/jX/mP4c++wU+SKk50unDSUbC2kUoDRFgnMSVWiIqquVZeBq1zAVC0Uno01DkZ1
	9YQFrMn3ijgiaeDN3i4g2hzOxXTZcC+HPt/ueu8TSWzw5P0jMRCHKCEl99T2IXq6RiZduKjypjrd2
	w663744y6xeCb1TRgh2WXnqR0pRQcSmkfyNKvV9SfOHHtMVUcPG6pRj0DUY3FLfgD6HLYT8xzdqtA
	UBlhI8VA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woPLi-00000003Yh2-2JJ9;
	Mon, 27 Jul 2026 17:42:46 +0000
Received: from mail-northeuropeazlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c200::3] helo=DU2PR03CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woPLe-00000003YXE-0hKf
	for linux-mediatek@lists.infradead.org;
	Mon, 27 Jul 2026 17:42:43 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MX9JHGOLgowaSgFWyOSpc56joK2oXL/002Vi4ltHFnaLxDFLT+zcruWfc3pGaBC3PR4qO7GYHrz0EWaI1i3oAwvLmn7aAnhEG6XOk6kovXsoAapnzLDluJdJR/gDGvg+/rThR5G3y8KNkmHGeuGRTvja69NKtT8XxwOHgFGNzyA2A40E/6K3DhS4zBAouIiBoRihAHtg/NOyowWVzmo+EYBm5kYf+JaW4EOdhQgR7XH+6ct4KB61T0aZ6/L5VTJREpBWoqTUD5NS9PgPOWex+ektp0xYycRtyrl+ctqquz6NkbJcEsqLqz1oFmcMqXFZA/RrxmcQaRWL4ZiI+1ZGrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=h3SuXE1btSQ3inCvpWtCmdqZ2Bv82V1SgemnDaB+awY=;
 b=oW3ktU4pO8B8XFRjTv9Yy+bwtdNpGB+UfwvHcP8Aq2BGJk6sBN+SVI64iVUWJp86+o6rOgVT7bFaeMIpnN1Tck2OctqlDVredt84mE/MP/PctEWU+TWVbnvRbEOcH3N1+pDGudRpPYLmLRDRZIf/6S623wJOVgWItmiksNnVJfBfNFdL/rEVz8k+jvTowPPbGsLJKBfGs0J7qQ4iecCZ7vi8xT1uRcP4CIUGYtyvB0K1wZJUmjx7fsS61EIA/48WbCNfSHnbHY6p8nHIwTR7Ojg5iBlp1Lb5SE07hvb+0S9htGI1QHiqGM5LEpeGiKHg7bCv/yWOLTwvVgVLdgoKzA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=genexis.eu; dmarc=pass action=none header.from=iopsys.eu;
 dkim=pass header.d=iopsys.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iopsys.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=h3SuXE1btSQ3inCvpWtCmdqZ2Bv82V1SgemnDaB+awY=;
 b=KkLTq38NP6p7H/vSW1vdFTsRr6URoMkGOauejl0fQbjkx4hhRLJ/RypCkx6PFKbjezIfwKyADDtWoDghWOtbbU5VKOtjga3RKU8xZSbgUjJqb4wrAenLwv3VBFqH9biPsjVqTYwiwH7R1BvRvzZ+ioWJ1G9SnWOf7S33yLzLwAKJzWFClgcu6gKD8p2IQ16PN4D7cPmO7CXDcZnmJjI6Br5hek7N/BvhUiC86VRxMOi693tnJSlvz6y9FTno2iNaHbv3Uo3Xw0cCfRn0dBW3aIw1LmUtk2oRPFuvQRsgi5DdIVDh2CJNqn2Zh09jVzan/ziKqbby+5P9/INaMLrooQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=iopsys.eu;
Received: from DU2PR08MB10037.eurprd08.prod.outlook.com (2603:10a6:10:49a::20)
 by PA4PR08MB5888.eurprd08.prod.outlook.com (2603:10a6:102:e8::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.13; Mon, 27 Jul
 2026 17:42:33 +0000
Received: from DU2PR08MB10037.eurprd08.prod.outlook.com
 ([fe80::3c7:6d2e:8afe:e4dc]) by DU2PR08MB10037.eurprd08.prod.outlook.com
 ([fe80::3c7:6d2e:8afe:e4dc%5]) with mapi id 15.21.0245.012; Mon, 27 Jul 2026
 17:42:33 +0000
From: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
To: Linus Walleij <linusw@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Christian Marangi <ansuelsmth@gmail.com>,
	Benjamin Larsson <benjamin.larsson@genexis.eu>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	Markus Gothe <markus.gothe@genexis.eu>,
	Matheus Sampaio Queiroga <srherobrine20@gmail.com>
Cc: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
Subject: [PATCH v8 24/35] pinctrl: airoha: an7583: rename registers to match its an7583 names
Date: Mon, 27 Jul 2026 20:41:30 +0300
Message-ID: <20260727174141.664933-25-mikhail.kshevetskiy@iopsys.eu>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260727174141.664933-1-mikhail.kshevetskiy@iopsys.eu>
References: <20260727174141.664933-1-mikhail.kshevetskiy@iopsys.eu>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: AS4P189CA0064.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:659::24) To DU2PR08MB10037.eurprd08.prod.outlook.com
 (2603:10a6:10:49a::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR08MB10037:EE_|PA4PR08MB5888:EE_
X-MS-Office365-Filtering-Correlation-Id: 6de7faef-71bd-4741-0674-08deec0670a6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|52116014|7416014|366016|23010399003|1800799024|921020|38350700014|18002099003|22082099003|56012099006|11063799006|10067099003;
X-Microsoft-Antispam-Message-Info: KAmer6vxIdFZIWoA7g7yOLPiqQG0ER6bppJOCuMuipN76MQX49yOOScb3A52wcqTz7Th0KVWVht6AhdcsfA8/QfRC6C1uS5pc0tS+B+ipPzZeXNE7MP6ZVjfgND/shzTp4047++YkOdGJTz4if9iO9cx7ClP2focfnUqxeiX40El/TO9WowrcGWs04hSbO4D1RDNxfnAAClv4tj/nZ18suWzkNxy3/cZZifgwP6a3aYdysjLJh0Mi+RNbguHDZlk+w5GgwTgabEyT+3mMfE89ZdkAplVKmo2P6XIzoCJ8XqhLkq05h6maHQrglO8nt3kUiO8WqcYjeUktDKO0+QY3uQ60kE+qi8f9R9F6U3A4S4jR2WHHI0P7GnxeBrez8sxZvYPjmJdvg5OZ26eo2lWI2G8IOHwHOp5Yqp16KySaGWE84ldabPu8LYtgTfCbkHXgNoo8bfxPD6ZXV6yi6S1lijhsXw/JDChfniMU1Qzbrk6wfluA/ssnBmWkDCN8LQEvgc4SJPnbijM81rhRRALHvx58fzDvNfBBpQG+bpPjbvT0nWZXAdk0PByqXEhvVqYPHgTGzhBaygondDrqfUrH4ylqiKTW+Gamyo51jFv+GI7RqEC1liejKmD9FJeuv2kjTl3p5D/fCby0UeK5jve2vUqu/xsZ+RUt2S8YFdWfypezCnP0Xut5IRnkLZ2HHB9VKD8l5pzNrHImk1+dDHWwPgQD6VdTSLZ7/WTpR086xw=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR08MB10037.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(7416014)(366016)(23010399003)(1800799024)(921020)(38350700014)(18002099003)(22082099003)(56012099006)(11063799006)(10067099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?VJ7FKpOSwOQOzpV5Fu0Jg2bAJ2MCNlsEu+R9dW9enfgDTO6114TVLdn2Lbqj?=
 =?us-ascii?Q?yzGB+wazeFx8OgbhcemMHdfwA2lH8CJLf+3zsj8ev0qQnvFLxX3STdVcL9vZ?=
 =?us-ascii?Q?H7AiAPh/z4lt4SHtzSr3G3vT/VN/lUy/AL4Rw0VLTW920RjgZua2xIjADBKb?=
 =?us-ascii?Q?Tl4sZiqyfrmBwTS1sBoQ2SY/5iRD+Ehw3+t5eP1sQcRN3C8Yh0YfLBH5vKlX?=
 =?us-ascii?Q?d29qfDOrNkQ3WBMgx8hv7PLa98CSuWVD8kmyNJ0YI83rz1tHlct+BTHlg49n?=
 =?us-ascii?Q?FHc7/rTD+DH/pVRgF7Qnc2clIememzZ22PjdXYz6Uwh3iSQArHTIws8eITmL?=
 =?us-ascii?Q?FjvbjvCaMvb49AwleroJt5MlxThMfZAEg2vfKE/BTm+ZIuU/YX7UkZDijmyw?=
 =?us-ascii?Q?IqKkxsUTJSLaaRqz9bx7KZ7GeR3Skn2Plsu5ZMcLAsl2MlOS2oo7aorHVda1?=
 =?us-ascii?Q?4sFtisnFBe9QbnWNjwZv8pvkuONK6CfKjXIzbm2qHo/YLtqjOB8uYnMP/GKE?=
 =?us-ascii?Q?EQPzEBHIAjsL/SGPhdxNgk36NobooXe0n3TXFazmjvV+LBOyTYgVRluPN75a?=
 =?us-ascii?Q?aTnelL8abgLIDg3jwbCSPUNArqDbezmL5ItaZWWV3nUJ4PYEFSItYsREDCDZ?=
 =?us-ascii?Q?kkxReJUV9g5U8THOlj6lHTkBMBX8wHAkUI9f1QQIhCj+c6H1MV7PVmzDCGiN?=
 =?us-ascii?Q?W6hfP7EGxvtPig+qO3j/k/PdhqqM+WuPlj7cYfMcT8wMCyngCAznmYLGzKLU?=
 =?us-ascii?Q?DV0suCEwLSqHKP34CNTBCYQd62WVW9PYqKf8ksdARly4eKl5maWHKt2GfkPM?=
 =?us-ascii?Q?7Dm2LkeqC4sXW6N+ywqjIgFV/i/ULJHfPYr3tl3jW2FGrscBHHd7aZe0xcVQ?=
 =?us-ascii?Q?Zu96LLsMif2HoVbNxC9L/jvHOL8TsN9cBmxvyhQJPiDG9acGintbtqDPLgoF?=
 =?us-ascii?Q?7xFS9rt6687MF6/QM4HKCnOjdh2tBVsCzqR52u0a4BPYmfC3IZb9UuHOgB0m?=
 =?us-ascii?Q?ZR8xzLpBnpCjCeIzmR6W0qxr8pHCEwecuf4H4nyFgxVdMB7ZOeYMz6yEY4gC?=
 =?us-ascii?Q?IhS+chov3z33uLhetxku+TsFb+UYV+VskpTycFKY81wUIKKQkd0E0lhEPYz4?=
 =?us-ascii?Q?BjJOktfY4GwnJsy1+m55ZL6Oo2/23NONTjKHw9+NisO5j9NOURVNThBwaD56?=
 =?us-ascii?Q?ovip9+//IGa0/0VFkVszy54ES0ngBVMmkf8ScTb487GeE9x8HssZox0qFsjp?=
 =?us-ascii?Q?L7Hgj0ZvMa6DYwlVGWgly8xdXuiDtQrjy8vJSAEOWGl+1ynzOarKQTTQTxxm?=
 =?us-ascii?Q?ivdhKwbPg42fExh9HWhtLRhqliVyNk0Vva0/0s/KnfDZ3c2I8bbhjvEfg6mX?=
 =?us-ascii?Q?K89CMm3OkufwzKTjhlrx1SG27qvL39ORmWcdiw6ylKg1swEh72J2oNB0bZx4?=
 =?us-ascii?Q?fR9FgUUsZPtOjyrrgcuHS+d3tJVqPmdmgOcBfWw3JB96CrBVGkRF2QYATb1L?=
 =?us-ascii?Q?vDdy/PlfKPyegNNW4CGOtucfVaWs78l8OFQ/CC0JsuBPRo+wQMYnPYSRre1T?=
 =?us-ascii?Q?5gSz1bai4ncjSx96jXjlFgkCFntgTfTT8FFck1+f5li+OqnhaMZY4uKJVAFb?=
 =?us-ascii?Q?ADRfAgUDdUR47ib9OqPdDinpTxhiESULgOuMsX/TGJArwbmEb0EAMMTKRpjw?=
 =?us-ascii?Q?UcuyIXFkiDPbpSVtMwhZy1DYOH7XMJzuEibWFOkZ9LgAZhgtuNTn12u5xrYR?=
 =?us-ascii?Q?NA9Ko8ZheZuzR2PFOIfLHmcNLmvow4k=3D?=
X-OriginatorOrg: iopsys.eu
X-MS-Exchange-CrossTenant-Network-Message-Id: 6de7faef-71bd-4741-0674-08deec0670a6
X-MS-Exchange-CrossTenant-AuthSource: DU2PR08MB10037.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jul 2026 17:42:33.8166
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8d891be1-7bce-4216-9a99-bee9de02ba58
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: S9BSKwVX0T9Ql7dTAxI0z6RyBsH6CP0H0MlUONHgnjoYIPZ1cbc2Un4UW4NPuSxjaLo+QUr4wTF2o9vDGNwfZo5xNu9VIVKku+ZlKxcJUGk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR08MB5888
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260727_104242_201333_066D8E12 
X-CRM114-Status: GOOD (  12.05  )
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

In the an7581 case the register at 0x1FA20214 is called
RG_GPIO_2ND_I2C_MODE. The same register in the an7583 case is called
RG_SW_TOD_1PPS_MODE.

Let's rename this register to avoid potential confuse.

Signed-off-by: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
---
 drivers/pinctrl/airoha/pinctrl-an7583.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/pinctrl/airoha/pinctrl-an7583.c b/drivers/pinctrl/airoha/pinctrl-an7583.c
index 637b9377ff8fc..b0b1dbbb4d768 100644
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


