Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBE89C27C79
	for <linux-mediatek@archiver.kernel.org>; Wed, 19 Jun 2024 16:39:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Mxa0bmGCmNKwKz/w+gKi3h/m7+sCqbHnmAUL9poHsHc=; b=OV9FYWr+7/McPkbEY3VJ64SCiQ
	oKisk+QU6iEmDM5RwGmp2mgDw8nUiCWHqnDrFKAnq5gr6zzxFUQhyHsXqTz9dGZr6TKt3SaLSdtq9
	hWnb43/5obKkUr3ToJSDKcxwY7KQtjZpn/HlJYex2cyAzeLSRO5n48fSc5Y8A5+nfez+d2TZXBzlL
	oOnYrA3YbEM/b1BHNppCItb3zCHVBAuKIdqi82Xe/axxJkgjHU8eAx9BFPlQByZciOukz6l9zWFfS
	MEOGpkP9BvLjTWlIzdFvXl6z+sa2ezW6nUTFIeQC/vXRbxT52TTKkkrKSzKkaVFOUKHQnvBj7ssNT
	zePFNiig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJyKw-000000024F2-3mAe;
	Wed, 19 Jun 2024 16:39:07 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJyKc-000000023wp-2y0n;
	Wed, 19 Jun 2024 16:38:50 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 4061261EA7;
	Wed, 19 Jun 2024 16:38:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id DFFD4C4AF07;
	Wed, 19 Jun 2024 16:38:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718815124;
	bh=uJgeqwP/exRsycFcCMLfCia6ha45FbjhfAs5Cm1rATQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=WHmnph4amcaY3GfLeDR1eUYN4FOFsPdlSYYI5hal8Is3/aCkVW7cuW5a4bYjwHard
	 mrhglBL4dxpwBc5dwuYAoW9GYTjhxyUffC20uNUmhJ9sqi0tYki+fAyeTUIwMWD2yx
	 33PHuKtmvH2cIoEpqQK9JXW2usRXuMaEv8EVF+V5GdaZwrryXCH3afYyBlKs3ICxre
	 y0/9ASkPo5aC1Fp1Z0RGvCNSPEvh9uV7ygtRn6irSkBi/wKLsV9NZhr7CGKE73eGzH
	 71WpJa/zGdw6tTPpOvhS8XSHny5l2tyXXVjsCdqgzyFbiwlL2s7uTShTtCW4fPl263
	 +T0NKpyBEx1bw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C6946C2BA15;
	Wed, 19 Jun 2024 16:38:44 +0000 (UTC)
From: Hsiao Chien Sung via B4 Relay <devnull+shawn.sung.mediatek.com@kernel.org>
Date: Thu, 20 Jun 2024 00:38:41 +0800
Subject: [PATCH v3 01/14] drm/mediatek: Add missing plane settings when
 async update
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240620-igt-v3-1-a9d62d2e2c7e@mediatek.com>
References: <20240620-igt-v3-0-a9d62d2e2c7e@mediatek.com>
In-Reply-To: <20240620-igt-v3-0-a9d62d2e2c7e@mediatek.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 CK Hu <ck.hu@mediatek.com>, Bibby Hsieh <bibby.hsieh@mediatek.com>, 
 Daniel Kurtz <djkurtz@chromium.org>, Mao Huang <littlecvr@chromium.org>, 
 "Nancy.Lin" <nancy.lin@mediatek.com>
Cc: YT Shen <yt.shen@mediatek.com>, dri-devel@lists.freedesktop.org, 
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, 
 Hsiao Chien Sung <shawn.sung@mediatek.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1718815123; l=1161;
 i=shawn.sung@mediatek.com; s=20240616; h=from:subject:message-id;
 bh=oPP96bMpAu5gtyCGtIUYUgi5lQMG+4ahEDxfcNXlQWw=;
 b=aMX6/BSIN7JysnkjWbvbGbARLC0zI6CsR4P/4GAqmooXFrLDIkTnz7LfJexu6dNKd54tnNod6
 p2L3pPUYAEtBOPm5E9BonxPxZX8LBHmEQDSAJEBM0vDB2NrCIM6tHyl
X-Developer-Key: i=shawn.sung@mediatek.com; a=ed25519;
 pk=lq1w8BuWDINX+4JHjGHhhbAU5ICP+cL9VCj7wn+cEDA=
X-Endpoint-Received: by B4 Relay for shawn.sung@mediatek.com/20240616 with
 auth_id=172
X-Original-From: Hsiao Chien Sung <shawn.sung@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240619_093847_158213_43104D74 
X-CRM114-Status: UNSURE (   9.00  )
X-CRM114-Notice: Please train this message.
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
Reply-To: shawn.sung@mediatek.com
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Hsiao Chien Sung <shawn.sung@mediatek.com>

Fix an issue that plane coordinate was not saved when
calling async update.

Fixes: 920fffcc8912 ("drm/mediatek: update cursors by using async atomic update")

Reviewed-by: CK Hu <ck.hu@mediatek.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Fixes: 119f5173628a ("drm/mediatek: Add DRM Driver for Mediatek SoC MT8173.")
Signed-off-by: Hsiao Chien Sung <shawn.sung@mediatek.com>
---
 drivers/gpu/drm/mediatek/mtk_plane.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/mediatek/mtk_plane.c b/drivers/gpu/drm/mediatek/mtk_plane.c
index 4625deb21d40..a74b26d35985 100644
--- a/drivers/gpu/drm/mediatek/mtk_plane.c
+++ b/drivers/gpu/drm/mediatek/mtk_plane.c
@@ -227,6 +227,8 @@ static void mtk_plane_atomic_async_update(struct drm_plane *plane,
 	plane->state->src_y = new_state->src_y;
 	plane->state->src_h = new_state->src_h;
 	plane->state->src_w = new_state->src_w;
+	plane->state->dst.x1 = new_state->dst.x1;
+	plane->state->dst.y1 = new_state->dst.y1;
 
 	mtk_plane_update_new_state(new_state, new_plane_state);
 	swap(plane->state->fb, new_state->fb);

-- 
Git-146)



