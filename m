Return-Path: <SRS0=Fjxk=5P=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17BA3C2D0E5
	for <linux-mediatek@archiver.kernel.org>; Mon, 30 Mar 2020 14:12:43 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D273F20780
	for <linux-mediatek@archiver.kernel.org>; Mon, 30 Mar 2020 14:12:42 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="W2ybTegu";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="atvZ6Rtt"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D273F20780
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=GOADgV5wUaYRQaJoAbejfSLaCIIRMl8UWnzut7Q3Cew=; b=W2ybTegu0w6vS1B2hdxG2KvlWJ
	QdKM7oNmoKS4GiYkyrWorylFQA/B6hAT3srf+GQHpiOvc4M3jfyC66OyhXbgE6BU1SerhoHN8EwwS
	wsDpxtYct+2c/kmEvLRgfpK4J/MMYz7E13hPkihPxt7dN25vnOuPNHIXwosJm+9lPhUjaZ5wsfo5E
	K1/I1FsYzWOJf5KMjCCyp1AGyr2WvE05tjvgI4tYR61h4xknuZAPxaoXIDG9zxwPl8Gz4aJmE3Yrt
	1E1ins/pOXGOwDfwQJhTTdb5fohIaqudwJOILEpB/CDZqtQeE3I5m1X3ZKIQGShbSPYrKowaMD3j/
	gqm3v4aA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jIv9X-0006Wt-32; Mon, 30 Mar 2020 14:12:35 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jIv9T-0006V1-TV
 for linux-mediatek@lists.infradead.org; Mon, 30 Mar 2020 14:12:33 +0000
Received: from DESKTOP-GFFITBK.localdomain (218-161-90-76.HINET-IP.hinet.net
 [218.161.90.76])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 7D37C20786;
 Mon, 30 Mar 2020 14:12:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1585577551;
 bh=Z34pspBhqMJqahd4MffOLhAEomB14DsGzR3OqdRcvaU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=atvZ6Rtt/bMPqgEsYtpAPfg88D4jpRYXX/SuBml3WGT3My+5iq7RkSUilWkgkD8ck
 PiLeYfw+0m4ykvga4NEuNwTJdRR2aRkQpdk9U0rjHu2WTefNXeA3V4Ppm3GNAx3cxR
 fZ0p4yG6g/NvauzQRW0XhvdyTcrBoCvy4VeqBLv0=
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
To: Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Matthias Brugger <matthias.bgg@gmail.com>,
 Chunfeng Yun <chunfeng.yun@mediatek.com>,
 Kishon Vijay Abraham I <kishon@ti.com>
Subject: [PATCH v2 1/4] drm/mediatek: Move tz_disabled from mtk_hdmi_phy to
 mtk_hdmi driver
Date: Mon, 30 Mar 2020 22:12:19 +0800
Message-Id: <20200330141222.17529-2-chunkuang.hu@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200330141222.17529-1-chunkuang.hu@kernel.org>
References: <20200330141222.17529-1-chunkuang.hu@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200330_071231_987343_57D69D8B 
X-CRM114-Status: GOOD (  15.55  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: CK Hu <ck.hu@mediatek.com>, Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: CK Hu <ck.hu@mediatek.com>

tz_disabled is used to control mtk_hdmi output signal, but this variable
is stored in mtk_hdmi_phy and mtk_hdmi_phy does not use it. So move
tz_disabled to mtk_hdmi where it's used.

Signed-off-by: CK Hu <ck.hu@mediatek.com>
Signed-off-by: Chun-Kuang Hu <chunkuang.hu@kernel.org>
---
 drivers/gpu/drm/mediatek/mtk_hdmi.c           | 22 ++++++++++++++++---
 drivers/gpu/drm/mediatek/mtk_hdmi_phy.h       |  1 -
 .../gpu/drm/mediatek/mtk_mt2701_hdmi_phy.c    |  1 -
 3 files changed, 19 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_hdmi.c b/drivers/gpu/drm/mediatek/mtk_hdmi.c
index 5e4a4dbda443..878433c09c9b 100644
--- a/drivers/gpu/drm/mediatek/mtk_hdmi.c
+++ b/drivers/gpu/drm/mediatek/mtk_hdmi.c
@@ -144,11 +144,16 @@ struct hdmi_audio_param {
 	struct hdmi_codec_params codec_params;
 };
 
+struct mtk_hdmi_conf {
+	bool tz_disabled;
+};
+
 struct mtk_hdmi {
 	struct drm_bridge bridge;
 	struct drm_bridge *next_bridge;
 	struct drm_connector conn;
 	struct device *dev;
+	const struct mtk_hdmi_conf *conf;
 	struct phy *phy;
 	struct device *cec_dev;
 	struct i2c_adapter *ddc_adpt;
@@ -230,7 +235,6 @@ static void mtk_hdmi_hw_vid_black(struct mtk_hdmi *hdmi, bool black)
 static void mtk_hdmi_hw_make_reg_writable(struct mtk_hdmi *hdmi, bool enable)
 {
 	struct arm_smccc_res res;
-	struct mtk_hdmi_phy *hdmi_phy = phy_get_drvdata(hdmi->phy);
 
 	/*
 	 * MT8173 HDMI hardware has an output control bit to enable/disable HDMI
@@ -238,7 +242,7 @@ static void mtk_hdmi_hw_make_reg_writable(struct mtk_hdmi *hdmi, bool enable)
 	 * The ARM trusted firmware provides an API for the HDMI driver to set
 	 * this control bit to enable HDMI output in supervisor mode.
 	 */
-	if (hdmi_phy->conf && hdmi_phy->conf->tz_disabled)
+	if (hdmi->conf->tz_disabled)
 		regmap_update_bits(hdmi->sys_regmap,
 				   hdmi->sys_offset + HDMI_SYS_CFG20,
 				   0x80008005, enable ? 0x80000005 : 0x8000);
@@ -1688,6 +1692,7 @@ static int mtk_drm_hdmi_probe(struct platform_device *pdev)
 		return -ENOMEM;
 
 	hdmi->dev = dev;
+	hdmi->conf = of_device_get_match_data(dev);
 
 	ret = mtk_hdmi_dt_parse_pdata(hdmi, pdev);
 	if (ret)
@@ -1765,8 +1770,19 @@ static int mtk_hdmi_resume(struct device *dev)
 static SIMPLE_DEV_PM_OPS(mtk_hdmi_pm_ops,
 			 mtk_hdmi_suspend, mtk_hdmi_resume);
 
+static const struct mtk_hdmi_conf mtk_hdmi_conf_mt2701 = {
+	.tz_disabled = true,
+};
+
+static const struct mtk_hdmi_conf mtk_hdmi_conf_mt8173;
+
 static const struct of_device_id mtk_drm_hdmi_of_ids[] = {
-	{ .compatible = "mediatek,mt8173-hdmi", },
+	{ .compatible = "mediatek,mt2701-hdmi",
+	  .data = &mtk_hdmi_conf_mt2701,
+	},
+	{ .compatible = "mediatek,mt8173-hdmi",
+	  .data = &mtk_hdmi_conf_mt8173,
+	},
 	{}
 };
 
diff --git a/drivers/gpu/drm/mediatek/mtk_hdmi_phy.h b/drivers/gpu/drm/mediatek/mtk_hdmi_phy.h
index 2d8b3182470d..fc1c2efd1128 100644
--- a/drivers/gpu/drm/mediatek/mtk_hdmi_phy.h
+++ b/drivers/gpu/drm/mediatek/mtk_hdmi_phy.h
@@ -20,7 +20,6 @@
 struct mtk_hdmi_phy;
 
 struct mtk_hdmi_phy_conf {
-	bool tz_disabled;
 	unsigned long flags;
 	const struct clk_ops *hdmi_phy_clk_ops;
 	void (*hdmi_phy_enable_tmds)(struct mtk_hdmi_phy *hdmi_phy);
diff --git a/drivers/gpu/drm/mediatek/mtk_mt2701_hdmi_phy.c b/drivers/gpu/drm/mediatek/mtk_mt2701_hdmi_phy.c
index d3cc4022e988..99fe05cd3598 100644
--- a/drivers/gpu/drm/mediatek/mtk_mt2701_hdmi_phy.c
+++ b/drivers/gpu/drm/mediatek/mtk_mt2701_hdmi_phy.c
@@ -237,7 +237,6 @@ static void mtk_hdmi_phy_disable_tmds(struct mtk_hdmi_phy *hdmi_phy)
 }
 
 struct mtk_hdmi_phy_conf mtk_hdmi_phy_2701_conf = {
-	.tz_disabled = true,
 	.flags = CLK_SET_RATE_GATE,
 	.hdmi_phy_clk_ops = &mtk_hdmi_phy_pll_ops,
 	.hdmi_phy_enable_tmds = mtk_hdmi_phy_enable_tmds,
-- 
2.17.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
