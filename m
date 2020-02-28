Return-Path: <SRS0=Knfd=4Q=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BB08DC3F2D2
	for <linux-mediatek@archiver.kernel.org>; Fri, 28 Feb 2020 13:47:23 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8D8E224699
	for <linux-mediatek@archiver.kernel.org>; Fri, 28 Feb 2020 13:47:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="urUVXFO/";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="hrGWATHv"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8D8E224699
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kuPb7qodL4ol2R/h9JVw68ZS5M3AZodLQtJn1uwFSiQ=; b=urUVXFO/vV3q7U
	3H3pzk7TypHhKqPCh5KKsNTqmen0ia5xeL9rEW23SMb9z4Du3oqEAjT+oAotxCKUAYkDdMBjmFb7W
	xE+dsbDn+x6YWxCjjrkIyECFqg9RlzXV97Jf1uE47AO4LCYjBEGP4ksgll3TEPp092EEji7Z0uomF
	6Pr/AWh0lWaOHs4F55qL7F7kA7bgOYg/9bHIKpASUay3teexKqZY2Itkh16wrDLrpN5CKbADxM9V3
	WAKMT5jmWMusbhuamq953obNYv5iqVEwWwQ3BdI3UYyWE9gPwc+ofONdxZxwuaFlVO0vYtKKot5ey
	wxIxf5IbR4cNvruIGMhw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j7fyz-0001fh-4U; Fri, 28 Feb 2020 13:47:13 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j7fxE-0007yU-08; Fri, 28 Feb 2020 13:45:26 +0000
X-UUID: 1d9d72844ddb4c71bf8127338d4a9a65-20200228
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=TKXJL9vVzdhmozmVndYQ12k2PLHyLpmAwIObwMyzwYk=; 
 b=hrGWATHvPQ0dIkcKYG0cnSs3SY1Fn95rVMRS1VQ3dGne831rekNytHQUqCo9Pb/xZfUFKvJasrGBrMbqukVq00URXRZsNsqCbnQG2bbBCg7KqDj+FeRaWKslda0ZSfnfzwnjaDbhImL1ZUR7gcfsRW0A0E8mbFAFHUBLlqjdFgE=;
X-UUID: 1d9d72844ddb4c71bf8127338d4a9a65-20200228
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw01.mediatek.com
 (envelope-from <dennis-yc.hsieh@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 2010528038; Fri, 28 Feb 2020 05:45:20 -0800
Received: from mtkmbs08n1.mediatek.inc (172.21.101.55) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Fri, 28 Feb 2020 05:46:29 -0800
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs08n1.mediatek.inc (172.21.101.55) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Fri, 28 Feb 2020 21:46:46 +0800
Received: from mtkswgap22.mediatek.inc (172.21.77.33) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via
 Frontend Transport; Fri, 28 Feb 2020 21:45:04 +0800
From: Dennis YC Hsieh <dennis-yc.hsieh@mediatek.com>
To: Rob Herring <robh+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Jassi Brar <jassisinghbrar@gmail.com>
Subject: [PATCH v3 10/13] soc: mediatek: cmdq: export finalize function
Date: Fri, 28 Feb 2020 21:44:18 +0800
Message-ID: <1582897461-15105-12-git-send-email-dennis-yc.hsieh@mediatek.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1582897461-15105-1-git-send-email-dennis-yc.hsieh@mediatek.com>
References: <1582897461-15105-1-git-send-email-dennis-yc.hsieh@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200228_054524_162284_DFDB09D0 
X-CRM114-Status: GOOD (  10.71  )
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

Export finalize function to client which helps append eoc and jump
command to pkt.

Signed-off-by: Dennis YC Hsieh <dennis-yc.hsieh@mediatek.com>
Reviewed-by: CK Hu <ck.hu@mediatek.com>
---
 drivers/soc/mediatek/mtk-cmdq-helper.c | 7 ++-----
 include/linux/soc/mediatek/mtk-cmdq.h  | 8 ++++++++
 2 files changed, 10 insertions(+), 5 deletions(-)

diff --git a/drivers/soc/mediatek/mtk-cmdq-helper.c b/drivers/soc/mediatek/mtk-cmdq-helper.c
index 1336523eb7d4..58fec634dcf1 100644
--- a/drivers/soc/mediatek/mtk-cmdq-helper.c
+++ b/drivers/soc/mediatek/mtk-cmdq-helper.c
@@ -372,7 +372,7 @@ int cmdq_pkt_assign(struct cmdq_pkt *pkt, u16 reg_idx, u32 value)
 }
 EXPORT_SYMBOL(cmdq_pkt_assign);
 
-static int cmdq_pkt_finalize(struct cmdq_pkt *pkt)
+int cmdq_pkt_finalize(struct cmdq_pkt *pkt)
 {
 	struct cmdq_instruction inst = { {0} };
 	int err;
@@ -392,6 +392,7 @@ static int cmdq_pkt_finalize(struct cmdq_pkt *pkt)
 
 	return err;
 }
+EXPORT_SYMBOL(cmdq_pkt_finalize);
 
 static void cmdq_pkt_flush_async_cb(struct cmdq_cb_data data)
 {
@@ -426,10 +427,6 @@ int cmdq_pkt_flush_async(struct cmdq_pkt *pkt, cmdq_async_flush_cb cb,
 	unsigned long flags = 0;
 	struct cmdq_client *client = (struct cmdq_client *)pkt->cl;
 
-	err = cmdq_pkt_finalize(pkt);
-	if (err < 0)
-		return err;
-
 	pkt->cb.cb = cb;
 	pkt->cb.data = data;
 	pkt->async_cb.cb = cmdq_pkt_flush_async_cb;
diff --git a/include/linux/soc/mediatek/mtk-cmdq.h b/include/linux/soc/mediatek/mtk-cmdq.h
index fec292aac83c..99e77155f967 100644
--- a/include/linux/soc/mediatek/mtk-cmdq.h
+++ b/include/linux/soc/mediatek/mtk-cmdq.h
@@ -213,6 +213,14 @@ int cmdq_pkt_poll_mask(struct cmdq_pkt *pkt, u8 subsys,
  */
 int cmdq_pkt_assign(struct cmdq_pkt *pkt, u16 reg_idx, u32 value);
 
+/**
+ * cmdq_pkt_finalize() - Append EOC and jump command to pkt.
+ * @pkt:	the CMDQ packet
+ *
+ * Return: 0 for success; else the error code is returned
+ */
+int cmdq_pkt_finalize(struct cmdq_pkt *pkt);
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
