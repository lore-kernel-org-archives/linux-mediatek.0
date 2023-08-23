Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A69DDEE49B9
	for <linux-mediatek@archiver.kernel.org>; Wed, 23 Aug 2023 13:16:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=sV7vYQTyiAy3nWGgqxmiyOUH3WUFfyCP18D7p2WE0W4=; b=EZXoLLWL4QKxA3ufQ8pKh31DNo
	qJuobtTQo7bLAtTQRd5fTs3MBx1FK3tgeHRYUSRBdUi5WTRfXFORgDrO71aoQe6DCpjuL2uUP29Vf
	lPoUNBYN6QyTYFPo2sbqe10RcqBnerUaXrD0aRPxJ2KOp59UGNin1/l277tWBo349s6DrzNsNZalr
	uaqbq7IjaBtWwaM9cuRjsQPwlTSO/tRvi99u0Bw+5t/izBqV5kL9M/YF0oiJfyFAfr1ypH04Yk3oI
	Q3btpmVyi6vcVrq2E4sHgoRUFMVROTz2nRMUXbi7lW3gYoWidAWbmHuM+0nuc/W/wR4qZHxO1vQYN
	9Uwotczg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qYnj1-000dfj-1F;
	Wed, 23 Aug 2023 13:16:43 +0000
Received: from mail.ispras.ru ([83.149.199.84])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qYnid-000dHu-2j;
	Wed, 23 Aug 2023 13:16:21 +0000
Received: from lvc-arm12.ispras.local (unknown [83.149.199.126])
	by mail.ispras.ru (Postfix) with ESMTPSA id ABAB840F1DF0;
	Wed, 23 Aug 2023 13:16:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.ispras.ru ABAB840F1DF0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ispras.ru;
	s=default; t=1692796572;
	bh=sV7vYQTyiAy3nWGgqxmiyOUH3WUFfyCP18D7p2WE0W4=;
	h=From:To:Cc:Subject:Date:From;
	b=lr9dSMDK0+Z2UduJ9y/kFVIhW9+SRTiDbNkUlken3blmfvBYbdbLOJWl/PBxt7iqE
	 MGWQwTw0lnclYj86DXDWr+nQ/YN5DDFdBqChE93J8wQbiMY2SaNHxhYtd43m+vJlUr
	 all6a9W/shqONNfNY+r9Xpm5eAn0aUhf5xK9Gv4I=
From: Katya Orlova <e.orlova@ispras.ru>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Cc: Katya Orlova <e.orlova@ispras.ru>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	David Airlie <airlied@gmail.com>,
	Daniel Vetter <daniel@ffwll.ch>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	dri-devel@lists.freedesktop.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	lvc-project@linuxtesting.org
Subject: [PATCH] drm/mediatek: mtk_drm_crtc: Avoid inappropriate kfree() in
Date: Wed, 23 Aug 2023 16:15:38 +0300
Message-Id: <20230823131538.29222-1-e.orlova@ispras.ru>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230823_061620_081985_059289DC 
X-CRM114-Status: UNSURE (   8.79  )
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

mtk_drm_crtc_create() and mtk_drm_cmdq_pkt_destroy() are called with
argument 'pkt' pointed to a field 'cmdq_handle' of 'mtk_crtc' structure.
There is no need to kfree it.

Found by Linux Verification Center (linuxtesting.org) with SVACE.

Fixes: 7627122fd1c0 ("drm/mediatek: Add cmdq_handle in mtk_crtc")
Signed-off-by: Katya Orlova <e.orlova@ispras.ru>
---
 drivers/gpu/drm/mediatek/mtk_drm_crtc.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c b/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
index d40142842f85..ba7307efa675 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
@@ -117,7 +117,6 @@ static int mtk_drm_cmdq_pkt_create(struct cmdq_client *client, struct cmdq_pkt *
 
 	pkt->va_base = kzalloc(size, GFP_KERNEL);
 	if (!pkt->va_base) {
-		kfree(pkt);
 		return -ENOMEM;
 	}
 	pkt->buf_size = size;
@@ -129,7 +128,6 @@ static int mtk_drm_cmdq_pkt_create(struct cmdq_client *client, struct cmdq_pkt *
 	if (dma_mapping_error(dev, dma_addr)) {
 		dev_err(dev, "dma map failed, size=%u\n", (u32)(u64)size);
 		kfree(pkt->va_base);
-		kfree(pkt);
 		return -ENOMEM;
 	}
 
@@ -145,7 +143,6 @@ static void mtk_drm_cmdq_pkt_destroy(struct cmdq_pkt *pkt)
 	dma_unmap_single(client->chan->mbox->dev, pkt->pa_base, pkt->buf_size,
 			 DMA_TO_DEVICE);
 	kfree(pkt->va_base);
-	kfree(pkt);
 }
 #endif
 
-- 
2.30.2


