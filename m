Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54CC8CCD194
	for <linux-mediatek@archiver.kernel.org>; Wed, 18 Sep 2024 10:07:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=x8UD7Z7LUBUIB4ydHgoH9IJeLwYyxSrlCJZhI7F+S4s=; b=IgvCNcXvcnqSMjojXBoBTBho8s
	3OFiGDfhLyTzhURZ8GLn8JMTB6HPYtHJCsKhUgYGjs2xDCSyNUktUKEo9AkgPAzBUZNtHu32o2Q58
	S0G5R97Vzol6bcSqTtOHITDdd1ERP/VClZk4iIeREDOtAfm+T5pZWeCmpiDGkB1Rz0bRmHVBd2kJ0
	+C5atvQ5Po05uFAC3NIaYfjeMZMukb4D0uNMV267x99WF3bWZqe2e5mPRDPJMeKH+N55KVDHyjzrA
	H2X6Zbek4PpdP7kBDIj5IrKQU/4Q02GA2/KqIwJPySu483hX8C/UOTzmzIHHNXbyxZJu5uOTYbEs6
	uXGUqgmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sqrb5-00000007zM0-3sE5;
	Wed, 18 Sep 2024 10:07:43 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sqrZz-00000007z8X-1OWx;
	Wed, 18 Sep 2024 10:06:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1726653993;
	bh=0RM0X8+Uj/yAzEVGnz19COcilxf0hCC5AuSLiaf0NTs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=cy8YUnLgjynfq2iwDDexAgxK1h+DtpsNktVHZ8fjZ52MtX7gaQfXTaLBCKfzTds3x
	 eKJU7jcCvvGdJEcdHDgAjvUb2Qy1aePq3OFaZ6e9qdIw8sgKJcLIV8pmSysDXvOFZf
	 qy9uEcFwt3padA3a9+303USK5Sl6K2zPoXh8nydGNFmbfdbAYyhWguJxB7CShuPpba
	 yuybq5hKc8uwEjpLpJ1wZww8nHfdXtPCUMuQ1dlfqUWQ5dDKnnom3y6uGRdgq8XASO
	 QH1cD9QGYDFmXtb+4hSao1zozNrEc6iTGNTfkPa3tcSSI5RRK1kyQkqbam5PsrvSlW
	 0yECGqZF2JvHg==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id BF25B17E10AE;
	Wed, 18 Sep 2024 12:06:32 +0200 (CEST)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: linux-mediatek@lists.infradead.org
Cc: matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	kernel@collabora.com
Subject: [PATCH v1 1/3] soc: mediatek: mtk-cmdq: Move mask build and append to function
Date: Wed, 18 Sep 2024 12:06:18 +0200
Message-ID: <20240918100620.103536-2-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240918100620.103536-1-angelogioacchino.delregno@collabora.com>
References: <20240918100620.103536-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240918_030635_546596_FE694708 
X-CRM114-Status: GOOD (  11.60  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Move the CMDQ_CODE_MASK packet build and append logic to a new
cmdq_pkt_mask() function; this reduces code duplication by 4x.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/soc/mediatek/mtk-cmdq-helper.c | 31 ++++++++++++--------------
 1 file changed, 14 insertions(+), 17 deletions(-)

diff --git a/drivers/soc/mediatek/mtk-cmdq-helper.c b/drivers/soc/mediatek/mtk-cmdq-helper.c
index a8fccedba83f..620c371fd1fc 100644
--- a/drivers/soc/mediatek/mtk-cmdq-helper.c
+++ b/drivers/soc/mediatek/mtk-cmdq-helper.c
@@ -180,6 +180,15 @@ static int cmdq_pkt_append_command(struct cmdq_pkt *pkt,
 	return 0;
 }
 
+static int cmdq_pkt_mask(struct cmdq_pkt *pkt, u32 mask)
+{
+	struct cmdq_instruction inst = {
+		.op = CMDQ_CODE_MASK,
+		.mask = ~mask
+	};
+	return cmdq_pkt_append_command(pkt, inst);
+}
+
 int cmdq_pkt_write(struct cmdq_pkt *pkt, u8 subsys, u16 offset, u32 value)
 {
 	struct cmdq_instruction inst;
@@ -196,14 +205,11 @@ EXPORT_SYMBOL(cmdq_pkt_write);
 int cmdq_pkt_write_mask(struct cmdq_pkt *pkt, u8 subsys,
 			u16 offset, u32 value, u32 mask)
 {
-	struct cmdq_instruction inst = { {0} };
 	u16 offset_mask = offset;
 	int err;
 
 	if (mask != 0xffffffff) {
-		inst.op = CMDQ_CODE_MASK;
-		inst.mask = ~mask;
-		err = cmdq_pkt_append_command(pkt, inst);
+		err = cmdq_pkt_mask(pkt, mask);
 		if (err < 0)
 			return err;
 
@@ -251,9 +257,7 @@ int cmdq_pkt_write_s_mask(struct cmdq_pkt *pkt, u16 high_addr_reg_idx,
 	struct cmdq_instruction inst = {};
 	int err;
 
-	inst.op = CMDQ_CODE_MASK;
-	inst.mask = ~mask;
-	err = cmdq_pkt_append_command(pkt, inst);
+	err = cmdq_pkt_mask(pkt, mask);
 	if (err < 0)
 		return err;
 
@@ -288,9 +292,7 @@ int cmdq_pkt_write_s_mask_value(struct cmdq_pkt *pkt, u8 high_addr_reg_idx,
 	struct cmdq_instruction inst = {};
 	int err;
 
-	inst.op = CMDQ_CODE_MASK;
-	inst.mask = ~mask;
-	err = cmdq_pkt_append_command(pkt, inst);
+	err = cmdq_pkt_mask(pkt, mask);
 	if (err < 0)
 		return err;
 
@@ -409,12 +411,9 @@ EXPORT_SYMBOL(cmdq_pkt_poll);
 int cmdq_pkt_poll_mask(struct cmdq_pkt *pkt, u8 subsys,
 		       u16 offset, u32 value, u32 mask)
 {
-	struct cmdq_instruction inst = { {0} };
 	int err;
 
-	inst.op = CMDQ_CODE_MASK;
-	inst.mask = ~mask;
-	err = cmdq_pkt_append_command(pkt, inst);
+	err = cmdq_pkt_mask(pkt, mask);
 	if (err < 0)
 		return err;
 
@@ -436,9 +435,7 @@ int cmdq_pkt_poll_addr(struct cmdq_pkt *pkt, dma_addr_t addr, u32 value, u32 mas
 	 * which enables use_mask bit.
 	 */
 	if (mask != GENMASK(31, 0)) {
-		inst.op = CMDQ_CODE_MASK;
-		inst.mask = ~mask;
-		ret = cmdq_pkt_append_command(pkt, inst);
+		ret = cmdq_pkt_mask(pkt, mask);
 		if (ret < 0)
 			return ret;
 		use_mask = CMDQ_POLL_ENABLE_MASK;
-- 
2.46.0


