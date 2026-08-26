Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95657C5DF97
	for <linux-mediatek@archiver.kernel.org>; Wed, 26 Aug 2026 09:23:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=iLS2FTkBwTZO9cFIxC30lB3zfdCwRmbbW10fAQY6Wo8=; b=aEGNY0+Q0cp5FLX9aep/ldja26
	VKinosvMtlxtVPpECh6jQpssIZGDLok+j2jbNPvuVx+vjMXK+iKoXtxlLZlaIEHfr/3S2iZTf3ooO
	YzwQfVo6IQnApi2TPZn3PCgAKllE5sLmQNIZZlT7iWO9jwTCZKs3X9oi/6SiQ6oLeEKwOYJXKjhns
	rTTbyCoEtHzfAPOtGK816aN3tRfpTpTlgm49SOjdSqVwsj5ulxIQu/n8JU3ytw9J86JXCJ8MtKBTI
	h1tSlujJD4FBqCSD+fhNudXL8eM7YIbBlXKoI97EkIjmO8AhF9JLbbOpUM5Z3ZF3tYi+ETYPlbVrO
	7tmDOKhg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wz9rH-00000002AoK-1wB6;
	Wed, 26 Aug 2026 09:23:47 +0000
Received: from mail-qv2-x02.google.com ([2607:f8b0:4864:33::2])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wz9rE-00000002Anm-2JpA
	for linux-mediatek@lists.infradead.org;
	Wed, 26 Aug 2026 09:23:45 +0000
Received: by mail-qv2-x02.google.com with SMTP id 6a1803df08f44-90c4d223e0bso3751236d6.0
        for <linux-mediatek@lists.infradead.org>; Wed, 26 Aug 2026 02:23:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787736223; x=1788341023; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=iLS2FTkBwTZO9cFIxC30lB3zfdCwRmbbW10fAQY6Wo8=;
        b=fSjpqZvsVspNo+c9AF3C+OBWBSAgvwvi8AAUQ1hMcZobIz+UyaIJBX1xdlelJxdMCT
         EECZKyTUkAAEkidKGay3zY/N42tMJigkaNMKMj5BilyVkgcMjxZj3u0S1bP4MvZQ675s
         BNeK6D8OrCsTGGSBs9Igw4ShWQDFX7/zjnlZI6an8seWmQ2sKhFVRwnyQMB1yQwQpbcG
         IfxG8YbyGrr7xCqqLeimCOA651k+SzHG/QNCZymfzkO6MJxpr/uuGeM9av5SFUmSvD8X
         fSyvuKqrwHVKJc+N2kEADjR2MJQfdf0SYJnT5OZlPhEIIJlj/c2Jl6G0T0rwA/xHS8aD
         WylQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787736223; x=1788341023;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iLS2FTkBwTZO9cFIxC30lB3zfdCwRmbbW10fAQY6Wo8=;
        b=hk3TKteCayApBDB8E32htOqMrxqUW9tkmi6F78Yzk/GtA0bHOBtpwRr7GRk9/JN7PN
         2fTfjB6RllBUBMn7T27CnzZ0IM/x8UAIsK2s+uo8aM0nelibYwTxRSBx68m73HiwwfwA
         NPymWFJNrnHIYq8utqTJhYX7qlodNAqO9ypdd5A+mid+s8gNRbDA/cFwSMqsdaUDWIuV
         yyEOqq0sAya/Yegq1+plyMo/OIFfoqMCja2X4NpS+1SasDbAG0Q/AZNHdl0acCunpcJe
         1SE7qWaUSzfPbCnv/kFL3WN+yvfgNvMo/Le2B5aXfW/WNZBiN1TmjGbQe3sI1AwPqFK+
         hOJQ==
X-Forwarded-Encrypted: i=1; AHgh+RoFs/hCVrZCrMNMGrjRAn882h4frwXnxAaPAACe8Xp3OK5mYGJoL8LYoxA8bHkI5jOo1UE5DALqYamhq6CJVQ==@lists.infradead.org
X-Gm-Message-State: AFuF++ncgi3QBa0yBCIIAf7ZSBcD3dC2tG8Cgw/AZI/6AYkMFEwrSRpZ
	W/shvke0rZv4WiWUCKcIXmm7G56YzdWOnJvTm8dcpL11Z35VKPGRdd/u
X-Gm-Gg: AR+sD1171LoW4/B+Dvbe4KSqO4lpGlu1jq8iNBDXC1v5EEv1so4tCQ3dmrqhQqGcdzB
	L7QO3LygTt/6p3a0c+IXUd0ewCpwHC7HP839hGiJ2+FHN0e2h1xiDpIY+qZk+xSlsTyUStO9yLx
	Y0XAtvkRiJNY70AQc/nR6mE6qLaUz2WuvNpv6927HKaWKuxnR/4wyNV94hQViEzK0j/MBAhedrs
	UYKe1Hpx/3d/sQvDgbVc1DNNnVL1ZKUqHwC7zSRCfjdtw85uCuT9hIdxeodwW6q1CEzXnUhWMaf
	M0mRVoNp9hXeKMdDp3n4LuL2kmuGh0TK5hOu3zy49gGvbJ3jV/D4JeyQ0AakhFN787DTbRpmSN2
	w1rx/YTgg15ubY7WSCiLdRWncgi/eFFOb9G+/UvQEkjlwB0YYwPUO+MW4Bi3TQKZHSghrRHay+v
	9ggdpw3Xl+nhhekkyhMvP2n55KO60HcbS4IpGcoxG73ZlIUkuLk2bhOTRiAE5f1dusoKp0vO+0q
	nB0WYenLt4ddA==
X-Received: by 2002:a05:6214:4102:b0:90c:c39e:486 with SMTP id 6a1803df08f44-90cc7976c14mr43064136d6.31.1787736223075;
        Wed, 26 Aug 2026 02:23:43 -0700 (PDT)
Received: from localhost.localdomain ([2606:6d00:39f:4500:5acb:2301:2b5a:c076])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-90cc63e3108sm21248046d6.11.2026.08.26.02.23.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Aug 2026 02:23:42 -0700 (PDT)
From: Mark Anthony Agarro <markanthonyagarro@gmail.com>
To: linux-wireless@vger.kernel.org
Cc: Felix Fietkau <nbd@nbd.name>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Ryder Lee <ryder.lee@mediatek.com>,
	Shayne Chen <shayne.chen@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>,
	linux-mediatek@lists.infradead.org,
	stable@vger.kernel.org,
	Mark Anthony Agarro <markanthonyagarro@gmail.com>,
	rajeshkc-lx <rajeshkc-lx@users.noreply.github.com>,
	Devin Wittmayer <lucid_duck@justthetip.ca>
Subject: [PATCH wireless] wifi: mt76: mt76x02: validate TX-status rate index before mac80211 handoff
Date: Wed, 26 Aug 2026 05:23:31 -0400
Message-ID: <20260826092331.476016-1-markanthonyagarro@gmail.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260826_022344_626412_56A7FB15 
X-CRM114-Status: GOOD (  11.83  )
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

mt76x02_mac_process_tx_rate() extracts the rate index straight from
the hardware's raw TX-status word with no bounds check for the
HT/HT_GF/VHT cases, and mt76x02_mac_fill_tx_status() ignores its
return value. A stale or corrupt hardware index reaches mac80211's
minstrel_ht rate control, whose per-group rate array is a fixed 10
entries (MCS_GROUP_RATES), causing an out-of-bounds write.

Validate the index in mt76x02_mac_process_tx_rate() (HT: 0-31,
VHT: MCS nibble 0-9) and have mt76x02_mac_fill_tx_status() bail out
cleanly on failure instead of passing an invalid index through.

Fixes: 7c1f88812690 ("mt76: unify send_tx_status and related helpers")
Cc: stable@vger.kernel.org
Reported-by: rajeshkc-lx <rajeshkc-lx@users.noreply.github.com>
Closes: https://github.com/morrownr/mt76/issues/88
Tested-by: Devin Wittmayer <lucid_duck@justthetip.ca>
Signed-off-by: Mark Anthony Agarro <markanthonyagarro@gmail.com>
---
 .../net/wireless/mediatek/mt76/mt76x02_mac.c  | 27 ++++++++++++++-----
 1 file changed, 21 insertions(+), 6 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt76x02_mac.c b/drivers/net/wireless/mediatek/mt76/mt76x02_mac.c
index 14ee5b3b9..d77356a2e 100644
--- a/drivers/net/wireless/mediatek/mt76/mt76x02_mac.c
+++ b/drivers/net/wireless/mediatek/mt76/mt76x02_mac.c
@@ -302,10 +302,22 @@ mt76x02_mac_process_tx_rate(struct ieee80211_tx_rate *txrate, u16 rate,
 		txrate->flags |= IEEE80211_TX_RC_GREEN_FIELD;
 		fallthrough;
 	case MT_PHY_TYPE_HT:
+		/* Raw hardware TX-status index is unvalidated; a stale or
+		 * corrupt value here overflows mac80211/minstrel_ht's
+		 * per-group rate array (MCS_GROUP_RATES == 10) and crashes.
+		 * Valid 802.11n MCS indices are 0-31 (four streams x 8).
+		 */
+		if (idx > 31)
+			return -EINVAL;
 		txrate->flags |= IEEE80211_TX_RC_MCS;
 		txrate->idx = idx;
 		break;
 	case MT_PHY_TYPE_VHT:
+		/* Same overflow risk for VHT: mac80211 expects the MCS
+		 * nibble (bits 3:0) in range 0-9, nss packed above it.
+		 */
+		if ((idx & 0xf) > 9)
+			return -EINVAL;
 		txrate->flags |= IEEE80211_TX_RC_VHT_MCS;
 		txrate->idx = idx;
 		break;
@@ -493,18 +505,21 @@ mt76x02_mac_fill_tx_status(struct mt76x02_dev *dev, struct mt76x02_sta *msta,
 		first_rate = st->rate & ~MT_PKTID_RATE;
 		first_rate |= st->pktid & MT_PKTID_RATE;
 
-		mt76x02_mac_process_tx_rate(&rate[0], first_rate,
-					    dev->mphy.chandef.chan->band);
+		if (mt76x02_mac_process_tx_rate(&rate[0], first_rate,
+						dev->mphy.chandef.chan->band))
+			return;
 	} else if (rate[0].idx < 0) {
 		if (!msta)
 			return;
 
-		mt76x02_mac_process_tx_rate(&rate[0], msta->wcid.tx_info,
-					    dev->mphy.chandef.chan->band);
+		if (mt76x02_mac_process_tx_rate(&rate[0], msta->wcid.tx_info,
+						dev->mphy.chandef.chan->band))
+			return;
 	}
 
-	mt76x02_mac_process_tx_rate(&last_rate, st->rate,
-				    dev->mphy.chandef.chan->band);
+	if (mt76x02_mac_process_tx_rate(&last_rate, st->rate,
+					dev->mphy.chandef.chan->band))
+		return;
 
 	for (i = 0; i < ARRAY_SIZE(info->status.rates); i++) {
 		retry--;
-- 
2.47.3


