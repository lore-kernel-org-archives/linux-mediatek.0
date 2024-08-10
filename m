Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC3CFC3DA4A
	for <linux-mediatek@archiver.kernel.org>; Sat, 10 Aug 2024 09:10:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KNUDmYYqrYKjDoKMvGv2n93FMEe5Q2uVe/MuCTrxOXU=; b=VpwWblW4NjzvSKACNdbO7x99rV
	nrW9d7F7+TTWPEFSfHMG5PpPXThf/wf8ac1jCkVhjUfor5TDrafG6AC4KkGaRDKIrmN9f38cFIUbW
	35CVv0WWc11jw1q/9pqoZy29ozes9LHY/Fncf7h9nqZ7IYbnRMugMoHcWTARg3hRsyP3K3tk6O+gn
	+yJJzgAH8rOS6XxGMYjBKnGzt26TBVgO1CScKWGqy+ILpjxj8dZoZs4NIba9ck+6QcO1DPr7OibFL
	6nplbDMgVNShbDxtOGzLCJ+CwMx81/R6Wx8rjG6ISYMrUVzzk7kS5BnOlOgYoSr5bFPd6gyRZKZMS
	ZcqiV64g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sci7X-0000000DmqA-1sAb;
	Sat, 10 Aug 2024 09:10:43 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sci6M-0000000DmCl-3gWz;
	Sat, 10 Aug 2024 09:09:32 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 03DFE60684;
	Sat, 10 Aug 2024 09:09:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 279A2C4AF0C;
	Sat, 10 Aug 2024 09:09:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1723280969;
	bh=1Fnww6k0nGJSxPsTeSzHvQo4ix8VyOpPTfrw4z8M81Y=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=WLUMjZlcnxAJA6zW3HW/7RPikZOue9Bm8r+LiundHSKLCNTdC6ej9p0aF5WeSbuJC
	 hvJs8PijYz5AiE2t/oB6iC9K0aO8Bkt2ars/onu/nrK/sKHkZLVmNb+FC+EWR4QrOR
	 Te2EtXMZRRDO1Ca6fj4joLczo3X/dGn34gNSu1MTnUIXFY2l0EyLTLnugGF72IfVPK
	 bdH65meJw6tYfRScQyEk/urPQjo8r116QEktU2oce+vbgKryChKjq7lmuVU1KG2Ub7
	 6TKupH1i79E2oeIp7Zbi3SCErDTY4LjRFrcBmEEscOVFeLTGCuoC3QKGqgzU+7RQXc
	 k6iamFwZq0rfA==
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
To: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Moudy Ho <moudy.ho@mediatek.com>,
	"Jason-JH . Lin" <jason-jh.lin@mediatek.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Subject: [PATCH v3 1/5] drm/mediatek: Use cmdq_pkt_eoc() instead of cmdq_pkt_finalize()
Date: Sat, 10 Aug 2024 09:09:14 +0000
Message-Id: <20240810090918.7457-2-chunkuang.hu@kernel.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240810090918.7457-1-chunkuang.hu@kernel.org>
References: <20240810090918.7457-1-chunkuang.hu@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240810_020931_016936_3C4BACD0 
X-CRM114-Status: GOOD (  11.06  )
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

For some client driver, it want to reduce latency between excuting
previous packet command and next packet command, so append jump
command to the end of previous packet and the jump destination
address is the start address of next packet command buffer. Before
next packet exist, the previous packet has no information of where
to jump to, so append nop command first. When next packet exist,
change nop command to jump command. For mediatek drm driver, it
never has next packet, so appending nop command is redundant.
Because cmdq_pkt_finalize() would append nop command, so change
calling cmdq_pkt_finalize() to cmdq_pkt_eoc() to prevent append
redundant nop command.

Signed-off-by: Chun-Kuang Hu <chunkuang.hu@kernel.org>
---
 drivers/gpu/drm/mediatek/mtk_crtc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_crtc.c b/drivers/gpu/drm/mediatek/mtk_crtc.c
index 6f34f573e127..a1976c3ae001 100644
--- a/drivers/gpu/drm/mediatek/mtk_crtc.c
+++ b/drivers/gpu/drm/mediatek/mtk_crtc.c
@@ -607,7 +607,7 @@ static void mtk_crtc_update_config(struct mtk_crtc *mtk_crtc, bool needs_vblank)
 		cmdq_pkt_clear_event(cmdq_handle, mtk_crtc->cmdq_event);
 		cmdq_pkt_wfe(cmdq_handle, mtk_crtc->cmdq_event, false);
 		mtk_crtc_ddp_config(crtc, cmdq_handle);
-		cmdq_pkt_finalize(cmdq_handle);
+		cmdq_pkt_eoc(cmdq_handle);
 		dma_sync_single_for_device(mtk_crtc->cmdq_client.chan->mbox->dev,
 					   cmdq_handle->pa_base,
 					   cmdq_handle->cmd_buf_size,
-- 
2.34.1


