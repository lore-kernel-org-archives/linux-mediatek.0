Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 275E8C48BF6
	for <linux-mediatek@archiver.kernel.org>; Thu,  7 Mar 2024 11:08:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=oP6i39R/fK+jF6uZWGIiot3B/64njBTpoJW5U6r7Zd4=; b=UPKGgn5wF5PrnhyHE0+GnCw4QG
	AH3LELtrPb/wx6mR50Ea15KjAMNiL7wsd7U5HRgRXywvOkc8Tx6FUQHvXj4HFlpFay7xssUwARzQb
	dwcHVjb9wxsKytsJP2k0E0Bs8iTUht5AauN9Iwni54TFDIPFP2OI6nlsquVdeUbNopZS7GYGvGdBU
	j+I+FVA+IpU03lp4+2jfJv7QTl3wvrfi7M+G1xWOcSf0SNR1deAYajkfFIjrPdBCKY0IAQyl13L0I
	kkp9Q8rDox/R4i4msY9ic58Pyf91B7gwxTXfuRTHio1Jm09vku6nmlSgOaXnd3WB+nFi8W/iSb3Mu
	k2+4q1Qg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1riBcA-00000004DW0-49Uh;
	Thu, 07 Mar 2024 11:08:42 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1riBc8-00000004DR9-0O7Y
	for linux-mediatek@lists.infradead.org;
	Thu, 07 Mar 2024 11:08:41 +0000
X-UUID: 0282d7c2dc7311eebe6b57d01cc416d2-20240307
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=oP6i39R/fK+jF6uZWGIiot3B/64njBTpoJW5U6r7Zd4=;
	b=hOIzRp3PPz6/yat1ZpG9MamFksgiR8fl74ke8FTwDTaSJKoUTEzUx0IoxrGiP6wy7lrowYWKfx3lXiKeFgRDS1mcYNtiVm+6mBvMwdEnrI8Dqgh63YNpf+T7xlf/ZLfuXqY6cY6UtUt9k3qjGGTXs2ya8M0qbvmdAdhJ4HxrZ4A=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.37,REQID:9697d5a2-f268-44bc-b811-9ca94f581137,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:6f543d0,CLOUDID:d1f3ba84-8d4f-477b-89d2-1e3bdbef96d1,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,
	SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 0282d7c2dc7311eebe6b57d01cc416d2-20240307
Received: from mtkmbs14n2.mediatek.inc [(172.21.101.76)] by mailgw01.mediatek.com
	(envelope-from <mingyen.hsieh@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1691171454; Thu, 07 Mar 2024 04:08:21 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Thu, 7 Mar 2024 19:08:16 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Thu, 7 Mar 2024 19:08:16 +0800
From: Mingyen Hsieh <mingyen.hsieh@mediatek.com>
To: <nbd@nbd.name>, <lorenzo@kernel.org>
CC: <deren.wu@mediatek.com>, <Sean.Wang@mediatek.com>,
	<Soul.Huang@mediatek.com>, <Leon.Yen@mediatek.com>,
	<Eric-SY.Chang@mediatek.com>, <km.lin@mediatek.com>,
	<robin.chiu@mediatek.com>, <ch.yeh@mediatek.com>, <posh.sun@mediatek.com>,
	<Quan.Zhou@mediatek.com>, <Ryder.Lee@mediatek.com>,
	<Shayne.Chen@mediatek.com>, <linux-wireless@vger.kernel.org>,
	<linux-mediatek@lists.infradead.org>, Ming Yen Hsieh
	<mingyen.hsieh@mediatek.com>
Subject: [PATCH] wifi: mt76: mt7925: ensure 4-byte alignment for suspend & wow command
Date: Thu, 7 Mar 2024 19:08:15 +0800
Message-ID: <20240307110815.527-1-mingyen.hsieh@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--2.722700-8.000000
X-TMASE-MatchedRID: K1/iR2xcoOfwa4iJAsefGDQlj13qze9pLoYOuiLW+uU1LB46LFAAklO4
	BD7nLMxn4ZH8wasvhJf8uYcF5GffsqmVr/PsmqxPdE/dhjO8a+T0O7M3lSnTW5soi2XrUn/Jn6K
	dMrRsL14qtq5d3cxkNRqXnrxrKCOXF7DZKeo3Cs2hOSsaDAFb6nDL8L6nn4dfX7wf7//XRh+eVw
	YTr6L30KUA5kk8GugVrqf4jZC2Wrxm1z+N6ypGjYN/qZcpq7vWF0aD5ljt43pMcHZD6gqu7wxMj
	fifIXfowkvVoA11Twp+3BndfXUhXQ==
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--2.722700-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: 3ECA7F6D3A5597C68898AB61E16C428324056E3158A9EB0AFDBE3C6B9F5406682000:8
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240307_030840_177943_447C911B 
X-CRM114-Status: UNSURE (   8.59  )
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

Before sending suspend & wow command to FW, its length should be
4-bytes alignd.

Signed-off-by: Ming Yen Hsieh <mingyen.hsieh@mediatek.com>
---
 drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c | 1 +
 drivers/net/wireless/mediatek/mt76/mt7925/mcu.h      | 2 +-
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c b/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c
index af0c2b2aacb0..ef29d093f9c3 100644
--- a/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c
@@ -2527,6 +2527,7 @@ int mt76_connac_mcu_set_hif_suspend(struct mt76_dev *dev, bool suspend)
 			__le16 tag;
 			__le16 len;
 			u8 suspend;
+			u8 pad[7];
 		} __packed hif_suspend;
 	} req = {
 		.hif_suspend = {
diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/mcu.h b/drivers/net/wireless/mediatek/mt76/mt7925/mcu.h
index 2a0bbfe7bfa5..b8315a89f4a9 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/mcu.h
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/mcu.h
@@ -535,7 +535,7 @@ struct mt7925_wow_pattern_tlv {
 	u8 offset;
 	u8 mask[MT76_CONNAC_WOW_MASK_MAX_LEN];
 	u8 pattern[MT76_CONNAC_WOW_PATTEN_MAX_LEN];
-	u8 rsv[4];
+	u8 rsv[7];
 } __packed;
 
 static inline enum connac3_mcu_cipher_type
-- 
2.18.0


