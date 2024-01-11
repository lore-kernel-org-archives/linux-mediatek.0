Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E10ACC4707B
	for <linux-mediatek@archiver.kernel.org>; Thu, 11 Jan 2024 06:19:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=IC3+GLMr4LDNrilPLuhGf61AY9/fwVusNXb18FDOfF8=; b=mOVKWJXZA5Ch9rgg9sxlKViH8q
	D8skMg2EO30zGaMS+hp/dFRPijaLKprK6sbd03VQQoJkxUu1D3emdI4zpDsJhlV+W92Hj0ailpcz+
	7ULzhbdLab1xElPAjAVLD7drZTGQ/IlhVbNB33giDYBGlJPomLiWr9okrgBpq6vtWQgZkYM3kL3Af
	Y96OzkRkAzBKtRQBeaUbE/y6B0Yu4aIvv/AghtPz7n8wKUr5qfu0BKRGKKbqPyGMKufB72mCcQJN4
	Q4vAoW7uzW2/7MIkc75uDSR7Lf79eJHghqgQRK4341A0k8dDVDEDPub43dzJgXHNeon80pu6AzRUr
	g9ggfC6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rNoPG-00G48r-1B;
	Thu, 11 Jan 2024 06:19:10 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rNoPD-00G47v-2U
	for linux-mediatek@lists.infradead.org;
	Thu, 11 Jan 2024 06:19:09 +0000
X-UUID: 4f326944b04911ee9a662f17bb45267e-20240110
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=IC3+GLMr4LDNrilPLuhGf61AY9/fwVusNXb18FDOfF8=;
	b=W167zq8O5+tUC1JgntuS8WGQCz3XSlRmgXEhZw6pRRu3Wki/kbrXwWbkB/phukp4kD/81p/QlNTJaYxsX1eQGHrS2HsIP3WSeCi4hnf/aKjM/jTOH+HDK3puHWBUAM2mktlL31N/I/qUXeFMoMPQsvIGHMoz/BJcarA4ksCM73o=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.35,REQID:5c05d3e2-da13-4b0f-bf14-60f76039ca3d,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-5
X-CID-META: VersionHash:5d391d7,CLOUDID:ad67ba82-8d4f-477b-89d2-1e3bdbef96d1,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,
	DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 4f326944b04911ee9a662f17bb45267e-20240110
Received: from mtkmbs13n2.mediatek.inc [(172.21.101.108)] by mailgw02.mediatek.com
	(envelope-from <mingyen.hsieh@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 573353666; Wed, 10 Jan 2024 23:19:00 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Thu, 11 Jan 2024 14:18:57 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Thu, 11 Jan 2024 14:18:57 +0800
From: Mingyen Hsieh <mingyen.hsieh@mediatek.com>
To: <nbd@nbd.name>, <lorenzo@kernel.org>
CC: <deren.wu@mediatek.com>, <Sean.Wang@mediatek.com>,
	<Soul.Huang@mediatek.com>, <Leon.Yen@mediatek.com>,
	<Eric-SY.Chang@mediatek.com>, <km.lin@mediatek.com>,
	<robin.chiu@mediatek.com>, <ch.yeh@mediatek.com>, <posh.sun@mediatek.com>,
	<Quan.Zhou@mediatek.com>, <Ryder.Lee@mediatek.com>,
	<Shayne.Chen@mediatek.com>, <linux-wireless@vger.kernel.org>,
	<linux-mediatek@lists.infradead.org>, Ming Yen Hsieh
	<mingyen.hsieh@mediatek.com>, Leon Yen <leon.yen@mediatek.com>
Subject: [PATCH] wifi: mt76: mt792x: add the illegal value check for mtcl table of acpi
Date: Thu, 11 Jan 2024 14:18:56 +0800
Message-ID: <20240111061856.16370-1-mingyen.hsieh@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240110_221907_843731_6B39B631 
X-CRM114-Status: GOOD (  10.03  )
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

From: Ming Yen Hsieh <mingyen.hsieh@mediatek.com>

The mtcl table provided regulatory information for 5.9/6Ghz channels and
configured by platform venders. So, sometimes vendors may write illegal
values, and therefore it is necessary to check and add corresponding
handling for such cases.

Signed-off-by: Leon Yen <leon.yen@mediatek.com>
Signed-off-by: Ming Yen Hsieh <mingyen.hsieh@mediatek.com>
---
 drivers/net/wireless/mediatek/mt76/mt792x_acpi_sar.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt792x_acpi_sar.c b/drivers/net/wireless/mediatek/mt76/mt792x_acpi_sar.c
index e7afea87e82e..c64562216caa 100644
--- a/drivers/net/wireless/mediatek/mt76/mt792x_acpi_sar.c
+++ b/drivers/net/wireless/mediatek/mt76/mt792x_acpi_sar.c
@@ -353,11 +353,15 @@ static u8
 mt792x_acpi_get_mtcl_map(int row, int column, struct mt792x_asar_cl *cl)
 {
 	u8 config = 0;
+	u8 mode_6g, mode_5g9;
 
-	if (cl->cl6g[row] & BIT(column))
-		config |= (cl->mode_6g & 0x3) << 2;
+	mode_6g = (cl->mode_6g > 0x02) ? 0 : cl->mode_6g;
+	mode_5g9 = (cl->mode_5g9 > 0x01) ? 0 : cl->mode_5g9;
+
+	if ((cl->cl6g[row] & BIT(column)) || cl->mode_6g == 0x02)
+		config |= (mode_6g & 0x3) << 2;
 	if (cl->version > 1 && cl->cl5g9[row] & BIT(column))
-		config |= (cl->mode_5g9 & 0x3);
+		config |= (mode_5g9 & 0x3);
 
 	return config;
 }
-- 
2.18.0


