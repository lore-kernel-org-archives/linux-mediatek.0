Return-Path: <SRS0=wye3=JR=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 83CFAC43461
	for <linux-mediatek@archiver.kernel.org>; Tue, 20 Apr 2021 13:26:59 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D370B61003
	for <linux-mediatek@archiver.kernel.org>; Tue, 20 Apr 2021 13:26:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D370B61003
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=7uJ0LukAv4R3/6jUVPtjWfiaw9ZQKCAIU0A3Mq+C/KA=; b=H4N5NC7mihVIOsBBEI628InTLd
	HcCMRGbPMXSIMkuwHE31QGLNcn1DdKteJi03xAuvLSnMzTNWdG61WCkx9T4GwHDyNjkD+JWq/pzgV
	g8C/vBuZKDekUu+w+9Ne1Icd1D4M+tnTJwPryrp8s5hP2WfRiqbhurYsdC+BGF0eixnm2mBG6Sk97
	vBRnwshedj/OsnJITv8Oerzcc18jJpFE9RqhkInkfocuBGfDg/Cc0NtFeWVE+DmaVLIrHSkSVYXf0
	k2m2OTY18TrUVpsGOSStO3aZ06upES/nqKwLkpHUK48vS53KwGz/RnBZsEwAS4bUe5V9U9b6QQRLE
	5qxDKE5w==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lYqOn-00CCu0-UM; Tue, 20 Apr 2021 13:26:41 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lYqOl-00CCtb-3L; Tue, 20 Apr 2021 13:26:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:
 Content-ID:Content-Description:In-Reply-To:References;
 bh=QRFvcRSzDacuRP/Rwmj28XFP20juDpAYqgUzkpxAhQw=; b=yBqjXplvAD9f6xgKy6WAs2skxv
 bg7tWaouuhjuw7b1JQr9gcGpqCt6tcw6aNMQxAZqV5uZz4VSD4j45Icy9ZwuUhJ7VywR9NWQcYaEb
 9Q2eY9dNs/azSkGM2/Rle7LwGjNreJ3dmlNZfpVH88By7ut8b85h3WKGsP20oKoYlg50fYQnzO4Xv
 S+nm/ntBPl/4gltDKOIWzXpisM9vfNYus+XCx7ivx8FE4hdTdP4coBTfFxNUeWvMuVB4oS72tyvr9
 Nv9xzgTl0aFnGHP2GbVhiVebbgH/i9hpP+vpRw+w0VwPrPZxLtU6tGsrNevsWhQwdGcwi99t5WuBV
 niLhh2Mw==;
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lYqOf-00C8yF-2M; Tue, 20 Apr 2021 13:26:37 +0000
X-UUID: 8126ea37d81342a2ac067120fb685b33-20210420
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=QRFvcRSzDacuRP/Rwmj28XFP20juDpAYqgUzkpxAhQw=; 
 b=bVPoYDlJnu4V6bKP6mbt71gvkbw9VveTWYMGoBFZHtYGWdWc55etAOqNdyujddf+9RvEZ8fUvIV1nr+v/36HMFZCOYDH0ZoaP/CRx+KbwoX9uFIc9RBzU+c/QzyZLSUKo4lQ6TW9pa8Ds8Jm0nsKEYRXlBg3Aba8RpoWYNWDNy0=;
X-UUID: 8126ea37d81342a2ac067120fb685b33-20210420
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <jitao.shi@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 35869287; Tue, 20 Apr 2021 06:26:30 -0700
Received: from MTKMBS33N2.mediatek.inc (172.27.4.76) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 20 Apr 2021 06:26:28 -0700
Received: from MTKCAS36.mediatek.inc (172.27.4.186) by MTKMBS33N2.mediatek.inc
 (172.27.4.76) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Tue, 20 Apr 2021 21:26:17 +0800
Received: from mszsdclx1018.gcn.mediatek.inc (10.16.6.18) by
 MTKCAS36.mediatek.inc (172.27.4.170) with Microsoft SMTP Server id
 15.0.1497.2 via Frontend Transport; Tue, 20 Apr 2021 21:26:16 +0800
From: Jitao Shi <jitao.shi@mediatek.com>
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@linux.ie>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>
CC: <linux-mediatek@lists.infradead.org>, <devicetree@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <srv_heupstream@mediatek.com>,
 <yingjoe.chen@mediatek.com>, <eddie.huang@mediatek.com>,
 <cawa.cheng@mediatek.com>, <bibby.hsieh@mediatek.com>, <ck.hu@mediatek.com>,
 <stonea168@163.com>, <huijuan.xie@mediatek.com>, <rex-bc.chen@mediatek.com>,
 Jitao Shi <jitao.shi@mediatek.com>
Subject: [PATCH 1/4] drm/panel: seperate panel power control from panel
 prepare/unprepare
Date: Tue, 20 Apr 2021 21:26:10 +0800
Message-ID: <20210420132614.150242-1-jitao.shi@mediatek.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-TM-SNTS-SMTP: 16A2BD5518165BF9873764FF788E4A99C5B0F7B7B0771DF8C7B7BBDDAE541BAA2000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210420_062633_139617_56992B61 
X-CRM114-Status: GOOD (  14.74  )
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

Some dsi panels require the dsi lanes keeping low before panel power
on. So seperate the panel power control and the communication with panel.

And put the power control in drm_panel_prepare_power and
drm_panel_unprepare_power. Put the communication with panel in
drm_panel_prepare and drm_panel_unprepare.

Signed-off-by: Jitao Shi <jitao.shi@mediatek.com>
---
 drivers/gpu/drm/bridge/panel.c | 17 +++++++++++++++
 drivers/gpu/drm/drm_panel.c    | 38 ++++++++++++++++++++++++++++++++++
 include/drm/drm_bridge.h       |  2 ++
 include/drm/drm_panel.h        | 17 +++++++++++++++
 4 files changed, 74 insertions(+)

diff --git a/drivers/gpu/drm/bridge/panel.c b/drivers/gpu/drm/bridge/panel.c
index 0ddc37551194..a19c96e710fc 100644
--- a/drivers/gpu/drm/bridge/panel.c
+++ b/drivers/gpu/drm/bridge/panel.c
@@ -125,6 +125,23 @@ static int panel_bridge_get_modes(struct drm_bridge *bridge,
 	return drm_panel_get_modes(panel_bridge->panel, connector);
 }
 
+int panel_bridge_prepare_power(struct drm_bridge *bridge)
+{
+	struct panel_bridge *panel_bridge = drm_bridge_to_panel_bridge(bridge);
+
+	return drm_panel_prepare_power(panel_bridge->panel);
+}
+EXPORT_SYMBOL(panel_bridge_prepare_power);
+
+int panel_bridge_unprepare_power(struct drm_bridge *bridge)
+{
+        struct panel_bridge *panel_bridge = drm_bridge_to_panel_bridge(bridge);
+
+        return drm_panel_unprepare_power(panel_bridge->panel);
+}
+EXPORT_SYMBOL(panel_bridge_unprepare_power);
+
+
 static const struct drm_bridge_funcs panel_bridge_bridge_funcs = {
 	.attach = panel_bridge_attach,
 	.detach = panel_bridge_detach,
diff --git a/drivers/gpu/drm/drm_panel.c b/drivers/gpu/drm/drm_panel.c
index f634371c717a..7bb5185db17d 100644
--- a/drivers/gpu/drm/drm_panel.c
+++ b/drivers/gpu/drm/drm_panel.c
@@ -115,6 +115,24 @@ int drm_panel_prepare(struct drm_panel *panel)
 }
 EXPORT_SYMBOL(drm_panel_prepare);
 
+/**
+ * drm_panel_prepare_power - power on a panel's power
+ * @panel: DRM panel
+ *
+ * Calling this function will enable power and deassert any reset signals to
+ * the panel.
+ *
+ * Return: 0 on success or a negative error code on failure.
+ */
+int drm_panel_prepare_power(struct drm_panel *panel)
+{
+	if (panel && panel->funcs && panel->funcs->prepare_power)
+		return panel->funcs->prepare_power(panel);
+
+	return panel ? -ENOSYS : -EINVAL;
+}
+EXPORT_SYMBOL(drm_panel_prepare_power);
+
 /**
  * drm_panel_unprepare - power off a panel
  * @panel: DRM panel
@@ -138,6 +156,26 @@ int drm_panel_unprepare(struct drm_panel *panel)
 }
 EXPORT_SYMBOL(drm_panel_unprepare);
 
+/**
+ * drm_panel_unprepare_power - power off a panel
+ * @panel: DRM panel
+ *
+ * Calling this function will completely power off a panel (assert the panel's
+ * reset, turn off power supplies, ...). After this function has completed, it
+ * is usually no longer possible to communicate with the panel until another
+ * call to drm_panel_prepare_power and drm_panel_prepare().
+ *
+ * Return: 0 on success or a negative error code on failure.
+ */
+int drm_panel_unprepare_power(struct drm_panel *panel)
+{
+	if (panel && panel->funcs && panel->funcs->unprepare_power)
+		return panel->funcs->unprepare_power(panel);
+
+	return panel ? -ENOSYS : -EINVAL;
+}
+EXPORT_SYMBOL(drm_panel_unprepare_power);
+
 /**
  * drm_panel_enable - enable a panel
  * @panel: DRM panel
diff --git a/include/drm/drm_bridge.h b/include/drm/drm_bridge.h
index 2195daa289d2..cc94c9da47d8 100644
--- a/include/drm/drm_bridge.h
+++ b/include/drm/drm_bridge.h
@@ -892,6 +892,8 @@ struct drm_bridge *devm_drm_panel_bridge_add_typed(struct device *dev,
 						   struct drm_panel *panel,
 						   u32 connector_type);
 struct drm_connector *drm_panel_bridge_connector(struct drm_bridge *bridge);
+int panel_bridge_prepare_power(struct drm_bridge *bridge);
+int panel_bridge_unprepare_power(struct drm_bridge *bridge);
 #endif
 
 #endif
diff --git a/include/drm/drm_panel.h b/include/drm/drm_panel.h
index 33605c3f0eba..48e83712ad44 100644
--- a/include/drm/drm_panel.h
+++ b/include/drm/drm_panel.h
@@ -68,6 +68,13 @@ enum drm_panel_orientation;
  * functionality to enable/disable backlight.
  */
 struct drm_panel_funcs {
+	/**
+	 * @prepare_power:
+	 *
+	 * Turn on panel power.
+	 */
+	int (*prepare_power)(struct drm_panel *panel);
+
 	/**
 	 * @prepare:
 	 *
@@ -115,6 +122,13 @@ struct drm_panel_funcs {
 	int (*get_modes)(struct drm_panel *panel,
 			 struct drm_connector *connector);
 
+	/**
+	 * @unprepare_power:
+	 *
+	 * Turn off panel_power.
+	 */
+	int (*unprepare_power)(struct drm_panel *panel);
+
 	/**
 	 * @get_timings:
 	 *
@@ -180,6 +194,9 @@ void drm_panel_init(struct drm_panel *panel, struct device *dev,
 void drm_panel_add(struct drm_panel *panel);
 void drm_panel_remove(struct drm_panel *panel);
 
+int drm_panel_prepare_power(struct drm_panel *panel);
+int drm_panel_unprepare_power(struct drm_panel *panel);
+
 int drm_panel_prepare(struct drm_panel *panel);
 int drm_panel_unprepare(struct drm_panel *panel);
 
-- 
2.25.1
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
