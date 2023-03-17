Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03CC8C7618A
	for <linux-mediatek@archiver.kernel.org>; Fri, 17 Mar 2023 08:22:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tR82841YXq01u+Ns0BoJf6InikHtayZLqONVcPoq4/s=; b=o2IbCZnq1FA3KyOK29DgKYXj6Y
	0NIpEh7fKv9rqD28PHx9eNu6UPnhabr1AOKxrbleAGbGls5BoRZ6GQPRfp3WHkoSKljOFSUhi11k9
	igg7TkxxmZUMOl/GnfpL9rP2/frdobB4D3pZORVGWPNWJIxJTSUCqB7J3zEKz4E43IPLuPI2MX377
	y4bdIRl1XOW8rMfmZVkVzino4KIdG0IVJ525ONb4YWO+Nx6LwiQX9/ryOZktlJ8PPMToqDpbzSmvZ
	Vt1std+T7q/E6JtHlGFAnJcLhwnPEMzdKVE7e5I/84kv2h42dGiWCNqFnBDaIwLckOJA52uszOrCP
	yqeju6Tg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pd5MQ-001SX1-1m;
	Fri, 17 Mar 2023 08:22:50 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pd5MG-001SPi-0J;
	Fri, 17 Mar 2023 08:22:41 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id C6535B824F3;
	Fri, 17 Mar 2023 08:22:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D7057C4339C;
	Fri, 17 Mar 2023 08:22:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1679041358;
	bh=AZ4f26d9dqcor4C6tToQIXogEQaco3qVRXdmtPvq5zk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Aph6c4rK6rPq7ZhNtTxNv+7HBTPhPdIWPAkXSFyUK/AA83IGHwANNoh+lPggxzzYD
	 hodMF7rLTU/hrq4i1dN6mvBtbdh9SmeYCuAKmw5sPh85dEeF606gEhVTrp/T3TxIew
	 +TiaTNz/t9+o4neTLR0lSQMzuEYpc4GFT/H/Eb4o2emS3C7rUBD2nL7Fg7i29uDJd3
	 wcPT1j4Axegq/QxuXdf4Nw3PeAY3DPeVXXWa7nJprSlZ1EfcOSgWE4CTR6WPWmI8nj
	 PkMFvKkWIl64UOUg+namCJ59KjEnKlpKbJgi1Rw39d5G1ha9pDUFPVgPU+XKJKjYLr
	 KoICkQ8HngDhw==
From: Lee Jones <lee@kernel.org>
To: lee@kernel.org,
	dri-devel@lists.freedesktop.org
Cc: linux-kernel@vger.kernel.org,
	Chun-Kuang Hu <chunkuang.hu@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	David Airlie <airlied@gmail.com>,
	Daniel Vetter <daniel@ffwll.ch>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH 08/37] drm/mediatek/mtk_disp_ccorr: Remove half completed incorrect struct header
Date: Fri, 17 Mar 2023 08:16:49 +0000
Message-Id: <20230317081718.2650744-9-lee@kernel.org>
X-Mailer: git-send-email 2.40.0.rc1.284.g88254d51c5-goog
In-Reply-To: <20230317081718.2650744-1-lee@kernel.org>
References: <20230317081718.2650744-1-lee@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230317_012240_309569_6E3798CA 
X-CRM114-Status: GOOD (  11.73  )
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

Fixes the following W=1 kernel build warning(s):

 drivers/gpu/drm/mediatek/mtk_disp_ccorr.c:47: warning: Function parameter or member 'clk' not described in 'mtk_disp_ccorr'
 drivers/gpu/drm/mediatek/mtk_disp_ccorr.c:47: warning: Function parameter or member 'regs' not described in 'mtk_disp_ccorr'
 drivers/gpu/drm/mediatek/mtk_disp_ccorr.c:47: warning: Function parameter or member 'cmdq_reg' not described in 'mtk_disp_ccorr'
 drivers/gpu/drm/mediatek/mtk_disp_ccorr.c:47: warning: Function parameter or member 'data' not described in 'mtk_disp_ccorr'

Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Cc: Philipp Zabel <p.zabel@pengutronix.de>
Cc: David Airlie <airlied@gmail.com>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: Matthias Brugger <matthias.bgg@gmail.com>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: dri-devel@lists.freedesktop.org
Cc: linux-mediatek@lists.infradead.org
Cc: linux-arm-kernel@lists.infradead.org
Signed-off-by: Lee Jones <lee@kernel.org>
---
 drivers/gpu/drm/mediatek/mtk_disp_ccorr.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_disp_ccorr.c b/drivers/gpu/drm/mediatek/mtk_disp_ccorr.c
index 1773379b24398..720f3c7ef7b4f 100644
--- a/drivers/gpu/drm/mediatek/mtk_disp_ccorr.c
+++ b/drivers/gpu/drm/mediatek/mtk_disp_ccorr.c
@@ -34,11 +34,6 @@ struct mtk_disp_ccorr_data {
 	u32 matrix_bits;
 };
 
-/**
- * struct mtk_disp_ccorr - DISP_CCORR driver structure
- * @ddp_comp - structure containing type enum and hardware resources
- * @crtc - associated crtc to report irq events to
- */
 struct mtk_disp_ccorr {
 	struct clk *clk;
 	void __iomem *regs;
-- 
2.40.0.rc1.284.g88254d51c5-goog


