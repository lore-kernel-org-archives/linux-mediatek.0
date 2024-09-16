Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60752C3ABCB
	for <linux-mediatek@archiver.kernel.org>; Mon, 16 Sep 2024 06:02:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Fckwj3nLjM8tiqxRm0YG0eLNs4gyS2cZWVzKMAGEK48=; b=xUlHMOFTzf2atLr0Pd6g+y3Tyt
	EO1uUQ3LcLR6+BhNjvjRQ8NEdduEg9sNqMEORJBI5+mM+Is3XK5AYH7e3Y9B/iCBW6in/YUjQmzt6
	wCc/2AyoK1CnDFGNQyxIiPZG+kSQbF7eWsh+lT33XyGmV7DGUSVHfwBFfg+MVDrJvcv2aUHUFUbEE
	+KJdMde0ecmAj5imh7LyZAJc2se25d1EKsvhRsqeJR34KmQeJ69OW4ZgVM6LdK8fo6FkAEpvA6tpL
	kEh703TqfAeDSw2LhcxK+Rrj8DiznaKFSj1NDQfx6Z+LWxjdPwdq3p0OmaF9XleVMzOqPFzjTKcdw
	Qb+dh7rg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sq4p2-00000003A2h-3zBk;
	Mon, 16 Sep 2024 06:02:52 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sq4od-00000003A1s-189s
	for linux-mediatek@lists.infradead.org;
	Mon, 16 Sep 2024 06:02:28 +0000
X-UUID: 3d863db273f111efba0aef63c0775dbf-20240915
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=Fckwj3nLjM8tiqxRm0YG0eLNs4gyS2cZWVzKMAGEK48=;
	b=bSRrdGShG3I4HyaczlNyGTYvAp9aWea/PRLyGuFPD7bf9HLMWIMbsRUyyFvUHiK4cz7/v+dVZOBZ52640kOJgZ8JHciw0yNH3WxzAiTsuOsQqzPPsiggHXmHmQG7lfVWgMbLuFuK4VZltT/QomRDwqwCmc//hf4RX0mK9flupGE=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.41,REQID:e59590a4-274b-4f55-813d-3cf6c9f97e3f,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:6dc6a47,CLOUDID:8a5706c0-d7af-4351-93aa-42531abf0c7b,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,
	SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 3d863db273f111efba0aef63c0775dbf-20240915
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by mailgw02.mediatek.com
	(envelope-from <mingyen.hsieh@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 649309587; Sun, 15 Sep 2024 23:02:22 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Mon, 16 Sep 2024 14:02:19 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Mon, 16 Sep 2024 14:02:19 +0800
From: Mingyen Hsieh <mingyen.hsieh@mediatek.com>
To: <nbd@nbd.name>, <lorenzo@kernel.org>
CC: <deren.wu@mediatek.com>, <Sean.Wang@mediatek.com>,
	<Soul.Huang@mediatek.com>, <Leon.Yen@mediatek.com>,
	<Michael.Lo@mediatek.com>, <Eric-SY.Chang@mediatek.com>,
	<km.lin@mediatek.com>, <robin.chiu@mediatek.com>, <ch.yeh@mediatek.com>,
	<posh.sun@mediatek.com>, <Quan.Zhou@mediatek.com>, <Ryder.Lee@mediatek.com>,
	<Shayne.Chen@mediatek.com>, <linux-wireless@vger.kernel.org>,
	<linux-mediatek@lists.infradead.org>, Leon Yen <leon.yen@mediatek.com>, "Ming
 Yen Hsieh" <mingyen.hsieh@mediatek.com>
Subject: [PATCH] wifi: mt76: mt7921s: fix a potential firmware freeze during startup
Date: Mon, 16 Sep 2024 14:01:57 +0800
Message-ID: <20240916060157.10157-1-mingyen.hsieh@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--9.301600-8.000000
X-TMASE-MatchedRID: Grh+eIkfeaLEAUxgQzN5HWcJkKl3v/LDEjUQ5RU6WJIlZZ7scaajMkUW
	SNUeoUM2IV4u8YKdeKtTXYUSVoVZ2Tp3zB6h4uJpVU3yVpaj3Qw38FNTll9lElIv9dBw/gcUz+O
	IW+Zar23i8zVgXoAltsIJ+4gwXrEtwrbXMGDYqV8gWATM4opXZoTscaT4k0SKWWvYHIcZ4GNkZU
	D2MrVksYDfkIsQmt1xVlxr1FJij9s=
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--9.301600-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: 046DF7B7912FC4E4B38280D0975DC6C0996AC2F4CF287C7417537ADDDCD70AAA2000:8
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240915_230227_347419_5A24322F 
X-CRM114-Status: GOOD (  12.94  )
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

From: Leon Yen <leon.yen@mediatek.com>

The maximum command quota of the firmware may be exceeded because the
command to retrieve the quota setting has not been taken into account.

This patch considers not only the quota usage of the command retrieving
quota settings but also limits the total quota usage.

Signed-off-by: Leon Yen <leon.yen@mediatek.com>
Signed-off-by: Ming Yen Hsieh <mingyen.hsieh@mediatek.com>
---
 drivers/net/wireless/mediatek/mt76/mt76.h       | 1 +
 drivers/net/wireless/mediatek/mt76/mt7921/mcu.c | 5 ++++-
 drivers/net/wireless/mediatek/mt76/sdio_txrx.c  | 4 ++++
 3 files changed, 9 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt76.h b/drivers/net/wireless/mediatek/mt76/mt76.h
index 0b75a45ad2e8..4432020b7f7d 100644
--- a/drivers/net/wireless/mediatek/mt76/mt76.h
+++ b/drivers/net/wireless/mediatek/mt76/mt76.h
@@ -636,6 +636,7 @@ struct mt76_sdio {
 	u8 hw_ver;
 	wait_queue_head_t wait;
 
+	int pse_mcu_quota_max;
 	struct {
 		int pse_data_quota;
 		int ple_data_quota;
diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7921/mcu.c
index 02c1de8620a7..ddc5986086d9 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7921/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7921/mcu.c
@@ -507,7 +507,10 @@ static void mt7921_mcu_parse_tx_resource(struct mt76_dev *dev,
 
 	tx_res = (struct mt7921_tx_resource *)skb->data;
 	sdio->sched.pse_data_quota = le32_to_cpu(tx_res->pse_data_quota);
-	sdio->sched.pse_mcu_quota = le32_to_cpu(tx_res->pse_mcu_quota);
+	sdio->pse_mcu_quota_max = le32_to_cpu(tx_res->pse_mcu_quota);
+	/* The mcu quota usage of this function itself must be taken into consideration */
+	sdio->sched.pse_mcu_quota =
+		sdio->sched.pse_mcu_quota ? sdio->pse_mcu_quota_max : sdio->pse_mcu_quota_max - 1;
 	sdio->sched.ple_data_quota = le32_to_cpu(tx_res->ple_data_quota);
 	sdio->sched.pse_page_size = le16_to_cpu(tx_res->pse_page_size);
 	sdio->sched.deficit = tx_res->pp_padding;
diff --git a/drivers/net/wireless/mediatek/mt76/sdio_txrx.c b/drivers/net/wireless/mediatek/mt76/sdio_txrx.c
index ddd8c0cc744d..0a927a7313a6 100644
--- a/drivers/net/wireless/mediatek/mt76/sdio_txrx.c
+++ b/drivers/net/wireless/mediatek/mt76/sdio_txrx.c
@@ -46,6 +46,10 @@ static int mt76s_refill_sched_quota(struct mt76_dev *dev, u32 *data)
 		return 0;
 
 	sdio->sched.pse_mcu_quota += pse_mcu_quota;
+	if (sdio->pse_mcu_quota_max &&
+	    sdio->sched.pse_mcu_quota > sdio->pse_mcu_quota_max) {
+		sdio->sched.pse_mcu_quota = sdio->pse_mcu_quota_max;
+	}
 	sdio->sched.pse_data_quota += pse_data_quota;
 	sdio->sched.ple_data_quota += ple_data_quota;
 
-- 
2.45.2


