Return-Path: <SRS0=Bv85=4U=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6CDC4C3F2CD
	for <linux-mediatek@archiver.kernel.org>; Tue,  3 Mar 2020 11:10:26 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3FA6920674
	for <linux-mediatek@archiver.kernel.org>; Tue,  3 Mar 2020 11:10:26 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="NZ8S0zvP";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="my0nalwS"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3FA6920674
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nuxHYYV97t2mwTF4cJbc06WeqBoyfw+fFevky+QRpgc=; b=NZ8S0zvPJTZrBl
	jzR8GFZ86drWmuQxsjpFQrlAhFONtUvK/TbQGCL10/xF8zdn6uBNVGMjPTtxsIxlSki8NVZrp620r
	aBG48QZys+6E1XwBQnGAszV5153OzJUCe9SOYyzUFYn/6TuI2EpSwGGbPGA7rpHGiVSdm7ODEBjPn
	XTw4aMDKQLDisBUsic4JHb/rnI2y6KolL+6KCYlaAg1VuLyzNXLW7dRH1ByrQjFxjBIlVeUQ/nVsz
	7FTiooTdvpLUfnN+mtTIh+puqinAVAlum5WgDVdao/J09lEJ/AJL7cM2V2fRp/2csTxYg+tIdPfcw
	Nv08CrzeksOApa7Lgb2Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j95RJ-000355-Ji; Tue, 03 Mar 2020 11:10:17 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j95Q1-0001Wu-Um; Tue, 03 Mar 2020 11:09:00 +0000
X-UUID: a2237875b3fa40ed916465bcbf40d07b-20200303
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=330LQhd/xVZ1G+avzxWZxFCOS8OiLlS0YT5gBwzchlc=; 
 b=my0nalwSk2Dy9/+rit+VSVes6gyom1f43zrwbG95jUDIfSgd16wgG6aVbHbTxvESeLdKkO6BDnzAzeX0NWuV5HOi3PInd6XPuxTvCT2qgWQyueqtaIUDVGhAQsMcoef7YBYN6iqZ2fX1/JviYXvoSxjWWRem087/nLe3LZhuSHk=;
X-UUID: a2237875b3fa40ed916465bcbf40d07b-20200303
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <dennis-yc.hsieh@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1202983522; Tue, 03 Mar 2020 03:08:51 -0800
Received: from mtkmbs05n2.mediatek.inc (172.21.101.140) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Tue, 3 Mar 2020 02:58:50 -0800
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs05n2.mediatek.inc (172.21.101.140) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Tue, 3 Mar 2020 18:57:48 +0800
Received: from mtkswgap22.mediatek.inc (172.21.77.33) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via
 Frontend Transport; Tue, 3 Mar 2020 18:58:11 +0800
From: Dennis YC Hsieh <dennis-yc.hsieh@mediatek.com>
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Jassi Brar
 <jassisinghbrar@gmail.com>, Philipp Zabel <p.zabel@pengutronix.de>, "David
 Airlie" <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH v4 08/13] soc: mediatek: cmdq: add read_s function
Date: Tue, 3 Mar 2020 18:58:40 +0800
Message-ID: <1583233125-7827-9-git-send-email-dennis-yc.hsieh@mediatek.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1583233125-7827-1-git-send-email-dennis-yc.hsieh@mediatek.com>
References: <1583233125-7827-1-git-send-email-dennis-yc.hsieh@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200303_030858_051417_6D535389 
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
Cc: devicetree@vger.kernel.org, wsd_upstream@mediatek.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 HS Liao <hs.liao@mediatek.com>, Dennis YC Hsieh <dennis-yc.hsieh@mediatek.com>,
 linux-mediatek@lists.infradead.org, Houlong Wei <houlong.wei@mediatek.com>,
 Bibby Hsieh <bibby.hsieh@mediatek.com>, CK Hu <ck.hu@mediatek.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Add read_s function in cmdq helper functions which support read value from
register or dma physical address into gce internal register.

Signed-off-by: Dennis YC Hsieh <dennis-yc.hsieh@mediatek.com>
Reviewed-by: CK Hu <ck.hu@mediatek.com>
---
 drivers/soc/mediatek/mtk-cmdq-helper.c   | 15 +++++++++++++++
 include/linux/mailbox/mtk-cmdq-mailbox.h |  1 +
 include/linux/soc/mediatek/mtk-cmdq.h    | 13 +++++++++++++
 3 files changed, 29 insertions(+)

diff --git a/drivers/soc/mediatek/mtk-cmdq-helper.c b/drivers/soc/mediatek/mtk-cmdq-helper.c
index 90f1ff2b4b00..03c129230cd7 100644
--- a/drivers/soc/mediatek/mtk-cmdq-helper.c
+++ b/drivers/soc/mediatek/mtk-cmdq-helper.c
@@ -226,6 +226,21 @@ int cmdq_pkt_write_mask(struct cmdq_pkt *pkt, u8 subsys,
 }
 EXPORT_SYMBOL(cmdq_pkt_write_mask);
 
+int cmdq_pkt_read_s(struct cmdq_pkt *pkt, u16 high_addr_reg_idx, u16 addr_low,
+		    u16 reg_idx)
+{
+	struct cmdq_instruction inst = { {0} };
+
+	inst.op = CMDQ_CODE_READ_S;
+	inst.dst_t = CMDQ_REG_TYPE;
+	inst.sop = high_addr_reg_idx;
+	inst.reg_dst = reg_idx;
+	inst.src_reg = addr_low;
+
+	return cmdq_pkt_append_command(pkt, inst);
+}
+EXPORT_SYMBOL(cmdq_pkt_read_s);
+
 int cmdq_pkt_write_s(struct cmdq_pkt *pkt, u16 high_addr_reg_idx,
 		     u16 addr_low, u16 src_reg_idx, u32 mask)
 {
diff --git a/include/linux/mailbox/mtk-cmdq-mailbox.h b/include/linux/mailbox/mtk-cmdq-mailbox.h
index 8ef87e1bd03b..3f6bc0dfd5da 100644
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
index c72d826d8934..01b4184af310 100644
--- a/include/linux/soc/mediatek/mtk-cmdq.h
+++ b/include/linux/soc/mediatek/mtk-cmdq.h
@@ -104,6 +104,19 @@ int cmdq_pkt_write(struct cmdq_pkt *pkt, u8 subsys, u16 offset, u32 value);
 int cmdq_pkt_write_mask(struct cmdq_pkt *pkt, u8 subsys,
 			u16 offset, u32 value, u32 mask);
 
+/*
+ * cmdq_pkt_read_s() - append read_s command to the CMDQ packet
+ * @pkt:	the CMDQ packet
+ * @high_addr_reg_idx:	internal regisger ID which contains high address of pa
+ * @addr_low:	low address of pa
+ * @addr:	the physical address of register or dma to read
+ * @reg_idx:	the CMDQ internal register ID to cache read data
+ *
+ * Return: 0 for success; else the error code is returned
+ */
+int cmdq_pkt_read_s(struct cmdq_pkt *pkt, u16 high_addr_reg_idx, u16 addr_low,
+		    u16 reg_idx);
+
 /**
  * cmdq_pkt_write_s() - append write_s command to the CMDQ packet
  * @pkt:	the CMDQ packet
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
