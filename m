Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2855EC47422
	for <linux-mediatek@archiver.kernel.org>; Fri, 26 Jan 2024 09:10:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Mxe9YMOLMzMZFhwTa8VmHQ3UMCw1Y/jz7/bPWaSqf7w=; b=3ELQ5lRDjndcNH4v+A+Bi8nzzZ
	VA17LlsaADl5o2EUJoAZPZYq914E9TgP7rOdz7RGefsxKh4QfHZd8LKFdbY82V17ecu07G2ZnTG2S
	Fl6PpnSbnOAT8Hbwqr4lZkjzJhDgHkySjbNe7UEAU08ym713U1LQqF0tEhM3qCly8G2tkB70s6dx1
	FZiW2/QKmdCR8gbeoq8DdDztAkYRm8TrcKVkEI3WhZMEGjYORN1dVxYX6aG4KDg0/Av2dPNgDZmow
	SxlqY0vnOJ5iveYUfAiN2m4IL94P31EuJJkpwAhokRHfGTaKM/0n2061pUu1GN3MBG1QgOOPeIKPs
	vvYPwHww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rTIDn-00000003ZxM-2LZI;
	Fri, 26 Jan 2024 09:09:59 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rTIDl-00000003Zvf-2iNZ
	for linux-mediatek@lists.infradead.org;
	Fri, 26 Jan 2024 09:09:58 +0000
X-UUID: aaddfac8bc2a11ee9a263b4415211400-20240126
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=Mxe9YMOLMzMZFhwTa8VmHQ3UMCw1Y/jz7/bPWaSqf7w=;
	b=KRIo7nEgxTlNqe1PUJybsK5fFAI2tYBvpiCFxcD3Fp5TnonnCZXps8vMuRYWP70W7Y6U+n2I9KBWBI1ERbhiJOhse6HL5cXKpEdgVuruDkcDZzFWKifgolYj4f6Q2rUQZyPSlUb+8qykA6vTeL0h40kQZJpG+X1FxlmqXEy3aZs=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.36,REQID:d1d6784d-da6e-4172-aa23-c2f71f122e6c,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-5
X-CID-META: VersionHash:6e16cf4,CLOUDID:606f2efe-c16b-4159-a099-3b9d0558e447,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,
	SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: aaddfac8bc2a11ee9a263b4415211400-20240126
Received: from mtkmbs14n1.mediatek.inc [(172.21.101.75)] by mailgw01.mediatek.com
	(envelope-from <shayne.chen@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 281552696; Fri, 26 Jan 2024 02:09:53 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Fri, 26 Jan 2024 17:09:50 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Fri, 26 Jan 2024 17:09:50 +0800
From: Shayne Chen <shayne.chen@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>
CC: linux-wireless <linux-wireless@vger.kernel.org>, Lorenzo Bianconi
	<lorenzo@kernel.org>, Ryder Lee <ryder.lee@mediatek.com>, Evelyn Tsai
	<evelyn.tsai@mediatek.com>, Bo Jiao <Bo.Jiao@mediatek.com>, linux-mediatek
	<linux-mediatek@lists.infradead.org>, Benjamin Lin
	<benjamin-jw.lin@mediatek.com>, Shayne Chen <shayne.chen@mediatek.com>
Subject: [PATCH v2 12/12] wifi: mt76: mt7996: fix HIF_TXD_V2_1 value
Date: Fri, 26 Jan 2024 17:09:23 +0800
Message-ID: <20240126090923.6357-12-shayne.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20240126090923.6357-1-shayne.chen@mediatek.com>
References: <20240126090923.6357-1-shayne.chen@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10-1.565400-8.000000
X-TMASE-MatchedRID: WhX2Z2Jh4guxPzLFhIhLtOqwWVBfMuvosf4f4CxxueRcKZwALwMGs/6g
	KWYq1ITooTxdbGQ8kfwC3W6W/V0xYnEjLiYgp5vhA9lly13c/gH0O7M3lSnTWw5SzgJNSArLGYZ
	yDsDw4jHdy+E+4eJ1r2a39PjWf0NNHxPMjOKY7A8LbigRnpKlKZvjAepGmdoOTKHZx+R6KtXPRO
	JT51I+rEROU9MQMinQGBAxtnogc5AVoqRZnecrH3pFLImwD75PAOE1irTUDeivoYiLu4poEs6yD
	Lli/pujSZrfNhP3sgUBh9AgBSEFrJm+YJspVvj2xkvrHlT8euIlGuy8+eyjlw==
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10-1.565400-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: 5E2EC1A1DF91FA96178C79B55395F2805A57A6958C40654228BD4E0C9028858B2000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240126_010957_714944_46D3A002 
X-CRM114-Status: UNSURE (   9.70  )
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

From: Benjamin Lin <benjamin-jw.lin@mediatek.com>

Sync the value of HIF_TXD_V2_1 with firmware to let it correctly fill
TXD values for HW path.

Fixes: 98686cd21624 ("wifi: mt76: mt7996: add driver for MediaTek Wi-Fi 7 (802.11be) devices")
Signed-off-by: Benjamin Lin <benjamin-jw.lin@mediatek.com>
Signed-off-by: Shayne Chen <shayne.chen@mediatek.com>
---
 drivers/net/wireless/mediatek/mt76/mt7996/init.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/init.c b/drivers/net/wireless/mediatek/mt76/mt7996/init.c
index 5ae56b10f2b9..283df84f1b43 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7996/init.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7996/init.c
@@ -493,7 +493,7 @@ static void mt7996_mac_init_basic_rates(struct mt7996_dev *dev)
 
 void mt7996_mac_init(struct mt7996_dev *dev)
 {
-#define HIF_TXD_V2_1	4
+#define HIF_TXD_V2_1	0x21
 	int i;
 
 	mt76_clear(dev, MT_MDP_DCR2, MT_MDP_DCR2_RX_TRANS_SHORT);
-- 
2.39.2


