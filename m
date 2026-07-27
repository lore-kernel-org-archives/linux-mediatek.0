Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6C0FC5321C
	for <linux-mediatek@archiver.kernel.org>; Mon, 27 Jul 2026 07:43:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BtP3suoiJPUCIy9+7I2H7aGb/5G5FP2qOi3xmU1Oj0U=; b=WDxSgk/FINXdrAO5BMpsA4ydpE
	BI9UgPZ3hBu20VChTMbmClm0EDLqyf8HZBMn7K4UxPCxAv2HnsGdS92tnI1dX+PR+I8MsymMJxFA5
	SW5IvCEJiGmP8yfGS8F64sKE7i6uQHNl6hzYFfXBnA34KdYzsAXeHz2PbcpzhMY3pqvJCpouC+WOQ
	h2Dos57NP6sDQghDzoEbanUe/0ZYzinzbPicIR5YouxIWGlHvMMNYjisZp7MNuA+g7IXbi6U2l532
	aXz9/mtNHt1JDvLxDDgs2HsZ5gro7n9r+CWLx5xiJKKZS/modWk9OvmUG24eGCaOJ0vjfYYTP8jRn
	CE6noDPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woFzh-00000002AN7-3vR5;
	Mon, 27 Jul 2026 07:43:25 +0000
Received: from mail-swedencentralazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c202::7] helo=GVXPR05CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woFzf-00000002AB1-0S60
	for linux-mediatek@lists.infradead.org;
	Mon, 27 Jul 2026 07:43:24 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HdXh9DDAo8mfHIK7qrws39SOxVVWm/8YHVlrCMKbGr4IjqPLCM6yBLR7YRM+4zDbssy8MmbwnbQZkbk9y0GMm1nsKMdUVNLRMH+IWyd4FHcptzyE8RsX8M/WmSKHV1fXfgJd3Vujgnk+jjPiyxkDJx9Zvl8929h9RCDA42+4d0LNg6hKWdVix2EkiS8hMFRmLKtNCrvtdOc6NWMJVhv0tKeVu3Dz0F4YDuE3kxahYSmFPo1hOyYZ/ctWRfBM33m8YAUimS3s3kKQ8TevDnvk91S1QOJFASeJt9ZH9EswezvaE5MAoV6B8NBf6kNVJBIwChqUdwg5G83PW1t/HqR0BQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BtP3suoiJPUCIy9+7I2H7aGb/5G5FP2qOi3xmU1Oj0U=;
 b=cZMFv1OB/hcua5BqpzPNPjcOWL3qu1t7r151PW96ARjfBJLG3PPqTqee5w/6IEqFddKx+D/JncsuZmJawDfv2TqGr7EQHM1uer31WWpSLyKNvy1HlKKQWQV4AJge3+3P7pQtDHeBxvgE6rz2hTcaJxcJYTUfZ989QoDOVBneilJbGxF0GGAuTqq4Ryy3inGPhnPBSsxX8OvStQwZZ32+UCPPxtS4YENZxoHKtXsnBjwknQQm8goGI690aSlphRsI7aU6l1qhIeMs+KgCW6XLe6m0DSpPMALfhgd5Cqv+8sjtaHkjXM2/Wynq/2UJjlb2ilwPx1GzD7649YNGSDXHBw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=genexis.eu; dmarc=pass action=none header.from=iopsys.eu;
 dkim=pass header.d=iopsys.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iopsys.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BtP3suoiJPUCIy9+7I2H7aGb/5G5FP2qOi3xmU1Oj0U=;
 b=rxaFXKDy9fBmoSGsibiLyxQygYku/XyUUolCsKvRoEpsrQ8A25CHxe3uJtjKatERvmaYLcBBuk1bp3dHQoRqteuB+3ZPqUdTfJvUFexBzK1BBKWxmdW1DN8yTexmAHSjQp51AS6L+DrM3QShh0+60t8spPgz0KvK2XpcnKJEXKDcjj69w78ceUHwLrlCVCfaLrrUR7acBd+rSm8dBsVqo1znoTcnxLqeBGlRrfWcvxPnK6wK03B+9I+M5C9R2rR8onSBcUFs98oUZGD0IufHy7Ay8cTto4iE/GEslLu02QXdF+mv9wwnx51C4zkRSzXj+emuuXNG8gU8DrbJgxr8SQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=iopsys.eu;
Received: from DU2PR08MB10037.eurprd08.prod.outlook.com (2603:10a6:10:49a::20)
 by VI1PR08MB5501.eurprd08.prod.outlook.com (2603:10a6:803:138::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.13; Mon, 27 Jul
 2026 07:43:19 +0000
Received: from DU2PR08MB10037.eurprd08.prod.outlook.com
 ([fe80::3c7:6d2e:8afe:e4dc]) by DU2PR08MB10037.eurprd08.prod.outlook.com
 ([fe80::3c7:6d2e:8afe:e4dc%5]) with mapi id 15.21.0245.012; Mon, 27 Jul 2026
 07:43:19 +0000
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
Subject: [PATCH v7 18/34] pinctrl: airoha: remove not needed irq_type[] array
Date: Mon, 27 Jul 2026 10:42:18 +0300
Message-ID: <20260727074234.3761170-19-mikhail.kshevetskiy@iopsys.eu>
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
X-MS-Office365-Filtering-Correlation-Id: af4f3dce-a1d9-4c89-fe7c-08deebb2ba37
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|23010399003|7416014|366016|52116014|376014|18002099003|56012099006|10067099003|22082099003|11063799006|6133799003|921020|38350700014;
X-Microsoft-Antispam-Message-Info: IfUQYedAvsGrBmMGb07M9msJzwC3OmT49Mpv6UuXgNSWxt/oz3uIkFigB06BjM90RhiBoMYP4pu9kOBS4Jje0XnXYPxyMSTunfJB7jjRK1/kUuFxW6chODvRnjJPczNzUL3VuAkbGt+K07Opq/UG9gV8h/ktDfMWCAfeDzwYDtCXW2VuHVhjWzHeAS1YtGLusXzvd3heFqdPE8hvDgR6FwJlIJ+J6urVGvTp9076FXIE/vZ8EVGKgUQILb0w6ND8Pgtnrg6v8D2Epwsdk4IDMUu9enCeQccxe67d/LOWVCFzJxmbGPA5uGCtZkZJV6DF+dEcVT8duTBhZqT22CQkGSUVzOIxeHh7yDNXLrJIlo3jj5PBBhtM625ooEkSFXzcnrQvmLfkPFoZG9cnzzOb/QLN+md13d3cKV1G+0f/LTZymfFEb0jMt5VVRLa5F1O96krdnRcE3O0MBHqSAUHkeD+rFau9IFoozudyAUS/LZq7Yhc4i+ogL1Kfbj5aRbYtqtOfHkPN4yKrgowYgTbn5I2P8V09n0WvsAn3v8DiSWv0ZQACB1aGg986KLxSyuN5yyjiUmLs3buUAUJj1Twm46AIl7d84HqMluHr7E7GphYrDwOvWWlssUjOyxckcVsL4vbEZY7JWlH9u9nAK6oZR6FplRXAkRfYBQNDBwJMjWbZXWVUDyorUXJR4Hy3qfwueW3DGwYi5kQWvCXvRn+aK90dDflWZ7LFMvlgzTqK3PM=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR08MB10037.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(7416014)(366016)(52116014)(376014)(18002099003)(56012099006)(10067099003)(22082099003)(11063799006)(6133799003)(921020)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?93AA4OAvn69cDImvvjQIhjPyWScqgxgOlLObYrIBg1nyQq2oJed9wkVqKrIi?=
 =?us-ascii?Q?/Zw808kDD48UUQ6lbYgGAdPSZJg9MD3H6opI57FmRpgnTK4Y1Twh0mUk4xBs?=
 =?us-ascii?Q?uZ3QfPZdzWTgntv2tMUWBiF3o4pxXkvAWLWoZh4Hui5lXvbISCMLZ94dCcDQ?=
 =?us-ascii?Q?vl0eFlHqXabZNisV5RgANNkUdPWAXyH1hkXwMmm5c2PRLBf4fq408iaX18oC?=
 =?us-ascii?Q?m48x+ffnoo6ghoxEn/a9yxBn/+vKn6WENDSM9ACR6rsnW8d7VOJFOUysinLm?=
 =?us-ascii?Q?asGDxWqVFLjs+bcEgW+588lUByfmJeX2cgnPqUA5KW/lFWBYYdWhpknN8+ma?=
 =?us-ascii?Q?uvvcMdpVjKwex9+104irAU7OdEOaeODOeD13WkihWmVo7F0tZ0q0OMx+llQJ?=
 =?us-ascii?Q?LUvkHRtu3DZDXSVdWGOtLCEce7Nai7C1KHcYVhzEhk+wpcwRswr3rKmlPnFf?=
 =?us-ascii?Q?l1tSGXWGvtru6ouUWBCL5SsR1Y5anbdto72Pr3K7GJdGmRtInVfy80kpPYkQ?=
 =?us-ascii?Q?vJXO25UjmSbu9JwQ1sdtwaOoJ0qpPbAKoBNS+8brIUx/XuUijXNntoyrenxl?=
 =?us-ascii?Q?wdi3E63IGTNDDfxcELLVykvsto9R1vQW1Y+3OyzabU/Sj7yOlMpDbnBNN+ic?=
 =?us-ascii?Q?46xrb+jep5CZAQUGIBFY1yFmmk5jK6+Ok/mh44oLs1hzCGum97p18YDPMopf?=
 =?us-ascii?Q?4BvXzAZvfyNs5Q3mceVg13YOD8lkYmEpsi4JuYMMgLr8YPRV7CyRwdZyN3wP?=
 =?us-ascii?Q?UfDxgLknxHMdpyYaoJesaMJZwQhm8fF4uiim0Wrr2V8cjLRKy1RnmyvnPYma?=
 =?us-ascii?Q?Z39YUgQxDxmXHMyOVRjtzsEQ7jI6b8ZotZB0emi4NvmRjDCLa4TJLaYHR3rI?=
 =?us-ascii?Q?Lv0yEPRkj1l+QE+SvDyU/zwl77n9pX9sOcna6Zl/3oK+2m9jSM3sdRbHcNxs?=
 =?us-ascii?Q?ASD3vt522go7zLlgIuUIM3Qw/VjpI/P7pTGnN/k+pHGNzvgmDdD/zK+zOaqo?=
 =?us-ascii?Q?so7zD8RawZqMSZR/o4hemGhN8GTV4uWIgJTZC+rHYTGP/uBHfMDz90xFgaVk?=
 =?us-ascii?Q?odAZ9q2ANOuVQQMH4bOXQLl/ZXHiYwh5P6yicX+f9g+w3Q1DovJoCXqQ71sM?=
 =?us-ascii?Q?9rBAF0S4GHU4W8bLsXsmGz3IVQKk0b0yA45uR6DROnD0bu2JuUSVVGENrLap?=
 =?us-ascii?Q?iJXBxoYmnuA4PQjUoTp9BaHyUoX4wy5uwXFyS+NN2CuSyWkVHuEGSQ5ISiV+?=
 =?us-ascii?Q?pRewaXaj0q5Rw6sh2VgZcUnd69ibBgG9iTqkRS3OLlrk4AansqGZZs/idwsD?=
 =?us-ascii?Q?2xGD4VwEjq/Y0WQnGU9peazVmzNAiayzLKDzVVVST8PYGLLcwbsgY8t34Rw6?=
 =?us-ascii?Q?GhfKe2Mb1EHON89OIXYRRZwUkWgdEuG0Ia3lA6gGE4+j/bG0Ymr29VV5utnO?=
 =?us-ascii?Q?srK1bAyKAD5Hm1UlybQooqPehT7vQJG9rouMTjLMbcLRKzduNhrt/JbHaAnN?=
 =?us-ascii?Q?KW331DQgVhGDVySzKxvNMMNCWEbmzA63lqiMaZ9GZPPLP2ZXdLPv9KLVoEh8?=
 =?us-ascii?Q?uRZTpGA4ikxfTBZ7jWx4ZmIBYv3Kl8UNjUppvcom4yhumWIMbtCVvLrxNnXg?=
 =?us-ascii?Q?l9jj/pZ4853a9bs6m2YvXHRcDrGkkCk5xbv321nhm/okTNcPB6AjjsEKO3kf?=
 =?us-ascii?Q?UthVsIgr5ockCuRFWnfPx96OTKRNAgB80cqpm52xXMXfWMsaIFI2eBvp97Q/?=
 =?us-ascii?Q?eX1/nYXPZS5z7bJBn3214S9+Us7TSK0=3D?=
X-OriginatorOrg: iopsys.eu
X-MS-Exchange-CrossTenant-Network-Message-Id: af4f3dce-a1d9-4c89-fe7c-08deebb2ba37
X-MS-Exchange-CrossTenant-AuthSource: DU2PR08MB10037.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jul 2026 07:43:19.6484
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8d891be1-7bce-4216-9a99-bee9de02ba58
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lRZ9LljWlxpDjhrgmBojVsZvfXv9QDg+JZp/y/EvBFzd13t4E7fzWvznxcwxn+xsfELkKwoJOqGDXOwGFjccVWUVI+Ftn+/EbyyW/gpQTww=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB5501
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260727_004323_162324_DFF01AE7 
X-CRM114-Status: GOOD (  12.17  )
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
index df3a1d7c7b571..65447d7e5965a 100644
--- a/drivers/pinctrl/airoha/pinctrl-airoha.c
+++ b/drivers/pinctrl/airoha/pinctrl-airoha.c
@@ -382,8 +382,6 @@ struct airoha_pinctrl_gpiochip {
 	const u32 *status;
 	const u32 *level;
 	const u32 *edge;
-
-	u32 irq_type[AIROHA_NUM_PINS];
 };
 
 struct airoha_pinctrl_confs_info {
@@ -2577,11 +2575,11 @@ static void airoha_irq_unmask(struct irq_data *data)
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
@@ -2613,7 +2611,7 @@ static void airoha_irq_mask(struct irq_data *data)
 	u8 index = data->hwirq / AIROHA_REG_GPIOCTRL_NUM_PIN;
 	u32 mask = GENMASK(2 * offset + 1, 2 * offset);
 
-	if (data->hwirq >= ARRAY_SIZE(gpiochip->irq_type))
+	if (data->hwirq >= AIROHA_NUM_PINS)
 		return;
 
 	regmap_clear_bits(pinctrl->regmap, gpiochip->level[index], mask);
@@ -2629,7 +2627,7 @@ static void airoha_irq_ack(struct irq_data *data)
 	u8 offset = data->hwirq % AIROHA_PIN_BANK_SIZE;
 	u8 index = data->hwirq / AIROHA_PIN_BANK_SIZE;
 
-	if (data->hwirq >= ARRAY_SIZE(gpiochip->irq_type))
+	if (data->hwirq >= AIROHA_NUM_PINS)
 		return;
 
 	regmap_write(pinctrl->regmap, gpiochip->status[index], BIT(offset));
@@ -2637,28 +2635,24 @@ static void airoha_irq_ack(struct irq_data *data)
 
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


