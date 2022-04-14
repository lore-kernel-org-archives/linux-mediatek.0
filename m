Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0CAFC433F5
	for <linux-mediatek@archiver.kernel.org>; Thu, 14 Apr 2022 09:50:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=eTMRac1sILXzB55/fi1zCN2J7UzxJ+KsAP9nEbfyE2A=; b=rw/wXrTrZf6RuD
	pj0nmu36xhBTbon/a/ohRX8u1E+jqoqXcTF5s1hivuqk+6+aYzgyaQ4nwFd0ZH7ularBsUCFPbmAN
	n7XYGKR9L57jTsz1wl2Nps97M0n7CU+w69UIJpjwIjqGBz9ljoRuU7StEZ9bbCqUsrkjUFkkINDCG
	WYzyhVAhqY/+eDkwk9DKbPrzxApL1Fdbm2H3LfMlSj5xIW9LtzK/evAgzmC6q8TPfeM7GCXYnNkJN
	IfU51lPg+takRGa5ZMj9ujzoaX5BuljomOebgOLQuB5m3TalXV46ykXuWgsAsyl3S7DWM/Ds9FaQ+
	/p+WwK0R04pTqM9PI7Dw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1new7K-004xJg-OM; Thu, 14 Apr 2022 09:50:22 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1new79-004xGo-BQ; Thu, 14 Apr 2022 09:50:12 +0000
Received: by mail-wr1-x42a.google.com with SMTP id m14so6151744wrb.6;
 Thu, 14 Apr 2022 02:50:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=jEqj6dS4hwxknxKt8nbPyGn8ylY4KI7wiQLCN0ytwd4=;
 b=dfBpiVjlsURgw8l1FtunpLP/SXCSK+cHRWaMACUIAXOF9E1QQqQTXu94LlsgW4GVUy
 Q3w50jSbkKuNiID+VmJqjZ52X2aPihb9PthzPoE2/SbKed3FHv4Ex7Pum721tZLC8id+
 ygqRV2LUDEnRfdAo50KOE3YVvYuXEIaGKNtwoEf1h/KFltgi5QcYD51YikrCsVpyP1B2
 Gr7QE55XUqaCfiUeJ72eAODxAcLjcaVfieiVLc5AxET0l2MySq9wEK0ZsWUzrAsEc7bj
 6rMP/giWWEa04hkIOcJkoXGfR604MyjqX2/Z552f20oMdgEEuMmIed1JjhH8Dt6h7iFX
 Y+yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=jEqj6dS4hwxknxKt8nbPyGn8ylY4KI7wiQLCN0ytwd4=;
 b=LHL5654LjhXDfhG+3NRRzGkLLKNWdtnwuwFFnP57gnUxng65gSVD56vbTNEsalfelF
 QkfYFV57XKWQq5ohToav+CPfMFn8nZIxIrf5xyxTa9QaevuuPRfS37sjtG2uOf6HSxQW
 yXrkLnYAnsWFHASJPK+ihLonQTlecuZQPSWp3hUGfFF7y2OhT1/rfzNQmxfT3rKof+mi
 p8sfHg80/mKAZSA18l/z6+//B2DYZtAN/0j8a2AXbLYAKFu70o31ppbOaXL2WONtRMZ2
 Zj20MVHhPOmzxu0bAFxOp1OCmFCvUtlLgqtmwxdQ6jN+oRFFm89aDYf6ybFbwVDtbiKm
 3Rww==
X-Gm-Message-State: AOAM530ynQXux65BaUujuc/HnPpbiouVvCZ5YlH+rl5+Dy4jmppzEzW9
 Yzeko56A6quVaU7Cj9ltDHY=
X-Google-Smtp-Source: ABdhPJxiZGluHglMS5C73Q43h6GixG8ijFHiGdPg6fgRtR4THaNsuPUS55cih+bWuraSUoJZyEJAIg==
X-Received: by 2002:adf:f841:0:b0:207:a09b:d3cf with SMTP id
 d1-20020adff841000000b00207a09bd3cfmr1455218wrq.161.1649929808574; 
 Thu, 14 Apr 2022 02:50:08 -0700 (PDT)
Received: from localhost (cpc154979-craw9-2-0-cust193.16-3.cable.virginm.net.
 [80.193.200.194]) by smtp.gmail.com with ESMTPSA id
 n65-20020a1c2744000000b003862bfb509bsm5102648wmn.46.2022.04.14.02.50.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Apr 2022 02:50:08 -0700 (PDT)
From: Colin Ian King <colin.i.king@gmail.com>
To: Felix Fietkau <nbd@nbd.name>, Lorenzo Bianconi <lorenzo@kernel.org>,
 Ryder Lee <ryder.lee@mediatek.com>, Shayne Chen <shayne.chen@mediatek.com>,
 Sean Wang <sean.wang@mediatek.com>, Kalle Valo <kvalo@kernel.org>,
 "David S . Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 linux-wireless@vger.kernel.org, netdev@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Cc: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] mt76: mt7915: make read-only array ppet16_ppet8_ru3_ru0
 static const
Date: Thu, 14 Apr 2022 10:50:07 +0100
Message-Id: <20220414095007.294746-1-colin.i.king@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220414_025011_433734_ED195565 
X-CRM114-Status: GOOD (  10.81  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Don't populate the read-only array ppet16_ppet8_ru3_ru0 on the stack but
instead make it static const. Also makes the object code a little smaller.

Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
---
 drivers/net/wireless/mediatek/mt76/mt7915/init.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/init.c b/drivers/net/wireless/mediatek/mt76/mt7915/init.c
index 6d29366c5139..4b3cdb48b4bc 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/init.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/init.c
@@ -814,7 +814,7 @@ static void
 mt7915_gen_ppe_thresh(u8 *he_ppet, int nss)
 {
 	u8 i, ppet_bits, ppet_size, ru_bit_mask = 0x7; /* HE80 */
-	u8 ppet16_ppet8_ru3_ru0[] = {0x1c, 0xc7, 0x71};
+	static const u8 ppet16_ppet8_ru3_ru0[] = {0x1c, 0xc7, 0x71};
 
 	he_ppet[0] = FIELD_PREP(IEEE80211_PPE_THRES_NSS_MASK, nss - 1) |
 		     FIELD_PREP(IEEE80211_PPE_THRES_RU_INDEX_BITMASK_MASK,
-- 
2.35.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
