Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05A8CC3DA4A
	for <linux-mediatek@archiver.kernel.org>; Mon, 19 Aug 2024 15:26:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Gm0BRPLoqzxGUCbXV7y+oAqSJJpr/eM3URnfDtsT6qY=; b=hL1QUuaJCz54dCs9n8TFlb0Rqd
	0wlqfZRl/YHFd5NBTcFJppVl1+Qm6a9mUEPtr1uU+eMjQ5yl8u/umkZp1r5nxrPRKAy7KJm3mf/V6
	mhom8L5WTXVLLaiWE/vL7hrwyvRmiKstMKqoromCGgE12ICvtibOEFStW1CuhQFmGWbLl8VWyPMN9
	zfoWUEgrGIJfDwKtWM26MX6ei4PEQBO0bQ8nQtEvRvN9CDjvdt4E3J1p9BdugAD8D0QiT00sN1MbT
	WrSqdsz+MWJHPd86fIgN9XJZX9xWlhzE0C7NZIyJSmnGXUO1QLPZbtzP1TwRByUvmzY073CI4fBjH
	B7q6YuMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sg4HL-00000001w6M-3egP;
	Mon, 19 Aug 2024 15:26:43 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sg4Ge-00000001vvu-1z9u;
	Mon, 19 Aug 2024 15:26:02 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 4D6D560AB8;
	Mon, 19 Aug 2024 15:25:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id EF41CC32782;
	Mon, 19 Aug 2024 15:25:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724081159;
	bh=47/mi7Pp62O0NFO5UbuSap4oR+3mOW++0umg7qsCsBA=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=XDoFiYOYW1rdOm/PlOWwkn0+xmRO1qU8ePa5eQJfWGBTka/go2kpm/eEw7ujW7Mcb
	 EQZDyuIVWcmC76hv7rhZ+jRZPxvCYJxoqWd/2yM6evlaayp//TkdwRvxSY91qBVUYu
	 PqADLPMTwklhCDxensp4lX0W2wxRft5HZhJF966ePMtC3g4CdT/UQCK85bQhI1XWhq
	 1dFoZ8so4FXGhSw2c7KwYXrN6NAmppWLrDImiVnCNW+zIY6pmoZ97o+WMUgg8hKAuz
	 bbqbH7Ha6g+Ei/9gPawCCo4t+wTg8e+SsUHZJbWARPqfHPYFGWZvadj3C/jtSvLjla
	 peQwOA/NRdjFg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E3404C3DA4A;
	Mon, 19 Aug 2024 15:25:58 +0000 (UTC)
From: "Jason-JH.Lin via B4 Relay" <devnull+jason-jh.lin.mediatek.com@kernel.org>
Date: Mon, 19 Aug 2024 23:25:10 +0800
Subject: [PATCH v2] drm/mediatek: Fix missing configuration flags in
 mtk_crtc_ddp_config()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240819-drm-fixup-0819-v2-1-a03580ece3ec@mediatek.com>
X-B4-Tracking: v=1; b=H4sIANVjw2YC/0XMyw6CMBCF4Vchs3ZILxrAFe9hXDTtVAZtS1o0J
 oR3t2Hj8svJ+TcolJkKXJsNMn24cIoV6tSAnUx8ELKrBiXUWfRyQJcDev6+FzzoL5KU0523roN
 6WjLV9Qje7tU+p4DrlMn8M53QUmgt+lYKOfQocTYlRZyn9sVxDOTYrPRsbQqw7z+bhOfSowAAA
 A==
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Philipp Zabel <p.zabel@pengutronix.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Singo Chang <singo.chang@mediatek.com>, Nancy Lin <nancy.lin@mediatek.com>, 
 Project_Global_Chrome_Upstream_Group@mediatek.com, 
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 "Jason-JH.Lin" <jason-jh.lin@mediatek.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1724081157; l=4198;
 i=jason-jh.lin@mediatek.com; s=20240718; h=from:subject:message-id;
 bh=Q8yNxL1V+8Fyf9/F6ibfR4vyzWQzF1gZGlRNpdyq+Wc=;
 b=mToiwGYxLF03l56+/AFJ9V9ANIGgrncpw7osIk6F0/74e0A7jXKT07UbGl+3ZLs4bpGWzcnTw
 ZnS/1DpPIMIAc4J5tkIajRWuoi2bqOL0I0z+8LJ8aLmLA4e0/T61qtA
X-Developer-Key: i=jason-jh.lin@mediatek.com; a=ed25519;
 pk=7Hn+BnFBlPrluT5ks5tKVWb3f7O/bMBs6qEemVJwqOo=
X-Endpoint-Received: by B4 Relay for jason-jh.lin@mediatek.com/20240718
 with auth_id=187
X-Original-From: "Jason-JH.Lin" <jason-jh.lin@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240819_082600_687736_C7F5D9DA 
X-CRM114-Status: GOOD (  14.79  )
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
Reply-To: jason-jh.lin@mediatek.com
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: "Jason-JH.Lin" <jason-jh.lin@mediatek.com>

In mtk_crtc_ddp_config(), mtk_crtc will use some configuration flags to
generate instructions to cmdq_handle, such as:
  state->pending_config
  mtk_crtc->pending_planes
  plane_state->pending.config
  mtk_crtc->pending_async_planes
  plane_state->pending.async_config

These configuration flags may be set to false when a GCE IRQ comes calling
ddp_cmdq_cb(). This may result in missing prepare instructions,
especially if mtk_crtc_update_config() with the flase need_vblank (no need
to wait for vblank) cases.

Therefore, the mtk_crtc->config_updating flag is set at the beginning of
mtk_crtc_update_config() to ensure that these configuration flags won't be
changed when the mtk_crtc_ddp_config() is preparing instructions.
But somehow the ddp_cmdq_cb() didn't use the mtk_crtc->config_updating
flag to prevent those pending config flags from being cleared.

To avoid missing the configuration when generating the config instruction,
the config_updating flag should be added into ddp_cmdq_cb() and be
protected with spin_lock.

Fixes: 7f82d9c43879 ("drm/mediatek: Clear pending flag when cmdq packet is done")
Signed-off-by: Jason-JH.Lin <jason-jh.lin@mediatek.com>
---
Change in v2:
Add spin_lock protection for config_updating flag.
---
 drivers/gpu/drm/mediatek/mtk_crtc.c | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/drivers/gpu/drm/mediatek/mtk_crtc.c b/drivers/gpu/drm/mediatek/mtk_crtc.c
index 6f34f573e127..b752c0b46383 100644
--- a/drivers/gpu/drm/mediatek/mtk_crtc.c
+++ b/drivers/gpu/drm/mediatek/mtk_crtc.c
@@ -69,6 +69,8 @@ struct mtk_crtc {
 	/* lock for display hardware access */
 	struct mutex			hw_lock;
 	bool				config_updating;
+	/* lock for config_updating to cmd buffer */
+	spinlock_t			config_lock;
 };
 
 struct mtk_crtc_state {
@@ -107,10 +109,13 @@ static void mtk_crtc_finish_page_flip(struct mtk_crtc *mtk_crtc)
 static void mtk_drm_finish_page_flip(struct mtk_crtc *mtk_crtc)
 {
 	drm_crtc_handle_vblank(&mtk_crtc->base);
+
+	spin_lock(&mtk_crtc->config_lock);
 	if (!mtk_crtc->config_updating && mtk_crtc->pending_needs_vblank) {
 		mtk_crtc_finish_page_flip(mtk_crtc);
 		mtk_crtc->pending_needs_vblank = false;
 	}
+	spin_unlock(&mtk_crtc->config_lock);
 }
 
 #if IS_REACHABLE(CONFIG_MTK_CMDQ)
@@ -314,6 +319,13 @@ static void ddp_cmdq_cb(struct mbox_client *cl, void *mssg)
 
 	state = to_mtk_crtc_state(mtk_crtc->base.state);
 
+	spin_lock(&mtk_crtc->config_lock);
+
+	if (mtk_crtc->config_updating) {
+		spin_unlock(&mtk_crtc->config_lock);
+		goto ddp_cmdq_cb_out;
+	}
+
 	state->pending_config = false;
 
 	if (mtk_crtc->pending_planes) {
@@ -340,6 +352,10 @@ static void ddp_cmdq_cb(struct mbox_client *cl, void *mssg)
 		mtk_crtc->pending_async_planes = false;
 	}
 
+	spin_unlock(&mtk_crtc->config_lock);
+
+ddp_cmdq_cb_out:
+
 	mtk_crtc->cmdq_vblank_cnt = 0;
 	wake_up(&mtk_crtc->cb_blocking_queue);
 }
@@ -571,7 +587,11 @@ static void mtk_crtc_update_config(struct mtk_crtc *mtk_crtc, bool needs_vblank)
 	int i;
 
 	mutex_lock(&mtk_crtc->hw_lock);
+
+	spin_lock(&mtk_crtc->config_lock);
 	mtk_crtc->config_updating = true;
+	spin_unlock(&mtk_crtc->config_lock);
+
 	if (needs_vblank)
 		mtk_crtc->pending_needs_vblank = true;
 
@@ -625,7 +645,10 @@ static void mtk_crtc_update_config(struct mtk_crtc *mtk_crtc, bool needs_vblank)
 		mbox_client_txdone(mtk_crtc->cmdq_client.chan, 0);
 	}
 #endif
+	spin_lock(&mtk_crtc->config_lock);
 	mtk_crtc->config_updating = false;
+	spin_unlock(&mtk_crtc->config_lock);
+
 	mutex_unlock(&mtk_crtc->hw_lock);
 }
 
@@ -1068,6 +1091,7 @@ int mtk_crtc_create(struct drm_device *drm_dev, const unsigned int *path,
 		drm_mode_crtc_set_gamma_size(&mtk_crtc->base, gamma_lut_size);
 	drm_crtc_enable_color_mgmt(&mtk_crtc->base, 0, has_ctm, gamma_lut_size);
 	mutex_init(&mtk_crtc->hw_lock);
+	spin_lock_init(&mtk_crtc->config_lock);
 
 #if IS_REACHABLE(CONFIG_MTK_CMDQ)
 	i = priv->mbox_index++;

---
base-commit: 469f1bad3c1c6e268059f78c0eec7e9552b3894c
change-id: 20240819-drm-fixup-0819-f51e2d37fcd7

Best regards,
-- 
Jason-JH.Lin <jason-jh.lin@mediatek.com>



