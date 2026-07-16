Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCE98C4450A
	for <linux-mediatek@archiver.kernel.org>; Thu, 16 Jul 2026 13:21:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=5+PTVvtbxISQHBh7RDfP9RhXJiuh9DQQG1Am4RdSHNo=; b=J5Zukl0u86XiOzJeXmBpqScXpN
	yyG3ynwfjxYLNuKGLZIG8/nCx7CH4MdQ7yck6f4Idi73OjntLwaSa3o5hfve6KowwrV1OQ1jbtp29
	rk5n6OWAkDYSfi1YEqm4tQFyUshoa9Jc6nAFvleQP7bSGAWiT2yI7NnMx8QamjGTnVBr91AfloJQ0
	UtRA8ROdIDbDb+oGAQ0cJZUNDZG4P+tCGZEaQigCCUYFUB8FTcm6B1cOfCvAKc+Mz30pY8kVKWQt/
	QMLTjagkDv80CWvQPJ8n5cQh5tEQehvGdYyT3AxbB/gZE/je6w/EdWA19ryrUMzFLND8IbI+/CqPH
	JNRNcTbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkM1c-0000000HNEV-1QKW;
	Thu, 16 Jul 2026 13:21:16 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkM1a-0000000HNEK-3Vrn
	for linux-mediatek@lists.infradead.org;
	Thu, 16 Jul 2026 13:21:14 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id DF435600AF;
	Thu, 16 Jul 2026 13:21:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 94B151F00A3A;
	Thu, 16 Jul 2026 13:21:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784208073;
	bh=5+PTVvtbxISQHBh7RDfP9RhXJiuh9DQQG1Am4RdSHNo=;
	h=From:To:Cc:Subject:Date;
	b=VWzDH6HKO66dhqFPwZt4Mw2z+IwI9naF9ychftoED8XY5nqveyqmvIIE1OxYfYjiC
	 zIveTkz/zovHhdcc/Ze9mz6hxbhVM6jcHPyYzU/9YkdfciE+1KS63V9mJX1qkrIrFr
	 g/bMeNYFs62QI2x9erMnZ6toFGpV418L/v3umUf4ngDuelbgYVeP1R7hzGZv+IP3IH
	 3AF+ReY6nlu3H2KM3bm/WSVBWpQ5/vRCahO4KgcXtdL/bFWNzMkZSQQ7D7/n0u5oc3
	 v5FHeD/PhQWpi9YWNel+OP3lyV3q2qvqrF5y9PTdOQR/d+A8XtY29Rw7pXTVACUx0D
	 1u3Vt0daJz5pg==
Received: from johan by xi.lan with local (Exim 4.99.4)
	(envelope-from <johan@kernel.org>)
	id 1wkM1X-00000006Z8A-22kw;
	Thu, 16 Jul 2026 15:21:11 +0200
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
	Johan Hovold <johan@kernel.org>
Subject: [PATCH] drm/mediatek: mtk_hdmi_common: take i2c adapter module reference
Date: Thu, 16 Jul 2026 15:21:03 +0200
Message-ID: <20260716132103.1564995-1-johan@kernel.org>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

The i2c subsystem currently blocks during adapter deregistration
whenever there are consumers holding a reference.

Switch to using of_get_i2c_adapter_by_node() which also takes a
reference to the adapter module so that an attempt to unload the module
while in use fails gracefully instead of blocking uninterruptibly.

Signed-off-by: Johan Hovold <johan@kernel.org>
---
 drivers/gpu/drm/mediatek/mtk_hdmi_common.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_hdmi_common.c b/drivers/gpu/drm/mediatek/mtk_hdmi_common.c
index a049489daa2d..042b98e5a519 100644
--- a/drivers/gpu/drm/mediatek/mtk_hdmi_common.c
+++ b/drivers/gpu/drm/mediatek/mtk_hdmi_common.c
@@ -290,6 +290,13 @@ static int mtk_hdmi_get_cec_dev(struct mtk_hdmi *hdmi, struct device *dev, struc
 	return 0;
 }
 
+static void mtk_hdmi_put_adapter(void *_adap)
+{
+	struct i2c_adapter *adap = _adap;
+
+	i2c_put_adapter(adap);
+}
+
 static int mtk_hdmi_dt_parse_pdata(struct mtk_hdmi *hdmi, struct platform_device *pdev,
 				   const char * const *clk_names, size_t num_clocks)
 {
@@ -328,12 +335,12 @@ static int mtk_hdmi_dt_parse_pdata(struct mtk_hdmi *hdmi, struct platform_device
 	if (!i2c_np)
 		return dev_err_probe(dev, -EINVAL, "No ddc-i2c-bus in connector\n");
 
-	hdmi->ddc_adpt = of_find_i2c_adapter_by_node(i2c_np);
+	hdmi->ddc_adpt = of_get_i2c_adapter_by_node(i2c_np);
 	of_node_put(i2c_np);
 	if (!hdmi->ddc_adpt)
 		return dev_err_probe(dev, -EPROBE_DEFER, "Failed to get ddc i2c adapter by node\n");
 
-	ret = devm_add_action_or_reset(dev, mtk_hdmi_put_device, &hdmi->ddc_adpt->dev);
+	ret = devm_add_action_or_reset(dev, mtk_hdmi_put_adapter, hdmi->ddc_adpt);
 	if (ret)
 		return ret;
 
-- 
2.54.0


