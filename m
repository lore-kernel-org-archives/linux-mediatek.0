Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6C80C25B47
	for <linux-mediatek@archiver.kernel.org>; Mon, 23 Oct 2023 15:42:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OODFBrWD2YdHLIMaPxgPkoQe+YPeSqhhGASu78652zg=; b=NvDMXGb4OXIMoLXBPYV/eSZjm3
	6EIuVrYCowRiz6t2sOhPTOz9cs8ZM4Vhi5ri2KX44Irf0LDWlWnAvgieLgpW+Nl1J9liV3KcVfjeQ
	GeESSYgmvGW2drmH82gldaAO3W4/yToRX2p1cqW+7G7I399UbXHJAfG+K6lC3i+guNU8a9eSGSg3r
	ZcTG5asDRKEtM1Lya/M3Z/tlhBpgqixNfcrtzoNGw1cPohozbgvh636SfUdyrSdkbAoOztxoiW7od
	SNcIAKs01XVf0TjuDF3M6o1O3JoewlIKUJqDNA7yAjXIH0QqxjaQAcGzGy0YJoa3zeUkvWcQBqvSH
	OIijnW7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qux4L-007iYW-24;
	Mon, 23 Oct 2023 15:42:17 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qux4E-007iVP-2z
	for linux-mediatek@lists.infradead.org;
	Mon, 23 Oct 2023 15:42:13 +0000
X-UUID: b5c35b9671ba11ee9b7791016c24628a-20231023
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=OODFBrWD2YdHLIMaPxgPkoQe+YPeSqhhGASu78652zg=;
	b=W2HWmiKrLYJ7W+WjaS270EreIMEbWYP3zGjHMlE/igWgCDbSHK9JtAy57wIZPyOvbD0fd01TTFO9BaATQBXdJLT73+G1eKF5FP8tyIng7jWWLS96/0B4SVQV3r1SEJGACgCfterrk7sqBKF6ZB+RaT6lotkKrhJjwRE/zLlorB8=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.32,REQID:367ea765-1b5c-4358-89c2-b93264fc2a92,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:5f78ec9,CLOUDID:a4db0d7d-ccd9-4df5-91ce-9df5fea3ae01,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,
	DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: b5c35b9671ba11ee9b7791016c24628a-20231023
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <shayne.chen@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 955532147; Mon, 23 Oct 2023 08:42:02 -0700
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 MTKMBS14N2.mediatek.inc (172.21.101.76) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Mon, 23 Oct 2023 23:41:59 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Mon, 23 Oct 2023 23:41:59 +0800
From: Shayne Chen <shayne.chen@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>
CC: linux-wireless <linux-wireless@vger.kernel.org>, Lorenzo Bianconi
	<lorenzo@kernel.org>, Ryder Lee <ryder.lee@mediatek.com>, Evelyn Tsai
	<evelyn.tsai@mediatek.com>, Bo Jiao <Bo.Jiao@mediatek.com>, linux-mediatek
	<linux-mediatek@lists.infradead.org>, MeiChia Chiu
	<meichia.chiu@mediatek.com>, Shayne Chen <shayne.chen@mediatek.com>
Subject: [PATCH 11/11] wifi: mt76: mt7996: fix rate usage of inband discovery frames
Date: Mon, 23 Oct 2023 23:38:54 +0800
Message-ID: <20231023153854.10708-11-shayne.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20231023153854.10708-1-shayne.chen@mediatek.com>
References: <20231023153854.10708-1-shayne.chen@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--3.857400-8.000000
X-TMASE-MatchedRID: QMK8gM4dfEOj5TZ/mbDRqrMjW/sniEQKojQrbrPpzzq4a2U7iYmMbv0u
	b/xgdoFf+etC/vPQiRhheBLULo49bD1LciJB3541G/6vWz3PVrSagpdUd+Iwz/+am84b5ALEZvo
	+mFW19mB8RMc7UuMnj3BZiwYVxkeSBrU1duOq6zSeAiCmPx4NwBnUJ0Ek6yhjxEHRux+uk8jfhP
	1xgyx3DLX67zmwfnIojpOpZQAlogVF/CBR0YUfMNJx+dUsVfZouzCP7pXpkh9Ssk6o+9mChgfDo
	rUSdKNUlrDDSgfqZQtKjZa1IyFrko6H7DI0GsVcMmI24qiENwrMpIbcl3IoA+q1XYAYw09qIdY9
	jOi4lTI=
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--3.857400-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: 06F67D7FD363C0CC59242D01E0DA41E3C3CEF3B002C2B77ADF322782365BAAB22000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231023_084210_973674_55FCF514 
X-CRM114-Status: UNSURE (   9.86  )
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

From: MeiChia Chiu <meichia.chiu@mediatek.com>

For UBPR and FILS frames, the BSS_CHANGED_BEACON flag will also be set,
which causes those frames to use the beacon rate in TX descriptors.
Adjust the statement to fix this issue.

Fixes: 98686cd21624 ("wifi: mt76: mt7996: add driver for MediaTek Wi-Fi 7 (802.11be) devices")
Signed-off-by: MeiChia Chiu <meichia.chiu@mediatek.com>
Signed-off-by: Shayne Chen <shayne.chen@mediatek.com>
---
 drivers/net/wireless/mediatek/mt76/mt7996/mac.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/mac.c b/drivers/net/wireless/mediatek/mt76/mt7996/mac.c
index f0dc47f56358..71ae8e263221 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7996/mac.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7996/mac.c
@@ -860,10 +860,10 @@ void mt7996_mac_write_txwi(struct mt7996_dev *dev, __le32 *txwi,
 	struct mt76_vif *mvif;
 	u16 tx_count = 15;
 	u32 val;
-	bool beacon = !!(changed & (BSS_CHANGED_BEACON |
-				    BSS_CHANGED_BEACON_ENABLED));
 	bool inband_disc = !!(changed & (BSS_CHANGED_UNSOL_BCAST_PROBE_RESP |
 					 BSS_CHANGED_FILS_DISCOVERY));
+	bool beacon = !!(changed & (BSS_CHANGED_BEACON |
+				    BSS_CHANGED_BEACON_ENABLED)) && (!inband_disc);
 
 	mvif = vif ? (struct mt76_vif *)vif->drv_priv : NULL;
 	if (mvif) {
-- 
2.39.2


