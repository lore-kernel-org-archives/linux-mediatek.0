Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C32ACECAAD2
	for <linux-mediatek@archiver.kernel.org>; Thu,  1 Sep 2022 05:13:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KUl585Ew6V3M6jylysyr0wYhICqdfWGeJ4BWd0htx6k=; b=vU98CunNGcf9PRlJshmzatBnxk
	PZF/WPom5PtYhi+q/VM/JoY0mDmJmnPtrVSuI/g8PYg0bmOKkiz/V+ExyR5Ao9KNvWwBH1daB/fRu
	XdymKDnKq5qzhczKmhG/CbXPhb0550bdIoehxDmFJNjsjJscBPYMfuzYwpiqimInzrENV+NEp21Hw
	DgIYC3mZD6Q7s4ISkSeGuX9ehAs9XgQGXVRLFFfDBJKemLYH9zdgVsg+2BwSQYqVCQ9fjeHCTT2Zg
	WlE3v3Al2jAZ89QGlfN8d+ZROyEcYVTj183R36GudsdGlnybiTkDpooYf1DmaMMHfh50URZ0CpHbN
	vn+RUrWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oTcWO-009kyQ-Nz; Thu, 01 Sep 2022 05:13:44 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oTcWM-009kwt-Hq; Thu, 01 Sep 2022 05:13:44 +0000
X-UUID: 66c2e9f7d05242e881242314d2eff294-20220831
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=KUl585Ew6V3M6jylysyr0wYhICqdfWGeJ4BWd0htx6k=;
	b=GI9zVnWRu1HCAxa8AHBgK2zSf6qWerF4WzToep8rSRLWkBpNg9P1mbMlE37egQh3N7f5pUT4miX7/Tlh/PpAwIlKg0Z5PbiW+gcOrmEivk2LoROkIrCHcIkJTy5V6gqCFxm533FTBrjAy65FdE2o/tRr7GCVm+45QLHNnsK2WVw=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.10,REQID:35a08f49-22b8-46e7-9870-6b5b70c2ad4b,OB:0,L
	OB:0,IP:0,URL:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Releas
	e_Ham,ACTION:release,TS:-25
X-CID-META: VersionHash:84eae18,CLOUDID:b1fbc520-1c20-48a5-82a0-25f9c331906d,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:11|1,File:
	nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: 66c2e9f7d05242e881242314d2eff294-20220831
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <rex-bc.chen@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 179585291; Wed, 31 Aug 2022 22:13:31 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.186) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Thu, 1 Sep 2022 12:41:53 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Thu, 1 Sep 2022 12:41:53 +0800
From: Bo-Chen Chen <rex-bc.chen@mediatek.com>
To: <chunkuang.hu@kernel.org>, <p.zabel@pengutronix.de>, <daniel@ffwll.ch>,
	<robh+dt@kernel.org>, <krzysztof.kozlowski+dt@linaro.org>,
	<mripard@kernel.org>, <tzimmermann@suse.de>, <matthias.bgg@gmail.com>,
	<deller@gmx.de>, <airlied@linux.ie>
CC: <msp@baylibre.com>, <granquet@baylibre.com>, <jitao.shi@mediatek.com>,
	<wenst@chromium.org>, <angelogioacchino.delregno@collabora.com>,
	<ck.hu@mediatek.com>, <liangxu.xu@mediatek.com>,
	<dri-devel@lists.freedesktop.org>, <linux-mediatek@lists.infradead.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-fbdev@vger.kernel.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>, Bo-Chen Chen
	<rex-bc.chen@mediatek.com>
Subject: [PATCH v17 09/10] drm/mediatek: dp: Add hpd debounce
Date: Thu, 1 Sep 2022 12:41:48 +0800
Message-ID: <20220901044149.16782-10-rex-bc.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20220901044149.16782-1-rex-bc.chen@mediatek.com>
References: <20220901044149.16782-1-rex-bc.chen@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220831_221342_602492_5C5F4085 
X-CRM114-Status: GOOD (  19.63  )
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

From: Jitao Shi <jitao.shi@mediatek.com>

From the DP spec 1.4a chapter 3.3, upstream devices should implement
HPD signal de-bouncing on an external connection.
A period of 100ms should be used to detect an HPD connect event.
To cover these cases, HPD de-bounce should be implemented only after
HPD low has been detected for at least 100ms.

Therefore,
1. If HPD is low (which means plugging out) for longer than 100ms:
   we need to do de-bouncing (which means we need to wait for 100ms).
2. If HPD low is for less than 100ms:
   we don't need to care about the de-bouncing.

In this patch, we start a 100ms timer and use a need_debounce boolean
to implement the feature.

Two cases when HPD is high:
1. If the timer is expired (>100ms):
   - need_debounce is true.
   - When HPD high (plugging event comes), need_debounce will be true
     and then we need to do de-bouncing (wait for 100ms).
2. If the timer is not expired (<100ms):
   - need_debounce is false.
   - When HPD high (plugging event comes), need_debounce will be false
     and no need to do de-bouncing.

HPD_______             __________________
          |            |<-  100ms   ->
          |____________|
          <-  100ms   ->

Without HPD de-bouncing, USB-C to HDMI Adapaters will not be detected.

The change has been successfully tested with the following devices:
- Dell Adapter - USB-C to HDMI
- Acer 1in1 HDMI dongle
- Ugreen 1in1 HDMI dongle
- innowatt HDMI + USB3 hub
- Acer 2in1 HDMI dongle
- Apple 3in1 HDMI dongle (A2119)
- J5Create 3in1 HDMI dongle (JAC379)

Tested-by: Rex-BC Chen <rex-bc.chen@mediatek.com>
Reviewed-by: Rex-BC Chen <rex-bc.chen@mediatek.com>
Signed-off-by: Jitao Shi <jitao.shi@mediatek.com>
Signed-off-by: Guillaume Ranquet <granquet@baylibre.com>
Signed-off-by: Bo-Chen Chen <rex-bc.chen@mediatek.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/gpu/drm/mediatek/mtk_dp.c | 25 ++++++++++++++++++++++++-
 1 file changed, 24 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_dp.c b/drivers/gpu/drm/mediatek/mtk_dp.c
index 11a94927c0d0..dd34dae417e5 100644
--- a/drivers/gpu/drm/mediatek/mtk_dp.c
+++ b/drivers/gpu/drm/mediatek/mtk_dp.c
@@ -87,6 +87,7 @@ struct mtk_dp_efuse_fmt {
 
 struct mtk_dp {
 	bool enabled;
+	bool need_debounce;
 	u8 max_lanes;
 	u8 max_linkrate;
 	u8 rx_cap[DP_RECEIVER_CAP_SIZE];
@@ -109,6 +110,7 @@ struct mtk_dp {
 	struct platform_device *phy_dev;
 	struct phy *phy;
 	struct regmap *regs;
+	struct timer_list debounce_timer;
 };
 
 struct mtk_dp_data {
@@ -1475,14 +1477,24 @@ static irqreturn_t mtk_dp_hpd_event_thread(int hpd, void *dev)
 	unsigned long flags;
 	u32 status;
 
+	if (mtk_dp->need_debounce && mtk_dp->train_info.cable_plugged_in)
+		msleep(100);
+
 	spin_lock_irqsave(&mtk_dp->irq_thread_lock, flags);
 	status = mtk_dp->irq_thread_handle;
 	mtk_dp->irq_thread_handle = 0;
 	spin_unlock_irqrestore(&mtk_dp->irq_thread_lock, flags);
 
-	if (status & MTK_DP_THREAD_CABLE_STATE_CHG)
+	if (status & MTK_DP_THREAD_CABLE_STATE_CHG) {
 		drm_helper_hpd_irq_event(mtk_dp->bridge.dev);
 
+		if (!mtk_dp->train_info.cable_plugged_in) {
+			mtk_dp->need_debounce = false;
+			mod_timer(&mtk_dp->debounce_timer,
+				  jiffies + msecs_to_jiffies(100) - 1);
+		}
+	}
+
 	if (status & MTK_DP_THREAD_HPD_EVENT)
 		dev_dbg(mtk_dp->dev, "Receive IRQ from sink devices\n");
 
@@ -1996,6 +2008,13 @@ static const struct drm_bridge_funcs mtk_dp_bridge_funcs = {
 	.detect = mtk_dp_bdg_detect,
 };
 
+static void mtk_dp_debounce_timer(struct timer_list *t)
+{
+	struct mtk_dp *mtk_dp = from_timer(mtk_dp, t, debounce_timer);
+
+	mtk_dp->need_debounce = true;
+}
+
 static int mtk_dp_probe(struct platform_device *pdev)
 {
 	struct mtk_dp *mtk_dp;
@@ -2069,6 +2088,9 @@ static int mtk_dp_probe(struct platform_device *pdev)
 
 	drm_bridge_add(&mtk_dp->bridge);
 
+	mtk_dp->need_debounce = true;
+	timer_setup(&mtk_dp->debounce_timer, mtk_dp_debounce_timer, 0);
+
 	pm_runtime_enable(dev);
 	pm_runtime_get_sync(dev);
 
@@ -2081,6 +2103,7 @@ static int mtk_dp_remove(struct platform_device *pdev)
 
 	pm_runtime_put(&pdev->dev);
 	pm_runtime_disable(&pdev->dev);
+	del_timer_sync(&mtk_dp->debounce_timer);
 	drm_bridge_remove(&mtk_dp->bridge);
 	platform_device_unregister(mtk_dp->phy_dev);
 
-- 
2.18.0


