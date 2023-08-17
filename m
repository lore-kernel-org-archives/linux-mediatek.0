Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D7B4EB64DD
	for <linux-mediatek@archiver.kernel.org>; Thu, 17 Aug 2023 08:02:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=neOuzk7lJIYJ5Jd8PLRU/t9ndfy4bPRHP2Ab9ClSeLw=; b=NM4vvEFJjb0up9lD3H6wEIj2Oc
	jNHhJSlGtpr645Hd5Zva/jNykm/72ZaFllF/SGRBq6P+OHSrTwaqvoExFp/N+gRNhAIZN7M9O33ah
	itZEo54irKJyqzVeEtG0r/lN2x3YG1EdAs6UvOsEM7fJ2onX1XFgE0HoKtY4LJKw/vx0T6Tl9D3OD
	IagnzU6nCTkWszHBDw9mpH2/wloRFhQXqbUw0Pee1F4i7dtcif5CDfYsEQvWCJOYRlKfsHSz4hxkI
	TAFKCNdCzwyv6YWaxDpTS6seumO05YUGV0K7oai0L4NseUekim6HBFLveVVeTYzJQRwCgttDIOxJ5
	7BoqKZBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qWXxc-005mKV-0I;
	Thu, 17 Aug 2023 08:02:28 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qWXxX-005mGn-0H
	for linux-mediatek@lists.infradead.org;
	Thu, 17 Aug 2023 08:02:25 +0000
X-UUID: 6037b4763cd411ee83ed1395ce914268-20230817
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=neOuzk7lJIYJ5Jd8PLRU/t9ndfy4bPRHP2Ab9ClSeLw=;
	b=mvzaUTkwrgMTYxif7XIt9ot/BOOvFcrVeNN2Ol460wvBJHm/yYc4SkvBnL2JXOsH1owrbZ4g1hj3yFATNfrCDXOYCJCitlP7G9oFZsC+9on1+/+fvUQFOjRrWFwYCTGTYl09rH/axDgofaGMJbKW29X8bMVMDukaqE/uBTz+bBc=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.31,REQID:7b217ab2-ee14-40ac-a2bd-3aa7c13e7e55,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:100,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:100
X-CID-INFO: VERSION:1.1.31,REQID:7b217ab2-ee14-40ac-a2bd-3aa7c13e7e55,IP:0,URL
	:0,TC:0,Content:0,EDM:0,RT:0,SF:100,FILE:0,BULK:0,RULE:Spam_GS981B3D,ACTIO
	N:quarantine,TS:100
X-CID-META: VersionHash:0ad78a4,CLOUDID:43356f1f-33fd-4aaa-bb43-d3fd68d9d5ae,B
	ulkID:230817160214GDIN3JWN,BulkQuantity:1,Recheck:0,SF:28|17|19|48|29,TC:n
	il,Content:0,EDM:-3,IP:nil,URL:0,File:nil,Bulk:40,QS:nil,BEC:nil,COL:0,OSI
	:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_SDM,TF_CID_SPAM_ASC,TF_CID_SPAM_FAS,
	TF_CID_SPAM_FSD
X-UUID: 6037b4763cd411ee83ed1395ce914268-20230817
Received: from mtkmbs14n1.mediatek.inc [(172.21.101.75)] by mailgw02.mediatek.com
	(envelope-from <shayne.chen@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 743660399; Thu, 17 Aug 2023 01:02:14 -0700
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 mtkmbs13n2.mediatek.inc (172.21.101.108) with Microsoft SMTP Server
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
	<linux-mediatek@lists.infradead.org>, Peter Chiu
	<chui-hao.chiu@mediatek.com>, Shayne Chen <shayne.chen@mediatek.com>
Subject: [PATCH 6/9] wifi: mt76: mt7996: fix TWT command format
Date: Thu, 17 Aug 2023 16:01:51 +0800
Message-ID: <20230817080154.16475-6-shayne.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20230817080154.16475-1-shayne.chen@mediatek.com>
References: <20230817080154.16475-1-shayne.chen@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230817_010223_126331_DDCA6F89 
X-CRM114-Status: UNSURE (   9.72  )
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

From: Peter Chiu <chui-hao.chiu@mediatek.com>

Align the command format of UNI_CMD_TWT_ARGT_UPDATE to firmware.

Fixes: 98686cd21624 ("wifi: mt76: mt7996: add driver for MediaTek Wi-Fi 7 (802.11be) devices")
Signed-off-by: Peter Chiu <chui-hao.chiu@mediatek.com>
Signed-off-by: Shayne Chen <shayne.chen@mediatek.com>
---
 drivers/net/wireless/mediatek/mt76/mt7996/mcu.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7996/mcu.c
index cf443748ef7c..b0e6f51041fd 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7996/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7996/mcu.c
@@ -3548,7 +3548,9 @@ int mt7996_mcu_twt_agrt_update(struct mt7996_dev *dev,
 			       int cmd)
 {
 	struct {
-		u8 _rsv[4];
+		/* fixed field */
+		u8 bss;
+		u8 _rsv[3];
 
 		__le16 tag;
 		__le16 len;
@@ -3566,7 +3568,7 @@ int mt7996_mcu_twt_agrt_update(struct mt7996_dev *dev,
 		u8 exponent;
 		u8 is_ap;
 		u8 agrt_params;
-		u8 __rsv2[135];
+		u8 __rsv2[23];
 	} __packed req = {
 		.tag = cpu_to_le16(UNI_CMD_TWT_ARGT_UPDATE),
 		.len = cpu_to_le16(sizeof(req) - 4),
@@ -3576,6 +3578,7 @@ int mt7996_mcu_twt_agrt_update(struct mt7996_dev *dev,
 		.flowid = flow->id,
 		.peer_id = cpu_to_le16(flow->wcid),
 		.duration = flow->duration,
+		.bss = mvif->mt76.idx,
 		.bss_idx = mvif->mt76.idx,
 		.start_tsf = cpu_to_le64(flow->tsf),
 		.mantissa = flow->mantissa,
-- 
2.39.2


