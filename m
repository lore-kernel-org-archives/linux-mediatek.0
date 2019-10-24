Return-Path: <SRS0=Rw5Z=YR=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.7 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5C1C2CA9EAF
	for <linux-mediatek@archiver.kernel.org>; Thu, 24 Oct 2019 05:29:48 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2B13F20856
	for <linux-mediatek@archiver.kernel.org>; Thu, 24 Oct 2019 05:29:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Bubq0o2B"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2B13F20856
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dJDt2Y2o7ipo/qVMbUx7vxw5WMZhocbAv9+FuJle9S0=; b=Bubq0o2B3XnzQq
	9fXtc3OMjyCVAfldTL5tWPlkJ+0T+qBhwKN4mrQN+tUQ1VLnqb0lCMPJFgiN1q0BWJ51Y5xJOb2pH
	vjxH79PqsMaouertPsq+0dbBKrtJw/Ua4F+UriI1+0EXnpJtVzDQZdH4rAtGrKhWFywFylHzlgTiP
	QIrIPOy+r7x0er0F/FN3BFbmpUjA/lvg3MA4TC/MdVNJzjKniwwHQUEABDtLEFh4HV06+Qj0w/DLW
	W4b4DZt5zRX2ECMtsaWPaO6+lXcAstP7aXjhiBL5pGmWW1kVZtjVkxrB6cS+yKGxQhx8MH1/eXBRy
	AKhk5vzVfjUPrR/k4LsQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iNVgk-00027T-OG; Thu, 24 Oct 2019 05:29:34 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iNVfG-0000fd-B3; Thu, 24 Oct 2019 05:28:05 +0000
X-UUID: 90079a0136ba40d6b648da5f805f9027-20191023
X-UUID: 90079a0136ba40d6b648da5f805f9027-20191023
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <bibby.hsieh@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 637996812; Wed, 23 Oct 2019 21:27:52 -0800
Received: from mtkmbs08n1.mediatek.inc (172.21.101.55) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Wed, 23 Oct 2019 22:27:46 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs08n1.mediatek.inc (172.21.101.55) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Thu, 24 Oct 2019 13:27:32 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via
 Frontend Transport; Thu, 24 Oct 2019 13:27:33 +0800
From: Bibby Hsieh <bibby.hsieh@mediatek.com>
To: Jassi Brar <jassisinghbrar@gmail.com>, Matthias Brugger
 <matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>, CK HU
 <ck.hu@mediatek.com>
Subject: [PATCH v16 3/5] soc: mediatek: cmdq: add polling function
Date: Thu, 24 Oct 2019 13:27:30 +0800
Message-ID: <20191024052732.7767-4-bibby.hsieh@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20191024052732.7767-1-bibby.hsieh@mediatek.com>
References: <20191024052732.7767-1-bibby.hsieh@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191023_222802_399100_BAE01041 
X-CRM114-Status: GOOD (  11.82  )
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
Cc: devicetree@vger.kernel.org, Nicolas Boichat <drinkcat@chromium.org>,
 srv_heupstream@mediatek.com, linux-kernel@vger.kernel.org,
 Houlong Wei <houlong.wei@mediatek.com>,
 Dennis-YC Hsieh <dennis-yc.hsieh@mediatek.com>,
 linux-mediatek@lists.infradead.org, Bibby Hsieh <bibby.hsieh@mediatek.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

add polling function in cmdq helper functions

Signed-off-by: Bibby Hsieh <bibby.hsieh@mediatek.com>
---
 drivers/soc/mediatek/mtk-cmdq-helper.c   | 35 ++++++++++++++++++++++++
 include/linux/mailbox/mtk-cmdq-mailbox.h |  1 +
 include/linux/soc/mediatek/mtk-cmdq.h    | 32 ++++++++++++++++++++++
 3 files changed, 68 insertions(+)

diff --git a/drivers/soc/mediatek/mtk-cmdq-helper.c b/drivers/soc/mediatek/mtk-cmdq-helper.c
index 11bfcc150ebd..8743c6ae7ac5 100644
--- a/drivers/soc/mediatek/mtk-cmdq-helper.c
+++ b/drivers/soc/mediatek/mtk-cmdq-helper.c
@@ -214,6 +214,41 @@ int cmdq_pkt_clear_event(struct cmdq_pkt *pkt, u16 event)
 }
 EXPORT_SYMBOL(cmdq_pkt_clear_event);
 
+int cmdq_pkt_poll(struct cmdq_pkt *pkt, u8 subsys,
+		  u16 offset, u32 value)
+{
+	struct cmdq_instruction inst = { {0} };
+	int err;
+
+	inst.op = CMDQ_CODE_POLL;
+	inst.value = value;
+	inst.offset = offset;
+	inst.subsys = subsys;
+	err = cmdq_pkt_append_command(pkt, inst);
+
+	return err;
+}
+EXPORT_SYMBOL(cmdq_pkt_poll);
+
+int cmdq_pkt_poll_mask(struct cmdq_pkt *pkt, u8 subsys,
+		       u16 offset, u32 value, u32 mask)
+{
+	struct cmdq_instruction inst = { {0} };
+	int err;
+
+	inst.op = CMDQ_CODE_MASK;
+	inst.mask = ~mask;
+	err = cmdq_pkt_append_command(pkt, inst);
+	if (err < 0)
+		return err;
+
+	offset = offset | 0x1;
+	err = cmdq_pkt_poll(pkt, subsys, offset, value);
+
+	return err;
+}
+EXPORT_SYMBOL(cmdq_pkt_poll_mask);
+
 static int cmdq_pkt_finalize(struct cmdq_pkt *pkt)
 {
 	struct cmdq_instruction inst = { {0} };
diff --git a/include/linux/mailbox/mtk-cmdq-mailbox.h b/include/linux/mailbox/mtk-cmdq-mailbox.h
index 678760548791..a4dc45fbec0a 100644
--- a/include/linux/mailbox/mtk-cmdq-mailbox.h
+++ b/include/linux/mailbox/mtk-cmdq-mailbox.h
@@ -55,6 +55,7 @@
 enum cmdq_code {
 	CMDQ_CODE_MASK = 0x02,
 	CMDQ_CODE_WRITE = 0x04,
+	CMDQ_CODE_POLL = 0x08,
 	CMDQ_CODE_JUMP = 0x10,
 	CMDQ_CODE_WFE = 0x20,
 	CMDQ_CODE_EOC = 0x40,
diff --git a/include/linux/soc/mediatek/mtk-cmdq.h b/include/linux/soc/mediatek/mtk-cmdq.h
index 9618debb9ceb..92bd5b5c6341 100644
--- a/include/linux/soc/mediatek/mtk-cmdq.h
+++ b/include/linux/soc/mediatek/mtk-cmdq.h
@@ -99,6 +99,38 @@ int cmdq_pkt_wfe(struct cmdq_pkt *pkt, u16 event);
  */
 int cmdq_pkt_clear_event(struct cmdq_pkt *pkt, u16 event);
 
+/**
+ * cmdq_pkt_poll() - Append polling command to the CMDQ packet, ask GCE to
+ *		     execute an instruction that wait for a specified
+ *		     hardware register to check for the value w/o mask.
+ *		     All GCE hardware threads will be blocked by this
+ *		     instruction.
+ * @pkt:	the CMDQ packet
+ * @subsys:	the CMDQ sub system code
+ * @offset:	register offset from CMDQ sub system
+ * @value:	the specified target register value
+ *
+ * Return: 0 for success; else the error code is returned
+ */
+int cmdq_pkt_poll(struct cmdq_pkt *pkt, u8 subsys,
+		  u16 offset, u32 value);
+
+/**
+ * cmdq_pkt_poll_mask() - Append polling command to the CMDQ packet, ask GCE to
+ *		          execute an instruction that wait for a specified
+ *		          hardware register to check for the value w/ mask.
+ *		          All GCE hardware threads will be blocked by this
+ *		          instruction.
+ * @pkt:	the CMDQ packet
+ * @subsys:	the CMDQ sub system code
+ * @offset:	register offset from CMDQ sub system
+ * @value:	the specified target register value
+ * @mask:	the specified target register mask
+ *
+ * Return: 0 for success; else the error code is returned
+ */
+int cmdq_pkt_poll_mask(struct cmdq_pkt *pkt, u8 subsys,
+		       u16 offset, u32 value, u32 mask);
 /**
  * cmdq_pkt_flush_async() - trigger CMDQ to asynchronously execute the CMDQ
  *                          packet and call back at the end of done packet
-- 
2.18.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
