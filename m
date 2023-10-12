Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1915CCDB482
	for <linux-mediatek@archiver.kernel.org>; Thu, 12 Oct 2023 09:58:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8P7MjqfgoscjHVfjMhQHJNV+33x0Sn8Uk3TjGFH+Drc=; b=UPfUT+PFnx8cj4tjARwW6nOIb9
	k5jk13bAKos6jYbZ2DGVR2xCXzH6kMxb6yHI4vaG6e51s0kL7+IN0T3zkrCdUtoAKhRLvMaK2M9SS
	sn6wugknwDR3r+qyHFmU0Y41uNAPbxW1Kuqx2w1REUyaCtdNYwQT0XiOzQeXE/tDyDPESP5ZXtB4V
	nTfjvsr2gfqQ8xRWJxYCX2cSmN0iNZxq/tHpmH4DvWRM7pohC+2TlL04G9b08MbwMKvdp5fsiRlNc
	iWz7BJLijbfTa56BDXc0DtgSaAKQBt0MgReeTnswvl180fxoda4lxX097Sve7NrZgCpfLwc6wO2LY
	p+vsZuYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qqsSJ-000TU2-2G;
	Thu, 12 Oct 2023 09:58:11 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qqsS2-000T7M-25;
	Thu, 12 Oct 2023 09:57:56 +0000
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id BAAD96607346;
	Thu, 12 Oct 2023 10:57:52 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1697104673;
	bh=ThqabPr3bv/oVcU6bXeFf4cKumQAnz569b0Huyfi/jU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=VaOuBimPm+qX4vFFVNcjeT9TJ0PEjrowb9R4N2duXjzKhh70KAKHfLZuXrPx239+h
	 EpT3IJ3jH8Kp+vR1LQlwsCAz+ClpautF2O9iHgcZ/POJXM8Tem3ydCHASdYpyXJ8F6
	 OOLNIQuqn2tYdmHeI3AN8mLEA3+fCiqXQ6aE1xlCRI5JeGA5nzq/0D0HJ3SwGRpuX+
	 BwNd9XtF8EEpwGEMHHiSfxt2Wtcsg0f0nx+co55mDlVeNoE2wca3GyA7TD8MGqP7Mt
	 bRy2fJds16k+bk+ebdxoRrHXvlxFKHLa9OaYNFsSX4eoRWBqmnlwtk4+7Am/PPJ6yV
	 lpz0kR+oLwmsA==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: chunkuang.hu@kernel.org
Cc: p.zabel@pengutronix.de,
	airlied@gmail.com,
	daniel@ffwll.ch,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	dri-devel@lists.freedesktop.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	wenst@chromium.org,
	kernel@collabora.com,
	ehristev@collabora.com,
	nfraprado@collabora.com
Subject: [PATCH v11 11/16] drm/mediatek: gamma: Add support for MT8195
Date: Thu, 12 Oct 2023 11:57:31 +0200
Message-ID: <20231012095736.100784-12-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231012095736.100784-1-angelogioacchino.delregno@collabora.com>
References: <20231012095736.100784-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231012_025754_812320_3AEB3AB6 
X-CRM114-Status: UNSURE (   9.52  )
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

Now that this driver supports 12-bit LUTs, we can add support for the
DISP_GAMMA found on the MT8195 SoC: add its driver data and compatible.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/gpu/drm/mediatek/mtk_disp_gamma.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/gpu/drm/mediatek/mtk_disp_gamma.c b/drivers/gpu/drm/mediatek/mtk_disp_gamma.c
index 6305cd95e6d4..bcc33aeca885 100644
--- a/drivers/gpu/drm/mediatek/mtk_disp_gamma.c
+++ b/drivers/gpu/drm/mediatek/mtk_disp_gamma.c
@@ -279,11 +279,20 @@ static const struct mtk_disp_gamma_data mt8183_gamma_driver_data = {
 	.lut_size = 512,
 };
 
+static const struct mtk_disp_gamma_data mt8195_gamma_driver_data = {
+	.lut_bank_size = 256,
+	.lut_bits = 12,
+	.lut_diff = true,
+	.lut_size = 1024,
+};
+
 static const struct of_device_id mtk_disp_gamma_driver_dt_match[] = {
 	{ .compatible = "mediatek,mt8173-disp-gamma",
 	  .data = &mt8173_gamma_driver_data},
 	{ .compatible = "mediatek,mt8183-disp-gamma",
 	  .data = &mt8183_gamma_driver_data},
+	{ .compatible = "mediatek,mt8195-disp-gamma",
+	  .data = &mt8195_gamma_driver_data},
 	{},
 };
 MODULE_DEVICE_TABLE(of, mtk_disp_gamma_driver_dt_match);
-- 
2.42.0


