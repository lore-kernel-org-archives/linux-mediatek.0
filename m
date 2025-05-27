Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B67CC54F30
	for <linux-mediatek@archiver.kernel.org>; Tue, 27 May 2025 05:55:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=b95ydlmvcuSBT0t2+Bg2nsz8TCc7xZGDZD7y4UeqVe8=; b=GVyiibYX5OOBSOr/q5AgyfKTwa
	JaUCtOXR83aR8BW7paZRzxjtgaGNwivL8ae027dly61bRoadn0owkwXLEBGRTwwMsFXzJTW3Asr7F
	1CsrF8ZWeuM4BqPR/reT3su+jNwn5ZW8VaFKdHsMfJ2TKhPNPLilQ7MlVRt3pNymTlZjdj18pcHpO
	1IN/+Mcp5EEuppioDAWtPUHDmIPLpQJHlde0lRCUg1xKPI2tA0dThswRUdCnSQvcKcs+WBllZkUgq
	eHoTHY0Wzgyu/wwdDsCCp36n6Ach6RI3uRZvJKTEjae6cxxA8VeGiIoWt65bg2dybR8xGtN0tTo9z
	A70+W8Cg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJnHu-00000009yOO-2SL0;
	Tue, 27 May 2025 05:55:46 +0000
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJnHr-00000009yMz-34zX
	for linux-mediatek@lists.infradead.org;
	Tue, 27 May 2025 05:55:44 +0000
Received: by mail-ed1-x532.google.com with SMTP id 4fb4d7f45d1cf-6045a8a59c5so3813086a12.1
        for <linux-mediatek@lists.infradead.org>; Mon, 26 May 2025 22:55:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748325342; x=1748930142; darn=lists.infradead.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=b95ydlmvcuSBT0t2+Bg2nsz8TCc7xZGDZD7y4UeqVe8=;
        b=DdxmyDOcsHTxvs3i7PjQbI6TP/F8WUbqTM2SZh9Oe1Qv+TG2eMUdTJqPFIUbpx+ruQ
         54pMoDtbCf5LpM8hMmV05pd3kgZRtHGOJ4FzPJuCR26PMJPmKCjFPxFzGT0X04qlYpMf
         N9iXpZG7pS5Kdle12Q45r84qpWTQfLziOtD9iPLqAGXQkC6KOyhM4+Jn+ohgaD9aKR2r
         JSf/m4jL7k9b3y02ijbmMo+mvTHjB24rHVYl8l+D56wDuLInM6KqMEZ4dotGt4sO8M6g
         o5Na/u2V8dl2DyKJER801tPUiVwf5znZ/88CPqplrMFNXLMffJ4CVPHu9b65VCuHh0q4
         iMQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748325342; x=1748930142;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=b95ydlmvcuSBT0t2+Bg2nsz8TCc7xZGDZD7y4UeqVe8=;
        b=J0LSixP3wit3e+w5GNF6sadeYIcKSErK2l/LmPobs6La9QNdC5ceocj9y6aRCw8WrY
         WaoX3qsasA0tyQyy975ouHyhc2NJ6HrVcd/GO2qmk5/U4rft2DiMixHWJX/al6c7GZ2y
         dRUox4/NiryTaD+FE46XMgteZS9Uazkfg7akkeCOqKMVTGBRxDAhbBNuZfh+0D7Hg1K7
         oWIcgvbEBBENRS2GKh4RTZGrFopui3xffqYSGWmlt9PBRbw0dey3ToOAOkQyUUYKfBvf
         yzbGMfBKNUXAhjRZLrG8smVsiLSiooP7VM0eARUWSKyEQJabX1UdZzrFFNBFtl8lJhE6
         d1lw==
X-Forwarded-Encrypted: i=1; AJvYcCXtwsY4VcdSz6KokGEf1MdIxrxWnbWBPBiHH/4DmKW9DJKBEo0rQ01X1ueT2PL0rq6y3/u2ppEV0gyv7OsmGg==@lists.infradead.org
X-Gm-Message-State: AOJu0YzZPXkM58sgyqRw4F0OaCjxGWsmKhsfVpqBBi8f4LrW423IzePe
	tGznW3opke6lmZLuiw1FbfAT/rC9uBTMXTd6m5Xk6E08BBU4xFZ+o4yM8YqapF5Afs8=
X-Gm-Gg: ASbGncvotJxJNoXHGVukdK82lq6cIyPMCuUT/WHjA9wneLiYeO8O6dHs0krmVX98EqC
	qUoIQEVNXzAH+iNeYb+056WvjjDuJukR43gZcofS8dVVntAfsw5tIU+p5T6jr9PIARPy3XpwuVy
	1uGcgBNNfl71A01BWH/xD6DWt+wHpC8dZG1GJDzsQipDqnO78p5z+1+Jm/QmA4VUC5We7LfEcEI
	CR53Pu/GgdT+FDqPxyTCK6TUtR99d3a8PlstubZhTvAjXi/Gr8POIrzQEPoQL15lFyxOK1BIv8m
	G4vVwBQbe6J5XbxEbNhFK+ip+M0VOlIBnnyiNjXm0IqqAT30IbpUvy6yuYuCrmaQCwrJBTG77Ow
	=
X-Google-Smtp-Source: AGHT+IHqcQBdt4pdotySeS2C++hBmaCY98bm7d0B72bKSBSdU4rDUN6+enuY0scFyUJE6OpWFCvJpg==
X-Received: by 2002:a17:907:f818:b0:ad4:d32e:b571 with SMTP id a640c23a62f3a-ad85b1bf8d5mr961844066b.24.1748325342055;
        Mon, 26 May 2025 22:55:42 -0700 (PDT)
Received: from localhost (hf94.n1.ips.mtn.co.ug. [41.210.143.148])
        by smtp.gmail.com with UTF8SMTPSA id a640c23a62f3a-ad52d06e098sm1818489666b.59.2025.05.26.22.55.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 May 2025 22:55:41 -0700 (PDT)
Date: Tue, 27 May 2025 08:55:38 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Ming Yen Hsieh <mingyen.hsieh@mediatek.com>
Cc: Felix Fietkau <nbd@nbd.name>, Lorenzo Bianconi <lorenzo@kernel.org>,
	Ryder Lee <ryder.lee@mediatek.com>,
	Shayne Chen <shayne.chen@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Deren Wu <deren.wu@mediatek.com>,
	Allan Wang <allan.wang@mediatek.com>,
	linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, kernel-janitors@vger.kernel.org
Subject: [PATCH next] wifi: mt76: mt7925: fix off by one in
 mt7925_mcu_hw_scan()
Message-ID: <aDVT2tPhG_8T0Qla@stanley.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250526_225543_774902_BA81D458 
X-CRM114-Status: GOOD (  14.15  )
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

The ssid->ssids[] and sreq->ssids[] arrays have MT7925_RNR_SCAN_MAX_BSSIDS
elements so this >= needs to be > to prevent an out of bounds access.

Fixes: 8284815ca161 ("wifi: mt76: mt7925: add RNR scan support for 6GHz")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
Please review this one carefully.  I'm less sure about the second chunk.
Also maybe we should just delete this condition or check sreq->n_ssids
instead?

 drivers/net/wireless/mediatek/mt76/mt7925/mcu.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
index b8542be0d945..16f3cc58a192 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
@@ -2866,7 +2866,7 @@ int mt7925_mcu_hw_scan(struct mt76_phy *phy, struct ieee80211_vif *vif,
 	for (i = 0; i < sreq->n_ssids; i++) {
 		if (!sreq->ssids[i].ssid_len)
 			continue;
-		if (i > MT7925_RNR_SCAN_MAX_BSSIDS)
+		if (i >= MT7925_RNR_SCAN_MAX_BSSIDS)
 			break;
 
 		ssid->ssids[i].ssid_len = cpu_to_le32(sreq->ssids[i].ssid_len);
@@ -2883,7 +2883,7 @@ int mt7925_mcu_hw_scan(struct mt76_phy *phy, struct ieee80211_vif *vif,
 		mt76_connac_mcu_build_rnr_scan_param(mdev, sreq);
 
 		for (j = 0; j < mdev->rnr.bssid_num; j++) {
-			if (j > MT7925_RNR_SCAN_MAX_BSSIDS)
+			if (j >= MT7925_RNR_SCAN_MAX_BSSIDS)
 				break;
 
 			tlv = mt76_connac_mcu_add_tlv(skb, UNI_SCAN_BSSID,
-- 
2.47.2


