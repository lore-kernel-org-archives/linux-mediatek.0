Return-Path: <SRS0=9HTA=M7=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9B195C4338F
	for <linux-mediatek@archiver.kernel.org>; Sun,  8 Aug 2021 13:02:52 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3254960F39
	for <linux-mediatek@archiver.kernel.org>; Sun,  8 Aug 2021 13:02:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 3254960F39
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6ge1kNcXh6wEYXcl3jlS180HRr57ITTgHV2nbv8GmhA=; b=dl8FyrOpOVrnT+
	s75pQ3oI1ZNiq5fpi1a1QeAv1Sg7ejWbeJ1LTOouQ04abJCwfPEMz45g+aRWgff0g3M2/kbqSaK05
	Ky6D4lUN3po/bU1oQ+Qp21IC4a7q+6kIiTuyFK9fNTv7SKT+HNttdyAW60t+CYhTbQEEwdBaTJZWu
	8taLN0Yo5IPJ3YcPCEmBMCRg9Hq/uz3lPQuRpsZcDqS7bcXPlO+1zjtUOkmb4yZmb5Q6Q3EKAmkfy
	P1M2saiZ9CyVESBOm2QZHkRBFLfkN4K7lmA2Fd7Cff0QLMo9geEGTLj6q/kzbh1/ZHemKAy8N7zjw
	GDjMBhNb/bWrfDTg/8hw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mCiRn-00FrX3-Nh; Sun, 08 Aug 2021 13:02:35 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mCiRj-00FrVQ-27
 for linux-mediatek@lists.infradead.org; Sun, 08 Aug 2021 13:02:33 +0000
X-UUID: adb624c85cd54f418fe94384029fc50f-20210808
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=JLQ+zb7/tEJb5TAPLTu2fShkGO7kQEonorKyASSHm3g=; 
 b=EXD5ulbQjUfwOLkc1SBi76I7FtdwU/0MEL6Q+qiMdrRuBPtZmlUodW8501ca+HwgiXZPQFu4yQREJT7oVhsesScsVO8K57BZGySsemNNU40xKIx9x1lb3v6biRKLGZe67/yV21wXjWup9T5Njm+E+rRxY6w2kEo2wQFN3jDGo0U=;
X-UUID: adb624c85cd54f418fe94384029fc50f-20210808
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <jitao.shi@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 936670547; Sun, 08 Aug 2021 06:02:28 -0700
Received: from MTKMBS33N2.mediatek.inc (172.27.4.76) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sun, 8 Aug 2021 05:52:27 -0700
Received: from MTKCAS36.mediatek.inc (172.27.4.186) by MTKMBS33N2.mediatek.inc
 (172.27.4.76) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Sun, 8 Aug 2021 20:52:23 +0800
Received: from mszsdclx1018.gcn.mediatek.inc (10.16.6.18) by
 MTKCAS36.mediatek.inc (172.27.4.170) with Microsoft SMTP Server id
 15.0.1497.2 via Frontend Transport; Sun, 8 Aug 2021 20:52:22 +0800
From: Jitao Shi <jitao.shi@mediatek.com>
To: Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg
 <sam@ravnborg.org>, David Airlie <airlied@linux.ie>, Daniel Vetter
 <daniel@ffwll.ch>, Matthias Brugger <matthias.bgg@gmail.com>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>
CC: <linux-mediatek@lists.infradead.org>, <srv_heupstream@mediatek.com>,
 <yingjoe.chen@mediatek.com>, <eddie.huang@mediatek.com>,
 <cawa.cheng@mediatek.com>, <bibby.hsieh@mediatek.com>, <ck.hu@mediatek.com>,
 <stonea168@163.com>, Jitao Shi <jitao.shi@mediatek.com>
Subject: [PATCH v2 3/3] drm/mediatek: fine tune the dsi panel's power sequence
Date: Sun, 8 Aug 2021 20:52:18 +0800
Message-ID: <20210808125218.63029-4-jitao.shi@mediatek.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210808125218.63029-1-jitao.shi@mediatek.com>
References: <20210808125218.63029-1-jitao.shi@mediatek.com>
MIME-Version: 1.0
X-TM-SNTS-SMTP: C5AFE532C3BD71E978C6991D5609392D6891061BFE6B852291D72323DF9655412000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210808_060231_156465_9C85E945 
X-CRM114-Status: GOOD (  16.29  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Add the drm_panel_prepare_power and drm_panel_unprepare_power control.
Turn on panel power(drm_panel_prepare_power) and control before dsi
enable. And then dsi enable, send dcs cmd in drm_panel_prepare, last
turn on backlight.

Most dsi panels, have five steps when poweron.

1. turn on dsi signal to LP11   --> dsi host's action
2. turn on the power supplies,  --> panel's action
3. send the DCS  cmd to panel   --> panel's action
4. start send video stream      --> dsi host's action
5. turn on backlight.           --> panel's action

we put "turn on the power supplies" and "send the DCS  cmd to panel" in
panel_prepare. And "turn on backlight" in panel_enable.

But some other panels has a special poweron sequence as the following.

1. turn on the power supplies,  --> panel's action
2. turn on dsi signal to LP11   --> dsi host's action
3. send the DCS  cmd to panel   --> panel's action
4. start send video stream      --> dsi host's action
5. turn on backlight.           --> panel's action

panel's actions are divided into three parts.

So I add a new api "drm_panel_prepare_power/rm_panel_unprepare_power" to
control the sequence.

Signed-off-by: Jitao Shi <jitao.shi@mediatek.com>
---
 drivers/gpu/drm/mediatek/mtk_dsi.c | 29 ++++++++++++++++++++++++-----
 1 file changed, 24 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_dsi.c b/drivers/gpu/drm/mediatek/mtk_dsi.c
index ae403c67cbd9..24f89a1dd421 100644
--- a/drivers/gpu/drm/mediatek/mtk_dsi.c
+++ b/drivers/gpu/drm/mediatek/mtk_dsi.c
@@ -184,6 +184,7 @@ struct mtk_dsi {
 	struct drm_encoder encoder;
 	struct drm_bridge bridge;
 	struct drm_bridge *next_bridge;
+	struct drm_panel *panel;
 	struct drm_connector *connector;
 	struct phy *phy;
 
@@ -619,10 +620,18 @@ static int mtk_dsi_poweron(struct mtk_dsi *dsi)
 	dsi->data_rate = DIV_ROUND_UP_ULL(dsi->vm.pixelclock * bit_per_pixel,
 					  dsi->lanes);
 
+	if (dsi->panel) {
+		ret = panel_bridge_prepare_power(dsi->next_bridge)
+		if (ret) {
+			DRM_INFO("can't prepare power the panel\n");
+			goto err_refcount;
+		}
+	}
+
 	ret = clk_set_rate(dsi->hs_clk, dsi->data_rate);
 	if (ret < 0) {
 		dev_err(dev, "Failed to set data rate: %d\n", ret);
-		goto err_refcount;
+		goto err_prepare_power;
 	}
 
 	phy_power_on(dsi->phy);
@@ -665,6 +674,11 @@ static int mtk_dsi_poweron(struct mtk_dsi *dsi)
 	clk_disable_unprepare(dsi->engine_clk);
 err_phy_power_off:
 	phy_power_off(dsi->phy);
+err_prepare_power:
+	if (dsi->panel) {
+		if (panel_bridge_unprepare_power(dsi->next_bridge))
+			dev_err(dev, "Can't unprepare power the panel\n");
+	}
 err_refcount:
 	dsi->refcount--;
 	return ret;
@@ -698,6 +712,12 @@ static void mtk_dsi_poweroff(struct mtk_dsi *dsi)
 	clk_disable_unprepare(dsi->digital_clk);
 
 	phy_power_off(dsi->phy);
+
+	if (dsi->panel) {
+		ret = panel_bridge_unprepare_power(dsi->next_bridge);
+		if (ret)
+			dev_err(dev, "Can't unprepare power the panel ret:%d\n", ret);
+	}
 }
 
 static void mtk_output_dsi_enable(struct mtk_dsi *dsi)
@@ -1001,7 +1021,6 @@ static int mtk_dsi_probe(struct platform_device *pdev)
 {
 	struct mtk_dsi *dsi;
 	struct device *dev = &pdev->dev;
-	struct drm_panel *panel;
 	struct resource *regs;
 	int irq_num;
 	int ret;
@@ -1019,12 +1038,12 @@ static int mtk_dsi_probe(struct platform_device *pdev)
 	}
 
 	ret = drm_of_find_panel_or_bridge(dev->of_node, 0, 0,
-					  &panel, &dsi->next_bridge);
+					  &dsi->panel, &dsi->next_bridge);
 	if (ret)
 		goto err_unregister_host;
 
-	if (panel) {
-		dsi->next_bridge = devm_drm_panel_bridge_add(dev, panel);
+	if (dsi->panel) {
+		dsi->next_bridge = devm_drm_panel_bridge_add(dev, dsi->panel);
 		if (IS_ERR(dsi->next_bridge)) {
 			ret = PTR_ERR(dsi->next_bridge);
 			goto err_unregister_host;
-- 
2.25.1
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
