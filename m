Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8CDDCAC5A7
	for <linux-mediatek@archiver.kernel.org>; Tue, 23 Sep 2025 15:26:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+Nv6lp70DAL3P9JVoaFhTvOM1f4uo5xLsdu11gYZslw=; b=tyN+XPh14OxbnYVORv0vOOXfhe
	9a7F/ZSssu5ot+SuxUcLl78qyCitfCv9vBi2aDIdDozq3lo5TpoeZxeEqsCWvGVqFQR/D5A7w1yBc
	B4V3o9834UuIKReBqsFp5KnZPkzvyD5XkaTLu3MFLR1XGwNVuoCmo4/hl1fTgbhDqsUtOLQ4K9XTV
	0wKdlPYZLYZm38QoSafDn4Y/4JkVy+tr6aPdhybd7PD8xh380lnMVb1EuXvvCGGPoD7Sf5tv/DhRL
	qLe6sc4oupwR4k66cogpAtDchg0cwl4XhcTIWxQAlZvOdEGb15kMtkKiaEXphx/VgCRyv4qktsATK
	TAHssttw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v14uJ-0000000E2Ru-09v9;
	Tue, 23 Sep 2025 15:26:19 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v14uD-0000000E2LQ-0tVa
	for linux-mediatek@lists.infradead.org;
	Tue, 23 Sep 2025 15:26:15 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id D5375439CF;
	Tue, 23 Sep 2025 15:26:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B8D40C113D0;
	Tue, 23 Sep 2025 15:26:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758641172;
	bh=600+gl2y/5DXDE8JzKJY5V6QLYLeY4g2SnvrcP9hV44=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=EUTeYdA5pQktnE96dmZRLl7V/ujUZJQApclxLmczzcUy0dOOVY1AQUPIhKrP4a4W6
	 E0wDpFyjZjf0N4zCEjTTJF8oeH8vvlgfGpoet8ohApUcbg/YKUI/CtcHNaOZhkPxxr
	 65AYe+vUh/tfzo2kgh2b0YwzqXLrLtDyAQrVTm+xjio27qXRcuy82p0eyrfsBX0Cgq
	 hAy4L6BlL9j+3vvOszbzOIvnWNqsZ4Cbn+xMa9nglrtaIV/b8XYtDpnhC2kPjwolQs
	 MNeC5vhqdPPNX2sIbHnAVjzYottYaeeuF24Yu4Jx6m6PlDhg53GljSEBIbzz/Dpzzb
	 4Q+0d0WHkoJJg==
Received: from johan by xi.lan with local (Exim 4.98.2)
	(envelope-from <johan@kernel.org>)
	id 1v14u6-000000004mq-46Hf;
	Tue, 23 Sep 2025 17:26:07 +0200
From: Johan Hovold <johan@kernel.org>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>
Cc: David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	dri-devel@lists.freedesktop.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Johan Hovold <johan@kernel.org>,
	stable@vger.kernel.org,
	CK Hu <ck.hu@mediatek.com>
Subject: [PATCH 2/5] drm/mediatek: fix probe memory leak
Date: Tue, 23 Sep 2025 17:23:37 +0200
Message-ID: <20250923152340.18234-3-johan@kernel.org>
X-Mailer: git-send-email 2.49.1
In-Reply-To: <20250923152340.18234-1-johan@kernel.org>
References: <20250923152340.18234-1-johan@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250923_082613_274282_DCC71D02 
X-CRM114-Status: GOOD (  12.70  )
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

The Mediatek DRM driver allocates private data for components without a
platform driver but as the lifetime is tied to each component device,
the memory is never freed.

Tie the allocation lifetime to the DRM platform device so that the
memory is released on probe failure (e.g. probe deferral) and when the
driver is unbound.

Fixes: c0d36de868a6 ("drm/mediatek: Move clk info from struct mtk_ddp_comp to sub driver private data")
Cc: stable@vger.kernel.org	# 5.12
Cc: CK Hu <ck.hu@mediatek.com>
Signed-off-by: Johan Hovold <johan@kernel.org>
---
 drivers/gpu/drm/mediatek/mtk_ddp_comp.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_ddp_comp.c b/drivers/gpu/drm/mediatek/mtk_ddp_comp.c
index 0264017806ad..31d67a131c50 100644
--- a/drivers/gpu/drm/mediatek/mtk_ddp_comp.c
+++ b/drivers/gpu/drm/mediatek/mtk_ddp_comp.c
@@ -671,7 +671,7 @@ int mtk_ddp_comp_init(struct device *dev, struct device_node *node, struct mtk_d
 	    type == MTK_DSI)
 		return 0;
 
-	priv = devm_kzalloc(comp->dev, sizeof(*priv), GFP_KERNEL);
+	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
 	if (!priv)
 		return -ENOMEM;
 
-- 
2.49.1


