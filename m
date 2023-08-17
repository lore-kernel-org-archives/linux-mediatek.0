Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 081DAC2FC14
	for <linux-mediatek@archiver.kernel.org>; Thu, 17 Aug 2023 08:02:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XEaUf/kGH0yFKIdGUoF6W8pbiAgAMpy+6WvZulX8U1E=; b=o+EyN64IK9nOFPG40z5/B6mNcR
	ta4FN6Pw1TKmv1Z6r0CIDSgfA2eC3zbrLduJzU82Cp6RKwhm22eikYirzN5eSYQCbpxz6Au+Vt6Gp
	4OHMH920cxL3fh5F8NQU8EuShqorQuxTeGLzayGJ/dlZhY4mkxFNV11nfqf5CaPDD2mSxOJckWNjV
	8ypR7R+cuH46YVAsLdq+1fMsAmTDD+MHmxJyDYcyr6hKzGuw6NQ8Z2u8nPAa/3fyH/hHZzkSfHpx3
	1PxEI9gF/4dVcuS75mDBxl3kp0MFGNIvEjhdmBPEDQhBbmfbIeQ9h+behDSF1v3i8ZBa59PeLASO/
	I/tVNIEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qWXxZ-005mJF-0B;
	Thu, 17 Aug 2023 08:02:25 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qWXxW-005mGl-0p
	for linux-mediatek@lists.infradead.org;
	Thu, 17 Aug 2023 08:02:23 +0000
X-UUID: 6013babc3cd411ee83ed1395ce914268-20230817
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=XEaUf/kGH0yFKIdGUoF6W8pbiAgAMpy+6WvZulX8U1E=;
	b=tc7Tnnq8nKLt4InJ4pbJZr9HP24GPDeAtytBHc5xo5icSjJU9CF7PKUpbB9HMOUH682OpmAvu3naMPRRiNtZxtFQasjU4bnDaTMc6R9+fSugWwMcbTC59l52iHXBbKAdkL5CLynR9YVsk4wDgUbPJxmD7nbBYvc4Ukr9Bn/Iflc=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.31,REQID:a41e2395-4c0d-47e8-9922-808f63bd72ad,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:100,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:100
X-CID-INFO: VERSION:1.1.31,REQID:a41e2395-4c0d-47e8-9922-808f63bd72ad,IP:0,URL
	:0,TC:0,Content:0,EDM:0,RT:0,SF:100,FILE:0,BULK:0,RULE:Spam_GS981B3D,ACTIO
	N:quarantine,TS:100
X-CID-META: VersionHash:0ad78a4,CLOUDID:124ddf12-4929-4845-9571-38c601e9c3c9,B
	ulkID:230817160214ADA8CB4U,BulkQuantity:1,Recheck:0,SF:19|48|29|28|17,TC:n
	il,Content:0,EDM:-3,IP:nil,URL:0,File:nil,Bulk:40,QS:nil,BEC:nil,COL:0,OSI
	:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_ASC,TF_CID_SPAM_FAS,TF_CID_SPAM_FSD,TF_CID_SPAM_SNR,
	TF_CID_SPAM_SDM
X-UUID: 6013babc3cd411ee83ed1395ce914268-20230817
Received: from mtkmbs13n1.mediatek.inc [(172.21.101.193)] by mailgw02.mediatek.com
	(envelope-from <shayne.chen@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 137570975; Thu, 17 Aug 2023 01:02:13 -0700
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Thu, 17 Aug 2023 16:02:11 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Thu, 17 Aug 2023 16:02:11 +0800
From: Shayne Chen <shayne.chen@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>
CC: linux-wireless <linux-wireless@vger.kernel.org>, Lorenzo Bianconi
	<lorenzo@kernel.org>, Ryder Lee <ryder.lee@mediatek.com>, Evelyn Tsai
	<evelyn.tsai@mediatek.com>, Bo Jiao <Bo.Jiao@mediatek.com>, linux-mediatek
	<linux-mediatek@lists.infradead.org>, Howard Hsu
	<howard-yh.hsu@mediatek.com>, Shayne Chen <shayne.chen@mediatek.com>
Subject: [PATCH 2/9] wifi: mt76: mt7996: fix beamform mcu cmd configuration
Date: Thu, 17 Aug 2023 16:01:47 +0800
Message-ID: <20230817080154.16475-2-shayne.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20230817080154.16475-1-shayne.chen@mediatek.com>
References: <20230817080154.16475-1-shayne.chen@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230817_010222_298378_E64A0F31 
X-CRM114-Status: GOOD (  10.46  )
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

From: Howard Hsu <howard-yh.hsu@mediatek.com>

The bf_num field represents how many bands can support beamform, so set
the value to 3, and bf_bitmap represents the bitmap of bf_num.

Fixes: 98686cd21624 ("wifi: mt76: mt7996: add driver for MediaTek Wi-Fi 7 (802.11be) devices")
Signed-off-by: Howard Hsu <howard-yh.hsu@mediatek.com>
Signed-off-by: Shayne Chen <shayne.chen@mediatek.com>
---
 drivers/net/wireless/mediatek/mt76/mt7996/mcu.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7996/mcu.c
index 4a30db49ef33..4ed164381898 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7996/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7996/mcu.c
@@ -3307,8 +3307,8 @@ int mt7996_mcu_set_txbf(struct mt7996_dev *dev, u8 action)
 
 		tlv = mt7996_mcu_add_uni_tlv(skb, action, sizeof(*req_mod_en));
 		req_mod_en = (struct bf_mod_en_ctrl *)tlv;
-		req_mod_en->bf_num = 2;
-		req_mod_en->bf_bitmap = GENMASK(0, 0);
+		req_mod_en->bf_num = 3;
+		req_mod_en->bf_bitmap = GENMASK(2, 0);
 		break;
 	}
 	default:
-- 
2.39.2


