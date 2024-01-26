Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C8D4C48286
	for <linux-mediatek@archiver.kernel.org>; Fri, 26 Jan 2024 09:10:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=i0tTUYG/l096SaouHUHaEj3UA6G711wmON0ZnJcg88U=; b=UsNalGfxZKtHK+tsYCtKNEr4EE
	BNijvawita997SckuXtBM7xGt2uwh3GlRSdTLsBhEiE6YRMSce4XHINnNjCgcxpGdyZSaCYPczlX4
	+u2LoWwiFf5tcIDnPXIRyRwRhtTIalzRFlfbluVLr/hGmFExRy989U+e9E/sMq6GaunPc40PVmkht
	hxdfHTN0ULdaGnbj+BArJMN5H48xHARhxwtxo2GrK0mFcnS9L48lPVyN5Py6+GW8xTl4SIL1qwGgU
	/rHKQfQe4UJ23IL8dir8rZvLS+AJBRoR936F/ZfwpGK4Dy/69zUfVhu/4x00GEZiT4u0KnjK5u+ap
	166NHKoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rTIEP-00000003aL3-3n8p;
	Fri, 26 Jan 2024 09:10:37 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rTIEJ-00000003aFE-2srf
	for linux-mediatek@lists.infradead.org;
	Fri, 26 Jan 2024 09:10:33 +0000
X-UUID: beb0dcbebc2a11ee9a263b4415211400-20240126
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=i0tTUYG/l096SaouHUHaEj3UA6G711wmON0ZnJcg88U=;
	b=gGAKENn8kbN0UDhHBsMRcZdp5Nq6dXdiWSIzvOj9iEuLgOPx4jyp0G2p5+B+mwl2CABzFpmCO2maFcFO1TPiA8o3usY8grRFKlBpobAnID+2OyFSfVVjYC+Yp/sdpGzEQ0P2mAEpU2CkgFJWDl2E6BnLUH3zFGP2azRsoLk3hIQ=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.36,REQID:c7cade3f-f4f7-44be-8d95-27d84194b592,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:6e16cf4,CLOUDID:3f712efe-c16b-4159-a099-3b9d0558e447,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:11|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES
	:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-UUID: beb0dcbebc2a11ee9a263b4415211400-20240126
Received: from mtkmbs13n2.mediatek.inc [(172.21.101.108)] by mailgw01.mediatek.com
	(envelope-from <shayne.chen@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 188336214; Fri, 26 Jan 2024 02:10:26 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
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
	<linux-mediatek@lists.infradead.org>, StanleyYP Wang
	<StanleyYP.Wang@mediatek.com>, Shayne Chen <shayne.chen@mediatek.com>
Subject: [PATCH v2 08/12] wifi: mt76: mt7996: fix efuse reading issue
Date: Fri, 26 Jan 2024 17:09:19 +0800
Message-ID: <20240126090923.6357-8-shayne.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20240126090923.6357-1-shayne.chen@mediatek.com>
References: <20240126090923.6357-1-shayne.chen@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--4.043400-8.000000
X-TMASE-MatchedRID: x6uIgBUWMExSNowC8HfcvawxbZnudyr7sf4f4CxxueRcKZwALwMGs/6g
	KWYq1ITooTxdbGQ8kfwC3W6W/V0xYnEjLiYgp5vhA9lly13c/gFFYhJJXmHGLzedlpL1W1muo8W
	MkQWv6iXBcIE78YqRWo6HM5rqDwqtmmHg2AUelbqxO8JSOpBiNh+lFc9A/GtbyzXVRC64Z28IAx
	97KXaIZVBSxT21jAwKg2fNerP8R4UrO1calJcwRGtVO+1/nsrzwZBgUyJVEbl6Fw8/PpTMRaVvm
	iAyeA2kc5MSfkiJFI5p3LlElBHTlw==
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--4.043400-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: BFF3DCCF9A4B2133C0AB3B8D74946D1C3A571E0511A9D01D6C574CE17A26189F2000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240126_011031_943869_6C19EFDF 
X-CRM114-Status: GOOD (  10.01  )
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

From: StanleyYP Wang <StanleyYP.Wang@mediatek.com>

The efuse data starts from the 48th bytes instead of 64th bytes in the
returned event skb.

Fixes: 98686cd21624 ("wifi: mt76: mt7996: add driver for MediaTek Wi-Fi 7 (802.11be) devices")
Signed-off-by: StanleyYP Wang <StanleyYP.Wang@mediatek.com>
Signed-off-by: Shayne Chen <shayne.chen@mediatek.com>
---
 drivers/net/wireless/mediatek/mt76/mt7996/mcu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7996/mcu.c
index 55512e62f98b..140123a42110 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7996/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7996/mcu.c
@@ -3547,7 +3547,7 @@ int mt7996_mcu_get_eeprom(struct mt7996_dev *dev, u32 offset)
 		u32 addr = le32_to_cpu(*(__le32 *)(skb->data + 12));
 		u8 *buf = (u8 *)dev->mt76.eeprom.data + addr;
 
-		skb_pull(skb, 64);
+		skb_pull(skb, 48);
 		memcpy(buf, skb->data, MT7996_EEPROM_BLOCK_SIZE);
 	}
 
-- 
2.39.2


