Return-Path: <SRS0=L+xn=ZT=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CDB3EC432C0
	for <linux-mediatek@archiver.kernel.org>; Wed, 27 Nov 2019 02:03:06 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 880892068E
	for <linux-mediatek@archiver.kernel.org>; Wed, 27 Nov 2019 02:03:06 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="gmFBZwsx";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="agniLXUk"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 880892068E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ia4PRigANnZJwJawwjl4zox63nDdbdXo5pULhMVsIkw=; b=gmFBZwsx+NHzTh
	tpmgNwmUUWj5Zuw40iQIHYwuViW13c2f3PaADFVa+JXoIOCWe2H+sBItoVgYXfyRCDqZ742Yyobfv
	ifL8C8Nca4aH4e25IZLLBIZ+4CyRRIpwvMSqcXjZOajgrqkUA3wWeoyGyeTHAj2rRtZ+yMdRlBlcE
	IFtbGjK6SH9YMyjGogrdnpIFdivEhgZ2TWEeLwdhuBT6KeouGB+XD/y97UUhk7J2JPe0yw3krc6L0
	vvEQVlKHL6oVvBSWIPDGe4/uxF60X+4kWQTFOdgHX0RyIfAUh+blGN1PiH9BgEB9itAKZPfJWqpgb
	6zLI6b2gd5RpExj8hKVA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iZmfY-00011X-Ao; Wed, 27 Nov 2019 02:03:04 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iZmc0-0004f3-PT; Wed, 27 Nov 2019 01:59:27 +0000
X-UUID: ecfb962b8322460b90d3893d4ff4f557-20191126
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=8WBe5+aGC7K+W+Z4Y10j5bdbvqHfiXEGyAm4Mr40jXc=; 
 b=agniLXUkgH+MM1LVI2DwObyHHEi5nIbiBbAPi4ICY8OKLhYeWXeB+IpoCAkOBnjsOeFAkwoFGlRR+dEfQyysymzPa/9847SXGzUg7vGeUnpzyHW1qaJroYWzqYcVREm0At8JTTY+lufJjMysLzHuWqmvhYRGNQ2BvkQ3Mpbca1Y=;
X-UUID: ecfb962b8322460b90d3893d4ff4f557-20191126
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw02.mediatek.com
 (envelope-from <dennis-yc.hsieh@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1950633030; Tue, 26 Nov 2019 17:59:20 -0800
Received: from mtkmbs08n2.mediatek.inc (172.21.101.56) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Tue, 26 Nov 2019 17:59:52 -0800
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs08n2.mediatek.inc (172.21.101.56) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Wed, 27 Nov 2019 09:58:44 +0800
Received: from mtkswgap22.mediatek.inc (172.21.77.33) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via
 Frontend Transport; Wed, 27 Nov 2019 09:58:19 +0800
From: Dennis YC Hsieh <dennis-yc.hsieh@mediatek.com>
To: Rob Herring <robh+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Jassi Brar <jassisinghbrar@gmail.com>
Subject: [PATCH v2 10/14] soc: mediatek: cmdq: add write_s value function
Date: Wed, 27 Nov 2019 09:58:53 +0800
Message-ID: <1574819937-6246-12-git-send-email-dennis-yc.hsieh@mediatek.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1574819937-6246-1-git-send-email-dennis-yc.hsieh@mediatek.com>
References: <1574819937-6246-1-git-send-email-dennis-yc.hsieh@mediatek.com>
MIME-Version: 1.0
X-TM-SNTS-SMTP: 248A6CF17373214C60CFC52C8E2696CD4B51C89120D42ADB52041CA5A6455D192000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191126_175924_841345_1C5D86DF 
X-CRM114-Status: GOOD (  11.22  )
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

add write_s function in cmdq helper functions which
writes a constant value to address with large dma
access support.

Signed-off-by: Dennis YC Hsieh <dennis-yc.hsieh@mediatek.com>
---
 drivers/soc/mediatek/mtk-cmdq-helper.c | 31 ++++++++++++++++++++++++++
 include/linux/soc/mediatek/mtk-cmdq.h  | 12 ++++++++++
 2 files changed, 43 insertions(+)

diff --git a/drivers/soc/mediatek/mtk-cmdq-helper.c b/drivers/soc/mediatek/mtk-cmdq-helper.c
index 2cd693e34980..244b8528eb16 100644
--- a/drivers/soc/mediatek/mtk-cmdq-helper.c
+++ b/drivers/soc/mediatek/mtk-cmdq-helper.c
@@ -284,6 +284,37 @@ int cmdq_pkt_write_s(struct cmdq_pkt *pkt, phys_addr_t addr, u16 reg_idx,
 }
 EXPORT_SYMBOL(cmdq_pkt_write_s);
 
+int cmdq_pkt_write_s_value(struct cmdq_pkt *pkt, dma_addr_t addr,
+			   u32 value, u32 mask)
+{
+	struct cmdq_instruction inst = { {0} };
+	int err;
+	const u16 dst_reg_idx = CMDQ_SPR_TEMP;
+
+	err = cmdq_pkt_assign(pkt, dst_reg_idx, CMDQ_ADDR_HIGH(addr));
+	if (err < 0)
+		return err;
+
+	if (mask != U32_MAX) {
+		inst.op = CMDQ_CODE_MASK;
+		inst.mask = ~mask;
+		err = cmdq_pkt_append_command(pkt, inst);
+		if (err < 0)
+			return err;
+
+		inst.op = CMDQ_CODE_WRITE_S_MASK;
+	} else {
+		inst.op = CMDQ_CODE_WRITE_S;
+	}
+
+	inst.sop = dst_reg_idx;
+	inst.offset = CMDQ_ADDR_LOW(addr);
+	inst.value = value;
+
+	return cmdq_pkt_append_command(pkt, inst);
+}
+EXPORT_SYMBOL(cmdq_pkt_write_s_value);
+
 int cmdq_pkt_wfe(struct cmdq_pkt *pkt, u16 event)
 {
 	struct cmdq_instruction inst = { {0} };
diff --git a/include/linux/soc/mediatek/mtk-cmdq.h b/include/linux/soc/mediatek/mtk-cmdq.h
index bc28a41d7780..4bce240dbb56 100644
--- a/include/linux/soc/mediatek/mtk-cmdq.h
+++ b/include/linux/soc/mediatek/mtk-cmdq.h
@@ -128,6 +128,18 @@ int cmdq_pkt_read_s(struct cmdq_pkt *pkt, phys_addr_t addr, u16 reg_idx);
 int cmdq_pkt_write_s(struct cmdq_pkt *pkt, phys_addr_t addr, u16 reg_idx,
 		     u32 mask);
 
+/**
+ * cmdq_pkt_write_s() - append write_s command with mask to the CMDQ packet
+ * @pkt:	the CMDQ packet
+ * @addr:	the physical address of register or dma
+ * @value:	the specified target value
+ * @mask:	the specified target mask
+ *
+ * Return: 0 for success; else the error code is returned
+ */
+int cmdq_pkt_write_s_value(struct cmdq_pkt *pkt, dma_addr_t addr,
+			   u32 value, u32 mask);
+
 /**
  * cmdq_pkt_wfe() - append wait for event command to the CMDQ packet
  * @pkt:	the CMDQ packet
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
