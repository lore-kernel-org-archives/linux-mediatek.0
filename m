Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FBEBC56208
	for <linux-mediatek@archiver.kernel.org>; Thu,  6 Aug 2026 22:07:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wOMW1tHK7PUILb0FrJOd8BLv6CBGqBf/8FSOrZEtESI=; b=2fH0tdF7nSk8WcJWQ/eMlFjxZ6
	qzMQ3+Gorh3pP7jnSxbAGSIeY0vQBNt6X3pVphd43OWWTPSo0uNzAy4YgG4rUAl+VcBaEwLPN7IU6
	cntdkloC6lUg6nO9ZUJqgWmF5BPFq9mfCJLTsiplHRp0OWE8bF045Rb+K0C3i4JcJl8xZVg8GbGNt
	EX5OGAw/J1UdOkwaDxA59yibfCayPsxEXiZSD9eJMM32jBKXLJqMlMTJ+ke1SrabwJcDzbNug+6CH
	zysawJvuV3wam/+CJdZy2Sp1u1g8mkHcW181bTJL4g0u1rh1WhWqWZVbtp9MrV6D8KRXhrJJObeXM
	i8Mloniw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1ws6Et-00000006lrM-1De8;
	Thu, 06 Aug 2026 22:06:59 +0000
Received: from mail-francecentralazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c20a::7] helo=PA4PR04CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1ws6Eq-00000006lRq-1w3y
	for linux-mediatek@lists.infradead.org;
	Thu, 06 Aug 2026 22:06:57 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ju1bxO8I0BGCKbPfroUG7OvO/xXssE1vLbnUbo5MUuAVqjEwEufz6gtTb0Z24YJjzJYJdOfWMLIkQVH9RSK4QsA25hgcOGfMfJixjIqccWLOe5IIt31hjFbh2ASaLhkZPV17e0rmGjyIoMIshQCWyPaUDgmIuhseEaUVJ/N1Am0vLkbuqYR88XjZXyTpK5QX4BxvgNtgGTNW/UMPX/3CzgiWl00PqdwOyf4+xel+Kc/02h90Np2TXCkz/GS3Ike1msYOJkHCwo32QDeqOK6NerJFiRPBquJxtbDkPMzDs7LKAVW54GDnSryyx7OMb5ag9+QY0r5YOSSef4LfoTW2Ng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wOMW1tHK7PUILb0FrJOd8BLv6CBGqBf/8FSOrZEtESI=;
 b=IdHvAM781HTWNh6v/wwt1af1QiJ+tWwitZNJO0SLF1reqWAOgYQh8q2MD888LaGAm9SdkWYHoYVC8LD2/9a/yN2UUi1K6HHFWvrAiW4rFJPov5N4v69fjTwIKW6OBMgZ7wQ7Lu6oFdSq8HASz4+tGfDmkhM/8SCM6KiIbtfaojHiMeIB58sB9/W6Lxby4kBuAibA6nTCaoWZOH4o9m2qA18DNlMpt3Y1vDJqD1lX+7H1KufDfY8EcgurJ0pXn8TyIrBXyI2hNwTfz913wYqhNYbbYBWT5SJttYSWcMw6kGTPhYVa9vEuzg4tIVaca15UqR9FqZSF+u+s2OSO24/yDw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=genexis.eu; dmarc=pass action=none header.from=iopsys.eu;
 dkim=pass header.d=iopsys.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iopsys.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wOMW1tHK7PUILb0FrJOd8BLv6CBGqBf/8FSOrZEtESI=;
 b=KejYMGcnx+BTHGBphdyrh9GRQ4SeIHOigPwjxh1YNw4dg5p7oEVAFkLWlw2enVt18xKz2Ere2W8Q8jcpmjB7N3gqPBRC4q1AVF8B+bYez5DLPMOwEx2Mb2wo6pjgi89O2shHaNzCE219nENVcU0CjhDTJ28noK0zOTUaEXX73IxblR4JRDy9hOKKEcnoBcHWNx3P8ALLfzcpxs0qJrZJc0mERFcxBHKy0U9l6SQ0L2WJLsk6xFA4l2A69lOSzE1d4J7nZWiUIbEcnee1bQpq+TipNHq/egIlLsLzHwL3RAqyZ+yHEVO55muFUta1494ap0dxHX1YLBoRsEbIQMVMFA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=iopsys.eu;
Received: from DU2PR08MB10037.eurprd08.prod.outlook.com (2603:10a6:10:49a::20)
 by AM9PR08MB6705.eurprd08.prod.outlook.com (2603:10a6:20b:300::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.18; Thu, 6 Aug
 2026 22:06:52 +0000
Received: from DU2PR08MB10037.eurprd08.prod.outlook.com
 ([fe80::3c7:6d2e:8afe:e4dc]) by DU2PR08MB10037.eurprd08.prod.outlook.com
 ([fe80::3c7:6d2e:8afe:e4dc%5]) with mapi id 15.21.0292.013; Thu, 6 Aug 2026
 22:06:52 +0000
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
Subject: [PATCH v11 15/37] pinctrl: airoha: add missed get_direction() function for gpio_chip
Date: Fri,  7 Aug 2026 01:05:53 +0300
Message-ID: <20260806220615.4078303-16-mikhail.kshevetskiy@iopsys.eu>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260806220615.4078303-1-mikhail.kshevetskiy@iopsys.eu>
References: <20260806220615.4078303-1-mikhail.kshevetskiy@iopsys.eu>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR3P281CA0102.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a1::17) To DU2PR08MB10037.eurprd08.prod.outlook.com
 (2603:10a6:10:49a::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR08MB10037:EE_|AM9PR08MB6705:EE_
X-MS-Office365-Filtering-Correlation-Id: ddace458-15c7-495b-188d-08def407052c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|23010399003|1800799024|376014|52116014|7416014|56012099006|10067099003|11063799006|3023799007|18002099003|22082099003|921020|38350700014;
X-Microsoft-Antispam-Message-Info: ZD7PiSG09XJQp22CEFVlhyKDsxobYG4fZiZ5sNH84SI907lbEGiYHpAWeFGg1MN7Cs3dQ8tL6Q2znWFH5MvWnHWufDz71YyEo+m4ay6HiRHqsNDpPRZNuczo8s/mTdtonR9Qh4dxkwCnok+Z7kLp0UNVBcwJGsMQu5YBLAzVy/HPY2Ca5RgxHuinR5W40Yewd4/67eGDhHalxPqwGA4gtIbtijDEHBeAj43z9tv0TCaKwmS1UOqboymhTT65hyM5xituIEcQJOmtU1IghR94NfRlyMctiSPRhyR1AWn1DFIifnpvzz/uyHYexLWF00ZgXRvdO2fEzAeE5UBmk5l2L5J8Qfd8IiFyHc8NwTaWiD99rN0noeeFEZwZJ4Px7/fI/aXobaKZbe894QfkSwG5FmtEjn+afVbx3WOgZ/GZBUeivOJFmDCP7A2GWi01f4JQZNgYMXH71UR2z7MzPzF6aQlSEwCQqklRZ/EaamsiaR1KwDR7wCLAsxnQv7UpOaqGoXKgmYAU4TmXWnEzWfKDAIDIb0Oxd+QDGF/E7XNotfr6UGI4nIM6zIZTgQsNWhQlFophVQ5wMXuQ+iUpuXt2t0O0GDgwLMBRAuxHfDe+uBxWFYwxwk5r5zgafsQeM9q//u2vclyDdkYAzaM285lUpqkwB3RUZ8Iio2Al6KbtSo9/otb/CLokoNGCZIUhHzMf7SeNkw1s90JinbPzPtNoRXiX3tD+Fm6eaiEBm13sZv9HhmYn6LHadGLUo2jhVpVG
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR08MB10037.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(1800799024)(376014)(52116014)(7416014)(56012099006)(10067099003)(11063799006)(3023799007)(18002099003)(22082099003)(921020)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?9ISv6hwsws/96KgFhvGnePBMZgmhead5MGnN94OxHQQe2FD5D6kmOvBbDS1S?=
 =?us-ascii?Q?rOb1uaF01eZBK/D9r1m73IMHkosWTuLcmm/NfrwyyrTuYIEOdl7MLt3lXN9/?=
 =?us-ascii?Q?F5wTrkuDJi7qoNdlLyieKBZR1vZ6m5pWSHV/b3m1Sa0UXrarjK/+ju5sY3WN?=
 =?us-ascii?Q?asLwf1J6KUrebm9r6T7TCssieLUr7cykbVlVhlHzp6y9U7R52rA/zam8xaKD?=
 =?us-ascii?Q?W2Iye+uJFbjRAksSb9RpBDfwRJnrbRAT9JuZtW6IZ/+GVgIIW1li5xK0Qf+s?=
 =?us-ascii?Q?SvSi44Nd6mOwACYyO8uH9IKU1myGdz23rZ6hQu4qaJ22y/Nz5tLd2Op8Fknx?=
 =?us-ascii?Q?f28Tenxzzhsau4CtR/dQdi315rM50y9FFmZITpcZupKts0JPeLOuLF/ObflU?=
 =?us-ascii?Q?wd79ZVHGWAjsIGcPGRCrVF61w5g47loeyH+5shxaaz+GgUgKLsC5KSxmM/L7?=
 =?us-ascii?Q?/dVakaBP8fqp6V0WGmfwRu61q9QvjfWeej88skb6cer0FoEQF5mCvODkdTtQ?=
 =?us-ascii?Q?iDh1zD/SlYMspQBkN+uQl/xZLFZgQz3YzFOKLUovjOEYJDUBaSL9xgqKNhjv?=
 =?us-ascii?Q?+A4MhAd28MeF8JaOrFXnKmD0TAg/BZUcBrrK1RHuB8S0eRdsYCvq/+pdP8HW?=
 =?us-ascii?Q?WxBWHJanWujBRLlrmoI8G3XE2owWVBNRp2uOIwTXMJOelWCt3eX2Teze8f7P?=
 =?us-ascii?Q?Yl5YP+Pji9VV8ZiCqgzTKFUaQjL9XuJDJWzVqis2BPYS7JYPwWXmVJyVfWQk?=
 =?us-ascii?Q?eLbJitxUpO5s+X+dc4SPj4+wmHjI9JTCjcB+mP1oUJ3aBignKZlFAH6gnYuI?=
 =?us-ascii?Q?x9IwP98vy9ptCavODTEXarnjuv/U4Hl7dxvAOsKN8joMMjIsqkrZrcuogsZB?=
 =?us-ascii?Q?+gCrSNbNr3J/4lOJ1MweXxEB1vFZHVUrDXQvZ8B8DoAeEYzficn8Ol8rtf2u?=
 =?us-ascii?Q?pmTYxrhR2Sg0Dh3eVM9nJe488+K/yinU7AFW1QGs6m9egNC9CDG1aQK5/Ch1?=
 =?us-ascii?Q?U9yL6fMpyX6h9/AjyJY90CNCmnuCyxjp/oRIxi5m051ygI8VBX/fwSQ+cYbE?=
 =?us-ascii?Q?58Y8enPgig7kYHg6iTfXw5KFaO1lTtS0hm/ly+zzIrBd+oJIl+1b7ObRL5Xw?=
 =?us-ascii?Q?nshvZC1UgY4pTQUUovN6c9+z8zVYPb9SQycoduyrag6s22DdEV6GH1CLnG66?=
 =?us-ascii?Q?1cAdMQTDwo5xyKUGwlJnx/2LTzinf1A1g1LLb+pqoQpHisyW1rhK1B1ohjzw?=
 =?us-ascii?Q?9UAR6+xuJUbzj37MoE7UQDO48DVNBjcMkukXHc/911ZgukUyknB7JYKF5OzI?=
 =?us-ascii?Q?B667qGfw+k1Eql0lP40GPQvKw17yIzuDmw8JXkMMFkN4YZM72fnITSsCFwnV?=
 =?us-ascii?Q?MZ6j7NVAqWGi7mCJ9hV0XIaeeo6fPLBcHtucQSAPdLXh5Nd+ycuQWFwEfagI?=
 =?us-ascii?Q?QQd9DmwLacxSoRSwu08w0q7hG4S1p3wYstzr3r82KskdZuNjEQcmDhbWrOYb?=
 =?us-ascii?Q?l64sNiexau3uKYAy0g59jIVulsq3hyrp77vwBnYt5o+NWFMoF64Yf4UfVm+W?=
 =?us-ascii?Q?cokqahPQ3yCo1cRH3z7w3ZWJJqUor26yxuQBdSVFlxPJPn/HDcDQ98t04Eu2?=
 =?us-ascii?Q?rkLFe2PegzmINd1qZ9P7xCpjRxUobSzTd+/+wqKWu41LPOuYPzj5cMv2WdHU?=
 =?us-ascii?Q?jkxNujZqeVDtBDDv/izQed3WpaZH/4UsP9Eu2hE4O+hKUxaiES7NMNfXsFR2?=
 =?us-ascii?Q?RscxKymludkoAuWLNnM7QkTRVkIDjQU=3D?=
X-OriginatorOrg: iopsys.eu
X-MS-Exchange-CrossTenant-Network-Message-Id: ddace458-15c7-495b-188d-08def407052c
X-MS-Exchange-CrossTenant-AuthSource: DU2PR08MB10037.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Aug 2026 22:06:52.3257
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8d891be1-7bce-4216-9a99-bee9de02ba58
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /+XhF+KBFEEo1QjVN7a8cov7bd6/AzJDoHKrfSMJb6spwEMxWogz/3c8ukfxMbILNiLo6kKwMpY9GTjLipHU6rNEjap3oNrbC0ZnS80w5Yc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR08MB6705
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260806_150656_498006_551D590B 
X-CRM114-Status: GOOD (  12.35  )
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

This patch adds missed get_direction() function for gpio_chip.
Also it reimplements pinconf's get_direction() function using
newly defined function.

Fixes: 1c8ace2d0725 ("pinctrl: airoha: Add support for EN7581 SoC")
Signed-off-by: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
---
 drivers/pinctrl/airoha/pinctrl-airoha.c | 50 +++++++++++++++++--------
 1 file changed, 34 insertions(+), 16 deletions(-)

diff --git a/drivers/pinctrl/airoha/pinctrl-airoha.c b/drivers/pinctrl/airoha/pinctrl-airoha.c
index ad6d24e39c868..fa9284ee3b71b 100644
--- a/drivers/pinctrl/airoha/pinctrl-airoha.c
+++ b/drivers/pinctrl/airoha/pinctrl-airoha.c
@@ -2523,6 +2523,22 @@ static int airoha_gpio_get(struct gpio_chip *chip, unsigned int gpio)
 	return err ? err : !!(val & BIT(pin));
 }
 
+static int airoha_gpio_get_direction(struct gpio_chip *chip, unsigned int gpio)
+{
+	struct airoha_pinctrl *pinctrl = gpiochip_get_data(chip);
+	u32 val, mask;
+	u8 index;
+	int err;
+
+	index = gpio / AIROHA_REG_GPIOCTRL_NUM_PIN;
+	err = regmap_read(pinctrl->regmap, pinctrl->gpiochip.dir[index], &val);
+	if (err)
+		return err;
+
+	mask = BIT(2 * (gpio % AIROHA_REG_GPIOCTRL_NUM_PIN));
+	return val & mask ? GPIO_LINE_DIRECTION_OUT : GPIO_LINE_DIRECTION_IN;
+}
+
 static int airoha_gpio_direction_output(struct gpio_chip *chip,
 					unsigned int gpio, int value)
 {
@@ -2656,19 +2672,13 @@ static int airoha_pinctrl_add_gpiochip(struct airoha_pinctrl *pinctrl,
 	struct device *dev = &pdev->dev;
 	int irq, err;
 
-	chip->data = gpio_data_regs;
-	chip->dir = gpio_dir_regs;
-	chip->out = gpio_out_regs;
-	chip->status = irq_status_regs;
-	chip->level = irq_level_regs;
-	chip->edge = irq_edge_regs;
-
 	gc->parent = dev;
 	gc->label = dev_name(dev);
 	gc->request = gpiochip_generic_request;
 	gc->free = gpiochip_generic_free;
 	gc->direction_input = pinctrl_gpio_direction_input;
 	gc->direction_output = airoha_gpio_direction_output;
+	gc->get_direction = airoha_gpio_get_direction;
 	gc->set = airoha_gpio_set;
 	gc->get = airoha_gpio_get;
 	gc->base = -1;
@@ -2876,21 +2886,18 @@ static int airoha_pinctrl_set_conf(struct airoha_pinctrl *pinctrl,
 static int airoha_pinconf_get_direction(struct pinctrl_dev *pctrl_dev, u32 p)
 {
 	struct airoha_pinctrl *pinctrl = pinctrl_dev_get_drvdata(pctrl_dev);
-	u32 val, mask;
-	int err, pin;
-	u8 index;
+	int ret, pin;
 
 	pin = airoha_convert_pin_to_reg_offset(pctrl_dev, NULL, p);
 	if (pin < 0)
 		return pin;
 
-	index = pin / AIROHA_REG_GPIOCTRL_NUM_PIN;
-	err = regmap_read(pinctrl->regmap, pinctrl->gpiochip.dir[index], &val);
-	if (err)
-		return err;
+	ret = airoha_gpio_get_direction(&pinctrl->gpiochip.chip, pin);
+	if (ret < 0)
+		return ret;
 
-	mask = BIT(2 * (pin % AIROHA_REG_GPIOCTRL_NUM_PIN));
-	return val & mask ? PIN_CONFIG_OUTPUT_ENABLE : PIN_CONFIG_INPUT_ENABLE;
+	return ret == GPIO_LINE_DIRECTION_OUT ?
+	       PIN_CONFIG_OUTPUT_ENABLE : PIN_CONFIG_INPUT_ENABLE;
 }
 
 static int airoha_pinconf_get(struct pinctrl_dev *pctrl_dev,
@@ -3136,6 +3143,17 @@ static int airoha_pinctrl_probe(struct platform_device *pdev)
 	pinctrl->desc.pins = data->pins;
 	pinctrl->desc.npins = data->num_pins;
 
+	/*
+	 * some pinctrl operations (ex: get_direction) might use gpio registers
+	 * before gpio chip abstraction will be completely initialized.
+	 */
+	pinctrl->gpiochip.data = gpio_data_regs;
+	pinctrl->gpiochip.dir = gpio_dir_regs;
+	pinctrl->gpiochip.out = gpio_out_regs;
+	pinctrl->gpiochip.status = irq_status_regs;
+	pinctrl->gpiochip.level = irq_level_regs;
+	pinctrl->gpiochip.edge = irq_edge_regs;
+
 	err = devm_pinctrl_register_and_init(dev, &pinctrl->desc,
 					     pinctrl, &pinctrl->ctrl);
 	if (err)
-- 
2.53.0


