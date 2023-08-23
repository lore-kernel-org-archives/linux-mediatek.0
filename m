Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E50BEE49A3
	for <linux-mediatek@archiver.kernel.org>; Wed, 23 Aug 2023 15:14:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GQhZU5jltz/YkgRBmJidnMnzG4E1Okj2IfoRrJzjcxQ=; b=x0QYAUoYh5OMir/nVu0G9d9ptA
	cGRoO69uOPWzyLfT39UnEpxzxGzW+7d3N5M2djpudJxa3BbA7LQdVzW3faBhZfMcmS8RbGG/Rj6Xp
	BCyMFSx13L7SvN0rYmnnBm3ezmV2oSjJUGVo9zUJ9YF0BfO9RES/mc1IIdFSqfQbbVw/pgHF9lg3e
	HqxA/TvuwDd9CKa/+IAo+lA/KRFVrlbUkP010mZAyFFScfgvwBSzKrvJXfMytaf+aw2NDqSDMpNYa
	msqUus1AXuXWSl9V4dV5LuWAyosWNJsdruKrqkA5nwtOjmD+To6UjKi5CJxd41136WI8fB60Rvvvj
	uALbEhCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qYpZC-000wNR-0U;
	Wed, 23 Aug 2023 15:14:42 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qYpYe-000vxh-1l;
	Wed, 23 Aug 2023 15:14:11 +0000
X-UUID: ad47490041c711ee912e1518a6540028-20230823
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=GQhZU5jltz/YkgRBmJidnMnzG4E1Okj2IfoRrJzjcxQ=;
	b=riTo1pdHGek2OX/FHiSz3CKLg6Hth1N7k+NK7WMVmepkhuoVXN6oZBcEQCdjH0BVmv1uVjdKnX7BvD0QQ+PhmdHrDOsMwtMIIraJC3AlMusCQ4102CRh9fyKti/mI8jUIePmA2kROa0/fHts5zkpWPLWWz9S9YSASgqd79nzpV4=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.31,REQID:c7927365-33c5-47d1-a473-42e5eb47f771,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:95,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:95
X-CID-INFO: VERSION:1.1.31,REQID:c7927365-33c5-47d1-a473-42e5eb47f771,IP:0,URL
	:0,TC:0,Content:0,EDM:0,RT:0,SF:95,FILE:0,BULK:0,RULE:Spam_GS981B3D,ACTION
	:quarantine,TS:95
X-CID-META: VersionHash:0ad78a4,CLOUDID:9804ab1f-33fd-4aaa-bb43-d3fd68d9d5ae,B
	ulkID:230823231355RRXIN3SB,BulkQuantity:1,Recheck:0,SF:38|29|28|17|19|48,T
	C:nil,Content:0,EDM:-3,IP:nil,URL:0,File:nil,Bulk:40,QS:nil,BEC:nil,COL:0,
	OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_ASC,TF_CID_SPAM_FAS,TF_CID_SPAM_FSD,TF_CID_SPAM_SNR,
	TF_CID_SPAM_SDM
X-UUID: ad47490041c711ee912e1518a6540028-20230823
Received: from mtkmbs14n2.mediatek.inc [(172.21.101.76)] by mailgw01.mediatek.com
	(envelope-from <shawn.sung@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1546460982; Wed, 23 Aug 2023 08:13:55 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Wed, 23 Aug 2023 23:13:52 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Wed, 23 Aug 2023 23:13:52 +0800
From: Hsiao Chien Sung <shawn.sung@mediatek.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Philipp Zabel
	<p.zabel@pengutronix.de>, David Airlie <airlied@gmail.com>, Daniel Vetter
	<daniel@ffwll.ch>, Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Jassi
 Brar <jassisinghbrar@gmail.com>
CC: <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>, Singo Chang
	<singo.chang@mediatek.com>, Nancy Lin <nancy.lin@mediatek.com>, Jason-JH Lin
	<jason-jh.lin@mediatek.com>, Hsiao Chien Sung <shawn.sung@mediatek.com>
Subject: [PATCH 03/15] soc: mediatek: Support GCE thread loop
Date: Wed, 23 Aug 2023 23:13:20 +0800
Message-ID: <20230823151332.28811-4-shawn.sung@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20230823151332.28811-1-shawn.sung@mediatek.com>
References: <20230823151332.28811-1-shawn.sung@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230823_081408_613270_D9379F33 
X-CRM114-Status: GOOD (  13.83  )
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

Add a new API to create GCE thread loop by
appending a command at the end of CMDQ packet
to jump to the head of it.

Signed-off-by: Hsiao Chien Sung <shawn.sung@mediatek.com>
---
 drivers/soc/mediatek/mtk-cmdq-helper.c | 30 ++++++++++++++++++++++++++
 include/linux/soc/mediatek/mtk-cmdq.h  |  2 ++
 2 files changed, 32 insertions(+)

diff --git a/drivers/soc/mediatek/mtk-cmdq-helper.c b/drivers/soc/mediatek/mtk-cmdq-helper.c
index c1837a468267..7d503d491c0d 100644
--- a/drivers/soc/mediatek/mtk-cmdq-helper.c
+++ b/drivers/soc/mediatek/mtk-cmdq-helper.c
@@ -430,6 +430,9 @@ int cmdq_pkt_flush_async(struct cmdq_pkt *pkt)
 	int err;
 	struct cmdq_client *client = (struct cmdq_client *)pkt->cl;
 
+	dma_sync_single_for_device(client->chan->mbox->dev, pkt->pa_base,
+				   pkt->cmd_buf_size, DMA_TO_DEVICE);
+
 	err = mbox_send_message(client->chan, pkt);
 	if (err < 0)
 		return err;
@@ -440,4 +443,31 @@ int cmdq_pkt_flush_async(struct cmdq_pkt *pkt)
 }
 EXPORT_SYMBOL(cmdq_pkt_flush_async);
 
+int cmdq_pkt_finalize_loop(struct cmdq_pkt *pkt)
+{
+	struct cmdq_instruction inst = { {0} };
+	int err;
+	u8 shift_pa = 0;
+
+	shift_pa = cmdq_get_shift_pa(((struct cmdq_client *)pkt->cl)->chan);
+
+	/* insert EOC and generate IRQ for command iteration */
+	inst.op = CMDQ_CODE_EOC;
+	inst.value = CMDQ_EOC_IRQ_EN;
+	err = cmdq_pkt_append_command(pkt, inst);
+	if (err < 0)
+		return err;
+
+	/* jump to head of the packet */
+	inst.op = CMDQ_CODE_JUMP;
+	inst.offset = CMDQ_JUMP_RELATIVE;
+	inst.value = pkt->pa_base >> shift_pa;
+	err = cmdq_pkt_append_command(pkt, inst);
+
+	pkt->loop = true;
+
+	return err;
+}
+EXPORT_SYMBOL(cmdq_pkt_finalize_loop);
+
 MODULE_LICENSE("GPL v2");
diff --git a/include/linux/soc/mediatek/mtk-cmdq.h b/include/linux/soc/mediatek/mtk-cmdq.h
index 3eb95ef34c6c..4c30f891d924 100644
--- a/include/linux/soc/mediatek/mtk-cmdq.h
+++ b/include/linux/soc/mediatek/mtk-cmdq.h
@@ -273,6 +273,8 @@ int cmdq_pkt_jump(struct cmdq_pkt *pkt, dma_addr_t addr);
  */
 int cmdq_pkt_finalize(struct cmdq_pkt *pkt);
 
+int cmdq_pkt_finalize_loop(struct cmdq_pkt *pkt);
+
 /**
  * cmdq_pkt_flush_async() - trigger CMDQ to asynchronously execute the CMDQ
  *                          packet and call back at the end of done packet
-- 
2.18.0


