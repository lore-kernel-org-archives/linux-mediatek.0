Return-Path: <SRS0=L+xn=ZT=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8C462C432C0
	for <linux-mediatek@archiver.kernel.org>; Wed, 27 Nov 2019 02:00:01 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 43307207DD
	for <linux-mediatek@archiver.kernel.org>; Wed, 27 Nov 2019 02:00:01 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="OVvOOzWd";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="UtnrhCja"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 43307207DD
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eO0Qq5JScZ3eLJT9geepDXwFkC34rZm4iSdg6vCkzyk=; b=OVvOOzWdsDEfCX
	ZlEgg3gdbBYMws+i1thOR7TUdsix91jg3ljRh6iQwLsfDaemuvPRxKm+7/iTmm3VTx449PozL477E
	y0yQ0iclxaNQ4lXx71xLF212wNL3mBcvazgJH9dR6vt0i80fJAN/GW3+3etG6pyHFy4ceQqzOEJzN
	1nS8QomOOKqlDL4cIRVIAByu8TqtDM5T5Mlph8GMimvztc042nXqRGOhs2XG8n+5s/MBBIAdBHncS
	5ZYJ1R4fb5YyozsVu7PFqRQdzc50o7VQUwN+sDnY33xQmhsaDGvnF/Cu+eqB2Krd30hwOplQVPnqQ
	u+qh5f692jRLqsE5OcWw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iZmcZ-0005Az-IF; Wed, 27 Nov 2019 01:59:59 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iZmbs-0004Xl-Th; Wed, 27 Nov 2019 01:59:19 +0000
X-UUID: 3b8171f9cda84db5bf26acf93e992fe4-20191126
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=3bmvDHDyrJS/9qz2LSdf3v6P9HJ6pP8KayJjB11i2U8=; 
 b=UtnrhCjapXi0s5shNn5IWL6Q/fA2qrxWYwwW+NOOG+AEVmoaQlZBoXr1xXQ1yPbEZ+sitLpvvVmO5bPdWdv5im1MyzCOZdHg0L/5lxazjaqtUAGrB2dDT5ZgrKXujGXf8JhVT12tROPNWWGufr/xyU+4jke7tOuz75WbSyYLAVk=;
X-UUID: 3b8171f9cda84db5bf26acf93e992fe4-20191126
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw02.mediatek.com
 (envelope-from <dennis-yc.hsieh@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1522189384; Tue, 26 Nov 2019 17:59:13 -0800
Received: from mtkmbs08n1.mediatek.inc (172.21.101.55) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Tue, 26 Nov 2019 17:59:19 -0800
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs08n1.mediatek.inc (172.21.101.55) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Wed, 27 Nov 2019 09:58:31 +0800
Received: from mtkswgap22.mediatek.inc (172.21.77.33) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via
 Frontend Transport; Wed, 27 Nov 2019 09:58:19 +0800
From: Dennis YC Hsieh <dennis-yc.hsieh@mediatek.com>
To: Rob Herring <robh+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Jassi Brar <jassisinghbrar@gmail.com>
Subject: [PATCH v2 12/14] soc: mediatek: cmdq: add loop function
Date: Wed, 27 Nov 2019 09:58:55 +0800
Message-ID: <1574819937-6246-14-git-send-email-dennis-yc.hsieh@mediatek.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1574819937-6246-1-git-send-email-dennis-yc.hsieh@mediatek.com>
References: <1574819937-6246-1-git-send-email-dennis-yc.hsieh@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191126_175916_978029_05916CB6 
X-CRM114-Status: GOOD (  11.04  )
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

Add finalize loop function in cmdq helper functions which loop whole pkt
in gce hardware thread without cpu operation.

Signed-off-by: Dennis YC Hsieh <dennis-yc.hsieh@mediatek.com>
---
 drivers/soc/mediatek/mtk-cmdq-helper.c | 22 ++++++++++++++++++++++
 include/linux/soc/mediatek/mtk-cmdq.h  |  8 ++++++++
 2 files changed, 30 insertions(+)

diff --git a/drivers/soc/mediatek/mtk-cmdq-helper.c b/drivers/soc/mediatek/mtk-cmdq-helper.c
index 38e0c13e1922..10a9b4481e58 100644
--- a/drivers/soc/mediatek/mtk-cmdq-helper.c
+++ b/drivers/soc/mediatek/mtk-cmdq-helper.c
@@ -414,6 +414,28 @@ int cmdq_pkt_finalize(struct cmdq_pkt *pkt)
 }
 EXPORT_SYMBOL(cmdq_pkt_finalize);
 
+int cmdq_pkt_finalize_loop(struct cmdq_pkt *pkt)
+{
+	struct cmdq_client *cl = pkt->cl;
+	struct cmdq_instruction inst = { {0} };
+	int err;
+
+	/* insert EOC and generate IRQ for each command iteration */
+	inst.op = CMDQ_CODE_EOC;
+	err = cmdq_pkt_append_command(pkt, inst);
+	if (err < 0)
+		return err;
+
+	/* JUMP abaolute to begin */
+	inst.op = CMDQ_CODE_JUMP;
+	inst.offset = 1;
+	inst.value = pkt->pa_base >> cmdq_mbox_shift(cl->chan);
+	err = cmdq_pkt_append_command(pkt, inst);
+
+	return err;
+}
+EXPORT_SYMBOL(cmdq_pkt_finalize_loop);
+
 static void cmdq_pkt_flush_async_cb(struct cmdq_cb_data data)
 {
 	struct cmdq_pkt *pkt = (struct cmdq_pkt *)data.data;
diff --git a/include/linux/soc/mediatek/mtk-cmdq.h b/include/linux/soc/mediatek/mtk-cmdq.h
index 998bc90f9da9..d15d8c941992 100644
--- a/include/linux/soc/mediatek/mtk-cmdq.h
+++ b/include/linux/soc/mediatek/mtk-cmdq.h
@@ -212,6 +212,14 @@ int cmdq_pkt_assign(struct cmdq_pkt *pkt, u16 reg_idx, u32 value);
  */
 int cmdq_pkt_finalize(struct cmdq_pkt *pkt);
 
+/**
+ * cmdq_pkt_finalize_loop() - Append EOC and jump command to loop pkt.
+ * @pkt:	the CMDQ packet
+ *
+ * Return: 0 for success; else the error code is returned
+ */
+int cmdq_pkt_finalize_loop(struct cmdq_pkt *pkt);
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
