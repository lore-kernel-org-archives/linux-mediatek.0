Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 896B9C55ABA
	for <linux-mediatek@archiver.kernel.org>; Wed,  5 Aug 2026 12:35:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KhRkIrDdRK92RD50Gd1PYczuJhXOitD3Dtoc2/SAdvE=; b=DFOSbvgaR0jExylQRRVfUC53rr
	YmZW0gOeIoC46drz/OuiFgL7Bbp7zOA0MFWW3sej+ezRykhW9YNDwohutZx3W+VWugndTPD2gYqIa
	jMK5LkilXFiFXWTMjhPw6Q0NkMd//qgWs6Vq407FTh7uyxpOAfyOLo81SznrQfT3R5zcBlOfsu7hR
	0YWZ+Apmfnf8aCJUpqks0fb0LGJ1BDa6KdFX7ZioKxBdvJxBVOuidEBuHVob8D2A3sBd/RyxzVJ8e
	+m5qlgqr9IKoVhMyg8WEww1AGIkmf/F2bqXAenU5afAmz8NlnxBzUvjbzv3x7Q/zLOZhKvXgGQ5Sl
	7joUc4AQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrapx-00000003vCs-1vIW;
	Wed, 05 Aug 2026 12:35:09 +0000
Received: from mail-francecentralazon11023093.outbound.protection.outlook.com ([40.107.162.93] helo=PA4PR04CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrapu-00000003uqd-38HX
	for linux-mediatek@lists.infradead.org;
	Wed, 05 Aug 2026 12:35:07 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YiCXfQqtCHc0YgqMm580mHp7tzqamYBieM9NfCAdABDQJMOv+K/lDFCDcSPiPXIpV96Ripmg6FPBLdPvTaxLmFIk7/R8qXYqnQNQK1GbGjIyDNGDAimtecqDY3Px7Jo2s7kc9TkRViA1ILX4kWrISzS71vD7i2cWK1zHajKsA9yOaK/tszqnSqe0NJMruCfPRfTABVDWoxT64A/4/47lE1WiJ5A7AhffXDKjp2BpTL2dzhe2iomukSBEbhrh+v0z5nU65FNNyH0rgQccCvlvokln7wBq9JAkSWf5LIihFG5wbDE1m04uJ0sd4UvCfRi0zhToovczS27CVL8NB9MmYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KhRkIrDdRK92RD50Gd1PYczuJhXOitD3Dtoc2/SAdvE=;
 b=wVHjlxEfa8336z8sjBrdggIfGhUyZe2wH6AYoAYOKLyPjlJn3ZytTkFHzfMGJLCr5ThJ0JUQGfWoM8KOqMYvVYYf7ygi+4edqDqlkmE3A5AlumVPRAxyBcLCqKLmsHeDZEV/+iuyc5Q/5G/2hoANUtHFGPQXt6QhTY/bZzWtsnQzZcfRIbXOvKxczhVk4CKqhMHCVe7bQh4yujAw6jBhXHzQGa4OCrGKO9i0LJ64rSXb7maMFwBccH+ti+2a4UVXQe5CbalNJ/nzCnGDXhbfAtnVzjSSDizZawJkvm59VVbQwQ7xf2/AxtHFwEZcd9QSDm1jcScXv4ur265wbfFVdw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=genexis.eu; dmarc=pass action=none header.from=iopsys.eu;
 dkim=pass header.d=iopsys.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iopsys.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KhRkIrDdRK92RD50Gd1PYczuJhXOitD3Dtoc2/SAdvE=;
 b=QnF+k8Zbcd6Z77XI30jQ1IInaJkeVSd1h/g/06YmuWQsbRp4lAApHFuY6wl4vG3Z5h4RkxXsh9LKOK9e6wpt+sXXarLueMobcK6OdrzTX9rZx62ujdsJX9+PpU3IKEKlzhWripjoj+CclxuBDLsaSNNMbvkKIlm/3jRSmQ4OCX3zibXT/KhpEIvcB9nK72B4fb4FAb5X2L8MHUQjgmbuG8Ga8iLnlIAxeT4P/p0+TDIGCFmgZF6jhj26STMM/piEeTd6QArpuhjEVwTwClhQHnVrC18KDEbnVhiEflWroT1klk3T5td/lLm4SK1R2PqL0pZGDf3VWIx8Ct5TumgFeQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=iopsys.eu;
Received: from DU2PR08MB10037.eurprd08.prod.outlook.com (2603:10a6:10:49a::20)
 by PAVPR08MB8918.eurprd08.prod.outlook.com (2603:10a6:102:323::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.19; Wed, 5 Aug
 2026 12:35:00 +0000
Received: from DU2PR08MB10037.eurprd08.prod.outlook.com
 ([fe80::3c7:6d2e:8afe:e4dc]) by DU2PR08MB10037.eurprd08.prod.outlook.com
 ([fe80::3c7:6d2e:8afe:e4dc%5]) with mapi id 15.21.0292.013; Wed, 5 Aug 2026
 12:35:00 +0000
From: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
To: Linus Walleij <linusw@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Christian Marangi <ansuelsmth@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Benjamin Larsson <benjamin.larsson@genexis.eu>,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	Markus Gothe <markus.gothe@genexis.eu>,
	Matheus Sampaio Queiroga <srherobrine20@gmail.com>,
	Daniel Schwierzeck <daniel.schwierzeck@gmail.com>
Cc: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
Subject: [PATCH v10 21/36] pinctrl: airoha: remove not needed irq_type[] array
Date: Wed,  5 Aug 2026 15:33:53 +0300
Message-ID: <20260805123408.3767648-22-mikhail.kshevetskiy@iopsys.eu>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260805123408.3767648-1-mikhail.kshevetskiy@iopsys.eu>
References: <20260805123408.3767648-1-mikhail.kshevetskiy@iopsys.eu>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR4P281CA0065.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:ce::8) To DU2PR08MB10037.eurprd08.prod.outlook.com
 (2603:10a6:10:49a::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR08MB10037:EE_|PAVPR08MB8918:EE_
X-MS-Office365-Filtering-Correlation-Id: 7986c3f0-b4ac-4171-f83b-08def2edf781
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|366016|7416014|52116014|376014|1800799024|921020|38350700014|6133799003|56012099006|11063799006|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: J8k1q/6MwmFaU6Vy44FPinOblkh8VfXvfG73+u64M7Y2bn5NVZDoF/tAhbdy/510P/iEPHhg9xuNu+1nwaqmJhNUmn3HRXpyqUdjQiEVE8e3llH2IHHhXD5o81rw0CGOA/Z2CdnnmqUHIbBTufFMjJfEd5j/DNU2s2qC7wIA9WcqGb/JPgo1oYVRiWtlEmZyICw6rkPq5FT/prY35oO8zAkt9zpdTaKMjEqzSv5zshddmtGFFOyg85Xeg7ieLs5vD/zCUPkmdiVWED5x+opZ3YQQ8fi5Uu3SUc02cXSbfxeh7oL/AkGGlpGhIODdvo1EuL2BzfdXaPgEen+yzkebgYq6Nwk8Odm5sHez4k+M1YKGNE6w4PZxUFEvXALAogZbH2UaodRg8mZsyXDcKPSxiI+73cKmUjeJTMiByhzwux+qBcwd8fDNMeTH7PAGTUy3YxPmIbQgZmHHJcihD0Nws+nksoWVULVOEAnBVZIOiSmGpKGRyd7Q4LLfKDkXlxn+q7FeMp8GQdFNO5a+8nu/l/mnJumfJD4m1s9bPCJ2yaI3SxB0RKrqvqA2NqPa31Kg2YZiFfgs2n0xDNnnz1eiumDJhDyu6R+P0SI8x4MywCE5EvImrxve9cMOvcfSvuDR/vVWsuBvDhSE0Va/coJOS+ylXFMqUkjn9p7qiZbnGvaGdKI/0JSfU6ByItWw4NaAPxF2tcuioyKvgZDP06CRIe1SSDEWr0/8Ju8OZsoVKXkBxdg/6/j08f/vKuhRcWHF
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR08MB10037.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(7416014)(52116014)(376014)(1800799024)(921020)(38350700014)(6133799003)(56012099006)(11063799006)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Hp0XrsR10DJ+XsDxKqmcoYT45uBywKa0kFAX8bmpjzN+zOHySHLVYoay9xIW?=
 =?us-ascii?Q?lRfaFM5XlYU76dwCAIlwzVAwpkwM9Yoz/ZXz2iWzET/zE5t7osqYDqM7EyLo?=
 =?us-ascii?Q?qNKLDXxpxKW7eC6GxSYLIqbDbNi66GCmiptzMIOj0AxdZ64+hWlsBhZNKLYf?=
 =?us-ascii?Q?P+BPBBpAiqcPIGRWRgvZyYobRjrThZPzWFpc+Ww5LbxI2Pf9lskpiFLSf7B7?=
 =?us-ascii?Q?MQJh6BYq4iah6o1+WLT10IyWXq4zM7CVDfPaMmuYV4RX5zSiWgkqPMKbhDgD?=
 =?us-ascii?Q?uIoT2Ga8l1w/YdV+9tHwkA1Y5O97K8x5cy9SRcufaPDqH3ZTXWtIeWFg4cXC?=
 =?us-ascii?Q?tO9FtPeriSQujfRfguBsHJjqD2cDmw1PeWrbS8XCBd/uZ6hTwXBCpMDtPuDP?=
 =?us-ascii?Q?XPhTLsf7RkBQs0rvZAZ5xihgjV9OqVxeB3rMMQP51hUgFyOyj383p+gx5Br7?=
 =?us-ascii?Q?aaNWtgeZ7pHBb93fFiVnBTToHKLr8tJKQJOjPE2USOP0vY/p3u4f9bR6Iijn?=
 =?us-ascii?Q?OxiUacShluA4LuxMijWvCb9aQGhSJeOVWI8r2gW4BKgCUhCxD1wXbfwotqQJ?=
 =?us-ascii?Q?X814LpqEn+5yx+1qOVUyeuqjBQZmnLs4+xSJ6fwtYgsgkXuZVYYHr0GW8XaO?=
 =?us-ascii?Q?nfuTN2RdyvhiX/A2CmRmenvgv6cN89xv8T7wBOmUE9AKLY+SV8qV5Vp04MLb?=
 =?us-ascii?Q?WK2vvLa8MtTy+gqtaXv4pQEIb2p0Zm81TY3/IDv2ijfyy+PtD0mkSjmDO4+P?=
 =?us-ascii?Q?FPCzDxXpt7Sg1rqB0ADJ1q2F69fPf7n6wjpRI48O09s4v54wCcmpe5eFoNPz?=
 =?us-ascii?Q?VQu3p00A4NGDNc4QAw81X1tXzXxG/zYuZCh/J38e/MvKPboYrx+Ro20cfwrR?=
 =?us-ascii?Q?tge0QX5ZRVQPdNKmxCNAkrozNOrPTClTNzSbr5nqK7naZwVxAPNPR53Q1Dum?=
 =?us-ascii?Q?uqy46xwmybEyuvrfW8fZto/k9PnJIgREbbecF4K4UpqRarHWmP0Q1iTzifGX?=
 =?us-ascii?Q?iymrTQXMMP7Us3q6YvfCM5Fk8rwjZUk68+ZGQf5fSaHp2RvL0dD96HdKzBXe?=
 =?us-ascii?Q?A31qJkb5BJH20nQAGdE9S43NpelbdScJCWmQKs6exObsSk51MGtrroU3+7ZV?=
 =?us-ascii?Q?P0Oxe/TwmB7+pr7omtdXgNv2mthzV/LQhDDU62iqekwyqPu3gQZU39/3l/6i?=
 =?us-ascii?Q?bS+ycuQ/zD80VVllha0+5+h7AfM6lXSK89QT1I24crXnKcbxa5rXbVxpRVUT?=
 =?us-ascii?Q?j738zNsKPVZ1O0XTREwMhTgeYpjnp+TmrrA5BBjp2dH+gchxQPV8rIFTj/8z?=
 =?us-ascii?Q?sYEB06vIGIOkjFW6D/RDXbBUWnhbsRBLJTwu2f5ygFecfAtAAqlIZ26GuBUf?=
 =?us-ascii?Q?yx//G9yfiBZcH4Z97qya1hKVKbkvxe7p7GnfOcZ+adoWGzke9PvNO8/az6fA?=
 =?us-ascii?Q?P9kb8PfdBnPuoHPJ3aZqGIg/GeJ2UP2ALhva0Lc8ZZUzGd09rTMdFWSWSJ9F?=
 =?us-ascii?Q?dZxooZiWroUVPuTfsvs6h2cZQQ45E2I4VchPJ98tdO0DgtCkBe3nj5p7tzuJ?=
 =?us-ascii?Q?/9OflnoQLcK5z+PEcEpELSh7ybwtbV6mv+a4Om751DcgIuGFz+tAquDFcYjo?=
 =?us-ascii?Q?YHJnREvKuOU5C++gYWaC1aGVwZlQnDbySx5zcnAfFCQy6javBW26TbtMlksV?=
 =?us-ascii?Q?AXvxvHc/lQQv3mxAjRIsCZgclqjiwE6NqOm8JQ/EwAR+THyMCAlQF/ON+uc8?=
 =?us-ascii?Q?aix+RWy7db3fVguG+pOSky7N5PRCwUk=3D?=
X-OriginatorOrg: iopsys.eu
X-MS-Exchange-CrossTenant-Network-Message-Id: 7986c3f0-b4ac-4171-f83b-08def2edf781
X-MS-Exchange-CrossTenant-AuthSource: DU2PR08MB10037.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Aug 2026 12:35:00.8124
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8d891be1-7bce-4216-9a99-bee9de02ba58
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sYgJtTmU3D4/Mg63Y+leyqOeFEaUnk1lJnVpDdHCXN4zjxJFyBNBKaAcVwFuYfPrT7D2t0ONETzjXoKGHRasIz6MsfslImDSFMRrmWH1OgM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAVPR08MB8918
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260805_053506_793865_36712973 
X-CRM114-Status: GOOD (  12.70  )
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

irq_type[] array inside airoha_pinctrl_gpiochip structure is not
actually necessary. Use trigger type from 'struct irq_data' instead.

Signed-off-by: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
---
 drivers/pinctrl/airoha/pinctrl-airoha.c | 22 ++++++++--------------
 1 file changed, 8 insertions(+), 14 deletions(-)

diff --git a/drivers/pinctrl/airoha/pinctrl-airoha.c b/drivers/pinctrl/airoha/pinctrl-airoha.c
index ddd86f13e4f9d..08715a37f0afa 100644
--- a/drivers/pinctrl/airoha/pinctrl-airoha.c
+++ b/drivers/pinctrl/airoha/pinctrl-airoha.c
@@ -383,8 +383,6 @@ struct airoha_pinctrl_gpiochip {
 	const u32 *status;
 	const u32 *level;
 	const u32 *edge;
-
-	u32 irq_type[AIROHA_NUM_PINS];
 };
 
 struct airoha_pinctrl_confs_info {
@@ -2592,11 +2590,11 @@ static void airoha_irq_unmask(struct irq_data *data)
 	u32 mask = GENMASK(2 * offset + 1, 2 * offset);
 	u32 val = BIT(2 * offset);
 
-	if (WARN_ON_ONCE(data->hwirq >= ARRAY_SIZE(gpiochip->irq_type)))
+	if (WARN_ON_ONCE(data->hwirq >= AIROHA_NUM_PINS))
 		return;
 
 	gpiochip_enable_irq(gc, irqd_to_hwirq(data));
-	switch (gpiochip->irq_type[data->hwirq]) {
+	switch (irqd_get_trigger_type(data)) {
 	case IRQ_TYPE_LEVEL_LOW:
 		val = val << 1;
 		fallthrough;
@@ -2628,7 +2626,7 @@ static void airoha_irq_mask(struct irq_data *data)
 	u8 index = data->hwirq / AIROHA_REG_GPIOCTRL_NUM_PIN;
 	u32 mask = GENMASK(2 * offset + 1, 2 * offset);
 
-	if (data->hwirq >= ARRAY_SIZE(gpiochip->irq_type))
+	if (data->hwirq >= AIROHA_NUM_PINS)
 		return;
 
 	regmap_clear_bits(pinctrl->regmap, gpiochip->level[index], mask);
@@ -2644,7 +2642,7 @@ static void airoha_irq_ack(struct irq_data *data)
 	u8 offset = data->hwirq % AIROHA_PIN_BANK_SIZE;
 	u8 index = data->hwirq / AIROHA_PIN_BANK_SIZE;
 
-	if (data->hwirq >= ARRAY_SIZE(gpiochip->irq_type))
+	if (data->hwirq >= AIROHA_NUM_PINS)
 		return;
 
 	regmap_write(pinctrl->regmap, gpiochip->status[index], BIT(offset));
@@ -2652,28 +2650,24 @@ static void airoha_irq_ack(struct irq_data *data)
 
 static int airoha_irq_type(struct irq_data *data, unsigned int type)
 {
-	struct gpio_chip *gc = irq_data_get_irq_chip_data(data);
-	struct airoha_pinctrl *pinctrl = gpiochip_get_data(gc);
-	struct airoha_pinctrl_gpiochip *gpiochip = &pinctrl->gpiochip;
-
-	if (data->hwirq >= ARRAY_SIZE(gpiochip->irq_type))
+	if (data->hwirq >= AIROHA_NUM_PINS)
 		return -EINVAL;
 
 	if (type == IRQ_TYPE_NONE) {
-		gpiochip->irq_type[data->hwirq] = IRQ_TYPE_NONE;
+		irqd_set_trigger_type(data, type);
 		irq_set_handler_locked(data, handle_bad_irq);
 
 		return 0;
 	}
 
 	if (type == IRQ_TYPE_PROBE) {
-		if (gpiochip->irq_type[data->hwirq])
+		if (irqd_get_trigger_type(data))
 			return 0;
 
 		type = IRQ_TYPE_EDGE_BOTH;
 	}
 
-	gpiochip->irq_type[data->hwirq] = type & IRQ_TYPE_SENSE_MASK;
+	irqd_set_trigger_type(data, type);
 	if (type & IRQ_TYPE_EDGE_BOTH)
 		irq_set_handler_locked(data, handle_edge_irq);
 	else
-- 
2.53.0


