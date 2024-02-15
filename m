Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CA20C48BC4
	for <linux-mediatek@archiver.kernel.org>; Thu, 15 Feb 2024 00:50:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6RSd2DDnlN3L/G9mxlDsQpMLI2Qm5CBaJZVyRwPA2jc=; b=YjvA/5+f3IL9b+f1bRZU30WZXE
	w936/kiJMZz9EF09O4UWBkn2S+tAyNLaEtHWtbgrZvO5bZ+6BBavHC3D+YW4AiL1x+gpH53Lc1hUy
	p/d43tzBV16xb9XFXiOdeAVhCzCpC6+kI32NMU+JmK4sTU8KzioJcM4mAYTADaYOnRYLrDflgf/Ml
	py1iNHhO4p5fwdGLYGXIWSb67xbyjsyEXK8ZNkwYUqIu+3AZ6cPmfA31Jvxud4sVTL6JVDKIhgIHP
	7g02rWjt8aEDKKSvOp25K/fVpoL5TGKL/TANa2/t47QZc+KBGVCH9WwGF63utJfTOW78toZVU/GXD
	eMQsezqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1raPxE-0000000EhAc-2hj7;
	Thu, 15 Feb 2024 00:50:20 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1raPx1-0000000Eh1V-0MBg;
	Thu, 15 Feb 2024 00:50:09 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 71C2661BD2;
	Thu, 15 Feb 2024 00:50:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5A4F4C43399;
	Thu, 15 Feb 2024 00:50:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1707958206;
	bh=BIeHFKJRxR/tz+Sb8qGs+H0wGg4wyyBVsQF9o4cfHQk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Y4SrMWPnJV/p3bkb6Gqik+U8yVgMiHSaXZ2VoWYqDv4tEPx1IplKfi+xQ9JU6c7aN
	 IhoGPmnD1tv6m4jNlkwm3zx4N+H5phQSJ2R29PMi58bklwg+DxKDGF2MlkIuYaXmCy
	 e+O3y4IRXhgCCXxQMnK98rVo+JuRmvV8SVK8d7evJaQoLGBPFBdjobgmJnMpQqYsqD
	 3Ecyx2IoAIROaYYLuYf0eiClE6h0LkrM8jyEZuHGj/vLxfKU/0KcyXxpkYmMBwvMfq
	 P8i+QjTcFM2JPbVup8YBrwDJF4Lzmg0v3iXw5IYb1LtfATbe8EZCSMqlX89QN70CY/
	 Or9UNM/yIQifA==
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
To: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Subject: [PATCH 2/9] soc: mediatek: cmdq: Add parameter shift_pa to cmdq_pkt_jump()
Date: Thu, 15 Feb 2024 00:49:24 +0000
Message-Id: <20240215004931.3808-3-chunkuang.hu@kernel.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240215004931.3808-1-chunkuang.hu@kernel.org>
References: <20240215004931.3808-1-chunkuang.hu@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240214_165007_297359_FC07EFDE 
X-CRM114-Status: GOOD (  11.64  )
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

In original design, cmdq_pkt_jump() call cmdq_get_shift_pa() every
time to get shift_pa. But the shift_pa is constant value for each
SoC, so client driver just need to call cmdq_get_shift_pa() once
and pass shift_pa to cmdq_pkt_jump() to prevent frequent function
call.

Signed-off-by: Chun-Kuang Hu <chunkuang.hu@kernel.org>
---
 drivers/soc/mediatek/mtk-cmdq-helper.c | 5 ++---
 include/linux/soc/mediatek/mtk-cmdq.h  | 6 ++++--
 2 files changed, 6 insertions(+), 5 deletions(-)

diff --git a/drivers/soc/mediatek/mtk-cmdq-helper.c b/drivers/soc/mediatek/mtk-cmdq-helper.c
index 67e17974d1e6..ed4ef95adf5b 100644
--- a/drivers/soc/mediatek/mtk-cmdq-helper.c
+++ b/drivers/soc/mediatek/mtk-cmdq-helper.c
@@ -348,14 +348,13 @@ int cmdq_pkt_assign(struct cmdq_pkt *pkt, u16 reg_idx, u32 value)
 }
 EXPORT_SYMBOL(cmdq_pkt_assign);
 
-int cmdq_pkt_jump(struct cmdq_pkt *pkt, dma_addr_t addr)
+int cmdq_pkt_jump(struct cmdq_pkt *pkt, dma_addr_t addr, u8 shift_pa)
 {
 	struct cmdq_instruction inst = {};
 
 	inst.op = CMDQ_CODE_JUMP;
 	inst.offset = CMDQ_JUMP_RELATIVE;
-	inst.value = addr >>
-		cmdq_get_shift_pa(((struct cmdq_client *)pkt->cl)->chan);
+	inst.value = addr >> shift_pa;
 	return cmdq_pkt_append_command(pkt, inst);
 }
 EXPORT_SYMBOL(cmdq_pkt_jump);
diff --git a/include/linux/soc/mediatek/mtk-cmdq.h b/include/linux/soc/mediatek/mtk-cmdq.h
index 6c42d817d368..6215191a328d 100644
--- a/include/linux/soc/mediatek/mtk-cmdq.h
+++ b/include/linux/soc/mediatek/mtk-cmdq.h
@@ -238,10 +238,12 @@ int cmdq_pkt_assign(struct cmdq_pkt *pkt, u16 reg_idx, u32 value);
  *		     a physical address which should contains more instruction.
  * @pkt:        the CMDQ packet
  * @addr:       physical address of target instruction buffer
+ * @shift_pa:	shift bits of physical address in CMDQ instruction. This value
+ *		is got by cmdq_get_shift_pa().
  *
  * Return: 0 for success; else the error code is returned
  */
-int cmdq_pkt_jump(struct cmdq_pkt *pkt, dma_addr_t addr);
+int cmdq_pkt_jump(struct cmdq_pkt *pkt, dma_addr_t addr, u8 shift_pa);
 
 /**
  * cmdq_pkt_finalize() - Append EOC and jump command to pkt.
@@ -339,7 +341,7 @@ static inline int cmdq_pkt_assign(struct cmdq_pkt *pkt, u16 reg_idx, u32 value)
 	return -EINVAL;
 }
 
-static inline int cmdq_pkt_jump(struct cmdq_pkt *pkt, dma_addr_t addr)
+static inline int cmdq_pkt_jump(struct cmdq_pkt *pkt, dma_addr_t addr, u8 shift_pa)
 {
 	return -EINVAL;
 }
-- 
2.34.1


