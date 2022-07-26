Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3AF5DC00140
	for <linux-mediatek@archiver.kernel.org>; Tue, 26 Jul 2022 14:19:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZInEwHr9BBt1GEOVOcT9GMu8ibiHUYVgU2XvYXA7Q7w=; b=OwkKvGYLH9Ukrv7vdM9oxWcJUb
	t1V3CT4OyyIXjQ0CTvGUzXQxdL7/yBuAJXHwz5VTLqz0lWz+E7kvxrfPIAyUgzdR1naJcmFIpy5gN
	p7gdjkbF1/vpTGWW2JOeebsEYrhU7vMHOoBBUy/8i+c1Q+2Tqwt/m7yKHvVHM2jsQO5S81Rtr/YkZ
	KW20Sr93xgsi24Xy6odLuPSd/OX++zXrohQlvgZpvC0b0qquxu/u2ZsYgDVtFJfiA7gdIsUu2AxEO
	nG0GODoDIRbKUsffmkR+ijUF9stMLC5vq7M6SNHlhCe24Sg5NuQFZgOqcxvjO5A+7KD5HWOXwjMaR
	n41R5OjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oGLOl-00087p-7G; Tue, 26 Jul 2022 14:18:59 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oGLNR-0007T9-JH; Tue, 26 Jul 2022 14:17:40 +0000
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id C3DC26601B23;
	Tue, 26 Jul 2022 15:17:34 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1658845055;
	bh=AHG4+jEaEDFr9xaoQpgJI1/zRGeAc4nkoFr0uAgZJkg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=LsCoduHAL5q1mNuESUMDSIwO9M2a5travyRW3DGyox+IEOjpgqIYslk8NCdeCkgl+
	 kmPEbGBceeo/0xB++mrNAxHXDc0JYm4J3ByqPjGAgYNCKrT/HiOmlJ4W6vdL9O/xdk
	 J/lr/ADLeZ6gn+8pIg6Az9DOW2Jq35aol8m63jjEsjJWQ0MVOz/teSPXK1dI8by3m0
	 uJN65AJTb8pwyoHI1MKFMqoVM1vdE+GLGD0HXL5ynJbkdsptxSFnGV6TZdNsMRPrwv
	 PpLFcEJFVyMpSNNMBnVdwMaeRvddaNpdCE08eBIX4+Ytj+ZIr5QMAruljdc1LgXVny
	 1a0D32Wn/19JA==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: matthias.bgg@gmail.com
Cc: roger.lu@mediatek.com,
	khilman@baylibre.com,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	nfraprado@collabora.com,
	kernel@collabora.com,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: [PATCH 3/6] soc: mediatek: mtk-svs: Remove hardcoded irqflags
Date: Tue, 26 Jul 2022 16:16:50 +0200
Message-Id: <20220726141653.177948-4-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220726141653.177948-1-angelogioacchino.delregno@collabora.com>
References: <20220726141653.177948-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220726_071737_795185_5C574926 
X-CRM114-Status: GOOD (  11.91  )
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

The interrupt flags are specified in devicetree: forcing them into
the driver is suboptimal and not very useful.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/soc/mediatek/mtk-svs.c | 9 +--------
 1 file changed, 1 insertion(+), 8 deletions(-)

diff --git a/drivers/soc/mediatek/mtk-svs.c b/drivers/soc/mediatek/mtk-svs.c
index ee990acfc2d5..fcf246a6bb07 100644
--- a/drivers/soc/mediatek/mtk-svs.c
+++ b/drivers/soc/mediatek/mtk-svs.c
@@ -262,7 +262,6 @@ static const u32 svs_regs_v2[] = {
  * @rst: svs platform reset control
  * @efuse_parsing: svs platform efuse parsing function pointer
  * @probe: svs platform probe function pointer
- * @irqflags: svs platform irq settings flags
  * @efuse_max: total number of svs efuse
  * @tefuse_max: total number of thermal efuse
  * @regs: svs platform registers map
@@ -280,7 +279,6 @@ struct svs_platform {
 	struct reset_control *rst;
 	bool (*efuse_parsing)(struct svs_platform *svsp);
 	int (*probe)(struct svs_platform *svsp);
-	unsigned long irqflags;
 	size_t efuse_max;
 	size_t tefuse_max;
 	const u32 *regs;
@@ -294,7 +292,6 @@ struct svs_platform_data {
 	struct svs_bank *banks;
 	bool (*efuse_parsing)(struct svs_platform *svsp);
 	int (*probe)(struct svs_platform *svsp);
-	unsigned long irqflags;
 	const u32 *regs;
 	u32 bank_max;
 };
@@ -2680,7 +2677,6 @@ static const struct svs_platform_data svs_mt8192_platform_data = {
 	.banks = svs_mt8192_banks,
 	.efuse_parsing = svs_mt8192_efuse_parsing,
 	.probe = svs_mt8192_platform_probe,
-	.irqflags = IRQF_TRIGGER_HIGH,
 	.regs = svs_regs_v2,
 	.bank_max = ARRAY_SIZE(svs_mt8192_banks),
 };
@@ -2699,7 +2695,6 @@ static const struct svs_platform_data svs_mt8183_platform_data = {
 	.banks = svs_mt8183_banks,
 	.efuse_parsing = svs_mt8183_efuse_parsing,
 	.probe = svs_mt8183_platform_probe,
-	.irqflags = IRQF_TRIGGER_LOW,
 	.regs = svs_regs_v2,
 	.bank_max = ARRAY_SIZE(svs_mt8183_banks),
 };
@@ -2743,7 +2738,6 @@ static struct svs_platform *svs_platform_probe(struct platform_device *pdev)
 	svsp->banks = svsp_data->banks;
 	svsp->efuse_parsing = svsp_data->efuse_parsing;
 	svsp->probe = svsp_data->probe;
-	svsp->irqflags = svsp_data->irqflags;
 	svsp->regs = svsp_data->regs;
 	svsp->bank_max = svsp_data->bank_max;
 
@@ -2782,8 +2776,7 @@ static int svs_probe(struct platform_device *pdev)
 	}
 
 	ret = devm_request_threaded_irq(svsp->dev, svsp_irq, NULL, svs_isr,
-					svsp->irqflags | IRQF_ONESHOT,
-					svsp->name, svsp);
+					IRQF_ONESHOT, svsp->name, svsp);
 	if (ret) {
 		dev_err(svsp->dev, "register irq(%d) failed: %d\n",
 			svsp_irq, ret);
-- 
2.35.1


