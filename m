Return-Path: <SRS0=cZv3=AS=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.7 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A568CC433E1
	for <linux-mediatek@archiver.kernel.org>; Tue,  7 Jul 2020 15:47:01 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 714DD2065D
	for <linux-mediatek@archiver.kernel.org>; Tue,  7 Jul 2020 15:47:01 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="X9LFNVF2";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="Azm1GG6L"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 714DD2065D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=g9VEYOPLLSOnZfgzLvF1yMlJwc3bJtbhPtn8vO/S/aw=; b=X9LFNVF2h3qSShUL/6uz8esWK
	ta1x6Nvuco/sNanIlz1qz3WanFfrqBTXSwGnuAOcy0itBQYpUzXOz5FQw4CBCjiM6FeCmafZ9m2sK
	6jlwXEGoEfZSino2/x3jF4MnnQziV2sTv57YH9qpbQXdlIPRO3T/NPiJGQTAcmM6yi/rsrk2SwSTZ
	cajh7V8dJeojcH6siy8fCCT6pniFS6eBkNdaQL5iUq7Cs0rVm9lN1OURLQXtcd21MUcxxUgekvOWW
	w+zvPbfNmp5TYau5mIpwrBYP4mvFXMX/vYlQAa1XjmZeZD8vMEKzjSGNJ9AHvOci5O2qN77VdUyqD
	1cXN7qlww==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jspo2-0002HQ-4e; Tue, 07 Jul 2020 15:46:50 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jspnr-00029b-MO; Tue, 07 Jul 2020 15:46:43 +0000
X-UUID: c447c7a8ad4543c490d58f1c8087e8aa-20200707
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=NywHPAueQWZsL8tcuK4bPq8/aZhOZfaPkZYtAImJHB4=; 
 b=Azm1GG6LUFopjjOeYppSs0QGwbsqjbR7gT+dRleFxCUkQxvmSqs8sRcrvjh/dHSsZUno65NQRKcZKxU2op0OhwVJftCvpFvr5w5jiSj9MlRnDH4YOsew/wGHaASBtk/f783JzOWjqd+AgXePCcF4SmLI9HUbzRmZ34HUOpIfzfo=;
X-UUID: c447c7a8ad4543c490d58f1c8087e8aa-20200707
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <dennis-yc.hsieh@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1530115397; Tue, 07 Jul 2020 07:46:30 -0800
Received: from mtkmbs05n2.mediatek.inc (172.21.101.140) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 7 Jul 2020 08:46:24 -0700
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs05n2.mediatek.inc (172.21.101.140) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 7 Jul 2020 23:46:23 +0800
Received: from mtkswgap22.mediatek.inc (172.21.77.33) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Tue, 7 Jul 2020 23:46:24 +0800
From: Dennis YC Hsieh <dennis-yc.hsieh@mediatek.com>
To: Matthias Brugger <matthias.bgg@gmail.com>, Philipp Zabel
 <p.zabel@pengutronix.de>, David Airlie <airlied@linux.ie>, Daniel Vetter
 <daniel@ffwll.ch>, CK Hu <ck.hu@mediatek.com>, Bibby Hsieh
 <bibby.hsieh@mediatek.com>, Houlong Wei <houlong.wei@mediatek.com>
Subject: [PATCH v3 2/9] soc: mediatek: cmdq: add write_s function
Date: Tue, 7 Jul 2020 23:45:07 +0800
Message-ID: <1594136714-11650-3-git-send-email-dennis-yc.hsieh@mediatek.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1594136714-11650-1-git-send-email-dennis-yc.hsieh@mediatek.com>
References: <1594136714-11650-1-git-send-email-dennis-yc.hsieh@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200707_114640_500222_0C929ABA 
X-CRM114-Status: GOOD (  13.83  )
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
Cc: wsd_upstream@mediatek.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, HS Liao <hs.liao@mediatek.com>,
 Dennis YC Hsieh <dennis-yc.hsieh@mediatek.com>,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

add write_s function in cmdq helper functions which
writes value contains in internal register to address
with large dma access support.

Signed-off-by: Dennis YC Hsieh <dennis-yc.hsieh@mediatek.com>
---
 drivers/soc/mediatek/mtk-cmdq-helper.c   |   19 +++++++++++++++++++
 include/linux/mailbox/mtk-cmdq-mailbox.h |    1 +
 include/linux/soc/mediatek/mtk-cmdq.h    |   19 +++++++++++++++++++
 3 files changed, 39 insertions(+)

diff --git a/drivers/soc/mediatek/mtk-cmdq-helper.c b/drivers/soc/mediatek/mtk-cmdq-helper.c
index 9faf78fbed3a..880349b3f16c 100644
--- a/drivers/soc/mediatek/mtk-cmdq-helper.c
+++ b/drivers/soc/mediatek/mtk-cmdq-helper.c
@@ -18,6 +18,10 @@ struct cmdq_instruction {
 	union {
 		u32 value;
 		u32 mask;
+		struct {
+			u16 arg_c;
+			u16 src_reg;
+		};
 	};
 	union {
 		u16 offset;
@@ -223,6 +227,21 @@ int cmdq_pkt_write_mask(struct cmdq_pkt *pkt, u8 subsys,
 }
 EXPORT_SYMBOL(cmdq_pkt_write_mask);
 
+int cmdq_pkt_write_s(struct cmdq_pkt *pkt, u16 high_addr_reg_idx,
+		     u16 addr_low, u16 src_reg_idx)
+{
+	struct cmdq_instruction inst = {};
+
+	inst.op = CMDQ_CODE_WRITE_S;
+	inst.src_t = CMDQ_REG_TYPE;
+	inst.sop = high_addr_reg_idx;
+	inst.offset = addr_low;
+	inst.src_reg = src_reg_idx;
+
+	return cmdq_pkt_append_command(pkt, inst);
+}
+EXPORT_SYMBOL(cmdq_pkt_write_s);
+
 int cmdq_pkt_wfe(struct cmdq_pkt *pkt, u16 event)
 {
 	struct cmdq_instruction inst = { {0} };
diff --git a/include/linux/mailbox/mtk-cmdq-mailbox.h b/include/linux/mailbox/mtk-cmdq-mailbox.h
index 05eea1aef5aa..1f76cfedb16d 100644
--- a/include/linux/mailbox/mtk-cmdq-mailbox.h
+++ b/include/linux/mailbox/mtk-cmdq-mailbox.h
@@ -60,6 +60,7 @@ enum cmdq_code {
 	CMDQ_CODE_JUMP = 0x10,
 	CMDQ_CODE_WFE = 0x20,
 	CMDQ_CODE_EOC = 0x40,
+	CMDQ_CODE_WRITE_S = 0x90,
 	CMDQ_CODE_LOGIC = 0xa0,
 };
 
diff --git a/include/linux/soc/mediatek/mtk-cmdq.h b/include/linux/soc/mediatek/mtk-cmdq.h
index 2249ecaf77e4..9b0c57a0063d 100644
--- a/include/linux/soc/mediatek/mtk-cmdq.h
+++ b/include/linux/soc/mediatek/mtk-cmdq.h
@@ -12,6 +12,8 @@
 #include <linux/timer.h>
 
 #define CMDQ_NO_TIMEOUT		0xffffffffu
+#define CMDQ_ADDR_HIGH(addr)	((u32)(((addr) >> 16) & GENMASK(31, 0)))
+#define CMDQ_ADDR_LOW(addr)	((u16)(addr) | BIT(1))
 
 struct cmdq_pkt;
 
@@ -103,6 +105,23 @@ int cmdq_pkt_write_mask(struct cmdq_pkt *pkt, u8 subsys,
 			u16 offset, u32 value, u32 mask);
 
 /**
+ * cmdq_pkt_write_s() - append write_s command to the CMDQ packet
+ * @pkt:	the CMDQ packet
+ * @high_addr_reg_idx:	internal register ID which contains high address of pa
+ * @addr_low:	low address of pa
+ * @src_reg_idx:	the CMDQ internal register ID which cache source value
+ *
+ * Return: 0 for success; else the error code is returned
+ *
+ * Support write value to physical address without subsys. Use CMDQ_ADDR_HIGH()
+ * to get high address and call cmdq_pkt_assign() to assign value into internal
+ * reg. Also use CMDQ_ADDR_LOW() to get low address for addr_low parameter when
+ * call to this function.
+ */
+int cmdq_pkt_write_s(struct cmdq_pkt *pkt, u16 high_addr_reg_idx,
+		     u16 addr_low, u16 src_reg_idx);
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
