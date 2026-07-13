Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B1B4C43458
	for <linux-mediatek@archiver.kernel.org>; Mon, 13 Jul 2026 11:32:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=bQ5YkObDJn3q5yEXBMbpydhpxp/loGCG/PfQF+sLSPI=; b=vajRWlP3p5ydz5dDGzyhjfP6wd
	QGqbEJKn7HDZ0RrxwRj7GsIVxGkt4RRqHfEJUfT5s0yAh6A4sSuE8ijYyNnIr/zGzDkFvN3syxDV+
	ZxnaqG5Ctz8t8d3oX1dvCO2C3pjhU5wKLlincrstRtZ64JTiWQ2XWbR5BYqPtkWBkV+w7jUBc8g7Z
	SQnsF7dXYtQD/SdpYbjO20vPNGk4eHfaFLNPyVVZZPA2fpholM5hHkhzQJ5WDbYyiVEw16ni0ItIY
	26GPrPhRxUwi/80czGs4cORgLYQhJUsO/zRLCYXnGfIfe9jtfonANGcHoFIoayVoCm1V17AjIKMNi
	WXhfeIbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjEtZ-000000090Zr-0Bm1;
	Mon, 13 Jul 2026 11:32:21 +0000
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjEtW-000000090ZB-0DdE
	for linux-mediatek@lists.infradead.org;
	Mon, 13 Jul 2026 11:32:19 +0000
Received: by mail-pf1-x429.google.com with SMTP id d2e1a72fcca58-8454160043aso2913046b3a.3
        for <linux-mediatek@lists.infradead.org>; Mon, 13 Jul 2026 04:32:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783942337; x=1784547137; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=bQ5YkObDJn3q5yEXBMbpydhpxp/loGCG/PfQF+sLSPI=;
        b=XoXAP9Ntowznpe6WxQvPMaPQJcSGDsvSa17ghPQ+KfLM5YC54GJZAge9yV3Ys+ROUo
         gjC262otb7IQ3lcfKd7Z7v+p9fpv1PVyY+rNl41BeXAN22nFBO5COTG09wZ7fCa8P8UV
         1B3nyucpo/EaQ4f6a+uvejFSxkOgTeW3vN/4iCj+3UpoKUWhZ9gvv+J+32G4Rfy04dyb
         swTHn+gJpOXmd8fwKW4gLLUAwtHATAirVGW6a98lrjB7bnRj0TMEaS5G2gsQSp+yk1fI
         vH2extFkBRhlRHRkGo/+7sS9nRtmaG7oi2eq3FzwsJT/XpnrLl4hMZ1wXjbNWsImD8vA
         uWuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783942337; x=1784547137;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bQ5YkObDJn3q5yEXBMbpydhpxp/loGCG/PfQF+sLSPI=;
        b=HL+dzVlMaLMgo040uls200CH2MYsQjYQ/latFf7O6Jh9oUvZXKT3zr5B0bsww3F3Vv
         Arsb2xTJfXNEoFe+e1MrrazcfyG/RUkvR1/n/z7HmC8kLPsdqZBA+uwTxtPbihF9TJT3
         khCeXGO1So+fs6yJ5ZwFj2fk4NJaT/U3BOPo/gUCbFAbVmPhRkgeGE7bNncGYgr5e1cz
         PRTr9Ifwao/5JgkXUQmUUu9nDA4myC7Gl8CApOomJ56TdIo/aePuTh1W4flgSeHwI2dZ
         i1Ou8AGtuj084KwSRmbaMbR4a7+WeAQ5KQ/qDKZdeofaluoyAVtWsxLeN8kDu+9veNeZ
         SGaA==
X-Forwarded-Encrypted: i=1; AHgh+Ro1HTHw0/1+XT0OCIWZx5w02Q+Y4P34ZPgsA3Kg8U9nJSZiNm9vvLWuPqbmjSwfPKuz8wRCboPqfHel49hqeA==@lists.infradead.org
X-Gm-Message-State: AOJu0YwyRumiBnaryTSQLJJWiCZQtYInvs7vBfHWwhTEWpdOgILVykaR
	3Eu/nUlOsC9IVqvqZunRMDaZCgbsZ+/02hXzq62sxfDesXJ4rJ2YbReN
X-Gm-Gg: AfdE7clsLQCrGLhSMtkZiC73J1izCXnneLwl17uKzFC3qnzFKLhVH7ZyPnb/kfga8bv
	flS15azz1POiXZXpOjWl/PZwGLiiwimgZrb7C7Uso8bFhCYYUcRdjOCzfecUdKNu5ltTnlYtoFn
	MPd1atk8OlSY9K97wl3KKCsyVfSdEctdo8KUy+nxHKCQKgaiY7d4i/PDpSDnK9OVTmCFC6p6ZU6
	I/htsj1VtlhP/EURhWuxkzCor16Gf55s50vYHLV73TQMstpppP1z6tmVeqHn3DN+jmwPiA62U3Y
	Fx6p0p8uRTc0bSrWhN6IaZVvUO5n+iV8cDssBKcTd+9bfRPpXAo/JGout0uXP8EJCmwGWHhY+IR
	5GbcbE2PrLW1wEfH2na21A3SCAygbgHrI9jY01etys8Ow1KkbUkgHudqr4j7rsitWcHh0jZs=
X-Received: by 2002:a05:6a00:18aa:b0:845:d286:1fa8 with SMTP id d2e1a72fcca58-84889768958mr8641367b3a.55.1783942336528;
        Mon, 13 Jul 2026 04:32:16 -0700 (PDT)
Received: from lgs.. ([2001:250:5800:1000::f280])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84880a4abf1sm4318802b3a.16.2026.07.13.04.32.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 04:32:16 -0700 (PDT)
From: Guangshuo Li <lgs201920130244@gmail.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	CK Hu <ck.hu@mediatek.com>,
	Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>,
	dri-devel@lists.freedesktop.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: Johan Hovold <johan@kernel.org>,
	Guangshuo Li <lgs201920130244@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH v3] drm/mediatek: mtk_hdmi: Fix DDC adapter double put in v2
Date: Mon, 13 Jul 2026 19:29:57 +0800
Message-ID: <20260713112957.884640-1-lgs201920130244@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260713_043218_090812_6C1FA20A 
X-CRM114-Status: GOOD (  13.20  )
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

mtk_hdmi_common_probe() gets the DDC adapter with
of_find_i2c_adapter_by_node() and registers a devm action to release the
adapter device reference with put_device().

The HDMI v2 remove callback also calls i2c_put_adapter() on the same DDC
adapter. This is not paired with of_find_i2c_adapter_by_node(): it drops
the adapter device reference before the devm action drops it again, and
it also puts a module reference that was never taken.

Remove the extra i2c_put_adapter() call and drop the now-empty HDMI v2
remove callback. The common devm action releases the adapter device
reference.

Fixes: 8d0f79886273 ("drm/mediatek: Introduce HDMI/DDC v2 for MT8195/MT8188")
Cc: stable@vger.kernel.org
Reviewed-by: Johan Hovold <johan@kernel.org>
Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>
---
v3:
  - Add Reviewed-by tag from Johan Hovold.
  - No code changes.

v2:
  - Drop the empty remove callback, as suggested by Johan Hovold.
  - Mention that i2c_put_adapter() also drops a module reference that was
    never taken.
  - Fix the Fixes tag.
  - Add Cc stable.

 drivers/gpu/drm/mediatek/mtk_hdmi_v2.c | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_hdmi_v2.c b/drivers/gpu/drm/mediatek/mtk_hdmi_v2.c
index 7bbf463056c9..ffe456238a2b 100644
--- a/drivers/gpu/drm/mediatek/mtk_hdmi_v2.c
+++ b/drivers/gpu/drm/mediatek/mtk_hdmi_v2.c
@@ -1499,13 +1499,6 @@ static int mtk_hdmi_v2_probe(struct platform_device *pdev)
 	return 0;
 }
 
-static void mtk_hdmi_v2_remove(struct platform_device *pdev)
-{
-	struct mtk_hdmi *hdmi = platform_get_drvdata(pdev);
-
-	i2c_put_adapter(hdmi->ddc_adpt);
-}
-
 static const struct of_device_id mtk_drm_hdmi_v2_of_ids[] = {
 	{ .compatible = "mediatek,mt8188-hdmi-tx", .data = &mtk_hdmi_conf_mt8188 },
 	{ .compatible = "mediatek,mt8195-hdmi-tx", .data = &mtk_hdmi_conf_mt8195 },
@@ -1515,7 +1508,6 @@ MODULE_DEVICE_TABLE(of, mtk_drm_hdmi_v2_of_ids);
 
 static struct platform_driver mtk_hdmi_v2_driver = {
 	.probe = mtk_hdmi_v2_probe,
-	.remove = mtk_hdmi_v2_remove,
 	.driver = {
 		.name = "mediatek-drm-hdmi-v2",
 		.of_match_table = mtk_drm_hdmi_v2_of_ids,
-- 
2.43.0


