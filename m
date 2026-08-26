Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBF4AC61DC2
	for <linux-mediatek@archiver.kernel.org>; Wed, 26 Aug 2026 09:28:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=nLln/nzEL/lmZp8E8NEYYdhaUC5D7iZndLYefw4Q5CU=; b=FLkAqA1zQStEJvH+BUCr30uNIz
	lr/b99fXrzrd5DgC85ptBTZK8kZdxkpEcl+o3EIk577A+XaeFbGSAtUbndQ+JkQ7UVO3b91uxbQFL
	7QKxkwBPtNJW4WfP96Z7WxYhJw6ZGvx1/rfkpbOfh5O3Saojpt09YlfNCAsx7d5EKj+yUvQ9Txtj/
	raNRXJLXrI9eY5XHwQU9pZGJoilzIac8/h2M70efY+AdYc3H+HvNdx2povYj/aOzdp/fRCeSN/6Dq
	3SAenZc/Z8rc2Fue6yOIFGqozzfXz7uieKN/Znm4crTv91C3ZjyJusd1OfxVXrC4KpRZmbUgHsKSS
	vlSJ4eqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wz9vV-00000002C4E-2vcf;
	Wed, 26 Aug 2026 09:28:09 +0000
Received: from mail-qk2-x0b.google.com ([2607:f8b0:4864:34::b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wz9vS-00000002C3s-3ikw
	for linux-mediatek@lists.infradead.org;
	Wed, 26 Aug 2026 09:28:08 +0000
Received: by mail-qk2-x0b.google.com with SMTP id af79cd13be357-930914e4fc3so18987085a.0
        for <linux-mediatek@lists.infradead.org>; Wed, 26 Aug 2026 02:28:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787736485; x=1788341285; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=nLln/nzEL/lmZp8E8NEYYdhaUC5D7iZndLYefw4Q5CU=;
        b=UaFrnfK7eSAdO24GTtvShhuHVilDvKErx/lf+CGzvHT5LXvBQ8EPLLgLNG4koGSrHJ
         aAsIU1rm3/JIif78KG0L3HR4NiTKJrhPnAK4d0T4q8asdTR3sAnSDFPCUnx9Yte4oY6A
         uHMkhojiXDKSz1812RR5Zo0MCRZ6m4kr29leN9Yl4LURFnhRep/ILTjtyS4mUTtOPNtX
         fPaI44ZTrr4RVxrGqYvLaBQeWrQchnc2yY6JEWd+NZTCBJfxEKgmZ5v8xLBMdkWJSQvq
         ImPafr7/cN4LT0bUgAgVKFl6Rg2pLE7p29Gqbq4cPLub6JAjLii0uaq8hhbNBf1eGtkd
         cCLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787736485; x=1788341285;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nLln/nzEL/lmZp8E8NEYYdhaUC5D7iZndLYefw4Q5CU=;
        b=MUT56sTfGy3l6Le+UxDwnbDaOHUFFFRHsLOTAMRjAPTlzOmHH2NjC0htx5GwzgA0aa
         qshKkipPegm76oz88Qb8JTcSEuJihTo0wDW7I7JRwJgz11H6QSENifizG4CmMc80aHgQ
         hxJ2ZURJ1tPg+R7Qa15GUA7umoceookYig7qgL38ln6D0b/0QpPA4V9Hhhpv69ynbhpX
         RUJT12og/P78VQ1poNWpmLWVBKwQCaxCj5CqcBfGjfuFVgxF0p5e+mLZzm/k70IBZVLb
         l7kZ/K8reJFBEGeHdGdg7d7p0vOIFha9Zwc9RdNg77XMbj7We918q9nqCnp5y+A4sly/
         HiPA==
X-Forwarded-Encrypted: i=1; AHgh+RpVQA0KWRi6/2OoZzgjXddNNFdSRX73QpuPSbhPD3dvodTsnILrH/0OAeZ2PiArhf+INcC90jpBSxY0IICTdg==@lists.infradead.org
X-Gm-Message-State: AFuF++mfRjA9CpmGpvN/lbG1F/b9dV/+zNBfcDm/ZAyTomFdYk7k5cnU
	t+gh0coBwC85XfT5wHQAth4e+fP0WqbuYSEDFPRQGXHjo826yfi8XTvA
X-Gm-Gg: AR+sD13R38UT342XdA6JMm1ggdPULtZlu6ywwsSwO0NfpUHWGECV706qPNgOAOLlvds
	p4q7ryxQNkrD9uhCWypkoI2DVwdNeF48Um5PMdUio8C/jeIXS+C03iw6jgJPS1oUag6O59qisi1
	5RmIb/53SJswHQKqWwlgtINlngIDbAyQYzW7C1e27g0iEd5G43vWFz+Y2Q0v8VEMy0Fr/A+TGvY
	oNRFAc0N9MSzjXhmeCBOtJR4msP7taeR05YW0y58JnsNNMRZuHY843GD5a7jckUxH5XViPOl4sC
	L1AGR1CfkLPk10L1gJmabW8JkYJvsW0QVsmlQxgj5dBQa4WRad3V+P3VBiJfPIRvEiQwd+AOzQu
	PFwEdIe5VoqCRlxYtXeOx7XliQlctkDSikc5U8Y4v7cZ6C9YpmsjkTb9bA2k39hdBcirCsqXlNi
	R825ul57eJeLlB26L4xfMy6dCfMEz0+o2aTppLX1YjKzmYpc3ZzKsVS19RyIZ6DGPDmWLoToido
	UQJqohCoZ4e7g==
X-Received: by 2002:a05:620a:99c:b0:937:2aca:4d58 with SMTP id af79cd13be357-937803e5454mr340157585a.24.1787736485479;
        Wed, 26 Aug 2026 02:28:05 -0700 (PDT)
Received: from localhost.localdomain ([2606:6d00:39f:4500:5acb:2301:2b5a:c076])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9377e34b9cfsm170522085a.13.2026.08.26.02.28.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Aug 2026 02:28:05 -0700 (PDT)
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
	Devin Wittmayer <lucid_duck@justthetip.ca>
Subject: [PATCH wireless v2] wifi: mt76: mt76x02: validate TX-status rate index before mac80211 handoff
Date: Wed, 26 Aug 2026 05:27:55 -0400
Message-ID: <20260826092755.480190-1-markanthonyagarro@gmail.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260826_022806_936821_92910BF4 
X-CRM114-Status: GOOD (  12.44  )
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
Closes: https://github.com/morrownr/mt76/issues/88
Tested-by: Devin Wittmayer <lucid_duck@justthetip.ca>
Signed-off-by: Mark Anthony Agarro <markanthonyagarro@gmail.com>
---
v2: Drop the Reported-by tag. It named an invented
    users.noreply.github.com address for the reporter that isn't a
    real, deliverable mailbox (v1's Cc bounced with NXDOMAIN on that
    domain). Closes: already credits and links the original report;
    no functional change.

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


