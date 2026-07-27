Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B99B1C5321C
	for <linux-mediatek@archiver.kernel.org>; Mon, 27 Jul 2026 07:43:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lzT7y0urnKtTvO7CKnAlKHVlomi4YgmctQvTS6EOr6M=; b=e0m49Oo8p7RBYxCwzz+/aUvdb2
	D6ezApKEj3pM14xvWnQeiUmLm0TUR3JTVD1i0ktHyLfm49JVXUJns/f7WNSVLv6uOJMa514X0Z+ac
	FovP/tgAssnlSnPkLhmT17pATlwLd8/icc+7ZHwP3D3vtmC5lfTqxW9elEDeASH35c7F4SeXwtrj6
	A6stFIQnaNaI9XcEGJtOuK6ydHY3YCZ7qAS7t8ZZiGxVh4vn82xbe/Upcojx7K6XohviyyZdVJ+S4
	SKHaIrGq9gBKo7SsNuPLolP1SyMp8MaZtTCf5dUBXHqWFAIvq/wjFbmZBgbkIcq7C7uZWny//Rp0y
	X1C4Z/fg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woFze-00000002AJR-3DI6;
	Mon, 27 Jul 2026 07:43:22 +0000
Received: from mail-swedencentralazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c202::7] helo=GVXPR05CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woFzZ-00000002AB1-2jXU
	for linux-mediatek@lists.infradead.org;
	Mon, 27 Jul 2026 07:43:18 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EYFbDXAzDZcejb6YGK8cdzicgUQBJBRXlnxIAajHY56uo6tUFg+NYTFw7Ak6m1ZHd1/8IkuGW2in95exqPXYn8aOp8rxUSOke0MLuQ4pkl8gw78lOGmpiOhR1AbL0bNHZoyEs7DAJJPMO8dQYwqMUJDC8679E4Ej8Yy695L7wiNJnaaSz/zalL7/+JQNmxmfN9CHjubZWgcKhwwUtOxB/J9lI9C6zuFL2Do4HGuCk/urKT6lyh2A/CYkESA3Z1fhHWduea7dj0vakCiFmS8mOHCXSVfTSzZAt4t826a/CVKg3GOD4WN7bInk7lzUu9HLVzRoXEl5trt76XzM4Dfy0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lzT7y0urnKtTvO7CKnAlKHVlomi4YgmctQvTS6EOr6M=;
 b=b6DdX8RA8O5yWAD/FxLKbA3OXSPfcao+/G35gYl0jmBsPJZH3uv4ZSA9PsXm0ef2IyukB97ZZZQ2wadimPelBWqiRdsR2qYXeI878QtbyyP4Y+cH28cfI15PBcMtfxmt+sP60nwGK8ytlcVe8x/Q9wvWaDKGURgdQ9lPDJ0oLQuYmUKOrW5um9bUbgZ11F8aHntpJTtiUuPDmL8gh4c4StDKzjxBYOXDTvwm4apKA+4dzzwnJwZWUvc5sVKjz048rNGuCpPSQ7bjgu16ZEHPJz8c0izGEzx2rbbPthPhg5QEqQmnMVq/Io7vt0YEu585S1r4ZI1kxApuZip/0Q6lKQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=genexis.eu; dmarc=pass action=none header.from=iopsys.eu;
 dkim=pass header.d=iopsys.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iopsys.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lzT7y0urnKtTvO7CKnAlKHVlomi4YgmctQvTS6EOr6M=;
 b=yOQ48/umF/SERptaTuXYQZ8LoCCWlTkW0AMpXnp/UM2vmSjn0Hywh5E6CsRHzjhiNeuPok0lk4PRZFk/AwHEuUY077r0jhGxCtrXbnskF499s2tmN6TaJUSwUa3JrQ/cct1eMNRVhvVbDeoPx35dZsVTLe3vzIJliiOkX9yf1p70whevFv+m8AIwSXYYuKCeI80s3P77bSa68cYwiaPeP4aH7NkNHjXQKRih8rVjLqcg2Sh2WOVQ7wGFOPH5lMAF6kfDdYQ1j0vcDwcUO32i772IBEu0PVTPoYrulVTZ6LhfnAbAWgZ4hAMiGo+rRcfIFmBJJ3tEaPJGnSMiBarCkw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=iopsys.eu;
Received: from DU2PR08MB10037.eurprd08.prod.outlook.com (2603:10a6:10:49a::20)
 by VI1PR08MB5501.eurprd08.prod.outlook.com (2603:10a6:803:138::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.13; Mon, 27 Jul
 2026 07:43:13 +0000
Received: from DU2PR08MB10037.eurprd08.prod.outlook.com
 ([fe80::3c7:6d2e:8afe:e4dc]) by DU2PR08MB10037.eurprd08.prod.outlook.com
 ([fe80::3c7:6d2e:8afe:e4dc%5]) with mapi id 15.21.0245.012; Mon, 27 Jul 2026
 07:43:13 +0000
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
Subject: [PATCH v7 15/34] pinctrl: airoha: fix IRQ mask/unmask code
Date: Mon, 27 Jul 2026 10:42:15 +0300
Message-ID: <20260727074234.3761170-16-mikhail.kshevetskiy@iopsys.eu>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260727074234.3761170-1-mikhail.kshevetskiy@iopsys.eu>
References: <20260727074234.3761170-1-mikhail.kshevetskiy@iopsys.eu>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR5P281CA0051.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:f0::20) To DU2PR08MB10037.eurprd08.prod.outlook.com
 (2603:10a6:10:49a::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR08MB10037:EE_|VI1PR08MB5501:EE_
X-MS-Office365-Filtering-Correlation-Id: 3cb66954-81ff-4da6-2d21-08deebb2b621
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|23010399003|7416014|366016|52116014|376014|18002099003|56012099006|10067099003|22082099003|11063799006|3023799007|921020|38350700014;
X-Microsoft-Antispam-Message-Info: euGdvTm6OlQdpTO1CLV1w6fW6HmzYN7PUU6m0kRb5+QirWCa9F2wcLTvPi99FtZ/ntEC4NRzWoQl5PNwSwx/iCZSZaFHFbxsu0O7NfvsFyJSiywIwXq4H7drNaiYY0AQqXyTYmvaRQEO1ekfZm5nbMWa/WRePH+he8HRpCZlVXF0Rhci/iw22HxNS4oNQgs9EPGwQ50oJJIBwd4lvOX5TT1HbZfM5YoUrMLQAhHqXHE62UihWuQs0PTgwqArW0USw+dp7PmSM9GRar6XXtvqNkZRpp45lkxoE5mWgwZclVZ8J2EmpffWNsdUet8ufYq7dpPRSlhYXID2VRIi6HJ2w3IeQUZUst0rjHUgTlkKYlKI2PsrPPPD51LyrrQhlNx+klKmUjtW9MBvfPtN8m7yqMJ9Bqfng8DjnKw1LVFfOxAfXbItiPlqfUVl6rlyI/8oxWfya+Aj+3LRL8n6QpIIaAmYpQWQc9w1zuqA5ti8TLcSo3KgisO/5+eor3qjdYdb0sfRXMhJWQjdr2uOdEI23e9DT22b9ctkp7czkD9y1rueoHnSYYXevIG4X8tR5b42XE9Cx4Dn0bIk/Sedtzb1nvOUK/10oY5qKgY7bsnBCMoyjqOkY3u+C+IP+vtE2lsPDqyQQ0m0SBIPphEkKhQRYMeDJ5K573OWmEpvWrvAAOQoMplZ/viegndpgc3Oo5IioxXhgLB/6WkOB2Y1wDhSpfFzvFN61klXBvpN9GsK23c=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR08MB10037.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(7416014)(366016)(52116014)(376014)(18002099003)(56012099006)(10067099003)(22082099003)(11063799006)(3023799007)(921020)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?IhoGVxq177g5pg+DeH0sDTIM3mrQesIwtiig91KXQ6LkcLEFHRKK0Ei0vTpi?=
 =?us-ascii?Q?5Mkd8TBM95HaBsuwsRG7BwlGh/7abKRiNPoeu3UOUXe9946be7yUfs2XSF0v?=
 =?us-ascii?Q?LMP7H34m7zz78XST6WcDzvV+Ggr3H3S/PHhhOyNI9wnv3uGXVlBaVYYSisaM?=
 =?us-ascii?Q?liy5eOF1PPC74iEAP7kAwic5jK2CgnxmkyD6NuI5cOkmJB+mFLtlaEBnGoCI?=
 =?us-ascii?Q?SdTlM1AexUEmF4lWPy6ZaVe+AvSJYkS/Niv+D3t55dUIHo36obBq/ApyXaSE?=
 =?us-ascii?Q?ZWkFMm/DwVT3/8tTjTUo+T1Jdihj7TEK6VsTUhgMkxjQCFNHVMvXcLwU7nPN?=
 =?us-ascii?Q?LkJC6Djg++vIF4GwuSs69QoqeXtHDLTXiI6P86cCQ4o0V9rvdxBpTp0EgsKa?=
 =?us-ascii?Q?qnSPw8YQgiK3NTAW9H8DoOYFrfMzhrKC9RPXSz72mn6PmBPeRO0EyE/gnpVg?=
 =?us-ascii?Q?IyWZ9rN/t92DTo5Zz0KrbBvLmIjb3YoRo5jakvZYWxgEQcDexFT87URz4z9P?=
 =?us-ascii?Q?x8IPzoEMhwqtLcTdWEOmtCK2XeIoGZquCRsgdcTE0OekzCNv0z57wz0R6jvD?=
 =?us-ascii?Q?/B3SA4NBykG0Z7h+EUtZWoCsV4+RXyanm7gXNYCHUsgPPM+GjDBopk8gdHsn?=
 =?us-ascii?Q?UuWNWdJeaS2BR7CsBKmzXSDAXCYzfFwh5XxB3tg5T0KP6EgcQossAcRk8Cua?=
 =?us-ascii?Q?Pen9Nll0RYznso7LlF3aDlABQmizAVTRnmCwKRgqOd253y3jXAdgDDoRHr34?=
 =?us-ascii?Q?kuOpJW+fkr5hf8/7vx/0wAM2wj3fYtdiPrs2WPmSVUNbM9b9t613Ns0EKcW0?=
 =?us-ascii?Q?mtEDXpqrc7Itss4SY1+Kiwf03ujU+J9KhgVOgKpEbuEMsDdIucy3jeQ4V3BU?=
 =?us-ascii?Q?V5UmkKBiCaIM1Ad1xlkvMYnqGiMnw0DE2eg04jgETtU1PV8vwMskTb5OfvQk?=
 =?us-ascii?Q?Exrn8imp5OZoAo+0R2Z2/DWok00iv8L587XYi59Wefqc33pHlQiLrScVpxPT?=
 =?us-ascii?Q?pb+DOXOJc0UFxANWPnghPe3k5E8WrbnsxDwK/Q1ERbAnoHMKo0WiqAlkVLFb?=
 =?us-ascii?Q?oGV2I2bAoWfvf8Szz5rlkqUVAHpcps6Z+Jfc+d4Ev/6knxlh4IEwAvjlxTrl?=
 =?us-ascii?Q?3e0DGi3zdFCX6p0ZJRICd3cV7n0ikTuKGC0gi6bN0GDop6FL28Bdpt5Stzi1?=
 =?us-ascii?Q?sQPFIYVu5DUhdJfSxlMPN/olV8uQjLxcLi2+Ses5Ie9oJ0Zh48+88ocy6PAS?=
 =?us-ascii?Q?NxukQIV1btdvjb54GuJotiTa50AzK2lOFnOvahTApJQktEPjWBMI9WJVoL3U?=
 =?us-ascii?Q?TFPAcHXNUk8cjXowa3RqAwgcsvmj6LEQWPKaLvyjCrI+f/a1SyxSXndwzwln?=
 =?us-ascii?Q?+ALE4gTG1SMW7zbZLqHHJ4RfoUpbMONo0ASTzHtNxU8LZjCQid5ggEX5lpNS?=
 =?us-ascii?Q?HKPiIxjJldT+inAbkpixrxX8ADhOrFw95tQ5gbKFqk0jHt1Og5hqz6dIm71b?=
 =?us-ascii?Q?/HUgRvI+3v3xLx1PnKy81o0zkgswvjDStmCQodsocRQkYLPMhlATbyn91710?=
 =?us-ascii?Q?L//Q9OSMSVpTM3nxF2Nctj5yMzg7t3wZdz4wCVT+kcgUuO9cIm9oyF4t0HV9?=
 =?us-ascii?Q?k1k+i2c7fiqKQhNNKABxUDSrB1tcz/MuMNx03FOQ9GGbaIEDMAs40GNOQXCA?=
 =?us-ascii?Q?Sn4CcvikI3CG4HQQizsvf9PCK/HltSpTjlNmp3VagOMg0WxlO0FDvunarm0V?=
 =?us-ascii?Q?OjoI6ktinf4sBvwrdNG8u32VXEVfK8A=3D?=
X-OriginatorOrg: iopsys.eu
X-MS-Exchange-CrossTenant-Network-Message-Id: 3cb66954-81ff-4da6-2d21-08deebb2b621
X-MS-Exchange-CrossTenant-AuthSource: DU2PR08MB10037.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jul 2026 07:43:13.5208
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8d891be1-7bce-4216-9a99-bee9de02ba58
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ayB7lQpIChcybUG3C4XQk7hxGCJBxzd3nh7PS6ssz+aYguAFKR0/AM0+tw07LoyCzk/54I46GzOVnGgRD3rFWigj9cR7M/5ky4gXdcS6N/w=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB5501
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260727_004317_718468_3767464C 
X-CRM114-Status: UNSURE (   9.29  )
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

When using IRQCHIP_IMMUTABLE, airoha_irq_unmask() must manually call
gpiochip_enable_irq() and airoha_irq_mask() must call
gpiochip_disable_irq(). Without these calls, gpiolib never sets the
GPIOD_FLAG_IRQ_IS_ENABLED bit. Because this bit is missing,
gpiod_direction_output() will not realize the pin is actively used
as an interrupt.

Fixes: 1c8ace2d0725 ("pinctrl: airoha: Add support for EN7581 SoC")
Signed-off-by: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
---
 drivers/pinctrl/airoha/pinctrl-airoha.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/pinctrl/airoha/pinctrl-airoha.c b/drivers/pinctrl/airoha/pinctrl-airoha.c
index 6cf4ed5976fb0..f85941ccea560 100644
--- a/drivers/pinctrl/airoha/pinctrl-airoha.c
+++ b/drivers/pinctrl/airoha/pinctrl-airoha.c
@@ -2580,6 +2580,7 @@ static void airoha_irq_unmask(struct irq_data *data)
 	if (WARN_ON_ONCE(data->hwirq >= ARRAY_SIZE(gpiochip->irq_type)))
 		return;
 
+	gpiochip_enable_irq(gc, irqd_to_hwirq(data));
 	switch (gpiochip->irq_type[data->hwirq]) {
 	case IRQ_TYPE_LEVEL_LOW:
 		val = val << 1;
@@ -2614,6 +2615,7 @@ static void airoha_irq_mask(struct irq_data *data)
 
 	regmap_clear_bits(pinctrl->regmap, gpiochip->level[index], mask);
 	regmap_clear_bits(pinctrl->regmap, gpiochip->edge[index], mask);
+	gpiochip_disable_irq(gc, irqd_to_hwirq(data));
 }
 
 static int airoha_irq_type(struct irq_data *data, unsigned int type)
-- 
2.53.0


