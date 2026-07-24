Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D30DC531FA
	for <linux-mediatek@archiver.kernel.org>; Fri, 24 Jul 2026 08:48:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=nyWiYmrY82lGfKhVlYkrW3OPfzhavRcnPcOFfJYwljI=; b=AXb0ihzdWMBlnv9SiHdaAqX5ez
	u/T45NfW3T2tJ3SHnXr793L69JUlUhAtzidr5Kwoc+a3o0yotmnpB5Tykyxft3fTIPWauuBHLMNPp
	S1MsREoidwZWOENqZ/Iso8OfHyFzBAEfr3MghlLukErgjB5/XEatVhY5fclQKtcywNoo16r15+D13
	+FM/iV2OYKrwZAEGrfyemmJ+IPhOeGJRGZfbVO+121MwV7FOHv18OONXG7aN8yKchCS6ntEh47K2h
	D9hLy5ZUI68MfflbbkxCriLHLHKZMfe6iwe9XRQFP4dJ5o9ByJ4QGznSjwK2l4DZqaFqVX55NJGPq
	A3XwkiXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnBaG-0000000FsZP-3WAV;
	Fri, 24 Jul 2026 08:48:44 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnBaB-0000000FsXy-23K9
	for linux-mediatek@lists.infradead.org;
	Fri, 24 Jul 2026 08:48:42 +0000
X-UUID: 732de6a8873c11f1acbe4559397dec65-20260724
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=nyWiYmrY82lGfKhVlYkrW3OPfzhavRcnPcOFfJYwljI=;
	b=rPG3qLhtxp48dUKxa1MQEV059nqkG3dRb8lNjtSn1Fnj6GulZcVXgrLqjcRaBPO01oibLmD0rekceltbBZSAnr5hXc+Xm2AWgpZTwnIeJ80XU/QmcEmaf0K7qstPp1B0At8CK+aKkR5hL0Cdxn53jOU844CFQGrxT91etwFo8ns=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.18,REQID:6d7a7c47-03ea-4ea5-bde3-1fcdd2adaa82,IP:0,U
	RL:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-25
X-CID-META: VersionHash:8a735a6,CLOUDID:c2094254-ba59-46c6-b844-86065e9edbd3,B
	ulkID:nil,BulkQuantity:0,SF:102|836|865|888|898,TC:-5,Content:0|15|50|99,E
	DM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:-1,COL:0,OSI:0,OSA:0,
	AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 732de6a8873c11f1acbe4559397dec65-20260724
Received: from mtkmbs13n1.mediatek.inc [(172.21.101.193)] by mailgw02.mediatek.com
	(envelope-from <jb.tsai@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1337112642; Fri, 24 Jul 2026 01:48:32 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 MTKMBS09N1.mediatek.inc (172.21.101.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Fri, 24 Jul 2026 16:48:30 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Fri, 24 Jul 2026 16:48:30 +0800
From: JB Tsai <jb.tsai@mediatek.com>
To: <nbd@nbd.name>, <lorenzo@kernel.org>
CC: <linux-wireless@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
	<Sean.Wang@mediatek.com>, <Quan.Zhou@mediatek.com>, <Ryder.Lee@mediatek.com>,
	<litien.chang@mediatek.com>, <Charlie-cy.Wu@mediatek.com>,
	<jb.tsai@mediatek.com>
Subject: [PATCH] wifi: mt76: mt792x: skip MTCL country list lookup for default BE mode
Date: Fri, 24 Jul 2026 16:48:29 +0800
Message-ID: <20260724084829.3154190-1-jb.tsai@mediatek.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260724_014839_535264_DC47470E 
X-CRM114-Status: GOOD (  11.89  )
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

From: Charlie-cy Wu <Charlie-cy.Wu@mediatek.com>

In the v3 MTCL country list parsing, a mode_be value of 0x02 indicates
that 11BE enablement should follow the driver default instead of being
gated by the per-country BE bitmap.

Handle this case explicitly: when cl->mode_be == 0x02, skip the BE/EU
country list matching and return the driver default configuration
directly, avoiding an unnecessary lookup.

Fixes: 7cebc2300de2 ("wifi: mt76: mt792x: extend MTCL of APCI to version3 for EHT control")
Signed-off-by: Charlie-cy Wu <Charlie-cy.Wu@mediatek.com>
---
 drivers/net/wireless/mediatek/mt76/mt792x_acpi_sar.c | 11 +++++++----
 drivers/net/wireless/mediatek/mt76/mt792x_acpi_sar.h |  7 +++++++
 2 files changed, 14 insertions(+), 4 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt792x_acpi_sar.c b/drivers/net/wireless/mediatek/mt76/mt792x_acpi_sar.c
index 946dd7956e4a..868feadbff61 100644
--- a/drivers/net/wireless/mediatek/mt76/mt792x_acpi_sar.c
+++ b/drivers/net/wireless/mediatek/mt76/mt792x_acpi_sar.c
@@ -388,7 +388,7 @@ mt792x_acpi_get_mtcl_map_v3(int row, int column, struct mt792x_asar_cl_v3 *cl)
 	u32 config = 0;
 	u8 mode_be = 0;
 
-	mode_be = (cl->mode_be > 0x02) ? 0 : cl->mode_be;
+	mode_be = (cl->mode_be > MT792X_ACPI_MTCL_MODE_DEFAULT) ? 0 : cl->mode_be;
 
 	if (cl->version > 2 && cl->clbe[row] & BIT(column))
 		config |= (mode_be & 0x3) << 4;
@@ -402,10 +402,10 @@ mt792x_acpi_get_mtcl_map(int row, int column, struct mt792x_asar_cl *cl)
 	u32 config = 0;
 	u8 mode_6g, mode_5g9;
 
-	mode_6g = (cl->mode_6g > 0x02) ? 0 : cl->mode_6g;
-	mode_5g9 = (cl->mode_5g9 > 0x01) ? 0 : cl->mode_5g9;
+	mode_6g = (cl->mode_6g > MT792X_ACPI_MTCL_MODE_DEFAULT) ? 0 : cl->mode_6g;
+	mode_5g9 = (cl->mode_5g9 > MT792X_ACPI_MTCL_MODE_ENABLE) ? 0 : cl->mode_5g9;
 
-	if ((cl->cl6g[row] & BIT(column)) || cl->mode_6g == 0x02)
+	if ((cl->cl6g[row] & BIT(column)) || cl->mode_6g == MT792X_ACPI_MTCL_MODE_DEFAULT)
 		config |= (mode_6g & 0x3) << 2;
 	if (cl->version > 1 && cl->cl5g9[row] & BIT(column))
 		config |= (mode_5g9 & 0x3);
@@ -426,6 +426,9 @@ mt792x_acpi_parse_mtcl_tbl_v3(struct mt792x_phy *phy, char *alpha2)
 	if (!cl)
 		return MT792X_ACPI_MTCL_INVALID;
 
+	if (cl->mode_be == MT792X_ACPI_MTCL_MODE_DEFAULT)
+		goto out;
+
 	for (i = 0; i < ARRAY_SIZE(cc_list_be); i++) {
 		col = 7 - i % 8;
 		row = i / 8;
diff --git a/drivers/net/wireless/mediatek/mt76/mt792x_acpi_sar.h b/drivers/net/wireless/mediatek/mt76/mt792x_acpi_sar.h
index 474033073831..110f68438d90 100644
--- a/drivers/net/wireless/mediatek/mt76/mt792x_acpi_sar.h
+++ b/drivers/net/wireless/mediatek/mt76/mt792x_acpi_sar.h
@@ -17,6 +17,13 @@
 
 #define MT792X_ACPI_MTCL_INVALID	0xffffffff
 
+/* MTCL per-band control mode (mode_6g/mode_5g9/mode_be) */
+enum {
+	MT792X_ACPI_MTCL_MODE_DISABLE	= 0x00,	/* force disable */
+	MT792X_ACPI_MTCL_MODE_ENABLE	= 0x01,	/* enable if driver & BIOS support */
+	MT792X_ACPI_MTCL_MODE_DEFAULT	= 0x02,	/* supporting depends on driver setting */
+};
+
 struct mt792x_asar_dyn_limit {
 	u8 idx;
 	u8 frp[5];
-- 
2.18.0


