Return-Path: <SRS0=pCB/=ZN=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 10B7CC432C3
	for <linux-mediatek@archiver.kernel.org>; Thu, 21 Nov 2019 09:13:59 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B9EE92089F
	for <linux-mediatek@archiver.kernel.org>; Thu, 21 Nov 2019 09:13:58 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="sd+xcRqy";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="NsUQTXIk"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B9EE92089F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VcAPUif5kSvPQ7RokxT5xc+j0pcrA1DHaPHetbuUWbs=; b=sd+xcRqyn5hGp2
	giinZrCPO9MnW/zphCWl7nwl5Tf+YA/NYRcLwVHtdGG3KOd/PG2C8PXCL3QrmYVPUF2oXI4mCIYtB
	xV4EDzUWILrob46LYzqPzDkSmvYKO3NFNd6pvQXA8rpWev8p9Aifq5ftb10NlurP9NxNvugcMNVBZ
	IQNnCJUT6l1VhJ6dQ3WeURKjCCyDrN/fQ1A6MZ9rFcpvIiLU46gFxa0AtPKVw4ReJv7n7TsGy2SUE
	RshCDYXqdfyTsG4bXsT2VUAnzTgCvTCnPYyZD5nyYO4qq5mjOMqHJHRN2DPXtJpDA9kPQBMKBISTu
	fJrZxOgGdsJFJmMqQINQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iXiXF-0001zu-Sk; Thu, 21 Nov 2019 09:13:57 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iXiWp-0001RZ-HE; Thu, 21 Nov 2019 09:13:32 +0000
X-UUID: d26174fa12884092abb004e783dc4404-20191121
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=3GH17FM+/rme/xLe3lNPvYf1Y2puYtNawmkpQEhHNA0=; 
 b=NsUQTXIkCXMSQ38tzE22INWzkXMI4n+9j9NT9WPAyQS2+tRlfLSzo5KsI9ogZEEMQd/5MqxtNuoLO75PsjkAdNcjB/5K0RzbVN1FiEx4So0WyhVdB7KasizYSSqDQA+UAt9wHf0kr1N2dFUk0wKuBLpI/TM3OhA978wJD0XQu8w=;
X-UUID: d26174fa12884092abb004e783dc4404-20191121
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <dennis-yc.hsieh@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1914855246; Thu, 21 Nov 2019 01:13:27 -0800
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Thu, 21 Nov 2019 01:13:46 -0800
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Thu, 21 Nov 2019 17:13:23 +0800
Received: from mtkswgap22.mediatek.inc (172.21.77.33) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via
 Frontend Transport; Thu, 21 Nov 2019 17:13:29 +0800
From: Dennis YC Hsieh <dennis-yc.hsieh@mediatek.com>
To: Rob Herring <robh+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Jassi Brar <jassisinghbrar@gmail.com>
Subject: [PATCH v1 08/12] soc: mediatek: cmdq: add read_s function
Date: Thu, 21 Nov 2019 17:12:28 +0800
Message-ID: <1574327552-11806-9-git-send-email-dennis-yc.hsieh@mediatek.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1574327552-11806-1-git-send-email-dennis-yc.hsieh@mediatek.com>
References: <1574327552-11806-1-git-send-email-dennis-yc.hsieh@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191121_011331_576615_7EB5F21C 
X-CRM114-Status: GOOD (  11.44  )
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

Add read_s function in cmdq helper functions which support read value from
register or dma physical address into gce internal register.

Signed-off-by: Dennis YC Hsieh <dennis-yc.hsieh@mediatek.com>
---
 drivers/soc/mediatek/mtk-cmdq-helper.c   |   24 ++++++++++++++++++++++++
 include/linux/mailbox/mtk-cmdq-mailbox.h |    1 +
 include/linux/soc/mediatek/mtk-cmdq.h    |   10 ++++++++++
 3 files changed, 35 insertions(+)

diff --git a/drivers/soc/mediatek/mtk-cmdq-helper.c b/drivers/soc/mediatek/mtk-cmdq-helper.c
index 1b074a9..4c90fed 100644
--- a/drivers/soc/mediatek/mtk-cmdq-helper.c
+++ b/drivers/soc/mediatek/mtk-cmdq-helper.c
@@ -23,6 +23,10 @@ struct cmdq_instruction {
 	union {
 		u32 value;
 		u32 mask;
+		struct {
+			u16 arg_c;
+			u16 arg_b;
+		};
 	};
 	union {
 		u16 offset;
@@ -227,6 +231,26 @@ int cmdq_pkt_write_mask(struct cmdq_pkt *pkt, u8 subsys,
 }
 EXPORT_SYMBOL(cmdq_pkt_write_mask);
 
+int cmdq_pkt_read_s(struct cmdq_pkt *pkt, phys_addr_t addr, u16 reg_idx)
+{
+	struct cmdq_instruction inst = { {0} };
+	int err;
+	const u16 src_reg_idx = CMDQ_SPR_TEMP;
+
+	err = cmdq_pkt_assign(pkt, src_reg_idx, CMDQ_ADDR_HIGH(addr));
+	if (err < 0)
+		return err;
+
+	inst.op = CMDQ_CODE_READ_S;
+	inst.arg_a_t = CMDQ_REG_TYPE;
+	inst.sop = src_reg_idx;
+	inst.reg_dst = reg_idx;
+	inst.arg_b = CMDQ_ADDR_LOW(addr);
+
+	return cmdq_pkt_append_command(pkt, inst);
+}
+EXPORT_SYMBOL(cmdq_pkt_read_s);
+
 int cmdq_pkt_write_s(struct cmdq_pkt *pkt, dma_addr_t addr,
 		     u32 value, u32 mask)
 {
diff --git a/include/linux/mailbox/mtk-cmdq-mailbox.h b/include/linux/mailbox/mtk-cmdq-mailbox.h
index 8ef87e1..3f6bc0d 100644
--- a/include/linux/mailbox/mtk-cmdq-mailbox.h
+++ b/include/linux/mailbox/mtk-cmdq-mailbox.h
@@ -59,6 +59,7 @@ enum cmdq_code {
 	CMDQ_CODE_JUMP = 0x10,
 	CMDQ_CODE_WFE = 0x20,
 	CMDQ_CODE_EOC = 0x40,
+	CMDQ_CODE_READ_S = 0x80,
 	CMDQ_CODE_WRITE_S = 0x90,
 	CMDQ_CODE_WRITE_S_MASK = 0x91,
 	CMDQ_CODE_LOGIC = 0xa0,
diff --git a/include/linux/soc/mediatek/mtk-cmdq.h b/include/linux/soc/mediatek/mtk-cmdq.h
index 8dbd046..fb48d3c 100644
--- a/include/linux/soc/mediatek/mtk-cmdq.h
+++ b/include/linux/soc/mediatek/mtk-cmdq.h
@@ -104,6 +104,16 @@ int cmdq_pkt_write_mask(struct cmdq_pkt *pkt, u8 subsys,
 			u16 offset, u32 value, u32 mask);
 
 /**
+ * cmdq_pkt_read_s() - append read_s command to the CMDQ packet
+ * @pkt:	the CMDQ packet
+ * @addr:	the physical address of register or dma to read
+ * @reg_idx:	the CMDQ internal register ID to cache read data
+ *
+ * Return: 0 for success; else the error code is returned
+ */
+int cmdq_pkt_read_s(struct cmdq_pkt *pkt, phys_addr_t addr, u16 reg_idx);
+
+/**
  * cmdq_pkt_write_s() - append write_s command with mask to the CMDQ packet
  * @pkt:	the CMDQ packet
  * @addr:	the physical address of register or dma
-- 
1.7.9.5
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
