Return-Path: <SRS0=9HTA=M7=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C7003C432BE
	for <linux-mediatek@archiver.kernel.org>; Sun,  8 Aug 2021 12:52:44 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7EF7360F9E
	for <linux-mediatek@archiver.kernel.org>; Sun,  8 Aug 2021 12:52:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 7EF7360F9E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=39ZS3n9TUXomTYA6sFssjujEFZBF0QpgqOr66r/aSPs=; b=d7XRUKPl37aVd4
	WQMLR7a5XP1zSzInQoEgnVTOgtna1xgdZh8BXJzNq0tu7xQP8Jn+h9x59aBTZgzV22Vp6PTIN2l3x
	74YjorBlqU6fFnXJaD+qmAEXjStjxK1SYjmhHjwi0BKPNI3TIzNQd8efjDO/Bsz31WCpE3JdhaHqp
	XldY+wUPRYTsGzca8uGaYWYHsF7xcZc56K5Z/lz3jP6iBigGalQgr/u8/g+A8wVKQaF70R4CLXAtS
	cSnKs5dTRAvesQIlwSXZ6+Tr84q4yIcsqJcXtlIkxa20gODtJGG+f6zMkYeg3KPUAwWwyLmqkB20K
	wu1xHHl937vrMHG8uCQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mCiI5-00Fqss-V1; Sun, 08 Aug 2021 12:52:33 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mCiI1-00Fqs1-2k
 for linux-mediatek@lists.infradead.org; Sun, 08 Aug 2021 12:52:32 +0000
X-UUID: df692ad20a094dd099246b2f8cb586a9-20210808
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=IikVvIUeSb+jh61wDMjaX6eojRPDP/vletPDcFHAflw=; 
 b=ILfxHA1YOhzjdFGlHZIupDenYQUEL7mQA9Jq9l4OcYP3Dr6B9ldhL4lwC4zj/7Sbvxy/xVgoFqjef5uRJuZayvw/SJZG+PJXMjb7cuHLmPT2VsEjDbprsWxdeWZOmsKA1zXp3j3uvfH9MwuLU7Rpa/DnIaIAWPtNbPHRP9p+6sE=;
X-UUID: df692ad20a094dd099246b2f8cb586a9-20210808
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <jitao.shi@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1100144064; Sun, 08 Aug 2021 05:52:26 -0700
Received: from MTKMBS33N1.mediatek.inc (172.27.4.75) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sun, 8 Aug 2021 05:52:24 -0700
Received: from MTKCAS36.mediatek.inc (172.27.4.186) by MTKMBS33N1.mediatek.inc
 (172.27.4.75) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Sun, 8 Aug 2021 20:52:21 +0800
Received: from mszsdclx1018.gcn.mediatek.inc (10.16.6.18) by
 MTKCAS36.mediatek.inc (172.27.4.170) with Microsoft SMTP Server id
 15.0.1497.2 via Frontend Transport; Sun, 8 Aug 2021 20:52:20 +0800
From: Jitao Shi <jitao.shi@mediatek.com>
To: Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg
 <sam@ravnborg.org>, David Airlie <airlied@linux.ie>, Daniel Vetter
 <daniel@ffwll.ch>, Matthias Brugger <matthias.bgg@gmail.com>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>
CC: <linux-mediatek@lists.infradead.org>, <srv_heupstream@mediatek.com>,
 <yingjoe.chen@mediatek.com>, <eddie.huang@mediatek.com>,
 <cawa.cheng@mediatek.com>, <bibby.hsieh@mediatek.com>, <ck.hu@mediatek.com>,
 <stonea168@163.com>, Jitao Shi <jitao.shi@mediatek.com>
Subject: [PATCH v2 1/3] drm/panel: seperate panel power control from panel
 prepare/unprepare
Date: Sun, 8 Aug 2021 20:52:16 +0800
Message-ID: <20210808125218.63029-2-jitao.shi@mediatek.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210808125218.63029-1-jitao.shi@mediatek.com>
References: <20210808125218.63029-1-jitao.shi@mediatek.com>
MIME-Version: 1.0
X-TM-SNTS-SMTP: B35D5D73D01C234FA99BF0717794F6C11538A8AA4068D6E2E72C36C219BE30402000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210808_055230_592281_ACA719E3 
X-CRM114-Status: GOOD (  13.44  )
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
index c916f4b8907e..3a846ac8e24c 100644
--- a/drivers/gpu/drm/bridge/panel.c
+++ b/drivers/gpu/drm/bridge/panel.c
@@ -137,6 +137,23 @@ static int panel_bridge_get_modes(struct drm_bridge *bridge,
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
