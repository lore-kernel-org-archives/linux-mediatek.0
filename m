Return-Path: <SRS0=Knfd=4Q=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E2991C3F2D3
	for <linux-mediatek@archiver.kernel.org>; Fri, 28 Feb 2020 13:45:56 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B6F6424699
	for <linux-mediatek@archiver.kernel.org>; Fri, 28 Feb 2020 13:45:56 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="HL9JwWB/";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="bE7OuYGy"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B6F6424699
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NNLb3Wk+6b8pl449jrEReT7NGSHUMr7JoTD2u+zH9Ko=; b=HL9JwWB/23GJaM
	2AzP5pinkjDEC7NVEI8SwL2stB6dRuQd33UVFdb4Mt/s4l7atijVJQBJRkRO78u3YoOsey2ki/W6e
	VygH0kc/iFqVjRDf/6rZCiz5dLhyA528mEZp8DmbLyaI10JHJ+wZaJA0KTcvE08jUv18bO/PYXZCY
	MpmE2pxmSVZNWcARaV4K1VFChllShASTVrbmaCKzFdIjbUXjmmhltqNBTm92NPQGbLXzRWb6KKDqN
	ibzvj5MqBfitL+ake7JkmD4+n/jJs0tLhlYPSyOSZ+pKDHezbBOBfKPYgyz8Gw9qWV5yMQF78ricy
	a/P4/6TwG3PIkl7rARGQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j7fxO-0008Mc-3P; Fri, 28 Feb 2020 13:45:34 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j7fx4-00071a-W8; Fri, 28 Feb 2020 13:45:17 +0000
X-UUID: 2141699dc1164b64b542b1f88ca67317-20200228
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=V7rjjdGPaGIo71CRHrYBci2AlddPz1yKHLbHWKcAbso=; 
 b=bE7OuYGyFnORdFNntUExbivh/VjaU5tHSNFPy7xpBx7mabRyji9Glc80MbeBuJIo/EOBeZi2oxRWieZ+24PDO1UqWjZbpq4ud1Lm+Ldvin5amq9FWTuRfNqi85KCHnJSCLIjPwkntqKPKLk46WfkUB4t4KEuC7NahVY4OZkwipw=;
X-UUID: 2141699dc1164b64b542b1f88ca67317-20200228
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <dennis-yc.hsieh@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 963131216; Fri, 28 Feb 2020 05:45:09 -0800
Received: from mtkmbs05n2.mediatek.inc (172.21.101.140) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Fri, 28 Feb 2020 05:46:16 -0800
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs05n2.mediatek.inc (172.21.101.140) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Fri, 28 Feb 2020 21:44:07 +0800
Received: from mtkswgap22.mediatek.inc (172.21.77.33) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via
 Frontend Transport; Fri, 28 Feb 2020 21:45:04 +0800
From: Dennis YC Hsieh <dennis-yc.hsieh@mediatek.com>
To: Rob Herring <robh+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Jassi Brar <jassisinghbrar@gmail.com>
Subject: [PATCH v3 06/13] soc: mediatek: cmdq: add assign function
Date: Fri, 28 Feb 2020 21:44:14 +0800
Message-ID: <1582897461-15105-8-git-send-email-dennis-yc.hsieh@mediatek.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1582897461-15105-1-git-send-email-dennis-yc.hsieh@mediatek.com>
References: <1582897461-15105-1-git-send-email-dennis-yc.hsieh@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200228_054515_154047_4DD9BE03 
X-CRM114-Status: GOOD (  12.21  )
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
Cc: devicetree@vger.kernel.org, srv_heupstream@mediatek.com,
 wsd_upstream@mediatek.com, linux-kernel@vger.kernel.org,
 Houlong Wei <houlong.wei@mediatek.com>,
 Dennis YC Hsieh <dennis-yc.hsieh@mediatek.com>,
 linux-mediatek@lists.infradead.org, Bibby Hsieh <bibby.hsieh@mediatek.com>,
 CK Hu <ck.hu@mediatek.com>, Ming-Fan Chen <ming-fan.chen@mediatek.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Add assign function in cmdq helper which assign constant value into
internal register by index.

Signed-off-by: Dennis YC Hsieh <dennis-yc.hsieh@mediatek.com>
---
 drivers/soc/mediatek/mtk-cmdq-helper.c   | 24 +++++++++++++++++++++++-
 include/linux/mailbox/mtk-cmdq-mailbox.h |  1 +
 include/linux/soc/mediatek/mtk-cmdq.h    | 14 ++++++++++++++
 3 files changed, 38 insertions(+), 1 deletion(-)

diff --git a/drivers/soc/mediatek/mtk-cmdq-helper.c b/drivers/soc/mediatek/mtk-cmdq-helper.c
index 0698612de5ad..8342a5c94bc7 100644
--- a/drivers/soc/mediatek/mtk-cmdq-helper.c
+++ b/drivers/soc/mediatek/mtk-cmdq-helper.c
@@ -12,6 +12,7 @@
 #define CMDQ_WRITE_ENABLE_MASK	BIT(0)
 #define CMDQ_POLL_ENABLE_MASK	BIT(0)
 #define CMDQ_EOC_IRQ_EN		BIT(0)
+#define CMDQ_REG_TYPE		1
 
 struct cmdq_instruction {
 	union {
@@ -21,8 +22,17 @@ struct cmdq_instruction {
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
+			u8 dst_t:1;
+		};
 	};
-	u8 subsys;
 	u8 op;
 };
 
@@ -277,6 +287,18 @@ int cmdq_pkt_poll_mask(struct cmdq_pkt *pkt, u8 subsys,
 }
 EXPORT_SYMBOL(cmdq_pkt_poll_mask);
 
+int cmdq_pkt_assign(struct cmdq_pkt *pkt, u16 reg_idx, u32 value)
+{
+	struct cmdq_instruction inst = { {0} };
+
+	inst.op = CMDQ_CODE_LOGIC;
+	inst.dst_t = CMDQ_REG_TYPE;
+	inst.reg_dst = reg_idx;
+	inst.value = value;
+	return cmdq_pkt_append_command(pkt, inst);
+}
+EXPORT_SYMBOL(cmdq_pkt_assign);
+
 static int cmdq_pkt_finalize(struct cmdq_pkt *pkt)
 {
 	struct cmdq_instruction inst = { {0} };
diff --git a/include/linux/mailbox/mtk-cmdq-mailbox.h b/include/linux/mailbox/mtk-cmdq-mailbox.h
index dfe5b2eb85cc..121c3bb6d3de 100644
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
index a74c1d5acdf3..83340211e1d3 100644
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
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
