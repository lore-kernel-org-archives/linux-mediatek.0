Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4287FC55838
	for <linux-mediatek@archiver.kernel.org>; Tue,  4 Aug 2026 16:05:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/nGEMCeLDQogSCusi3d+yMA3fs8/F3IrqGVK40fHKuc=; b=gL1v3Dln6pDYJQmzsCJyb0Xred
	RpFyUvTKPICi/KRAzrpQSPwiU/ZAkNAjNokzs2vLm/Dsp5j26PbJOzyiahLWJJ7/GJoku8Ecrnkkm
	M9GjtTG9nKXFPoIT8hlhCrADLuQZMZ11jJXOGtyNWLJ5gw6TNr94/MsmJwee1BRNeRE60x9MHe5mi
	thqb9QuSoBxBUBnhnkDVklZS9s59O1wJ0IlTZQm6Ns4pyVf8SFSUvMmj6isXGVY+P76qvYVlDBVBh
	6VixrtD/p9zKHU4/BCUGnmyHjQHVAvrYWvW2FsZOekImZlw8Ph3wmF5yhIW5mTlRs3QeQMdsqwqKZ
	4Jmk5SWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrHdo-00000002GhY-0O86;
	Tue, 04 Aug 2026 16:05:20 +0000
Received: from mail-francecentralazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c20a::7] helo=PA4PR04CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrHdl-00000002GXX-1mCW
	for linux-mediatek@lists.infradead.org;
	Tue, 04 Aug 2026 16:05:18 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VAd35ZcCsT9Spgq/vdHyGMWBPrktgg4ZtOT6x4SjF6RJOy+ls4+F1l6kRF+NHGZternG3JH7yUga/26vHH/gLFF7Ed1tx29AXB1xBGVgZmD6N1qjoIjEUKqALnfsI7Fy2KJoYh56uIQb3gdGopwqUt7R7u8DhL/DUGhyICzd2SQUx3gf303YI+DVHcypGtz5ZgHIsJ3CWT2hAoVhZ0jOLt6p0M8u1nJCHMu0Djk65mtMLBWq3aZnRnRmST0oTFt2hIcX8saacevbM8uGQoyQLkHwWn09KE7IkY104uaxgTs5BuIHQ2tRaC45XqtA991zSdbVt665CQ9XKpZq8uG5OQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/nGEMCeLDQogSCusi3d+yMA3fs8/F3IrqGVK40fHKuc=;
 b=iEYQCurGYfu6NyFGTnYsqmbkj9bNM4Dcfu79Yta+zMxb9pCJWRaeCMDK85vW+VAthfGTq2tJRRJpTpUgJudeCz9K+iGUPBsPPDamk2E8MNELfpLxybkFRn6c6AmiqVt5JdBxjnL1qOfHNqqRx9kGKOdlXk3L+Ulm3zwRVguYPqaEf7SbjvytLxyzOEt00xUg3u6KE0pzT0rAjDWjWPfL03DhjLbfOwaO08UJ4WgJCzahLFRdIUHd3SaDv1uckxxKe5ClM5lS2zcPgE10o1muU9JunEsq+fS5rOYA/4mfl7MgZPrxYlek5UU7+A/iyCwawRcRdbMUp37UIPCQ/BTdxQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=genexis.eu; dmarc=pass action=none header.from=iopsys.eu;
 dkim=pass header.d=iopsys.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iopsys.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/nGEMCeLDQogSCusi3d+yMA3fs8/F3IrqGVK40fHKuc=;
 b=T8XeLU68upc99+KraKRrdJE8goMO+/y5ihNmDJlHSzNJX6JD17zqZE1mDPK3QAPTjkIgFdngztqAQhHqQctbNgnbTCQtiJJJQUqYTlVgsim+HJtBiVAPznujnG0PpN7uTw2fu5oMOfs2YQRMeWjGRaJZk95CDvr6xOPJNuH/KU8TGz/iOUN8ZLRCIGAwu+zhHnxLbkdl9V1Jcav0nLMKK+u9/Gd4h+fcVW3bsqAFyD7y6I74kBSgQoXTblC4fpPKMyDzCHUxE2QpAkZbjm6MKa8sEEZA2Oz73Q0YcYfIDYww5JeD4KdmLzj7bMb3aaLC/s3Q9BNErgqjE9IIHmceGg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=iopsys.eu;
Received: from DU2PR08MB10037.eurprd08.prod.outlook.com (2603:10a6:10:49a::20)
 by GV1PR08MB10792.eurprd08.prod.outlook.com (2603:10a6:150:160::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.15; Tue, 4 Aug
 2026 16:05:08 +0000
Received: from DU2PR08MB10037.eurprd08.prod.outlook.com
 ([fe80::3c7:6d2e:8afe:e4dc]) by DU2PR08MB10037.eurprd08.prod.outlook.com
 ([fe80::3c7:6d2e:8afe:e4dc%5]) with mapi id 15.21.0292.013; Tue, 4 Aug 2026
 16:05:08 +0000
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
Subject: [PATCH v9 21/36] pinctrl: airoha: remove not needed irq_type[] array
Date: Tue,  4 Aug 2026 19:04:04 +0300
Message-ID: <20260804160419.3592327-22-mikhail.kshevetskiy@iopsys.eu>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260804160419.3592327-1-mikhail.kshevetskiy@iopsys.eu>
References: <20260804160419.3592327-1-mikhail.kshevetskiy@iopsys.eu>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR4P281CA0237.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:e9::12) To DU2PR08MB10037.eurprd08.prod.outlook.com
 (2603:10a6:10:49a::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR08MB10037:EE_|GV1PR08MB10792:EE_
X-MS-Office365-Filtering-Correlation-Id: c24e44d1-0499-4a62-4652-08def242277f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|52116014|376014|7416014|1800799024|366016|38350700014|921020|56012099006|11063799006|6133799003|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: CKEN0MKVQNU+y0JDIA46cc4hoUHg0Hts6p0E+uKnrbrCpfB+Hy3rHslDZVwH/VN98qAlUd0wr4Zx/tSFMKN5d/yuijWdlSOibpjnzfRBoX6nw/w8OsOO70ZmzMnIUcG0jwEFfQJ4dRcIWKOiUZPffEzMNvRqFmsuw9JBvT4G/EbpVqUDKOZyoVWbxsg7Ln+gFUaG0W/eknLHeqyYpI//I5loMiaRh/GyxAE5Rv1Wz3EebDb0XCfp33KIXim6tAuu+jG4SFFSdNoyJfGnJTK5/JKQdhqQItqqtfKQYUBA2zU76K0QyK1T1Ml3X3ylnRN+EPVyO3laEGIuo3aPSZmoBvxpKKHOfc0i7gz07huAmEGJF0Hk1vhJV+8G5lvV4PA/7pPxycJa0Y8M2SkTUAAzVS0FARmHGi5nJJWb7ZxSY6+ZlL1TbnsuqlnJJjC+duiiO9dqSqlqg+t/Ojq/0p5uqPQRTLl7zNe/6qQgpD3wq3yIAoI1rfRwENoUUfLBRqozawy0dC4XocglfeK9N9+B8efJK3P/WCRAfhFLDC1t0HVx8mXbiLO2HtRyIO8b1IhOe+fMSw+sN2kuAmFhzBEvvBj/dZ47PL2LfxYIvry5radH+pljxyGQPPevNIS8iJ6zNAbchFl7P9s0GAwOn+6mKLK/e7eSq+ph6CpgNGGO1GJtm/maAPTiHtCjgcOZMgnI+HrMqmdcV9ctYvcTziI2K8glFaY/AVQD2NPeFvTujtNv3dugS8zulSgn6B/3N5vB
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR08MB10037.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(52116014)(376014)(7416014)(1800799024)(366016)(38350700014)(921020)(56012099006)(11063799006)(6133799003)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?4+DpJNRiki9UnTBJXz1sItEepwGhiu36ey4fLukK3dvcck1u04qXVs3Wa07W?=
 =?us-ascii?Q?L4vtMBaD9fiB0H7x7W4iPJ2GARXKJ9K387W9/ya6Ldt2NvkQOD3P8Jq/cg9M?=
 =?us-ascii?Q?SgGLOGA+FIWceqAX8cWUjD0TM5Rj0josDE0dkQN7fLdWNEjVswEGalG38L6i?=
 =?us-ascii?Q?C2Ts1Uw43s25xB44TcSH7aGtOzb7Xk1hJa7Sv90Leyvxz+K117dFz3S8BgGB?=
 =?us-ascii?Q?MwaQh0yh0wkWZBusAo3M5GPa1TFjprmnSMlNKpOtTf3rV3QsJh2mtMQWAH0J?=
 =?us-ascii?Q?gHN/bCig61mwlW43ZCb6TlMdAjPjkVHGlv3I0rkzoh93jDxAjPv3V430KK5F?=
 =?us-ascii?Q?Vb0hAxGe8yETEAYBDOpwbZyU03ySmkxbz6CICoXrb3LxE3pdBwEIMguFVmxr?=
 =?us-ascii?Q?w7JOoG1EFML7RIDy+p2uwpxpr2HnNB6zsVWMJAdFhVv4XjfVfOs6YfU8EZkV?=
 =?us-ascii?Q?27+IvsfGWJ9eAkFihbnOSqgBEWpnfUBMIETi5VO7SwFxYBiyspLriYNm3tyM?=
 =?us-ascii?Q?1qEzAdkbZ+hXFo3Bzhldxx830AGeRNo2mpj5nrh8gcqFBlar/A450agAEY72?=
 =?us-ascii?Q?1SkFWDXGW+Xq/7hg4NNz/pETnRag1WO1k/YKGXLUgNow9XCe1ivUAeRsyJdM?=
 =?us-ascii?Q?45tQXSxhfat+3JxATtdgg74S9LXBiouFbKKCgzRTM0bQ9Kgv2e/KQWlPlErn?=
 =?us-ascii?Q?SY3bMQxyxduvN+/efTQm3cKyPaLEm2YgMpiSsMtlmB58QmgNWn0LUSGKHhd3?=
 =?us-ascii?Q?hy7kFdsVp9K+nd6ObNGRJbGezBlZ1cKRVv/TXgaoRNQ/KsTR4E/Qso7DCr6l?=
 =?us-ascii?Q?8en6el2AS4qU+f3UL7NkqGW5EK6qJ+mw6924tMGHmu/qt7UCPHEZxlBeJ9sv?=
 =?us-ascii?Q?yK85JDDzrsDrWLyHNMyxlaL5febnkZ8xUOB78wZF57Nz2Vq+5WPx/K+35maX?=
 =?us-ascii?Q?JsyWw1xU9+YSn/64QfKgc3L0gf8HTeq/kzwWUSKvfKcIuezMoyNviMkOq+QU?=
 =?us-ascii?Q?H15lGqQUw9Yv9UZ9n6+gifsDkttentK86wJvkQgK68dixoWXH3uCbGjSOxcQ?=
 =?us-ascii?Q?G4hzHCAxbccnA8VQj2DmigaXb1s2cfTwFd/Gad/aqFRpQxBHsteYZYk7HMZC?=
 =?us-ascii?Q?/A/Zn3zv/s7zA3GTujZhLfJ63aLU+zxKAykfVf4+/I3Leup9XHq2TAAf2xjI?=
 =?us-ascii?Q?pgxx6HIUJJ4UBKzPGO01FQQDG0ZPGybd4QvhY4WZODUr2uJZKI7LH4wy83Tk?=
 =?us-ascii?Q?LWELxyQZUvlnV8OqPv3Gt4PeVxvyi90LRNaeifHeJdQdq6o5/f8b2qOqSIg+?=
 =?us-ascii?Q?GTSbWCZSeBWi8Dlm257+L591D17lqGDPwWqQvlKmQOw8n/2V3uC7tfIO4LFg?=
 =?us-ascii?Q?WEFOPpr0wPDkMO8YzgxlyewBEd8RU4BmUWdl7VKn/QnziN/2tg1nt9NGudLz?=
 =?us-ascii?Q?LCvGBBcnp5+U+A9LZBYFss3MZXsj8y5GqMvgVYD+gnoK2JddC5O/Hlf8u+8t?=
 =?us-ascii?Q?pgt1g3B8meoZ6/qP681fr56q7h489GtYbew5b+emGu4pEL9ZmyoCxBcgHzhX?=
 =?us-ascii?Q?lu0RKYLaln5hAosQvr+EHivfkoeTkm6kGhwR3OCYd/3PHppAZJf5G4qWoMJG?=
 =?us-ascii?Q?HbGecsi79gR1AZ52R3wE8nIWdpJzMItpa1CSZ1TFOGmRDMnrABolrSgajj7Z?=
 =?us-ascii?Q?Ya3gTEgMzv1ZvEmTR191q/8wWpdY7KQtIBMc/bKpUnMnRb4o3NHnr2UuFuXO?=
 =?us-ascii?Q?7bLVhQPuAkoSghbin+L8CMJ9cbYS8ug=3D?=
X-OriginatorOrg: iopsys.eu
X-MS-Exchange-CrossTenant-Network-Message-Id: c24e44d1-0499-4a62-4652-08def242277f
X-MS-Exchange-CrossTenant-AuthSource: DU2PR08MB10037.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Aug 2026 16:05:07.9335
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8d891be1-7bce-4216-9a99-bee9de02ba58
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1Hb+mOe2WbaiVAv8PGJPfJZsINqL29kadauKKISvTi1GR7f45IFdYq/Y7em9SX/JZSQsgS3Vcbt/MoUKQ9MvSVmLHtuamdRQ7tKHKyCFScA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR08MB10792
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260804_090517_461533_665507E0 
X-CRM114-Status: GOOD (  12.89  )
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
index 45f1af7a99711..d7759fb3bd1c2 100644
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


