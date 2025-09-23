Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51DA0CAC5AE
	for <linux-mediatek@archiver.kernel.org>; Tue, 23 Sep 2025 15:26:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hHfPKhUQYUCknZFG8ACl/doBBnfNCNclK6q333fPeU0=; b=3fhHDuGolXXr+jF1fQitk3vF4s
	OK72DwRMuN5/tFFyUR/TA3+qR9/gHL2pIH1ReimxvBEyJT9PSd9o8BEdv0LQT29RPZd1X6VN9daJT
	VZhp9tU+m6QloI6zQfV3c5Z1/7iTebW8zY3ObycwOP8Gh+I/QrefbQ7U3z164BTBkrgrwMvf0tuFx
	tAOqQMhbSVXBAQMsFI49esb9KQyKzU3vllWkaNuMxXn4BYgrE3hRnG14ADHskrChfxX0b7VPrqG6R
	+sM0S1qcNqQQQrJwARsEMpjSfsVIW3ltUZJYfMud7KJ+9CY6NTp0NC4YTaxuesip/ii/65ugTby9r
	rQ+LXw/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v14uJ-0000000E2ST-1Ohe;
	Tue, 23 Sep 2025 15:26:19 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v14uE-0000000E2N0-1HEl
	for linux-mediatek@lists.infradead.org;
	Tue, 23 Sep 2025 15:26:15 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 36AE144D17;
	Tue, 23 Sep 2025 15:26:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 195F4C4CEF5;
	Tue, 23 Sep 2025 15:26:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758641173;
	bh=30zvSnUQBdVP9nzTp9cWqSwZXrzYK9ux1hOlnELHiMU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=I7K7+f+Rbm1S4nTXRHRqvh91O7U0m8/B6AUA+ntX4CdJJSk5ObmzTNWPnH6KZCOw4
	 UzbXvOlLO2uPG6LQtVr/w1RvH/W68P0jmfEFCjjo9cO9zhRC0xFAF+sKhbUSJXEsA2
	 LEgxPxLXpFmRZ8lyOvBOHLkrh5hN3zsSCR1YSz63lPQooVmakiahMDH1NWWoSmXL41
	 H8xEAZHP5ex9Ga9uVil+WgByS+giNxIllok+J7B5I14gJ0tr6mJn/he44FMoRWC+RU
	 szrEWjCUnwhBCNLJgwXUSHlPiUZ4EtLNyjs2bqXjTkhFm8RJh6ZG7sXu4y8BfPiqqn
	 67i83Z4IhQvBQ==
Received: from johan by xi.lan with local (Exim 4.98.2)
	(envelope-from <johan@kernel.org>)
	id 1v14u7-000000004mv-0ek6;
	Tue, 23 Sep 2025 17:26:07 +0200
From: Johan Hovold <johan@kernel.org>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>
Cc: David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	dri-devel@lists.freedesktop.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Johan Hovold <johan@kernel.org>,
	stable@vger.kernel.org,
	Jie Qiu <jie.qiu@mediatek.com>
Subject: [PATCH 4/5] drm/mediatek: mtk_hdmi: fix probe device leaks
Date: Tue, 23 Sep 2025 17:23:39 +0200
Message-ID: <20250923152340.18234-5-johan@kernel.org>
X-Mailer: git-send-email 2.49.1
In-Reply-To: <20250923152340.18234-1-johan@kernel.org>
References: <20250923152340.18234-1-johan@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250923_082614_382864_CC13B454 
X-CRM114-Status: GOOD (  11.79  )
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

Make sure to drop the references to the DDC adapter and CEC device
taken during probe on probe failure (e.g. probe deferral) and on driver
unbind.

Fixes: 8f83f26891e1 ("drm/mediatek: Add HDMI support")
Cc: stable@vger.kernel.org	# 4.8
Cc: Jie Qiu <jie.qiu@mediatek.com>
Signed-off-by: Johan Hovold <johan@kernel.org>
---
 drivers/gpu/drm/mediatek/mtk_hdmi.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/drivers/gpu/drm/mediatek/mtk_hdmi.c b/drivers/gpu/drm/mediatek/mtk_hdmi.c
index b766dd5e6c8d..306e2c907311 100644
--- a/drivers/gpu/drm/mediatek/mtk_hdmi.c
+++ b/drivers/gpu/drm/mediatek/mtk_hdmi.c
@@ -1345,6 +1345,13 @@ static const struct drm_bridge_funcs mtk_hdmi_bridge_funcs = {
 	.edid_read = mtk_hdmi_bridge_edid_read,
 };
 
+static void mtk_hdmi_put_device(void *_dev)
+{
+	struct device *dev = _dev;
+
+	put_device(dev);
+}
+
 static int mtk_hdmi_get_cec_dev(struct mtk_hdmi *hdmi, struct device *dev, struct device_node *np)
 {
 	struct platform_device *cec_pdev;
@@ -1369,6 +1376,10 @@ static int mtk_hdmi_get_cec_dev(struct mtk_hdmi *hdmi, struct device *dev, struc
 	}
 	of_node_put(cec_np);
 
+	ret = devm_add_action_or_reset(dev, mtk_hdmi_put_device, &cec_pdev->dev);
+	if (ret)
+		return ret;
+
 	/*
 	 * The mediatek,syscon-hdmi property contains a phandle link to the
 	 * MMSYS_CONFIG device and the register offset of the HDMI_SYS_CFG
@@ -1423,6 +1434,10 @@ static int mtk_hdmi_dt_parse_pdata(struct mtk_hdmi *hdmi,
 	if (!hdmi->ddc_adpt)
 		return dev_err_probe(dev, -EINVAL, "Failed to get ddc i2c adapter by node\n");
 
+	ret = devm_add_action_or_reset(dev, mtk_hdmi_put_device, &hdmi->ddc_adpt->dev);
+	if (ret)
+		return ret;
+
 	ret = mtk_hdmi_get_cec_dev(hdmi, dev, np);
 	if (ret)
 		return ret;
-- 
2.49.1


