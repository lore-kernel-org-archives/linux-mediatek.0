Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9F7EC6FD1D
	for <linux-mediatek@archiver.kernel.org>; Fri, 17 Mar 2023 08:22:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BNc/kHo5aLGE/5t+pmARrsiWsmKKjUhLotGyzn2m4ag=; b=4Pe2sDU0udTUteBiMUSLLDIigs
	kSE4aGCPNTOM6+uzebNYsGQpecVJHJfyT7t9IIgbGEoGPWz/55xsU0vvG7DVeopwo/pU9hzNXe2AG
	tEoxluGtpKJlFJzMUSFjgI49Le12u9ZjULMUsuMGnCPFjP6je71Fks8LJJoqkskzLk+1LYhFYKAEm
	ntBV0+hzfl7SNp3BztGpXozWEgC08BoyI3W+0GeRwIHEDb1BUFvdR+gC4WRcKIFae03cmIxXd2Pxs
	gJLtUPNBjjnOsr3GIXt0PJR7FGM3dijjOmMQIH0zDCdpfpS74pnC60C6RrzmI8ZcoBmuPS8nSuCqp
	4+SaHiiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pd5MJ-001SRi-2y;
	Fri, 17 Mar 2023 08:22:43 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pd5MC-001SNK-02;
	Fri, 17 Mar 2023 08:22:38 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 999446221B;
	Fri, 17 Mar 2023 08:22:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 46FA0C433D2;
	Fri, 17 Mar 2023 08:22:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1679041355;
	bh=4rP7Q179tbTvCSUKwAzPPtZsKqDUSIpQRWF6HpGnePA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=dVhwKFKiV1cxOEDYVLNmAw+Ttc+ctOvR2CMYxrlVnt5c+VR+IBkiBEBXvfg4c+P2v
	 ww7kr5s7k0Ey/V+3DcdmZDySMEd0l/S+lZkzunftFdGpb3UB62OIqwSJ4taQm24DED
	 y9aFiwIogQBsz8EOkTbSIocdmHV/pv+MlsBqtdCpebFetJPmUUMVvePRnzSIshTvqZ
	 QLuPPNREusjSJNG5CmkLB7l9yW5QnI2VtPQSYRbVyr5LrfCvYIJJsw2NNjf5e7kPr8
	 RCB/dy8Tc9+fyirQFGo4Hs90MNOmyddUAynKTBHkYq8337LYShi7p8CN8NrNvcQGTY
	 H72KsiFEsDZhw==
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
Subject: [PATCH 07/37] drm/mediatek/mtk_disp_aal: Remove half completed incorrect struct header
Date: Fri, 17 Mar 2023 08:16:48 +0000
Message-Id: <20230317081718.2650744-8-lee@kernel.org>
X-Mailer: git-send-email 2.40.0.rc1.284.g88254d51c5-goog
In-Reply-To: <20230317081718.2650744-1-lee@kernel.org>
References: <20230317081718.2650744-1-lee@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230317_012236_095483_53232A95 
X-CRM114-Status: GOOD (  11.62  )
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

 drivers/gpu/drm/mediatek/mtk_disp_aal.c:39: warning: Function parameter or member 'clk' not described in 'mtk_disp_aal'
 drivers/gpu/drm/mediatek/mtk_disp_aal.c:39: warning: Function parameter or member 'regs' not described in 'mtk_disp_aal'
 drivers/gpu/drm/mediatek/mtk_disp_aal.c:39: warning: Function parameter or member 'cmdq_reg' not described in 'mtk_disp_aal'
 drivers/gpu/drm/mediatek/mtk_disp_aal.c:39: warning: Function parameter or member 'data' not described in 'mtk_disp_aal'

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
 drivers/gpu/drm/mediatek/mtk_disp_aal.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_disp_aal.c b/drivers/gpu/drm/mediatek/mtk_disp_aal.c
index 434e8a9ce8ab7..d4e831c6f03cf 100644
--- a/drivers/gpu/drm/mediatek/mtk_disp_aal.c
+++ b/drivers/gpu/drm/mediatek/mtk_disp_aal.c
@@ -26,11 +26,6 @@ struct mtk_disp_aal_data {
 	bool has_gamma;
 };
 
-/**
- * struct mtk_disp_aal - DISP_AAL driver structure
- * @ddp_comp - structure containing type enum and hardware resources
- * @crtc - associated crtc to report irq events to
- */
 struct mtk_disp_aal {
 	struct clk *clk;
 	void __iomem *regs;
-- 
2.40.0.rc1.284.g88254d51c5-goog


