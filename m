Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB327C48BC3
	for <linux-mediatek@archiver.kernel.org>; Thu, 15 Feb 2024 00:50:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VmU5djMcZq3un9NXE8bxt+eQx9GKGrESkVjr84+O68E=; b=NWay+icZUA2bxk02HABusUUT0X
	RLVtksfJfQIdaLBAY9i1gnLD71APxcXfYu/jWXkIwYUA4F+QQUMFkwR1EHHv9UoOb3NhHk1jat53j
	Vvc9+erFjvgCEW5DyEP9FWgdVba+RC/sWhgZ8KiDnOAnmgHDCKj5xDSBKhm42EikPjcfrH9f4ws4T
	9hfUk3ph2FXhs2hHJ7BK5hOaFV59IvaarPRpmPy2H/Ew5viyzcggrgnznVUJCffJTX34E9xMv9fCm
	cY+DfPIsy36iYxQ8amksdrrxSodJSB5dmpuQzdxRtZpVCc7Rr++tuEoVqjdjUB4VSIAp4Is+hNTX+
	KbQ7GpPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1raPxN-0000000EhJ6-0v4H;
	Thu, 15 Feb 2024 00:50:29 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1raPx8-0000000Eh69-0UgI;
	Thu, 15 Feb 2024 00:50:15 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 96F056125A;
	Thu, 15 Feb 2024 00:50:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 52FCAC433F1;
	Thu, 15 Feb 2024 00:50:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1707958213;
	bh=TyYfmOPE/p3NSd8TeId10uLJdlRXk+ZcnArj63ZnB78=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=bqp3Z+5F53mWZq048afnxrfe7nQprPLQu+KBQWmQOH2mkqI5soXwZfsv99yhXWWta
	 tb3QXoONODumGhTKQw1KTG+7Wo4q0nB/ywNPFI3f63X1ZzP7JW51J4MMGlt6HsNq4P
	 6nz7CMPGf4tG/tB119Sg0av2sKA7Opvr6vVclFqutXXz5KPsfgLGl4qigdh1LdIhJH
	 NIq1RPhRv7OQZNNhTHK76OSiOSaLdQ8MOMKhV4Xyv7Ya4K65hDpLW3IxgpXfDIXCAp
	 BDJjBTB9O9x0iwIlkX8tQlYVApISqlTPIAnmKKwY/1Eyz91MyxaCFXc/XTp3XbpsW9
	 kXm/K4qhZZD4g==
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
To: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Subject: [PATCH 5/9] drm/mediatek: Drop calling cmdq_pkt_finalize()
Date: Thu, 15 Feb 2024 00:49:27 +0000
Message-Id: <20240215004931.3808-6-chunkuang.hu@kernel.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240215004931.3808-1-chunkuang.hu@kernel.org>
References: <20240215004931.3808-1-chunkuang.hu@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240214_165014_244348_7BA31558 
X-CRM114-Status: GOOD (  11.02  )
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
 drivers/gpu/drm/mediatek/mtk_drm_crtc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c b/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
index c729af3b9822..df693fa268ce 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
@@ -593,7 +593,7 @@ static void mtk_drm_crtc_update_config(struct mtk_drm_crtc *mtk_crtc,
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


