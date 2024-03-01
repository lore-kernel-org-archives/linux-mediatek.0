Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BFC46C54E41
	for <linux-mediatek@archiver.kernel.org>; Fri,  1 Mar 2024 11:12:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UVxmeYbrzMU+8yaEOX4EPOp0wcGdCd6eVhh5zyZPpKs=; b=EcpUhAInomsElrGRUKl5rCyhEX
	3js4zzD6Mtyq8IEqUo0agdyKfg4d8r6EdzQSuoSyJ6S/2OryxrT0rc2hQcs2eDt3WJAoKChiOuYyL
	YsoK/sUCvYN8EqRQnKXNV+NqOVJi0ita85Fj8/4WrIEcVF0p3Md+IxWuH3g9AYypLNf+14ST+TbOK
	NY3zUyycyyhTulaO+RAFGtbaetScywDlCLJk7eZ7wotql+zIyaQrpDPsmraKdKSVbBIvi/qqu2TPq
	CGyOKb2uqG20G0YegN72ttLVGelBBFtZwcjIWmMHdzeVRFF6P4Xqh76njtd7Wvt+hlyN2ZKXDGeKF
	x8jGh+jQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rg0oS-0000000HVHy-1jPO;
	Fri, 01 Mar 2024 11:12:24 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rg0oO-0000000HVEr-0h3y;
	Fri, 01 Mar 2024 11:12:21 +0000
X-UUID: 8edad456d7bc11eeb5c2bb47f3c01139-20240301
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=UVxmeYbrzMU+8yaEOX4EPOp0wcGdCd6eVhh5zyZPpKs=;
	b=QuCxVogU8g0tm5AMeDYPOh7HuiaLMvaQS1/Ihs+QgYPRyjX+d6/Rtc7xwOlWQTTdlABNIO8mTc73fni+tYinjiqYdBGjmBRFH1N3sbJzrg+nW8E3Fhf8v5QDwvX6mXGuUq9Ym7LzizzuHBDxLQNnA4nddg8GI0t/FafUlnStJPc=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.37,REQID:95d77a9c-7515-425a-93e7-e6f0acbc9f43,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:6f543d0,CLOUDID:7ef764ff-c16b-4159-a099-3b9d0558e447,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,
	SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 8edad456d7bc11eeb5c2bb47f3c01139-20240301
Received: from mtkmbs14n1.mediatek.inc [(172.21.101.75)] by mailgw02.mediatek.com
	(envelope-from <jason-jh.lin@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1488917812; Fri, 01 Mar 2024 04:12:14 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Fri, 1 Mar 2024 19:11:39 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Fri, 1 Mar 2024 19:11:39 +0800
From: Jason-JH.Lin <jason-jh.lin@mediatek.com>
To: Jassi Brar <jassisinghbrar@gmail.com>, Chun-Kuang Hu
	<chunkuang.hu@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
CC: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Jason-ch Chen <jason-ch.chen@mediatek.com>, "Jason-JH . Lin"
	<jason-jh.lin@mediatek.com>, Singo Chang <singo.chang@mediatek.com>, "Nancy
 Lin" <nancy.lin@mediatek.com>, Shawn Sung <shawn.sung@mediatek.com>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: [PATCH 4/5] soc: mediatek: mtk-cmdq: Add cmdq_pkt_acquire_event() function
Date: Fri, 1 Mar 2024 19:11:25 +0800
Message-ID: <20240301111126.22035-5-jason-jh.lin@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20240301111126.22035-1-jason-jh.lin@mediatek.com>
References: <20240301111126.22035-1-jason-jh.lin@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--2.904900-8.000000
X-TMASE-MatchedRID: llTo18AJfvFYXTxImR5ZvLmIzqGFh/g8Xru95hSuhjQGW3hFnC9N1ayR
	DZpBnTnXX7ScFOAZsbSZymPU+pWEZ6Q4hw3fFG5zXSKcwPTzq/IhotH7bEpEMkYvSDWdWaRhcHj
	giTON9jLAsw00iUcvQv0h3e0v6EXCUBXVAm5W8RAbmaDSnOqZfsSgMQYKGHsJM6179UxzfjlCFt
	xLdA8EDuLzNWBegCW2wgn7iDBesS0nRE+fI6etkqQVJm8UX/I+1PbVTvjrX7SVbf5EccAu3cf5t
	cGdPaGDfONGJh0XykOuFgtX4tvltd/n8sBhKmAMw26jNhXEhXHyyMgM8a+L0YCE5xpCtDRTUbJF
	yh4XXyqYo/TPOlMB4bCh3zE4wqa8DUCRr8oin+k=
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--2.904900-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: 5A2AF9094C510743033CB018B974CC720722A3FB2D7EA8B6E88EA28690F1A4362000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240301_031220_249030_74CD07F8 
X-CRM114-Status: GOOD (  11.30  )
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

Add cmdq_pkt_acquire_event() function to support CMDQ user making
an instruction for acquiring event.

CMDQ users can use cmdq_pkt_acquire_event() and cmdq_pkt_clear_event()
to acquire GCE event and release GCE event and achieve the MUTEX_LOCK
protection between GCE threads.

Signed-off-by: Jason-JH.Lin <jason-jh.lin@mediatek.com>
Change-Id: Icdae6b60345c7ec1d7541ac76d1f06da56959cde
---
 drivers/soc/mediatek/mtk-cmdq-helper.c | 15 +++++++++++++++
 include/linux/soc/mediatek/mtk-cmdq.h  |  9 +++++++++
 2 files changed, 24 insertions(+)

diff --git a/drivers/soc/mediatek/mtk-cmdq-helper.c b/drivers/soc/mediatek/mtk-cmdq-helper.c
index 2e9fc9bb1183..0183b40a0eff 100644
--- a/drivers/soc/mediatek/mtk-cmdq-helper.c
+++ b/drivers/soc/mediatek/mtk-cmdq-helper.c
@@ -342,6 +342,21 @@ int cmdq_pkt_wfe(struct cmdq_pkt *pkt, u16 event, bool clear)
 }
 EXPORT_SYMBOL(cmdq_pkt_wfe);
 
+int cmdq_pkt_acquire_event(struct cmdq_pkt *pkt, u16 event)
+{
+	struct cmdq_instruction inst = {};
+
+	if (event >= CMDQ_MAX_EVENT)
+		return -EINVAL;
+
+	inst.op = CMDQ_CODE_WFE;
+	inst.value = CMDQ_WFE_UPDATE | CMDQ_WFE_UPDATE_VALUE | CMDQ_WFE_WAIT;
+	inst.event = event;
+
+	return cmdq_pkt_append_command(pkt, inst);
+}
+EXPORT_SYMBOL(cmdq_pkt_acquire_event);
+
 int cmdq_pkt_clear_event(struct cmdq_pkt *pkt, u16 event)
 {
 	struct cmdq_instruction inst = { {0} };
diff --git a/include/linux/soc/mediatek/mtk-cmdq.h b/include/linux/soc/mediatek/mtk-cmdq.h
index 2fe9be240fbc..de93c0a8e8a9 100644
--- a/include/linux/soc/mediatek/mtk-cmdq.h
+++ b/include/linux/soc/mediatek/mtk-cmdq.h
@@ -202,6 +202,15 @@ int cmdq_pkt_mem_move(struct cmdq_pkt *pkt, dma_addr_t src_addr, dma_addr_t dst_
  */
 int cmdq_pkt_wfe(struct cmdq_pkt *pkt, u16 event, bool clear);
 
+/**
+ * cmdq_pkt_acquire_event() - append acquire event command to the CMDQ packet
+ * @pkt:	the CMDQ packet
+ * @event:	the desired event to be acquired
+ *
+ * Return: 0 for success; else the error code is returned
+ */
+int cmdq_pkt_acquire_event(struct cmdq_pkt *pkt, u16 event);
+
 /**
  * cmdq_pkt_clear_event() - append clear event command to the CMDQ packet
  * @pkt:	the CMDQ packet
-- 
2.18.0


