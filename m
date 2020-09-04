Return-Path: <SRS0=heX2=CN=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 894D4C43461
	for <linux-mediatek@archiver.kernel.org>; Fri,  4 Sep 2020 11:01:00 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 50C9420770
	for <linux-mediatek@archiver.kernel.org>; Fri,  4 Sep 2020 11:01:00 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Hpz+91Gp";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mailerdienst.de header.i=@mailerdienst.de header.b="vCVCqRsE"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 50C9420770
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=fw-web.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Xh+rUkJ09jwJl/5Sc8PH22Xa9eDFbijG8TRAOGNVHGM=; b=Hpz+91GperMUel9s0gaEdaYGp
	eOf3LhM5+Us29PQo34oX0lsaDICzazRzoGSfWNyBvnhstSOgEvZodr9F2k6d48/Rg0cmur3NjzGgC
	8IuH4HlFAmCm+ilvtaYzoxWlWR2vOAs5gTAHv7iiAUZHsvsNxX/umaLseCLK/IuB3nO1SyYOWYWly
	b9HMqWfLZunVdb1b9AOt5SN6yAXLxmbZ6r1Xt3G9WCd4OPcQ5voyatO3x/x6qomuGB6Nzr580Iq4i
	S0eLhK/IHbTvr3/vIX7jcoCjEZ/8N1Kfs9RHXuQa3M9ZN1+NKyvMma6/x/XetlMBg7XQ7kZKccOA4
	GNzuWb77A==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kE9Sd-0008Q9-Rn; Fri, 04 Sep 2020 11:00:51 +0000
Received: from mxout2.routing.net ([2a03:2900:1:a::b])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kE9SS-0008Md-Ev; Fri, 04 Sep 2020 11:00:41 +0000
Received: from mxbox3.masterlogin.de (unknown [192.168.10.78])
 by mxout2.routing.net (Postfix) with ESMTP id BEB3A5FC6A;
 Fri,  4 Sep 2020 11:00:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailerdienst.de;
 s=20200217; t=1599217229;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JdElUpIkbQ13/jUvuSuFFzq8Cu6tg4R6UAkzid3KcG8=;
 b=vCVCqRsEwRtRMEqZXV09NTx/KmrnvClTwVoFAODo3XdxmnUYOB0gaMt58UbU4ETGMtRqMy
 nLANscbjr4+UdVsIeZ5v03w4OsYCeWqX6xnfJHlZ3TfkG3H8qhrBSpesYcyKYAdj2PPjl+
 y5yZnH0mW8b64PB6aHaZ1lToJ/Oy7n8=
Received: from localhost.localdomain (fttx-pool-217.61.147.193.bambit.de
 [217.61.147.193])
 by mxbox3.masterlogin.de (Postfix) with ESMTPSA id 0F39E3604C2;
 Fri,  4 Sep 2020 11:00:29 +0000 (UTC)
From: Frank Wunderlich <linux@fw-web.de>
To: linux-mediatek@lists.infradead.org,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>
Subject: [PATCH v6 1/4] drm/mediatek: disable tmds on mt2701
Date: Fri,  4 Sep 2020 12:59:59 +0200
Message-Id: <20200904110002.88966-2-linux@fw-web.de>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200904110002.88966-1-linux@fw-web.de>
References: <20200904110002.88966-1-linux@fw-web.de>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200904_070041_006778_D11264FC 
X-CRM114-Status: GOOD (  14.09  )
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
Cc: devicetree@vger.kernel.org, Ryder Lee <ryder.lee@mediatek.com>,
 Frank Wunderlich <frank-w@public-files.de>,
 chunhui dai <chunhui.dai@mediatek.com>, Sean Wang <sean.wang@mediatek.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Kishon Vijay Abraham I <kishon@ti.com>, Rob Herring <robh+dt@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Chunfeng Yun <chunfeng.yun@mediatek.com>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: chunhui dai <chunhui.dai@mediatek.com>

Without that patch if you use specific resolutions like 1280x1024,
I can see distortion in the output. It seems as if the
frequency for updating the pixel of the image is out of sync.

For initialization tmds needs to be active, but can be disabled after init
to fix blurry display

Signed-off-by: chunhui dai <chunhui.dai@mediatek.com>
Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
Tested-by: Frank Wunderlich <frank-w@public-files.de>
---
 drivers/phy/mediatek/phy-mtk-hdmi-mt2701.c | 1 +
 drivers/phy/mediatek/phy-mtk-hdmi.c        | 3 +++
 drivers/phy/mediatek/phy-mtk-hdmi.h        | 1 +
 3 files changed, 5 insertions(+)

diff --git a/drivers/phy/mediatek/phy-mtk-hdmi-mt2701.c b/drivers/phy/mediatek/phy-mtk-hdmi-mt2701.c
index a6cb1dea3d0c..b74c65a1762c 100644
--- a/drivers/phy/mediatek/phy-mtk-hdmi-mt2701.c
+++ b/drivers/phy/mediatek/phy-mtk-hdmi-mt2701.c
@@ -238,6 +238,7 @@ static void mtk_hdmi_phy_disable_tmds(struct mtk_hdmi_phy *hdmi_phy)
 
 struct mtk_hdmi_phy_conf mtk_hdmi_phy_2701_conf = {
 	.flags = CLK_SET_RATE_GATE,
+	.pll_default_off = true,
 	.hdmi_phy_clk_ops = &mtk_hdmi_phy_pll_ops,
 	.hdmi_phy_enable_tmds = mtk_hdmi_phy_enable_tmds,
 	.hdmi_phy_disable_tmds = mtk_hdmi_phy_disable_tmds,
diff --git a/drivers/phy/mediatek/phy-mtk-hdmi.c b/drivers/phy/mediatek/phy-mtk-hdmi.c
index 8fc83f01a720..47c029d4b270 100644
--- a/drivers/phy/mediatek/phy-mtk-hdmi.c
+++ b/drivers/phy/mediatek/phy-mtk-hdmi.c
@@ -184,6 +184,9 @@ static int mtk_hdmi_phy_probe(struct platform_device *pdev)
 		return PTR_ERR(phy_provider);
 	}
 
+	if (hdmi_phy->conf->pll_default_off)
+		hdmi_phy->conf->hdmi_phy_disable_tmds(hdmi_phy);
+
 	return of_clk_add_provider(dev->of_node, of_clk_src_simple_get,
 				   hdmi_phy->pll);
 }
diff --git a/drivers/phy/mediatek/phy-mtk-hdmi.h b/drivers/phy/mediatek/phy-mtk-hdmi.h
index b13e1d5f8e78..dcf9bb13699b 100644
--- a/drivers/phy/mediatek/phy-mtk-hdmi.h
+++ b/drivers/phy/mediatek/phy-mtk-hdmi.h
@@ -21,6 +21,7 @@ struct mtk_hdmi_phy;
 
 struct mtk_hdmi_phy_conf {
 	unsigned long flags;
+	bool pll_default_off;
 	const struct clk_ops *hdmi_phy_clk_ops;
 	void (*hdmi_phy_enable_tmds)(struct mtk_hdmi_phy *hdmi_phy);
 	void (*hdmi_phy_disable_tmds)(struct mtk_hdmi_phy *hdmi_phy);
-- 
2.25.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
