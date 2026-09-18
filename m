Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 279C6C982DF
	for <linux-mediatek@archiver.kernel.org>; Fri, 18 Sep 2026 17:57:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MOpF21qwCYtkBPyOZB6nIIWOi6wwbvKg9f2XgINcd2A=; b=4TPYGST6Rz9wRP3Sg0jGQfaoz9
	5TPjjRdSoXymClJZYUzdI80VmLgbLZbLjnsG4wHcF5X2EWFaV6hlf9BVLYnRGkNJaCOGQwHLT6uNM
	xRvui37ndzY1Y7I7O/lc5yF3229C0iQP3eUP4p+UZlvrNKkzBX8Xtqb7YfgQUkJaEKxyhb/A+X8fC
	PQ5tP5AbGLzE5o+jZl9/9iTaWm5S5C93RS2Ll6W3UrNy/f3MH/MEBXVFDzzHy+GdXnftQ6Nuw+2qw
	olrvOvSMtPWe5p8j04Ffky8DhPz1LuIoSNEpKvSXSZ/n4PCpaJWqTUiKHfjHnToVlIkDc/WYWQr7s
	i3XOWEKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7cqU-0000000FEYs-1Waq;
	Fri, 18 Sep 2026 17:57:58 +0000
Received: from mail-wr2-x10.google.com ([2a00:1450:4864:30::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7cqN-0000000FETw-0PSL
	for linux-mediatek@lists.infradead.org;
	Fri, 18 Sep 2026 17:57:52 +0000
Received: by mail-wr2-x10.google.com with SMTP id ffacd0b85a97d-485933b2522so723177f8f.0
        for <linux-mediatek@lists.infradead.org>; Fri, 18 Sep 2026 10:57:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789754269; x=1790359069; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MOpF21qwCYtkBPyOZB6nIIWOi6wwbvKg9f2XgINcd2A=;
        b=iqyyBsBLpxLX4cfrCDV4BNN2DV+m5bswuYm9CxGWDYV5enX/MaEXAuWz4XPFfLjpY5
         6qUprTHxJtS+Y4iWZ8teF6UWwhCfCLlMuYNl7DtVaAMDyAtNpwMDpg/3F/e6YphOWMkp
         YogQOWD7eHpT/DHuhtcjz+ZkQ+ba5w6wdlbbHRX8JoWi17lTQJKwnm0Erh/VBkZWt4s/
         zFtBbepYTBqzi0VPB2QixspKDpi7ZbG5fl4rW6HvmoS6vzP9nMQdUJwDuPQnPfe6ZSWr
         zl9W4nN5PqFM1rNta+Wwv+cX+R4zM3zYQnH78nNUVPbHC66F0b+c38TS1VWTsfULSKUX
         7RVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789754269; x=1790359069;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=MOpF21qwCYtkBPyOZB6nIIWOi6wwbvKg9f2XgINcd2A=;
        b=UF9EYj6wlFp6YzEHiSCA1AudevN0UzMZJbonQHVdlyYZGcQU+bA5A5aMndMKLjNoSz
         hHONaOzlMaofSYjU2ArCa+s/KM3uAz2tbYvZhPu5U6bwv6pGUuaK7ZTadha3sMzsLoRp
         nPrWi8HDUZNYS+lQEf467Ij8ItTaRKlfHOv4HnQMT1tJruibZ2IQ6FqpKDHBYMFDf+CX
         xPpC8wLVwTlm/x6W59DwFxJrn6HeJyThi3gZ5228vDGHwgES8n9uMTPly8ZZzYDt/qVG
         OM1gHczYW1vpAFf87aNTwUv5L+9kOM3PuuuMyMYLeuP4IkSEktRC4YXj6pJp4xhBzPbG
         8pLA==
X-Gm-Message-State: AFuF++nse/iego5UHMN+sIWN16k34zn2XxZDXnclI6zEkGcve4G2In5M
	lSNQ+52VtHvzRsGvzkyjoNYIou1yPj3zmJT5v5P57g/WjsHg4baurQZjvm2ycBWQ
X-Gm-Gg: AYBFou2FogzN57QU7fjBmVOo0nY/+WNPtvRez4kESeWyJa2Nijln+uyD7gtSMPz/H25
	5Bm5xoWJVIvjKF4DFixTxEvHm1oFI2vb+L2630DD68ORlfi5Pauo1VPz/4I8tKeWNvRfGf83Uqh
	Q7FFzK1ZN3oArJrVM7DxTHRnvBN/9qMgGO02wTpNkHDqEGgKkYOUrTF6zarDaQ93caiuwxHzPcv
	0BG/eBiJt/+NeFU49B60Jh7MVKFV7DpA6+tt/0TiOSWiPPNw7BE2bzDWzTey4bldEK+KjrlVJZZ
	yX8HyK8RTp1ibuvmDFu7Vpfh3Og5gjiXQb/6vx1jbf3z3rQ5G4HPDq92czkUFifoXECJhIAx7Pg
	gEmftAbweIWbFwEXaoAxVzvy4/jvqo1EpLFY/nor+MSipZxujAB3NwCY0rDaWGXbf2xFpOicsWa
	1PudzJ83nEW2pmIoEf/JmxLp+ayWYMGrSrMJjAXAJnRFGBC2EUMitQE1gna6UfCTkR6lFZCUPrO
	l79JQ==
X-Received: by 2002:a05:6000:40c8:b0:487:403:f2eb with SMTP id ffacd0b85a97d-4871e263f5dmr9591011f8f.17.1789754269490;
        Fri, 18 Sep 2026 10:57:49 -0700 (PDT)
Received: from luca-vm.lan ([154.61.61.58])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48724562aebsm268461f8f.14.2026.09.18.10.57.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 10:57:49 -0700 (PDT)
From: Luca Leonardo Scorcia <l.scorcia@gmail.com>
To: linux-mediatek@lists.infradead.org
Cc: Luca Leonardo Scorcia <l.scorcia@gmail.com>,
	Chun-Kuang Hu <chunkuang.hu@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	CK Hu <ck.hu@mediatek.com>,
	Jitao shi <jitao.shi@mediatek.com>,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH 2/4] drm/mediatek: Add support for mt8167 Digital Parallel Interface
Date: Fri, 18 Sep 2026 19:55:26 +0200
Message-ID: <20260918175736.355305-3-l.scorcia@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260918175736.355305-1-l.scorcia@gmail.com>
References: <20260918175736.355305-1-l.scorcia@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260918_105751_743875_35961D27 
X-CRM114-Status: GOOD (  12.39  )
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

Add support for the two DPI blocks found in the mt8167 SoCs. One of them
can be routed to a DPI connector and another is directly connected to the
HDMI IP.

Signed-off-by: Luca Leonardo Scorcia <l.scorcia@gmail.com>
---
 drivers/gpu/drm/mediatek/mtk_dpi.c     | 23 +++++++++++++++++++++++
 drivers/gpu/drm/mediatek/mtk_drm_drv.c |  2 ++
 2 files changed, 25 insertions(+)

diff --git a/drivers/gpu/drm/mediatek/mtk_dpi.c b/drivers/gpu/drm/mediatek/mtk_dpi.c
index 0e4f430de983..9012adeb63d0 100644
--- a/drivers/gpu/drm/mediatek/mtk_dpi.c
+++ b/drivers/gpu/drm/mediatek/mtk_dpi.c
@@ -1114,6 +1114,10 @@ static const struct mtk_dpi_factor dpi_factor_mt2701[] = {
 	{ 64000, 4 }, { 128000, 2 }, { U32_MAX, 1 }
 };
 
+static const struct mtk_dpi_factor dpi_factor_mt8167[] = {
+	{ 64000, 16 }, { 74250, 8 }, { 160000, 4 }, { U32_MAX, 2 }
+};
+
 static const struct mtk_dpi_factor dpi_factor_mt8173[] = {
 	{ 27000, 48 }, { 84000, 24 }, { 167000, 12 }, { U32_MAX, 6 }
 };
@@ -1163,6 +1167,24 @@ static const struct mtk_dpi_conf mt2701_conf = {
 	.csc_enable_bit = CSC_ENABLE,
 };
 
+static const struct mtk_dpi_conf mt8167_conf = {
+	.dpi_factor = dpi_factor_mt8167,
+	.num_dpi_factor = ARRAY_SIZE(dpi_factor_mt8167),
+	.reg_h_fre_con = 0xe0,
+	.max_clock_khz = 150000,
+	.output_fmts = mt8173_output_fmts,
+	.num_output_fmts = ARRAY_SIZE(mt8173_output_fmts),
+	.pixels_per_iter = 1,
+	.is_ck_de_pol = true,
+	.swap_input_support = true,
+	.support_direct_pin = true,
+	.dimension_mask = HPW_MASK,
+	.hvsize_mask = HSIZE_MASK,
+	.channel_swap_shift = CH_SWAP,
+	.yuv422_en_bit = YUV422_EN,
+	.csc_enable_bit = CSC_ENABLE,
+};
+
 static const struct mtk_dpi_conf mt8183_conf = {
 	.dpi_factor = dpi_factor_mt8183,
 	.num_dpi_factor = ARRAY_SIZE(dpi_factor_mt8183),
@@ -1342,6 +1364,7 @@ static void mtk_dpi_remove(struct platform_device *pdev)
 
 static const struct of_device_id mtk_dpi_of_ids[] = {
 	{ .compatible = "mediatek,mt2701-dpi", .data = &mt2701_conf },
+	{ .compatible = "mediatek,mt8167-dpi", .data = &mt8167_conf },
 	{ .compatible = "mediatek,mt8173-dpi", .data = &mt8173_conf },
 	{ .compatible = "mediatek,mt8183-dpi", .data = &mt8183_conf },
 	{ .compatible = "mediatek,mt8186-dpi", .data = &mt8186_conf },
diff --git a/drivers/gpu/drm/mediatek/mtk_drm_drv.c b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
index c86a3f54f35b..64c87221d931 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_drv.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
@@ -802,6 +802,8 @@ static const struct of_device_id mtk_ddp_comp_dt_ids[] = {
 	  .data = (void *)MTK_DPI },
 	{ .compatible = "mediatek,mt8167-dsi",
 	  .data = (void *)MTK_DSI },
+	{ .compatible = "mediatek,mt8167-dpi",
+	  .data = (void *)MTK_DPI },
 	{ .compatible = "mediatek,mt8173-dpi",
 	  .data = (void *)MTK_DPI },
 	{ .compatible = "mediatek,mt8183-dpi",
-- 
2.43.0


