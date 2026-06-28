Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C015C44500
	for <linux-mediatek@archiver.kernel.org>; Sun, 28 Jun 2026 14:38:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=q4NnpCR8m5Q61vaQYwB+tHmg7AS31l7ZOwCdkgSO3cM=; b=ZNCOnhVIUYGfWM21yjIvHQjb5e
	FhHHS4cOp/LDDuYcU5UNUSy0Lf1LOnUZLmyCa+2HvpOB7l0e/pj0y3RVCZvkUFiD+NswxoaI8O1ZC
	wZ1jOhqTWKK7sfecc0AAAZYb/XHumuJbEz61AxTD7NLvVKAOisFd+kO5W/s1FmkrOQV3xv+28k3o3
	/huRbCGH4uXK4TZIrVE2RW7zjyIgTjwUc9WF9Xci35/12BLep549Cyve+sXK3CmOe+6fmhNntpylV
	aZjUxVkhBMw041TnTd23ROKNRkSOSTBlqN18UUbdsTKV7Leoo0ApOXki8XpKP8da2qgwicjiY6gX8
	V4h/oi+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wdqe3-0000000D99Q-1nZT;
	Sun, 28 Jun 2026 14:38:03 +0000
Received: from mail-francecentralazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c20a::7] helo=PA4PR04CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wdqdz-0000000D96C-3I7a
	for linux-mediatek@lists.infradead.org;
	Sun, 28 Jun 2026 14:38:00 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PMqmw1V/QcNqR/YdjZL4jllcmr4tC0j79vZUdX/IqMmRgHAj6gj0VD2qp/egtPbUDs8V4y97GRPtYJlE8cTOlZ1AEsrrwCssg2vJVS5c9QkwJmxlWQvMzJ+4BnfI5wzMgu+/iBMhYA8tZOk6eJ6+SSjir91BsXtWatbW8dD6AhiD1PD1nFzaVEE7skWyf710gKj5qLv+ZlLPObXkipxdNpLC/lZYooHAVt9gJ8tFiwPceS4bGdDgLW/DF3JI5z/3QkubN/WqFomIoXsEek/YUuTWw0UVq4FISVyPSknPdu30x1mZGQhLoEzRa1TTzn6nEEnL7qTGiAfgMn/d4iE/wA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=q4NnpCR8m5Q61vaQYwB+tHmg7AS31l7ZOwCdkgSO3cM=;
 b=Obhx9KId6Jhbj43oclDhOCSKEilFPSndxqjN78soj7wWFcr+WaWMCCO+Omq9Snkyp4RJ1nSNKbmgGCzNk9o6kBi0S2WzDmwGfnHQSGNY1ovb+TIwHZPnA+3m9+qqrcMPQBLcAWx+A/ivj1j3uP9L6UkBt/OD/o5fvXW8lP/VEdMeBHe9WYihEk0nVTW06KjkHKJOK62nuZ74bPtAzvglOakKkM9JVjMO9yIlc1ZN+lPshqkKhxHP0wK+OF80LoC5cvtB2FzrKXd5E8d36ExRCXveu86uGrt5ofF1V89G2r8uWC3rv4oVv4/G6VzUGoCASfQ1Q/vd/JYSYG8JJskESQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=genexis.eu; dmarc=pass action=none header.from=iopsys.eu;
 dkim=pass header.d=iopsys.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iopsys.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=q4NnpCR8m5Q61vaQYwB+tHmg7AS31l7ZOwCdkgSO3cM=;
 b=3/8fByMbqzQAswYueyhWJ3S2OWQCGJBXoTCk23/eHNrQ3EalqqWfRN6Z8lG2UIygWpKNu2ITiBdHosv+qtnzfDDhxbxfeBFgQkibveoMSLlnYZFgdWwl6nR9SqrQgfyekqKTRMICEICJY9Ac+YKLS65WRAc8i7DVl5PSkEHln/ysaZ5BrXwjL9y98PNxRuSMWJT0Pk4vBOWxqzeF1vNlqA8cQM42LIMYybR9DQ6GUg4/haNaiSDScpQjhMYtU7AtdQoSOgDbs6a+jIft7I6cmNQLVuWn7jjdiBl7HiDaY2q5ldXnDJseEBAma/xfbRgV93hdBzcQTrfwdO23vjCGfQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=iopsys.eu;
Received: from DU2PR08MB10037.eurprd08.prod.outlook.com (2603:10a6:10:49a::20)
 by AS2PR08MB10009.eurprd08.prod.outlook.com (2603:10a6:20b:64b::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.19; Sun, 28 Jun
 2026 14:37:50 +0000
Received: from DU2PR08MB10037.eurprd08.prod.outlook.com
 ([fe80::3c7:6d2e:8afe:e4dc]) by DU2PR08MB10037.eurprd08.prod.outlook.com
 ([fe80::3c7:6d2e:8afe:e4dc%5]) with mapi id 15.21.0159.007; Sun, 28 Jun 2026
 14:37:50 +0000
From: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
To: Linus Walleij <linusw@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Christian Marangi <ansuelsmth@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Benjamin Larsson <benjamin.larsson@genexis.eu>,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	Markus Gothe <markus.gothe@genexis.eu>,
	Matheus Sampaio Queiroga <srherobrine20@gmail.com>
Cc: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
Subject: [PATCH v6 03/17] pinctrl: airoha: an7583: fix I2C0_SDA_PD register bit order
Date: Sun, 28 Jun 2026 17:37:19 +0300
Message-ID: <20260628143733.273651-4-mikhail.kshevetskiy@iopsys.eu>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260628143733.273651-1-mikhail.kshevetskiy@iopsys.eu>
References: <20260628143733.273651-1-mikhail.kshevetskiy@iopsys.eu>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MM0P280CA0006.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:190:a::12) To DU2PR08MB10037.eurprd08.prod.outlook.com
 (2603:10a6:10:49a::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR08MB10037:EE_|AS2PR08MB10009:EE_
X-MS-Office365-Filtering-Correlation-Id: 52f6f338-3817-46a0-f0fc-08ded522d473
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|23010399003|376014|7416014|52116014|11063799006|56012099006|18002099003|22082099003|38350700014|921020;
X-Microsoft-Antispam-Message-Info: 0H9/JRL+yt2n1I007FlkCqtJedVfVbh9B22tNVax5b90zdV3sNBN3XzHlYO3cN8n72usgewMjHzaZZ15zvGKMTB6ZdWwIBC9l2KOS8EJ0ywyhKYpuBvrqIgi/oOsQtdQ+PfQ/urww8WFbRZKzfvMz2AXehTVtnTk97tfDB+QKHIX/OgMZj9jW/a88m4M3ryXHqgdc5HWtpW+UQ+O5RWD9gnqULiQndC2c/wOdGAVEEy1oizPFp+bjMKQIjk0N2+aDvzD/EAU3v2lZfCT59dnb/6F68PJl3CWTO0FEwrbWYmuZIUDkveYI5RMXvEOdAe4xtVrDYmsnIeKEJ/TZGNWMeRb4nB2LDSlgYa++ga38k66LG55tNhxnT8jOmioI6Z2bzfurTHoMVBFs8sI0EieOywEwGncl16976vxJx1u81cpLUPqQVFvHO9kBmgseW97ZLFkeX+JtNoAs0pTp/yq5swcNtAFoSvxscuegRL8dnkJz99/zGSNx0IIYTxv+uHubWeJ6jUIY9NvW0DHN41JvN+aN52Rm2UVjZ5CPCv73AJyni5njhdKk7jnWZDibRvCyhYgRbc5bweieswsZH5WUDq6gIteP0S8npJB4J47ntcqp6Pn3kTaIJYpDq5cR8yXKg8uBTDm6qg9eV5eHa/yt0S8BRKjuKIwspKuCyddIbFlHIGkKXp8fl8uPxGppLRQ1+cV+7xknY2QdqEETuVKG5NWbqtDg5VYN7xk30FlDT06dfvn06zhsvYt5nqrYY3t
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR08MB10037.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(23010399003)(376014)(7416014)(52116014)(11063799006)(56012099006)(18002099003)(22082099003)(38350700014)(921020);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?dvvZyVpvemKfRyzvCFTF/BMlEAU5i/Oj/n4nv/B/qgOTgPYK+fa5p9C6/daS?=
 =?us-ascii?Q?yXpnoOpsZoiLTXPn8B42AdMVRayEgJtQFqH+yX0lylJOtqgcqdcJ7V74XtMV?=
 =?us-ascii?Q?N/Kbtbe0wrKZi19cgzbs7cslQeF57tQBZ8w57sFYSV3V9RcmIpN0C6By2vcv?=
 =?us-ascii?Q?TG6iw/s2ps8AQUoCmbX4N9u0EVE/GqCAJ0k3aWj4fIV5hTEXRzNBWDRYz2/C?=
 =?us-ascii?Q?zJTMKlnVIzJ3ZZdzJLMk9ziwXdQsUZXyIvtVJS/L6E+YSKEhEboMQMd7BW9w?=
 =?us-ascii?Q?WaRCILRwYMKIkaesqEal63FTMkmnNkeQGCNpDa63OY2G4/3LIYbJTmoO0WtP?=
 =?us-ascii?Q?1xkftZiCPKn4D6wNQeMBlBKKSaVcTKCfveikWCOw0zCJI6sRL7M1JTvL3Yne?=
 =?us-ascii?Q?HeTKInHqhkDqC6dOzAH753uskGfZm7MoX7aG3boi93Yjcja5Gqa4GKI/VVj2?=
 =?us-ascii?Q?wSB12BrbOC9aj9pmVSgtAt/CIUivNXev/zxFB429HRYRQDKx73cRg2iYEpM2?=
 =?us-ascii?Q?DpDzUJZDxMSLUUyOQQJy2f0VTPQccZxENE/VaJnoifGhqsBXRZH9eB0VxKPb?=
 =?us-ascii?Q?waBMLJqDvX+SyBhSBYh6ubVcHhS4sJiSOhjB5dWH8yFrTOMkhIzJhgfpalG3?=
 =?us-ascii?Q?gmHCYiA3H1tH8il6cqoXzDl8dUZjnXwaRJ3tMtcx/qesUqXtsc1HqGkHMMZr?=
 =?us-ascii?Q?3OtQmTGdXGLT2HRkqXyBza+Dg2fpWHU3Juy5NOIxKIH+otHIxg1w6XX/HyB+?=
 =?us-ascii?Q?tyUCnELWIp39mVRY2Kwri0/wdr9YogzQRduGdrN5dFQZv7jnsS7xT8M+186p?=
 =?us-ascii?Q?zz7pB1XDE7scNunNdiEbJ+1Cb8drhUWe8TY+UvcbP3yAD7YHXpIUv1DaP27i?=
 =?us-ascii?Q?YLmssc6hDuNJi2ilmPF/ScCJFHdMSrTXv9llfip26D9+s++t9lS3DGEUxMN1?=
 =?us-ascii?Q?e1LucYlgT1g0/dpT47558L+pfswvtyUj4qoar3/Fa8R3xJ8CmlyLqCaJ3ASB?=
 =?us-ascii?Q?vP2XWPh8yj4tykDL+HEi9DJFbu0EZoM2zhXaGnB1GrjNbFDgCzadUcDq9poy?=
 =?us-ascii?Q?korqY20tBQKBd1kraQsnmMMN4x0PtroIu+W6QGf0j8pN86rCd9jQGD7qFclq?=
 =?us-ascii?Q?pXl5H0Pjz4ShbnJaWjhMotyFaNT5Kj31GTT5vij6z2SkTHrZk5UmRVz8/ILn?=
 =?us-ascii?Q?3uRZx7oXCZ4dY6fvpsm2i3dCmc1IHT8MXPjkrbDLcSTlBkcYzIgDKmiWjSW1?=
 =?us-ascii?Q?HjhA7CjWC2r8XPxaRjPyoPumW88Pep6fI4H6gpv8a0XLGd763bwijfgaoOL/?=
 =?us-ascii?Q?MzZVfOA9LmLmR1QGVTiYsSuPJwwvE196gjA3fB5ulJ8HyKvBHb/iBB2OfS0Y?=
 =?us-ascii?Q?sovUG87JTioIEpDqkA3oO06AfhTPOdYUlklUkIWsSMMcLavGjqBRJ9C07fVW?=
 =?us-ascii?Q?pY7DSG19gy4cRbljqKHQf0ca3vejQQG5prm9Tb9Ps7FPFn/7VWf0VerbaHXu?=
 =?us-ascii?Q?sYea4MuqHP5fJQPLV5h+2tzvJbYpSTkg042UQqRaOlzwOy1TPrmUHnW5/nV8?=
 =?us-ascii?Q?kKWUv5XwbuAoPgQ9LOhQe8yGl49O/05OzjdSMlYayd+EZZt9RpWbFXmCs9l7?=
 =?us-ascii?Q?8vR4F0iGyzjFRNcjYWlaKPMW5Gwj7dhYnbQvxis4o/yQUF7jmBz+OozTgPsE?=
 =?us-ascii?Q?KAfntKll0UB+jcokL6xpeZXBLqnYr8s6rpyb8aCl8Nxvg+vqvJCBgh21zgbi?=
 =?us-ascii?Q?htrTK4xorMohmwEBqCXFBaJzpPS7cXI=3D?=
X-OriginatorOrg: iopsys.eu
X-MS-Exchange-CrossTenant-Network-Message-Id: 52f6f338-3817-46a0-f0fc-08ded522d473
X-MS-Exchange-CrossTenant-AuthSource: DU2PR08MB10037.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jun 2026 14:37:50.5182
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8d891be1-7bce-4216-9a99-bee9de02ba58
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PZj6tYRqu4v+FFB7V825w13tQVrjQa0qa5gV6ovU2GkNtYwNvijDKPPbvgwZjcdUw6OBDyHAii9kmUUBB5TM+RrWNT8rdKKdf8D3q6xsHjg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR08MB10009
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260628_073759_898962_78B77D0B 
X-CRM114-Status: UNSURE (   9.16  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

I2C1_SCL_PD and RG_I2C1_SDA_PD bits are swapped, fix it.

Fixes: 3ffeb17a9a27 ("pinctrl: airoha: add support for Airoha AN7583 PINs")
Signed-off-by: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
---
 drivers/pinctrl/airoha/pinctrl-airoha.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/pinctrl/airoha/pinctrl-airoha.c b/drivers/pinctrl/airoha/pinctrl-airoha.c
index 63c82268aa82..4076bd0261d1 100644
--- a/drivers/pinctrl/airoha/pinctrl-airoha.c
+++ b/drivers/pinctrl/airoha/pinctrl-airoha.c
@@ -184,8 +184,8 @@
 #define I2C_SDA_PU_MASK				BIT(0)
 
 #define REG_I2C_SDA_PD				0x0048
-#define AN7583_I2C1_SDA_PD_MASK			BIT(16)
-#define AN7583_I2C1_SCL_PD_MASK			BIT(15)
+#define AN7583_I2C1_SCL_PD_MASK			BIT(16)
+#define AN7583_I2C1_SDA_PD_MASK			BIT(15)
 #define SPI_MISO_PD_MASK			BIT(14)
 #define SPI_MOSI_PD_MASK			BIT(13)
 #define SPI_CLK_PD_MASK				BIT(12)
-- 
2.53.0


