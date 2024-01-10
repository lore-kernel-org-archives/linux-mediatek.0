Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D4C1C4707C
	for <linux-mediatek@archiver.kernel.org>; Wed, 10 Jan 2024 15:52:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=biuspGH8XRrmsRxtjUDtNrCdanOfOuJyi8se9k7muB0=; b=fdZsC3F3IDvZCwpEwuVJD2ZGa6
	Cox+Fqzezwj1Jcs3ToH7w3vwS8h8OhUAojO2ttgV4qbcxEdhXiGkvDg0VhiGiuHWSXrrvMCsdKvWt
	ivfH0q0haYJ3TisSeM1c1uL+hSUFwPnuPyx8qgPiD2L1s6oTz2cRACjF0WeyMY5Hk16iWEJ3eCDlQ
	BFlvoDZE+FssBGgW+2VDhev5IotXe6JOXYm4UjZR281M7kVokrTSNyRT6L4YrPydBJdDmO8dv0sEp
	26PKhvkG6Fyax9vnFPfq7fXBItO+kjuTUgZkHlaxFqaw3lFz8FoOHtVjPwOOeBKJXdMxsvCNCQdVr
	ckhWgtww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rNasA-00ChXa-0I;
	Wed, 10 Jan 2024 15:52:06 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rNas6-00ChUQ-10;
	Wed, 10 Jan 2024 15:52:04 +0000
X-UUID: 2d4cfc14afd011ee9a662f17bb45267e-20240110
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=biuspGH8XRrmsRxtjUDtNrCdanOfOuJyi8se9k7muB0=;
	b=qV47iH2xHmewp2WiyCyJFsCnmWVaup97ro78j9A9hFJn4mheuRJFiE72UQm9MguahzNQoGxOci5t47ibsr6iM/v02ztVFgtloZCJ2wlJAyOgLmEj77EAaVbzcdGiMGb+ECC1M588KK4W9fVJ7ruRoA0QbE47+xx3r5KQBSvPfOI=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.35,REQID:03094ea5-b964-447e-98be-96ffc6424a9b,IP:0,U
	RL:0,TC:0,Content:56,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:56
X-CID-META: VersionHash:5d391d7,CLOUDID:9c32b482-8d4f-477b-89d2-1e3bdbef96d1,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:801|102,TC:nil,Content:3,EDM:-3,IP:n
	il,URL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR
	:NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 2d4cfc14afd011ee9a662f17bb45267e-20240110
Received: from mtkmbs13n1.mediatek.inc [(172.21.101.193)] by mailgw02.mediatek.com
	(envelope-from <jason-jh.lin@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 72977279; Wed, 10 Jan 2024 08:51:54 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs13n1.mediatek.inc (172.21.101.193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Wed, 10 Jan 2024 23:51:51 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Wed, 10 Jan 2024 23:51:51 +0800
From: Jason-JH.Lin <jason-jh.lin@mediatek.com>
To: Jassi Brar <jassisinghbrar@gmail.com>, Matthias Brugger
	<matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Chun-Kuang Hu
	<chunkuang.hu@kernel.org>
CC: <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>, Jason-ch Chen
	<jason-ch.chen@mediatek.com>, Johnson Wang <johnson.wang@mediatek.com>,
	"Jason-JH . Lin" <jason-jh.lin@mediatek.com>, Singo Chang
	<singo.chang@mediatek.com>, Nancy Lin <nancy.lin@mediatek.com>, Shawn Sung
	<shawn.sung@mediatek.com>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: [PATCH 2/2] mailbox: mtk-cmdq: Add set GCE thread timeout interface
Date: Wed, 10 Jan 2024 23:51:48 +0800
Message-ID: <20240110155148.6383-3-jason-jh.lin@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20240110155148.6383-1-jason-jh.lin@mediatek.com>
References: <20240110155148.6383-1-jason-jh.lin@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240110_075202_375705_F1F13062 
X-CRM114-Status: GOOD (  12.02  )
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

Add cmdq_mbox_set_thread_timeout() to configue interrupt timeout
for the GCE thread used by CMDQ client drivers.

Signed-off-by: Jason-JH.Lin <jason-jh.lin@mediatek.com>
---
 drivers/mailbox/mtk-cmdq-mailbox.c       | 11 +++++++++++
 include/linux/mailbox/mtk-cmdq-mailbox.h |  1 +
 2 files changed, 12 insertions(+)

diff --git a/drivers/mailbox/mtk-cmdq-mailbox.c b/drivers/mailbox/mtk-cmdq-mailbox.c
index 89567f837513..9c0b5a43bf9f 100644
--- a/drivers/mailbox/mtk-cmdq-mailbox.c
+++ b/drivers/mailbox/mtk-cmdq-mailbox.c
@@ -122,6 +122,17 @@ u8 cmdq_get_shift_pa(struct mbox_chan *chan)
 }
 EXPORT_SYMBOL(cmdq_get_shift_pa);
 
+void cmdq_mbox_set_thread_timeout(void *chan, u32 timeout)
+{
+	struct cmdq_thread *thread = ((struct mbox_chan *)chan)->con_priv;
+	unsigned long flags;
+
+	spin_lock_irqsave(&thread->chan->lock, flags);
+	thread->timeout_ms = timeout;
+	spin_unlock_irqrestore(&thread->chan->lock, flags);
+}
+EXPORT_SYMBOL(cmdq_mbox_set_thread_timeout);
+
 static int cmdq_thread_suspend(struct cmdq *cmdq, struct cmdq_thread *thread)
 {
 	u32 status;
diff --git a/include/linux/mailbox/mtk-cmdq-mailbox.h b/include/linux/mailbox/mtk-cmdq-mailbox.h
index 4973b2ec37db..59c9f8ebd01f 100644
--- a/include/linux/mailbox/mtk-cmdq-mailbox.h
+++ b/include/linux/mailbox/mtk-cmdq-mailbox.h
@@ -82,5 +82,6 @@ struct cmdq_pkt {
 };
 
 u8 cmdq_get_shift_pa(struct mbox_chan *chan);
+void cmdq_mbox_set_thread_timeout(void *chan, u32 timeout);
 
 #endif /* __MTK_CMDQ_MAILBOX_H__ */
-- 
2.18.0


