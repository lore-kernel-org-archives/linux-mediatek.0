Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6472AC48BC3
	for <linux-mediatek@archiver.kernel.org>; Thu, 15 Feb 2024 00:50:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TL24nmqzcuN/aA6k9o6mlcLy+zY4riqwYRuIiIlz3yM=; b=ViLRRZmcA7sNHhe0+RvGrmodVY
	8e1pwbC/DlpkRtlv7LJyJvvE16lXJMHxfEtLysqedGU1/Hel68AX7VbHMgOVkSZuZt5AQWhl/JRWh
	5063bIBxpFzScjcYPkI5RlA56boy3wKuEJPvH0sb5SgScSYtc6jsvA9yMwo1Lx65zE+13GG7AmTVP
	hTKMMYGU3lvzhOup++mRgiF/qLHp+nTRBGo85Iq9BOcnzPfHZNAAZ2yVl+y+y+JPe3EIqGu91Tksy
	9PG0tnfc4o9SQJeI4P1+7v3hmndSReOKKLwPnKYr/rwIAOEdGtWNCqXOXYT5EQwCZRkzjW+necHZN
	pgGw9IFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1raPxJ-0000000EhFl-2D2E;
	Thu, 15 Feb 2024 00:50:25 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1raPx5-0000000Eh4U-2Svb;
	Thu, 15 Feb 2024 00:50:13 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 1702061BAC;
	Thu, 15 Feb 2024 00:50:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 04E13C433F1;
	Thu, 15 Feb 2024 00:50:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1707958210;
	bh=7Y5HUcTOOASw7q/i66H/i3KoMA/Mx0KFs62yKsM7Q3U=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=BG8swuC7G7o0rc6PZD+BP6DnZFqHhFPMSq6dQMm688+1cJOISJSAFtHpXi2YZs7Ol
	 WeM5Fd70Is5xAllHt8MST0VoNH9/LjZeSNVZrZsaMs/kgdrFr9/8iIkpehRk2W+Ne3
	 aJyHnj0GkzPRAbiJdEgODAgTUqlsO12INSZffnQsk1XIV+W8jI2vYWyvUYgddYR8Fl
	 BOHn13x+9jah2yOtFMQAJIB8uo9dfOc1Z9GYHhvFdWyLACPuFqdbel/LDDss5AGfc4
	 A3+Qn1MAxuyNIig+Xz/u5MAzjDAUoHUbC44eYRyOfN2e1QnoaavfLaCGt/CNTO7wOn
	 ZNF7737Oj0biw==
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
To: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Subject: [PATCH 4/9] soc: mediatek: cmdq: Add cmdq_pkt_nop() helper function
Date: Thu, 15 Feb 2024 00:49:26 +0000
Message-Id: <20240215004931.3808-5-chunkuang.hu@kernel.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240215004931.3808-1-chunkuang.hu@kernel.org>
References: <20240215004931.3808-1-chunkuang.hu@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240214_165011_751561_28968F0C 
X-CRM114-Status: GOOD (  11.66  )
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

cmdq_pkt_nop() append nop command to the packet. nop command ask
GCE to do no operation.

Signed-off-by: Chun-Kuang Hu <chunkuang.hu@kernel.org>
---
 drivers/soc/mediatek/mtk-cmdq-helper.c | 11 +++++++++++
 include/linux/soc/mediatek/mtk-cmdq.h  | 16 ++++++++++++++++
 2 files changed, 27 insertions(+)

diff --git a/drivers/soc/mediatek/mtk-cmdq-helper.c b/drivers/soc/mediatek/mtk-cmdq-helper.c
index e982997117c2..1be950b4ec7f 100644
--- a/drivers/soc/mediatek/mtk-cmdq-helper.c
+++ b/drivers/soc/mediatek/mtk-cmdq-helper.c
@@ -369,6 +369,17 @@ int cmdq_pkt_eoc(struct cmdq_pkt *pkt)
 }
 EXPORT_SYMBOL(cmdq_pkt_eoc);
 
+int cmdq_pkt_nop(struct cmdq_pkt *pkt, u8 shift_pa)
+{
+	struct cmdq_instruction inst = { {0} };
+
+	/* Jumping to next instruction is equal to no operation */
+	inst.op = CMDQ_CODE_JUMP;
+	inst.value = CMDQ_INST_SIZE >> shift_pa;
+	return cmdq_pkt_append_command(pkt, inst);
+}
+EXPORT_SYMBOL(cmdq_pkt_nop);
+
 int cmdq_pkt_finalize(struct cmdq_pkt *pkt)
 {
 	struct cmdq_instruction inst = { {0} };
diff --git a/include/linux/soc/mediatek/mtk-cmdq.h b/include/linux/soc/mediatek/mtk-cmdq.h
index a67f719dec0b..8179ba5238f9 100644
--- a/include/linux/soc/mediatek/mtk-cmdq.h
+++ b/include/linux/soc/mediatek/mtk-cmdq.h
@@ -255,6 +255,17 @@ int cmdq_pkt_jump(struct cmdq_pkt *pkt, dma_addr_t addr, u8 shift_pa);
  */
 int cmdq_pkt_eoc(struct cmdq_pkt *pkt);
 
+/**
+ * cmdq_pkt_nop() - Append nop command to the CMDQ packet, ask GCE
+ *		    to do no operation.
+ * @pkt:	the CMDQ packet
+ * @shift_pa:	shift bits of physical address in CMDQ instruction. This value
+ *		is got by cmdq_get_shift_pa().
+ *
+ * Return: 0 for success; else the error code is returned
+ */
+int cmdq_pkt_nop(struct cmdq_pkt *pkt, u8 shift_pa);
+
 /**
  * cmdq_pkt_finalize() - Append EOC and jump command to pkt.
  * @pkt:	the CMDQ packet
@@ -361,6 +372,11 @@ static inline int cmdq_pkt_eoc(struct cmdq_pkt *pkt)
 	return -EINVAL;
 }
 
+static inline int cmdq_pkt_nop(struct cmdq_pkt *pkt, u8 shift_pa)
+{
+	return -EINVAL;
+}
+
 static inline int cmdq_pkt_finalize(struct cmdq_pkt *pkt)
 {
 	return -EINVAL;
-- 
2.34.1


