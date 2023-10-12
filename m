Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E9A4CDB483
	for <linux-mediatek@archiver.kernel.org>; Thu, 12 Oct 2023 09:58:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iCKuFwpY+ES1vmPepetvdi1pEhNshl/kLUS9j06eJFM=; b=I8Yk+8otbxBwlDufyjy1ZyMf+h
	iqhQMQJAhuY3xRVhir3d/ly6dRHRfyKbygMDWOwlvOLuIszWSncjnaX2Ir+afYz6nOU7rxozUnxuv
	kbWK+JtmJ/HalJTy7F/rpEcyZ9w+qNVTjxGrj3sswsfQPsMbvX3worJjV8mltXaC5sRo3c6Zl/REs
	rTbq0PVpfTX766qxcPBzi4Dx3o0w39XCZND7op330swIdo1/AWhRYj48+IJvIQkEBNBNKj/FxujW5
	4+9eH1ptiti//Jyb5yH98CTYfmhmSEosb5vxgdWA/65MvrheIc6396YJdfPMttl9/Qphu8t+3yUBS
	KJFlc7dQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qqsSi-000TzW-2Z;
	Thu, 12 Oct 2023 09:58:36 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qqsS5-000TAx-2N;
	Thu, 12 Oct 2023 09:58:00 +0000
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id B45C7660735F;
	Thu, 12 Oct 2023 10:57:55 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1697104676;
	bh=P77/YJTDYSmaGaK0qEws105RIsjmcoEYcEi31r4tRak=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=KsNcUiyYcr5XDShO3jtR6lFvlbnttI8Bj9IT5wRcAVxxNmfrK1oSd5yYjKUcYc/M3
	 yoLfBUpSg2XIxz/PIgAFSLOCVf1/becsUAVE6cKNnlz16brkuRgMGGIw8quEFV9uUY
	 ZUouCH6PbMiOfUVXo0+xdoLWaKb5PeoDBPvJQ/r5HnaQSYdTuOGZp5H9AYoo6mG9Rx
	 OdsjXQAAutSbNy8jZiMSdIW9Hu2dEY9+XGjJaWyG91pwiag6C/rGlXD0c/DPjgvDpz
	 BoJYCsTymG7C9a/xSyUD06ZBmomCwr6yEdu9urIwBnTEF3v4DYdKHtfsqf6lW6C41Q
	 j4BvyIfh8FAcA==
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
	nfraprado@collabora.com,
	CK Hu <ck.hu@mediatek.com>
Subject: [PATCH v11 14/16] drm/mediatek: aal: Add kerneldoc for struct mtk_disp_aal
Date: Thu, 12 Oct 2023 11:57:34 +0200
Message-ID: <20231012095736.100784-15-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231012095736.100784-1-angelogioacchino.delregno@collabora.com>
References: <20231012095736.100784-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231012_025757_970556_1E77027E 
X-CRM114-Status: UNSURE (   8.25  )
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

The kerneldoc for struct mtk_disp_aal is missing: write one and
document this structure.

Reviewed-by: CK Hu <ck.hu@mediatek.com>
Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/gpu/drm/mediatek/mtk_disp_aal.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/gpu/drm/mediatek/mtk_disp_aal.c b/drivers/gpu/drm/mediatek/mtk_disp_aal.c
index 15f91cea9f20..7b3e1c275056 100644
--- a/drivers/gpu/drm/mediatek/mtk_disp_aal.c
+++ b/drivers/gpu/drm/mediatek/mtk_disp_aal.c
@@ -35,6 +35,13 @@ struct mtk_disp_aal_data {
 	bool has_gamma;
 };
 
+ /**
+ * struct mtk_disp_aal - Display Adaptive Ambient Light driver structure
+ * @clk:      clock for DISP_AAL controller
+ * @regs:     MMIO registers base
+ * @cmdq_reg: CMDQ Client register
+ * @data:     platform specific data for DISP_AAL
+ */
 struct mtk_disp_aal {
 	struct clk *clk;
 	void __iomem *regs;
-- 
2.42.0


