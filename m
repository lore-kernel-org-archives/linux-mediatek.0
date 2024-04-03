Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EBEBAC6FD1F
	for <linux-mediatek@archiver.kernel.org>; Wed,  3 Apr 2024 08:04:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dE8CZiIfKmGvgzSpu7F40SqpTOE/8BzlXpTbCxlZZYk=; b=xMdoqKPoEBK3y32xPAd6P4C67I
	+MYjjNkr0rMkPBxzD4B6mv+yx+zDGc013lR9pwHptFV+uK5pJTd7NcmK0VoGREDa9y22TVxspOVDE
	PKyh4R/ugB0MiuehPLuQQ21BckriN9LV6jUfglX0ZU9HzWin8XYx8nLKxQ/d21c/qLqpFVuMWJhbE
	BtalxAzz+Cr18wMXsNC5DmtcfUVWPI+sXHFtD+wKnXt/mtDSEmLFUT8Mk3/im8KH2tycXTtBTA7/3
	VEobzmEa1hMoxGYwLyowl+dDDaJnAC3MWYxP5d1GHz/sgm2fABMrMHvPKIz+I8AqpNp7VAmhXAMzq
	3Gatgexw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rrvbE-0000000EhxH-2pM6;
	Wed, 03 Apr 2024 08:04:00 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rruXh-0000000ELEE-3epf;
	Wed, 03 Apr 2024 06:56:19 +0000
X-UUID: 3fdf824af18711eeac1957ae9f99f617-20240402
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=dE8CZiIfKmGvgzSpu7F40SqpTOE/8BzlXpTbCxlZZYk=;
	b=fybZKq0JcHMkE4gUkerEDJOP2uaKxOgE8ErIc+xRNtEKEQGXAbAXg3M2M5PgM4R5wXu5bsnf3SUkfUxsqtI1mqC7aknXRTheskv5pMYYmBY/9SB2g71uBDmN8TODp+TVy+a3X7o4iZUP84TmjDHnPC/m9DREmJy4Iig0YSis1M4=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.37,REQID:b1194927-bad2-4d1e-9263-aa0b67ec9766,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:6f543d0,CLOUDID:de0f2a91-e2c0-40b0-a8fe-7c7e47299109,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,
	SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 3fdf824af18711eeac1957ae9f99f617-20240402
Received: from mtkmbs14n2.mediatek.inc [(172.21.101.76)] by mailgw01.mediatek.com
	(envelope-from <shawn.sung@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1287936714; Tue, 02 Apr 2024 23:56:08 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Wed, 3 Apr 2024 14:56:05 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Wed, 3 Apr 2024 14:56:05 +0800
From: Shawn Sung <shawn.sung@mediatek.com>
To: CK Hu <ck.hu@mediatek.com>, Jassi Brar <jassisinghbrar@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
CC: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>, Hsiao Chien Sung
	<shawn.sung@mediatek.com>, "Jason-JH . Lin" <jason-jh.lin@mediatek.com>,
	Houlong Wei <houlong.wei@mediatek.com>, <linux-kernel@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>
Subject: [PATCH v4 4/9] soc: mediatek: cmdq: Add cmdq_pkt_write_s_reg_value to support write value to reg
Date: Wed, 3 Apr 2024 14:55:58 +0800
Message-ID: <20240403065603.21920-5-shawn.sung@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20240403065603.21920-1-shawn.sung@mediatek.com>
References: <20240403065603.21920-1-shawn.sung@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--0.636100-8.000000
X-TMASE-MatchedRID: yvDAzrttxFVvH7GZAcw0g8nUT+eskUQPLoYOuiLW+uW3zA6sbFwEjUiO
	7+wNDdeY8AyWk2NFMNbijpjet3oGSAQmkMsZWj5BaK+MsTwM+1nEoDEGChh7CY1Oeo4wEgnh4Zq
	BDBR3qqFwiZTswXH9qIAy6p60ZV62fJ5/bZ6npdiujVRFkkVsm0VYvJDbAFkSlg/AIisVOb5l7h
	vMrjmw2XD7moxOdqjs/FpB9CS/XD0mTAwxQ5IiPidnO6jnpBt4ZAHSV/vY5Ue6wvEU69I2vY6H7
	DI0GsVcMmI24qiENwrMpIbcl3IoA+q1XYAYw09q9Z1yWryVTWo=
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--0.636100-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: CE74E8CC9BD28DFD694685B9C0F2F96CC51DF2ED01786BDEEDF2CCD9D9CC6A522000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240402_235617_976192_84E2B643 
X-CRM114-Status: GOOD (  12.25  )
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

From: "Jason-JH.Lin" <jason-jh.lin@mediatek.com>

Add cmdq_pkt_write_s_reg_value to support write a value to a register.

It appends write_s command to the command buffer in a CMDQ packet,
ask GCE to excute a write instruction to write a value to a register
with low 16 bits physical address offset.

Signed-off-by: Jason-JH.Lin <jason-jh.lin@mediatek.com>
Signed-off-by: Hsiao Chien Sung <shawn.sung@mediatek.com>
---
 drivers/soc/mediatek/mtk-cmdq-helper.c | 13 +++++++++++++
 include/linux/soc/mediatek/mtk-cmdq.h  | 11 +++++++++++
 2 files changed, 24 insertions(+)

diff --git a/drivers/soc/mediatek/mtk-cmdq-helper.c b/drivers/soc/mediatek/mtk-cmdq-helper.c
index 818e6ab24370a..1d79a127f2d3e 100644
--- a/drivers/soc/mediatek/mtk-cmdq-helper.c
+++ b/drivers/soc/mediatek/mtk-cmdq-helper.c
@@ -289,6 +289,19 @@ int cmdq_pkt_write_s_value(struct cmdq_pkt *pkt, u8 high_addr_reg_idx,
 }
 EXPORT_SYMBOL(cmdq_pkt_write_s_value);
 
+int cmdq_pkt_write_s_reg_value(struct cmdq_pkt *pkt, u8 high_addr_reg_idx, u32 value)
+{
+	struct cmdq_instruction inst = {};
+
+	inst.op = CMDQ_CODE_WRITE_S;
+	inst.dst_t = CMDQ_REG_TYPE;
+	inst.reg_dst = high_addr_reg_idx;
+	inst.value = value;
+
+	return cmdq_pkt_append_command(pkt, inst);
+}
+EXPORT_SYMBOL(cmdq_pkt_write_s_reg_value);
+
 int cmdq_pkt_write_s_mask_value(struct cmdq_pkt *pkt, u8 high_addr_reg_idx,
 				u16 addr_low, u32 value, u32 mask)
 {
diff --git a/include/linux/soc/mediatek/mtk-cmdq.h b/include/linux/soc/mediatek/mtk-cmdq.h
index 1edb391ec604a..854b8b3d6fad0 100644
--- a/include/linux/soc/mediatek/mtk-cmdq.h
+++ b/include/linux/soc/mediatek/mtk-cmdq.h
@@ -219,6 +219,17 @@ int cmdq_pkt_write_s_mask_value(struct cmdq_pkt *pkt, u8 high_addr_reg_idx,
  */
 int cmdq_pkt_mem_move(struct cmdq_pkt *pkt, dma_addr_t src_addr, dma_addr_t dst_addr);
 
+/**
+ * cmdq_pkt_write_s_reg_value() - append write_s command to the CMDQ packet which
+ *				  write value to a register with low address pa
+ * @pkt:	the CMDQ packet
+ * @high_addr_reg_idx:	internal register ID which contains high address of pa
+ * @value:	the specified target value
+ *
+ * Return: 0 for success; else the error code is returned
+ */
+int cmdq_pkt_write_s_reg_value(struct cmdq_pkt *pkt, u8 high_addr_reg_idx, u32 value);
+
 /**
  * cmdq_pkt_wfe() - append wait for event command to the CMDQ packet
  * @pkt:	the CMDQ packet
-- 
2.18.0


