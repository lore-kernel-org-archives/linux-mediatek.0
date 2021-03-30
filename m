Return-Path: <SRS0=H7Ok=I4=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8B14BC433DB
	for <linux-mediatek@archiver.kernel.org>; Tue, 30 Mar 2021 11:09:48 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 12FAD61601
	for <linux-mediatek@archiver.kernel.org>; Tue, 30 Mar 2021 11:09:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 12FAD61601
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:MIME-Version:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:References:In-Reply-To:Message-Id:Date:Subject:Cc:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zy1oU1cPU/2KZmaUpR23lBYDYORn56BYirCqOwk2b7Y=; b=ZlZzXV8i1T8emdf4hysyr7xDIC
	irQUlI5AsmG+6ZIcRxkEVbHPnOjHUSFGd/m84yoH4LG0QcY6+va2moEg0+tR13/YJ6p8cU994/emx
	9y4Lf8efz+oGftu1dpHjiEmPbSnFDpzdZz4+Ivtxue9rxFkyF2Po5hiS1kglHkZfoCYFuNThpWno6
	8LQfYQiKmbRVkL7QMimaby9zF1j53ZXIY11cLge51rtnWGrOpEERElzWetiWmIG7lcq7xyDQN8XOE
	h7RtXS3bzseelAS7bAgdamYwJa4L2pFdYgBJHOgkltPkIk6ZutySyE23IZi4JZxMqN4P7taQ36sfQ
	aK9+OYIg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lRCFb-003WXQ-BE; Tue, 30 Mar 2021 11:09:35 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lRCFD-003WSq-Gk
 for linux-mediatek@lists.infradead.org; Tue, 30 Mar 2021 11:09:13 +0000
Received: from guri.fritz.box (unknown
 [IPv6:2a02:810a:880:f54:2d37:13aa:2f32:9c00])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: dafna)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 4EF281F452F2;
 Tue, 30 Mar 2021 12:09:10 +0100 (BST)
From: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
To: dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org
Cc: dafna.hirschfeld@collabora.com, kernel@collabora.com, dafna3@gmail.com,
 chunkuang.hu@kernel.org, p.zabel@pengutronix.de, airlied@linux.ie,
 daniel@ffwll.ch, enric.balletbo@collabora.com,
 laurent.pinchart@ideasonboard.com
Subject: [PATCH v3 1/2] drm/mediatek: Switch the hdmi bridge ops to the atomic
 versions
Date: Tue, 30 Mar 2021 13:09:01 +0200
Message-Id: <20210330110902.14178-2-dafna.hirschfeld@collabora.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210330110902.14178-1-dafna.hirschfeld@collabora.com>
References: <20210330110902.14178-1-dafna.hirschfeld@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210330_120911_671650_463BADBA 
X-CRM114-Status: GOOD (  11.40  )
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
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
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
