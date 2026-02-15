Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45457EF5870
	for <linux-mediatek@archiver.kernel.org>; Sun, 15 Feb 2026 08:56:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xn0j1K2MWkt0qaJPtZ+aFAPD3v2FfobPnhX1+9/1/mc=; b=lruyKbo9VcmaxTZlye+/v8zRiF
	wHJBFNeUXWsZeWJC5BGHeL9Ztgt+2Gl68j3TV/Gh/Qg6NarEc4UbWou4buNTafcJ8rQ+olHfCuWSS
	Z71YEhJM3ufR9QlTVcN6lxlv5DKLqpOzrNTxSazKdyv/OG/m78uk0cRgT2mxbPH1Qnh8fuHdMreFg
	fetPZLNbrdcuDi3eWljbBnXUYKVFH/aM48USDBx4RLb9YqgyWDd6QCeEW4e2eKSCVpvcpDGPgU9Rs
	5Uzt4iVBbq4rdEoTamR9zHs071cvY/IZw0AbB147Sz0rVMGRODBzTMzDia+bz371YaCbl8e6+Qicw
	r07MhsMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vrXv5-00000005HMI-19BW;
	Sun, 15 Feb 2026 08:55:59 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vrXuu-00000005HB4-2s1T
	for linux-mediatek@lists.infradead.org;
	Sun, 15 Feb 2026 08:55:50 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-4837f27cf2dso5713235e9.2
        for <linux-mediatek@lists.infradead.org>; Sun, 15 Feb 2026 00:55:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771145746; x=1771750546; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xn0j1K2MWkt0qaJPtZ+aFAPD3v2FfobPnhX1+9/1/mc=;
        b=cWmOeUPTZDDx9jrYUwPtNkdj9HRchmvTJ1+4rlu3HUCuY41JRFZvlxhRc7LnQXXXVf
         WitMAP7PRSt5V5HnYOsA097C5NAc2txmk90b6mZ7ftSVEDLCNfWqEs9GFt2Ycco7m7hB
         s7T6Ugkjweshofr1vXWIxXf4JIsdvhPhw19h0MrUQSNHU8sOi4IrdtSt/x702BrgR4pY
         g1vn0M+yePetbqEKbjfvusfXepQOpB582DsBWDKaQO6hEVIgbQBH+kwI1tHmdy0JsyOv
         reZCOBBuWAabAy5qbJSuCRAVhvy7RBWnaJ+byhGFiCgaBhJevSKRr0XCiAGLSObAlJSO
         3VHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771145746; x=1771750546;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=xn0j1K2MWkt0qaJPtZ+aFAPD3v2FfobPnhX1+9/1/mc=;
        b=WCyt5XE2+QVMHb4psX6AbPRk0GgaMekBsy0l3NM7sopONrOSd0jJ0en+DTvfndkPuH
         bF8I5FmsU4uKDHIq++ZG89FKzhfBcWx2u7Dgqt9jtS2l5QwL8TGy5bvVQXQHCCxGPqaO
         QxxNAs9pWUv9rd0hQScxfEJWdqRigaoO61OcOAOnuYVQmSEIAVs4DwBtyo9JHR2uqflG
         vcGwNWHhQ8erTIX1foAMAff/oXz6VUbabqOe8uta4XvyjWLav+HXetkx/n/6ZEfGY9/n
         jLA6WQtHKkjllMDdQTFTJQhh6k5Mvo8MYx0WQd1crc4hJ9HvSMkeAMGyxfLdIIBfusVz
         mG6Q==
X-Gm-Message-State: AOJu0YwtINdThzwhF1lUxUEBT2ailDGQx64ldonHDJkj3rXqxvpVfYim
	VO6lURJvuVCAM0cUudtjpjlkw2h55wpjaw8wEtsKVvlBqY0GtyeDGnvp1AB0/g==
X-Gm-Gg: AZuq6aI+DcTP1huCqyuo1Cy8+z+JNNDuQWTCVnejP4LyDQqb4OU+2ExI/z7WMsPNtaH
	VnRi4obqRMU2ssZ1K5vsk4jsq05tkEXzu+MpYSiIrvrxvbgyzhBs8F25PQiZJ7Bb3JZU3165xjA
	yVCujiHCfFFX4NVRYzd/uivKExY9fB6ALgYyJ01C9cK2/P5ZhBVvbtMlFpQNgaX6rZ6wFKUiRw9
	lqH2jQLr5agylewHCiGfztfikcNfqIBPguQWvGKCGdqCS5QKi28K2DGD1t+OyNvGawLR/A0hl1C
	pdoU6fw4qX37pGNC9itN9qkIO2B/TZKRbK3XDHBiOcaz69FwPsGlCq0OP61//DxP1LTqXdX0g1m
	nUTXXVI7F7PCd8pocJwY4Qyy5RHFc4tIM/C55rVwIObzKtUt4nSIjgw2EU27mZSQX3scuItdzGp
	/U8yJE/NRxjMVUqwhlclA=
X-Received: by 2002:a05:600c:870b:b0:483:6f37:1b56 with SMTP id 5b1f17b1804b1-48371051b15mr146178135e9.10.1771145746214;
        Sun, 15 Feb 2026 00:55:46 -0800 (PST)
Received: from luca-vm.lan ([154.61.61.58])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4834d5d78cfsm547211675e9.1.2026.02.15.00.55.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Feb 2026 00:55:45 -0800 (PST)
From: Luca Leonardo Scorcia <l.scorcia@gmail.com>
To: linux-mediatek@lists.infradead.org
Cc: Luca Leonardo Scorcia <l.scorcia@gmail.com>,
	Val Packett <val@packett.cool>,
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
	Chunfeng Yun <chunfeng.yun@mediatek.com>,
	Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Jitao Shi <jitao.shi@mediatek.com>,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-phy@lists.infradead.org
Subject: [PATCH 4/4] gpu: drm: mediatek: ovl: add specific entry for mt8167
Date: Sun, 15 Feb 2026 08:53:56 +0000
Message-ID: <b440a9c1972dedc4cfbf29a84366e635b0d7d984.1771144723.git.l.scorcia@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1771144723.git.l.scorcia@gmail.com>
References: <cover.1771144723.git.l.scorcia@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260215_005548_794133_E2C408F5 
X-CRM114-Status: UNSURE (   9.75  )
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

From: Val Packett <val@packett.cool>

While this configuration is otherwise identical to mt8173, according
to Android kernel sources, this SoC does need smi_id_en.

Signed-off-by: Val Packett <val@packett.cool>
Signed-off-by: Luca Leonardo Scorcia <l.scorcia@gmail.com>
---
 drivers/gpu/drm/mediatek/mtk_disp_ovl.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/gpu/drm/mediatek/mtk_disp_ovl.c b/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
index e0236353d499..97a899e4bd99 100644
--- a/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
+++ b/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
@@ -671,6 +671,16 @@ static const struct mtk_disp_ovl_data mt2701_ovl_driver_data = {
 	.num_formats = ARRAY_SIZE(mt8173_formats),
 };
 
+static const struct mtk_disp_ovl_data mt8167_ovl_driver_data = {
+	.addr = DISP_REG_OVL_ADDR_MT8173,
+	.gmc_bits = 8,
+	.layer_nr = 4,
+	.fmt_rgb565_is_0 = true,
+	.smi_id_en = true,
+	.formats = mt8173_formats,
+	.num_formats = ARRAY_SIZE(mt8173_formats),
+};
+
 static const struct mtk_disp_ovl_data mt8173_ovl_driver_data = {
 	.addr = DISP_REG_OVL_ADDR_MT8173,
 	.gmc_bits = 8,
@@ -742,6 +752,8 @@ static const struct mtk_disp_ovl_data mt8195_ovl_driver_data = {
 static const struct of_device_id mtk_disp_ovl_driver_dt_match[] = {
 	{ .compatible = "mediatek,mt2701-disp-ovl",
 	  .data = &mt2701_ovl_driver_data},
+	{ .compatible = "mediatek,mt8167-disp-ovl",
+	  .data = &mt8167_ovl_driver_data},
 	{ .compatible = "mediatek,mt8173-disp-ovl",
 	  .data = &mt8173_ovl_driver_data},
 	{ .compatible = "mediatek,mt8183-disp-ovl",
-- 
2.43.0


