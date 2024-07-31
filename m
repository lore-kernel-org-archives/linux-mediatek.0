Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B475C3DA7F
	for <linux-mediatek@archiver.kernel.org>; Wed, 31 Jul 2024 20:15:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=KvZKRyocsrYnzIe6Ea0IVrZAPHBkjcmdFm5lbWSI5ck=; b=bp+oWaNVBZmjarNWZw5ighP4C+
	AQvy517RviGTvICxoSpLtzSTtMqqsPFavWueNAZ3X9wsMPqs+cuh+4E8qnn7Qd+jk2x1juMsTdug5
	1aR2pvuKSHtn64W1NPaAGxHQTFK5GDWWE/8TOOWClpaZ26jpleVya3cnq7irDIZW6Es1DpIrg4wxj
	apllOXIJTxLD66CBAcFgti6PvihiSCHIP6QUBFhktcawi8l4T3YHzp6qSnoxTfAYFjxlvkxaM2Udb
	+U7Eltg4Nzjfnf2VrKWdLcFN06ms2lXs022fd0ToOfM2q80LV5wk1RwpINlRngdeFZtY9Vf2dR489
	QiY6XwHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sZFj1-00000002PtT-3pmw;
	Wed, 31 Jul 2024 20:15:07 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sZFiW-00000002Pkb-3Ge8;
	Wed, 31 Jul 2024 20:14:38 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 12F8DCE17FC;
	Wed, 31 Jul 2024 20:14:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3D64AC116B1;
	Wed, 31 Jul 2024 20:14:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722456874;
	bh=k+eFhFAkd2vbO659Tkl+hTXfqcSphbMfOWrLbcB5eNc=;
	h=From:To:Cc:Subject:Date:From;
	b=MZfbnbOLcSYQGS24wxSinYk6YtSp0qohSW2c5/24M5tddywbO9PAtzykrouOjTy4L
	 KPQlvQIXqEPfjLgFJs4f9pai9XBTo6qJhoWhGyt10ACc+ne+hLMHNLqITK9AjXEHFK
	 mXGDl+9zpsVytZg72GXAWXAvGzsYMTWrmDXb7d672b367bk4tOk6Fs+z2or9J0HQ1h
	 x5caTkdc2jxd0NhTEFqU5AHLvY2zTnc6t/bDjiEQrO1TdNF4MDHiSX9eKfpc6aNy0m
	 0dvdWV/uukIpgYG9KtWz/ac58lruxw2JsryNEcP/4hfjCbysG5lM+dLAdziuvKWG0S
	 f8ixPWOmooAwA==
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	David Airlie <airlied@gmail.com>,
	Daniel Vetter <daniel@ffwll.ch>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: dri-devel@lists.freedesktop.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH] drm: mediatek: Drop unnecessary check for property presence
Date: Wed, 31 Jul 2024 14:13:56 -0600
Message-ID: <20240731201407.1838385-1-robh@kernel.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240731_131437_025304_51DE56B9 
X-CRM114-Status: GOOD (  12.28  )
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

of_property_read_u32() returns -EINVAL if a property is not present, so
the preceeding check for presence with of_find_property() can be
dropped. Really, what the errno is shouldn't matter. Either the property
can be read and used or it can't and is ignored.

This is part of a larger effort to remove callers of of_find_property()
and similar functions. of_find_property() leaks the DT struct property
and data pointers which is a problem for dynamically allocated nodes
which may be freed.

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
 drivers/gpu/drm/mediatek/mtk_disp_rdma.c | 13 +++++--------
 1 file changed, 5 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_disp_rdma.c b/drivers/gpu/drm/mediatek/mtk_disp_rdma.c
index 634bbba5d43f..07243f372260 100644
--- a/drivers/gpu/drm/mediatek/mtk_disp_rdma.c
+++ b/drivers/gpu/drm/mediatek/mtk_disp_rdma.c
@@ -341,14 +341,11 @@ static int mtk_disp_rdma_probe(struct platform_device *pdev)
 		dev_dbg(dev, "get mediatek,gce-client-reg fail!\n");
 #endif
 
-	if (of_find_property(dev->of_node, "mediatek,rdma-fifo-size", &ret)) {
-		ret = of_property_read_u32(dev->of_node,
-					   "mediatek,rdma-fifo-size",
-					   &priv->fifo_size);
-		if (ret)
-			return dev_err_probe(dev, ret,
-					     "Failed to get rdma fifo size\n");
-	}
+	ret = of_property_read_u32(dev->of_node,
+				   "mediatek,rdma-fifo-size",
+				   &priv->fifo_size);
+	if (ret && (ret != -EINVAL))
+		return dev_err_probe(dev, ret, "Failed to get rdma fifo size\n");
 
 	/* Disable and clear pending interrupts */
 	writel(0x0, priv->regs + DISP_REG_RDMA_INT_ENABLE);
-- 
2.43.0


