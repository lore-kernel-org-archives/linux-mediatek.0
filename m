Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C685C27C79
	for <linux-mediatek@archiver.kernel.org>; Wed, 19 Jun 2024 14:32:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0vWFBJJ1QbvjP+XiQUlRgE72y/gw1E/9xHmb2xcyVZU=; b=fbPN8ksS49jBPMyrOBhKXfqi/y
	j3oZwYBKwkcLF5GBzQGz+TogVzwTjk8XFRZbnpe5bIcHCtsFNS6XetrpK/wRaBC2T0jw5zN6meNOL
	raW1V8LEaMwq869BMK/tsqz9zjNVKR2zyqvlQjOimctGDpEbmdq/gbgSLNndnRdxy+GcxR/7WgR9Q
	djfXCZ78EruGV37ZX1VsepcK6rJ4iay3dJUAOtwB5//a56kEkKP1/y/X1T78j1PDjxiF5Z80oBE3u
	ioQIWIXInMlC3p5Q/ME9P5P7N8F1FSx7UeivZcE1PEqiyu/Ns+zSP+NytSjp8i6TB534I58BlPYVm
	w8ClhlHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJwMb-00000001YV1-1PEb;
	Wed, 19 Jun 2024 14:32:41 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJwME-00000001YCZ-038d;
	Wed, 19 Jun 2024 14:32:26 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id AD03561E45;
	Wed, 19 Jun 2024 14:32:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 7F0ECC4AF0D;
	Wed, 19 Jun 2024 14:32:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718807534;
	bh=nk/C+wqrXVMA9amh6fPshkrHE4xq3UlYmGyCf1hutnA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=BP8tPFL3sF5bndbwmFOYxqr1xPQjGksocrhH4DbNOGYKzeBJFyw9tN1fcv6IX0GqO
	 E3IkEmVK3nfOMJTHhPSAJOhI4zS5IDH2Wvm0nWxo/kBqkeQW9MvRvTzESG14ukJa14
	 hcwxIzhH2Q9KDVx7MPhc20JfU9DVVR6DiOcjZytYTd24taeb9JvNSFf/kN76L3yPCN
	 6BbyJ9JMK1hBSGnBiGchuR+9+f1gxplEgKTorZNEZVkWhItEI0K+IYXNDFPtSYnwX/
	 p1sBAZcWEH+FSBlwODN4laQf3nGQvogWl2DL69VuhuA896lLxIQCBpRUR2kxTXlngb
	 1Q36jiWI2PLkw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6EA1AC27C53;
	Wed, 19 Jun 2024 14:32:14 +0000 (UTC)
From: Hsiao Chien Sung via B4 Relay <devnull+shawn.sung.mediatek.com@kernel.org>
Date: Wed, 19 Jun 2024 22:30:46 +0800
Subject: [PATCH v2 05/14] drm/mediatek: Turn off the layers with zero width
 or height
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240619-mediatek-drm-next-v2-5-abf68f46f8d2@mediatek.com>
References: <20240619-mediatek-drm-next-v2-0-abf68f46f8d2@mediatek.com>
In-Reply-To: <20240619-mediatek-drm-next-v2-0-abf68f46f8d2@mediatek.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1718807531; l=2110;
 i=shawn.sung@mediatek.com; s=20240616; h=from:subject:message-id;
 bh=1wAQfpFBsYHGAPuLXbpDgCF0uuBRyet+FxYXId9fMr0=;
 b=4/WwoVatxWG2vheNbELUaPi42wc85qaLAOkL3Dn5ulQNtClLAgS8OyN5j11wyNvQpAfMJP6Pw
 qt4nIxA2BGoA5jIJSpwOF4/OmpSyOnhF9fTx4KtCBlS6yBRnl3XFY9k
X-Developer-Key: i=shawn.sung@mediatek.com; a=ed25519;
 pk=lq1w8BuWDINX+4JHjGHhhbAU5ICP+cL9VCj7wn+cEDA=
X-Endpoint-Received: by B4 Relay for shawn.sung@mediatek.com/20240616 with
 auth_id=172
X-Original-From: Hsiao Chien Sung <shawn.sung@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240619_073219_537141_C4DEF674 
X-CRM114-Status: GOOD (  11.77  )
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

We found that IGT (Intel GPU Tool) will try to commit layers with
zero width or height and lead to undefined behaviors in hardware.
Disable the layers in such a situation.

Fixes: 453c3364632a ("drm/mediatek: Add ovl_adaptor support for MT8195")
Fixes: d886c0009bd0 ("drm/mediatek: Add ETHDR support for MT8195")
Reviewed-by: CK Hu <ck.hu@mediatek.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Signed-off-by: Hsiao Chien Sung <shawn.sung@mediatek.com>
---
 drivers/gpu/drm/mediatek/mtk_disp_ovl_adaptor.c | 2 +-
 drivers/gpu/drm/mediatek/mtk_ethdr.c            | 7 ++++++-
 2 files changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_disp_ovl_adaptor.c b/drivers/gpu/drm/mediatek/mtk_disp_ovl_adaptor.c
index 02dd7dcdfedb..2b62d6475918 100644
--- a/drivers/gpu/drm/mediatek/mtk_disp_ovl_adaptor.c
+++ b/drivers/gpu/drm/mediatek/mtk_disp_ovl_adaptor.c
@@ -158,7 +158,7 @@ void mtk_ovl_adaptor_layer_config(struct device *dev, unsigned int idx,
 	merge = ovl_adaptor->ovl_adaptor_comp[OVL_ADAPTOR_MERGE0 + idx];
 	ethdr = ovl_adaptor->ovl_adaptor_comp[OVL_ADAPTOR_ETHDR0];
 
-	if (!pending->enable) {
+	if (!pending->enable || !pending->width || !pending->height) {
 		mtk_merge_stop_cmdq(merge, cmdq_pkt);
 		mtk_mdp_rdma_stop(rdma_l, cmdq_pkt);
 		mtk_mdp_rdma_stop(rdma_r, cmdq_pkt);
diff --git a/drivers/gpu/drm/mediatek/mtk_ethdr.c b/drivers/gpu/drm/mediatek/mtk_ethdr.c
index 5c52e514ae30..bf5826b7e776 100644
--- a/drivers/gpu/drm/mediatek/mtk_ethdr.c
+++ b/drivers/gpu/drm/mediatek/mtk_ethdr.c
@@ -160,7 +160,12 @@ void mtk_ethdr_layer_config(struct device *dev, unsigned int idx,
 	if (idx >= 4)
 		return;
 
-	if (!pending->enable) {
+	if (!pending->enable || !pending->width || !pending->height) {
+		/*
+		 * instead of disabling layer with MIX_SRC_CON directly
+		 * set the size to 0 to avoid screen shift due to mixer
+		 * mode switch (hardware behavior)
+		 */
 		mtk_ddp_write(cmdq_pkt, 0, &mixer->cmdq_base, mixer->regs, MIX_L_SRC_SIZE(idx));
 		return;
 	}

-- 
Git-146)



