Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B10AC369AB
	for <linux-mediatek@archiver.kernel.org>; Tue, 15 Apr 2025 11:26:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sr+kw7CPM5Wak4Nvgagfmcz2yZ2HJtkiCugUggpOg38=; b=Onx46CNtLMw7FoBLXbh1FGteGv
	LEWBZp+Dql/kT6OMJWJGSg2dNq8HL/1t6kgpF8ceZlozgCi6EvNs5QQvDkZcF0i/PqFo2CG+RsmsR
	Qm1Cjj/nqzNxmQqWaPOj/d16IUIGe1yuwMdUuu7QIeAr5ktSc1mXXkDCMkkTMIGJc78r2XFB/Tbuc
	kbeYwXKXGjsm9Bav6kzoQHD0MnA4IiZkxTGFjRAL85DYS3z+PRF8SX+Ckp8RN5vzv83CIvzD4kRtK
	SEXAMLqCfhH/OHYwP2eolXA0x9jEzy7HBySLTnrkAzuq9FdzI+s95sYOoGyNCoK4LsZcoJ8Lx6nYH
	FDgDJQuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4eQk-00000005Wq2-1O1J;
	Tue, 15 Apr 2025 11:26:18 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4dlu-00000005NhK-2xgy;
	Tue, 15 Apr 2025 10:44:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1744713845;
	bh=a91+q+20hy0NODEIDCf468pEbhhoKhEbHoR3+M0KwbE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=B8IBB8PSD6tv37+sGw2GaVj06lmR8S7OdnHoLX7wrGawQz31qaIAgrFAaOl0waVvP
	 Snyodm8roOGQjm80u+fsFx5XPndAPIJ15WUEvwh1wyIzLQHEM+03iFO445edwj+KcU
	 ZYVxbmg/x7dXh3NehVoYSS1jV7qMrZqS8URlMJn4Lp4fv9TPSVcnn0fnv9uHfIs346
	 3OZAfkyRKpDBMva7XKowBk2wn13wZVnmDo7rcWIRTUB43nWCAWCTGTdjQ2mUE0qZwJ
	 Rp+vxGuqz+Y5K/qBx4/U8HpO5rYuLUV0jFtmdGkqLG9bGIU98ce+kPzJ+Hg16EbAiW
	 hj+pyohmM9F0A==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id E2C7B17E09B5;
	Tue, 15 Apr 2025 12:44:03 +0200 (CEST)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: chunkuang.hu@kernel.org
Cc: p.zabel@pengutronix.de,
	airlied@gmail.com,
	simona@ffwll.ch,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	tzimmermann@suse.de,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	ck.hu@mediatek.com,
	jitao.shi@mediatek.com,
	jie.qiu@mediatek.com,
	junzhi.zhao@mediatek.com,
	dri-devel@lists.freedesktop.org,
	linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	kernel@collabora.com,
	dmitry.baryshkov@linaro.org,
	lewis.liao@mediatek.com,
	ives.chenjh@mediatek.com,
	tommyyl.chen@mediatek.com,
	jason-jh.lin@mediatek.com
Subject: [PATCH v9 21/23] drm/mediatek: mtk_hdmi_common: Add var to enable interlaced modes
Date: Tue, 15 Apr 2025 12:43:19 +0200
Message-ID: <20250415104321.51149-22-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250415104321.51149-1-angelogioacchino.delregno@collabora.com>
References: <20250415104321.51149-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250415_034406_901883_0FC6079E 
X-CRM114-Status: UNSURE (   9.61  )
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

Add an interlace_allowed bool member to struct mtk_hdmi_ver_conf
which will be used to signal whether interlaced modes are supported
by the bridge (in our case, the HDMI IP), and enable it for HDMIv2.

Reviewed-by: CK Hu <ck.hu@mediatek.com>
Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/gpu/drm/mediatek/mtk_hdmi_common.c | 1 +
 drivers/gpu/drm/mediatek/mtk_hdmi_common.h | 1 +
 2 files changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/mediatek/mtk_hdmi_common.c b/drivers/gpu/drm/mediatek/mtk_hdmi_common.c
index b6043d99be7e..dc59f46b790c 100644
--- a/drivers/gpu/drm/mediatek/mtk_hdmi_common.c
+++ b/drivers/gpu/drm/mediatek/mtk_hdmi_common.c
@@ -415,6 +415,7 @@ struct mtk_hdmi *mtk_hdmi_common_probe(struct platform_device *pdev)
 	hdmi->bridge.ddc = hdmi->ddc_adpt;
 	hdmi->bridge.vendor = "MediaTek";
 	hdmi->bridge.product = "On-Chip HDMI";
+	hdmi->bridge.interlace_allowed = ver_conf->interlace_allowed;
 
 	ret = devm_drm_bridge_add(dev, &hdmi->bridge);
 	if (ret)
diff --git a/drivers/gpu/drm/mediatek/mtk_hdmi_common.h b/drivers/gpu/drm/mediatek/mtk_hdmi_common.h
index d3de8afff40f..38d1bdf4c77e 100644
--- a/drivers/gpu/drm/mediatek/mtk_hdmi_common.h
+++ b/drivers/gpu/drm/mediatek/mtk_hdmi_common.h
@@ -131,6 +131,7 @@ struct mtk_hdmi_ver_conf {
 	const struct hdmi_codec_ops *codec_ops;
 	const char * const *mtk_hdmi_clock_names;
 	int num_clocks;
+	bool interlace_allowed;
 };
 
 struct mtk_hdmi_conf {
-- 
2.49.0


