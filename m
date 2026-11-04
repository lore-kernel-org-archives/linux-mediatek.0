Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D770D606A331
	for <linux-mediatek@archiver.kernel.org>; Wed,  4 Nov 2026 14:27:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=lFbKQKlM;
	dkim=pass (2048-bit key, unprotected) header.d=mtu.edu header.i=@mtu.edu header.a=rsa-sha256 header.s=google header.b=gEwsqXVL
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=RCbnvskndM4HyM/U/wv9olKZU1ADpK80ces2ych6agU=; b=lFbKQKlMpCwfLxQdSB8NDpCH4Y
	hAhJBJlTmFf8v94LLAUdkEjcRCYjd7afACU8QECMiyNR5g+ZZ6yXtx7eYHDuQjPO7xEWWKF83kRlV
	pOFC8LOWkO/LupBE9ggafSlIwHRsuR933MtuLxWA0kV2EUB9eTdy3IhCAJT1fT5KCPs4XuNeeVjLM
	whLB89PqSrThIf3ysBtdal5G+CAFveDbA61/vV7LjY3ZOVJwe03S9PQ3TQmzr8WUEiEe2bSSudzn7
	+5LGIfWK9saae9WNglvNhmXRJeRQtWBLC147VqipDWJdIl/HeZ4i9Lj/5UoTTIO9oVM2ZyLfQbjcC
	VzbkKlFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOby2-00000005dm0-2XRU;
	Wed, 04 Nov 2026 14:27:58 +0000
Received: from mail-yw1-x1132.google.com ([2607:f8b0:4864:20::1132])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOby0-00000005dkf-1nv4
	for linux-mediatek@lists.infradead.org;
	Wed, 04 Nov 2026 14:27:58 +0000
Received: by mail-yw1-x1132.google.com with SMTP id 00721157ae682-8b12b1ee403so5245167b3.2
        for <linux-mediatek@lists.infradead.org>; Wed, 04 Nov 2026 06:27:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mtu.edu; s=google; t=1793802475; x=1794407275; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=RCbnvskndM4HyM/U/wv9olKZU1ADpK80ces2ych6agU=;
        b=gEwsqXVLO1LtHMWwWoygtJLL89ch74hQgMzZhq9+Dr7ldu8Jbz2Cm62yAcKFVzpum0
         cxnvRrAfnN69dmjGILnb3VQgExpiJBIaoKkYCVOpqEGlMktTucdnNDESSi1Ubc6691sT
         JKctd6JD4wHiDD45EDLLuZyyW8OVEfGc2PvrGUbl2atUrn3ixfv0vLCtaJ6Ev+85xuUK
         HR94ixkDgXCtqNP8C+VrnGy7XDaucQ8tSEMrtPbcnWK/dz/ZVT+fzwoJe+Qgwb2kxQln
         eZjTz6CslEB9uvsMcIatlzQEfPcZU28iODDbjWhko6DsyC8d0ZJNFuUDsrpnX6LcKdcG
         lsrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793802475; x=1794407275;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RCbnvskndM4HyM/U/wv9olKZU1ADpK80ces2ych6agU=;
        b=SeiB0QlUQQTed/5iQc8KFItzwjU4WflRd3xjlTWW6QKzR8zLtF1l0JXaRgQv1TPQzx
         uhq2Zimbsu5v05kPjMfJZf5bX8SZjE4bgetoho7oLjrVE5pR4PMrKvsAc4xxFzEfbKN9
         x0irdeW2fqUHRmm8ljTu6upbzmiGuS06mIsYMll16N65s2ijJBDaDuHpcopW5AeOwQwj
         7OeITlIrsM37YlKHNynV2lLMROYZ1Jed6oKCIphY3ehfPq6N34sFPtu/TQpn/lPskdtF
         +2x30b9E6F16TTTTRpC+Bwo2tqL+ARZ1qq9GKcRaTEXR3rPr6HeTmuL/ClIReFtM4Dcq
         h2aA==
X-Forwarded-Encrypted: i=1; AKwUvByAik+UReKRLrqDShrk2Fr5DMK8ikgAr4l5y7y/4csINzyPRtWw0eIYczKoVEvQct3FuGhbR821NMlwCOTdgg==@lists.infradead.org
X-Gm-Message-State: APuU4Z8hXSsaSSyezVy+pMHaCpiWAI0xIMPnixwRn91Vgq2OLDU2dejl
	9N8mSAvBV/IeInezhmevh7tFo3JgkTAmUDluOBIVgMscQel20rFfwBncIALuc4t0mQ==
X-Gm-Gg: AYBFou0cnf+qSXdWWhe4/Xeq7U2gueJ7mrGNGVn7bUBZCD4uWjwQlF9KdiqWqHAdHb7
	2NM4z0WzbOvq5Ej2PDtCvgEN13Yd6UYKI9hAXMlL1bvFq/ARmPiMzzc8lZzeU+qaGaNcf15vqis
	t1tcKCVKXKqx7VKGE1fpjhN759v4+cKl7QEscacOQgemBYgpSmQc/PWjaP/flWeDF6bJYDcUZCY
	zHZ2bu4bmy+Ox8BkASkXClqUc2rLp7BF93kdndsWzDi7MWr2ajWwFEabmWaojDQkeGCcX6yfWHs
	t50O0NxZ0L9SrOUxEftnvOjSpdkmYIbTv9KxXUOSMoto7H6hGjC3LU+AJ9cCxRg2WHVjYsP/c2k
	QiRGNbXHtYbgCUFI/9cUT0xxW1ssrKemFxVDFA1rfPEMjZMqVPO2MFCl5eRW1yAO48pdLggix06
	q20YPhQprDJnYSpChK7t2pBuSPwIQKSk4yHbhf7JRZo+zMY826Uh5zEuHkvnnyUIAsBwKuD/ExE
	IzWJgtW+whnWREaCCYm5ud8coEI/jgbYm2dcGf1mzvEr1nD2S0qjJ2fmeNGNQ382m57MSY1Cyn9
	GHQUN4PKU9KL8IL6GJX/fAsJr617Ice8+Nhk52XJL/0H4dLKsXXCW91T/A==
X-Received: by 2002:a05:690c:e013:10b0:8b3:2352:cc72 with SMTP id 00721157ae682-8b32352d42cmr3066537b3.39.1793802474565;
        Wed, 04 Nov 2026 06:27:54 -0800 (PST)
Received: from agent-virtualbox.mtu.edu ([47.6.6.53])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b30993945bsm19389467b3.21.2026.11.04.06.27.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 06:27:54 -0800 (PST)
From: Aaron Beckendorf <albecken@mtu.edu>
To: Felix Fietkau <nbd@nbd.name>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Ryder Lee <ryder.lee@mediatek.com>
Cc: Shayne Chen <shayne.chen@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Devin <lucid_duck@justthetip.ca>,
	linux-wireless@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	Aaron Beckendorf <albecken@mtu.edu>
Subject: [PATCH v2] wifi: mt76: connac: honour injected HT/VHT rate and bandwidth
Date: Wed,  4 Nov 2026 09:26:22 -0500
Message-ID: <20261104142737.186484-1-albecken@mtu.edu>
X-Mailer: git-send-email 2.53.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261104_062756_582746_6D6BFCF4 
X-CRM114-Status: GOOD (  13.45  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On connac2 parts the fixed-rate TXD path uses the basic rate from
mt76_connac2_mac_tx_rate_val() and ignores the rate carried in an
injected frame's radiotap header, so monitor-mode injection always goes
out at a legacy 20 MHz rate and cannot choose the modulation or channel
width.

When info->control.rates[0] contains an HT or VHT MCS, set the TXD6 rate
from it instead: mode (HT/VHT), MCS, NSS, and the channel width from the
rate flags; for HT the whole MCS index is used, as mt7615 does. Legacy
injection and the normal (non-fixed-rate) data path are unchanged.

This makes 20/40/80 MHz HT/VHT injection work on mt7921u. mt7925 and
mt7996 build their own TX descriptor and are not affected.

Signed-off-by: Aaron Beckendorf <albecken@mtu.edu>
---
v2:
 - HT: use the whole MCS index in the rate index field; the v1 mask
   (tr->idx & 0x7) dropped the second spatial stream, so HT MCS 8-15
   went out as 0-7.  Caught in review by Devin <lucid_duck@justthetip.ca>.
 - Also set the 160 MHz width; the shared mt76_connac2_mac_write_txwi()
   is used by the 160-capable mt7915 family and mt7922, matching mt7615.
 - Drop the mt7925u claim; mt7925 has its own mt7925_mac_write_txwi()
   and never reaches this path.

 .../wireless/mediatek/mt76/mt76_connac_mac.c  | 37 +++++++++++++++++++
 1 file changed, 37 insertions(+)

diff --git a/drivers/net/wireless/mediatek/mt76/mt76_connac_mac.c b/drivers/net/wireless/mediatek/mt76/mt76_connac_mac.c
index 8481eac8d783..e62d39cb1ba5 100644
--- a/drivers/net/wireless/mediatek/mt76/mt76_connac_mac.c
+++ b/drivers/net/wireless/mediatek/mt76/mt76_connac_mac.c
@@ -602,6 +602,43 @@ void mt76_connac2_mac_write_txwi(struct mt76_dev *dev, __le32 *txwi,
 		u32 val = MT_TXD6_FIXED_BW;
 		u8 spe_idx = mt76_connac_spe_idx(mphy->antenna_mask);
 
+		/* Honour an injected HT/VHT rate and bandwidth from radiotap:
+		 * connac otherwise transmits at the basic rate picked by
+		 * mt76_connac2_mac_tx_rate_val(), so monitor injection cannot
+		 * select the modulation or channel width.
+		 */
+		if (info->control.rates[0].idx >= 0 &&
+		    (info->control.rates[0].flags &
+		     (IEEE80211_TX_RC_MCS | IEEE80211_TX_RC_VHT_MCS))) {
+			struct ieee80211_tx_rate *tr = &info->control.rates[0];
+			u8 mode, mcs, nss = 0, bw = 0;
+
+			if (tr->flags & IEEE80211_TX_RC_VHT_MCS) {
+				mode = MT_PHY_TYPE_VHT;
+				mcs = ieee80211_rate_get_vht_mcs(tr);
+				nss = ieee80211_rate_get_vht_nss(tr) - 1;
+			} else {
+				mode = MT_PHY_TYPE_HT;
+				/* the HT rate index encodes NSS in its upper
+				 * bits, so pass it whole, as mt7615 does
+				 */
+				mcs = tr->idx;
+				nss = tr->idx >> 3;
+			}
+
+			if (tr->flags & IEEE80211_TX_RC_80_MHZ_WIDTH)
+				bw = 2;
+			else if (tr->flags & IEEE80211_TX_RC_40_MHZ_WIDTH)
+				bw = 1;
+			else if (tr->flags & IEEE80211_TX_RC_160_MHZ_WIDTH)
+				bw = 3;
+
+			rate = FIELD_PREP(MT_TX_RATE_MODE, mode) |
+			       FIELD_PREP(MT_TX_RATE_IDX, mcs) |
+			       FIELD_PREP(MT_TX_RATE_NSS, nss);
+			val = MT_TXD6_FIXED_BW | FIELD_PREP(MT_TXD6_BW, bw);
+		}
+
 		/* hardware won't add HTC for mgmt/ctrl frame */
 		txwi[2] |= cpu_to_le32(MT_TXD2_HTC_VLD);
 

base-commit: 991a73f4909f1348ffb4b38765cdb522a775e4c2
-- 
2.53.0


