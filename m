Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B08F5C48BC3
	for <linux-mediatek@archiver.kernel.org>; Thu, 15 Feb 2024 00:50:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pqZ/kgKDACXdPeK9sM637WSqPrRbymAx6Sooj6UWiLQ=; b=cANXRv/rnStepcS7h4n0X1Lwvm
	wlC/OyE0PeuhlssD0ULfrLQeh5yJvwwxlz6RYie3hpxg77hOU5pcnPcHF9cnFZ4WFNjoK1Ih6HBFY
	rUe4hhr8ubLIm8hDZm0Hn+/ELRSvIbKx1LwWhDEm1cMl+P48oCeKCaVJVhHG4q299QCvV4tq+Vojv
	5yskcF6hhcQGVwmD3ODVBUw+s2LuHlfu0sXvZL/UvqTzoY92F4mIzhC7q8NMq5q5wOBye7dZj4Hgf
	s2WOrLHvm5WklpX/UUz/tOC2Wzom9yIMC7mOGi5f3f69/Tux6bP0iXDW+JhV6jfvmCzXvezWNZUvx
	qAnpMntA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1raPxb-0000000EhUI-0rqB;
	Thu, 15 Feb 2024 00:50:43 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1raPxD-0000000Eh9H-0xmx;
	Thu, 15 Feb 2024 00:50:20 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 7B9356123C;
	Thu, 15 Feb 2024 00:50:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 25994C433B2;
	Thu, 15 Feb 2024 00:50:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1707958218;
	bh=dPziziTO31/IgvG01QjFF6q9F9Ksbkg3Q8cm4HNP0Sk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Oxx40D/89a6FlorbWuMzZEYV6v9l4FbG9HoWoWtIQbtV0NtDuB5wgcHL//ag4s+4q
	 TCgrMKpr9bn4NrblZK2iJsOfLDeRcdTEYJRC2DUXD8GbOcf9BOM19ThwxHzCpbFfuE
	 65xCCK7+1IzuOQtm+JmczPhYQDYwqoX1zUs9rjTRff+hT2qWQA5wIp5raLibyOslrK
	 W66bvZknkAFeqPjeIwe4oM+WfWh0ej8sF8ipaeoZvmhEBD6BVuF5yPoRV4+LpVIp0N
	 ZQB560i4SHwe2FD+b6LfJMoLQJA+i8Yv892a1KyZs/9f+7+/vZcM01+jdy6vCwR892
	 y1Y4ICvyDigvw==
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
To: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Subject: [PATCH 7/9] soc: mediatek: cmdq: Remove cmdq_pkt_finalize() helper function
Date: Thu, 15 Feb 2024 00:49:29 +0000
Message-Id: <20240215004931.3808-8-chunkuang.hu@kernel.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240215004931.3808-1-chunkuang.hu@kernel.org>
References: <20240215004931.3808-1-chunkuang.hu@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240214_165019_439560_ACFBD7AC 
X-CRM114-Status: GOOD (  12.13  )
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

Because client driver has the information of struct cmdq_client, so
it's not necessary to store struct cmdq_client in struct cmdq_pkt.
cmdq_pkt_finalize() use struct cmdq_client in struct cmdq_pkt, so
client driver use cmdq_pkt_eoc() and cmdq_pkt_nop() to replace
cmdq_pkt_finalize() and this function could be removed.

Signed-off-by: Chun-Kuang Hu <chunkuang.hu@kernel.org>
---
 drivers/soc/mediatek/mtk-cmdq-helper.c | 22 ----------------------
 include/linux/soc/mediatek/mtk-cmdq.h  | 13 -------------
 2 files changed, 35 deletions(-)

diff --git a/drivers/soc/mediatek/mtk-cmdq-helper.c b/drivers/soc/mediatek/mtk-cmdq-helper.c
index 1be950b4ec7f..9b937db7398c 100644
--- a/drivers/soc/mediatek/mtk-cmdq-helper.c
+++ b/drivers/soc/mediatek/mtk-cmdq-helper.c
@@ -380,26 +380,4 @@ int cmdq_pkt_nop(struct cmdq_pkt *pkt, u8 shift_pa)
 }
 EXPORT_SYMBOL(cmdq_pkt_nop);
 
-int cmdq_pkt_finalize(struct cmdq_pkt *pkt)
-{
-	struct cmdq_instruction inst = { {0} };
-	int err;
-
-	/* insert EOC and generate IRQ for each command iteration */
-	inst.op = CMDQ_CODE_EOC;
-	inst.value = CMDQ_EOC_IRQ_EN;
-	err = cmdq_pkt_append_command(pkt, inst);
-	if (err < 0)
-		return err;
-
-	/* JUMP to end */
-	inst.op = CMDQ_CODE_JUMP;
-	inst.value = CMDQ_JUMP_PASS >>
-		cmdq_get_shift_pa(((struct cmdq_client *)pkt->cl)->chan);
-	err = cmdq_pkt_append_command(pkt, inst);
-
-	return err;
-}
-EXPORT_SYMBOL(cmdq_pkt_finalize);
-
 MODULE_LICENSE("GPL v2");
diff --git a/include/linux/soc/mediatek/mtk-cmdq.h b/include/linux/soc/mediatek/mtk-cmdq.h
index 8179ba5238f9..f1d571475b52 100644
--- a/include/linux/soc/mediatek/mtk-cmdq.h
+++ b/include/linux/soc/mediatek/mtk-cmdq.h
@@ -266,14 +266,6 @@ int cmdq_pkt_eoc(struct cmdq_pkt *pkt);
  */
 int cmdq_pkt_nop(struct cmdq_pkt *pkt, u8 shift_pa);
 
-/**
- * cmdq_pkt_finalize() - Append EOC and jump command to pkt.
- * @pkt:	the CMDQ packet
- *
- * Return: 0 for success; else the error code is returned
- */
-int cmdq_pkt_finalize(struct cmdq_pkt *pkt);
-
 #else /* IS_ENABLED(CONFIG_MTK_CMDQ) */
 
 static inline int cmdq_dev_get_client_reg(struct device *dev,
@@ -377,11 +369,6 @@ static inline int cmdq_pkt_nop(struct cmdq_pkt *pkt, u8 shift_pa)
 	return -EINVAL;
 }
 
-static inline int cmdq_pkt_finalize(struct cmdq_pkt *pkt)
-{
-	return -EINVAL;
-}
-
 #endif /* IS_ENABLED(CONFIG_MTK_CMDQ) */
 
 #endif	/* __MTK_CMDQ_H__ */
-- 
2.34.1


