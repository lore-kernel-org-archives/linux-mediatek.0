Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BFD3C2BD09
	for <linux-mediatek@archiver.kernel.org>; Sat,  6 Jul 2024 08:29:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rDWsadwt/xEY8QJ0HP1J0p9sCg8C+huC3dGYVm5QTrA=; b=3JNt2lc0JAYVkcjEtL2ESI4ppE
	1tLXzW/RjfN7GZmsdUK8pOU0i65dUVecC9vCHyWC/5wJyBu1MSOzD0gO7Ly7RMztylTHbU+mrqwPY
	EDNLXgbTxwY19ZVScPj70MXmXnyeE/3J8ojskDqczfeLle08oQDupppBgCubChlEFbD0/FaaTfbXT
	IbO3i7YiUQsqRXCD9D5bVEM/cIX5Tgv48PUPiZQY8dip+JlObh32sNbS8u/jW0gAXnzDbBx8oSgA+
	EYmvR9YmG/V+bwc9/seuFQnEMgDqe9RZuuICUzwbaHjV9mGQBm39nMPy3GQNeKLoot5WB1PvPPnIq
	uF+X/UCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sQ0nP-0000000HYLy-3svB;
	Sat, 06 Jul 2024 08:29:28 +0000
Received: from mail-oo1-f42.google.com ([209.85.161.42])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sQ0nL-0000000HYIc-0gGr
	for linux-mediatek@lists.infradead.org;
	Sat, 06 Jul 2024 08:29:24 +0000
Received: by mail-oo1-f42.google.com with SMTP id 006d021491bc7-5c229104335so56231eaf.3
        for <linux-mediatek@lists.infradead.org>; Sat, 06 Jul 2024 01:29:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720254562; x=1720859362;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rDWsadwt/xEY8QJ0HP1J0p9sCg8C+huC3dGYVm5QTrA=;
        b=Q5uLuiXMSERRwSjyHi1TfEVPlZN/72YERtnGa2bOvRMInFa6NG4WDPkCkJ4bR4Qz1B
         B0Uc9JvBHQnOInwdW7pVKIV9nSgKvGWEzVCTM/cjXgcNyS0aP9hHGvosH44LQNCQDGNH
         7hK3nXCpXWHFBym2nDbHpR3KA3zd769jXlOofkCIa0vq2zBuxDiTUB1fTm6K/eeKQCHc
         Hxs4SGJ3XhuDHsQjeVdytxsw4t0jn0YwT6nTT8g+RhMbMr0gjpB+1cgAi8xKeVjay2B/
         HE96kTF2zSJRqksk0rpaBDHUSPzztIQRIiN5whsbHydIh6k61YyWl6xPX+ZbBqRA3TZx
         S5tQ==
X-Forwarded-Encrypted: i=1; AJvYcCVFD7vLPYdUPW5joPmmyIPQOXA4mNY/VXT/41cHFj1vyvbF7QKvJuitKOixOtCJa/hETwg3DfQRSeN0sVdtAJRfd7ZjKoEbJ6yQchoHnnkD2IJ2
X-Gm-Message-State: AOJu0YzNsIhpVcDGkmmY2rAlFPbu+I1GnRkh9cVyCqGMg+ntuerR5Upl
	/RKHmrj/3ITiIGbVakGQOxGEUrYDdjWwSX9aA4unq7PB5YoIbXOx
X-Google-Smtp-Source: AGHT+IGSmxnMYI6qyVOuKJhXuZQsvKS/iLknCxT8PYn3N4BOpFvg2ZPEwrqQXATr+hHCnmcdeoXbWg==
X-Received: by 2002:a05:6871:24d5:b0:25c:f5f8:a80d with SMTP id 586e51a60fabf-25e2bb7606emr6642955fac.2.1720254562101;
        Sat, 06 Jul 2024 01:29:22 -0700 (PDT)
Received: from sean-ThinkPad-T450s.attlocal.net ([2600:1702:5083:7610:1e13:57ab:ecc5:1fd4])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-25e71070ba1sm10744fac.34.2024.07.06.01.29.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 06 Jul 2024 01:29:21 -0700 (PDT)
From: sean.wang@kernel.org
To: nbd@nbd.name,
	lorenzo.bianconi@redhat.com
Cc: sean.wang@mediatek.com,
	deren.wu@mediatek.com,
	mingyen.hsieh@mediatek.com,
	linux-wireless@vger.kernel.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH v2 35/37] wifi: mt76: mt7925: update mt7925_mac_link_bss_add for MLO
Date: Sat,  6 Jul 2024 01:28:15 -0700
Message-Id: <37fcf3ea7b4883840d61f97231277b297e1b15a3.1720248331.git.sean.wang@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1720248331.git.sean.wang@kernel.org>
References: <cover.1720248331.git.sean.wang@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240706_012923_383940_7AB4D8F2 
X-CRM114-Status: GOOD (  10.36  )
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

From: Sean Wang <sean.wang@mediatek.com>

Update band_idx in per-link BSS to be auto for the MLO-enabled firmware
and the MLO-enabled firmware only supports omac index in 0.

The change remains compatible with the non-MLO mode and the older firmware.

Co-developed-by: Ming Yen Hsieh <mingyen.hsieh@mediatek.com>
Signed-off-by: Ming Yen Hsieh <mingyen.hsieh@mediatek.com>
Co-developed-by: Deren Wu <deren.wu@mediatek.com>
Signed-off-by: Deren Wu <deren.wu@mediatek.com>
Signed-off-by: Sean Wang <sean.wang@mediatek.com>
---
 drivers/net/wireless/mediatek/mt76/mt7925/main.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/main.c b/drivers/net/wireless/mediatek/mt76/mt7925/main.c
index 44d9da5aadd1..0c4e106ae735 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/main.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/main.c
@@ -333,8 +333,9 @@ static int mt7925_mac_link_bss_add(struct mt792x_dev *dev,
 		goto out;
 	}
 
-	mconf->mt76.omac_idx = mconf->mt76.idx;
-	mconf->mt76.band_idx = 0;
+	mconf->mt76.omac_idx = ieee80211_vif_is_mld(vif) ?
+			       0 : mconf->mt76.idx;
+	mconf->mt76.band_idx = 0xff;
 	mconf->mt76.wmm_idx = mconf->mt76.idx % MT76_CONNAC_MAX_WMM_SETS;
 
 	if (mvif->phy->mt76->chandef.chan->band != NL80211_BAND_2GHZ)
-- 
2.25.1


