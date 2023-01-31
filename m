Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56872C636CC
	for <linux-mediatek@archiver.kernel.org>; Tue, 31 Jan 2023 09:37:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=M1fzgT/hvdf1Qv1HcXNuSMlZM/1hnG6hd0UtQoC6aEs=; b=3Fy2kZva7ALkJ43VKkLzqrDAkn
	tadsZy+TEUu8wi2TkzbILCiUZakSxrJtgCT4+QLsW18+PPGOGJgbPdw1m1fVw9wBqFigWohMOh9cm
	Ph73WyrLZPTXi6GJh9EiO2c3tdjAwkGCzFJu8ZWMhI/bn2yh8BMNCEWFdnrOKnfVeeWPJkB9R28vP
	7wUMJXQcOErrwMdlT6aiArCeItSjx7T9cH7sQbWsjnuHqIxmBA7CLPRB7xyl6td2O5SfdZEVGovIk
	vn+hPqXJFXL4tHEyeDeNoU+Wnv5SzCgo8P8LgK1DnBE35PKqZRsTdZVHR5h/Rudcsq63phAXzn8G5
	Hqor8Khw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pMn4V-00739z-Q4; Tue, 31 Jan 2023 09:36:59 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pMn4B-0072yj-IO
	for linux-mediatek@lists.infradead.org; Tue, 31 Jan 2023 09:36:41 +0000
X-UUID: be5d252aa14a11edbbe3f76fe852e059-20230131
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=M1fzgT/hvdf1Qv1HcXNuSMlZM/1hnG6hd0UtQoC6aEs=;
	b=nsEcVuPszhjsVpEKcWl/PHcDwRqB2t7hxzcI5AdlqDkUJ24e2jYZC/8mJOhzBnlmjqyQF5Hqjb8M2aeUpxFBML61JHpfGuMyo1dwgh0ELJwMSVx1IdmH42xBYWgZCx5xcKztOfibw8CtnLciSyj0DtxQ+lk7z3S37ZrWWcMLLBA=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.18,REQID:1264b0f8-3f97-46fc-a39a-a10f97f22753,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:3ca2d6b,CLOUDID:0c65da55-dd49-462e-a4be-2143a3ddc739,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0
X-CID-BVR: 0
X-UUID: be5d252aa14a11edbbe3f76fe852e059-20230131
Received: from mtkmbs13n2.mediatek.inc [(172.21.101.108)] by mailgw01.mediatek.com
	(envelope-from <shayne.chen@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1050181853; Tue, 31 Jan 2023 02:36:31 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Tue, 31 Jan 2023 17:36:28 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Tue, 31 Jan 2023 17:36:28 +0800
From: Shayne Chen <shayne.chen@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>
CC: linux-wireless <linux-wireless@vger.kernel.org>, Lorenzo Bianconi
	<lorenzo@kernel.org>, Ryder Lee <ryder.lee@mediatek.com>, Evelyn Tsai
	<evelyn.tsai@mediatek.com>, Bo Jiao <Bo.Jiao@mediatek.com>, linux-mediatek
	<linux-mediatek@lists.infradead.org>, Shayne Chen <shayne.chen@mediatek.com>
Subject: [PATCH v2 02/13] wifi: mt76: connac: add CMD_CBW_320MHZ
Date: Tue, 31 Jan 2023 17:36:00 +0800
Message-ID: <20230131093611.30914-3-shayne.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20230131093611.30914-1-shayne.chen@mediatek.com>
References: <20230131093611.30914-1-shayne.chen@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230131_013639_666211_F92F3690 
X-CRM114-Status: GOOD (  10.07  )
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

Add CMD_CBW_320MHZ for setting bandwidth 320 MHz to firmware.
This is the preliminary patch to add EHT support for mt7996.

Signed-off-by: Shayne Chen <shayne.chen@mediatek.com>
---
 drivers/net/wireless/mediatek/mt76/mt76_connac.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/net/wireless/mediatek/mt76/mt76_connac.h b/drivers/net/wireless/mediatek/mt76/mt76_connac.h
index 8ba883b03e50..c3dabad5d40d 100644
--- a/drivers/net/wireless/mediatek/mt76/mt76_connac.h
+++ b/drivers/net/wireless/mediatek/mt76/mt76_connac.h
@@ -42,6 +42,7 @@ enum {
 	CMD_CBW_10MHZ,
 	CMD_CBW_5MHZ,
 	CMD_CBW_8080MHZ,
+	CMD_CBW_320MHZ,
 
 	CMD_HE_MCS_BW80 = 0,
 	CMD_HE_MCS_BW160,
@@ -239,6 +240,7 @@ static inline u8 mt76_connac_chan_bw(struct cfg80211_chan_def *chandef)
 		[NL80211_CHAN_WIDTH_10] = CMD_CBW_10MHZ,
 		[NL80211_CHAN_WIDTH_20] = CMD_CBW_20MHZ,
 		[NL80211_CHAN_WIDTH_20_NOHT] = CMD_CBW_20MHZ,
+		[NL80211_CHAN_WIDTH_320] = CMD_CBW_320MHZ,
 	};
 
 	if (chandef->width >= ARRAY_SIZE(width_to_bw))
-- 
2.25.1


