Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3547CCA1016
	for <linux-mediatek@archiver.kernel.org>; Mon,  8 Sep 2025 07:27:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=JzvTKSBojOyOHfeUH4od6Fjnx/Xmw/ekzsIFLVMxL68=; b=sTCpeUWFAu7JGWqbv1N5cZDgpv
	lQW7fpuoPmeTktwag/SSl29j3Ji3RIBaGlP+RWWP8+OzkC7ZHuo7LZ909v5CmvZryf0irxKzZ71yt
	VY98RvToJjiGSnjyfKXCwAkj+5ceP98YJ9Picw0T7H/xixsy+otVxLDitOH+gjisRHKuhggOZbujY
	Nk5QaW3fbOOi147TFbHSxnZSA8qKx1mBzbFzcBNcdI/TjAKRicD4WZGL2//ciL+3YGshDg6Q2k8TF
	9TApEmJO9hL06XFcugefjFK4NAREvhTLvyFttDflfDS/0pZx02I/EcggCHCpynfOwW02kE7NQmTLK
	E3+sZlYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvWHb-0000000FHgH-3bo8;
	Mon, 08 Sep 2025 07:27:23 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvWFq-0000000FGrs-0RkM
	for linux-mediatek@lists.infradead.org;
	Mon, 08 Sep 2025 07:25:35 +0000
X-UUID: ffff14e88c8411f09eb0dd999d3936bf-20250908
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=JzvTKSBojOyOHfeUH4od6Fjnx/Xmw/ekzsIFLVMxL68=;
	b=GjtJDYMxCzfz8SN1+4kUj70+uZAPIxs9twzRV1h6hOdE9EbpxXPIW2ZB890iWnhszSKfGoRsfd9DGbKHfFC04zhBvywrZT2eKcHuLVtmtrKDpFRlAcJfxNU1ejgzNRa4ZM3W4Ll4EeEgAs4af/9+/cYD5jRNN+bAQKF8yRiqD/g=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.3,REQID:ea2d4991-771c-464a-972a-ba76fa370271,IP:0,UR
	L:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:-5
X-CID-META: VersionHash:f1326cf,CLOUDID:520b8c84-5317-4626-9d82-238d715c253f,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:-5,Content:0|15|50,EDM:-3,IP:
	nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,L
	ES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: ffff14e88c8411f09eb0dd999d3936bf-20250908
Received: from mtkmbs13n2.mediatek.inc [(172.21.101.108)] by mailgw02.mediatek.com
	(envelope-from <mingyen.hsieh@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 214036619; Mon, 08 Sep 2025 00:25:30 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs13n2.mediatek.inc (172.21.101.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.39; Mon, 8 Sep 2025 15:25:27 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1258.39 via Frontend Transport; Mon, 8 Sep 2025 15:25:27 +0800
From: Mingyen Hsieh <mingyen.hsieh@mediatek.com>
To: <nbd@nbd.name>, <lorenzo@kernel.org>
CC: <deren.wu@mediatek.com>, <Sean.Wang@mediatek.com>,
	<Leon.Yen@mediatek.com>, <Michael.Lo@mediatek.com>,
	<allan.wang@mediatek.com>, <Eric-SY.Chang@mediatek.com>,
	<km.lin@mediatek.com>, <Quan.Zhou@mediatek.com>, <Ryder.Lee@mediatek.com>,
	<Shayne.Chen@mediatek.com>, <linux-wireless@vger.kernel.org>,
	<linux-mediatek@lists.infradead.org>, Ming Yen Hsieh
	<mingyen.hsieh@mediatek.com>, <stable@vger.kernel.org>
Subject: [PATCH] wifi: mt76: mt7925: fix incorrect length field in txpower command
Date: Mon, 8 Sep 2025 15:25:26 +0800
Message-ID: <20250908072526.1833938-1-mingyen.hsieh@mediatek.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250908_002534_156994_4E6E7D2F 
X-CRM114-Status: UNSURE (   9.66  )
X-CRM114-Notice: Please train this message.
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

Set `tx_power_tlv->len` to `msg_len` instead of `sizeof(*tx_power_tlv)`
to ensure the correct message length is sent to firmware.

Cc: stable@vger.kernel.org
Fixes: c948b5da6bbe ("wifi: mt76: mt7925: add Mediatek Wi-Fi7 driver for mt7925 chips")
Signed-off-by: Ming Yen Hsieh <mingyen.hsieh@mediatek.com>
---
 drivers/net/wireless/mediatek/mt76/mt7925/mcu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
index 484bf11070c9..930a8cb83701 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
@@ -3940,7 +3940,7 @@ mt7925_mcu_rate_txpower_band(struct mt76_phy *phy,
 		memcpy(tx_power_tlv->alpha2, dev->alpha2, sizeof(dev->alpha2));
 		tx_power_tlv->n_chan = num_ch;
 		tx_power_tlv->tag = cpu_to_le16(0x1);
-		tx_power_tlv->len = cpu_to_le16(sizeof(*tx_power_tlv));
+		tx_power_tlv->len = cpu_to_le16(msg_len);
 
 		switch (band) {
 		case NL80211_BAND_2GHZ:
-- 
2.34.1


