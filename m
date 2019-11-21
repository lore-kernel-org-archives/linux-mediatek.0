Return-Path: <SRS0=pCB/=ZN=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.7 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B2A6C432C0
	for <linux-mediatek@archiver.kernel.org>; Thu, 21 Nov 2019 09:15:55 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CC8822071C
	for <linux-mediatek@archiver.kernel.org>; Thu, 21 Nov 2019 09:15:54 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Caqr5ClI";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="PdJ0arT0"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CC8822071C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ClCm28L/yzl/4yFzK81D58iwKefRJs5VQiRH1qxih7E=; b=Caqr5ClIgz/Oz3
	yrhsf/hDhEkjDqj3qSthMG6JnMvE/8nj0pxNjfl3GCj0CO1HTcSH7cDkLAQHR+kBFaYvk3UTTFIb0
	igbo+x/fAFWstN12HEOMURt+aWecVXGRakrQnalVi5QRh8KSz+si91BKHCIOT1V8AF9QhVeCTd2vH
	ZpM+1i6QhCgDVTrrhjgCFv60LprY/M8TK8nbCgmkP0WL7iRzdMiwEZKYqhCSd8o3RbkzXXGUkzk/R
	z8zoAItF0urkpLHMEsjRsY4/re/0RIrAI1KH2zTOXyO/HovXCorb9VqVDpLq7g+Dy6I9jSnucsFdw
	nBm++L+nhQUuZT9uGq2g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iXiZ7-0004st-HT; Thu, 21 Nov 2019 09:15:53 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iXiWx-0001Zo-Mk; Thu, 21 Nov 2019 09:13:41 +0000
X-UUID: d87fe01f59674c7abb9654fa17c77918-20191121
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=TiulLJ0CtTfh89Jbxy5etpVyClnVU8CeCrTJaGL4/Lg=; 
 b=PdJ0arT0Yu7mCwxGyxuhK1xB4P2apS0b3QbM3VsYNCXtdXDPzNm/1fpZd01IAFqlK19wI2pZwEUylEMRFGQyu2pMLgl+K8AY4kGZ1sfq2daIlxTV1D2T45Fn9GVPlS0vXzknvAmNVoPrKp3tZ3ZgXQy68Zg+xbeGwSx6i+CqMCQ=;
X-UUID: d87fe01f59674c7abb9654fa17c77918-20191121
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw02.mediatek.com
 (envelope-from <dennis-yc.hsieh@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1692933152; Thu, 21 Nov 2019 01:13:34 -0800
Received: from mtkmbs08n2.mediatek.inc (172.21.101.56) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Thu, 21 Nov 2019 01:13:38 -0800
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs08n2.mediatek.inc (172.21.101.56) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Thu, 21 Nov 2019 17:13:09 +0800
Received: from mtkswgap22.mediatek.inc (172.21.77.33) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via
 Frontend Transport; Thu, 21 Nov 2019 17:13:29 +0800
From: Dennis YC Hsieh <dennis-yc.hsieh@mediatek.com>
To: Rob Herring <robh+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Jassi Brar <jassisinghbrar@gmail.com>
Subject: [PATCH v1 06/12] soc: mediatek: cmdq: add assign function
Date: Thu, 21 Nov 2019 17:12:26 +0800
Message-ID: <1574327552-11806-7-git-send-email-dennis-yc.hsieh@mediatek.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1574327552-11806-1-git-send-email-dennis-yc.hsieh@mediatek.com>
References: <1574327552-11806-1-git-send-email-dennis-yc.hsieh@mediatek.com>
MIME-Version: 1.0
X-TM-SNTS-SMTP: 5D768AA7918F4A90667EC41CF496330081AE4CA3609A566C7AEB51E4926B3E432000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191121_011339_884253_17D493EF 
X-CRM114-Status: GOOD (  11.67  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: devicetree@vger.kernel.org, wsd_upstream@mediatek.com,
 linux-kernel@vger.kernel.org, Houlong Wei <houlong.wei@mediatek.com>, Dennis
 YC Hsieh <dennis-yc.hsieh@mediatek.com>, linux-mediatek@lists.infradead.org,
 Bibby Hsieh <bibby.hsieh@mediatek.com>, CK Hu <ck.hu@mediatek.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Add assign function in cmdq helper which assign constant value into
internal register by index.

Signed-off-by: Dennis YC Hsieh <dennis-yc.hsieh@mediatek.com>
---
 drivers/soc/mediatek/mtk-cmdq-helper.c   |   24 +++++++++++++++++++++++-
 include/linux/mailbox/mtk-cmdq-mailbox.h |    1 +
 include/linux/soc/mediatek/mtk-cmdq.h    |   14 ++++++++++++++
 3 files changed, 38 insertions(+), 1 deletion(-)

diff --git a/drivers/soc/mediatek/mtk-cmdq-helper.c b/drivers/soc/mediatek/mtk-cmdq-helper.c
index 274f6f3..d419e99 100644
--- a/drivers/soc/mediatek/mtk-cmdq-helper.c
+++ b/drivers/soc/mediatek/mtk-cmdq-helper.c
@@ -14,6 +14,7 @@
 #define CMDQ_EOC_IRQ_EN		BIT(0)
 #define CMDQ_EOC_CMD		((u64)((CMDQ_CODE_EOC << CMDQ_OP_CODE_SHIFT)) \
 				<< 32 | CMDQ_EOC_IRQ_EN)
+#define CMDQ_REG_TYPE		1
 
 struct cmdq_instruction {
 	union {
@@ -23,8 +24,17 @@ struct cmdq_instruction {
 	union {
 		u16 offset;
 		u16 event;
+		u16 reg_dst;
+	};
+	union {
+		u8 subsys;
+		struct {
+			u8 sop:5;
+			u8 arg_c_t:1;
+			u8 arg_b_t:1;
+			u8 arg_a_t:1;
+		};
 	};
-	u8 subsys;
 	u8 op;
 };
 
@@ -279,6 +289,18 @@ int cmdq_pkt_poll_mask(struct cmdq_pkt *pkt, u8 subsys,
 }
 EXPORT_SYMBOL(cmdq_pkt_poll_mask);
 
+int cmdq_pkt_assign(struct cmdq_pkt *pkt, u16 reg_idx, u32 value)
+{
+	struct cmdq_instruction inst = { {0} };
+
+	inst.op = CMDQ_CODE_LOGIC;
+	inst.arg_a_t = CMDQ_REG_TYPE;
+	inst.reg_dst = reg_idx;
+	inst.value = value;
+	return cmdq_pkt_append_command(pkt, inst);
+}
+EXPORT_SYMBOL(cmdq_pkt_assign);
+
 static int cmdq_pkt_finalize(struct cmdq_pkt *pkt)
 {
 	struct cmdq_client *cl = pkt->cl;
diff --git a/include/linux/mailbox/mtk-cmdq-mailbox.h b/include/linux/mailbox/mtk-cmdq-mailbox.h
index dfe5b2e..121c3bb 100644
--- a/include/linux/mailbox/mtk-cmdq-mailbox.h
+++ b/include/linux/mailbox/mtk-cmdq-mailbox.h
@@ -59,6 +59,7 @@ enum cmdq_code {
 	CMDQ_CODE_JUMP = 0x10,
 	CMDQ_CODE_WFE = 0x20,
 	CMDQ_CODE_EOC = 0x40,
+	CMDQ_CODE_LOGIC = 0xa0,
 };
 
 enum cmdq_cb_status {
diff --git a/include/linux/soc/mediatek/mtk-cmdq.h b/include/linux/soc/mediatek/mtk-cmdq.h
index a74c1d5..8334021 100644
--- a/include/linux/soc/mediatek/mtk-cmdq.h
+++ b/include/linux/soc/mediatek/mtk-cmdq.h
@@ -152,6 +152,20 @@ int cmdq_pkt_poll(struct cmdq_pkt *pkt, u8 subsys,
  */
 int cmdq_pkt_poll_mask(struct cmdq_pkt *pkt, u8 subsys,
 		       u16 offset, u32 value, u32 mask);
+
+/**
+ * cmdq_pkt_assign() - Append logic assign command to the CMDQ packet, ask GCE
+ *		       to execute an instruction that set a constant value into
+ *		       internal register and use as value, mask or address in
+ *		       read/write instruction.
+ * @pkt:	the CMDQ packet
+ * @reg_idx:	the CMDQ internal register ID
+ * @value:	the specified value
+ *
+ * Return: 0 for success; else the error code is returned
+ */
+int cmdq_pkt_assign(struct cmdq_pkt *pkt, u16 reg_idx, u32 value);
+
 /**
  * cmdq_pkt_flush_async() - trigger CMDQ to asynchronously execute the CMDQ
  *                          packet and call back at the end of done packet
-- 
1.7.9.5
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
