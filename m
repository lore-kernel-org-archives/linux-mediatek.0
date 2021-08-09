Return-Path: <SRS0=Eo9X=NA=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9613BC4338F
	for <linux-mediatek@archiver.kernel.org>; Mon,  9 Aug 2021 03:09:33 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 34A166069E
	for <linux-mediatek@archiver.kernel.org>; Mon,  9 Aug 2021 03:09:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 34A166069E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=aVVT9O4mfiOWATVAdSE1L5XLRds4XteYkgfYrdqoUjk=; b=OJOIZjYv3M8Mw7
	AushbCrok16tdrzVhB6uq3FCVoVydac6tuGir9jUpkQ+R8uqUWydoAjDiHPghIuq6lBmcrB/EFRbn
	MoRWsAw5361nFLBQ+HtslsV7aoOBz2Eul1mbcWs1uOR4PnecY/ZJms7mnMOWCrDXTNlnW3MX+d9+G
	UBRdhQn4p4w//wF2bDqenFqKXU27FtwBZxvEBls4dD0AkEEid1s0obfk7mSOOM3cwKT6fLacIlTS3
	pXkQYE3LP126MSz1/tPmktvQTFLrg8GKmKeob4D98WP5bm0E+ZUiLs9wlPUzEBaAvR+Ixf8TeEkV0
	QNQeU4FRxhgihUf4R7hg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mCvfG-00GyE9-0b; Mon, 09 Aug 2021 03:09:22 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mCvei-00Gy5c-Ov; Mon, 09 Aug 2021 03:08:50 +0000
X-UUID: 9849dc71891e415da69490b5c79909bb-20210808
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=80Lt3r8QnLvkH14mXeKlfl5USxGdy9jFsEKJV9b6qaU=; 
 b=rQPoAQurscItusKSndaF7K1kv7RS0+HY3D6hFJlLIcmHf0zv+ShCv3R1f5lfIT7ERwr27Qa8CYDYPRTi/bJhJlzYIGfdlXI42gfF2pJO0DTJzuailMO3qw05pdY435nWnAT41q80ScCBcopLnfyQ7GQ+zu9sODNUXWmU3obUceI=;
X-UUID: 9849dc71891e415da69490b5c79909bb-20210808
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw01.mediatek.com
 (envelope-from <nina-cm.wu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1848921003; Sun, 08 Aug 2021 20:08:41 -0700
Received: from MTKMBS02N1.mediatek.inc (172.21.101.77) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sun, 8 Aug 2021 20:08:40 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs02n1.mediatek.inc (172.21.101.77) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 9 Aug 2021 11:08:38 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Mon, 9 Aug 2021 11:08:38 +0800
From: Nina Wu <nina-cm.wu@mediatek.com>
To: 
CC: Rob Herring <robh+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Nina Wu <Nina-CM.Wu@mediatek.com>, Neal Liu
 <neal.liu@mediatek.com>, Zhen Lei <thunder.leizhen@huawei.com>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>, 
 <srv_heupstream@mediatek.com>, <Jackson-kt.Chang@mediatek.com>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: [v4 5/7] soc: mediatek: devapc: add debug register for new IC support
Date: Mon, 9 Aug 2021 11:08:17 +0800
Message-ID: <1628478499-29460-5-git-send-email-nina-cm.wu@mediatek.com>
X-Mailer: git-send-email 2.6.4
In-Reply-To: <1628478499-29460-1-git-send-email-nina-cm.wu@mediatek.com>
References: <1628478499-29460-1-git-send-email-nina-cm.wu@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210808_200848_861144_B3F923CA 
X-CRM114-Status: GOOD (  16.56  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Nina Wu <Nina-CM.Wu@mediatek.com>

There are 3 debug info registers in new ICs while in legacy ones,
we have only 2. We add a 'version' field in compatible data to
decide how we extract the debug info.

Signed-off-by: Nina Wu <Nina-CM.Wu@mediatek.com>
---
 drivers/soc/mediatek/mtk-devapc.c | 43 +++++++++++++++++++++++++++++++++++----
 1 file changed, 39 insertions(+), 4 deletions(-)

diff --git a/drivers/soc/mediatek/mtk-devapc.c b/drivers/soc/mediatek/mtk-devapc.c
index 8eb65dc0..42d3be5 100644
--- a/drivers/soc/mediatek/mtk-devapc.c
+++ b/drivers/soc/mediatek/mtk-devapc.c
@@ -26,12 +26,24 @@ struct mtk_devapc_vio_dbgs {
 			u32 addr_h:4;
 			u32 resv:4;
 		} dbg0_bits;
+
+		struct {
+			u32 dmnid:6;
+			u32 vio_w:1;
+			u32 vio_r:1;
+			u32 addr_h:4;
+			u32 resv:20;
+		} dbg0_bits_ver2;
 	};
 
 	u32 vio_dbg1;
+	u32 vio_dbg2;
 };
 
 struct mtk_devapc_data {
+	/* architecture version */
+	u32 version;
+
 	/* default numbers of violation index */
 	u32 vio_idx_num;
 
@@ -40,6 +52,7 @@ struct mtk_devapc_data {
 	u32 vio_sta_offset;
 	u32 vio_dbg0_offset;
 	u32 vio_dbg1_offset;
+	u32 vio_dbg2_offset;
 	u32 apc_con_offset;
 	u32 vio_shift_sta_offset;
 	u32 vio_shift_sel_offset;
@@ -163,22 +176,43 @@ static void devapc_extract_vio_dbg(struct mtk_devapc_context *ctx)
 	struct mtk_devapc_vio_dbgs vio_dbgs;
 	void __iomem *vio_dbg0_reg;
 	void __iomem *vio_dbg1_reg;
+	void __iomem *vio_dbg2_reg;
+	u32 vio_addr, bus_id, domain_id;
+	u32 vio_w, vio_r;
 
 	vio_dbg0_reg = ctx->base + ctx->data->vio_dbg0_offset;
 	vio_dbg1_reg = ctx->base + ctx->data->vio_dbg1_offset;
+	vio_dbg2_reg = ctx->base + ctx->data->vio_dbg2_offset;
 
 	vio_dbgs.vio_dbg0 = readl(vio_dbg0_reg);
 	vio_dbgs.vio_dbg1 = readl(vio_dbg1_reg);
+	if (ctx->data->version == 2U)
+		vio_dbgs.vio_dbg2 = readl(vio_dbg2_reg);
+
+	if (ctx->data->version == 1U) {
+		/* arch version 1 */
+		bus_id = vio_dbgs.dbg0_bits.mstid;
+		vio_addr = vio_dbgs.vio_dbg1;
+		domain_id = vio_dbgs.dbg0_bits.dmnid;
+		vio_w = vio_dbgs.dbg0_bits.vio_w;
+		vio_r = vio_dbgs.dbg0_bits.vio_r;
+	} else {
+		/* arch version 2 */
+		bus_id = vio_dbgs.vio_dbg1;
+		vio_addr = vio_dbgs.vio_dbg2;
+		domain_id = vio_dbgs.dbg0_bits_ver2.dmnid;
+		vio_w = vio_dbgs.dbg0_bits_ver2.vio_w;
+		vio_r = vio_dbgs.dbg0_bits_ver2.vio_r;
+	}
 
 	/* Print violation information */
-	if (vio_dbgs.dbg0_bits.vio_w)
+	if (vio_w)
 		dev_info(ctx->dev, "Write Violation\n");
-	else if (vio_dbgs.dbg0_bits.vio_r)
+	else if (vio_r)
 		dev_info(ctx->dev, "Read Violation\n");
 
 	dev_info(ctx->dev, "Bus ID:0x%x, Dom ID:0x%x, Vio Addr:0x%x\n",
-		 vio_dbgs.dbg0_bits.mstid, vio_dbgs.dbg0_bits.dmnid,
-		 vio_dbgs.vio_dbg1);
+		 bus_id, domain_id, vio_addr);
 }
 
 /*
@@ -219,6 +253,7 @@ static void stop_devapc(struct mtk_devapc_context *ctx)
 }
 
 static const struct mtk_devapc_data devapc_mt6779 = {
+	.version = 1,
 	.vio_idx_num = 511,
 	.vio_mask_offset = 0x0,
 	.vio_sta_offset = 0x400,
-- 
2.6.4
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
