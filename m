Return-Path: <SRS0=9jr7=I3=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D5103C433E1
	for <linux-mediatek@archiver.kernel.org>; Mon, 29 Mar 2021 23:07:01 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 73E6E61988
	for <linux-mediatek@archiver.kernel.org>; Mon, 29 Mar 2021 23:07:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 73E6E61988
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:MIME-Version:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:References:In-Reply-To:Message-Id:Date:Subject:Cc:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=d3oLeIy0A7Ppi18lDedhMQHcx9tezRCJbyL4zKJJYfc=; b=B4NKwPT6Zv8sZpWhhcIEevLQtp
	1m+on+c6CVH1kX0PfhLqz/5NXgr6XjbyRV3dBsMaUO7E3LslTtHnWZnzKWKoA8AKVgq8WtB5d3jip
	AxER8CKKhqFDbO1iSaVlR5Bihp/R6mFcbE27ma2y3HgW8/4X6+U4rxcU8+ko9Ky1BdKva6T5GEvOJ
	86E7epeiclGOnwZ2XAM1gk+eG+XkQFtJYUM1KNygAybk9TPhkVHNIKKnRL8NfXq5fM9MhvvGLUCQ7
	tW9Lq6h71iy0uTme0ef6LhYuyt7dslnL5ShED4XvNcHzYAcRb8I2EPoGX9wsPHvRxjOV4zN3omZ7J
	KRPbuC3g==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lR0y9-001psE-ER; Mon, 29 Mar 2021 23:06:49 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lQtwm-000jtv-65
 for linux-mediatek@lists.infradead.org; Mon, 29 Mar 2021 15:37:09 +0000
Received: from guri.fritz.box (unknown
 [IPv6:2a02:810a:880:f54:85ba:22ea:8b43:4375])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: dafna)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id CD6C31F4553F;
 Mon, 29 Mar 2021 16:36:52 +0100 (BST)
From: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
To: dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org
Cc: dafna.hirschfeld@collabora.com, kernel@collabora.com, dafna3@gmail.com,
 chunkuang.hu@kernel.org, p.zabel@pengutronix.de, airlied@linux.ie,
 daniel@ffwll.ch, enric.balletbo@collabora.com,
 laurent.pinchart@ideasonboard.com
Subject: [PATCH v2 1/3] drm/mediatek: Switch the hdmi bridge ops to the atomic
 versions
Date: Mon, 29 Mar 2021 17:36:30 +0200
Message-Id: <20210329153632.17559-2-dafna.hirschfeld@collabora.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210329153632.17559-1-dafna.hirschfeld@collabora.com>
References: <20210329153632.17559-1-dafna.hirschfeld@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210329_163707_757403_B1202E89 
X-CRM114-Status: GOOD (  11.98  )
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

The bridge operation '.enable' and the audio cb '.get_eld'
access hdmi->conn. In the future we will want to support
the flag DRM_BRIDGE_ATTACH_NO_CONNECTOR and then we will
not have direct access to the connector.
The atomic version '.atomic_enable' allows accessing the
current connector from the state.
This patch switches the bridge to the atomic version to
prepare access to the connector in later patches.

Signed-off-by: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
---
 drivers/gpu/drm/mediatek/mtk_hdmi.c | 23 +++++++++++++++--------
 1 file changed, 15 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_hdmi.c b/drivers/gpu/drm/mediatek/mtk_hdmi.c
index 8ee55f9e2954..f2c810b767ef 100644
--- a/drivers/gpu/drm/mediatek/mtk_hdmi.c
+++ b/drivers/gpu/drm/mediatek/mtk_hdmi.c
@@ -1357,7 +1357,8 @@ static bool mtk_hdmi_bridge_mode_fixup(struct drm_bridge *bridge,
 	return true;
 }
 
-static void mtk_hdmi_bridge_disable(struct drm_bridge *bridge)
+static void mtk_hdmi_bridge_atomic_disable(struct drm_bridge *bridge,
+					   struct drm_bridge_state *old_bridge_state)
 {
 	struct mtk_hdmi *hdmi = hdmi_ctx_from_bridge(bridge);
 
@@ -1371,7 +1372,8 @@ static void mtk_hdmi_bridge_disable(struct drm_bridge *bridge)
 	hdmi->enabled = false;
 }
 
-static void mtk_hdmi_bridge_post_disable(struct drm_bridge *bridge)
+static void mtk_hdmi_bridge_atomic_post_disable(struct drm_bridge *bridge,
+						struct drm_bridge_state *old_state)
 {
 	struct mtk_hdmi *hdmi = hdmi_ctx_from_bridge(bridge);
 
@@ -1406,7 +1408,8 @@ static void mtk_hdmi_bridge_mode_set(struct drm_bridge *bridge,
 	drm_mode_copy(&hdmi->mode, adjusted_mode);
 }
 
-static void mtk_hdmi_bridge_pre_enable(struct drm_bridge *bridge)
+static void mtk_hdmi_bridge_atomic_pre_enable(struct drm_bridge *bridge,
+					      struct drm_bridge_state *old_state)
 {
 	struct mtk_hdmi *hdmi = hdmi_ctx_from_bridge(bridge);
 
@@ -1426,7 +1429,8 @@ static void mtk_hdmi_send_infoframe(struct mtk_hdmi *hdmi,
 		mtk_hdmi_setup_vendor_specific_infoframe(hdmi, mode);
 }
 
-static void mtk_hdmi_bridge_enable(struct drm_bridge *bridge)
+static void mtk_hdmi_bridge_atomic_enable(struct drm_bridge *bridge,
+					  struct drm_bridge_state *old_state)
 {
 	struct mtk_hdmi *hdmi = hdmi_ctx_from_bridge(bridge);
 
@@ -1440,13 +1444,16 @@ static void mtk_hdmi_bridge_enable(struct drm_bridge *bridge)
 }
 
 static const struct drm_bridge_funcs mtk_hdmi_bridge_funcs = {
+	.atomic_duplicate_state = drm_atomic_helper_bridge_duplicate_state,
+	.atomic_destroy_state = drm_atomic_helper_bridge_destroy_state,
+	.atomic_reset = drm_atomic_helper_bridge_reset,
 	.attach = mtk_hdmi_bridge_attach,
 	.mode_fixup = mtk_hdmi_bridge_mode_fixup,
-	.disable = mtk_hdmi_bridge_disable,
-	.post_disable = mtk_hdmi_bridge_post_disable,
+	.atomic_disable = mtk_hdmi_bridge_atomic_disable,
+	.atomic_post_disable = mtk_hdmi_bridge_atomic_post_disable,
 	.mode_set = mtk_hdmi_bridge_mode_set,
-	.pre_enable = mtk_hdmi_bridge_pre_enable,
-	.enable = mtk_hdmi_bridge_enable,
+	.atomic_pre_enable = mtk_hdmi_bridge_atomic_pre_enable,
+	.atomic_enable = mtk_hdmi_bridge_atomic_enable,
 };
 
 static int mtk_hdmi_dt_parse_pdata(struct mtk_hdmi *hdmi,
-- 
2.17.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
