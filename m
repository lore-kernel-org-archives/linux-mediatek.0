Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B02DCC2BA15
	for <linux-mediatek@archiver.kernel.org>; Sun, 16 Jun 2024 08:29:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=h3iVYmkTR3f9xK/fYUNKcyDiTI4eT1NCUpg2QLfCp6c=; b=vntvB7y07sv+dnruaQ8VgnmhgB
	tjnjP6u+cnPa6udJfOglpI9wX25REhqXLNn01dkQltcSOzVIgz3qn/4HXUKf6IskZLrk+Jk6jaxQ/
	En9Lig5EoHn1SK5GSpMsRUn2A4hj9xQa+mu6ixdzkL+zI6q83yb6Ck0VXGAke1EuIegTIbi9JNWYS
	J/AsIMiOJ2ag9RKwR4dbP3P1JBsoLxMMi8avbHW+QY0vvvxaXL2tG3Wehf8+nWStEQ1xatQ5y4P1+
	+Ppl9J4w/LXtVjOESzUSGDR+x9KOxQ2ddsAQE5JV/RgqDKxCNiFwc9vCFW5MRS7ScmvxdN7jr+9UF
	sBtLqLEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sIlGU-000000077rx-48x6;
	Sun, 16 Jun 2024 08:29:30 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sIlGH-000000077iP-16FI;
	Sun, 16 Jun 2024 08:29:21 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id C2DD760C67;
	Sun, 16 Jun 2024 08:29:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 0643DC4AF50;
	Sun, 16 Jun 2024 08:29:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718526555;
	bh=ooFwSoVJ9N3sXdcV4iug2DcGs+ehRHDEPEzbrAfyAEI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=KpS3YKDP1ahe//Us3V7N1GqiG1otEZ4R6peB5lsLGldYx9UrZ+ykCyGuGoJ9rDU71
	 Gg+QXFjoENRLVyc1ckyOdFT52tyvx7YFZjtEQKCyYpj0asi0tSCNk2t4kFJBYbgp+1
	 13aS5FZ9iRdEUrYU6go5iSRMKrGd+DFTy/wyZr00mHeaFuU3c35cRUik/wQI5IlqgC
	 1lzr8hWPVuFWHgNK1vG1vPIrV7Vw2XGpt5LFFvFZfXCg+GrvUwkuw23ocDml8qYEpr
	 GuXR+VrrALUmgOZlUZrR6RuRfdaVAvra24/uaoyN4OkYRnHYFs2qDp92Rh0sfx3IVe
	 ekDOJCgVlVRFA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E5BFBC27C77;
	Sun, 16 Jun 2024 08:29:14 +0000 (UTC)
From: Hsiao Chien Sung via B4 Relay <devnull+shawn.sung.mediatek.com@kernel.org>
Date: Sun, 16 Jun 2024 16:29:13 +0800
Subject: [PATCH 03/13] drm/mediatek: Add missing plane settings when async
 update
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240616-mediatek-drm-next-v1-3-7e8f9cf785d8@mediatek.com>
References: <20240616-mediatek-drm-next-v1-0-7e8f9cf785d8@mediatek.com>
In-Reply-To: <20240616-mediatek-drm-next-v1-0-7e8f9cf785d8@mediatek.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 CK Hu <ck.hu@mediatek.com>, Bibby Hsieh <bibby.hsieh@mediatek.com>, 
 Daniel Kurtz <djkurtz@chromium.org>, YT Shen <yt.shen@mediatek.com>, 
 Mao Huang <littlecvr@chromium.org>, "Nancy.Lin" <nancy.lin@mediatek.com>
Cc: dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 Hsiao Chien Sung <shawn.sung@mediatek.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1718526553; l=1082;
 i=shawn.sung@mediatek.com; s=20240616; h=from:subject:message-id;
 bh=ADiZlSVJT5s2sH18XbsNK2Wsb8sGtAwURKhvCjHjtzc=;
 b=FVT/WCynaSSn97vJO73+EtVbiFHnpQke6j5kOKH+9CSpaY+pf3TzcrWiqOmEJYs+/GibTLH26
 PI8uVoDJsH9DfpE3reZyu3mXz7V5UXp64qRrbfhMf+MYlS5Y6DFcOsc
X-Developer-Key: i=shawn.sung@mediatek.com; a=ed25519;
 pk=lq1w8BuWDINX+4JHjGHhhbAU5ICP+cL9VCj7wn+cEDA=
X-Endpoint-Received: by B4 Relay for shawn.sung@mediatek.com/20240616 with
 auth_id=172
X-Original-From: Hsiao Chien Sung <shawn.sung@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240616_012917_639110_F1795021 
X-CRM114-Status: UNSURE (   8.50  )
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



