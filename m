Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA10BCD128A
	for <linux-mediatek@archiver.kernel.org>; Wed,  3 Apr 2024 10:26:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=w9esVtcsVLWuIOEYSc/JKGQ0Zy+DWUvB3n2nojlJx2k=; b=b9e3iG7n0oiJ5Wl9AGzshInsik
	3r/fxEeiG1glksje1yTMzqRc2J++oTFrLR82mYaQ4Bb40kk7ezrjCFWXrww7Bma3UFNasNutAc3rz
	XcGNcpyh1n7rf1ZLRUWS4WDp2tdHmFjc7U+o2CWxQ7t0u4LiG1iJ0GeRGvOuNIrtmXopEDf5zNizG
	WaZOCJH1FAnhdCbBcaD6X++DHZzZQVoqHE0x/7GD7EKPiQ9Hi+pg57Dk4gsbB82eJUiFN6ZRNf0tD
	Bl2U/z6lRpCeff5jCqcfKuvGW8sjiV2G8lkU5gRzvguPEWBWJzTOKEG5tbCgc9QUg5nIJ2hT7h0/J
	RTAsxxfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rrxpS-0000000FUDo-2BhH;
	Wed, 03 Apr 2024 10:26:50 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rrxpC-0000000FU2f-0iwz;
	Wed, 03 Apr 2024 10:26:45 +0000
X-UUID: 95840988f1a411ee96d5dfc950b7243d-20240403
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=w9esVtcsVLWuIOEYSc/JKGQ0Zy+DWUvB3n2nojlJx2k=;
	b=Mgqw48cuFx9qaDt3R0E8AaDxUhO0dOQD4S4+7t2MVfNzhoDLFHKY0rTa1UIVEVqnle7b9+ePy2RjhVKT8psrQVXARp12jKVIPLfPdE0Mb4I/a/i3PPkniHFQfCy/y4UH1AVxlFtcqBINd+fBACYhhz6mRqFZM9jhwg5ARjWA7E4=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.37,REQID:b8ff4e67-6cd3-49cb-90ab-f2d6ca6f6d6e,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:6f543d0,CLOUDID:b09b2c91-e2c0-40b0-a8fe-7c7e47299109,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,
	SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 95840988f1a411ee96d5dfc950b7243d-20240403
Received: from mtkmbs14n1.mediatek.inc [(172.21.101.75)] by mailgw02.mediatek.com
	(envelope-from <shawn.sung@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1753398786; Wed, 03 Apr 2024 03:26:08 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Wed, 3 Apr 2024 18:26:04 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Wed, 3 Apr 2024 18:26:04 +0800
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
Subject: [PATCH v5 04/10] soc: mediatek: cmdq: Add cmdq_pkt_write_s_reg_value to support write value to reg
Date: Wed, 3 Apr 2024 18:25:56 +0800
Message-ID: <20240403102602.32155-5-shawn.sung@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20240403102602.32155-1-shawn.sung@mediatek.com>
References: <20240403102602.32155-1-shawn.sung@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--0.023400-8.000000
X-TMASE-MatchedRID: d+baqQ3qUqdvH7GZAcw0g8nUT+eskUQPLoYOuiLW+uW3zA6sbFwEjUiO
	7+wNDdeY8AyWk2NFMNbijpjet3oGSAQmkMsZWj5BaK+MsTwM+1lD3kXYiJVSRAbYcy9YQl6essf
	Gi2vQI7ji8zVgXoAltsIJ+4gwXrEtWBd6ltyXuvu7p9y7WlAwYv9XKjczNRSzdkokiizq+eSNgZ
	n0ZESZa4XO5VpZXxmYePCEu2U9xgShnbnFPdRZvgea3kOUi79I/CPHo3PMGmuAhOcaQrQ0U1GyR
	coeF18qmKP0zzpTAeGwod8xOMKmvMCBO+zxAW5pftwZ3X11IV0=
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--0.023400-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: BCBF0BDA709DBE8153C81139EA83AFD7A199DB842321E3A92A1AB23467E6F9482000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240403_032634_334086_0A969E68 
X-CRM114-Status: GOOD (  12.39  )
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
index 72350138591c3..42a0194198d5b 100644
--- a/drivers/soc/mediatek/mtk-cmdq-helper.c
+++ b/drivers/soc/mediatek/mtk-cmdq-helper.c
@@ -292,6 +292,19 @@ int cmdq_pkt_write_s_value(struct cmdq_pkt *pkt, u8 high_addr_reg_idx,
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
index 1edb391ec604a..7bd77d40a5720 100644
--- a/include/linux/soc/mediatek/mtk-cmdq.h
+++ b/include/linux/soc/mediatek/mtk-cmdq.h
@@ -207,6 +207,17 @@ int cmdq_pkt_write_s_value(struct cmdq_pkt *pkt, u8 high_addr_reg_idx,
 int cmdq_pkt_write_s_mask_value(struct cmdq_pkt *pkt, u8 high_addr_reg_idx,
 				u16 addr_low, u32 value, u32 mask);
 
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
  * cmdq_pkt_mem_move() - append memory move command to the CMDQ packet
  * @pkt:	the CMDQ packet
-- 
2.18.0


