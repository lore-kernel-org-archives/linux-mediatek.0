Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D1CCCEF144
	for <linux-mediatek@archiver.kernel.org>; Tue,  8 Oct 2024 09:35:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KObO+N02QJWNWlrCzrkKzfPxOxdQRBkraCSwK4gaMBI=; b=HYs8rg2YoNZHPC3lL+6C9CwN9u
	bIv5VeNlDVSYkTTGR42A+eZLYiLNMJMsJluofOlHu+tHzxkIAjGHnaDgBL4YzewpDe3/QJupTLRf/
	9zmSVchApRbwHMISVECAVirdtvauqhma81YTU1yFannjBBQYxWTIJNq/poxSJK4Oh//urK1JrfJY0
	niaB6q+c6xA5zoaO8F+vKDiWQByoOMlI5EVidSExXZTwbt2BPE07RWKEjQZFvvA6m7+k2R0TYhj6n
	YxMnT112gWmd4leF36e/XX0U+nleMiopkEk/Qo9YRmqm9bj6iWxCm4GtJTrt+sZXQVLy0LBYnAwIe
	HAPJ+nfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sy6cd-00000005KRj-2HMs;
	Tue, 08 Oct 2024 09:35:15 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sy6Zv-00000005Jum-0ZOj;
	Tue, 08 Oct 2024 09:32:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1728379945;
	bh=RNy7f4IYf2GR8GpS+QPyUGvYiK6+9T8IXGPtykB2b6Y=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=jE8yfCzHL8c59S8JT3nca1jEHPbZlsqZrV+MC0GnYY8fyiCfgLHDna5MFhaIr9gSw
	 U+TlUikTsTiRVQD3lmsLEzlX04JYy/AvgLLwqJRRCI3RoTaH5Yep0HO5O09RXDvVhL
	 nLRjsrKtCQbQ3hQAlI0vngo8yAvLEU27csqmP70ZXLzyEvR7wU29cQiqBDY1bOeg5i
	 28e5V2pFxvb4NR/dkKFIeykRZy8Tav4Cs0RdxLW1EeZWFcCVlJsDq7Vmzw5mtttC9v
	 9lzrYfH4aTQVqZ7LFKD0g5uCKfNH6NL2ZLjuGjihfutNcUtd336s6qC7DPoQ5ngVoZ
	 eMVlIIbAIoBag==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 5321417E11FA;
	Tue,  8 Oct 2024 11:32:25 +0200 (CEST)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: linux-mediatek@lists.infradead.org
Cc: matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	kernel@collabora.com
Subject: [PATCH v2 1/2] soc: mediatek: mtk-cmdq: Move mask build and append to function
Date: Tue,  8 Oct 2024 11:32:19 +0200
Message-ID: <20241008093220.39734-2-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.46.1
In-Reply-To: <20241008093220.39734-1-angelogioacchino.delregno@collabora.com>
References: <20241008093220.39734-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241008_023227_349994_65109267 
X-CRM114-Status: GOOD (  11.65  )
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

Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com>
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
2.46.1


