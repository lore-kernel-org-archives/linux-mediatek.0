Return-Path: <SRS0=pCB/=ZN=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.7 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B9281C432C0
	for <linux-mediatek@archiver.kernel.org>; Thu, 21 Nov 2019 09:16:08 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8AF4D2071C
	for <linux-mediatek@archiver.kernel.org>; Thu, 21 Nov 2019 09:16:08 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Rzq/TQMd";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="KkM142mg"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8AF4D2071C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=afcrLMSqhmxfweHgsed6ENmbIix9YhIT6rllMsi90+w=; b=Rzq/TQMd8PeEJ/
	sj1M7+NmRQMF7U4qjci4TkwTOJkV99DuLnml/eXaJv6CymodOg2yojV9TuEZsRsRYp6zumgfVIU77
	GKk/88CtBj/Icqa1apSE2rNeD8n0Rrc5NVn+5Dkignf6N4LdNE0ApmEroPhip4q0FRtqOk4i/2TPN
	6pH1AMULfgYVqX0rUN4uS7MFEDNfzGDChjqVMO3AoDef+WWK2k8e5a/fovkWbGkWoI2f4opM+d8Nr
	qm6nBK/slDeukdl1Vlqa14AhnmcNr7qwei2RicIJSVZRouRTZAzz3emZ4xwXyJDNkyqHA1Q1vsyrM
	uSM6kBrrO2CBbajLjBFA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iXiZM-0005De-4i; Thu, 21 Nov 2019 09:16:08 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iXiX1-0001nl-Jo; Thu, 21 Nov 2019 09:13:45 +0000
X-UUID: 5f64757ebefa413a88e1fecb7de96c72-20191121
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=z1evitQJPyeiEI/V0SBkkReklkkebIVSw5JGTAaBmCI=; 
 b=KkM142mgYXcBnX2eXoUE+cxMidEiYAQ9xFscxE63O77yVJvIyZG9kcuCD3mZoQLIkUUB2ivnVZcfNRiD5s1N6rB7pMvGXs4dF84rRkV2OxpCgN1ny+wGgzfgsKb3SGA8jNNTNl/Tlvrn+EIeyNd6l4N79Qm1L3gFyTjMuLvAjMo=;
X-UUID: 5f64757ebefa413a88e1fecb7de96c72-20191121
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw01.mediatek.com
 (envelope-from <dennis-yc.hsieh@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 2042890020; Thu, 21 Nov 2019 01:13:39 -0800
Received: from mtkmbs08n1.mediatek.inc (172.21.101.55) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Thu, 21 Nov 2019 01:13:44 -0800
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs08n1.mediatek.inc (172.21.101.55) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Thu, 21 Nov 2019 17:13:06 +0800
Received: from mtkswgap22.mediatek.inc (172.21.77.33) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via
 Frontend Transport; Thu, 21 Nov 2019 17:13:30 +0800
From: Dennis YC Hsieh <dennis-yc.hsieh@mediatek.com>
To: Rob Herring <robh+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Jassi Brar <jassisinghbrar@gmail.com>
Subject: [PATCH v1 09/12] soc: mediatek: cmdq: add mem move function
Date: Thu, 21 Nov 2019 17:12:29 +0800
Message-ID: <1574327552-11806-10-git-send-email-dennis-yc.hsieh@mediatek.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1574327552-11806-1-git-send-email-dennis-yc.hsieh@mediatek.com>
References: <1574327552-11806-1-git-send-email-dennis-yc.hsieh@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191121_011343_831971_65CF9F84 
X-CRM114-Status: GOOD (  10.08  )
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

Add memory move function in cmdq helper functions which helps copy value
between physical address.

Signed-off-by: Dennis YC Hsieh <dennis-yc.hsieh@mediatek.com>
---
 drivers/soc/mediatek/mtk-cmdq-helper.c |   26 ++++++++++++++++++++++++++
 include/linux/soc/mediatek/mtk-cmdq.h  |   13 +++++++++++++
 2 files changed, 39 insertions(+)

diff --git a/drivers/soc/mediatek/mtk-cmdq-helper.c b/drivers/soc/mediatek/mtk-cmdq-helper.c
index 4c90fed..4235cf8 100644
--- a/drivers/soc/mediatek/mtk-cmdq-helper.c
+++ b/drivers/soc/mediatek/mtk-cmdq-helper.c
@@ -282,6 +282,32 @@ int cmdq_pkt_write_s(struct cmdq_pkt *pkt, dma_addr_t addr,
 }
 EXPORT_SYMBOL(cmdq_pkt_write_s);
 
+int cmdq_pkt_mem_move(struct cmdq_pkt *pkt, phys_addr_t src_addr,
+		      phys_addr_t dst_addr)
+{
+	struct cmdq_instruction inst = { {0} };
+	const u16 dst_reg_idx = CMDQ_SPR_TEMP;
+	const u16 swap_reg_idx = CMDQ_SPR1;
+	int err;
+
+	err = cmdq_pkt_read_s(pkt, src_addr, swap_reg_idx);
+	if (err < 0)
+		return err;
+
+	err = cmdq_pkt_assign(pkt, dst_reg_idx, CMDQ_ADDR_HIGH(dst_addr));
+	if (err < 0)
+		return err;
+
+	inst.op = CMDQ_CODE_WRITE_S;
+	inst.arg_b_t = CMDQ_REG_TYPE;
+	inst.sop = dst_reg_idx;
+	inst.offset = CMDQ_ADDR_LOW(dst_addr);
+	inst.arg_b = swap_reg_idx;
+
+	return cmdq_pkt_append_command(pkt, inst);
+}
+EXPORT_SYMBOL(cmdq_pkt_mem_move);
+
 int cmdq_pkt_wfe(struct cmdq_pkt *pkt, u16 event)
 {
 	struct cmdq_instruction inst = { {0} };
diff --git a/include/linux/soc/mediatek/mtk-cmdq.h b/include/linux/soc/mediatek/mtk-cmdq.h
index fb48d3c..b3474f2 100644
--- a/include/linux/soc/mediatek/mtk-cmdq.h
+++ b/include/linux/soc/mediatek/mtk-cmdq.h
@@ -13,6 +13,7 @@
 
 #define CMDQ_NO_TIMEOUT		0xffffffffu
 #define CMDQ_SPR_TEMP		0
+#define CMDQ_SPR1		1
 
 struct cmdq_pkt;
 
@@ -126,6 +127,18 @@ int cmdq_pkt_write_s(struct cmdq_pkt *pkt, dma_addr_t addr,
 		     u32 value, u32 mask);
 
 /**
+ * cmdq_pkt_mem_move() - append read and write commands to copy data from
+ *			 source address to destination address.
+ * @pkt:	the CMDQ packet
+ * @src_addr:	the source physical address
+ * @dst_addr:	the destination physical address
+ *
+ * Return: 0 for success; else the error code is returned
+ */
+int cmdq_pkt_mem_move(struct cmdq_pkt *pkt, phys_addr_t src_addr,
+		      phys_addr_t dst_addr);
+
+/**
  * cmdq_pkt_wfe() - append wait for event command to the CMDQ packet
  * @pkt:	the CMDQ packet
  * @event:	the desired event type to "wait and CLEAR"
-- 
1.7.9.5
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
