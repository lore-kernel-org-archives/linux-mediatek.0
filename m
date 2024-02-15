Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E49EC48BC4
	for <linux-mediatek@archiver.kernel.org>; Thu, 15 Feb 2024 00:50:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wktiZ7HUtb2+Q2NhWcelGAYCc1x/knQvGbZ7CeUFnZM=; b=KYKap/FHP3Pmg0pZHHbN7ou3gt
	sPU7Gbl/CLZ/UtjWElBirwA7NzJz2ZTsxYNGTKgVeQbm3zy20kHRZAOxXWxpIXINmR1C7y0hhu3Jc
	GbVlfHSLWE3VKCEn3pBZsmGFvvLWNJ48JtwoAUYBb7cwtEIYKtlYuxLALnw0KZ5xOhfpEUv+/n11M
	5npteZvKqrMCeKJJhHFP5E645/YKkqTDXZPTYK6FEDK7RmgemLIBeMGz5qP0Z+SsYOIyaAFtBVX9X
	J3L1YWt5xzIPDBQB4UumsxpKpLdL3GSQW0/3EDak33r8iboO9h4TbtwHu+3nASHJ1dbjCPp9hNjQG
	eLpaLrhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1raPxG-0000000EhCy-3qGN;
	Thu, 15 Feb 2024 00:50:22 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1raPx4-0000000Eh3Z-3vXV;
	Thu, 15 Feb 2024 00:50:12 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 4DA84CE249D;
	Thu, 15 Feb 2024 00:50:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AAE18C43390;
	Thu, 15 Feb 2024 00:50:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1707958208;
	bh=RwnPPmbshIPrHAhqt6nvIojZaFpX1mNKJof+jE1wWoo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=EdY468GL32M/G+gwv+w8ZLQRt22cvdi4p+clmYR7lBpR8Hz6COfk4WHL1LBt7E4pm
	 rCoGXVDTvlEr0RmzBpPCzDXjLkU7MWi0a0FBD494UymBcfDtsylmYnXgy6pa+HhaOo
	 V0+5zDNIK+lNekTH0wRZ5oUasQf9nGNaIAviARu649+NmdxAck0HrDrZtN49YYFtSf
	 XdvvPIENaud4rOP+MiXn+TpoEobLUoG/FseG+mML8ErNSHc8qcUXpmoknhmTS+T9by
	 azP5czVyz3ekp1ybTf1gJBsffPFcxUaYjVqhxx/udbcNPmsjkvOC5yLjv0CQvhzt5z
	 SQ+VXFjLwmO/A==
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
To: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Subject: [PATCH 3/9] soc: mediatek: cmdq: Add cmdq_pkt_eoc() helper function
Date: Thu, 15 Feb 2024 00:49:25 +0000
Message-Id: <20240215004931.3808-4-chunkuang.hu@kernel.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240215004931.3808-1-chunkuang.hu@kernel.org>
References: <20240215004931.3808-1-chunkuang.hu@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240214_165011_183892_A96918EC 
X-CRM114-Status: GOOD (  11.10  )
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

cmdq_pkt_eoc() append eoc command to CMDQ packet. eoc command
would ask GCE to generate IRQ. It's usually appended to the end
of packet to notify all command in the packet is done.

Signed-off-by: Chun-Kuang Hu <chunkuang.hu@kernel.org>
---
 drivers/soc/mediatek/mtk-cmdq-helper.c | 10 ++++++++++
 include/linux/soc/mediatek/mtk-cmdq.h  | 15 +++++++++++++++
 2 files changed, 25 insertions(+)

diff --git a/drivers/soc/mediatek/mtk-cmdq-helper.c b/drivers/soc/mediatek/mtk-cmdq-helper.c
index ed4ef95adf5b..e982997117c2 100644
--- a/drivers/soc/mediatek/mtk-cmdq-helper.c
+++ b/drivers/soc/mediatek/mtk-cmdq-helper.c
@@ -359,6 +359,16 @@ int cmdq_pkt_jump(struct cmdq_pkt *pkt, dma_addr_t addr, u8 shift_pa)
 }
 EXPORT_SYMBOL(cmdq_pkt_jump);
 
+int cmdq_pkt_eoc(struct cmdq_pkt *pkt)
+{
+	struct cmdq_instruction inst = { {0} };
+
+	inst.op = CMDQ_CODE_EOC;
+	inst.value = CMDQ_EOC_IRQ_EN;
+	return cmdq_pkt_append_command(pkt, inst);
+}
+EXPORT_SYMBOL(cmdq_pkt_eoc);
+
 int cmdq_pkt_finalize(struct cmdq_pkt *pkt)
 {
 	struct cmdq_instruction inst = { {0} };
diff --git a/include/linux/soc/mediatek/mtk-cmdq.h b/include/linux/soc/mediatek/mtk-cmdq.h
index 6215191a328d..a67f719dec0b 100644
--- a/include/linux/soc/mediatek/mtk-cmdq.h
+++ b/include/linux/soc/mediatek/mtk-cmdq.h
@@ -245,6 +245,16 @@ int cmdq_pkt_assign(struct cmdq_pkt *pkt, u16 reg_idx, u32 value);
  */
 int cmdq_pkt_jump(struct cmdq_pkt *pkt, dma_addr_t addr, u8 shift_pa);
 
+/**
+ * cmdq_pkt_eoc() - Append eoc command to the CMDQ packet, ask GCE
+ *		    to generate IRQ. It's usually appended to the end of
+ *		    packet to notify that all command in the packet is done.
+ * @pkt:	the CMDQ packet
+ *
+ * Return: 0 for success; else the error code is returned
+ */
+int cmdq_pkt_eoc(struct cmdq_pkt *pkt);
+
 /**
  * cmdq_pkt_finalize() - Append EOC and jump command to pkt.
  * @pkt:	the CMDQ packet
@@ -346,6 +356,11 @@ static inline int cmdq_pkt_jump(struct cmdq_pkt *pkt, dma_addr_t addr, u8 shift_
 	return -EINVAL;
 }
 
+static inline int cmdq_pkt_eoc(struct cmdq_pkt *pkt)
+{
+	return -EINVAL;
+}
+
 static inline int cmdq_pkt_finalize(struct cmdq_pkt *pkt)
 {
 	return -EINVAL;
-- 
2.34.1


