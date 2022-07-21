Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16D84C433EF
	for <linux-mediatek@archiver.kernel.org>; Thu, 21 Jul 2022 17:27:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=hdko9+i7pQU/1HpjO6KQp9TneRFXhp7pmdAP3SZxjUc=; b=SnAXTBQBByCtNDbom7KONoGHmQ
	kWeHQtR6VBAbXnh7Q02m+L7YpR00ZlAZK3+BRP0vyclqljggeaJurSYI1/Rg1v8bg/dmXCThYCnXA
	LTlb93iZm4GzfztT4+lmUC/cL2TAktl+fk7EJ1NLLsQXh3oH/72zH5elibS6x3c8uy9OuwYxbR8rh
	aAuK4qwswr6I7OZ3LCIExzud+IeXp/9Ed7MGx2tKbFDfKH5az1WNDMSAxPu2wr94WGnuutfeTmAWJ
	Iq8EpakRTcf0JlyfDjx3Df3p2AwEQpXMtOdyI9inbcUHanyte3uzND+7qhnrdemRWKRn3XE1HWm3U
	AUy2w/Vw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oEZxl-00AkGS-IB; Thu, 21 Jul 2022 17:27:49 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oEZxa-00Ak6a-2t; Thu, 21 Jul 2022 17:27:39 +0000
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id DD84A6601ABB;
	Thu, 21 Jul 2022 18:27:31 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1658424452;
	bh=Jh+MlVqOqL9qKgG98dGWwY/Of15G6iLMIOH710td1SM=;
	h=From:To:Cc:Subject:Date:From;
	b=cayjJKtQwMz2Rn6isFsbHQLUnPG5gkgRifmNaeGhfEyIqF5wkn8W9ec+CT3UKaLo3
	 hti6Z2gjaW588AK2Zy3kfucW7qVMpylIcHDFviC0FJqs2IHqvZ6j88ojd0U/HLkDWy
	 csRXO0pTonVcJK0lxLhuvMxtjvogs6tpEDChwxa4jg2nBfEh0N2tjR4UTYeEXRwpsU
	 GnqyqK4huOn84Y6EntLAqy4hhimFYLVfrS3qXHOKWKwWlK4axoLcdrzoIAw6MN9y5s
	 KRfzDXhgifHXM1okNdwOE7dZzVU0nDtjzfDuPo3mWl2PupKe6bPykK1p6xu5xsetFy
	 lZkXlDXEMKo6Q==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: chunkuang.hu@kernel.org
Cc: p.zabel@pengutronix.de,
	airlied@linux.ie,
	daniel@ffwll.ch,
	matthias.bgg@gmail.com,
	rex-bc.chen@mediatek.com,
	jitao.shi@mediatek.com,
	xinlei.lee@mediatek.com,
	dri-devel@lists.freedesktop.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: [PATCH] drm/mediatek: dsi: Add atomic {destroy,duplicate}_state, reset callbacks
Date: Thu, 21 Jul 2022 19:27:27 +0200
Message-Id: <20220721172727.14624-1-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220721_102738_264714_9E9143AF 
X-CRM114-Status: UNSURE (   8.84  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Add callbacks for atomic_destroy_state, atomic_duplicate_state and
atomic_reset to restore functionality of the DSI driver: this solves
vblank timeouts when another bridge is present in the chain.

Tested bridge chain: DSI <=> ANX7625 => aux-bus panel

Fixes: 7f6335c6a258 ("drm/mediatek: Modify dsi funcs to atomic operations")
Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---

Note: The commit that has been mentioned in the Fixes tag should
      *not* have my Reviewed-by tag, as the author changed it but
      erroneously retained the tag that I had released for an
      earlier version of that commit (which was fine, but the new
      version broke mtk_dsi!).

 drivers/gpu/drm/mediatek/mtk_dsi.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/mediatek/mtk_dsi.c b/drivers/gpu/drm/mediatek/mtk_dsi.c
index 9cc406e1eee1..5b624e0f5b0a 100644
--- a/drivers/gpu/drm/mediatek/mtk_dsi.c
+++ b/drivers/gpu/drm/mediatek/mtk_dsi.c
@@ -808,10 +808,13 @@ static void mtk_dsi_bridge_atomic_post_disable(struct drm_bridge *bridge,
 
 static const struct drm_bridge_funcs mtk_dsi_bridge_funcs = {
 	.attach = mtk_dsi_bridge_attach,
+	.atomic_destroy_state = drm_atomic_helper_bridge_destroy_state,
 	.atomic_disable = mtk_dsi_bridge_atomic_disable,
+	.atomic_duplicate_state = drm_atomic_helper_bridge_duplicate_state,
 	.atomic_enable = mtk_dsi_bridge_atomic_enable,
 	.atomic_pre_enable = mtk_dsi_bridge_atomic_pre_enable,
 	.atomic_post_disable = mtk_dsi_bridge_atomic_post_disable,
+	.atomic_reset = drm_atomic_helper_bridge_reset,
 	.mode_set = mtk_dsi_bridge_mode_set,
 };
 
-- 
2.35.1


