Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B764C6379F
	for <linux-mediatek@archiver.kernel.org>; Tue, 17 Jan 2023 03:37:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=khGtf/yFaQhuUYw3+sDq4AMQJejakM42FizGJgu2Vp4=; b=TM0hDOKQJs5W4ryguQdQUYd8X+
	jAyK45CG2g21nFRIoNB1nWxMObpbkXq25UArSmwFg1zSqipDngPYNsfU88Hit0C4ETXqO1XNB3ktI
	saOlR7rlWeffjr1P9HP/H5H6ec6JzYCtdZkrT4HjL3r612oq2p3AXGGgbf77MxMp9mOqpTJRIVwOL
	tQpcK7ONucG/b0tyQL5oGxSjR3l+Pll9EWTOP1aWTdKUsXhW6YnllQvHErGSNEy5pwAYANkllbgt9
	gB5vM3zOa954iBRJo+B/d71cZ0/jQ8Ju7ldJXeqxYvApNL2xm4VAlU+YOdMWlcw1cb2DNAFxjR0u/
	tkep02vw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pHcmS-00Cl7X-W8; Tue, 17 Jan 2023 03:37:01 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pHcmQ-00Cl5R-95; Tue, 17 Jan 2023 03:36:59 +0000
X-UUID: 2d5c3de6961811edbbe3f76fe852e059-20230116
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=khGtf/yFaQhuUYw3+sDq4AMQJejakM42FizGJgu2Vp4=;
	b=PTIQZV/MFy3R8b9uI1mOJWsKeHEp8ajs5VZdtvHrzDwMvK/BP555eLmOo6vhECPrhPn+B3+DhaFUA0hsJM5FwvuFNsGbST8LDsqhO3myD83k49rozuqbrmMoIgCuLof52rBjVuc1bVfOWhC6nc06b7DJPFtdYyXUIaxTKXJH2j8=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.18,REQID:b73e4bcd-9bce-44be-b49f-e26749f919e7,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-5
X-CID-META: VersionHash:3ca2d6b,CLOUDID:859902f6-ff42-4fb0-b929-626456a83c14,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0
X-CID-BVR: 0
X-UUID: 2d5c3de6961811edbbe3f76fe852e059-20230116
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <allen-kh.cheng@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1700433851; Mon, 16 Jan 2023 20:36:50 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs13n1.mediatek.inc (172.21.101.193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Tue, 17 Jan 2023 11:26:46 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Tue, 17 Jan 2023 11:26:46 +0800
From: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
To: Matthias Brugger <matthias.bgg@gmail.com>, Enric Balletbo i Serra
	<enric.balletbo@collabora.com>
CC: <Project_Global_Chrome_Upstream_Group@mediatek.com>,
	<angelogioacchino.delregno@collabora.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<linux-mediatek@lists.infradead.org>, Allen-KH Cheng
	<allen-kh.cheng@mediatek.com>
Subject: [PATCH 1/2] soc: mediatek: pm-domains: Add buck isolation offset and mask to power domain data
Date: Tue, 17 Jan 2023 11:26:39 +0800
Message-ID: <20230117032640.13504-2-allen-kh.cheng@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20230117032640.13504-1-allen-kh.cheng@mediatek.com>
References: <20230117032640.13504-1-allen-kh.cheng@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230116_193658_351229_C2BB2C36 
X-CRM114-Status: GOOD (  10.04  )
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

Add buck isolation offset and mask to power domain data.

Signed-off-by: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/soc/mediatek/mtk-pm-domains.h | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/soc/mediatek/mtk-pm-domains.h b/drivers/soc/mediatek/mtk-pm-domains.h
index 7d3c0c36316c..a5f24c58e35a 100644
--- a/drivers/soc/mediatek/mtk-pm-domains.h
+++ b/drivers/soc/mediatek/mtk-pm-domains.h
@@ -81,6 +81,8 @@ struct scpsys_bus_prot_data {
  * @ctl_offs: The offset for main power control register.
  * @sram_pdn_bits: The mask for sram power control bits.
  * @sram_pdn_ack_bits: The mask for sram power control acked bits.
+ * @ext_buck_iso_offs: The offset for external buck isolation
+ * @ext_buck_iso_mask: The mask for external buck isolation
  * @caps: The flag for active wake-up action.
  * @bp_infracfg: bus protection for infracfg subsystem
  * @bp_smi: bus protection for smi subsystem
@@ -91,6 +93,8 @@ struct scpsys_domain_data {
 	int ctl_offs;
 	u32 sram_pdn_bits;
 	u32 sram_pdn_ack_bits;
+	int ext_buck_iso_offs;
+	u32 ext_buck_iso_mask;
 	u8 caps;
 	const struct scpsys_bus_prot_data bp_infracfg[SPM_MAX_BUS_PROT_DATA];
 	const struct scpsys_bus_prot_data bp_smi[SPM_MAX_BUS_PROT_DATA];
-- 
2.18.0


