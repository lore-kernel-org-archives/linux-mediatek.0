Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96FFCC54788
	for <linux-mediatek@archiver.kernel.org>; Thu, 22 Feb 2024 15:42:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QPqXgewCfZe0W2aD2P/HGNDKtXkbfRHvg6TYmGgfd8I=; b=N1coVk3WZyi36VJCya45Ij9GXA
	PCHscE8i5H3cqEyIudO23g6TXO2uHbt5+LiIeBSWynr0DDqDA9lMXdXoO8PGbTxSIEKwLETtP2tou
	xas5cRVXeKCstPsdp+SXu6F+jRKd7y+8l3rTXmccMGjxfQ/htfEp9K8t6ivKT6L5YXPodk9+XscDg
	GlFMznjL4CqqRirprb2e0WZwiFQ88DeXyh8TJoxGO6Ik15sMoe7hQ8LEHfUTBQPtwp/H+O239wyZd
	ZPosiy446/WyBbbrt5eXvi6a0uW/ZoHALmgHfvJo6DQePJEXpxIW+tzgUzUSWmUgtS7P8314lxsPi
	RHCY4Vhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rdBDS-00000005S8i-0bSI;
	Thu, 22 Feb 2024 15:42:30 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rdBCl-00000005RbW-0Vu7;
	Thu, 22 Feb 2024 15:41:49 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 618DECE2808;
	Thu, 22 Feb 2024 15:41:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B1EB1C433C7;
	Thu, 22 Feb 2024 15:41:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1708616504;
	bh=nDJV3H5ien5JKkaRFl6YIw977BIcRyhSssibdZZbNS0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=SX0BMFOx6A7QuL23OjGPgrhtp4wl94MOyaFh5GXEeo2EooTQMADyzw49eslKGwAhN
	 3EB8LW7Bu0Nlwqew+qd2UPkhMWeJYO4Ty8PxJ51VhXGfyCrQ/11COqa0l0GTGZe8eE
	 XeAwwP4EVI/6I7hUjU/Dak0EBzOD5BNLevXL/Sd86iOhFzmmzKLKqUd0wxhpYCN2tF
	 7wzImDW7aud3DtY69Xs4Xd+e590SV7485TjKcQ148H5VK2LgencYiHnv4rE/XQxbQg
	 j3ps7o0ECniy5n2qHhn7SiKZK9Wuzpyau6Wjup4wsjqVa5LGLpbCgJEyf6VSBgrnZl
	 B8EmhyPJDJw2w==
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
Subject: [PATCH v2 05/12] soc: mediatek: cmdq: Add cmdq_pkt_eoc() helper function
Date: Thu, 22 Feb 2024 15:41:13 +0000
Message-Id: <20240222154120.16959-6-chunkuang.hu@kernel.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240222154120.16959-1-chunkuang.hu@kernel.org>
References: <20240222154120.16959-1-chunkuang.hu@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240222_074147_546516_AF5A0BEB 
X-CRM114-Status: GOOD (  12.14  )
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

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Signed-off-by: Chun-Kuang Hu <chunkuang.hu@kernel.org>
---
 drivers/soc/mediatek/mtk-cmdq-helper.c | 10 ++++++++++
 include/linux/soc/mediatek/mtk-cmdq.h  | 19 +++++++++++++++++++
 2 files changed, 29 insertions(+)

diff --git a/drivers/soc/mediatek/mtk-cmdq-helper.c b/drivers/soc/mediatek/mtk-cmdq-helper.c
index 678db09983d4..766dbafaef62 100644
--- a/drivers/soc/mediatek/mtk-cmdq-helper.c
+++ b/drivers/soc/mediatek/mtk-cmdq-helper.c
@@ -414,6 +414,16 @@ int cmdq_pkt_jump_rel(struct cmdq_pkt *pkt, s32 offset, u8 shift_pa)
 }
 EXPORT_SYMBOL(cmdq_pkt_jump_rel);
 
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
index a935cd69d80f..45110494ee9d 100644
--- a/include/linux/soc/mediatek/mtk-cmdq.h
+++ b/include/linux/soc/mediatek/mtk-cmdq.h
@@ -275,6 +275,20 @@ int cmdq_pkt_jump_abs(struct cmdq_pkt *pkt, dma_addr_t addr, u8 shift_pa);
  */
 int cmdq_pkt_jump_rel(struct cmdq_pkt *pkt, s32 offset, u8 shift_pa);
 
+/**
+ * cmdq_pkt_eoc() - Append EOC and ask GCE to generate an IRQ at end of execution
+ * @pkt:	The CMDQ packet
+ *
+ * Appends an End Of Code (EOC) command to the CMDQ packet and asks the GCE
+ * to generate an interrupt at the end of the execution of all commands in
+ * the pipeline.
+ * The EOC command is usually appended to the end of the pipeline to notify
+ * that all commands are done.
+ *
+ * Return: 0 for success or negative error number
+ */
+int cmdq_pkt_eoc(struct cmdq_pkt *pkt);
+
 /**
  * cmdq_pkt_finalize() - Append EOC and jump command to pkt.
  * @pkt:	the CMDQ packet
@@ -401,6 +415,11 @@ static inline int cmdq_pkt_jump_rel(struct cmdq_pkt *pkt, s32 offset, u8 shift_p
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


