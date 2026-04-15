Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C177F43834
	for <linux-mediatek@archiver.kernel.org>; Wed, 15 Apr 2026 15:04:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:Cc:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vi3OiVNt/NkQIzT5opV64E0LD0O9rqcwx3jEF1Vrbvo=; b=ACJRzOy4tw/+Yy4bt1VRak4DyP
	k8xObD/OtbCXg2U2K03+pxz7vAPSj4zCKcFrNkt0AzOvH6rWULOkA9hzcJIBjmhToswDM5Qjb2xYH
	j16KAf+j/PKyyws7hrpBSnvJ950VHsie49KIxFCADZevi/vjdQnATYPbA+7LelpivtjE/PhnFVcNF
	wZWO12MoQ5UpxZRo8Fd7uWSSSmVflKdfsNEhNCsGcQVVaG+3PFtr1dsUsh0Iunqw0iuWgPmlgEUCz
	Bbt9QvNeO8RH9eS6+HZakklFnDi8rjUQluSCzsS79hbmNZrGSuokw7sCHvBp7mOP3xPpqHo13cLsN
	GRSksbKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wD1my-00000001HUo-38il;
	Wed, 15 Apr 2026 15:04:24 +0000
Received: from pidgin.makrotopia.org ([2a07:2ec0:3002::65])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wD1mw-00000001HSX-1hiG;
	Wed, 15 Apr 2026 15:04:23 +0000
Received: from local
	by pidgin.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
	 (Exim 4.99)
	(envelope-from <daniel@makrotopia.org>)
	id 1wD1ms-000000002Nq-3tYX;
	Wed, 15 Apr 2026 15:04:19 +0000
Date: Wed, 15 Apr 2026 16:04:16 +0100
From: Daniel Golle <daniel@makrotopia.org>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Junzhi Zhao <junzhi.zhao@mediatek.com>,
	Jie Qiu <jie.qiu@mediatek.com>, dri-devel@lists.freedesktop.org,
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH 2/2] drm/mediatek: hdmi: report jack plugged state from
 bridge enable/disable
Message-ID: <c4d62fc2244fb72207855c5a366ff10fad419f2d.1776265222.git.daniel@makrotopia.org>
References: <a3e22cbae528c9a38d854a586d1736b860998d41.1776265222.git.daniel@makrotopia.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a3e22cbae528c9a38d854a586d1736b860998d41.1776265222.git.daniel@makrotopia.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260415_080422_446452_FAF36788 
X-CRM114-Status: GOOD (  10.46  )
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

Notify hdmi-codec of the current sink plugged state from
mtk_hdmi_bridge_atomic_enable() and mtk_hdmi_bridge_atomic_disable()
via mtk_hdmi_update_plugged_status(). This matches the pattern used
by dw-hdmi, which invokes handle_plugged_change() from the bridge
enable and disable paths so that ASoC jack state stays in sync with
the actual sink presence across atomic commit cycles, and not only
on CEC HPD transitions.

Userspace audio daemons (e.g. pipewire) rely on the jack state to
route streams, restore per-sink volume levels, and recover the last
used device after a reconnect. Without this, those transitions are
missed whenever the sink change is driven by a mode set rather than
by a bare HPD event.

Signed-off-by: Daniel Golle <daniel@makrotopia.org>
---
 drivers/gpu/drm/mediatek/mtk_hdmi.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/mediatek/mtk_hdmi.c b/drivers/gpu/drm/mediatek/mtk_hdmi.c
index 9050d7785f109..565bb72c9b63a 100644
--- a/drivers/gpu/drm/mediatek/mtk_hdmi.c
+++ b/drivers/gpu/drm/mediatek/mtk_hdmi.c
@@ -1013,6 +1013,8 @@ static void mtk_hdmi_bridge_atomic_disable(struct drm_bridge *bridge,
 	hdmi->curr_conn = NULL;
 
 	hdmi->enabled = false;
+
+	mtk_hdmi_update_plugged_status(hdmi);
 }
 
 static void mtk_hdmi_bridge_atomic_post_disable(struct drm_bridge *bridge,
@@ -1082,6 +1084,8 @@ static void mtk_hdmi_bridge_atomic_enable(struct drm_bridge *bridge,
 	mtk_hdmi_clk_enable_audio(hdmi);
 
 	hdmi->enabled = true;
+
+	mtk_hdmi_update_plugged_status(hdmi);
 }
 
 static const struct drm_bridge_funcs mtk_hdmi_bridge_funcs = {
-- 
2.53.0

