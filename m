Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A90F2C5479F
	for <linux-mediatek@archiver.kernel.org>; Thu, 22 Feb 2024 15:42:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tibavudpFNMz4Vu/p5JkrX7wcDRf9WI90wwL3kzLuxM=; b=cLLB00DOe3HMLXVq5++z071NOu
	gvYroMf1NjNRACGSky/pJm70e+Q3emTYKyvMeSXJGZv7iil1i/ZmjKGqSnrTMv6HqBxXGgLmtzY9m
	qylkldD/UaQSmMGpgVh+CbGYH1gtByvOF6PH6HCNBIXGD0dCcfz3f/5ZQ++k5BFwsp0YKAkz99qp+
	Jo7TiH/zgcxc/uPpx8dsF42ehqPaTpS8YT/IZLlcA0IofKZ0uXnYaL/sGOCp2ARG0l3Xr18JNZZc+
	ysdYb7dJ1HodMkWmZwYAGew8zqXYiuTr5OQEEedd/yYHDi13Jp73QY4JXEEMjBgUkZc7HJgZtwVVT
	fTXCycJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rdBD9-00000005RxK-1JMy;
	Thu, 22 Feb 2024 15:42:11 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rdBCe-00000005RWQ-2thM;
	Thu, 22 Feb 2024 15:41:42 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 7FEC4CE282E;
	Thu, 22 Feb 2024 15:41:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A7D8EC43399;
	Thu, 22 Feb 2024 15:41:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1708616498;
	bh=76oWXYBZv2prDrLhgaX7zuBp9oiheXSqhINTrAxFSR4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=OlgSv9Wa5S0L2u5ow7ycezogfX4uqzAYLRTpryMDSktjrYQUbEZyLX6IcEYb4enmF
	 xXr3lMYIj5V/BPZy1PzXBoEWf3LePahwi67LfmVgs6HHwxrYlWXMxh425+yAReLR7j
	 patZ/IuMbHYFz/Gf/axHJdGpRHHTdLgVdkTLFUqSfxLeWoUN9dHFtrxh5lVN6IU5cW
	 mFiiZV3u+5LAOU1JSlmD83m7BxJwWr/rFm0z6JLXbC02PWWXgZ9GeZrr1jbVIQl1cG
	 1WE35nA/eHBB6Bmv3yMoDrLh2oxjTek86CFPhmvSTu6JYyJVhmklSP/qGM+o3AsN2l
	 lL1H7ZR5We9Uw==
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
Subject: [PATCH v2 03/12] soc: mediatek: cmdq: Rename cmdq_pkt_jump() to cmdq_pkt_jump_abs()
Date: Thu, 22 Feb 2024 15:41:11 +0000
Message-Id: <20240222154120.16959-4-chunkuang.hu@kernel.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240222154120.16959-1-chunkuang.hu@kernel.org>
References: <20240222154120.16959-1-chunkuang.hu@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240222_074141_211031_4F240F07 
X-CRM114-Status: GOOD (  12.04  )
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

In order to distinguish absolute jump and relative jump,
cmdq_pkt_jump() append absolute jump command, so rename it to
cmdq_pkt_jump_abs().

Signed-off-by: Chun-Kuang Hu <chunkuang.hu@kernel.org>
---
 drivers/soc/mediatek/mtk-cmdq-helper.c |  4 ++--
 include/linux/soc/mediatek/mtk-cmdq.h  | 13 +++++++------
 2 files changed, 9 insertions(+), 8 deletions(-)

diff --git a/drivers/soc/mediatek/mtk-cmdq-helper.c b/drivers/soc/mediatek/mtk-cmdq-helper.c
index 3380e56dd69b..38d9077725d2 100644
--- a/drivers/soc/mediatek/mtk-cmdq-helper.c
+++ b/drivers/soc/mediatek/mtk-cmdq-helper.c
@@ -393,7 +393,7 @@ int cmdq_pkt_assign(struct cmdq_pkt *pkt, u16 reg_idx, u32 value)
 }
 EXPORT_SYMBOL(cmdq_pkt_assign);
 
-int cmdq_pkt_jump(struct cmdq_pkt *pkt, dma_addr_t addr, u8 shift_pa)
+int cmdq_pkt_jump_abs(struct cmdq_pkt *pkt, dma_addr_t addr, u8 shift_pa)
 {
 	struct cmdq_instruction inst = {};
 
@@ -402,7 +402,7 @@ int cmdq_pkt_jump(struct cmdq_pkt *pkt, dma_addr_t addr, u8 shift_pa)
 	inst.value = addr >> shift_pa;
 	return cmdq_pkt_append_command(pkt, inst);
 }
-EXPORT_SYMBOL(cmdq_pkt_jump);
+EXPORT_SYMBOL(cmdq_pkt_jump_abs);
 
 int cmdq_pkt_finalize(struct cmdq_pkt *pkt)
 {
diff --git a/include/linux/soc/mediatek/mtk-cmdq.h b/include/linux/soc/mediatek/mtk-cmdq.h
index 72adfd867cd9..f9b8608cb5d9 100644
--- a/include/linux/soc/mediatek/mtk-cmdq.h
+++ b/include/linux/soc/mediatek/mtk-cmdq.h
@@ -248,17 +248,18 @@ int cmdq_pkt_poll_mask(struct cmdq_pkt *pkt, u8 subsys,
 int cmdq_pkt_assign(struct cmdq_pkt *pkt, u16 reg_idx, u32 value);
 
 /**
- * cmdq_pkt_jump() - Append jump command to the CMDQ packet, ask GCE
- *		     to execute an instruction that change current thread PC to
- *		     a physical address which should contains more instruction.
+ * cmdq_pkt_jump_abs() - Append jump command to the CMDQ packet, ask GCE
+ *			 to execute an instruction that change current thread
+ *			 PC to a absolute physical address which should
+ *			 contains more instruction.
  * @pkt:        the CMDQ packet
- * @addr:       physical address of target instruction buffer
+ * @addr:       absolute physical address of target instruction buffer
  * @shift_pa:	shift bits of physical address in CMDQ instruction. This value
  *		is got by cmdq_get_shift_pa().
  *
  * Return: 0 for success; else the error code is returned
  */
-int cmdq_pkt_jump(struct cmdq_pkt *pkt, dma_addr_t addr, u8 shift_pa);
+int cmdq_pkt_jump_abs(struct cmdq_pkt *pkt, dma_addr_t addr, u8 shift_pa);
 
 /**
  * cmdq_pkt_finalize() - Append EOC and jump command to pkt.
@@ -376,7 +377,7 @@ static inline int cmdq_pkt_assign(struct cmdq_pkt *pkt, u16 reg_idx, u32 value)
 	return -EINVAL;
 }
 
-static inline int cmdq_pkt_jump(struct cmdq_pkt *pkt, dma_addr_t addr, u8 shift_pa)
+static inline int cmdq_pkt_jump_abs(struct cmdq_pkt *pkt, dma_addr_t addr, u8 shift_pa)
 {
 	return -EINVAL;
 }
-- 
2.34.1


