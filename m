Return-Path: <SRS0=SroS=L6=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6519EC07E96
	for <linux-mediatek@archiver.kernel.org>; Tue,  6 Jul 2021 11:27:31 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3B8A561D81
	for <linux-mediatek@archiver.kernel.org>; Tue,  6 Jul 2021 11:27:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3B8A561D81
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zAjpc6gu6P1WExuvDbhQNyS2MxOrpYWp9pmFCrrVSM4=; b=Z0ATpL2fiKW0Da
	nMQWz6jS4utBk05Cd3+S762e1SfnxgLcckubapRlUYBiCZhmKhZGYlV7Abw2r2YkhhnIn0cZWNb0Y
	mDV5P1ee/XeZ/Ey5wER1y1adIEBWdDYl1T5KwHNA5VKJ9Q8eFyyhMBYMcRIcjqgzhZM+P+OdOfOIV
	VO1mQyxolCP20/fuySVsCSMzmiU5Jdtj+fsq5i5vTFomAdUd6qBmGk3Bj2kEqbL0nitDMtgXfbhY9
	NRN1qbj8xixxJ6wdFmb1COoE3nYKQOwz8LwFVKxkQsCMW0rvLmSmjhuBYGA4bo75XfpGsgcFisOIZ
	spav5C69BrQ6gN6gKWdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m0jEY-00BKlw-5Q; Tue, 06 Jul 2021 11:27:22 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m0j4j-00BEPo-8q; Tue, 06 Jul 2021 11:17:14 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 254B561C8B;
 Tue,  6 Jul 2021 11:17:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1625570233;
 bh=SKgrW86FCTuQ2U8shcCjpqm/B2ijXEQ1rAZcVr4+KE0=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=LuuEtTu4j6OS0eitfqCe+5BHCWJqS0HSOy97ejbjBJOiFi71vL6aJ4RnHAvMIasyK
 +mdA2/zqti2lvrxlJaiqm7ycJSelfBQ1v06NkNnXI65MmWuplKTEFvlFQ/B1MJHHWd
 y4kAJFnbfH0r5JKQ814eeSP403jklk/bqBpo4jH9JVOuyGFc23Ct8LxEl9qCeEOpVS
 xJ6hWERP4NCDQNPTzY4GrFHVke5ZMfgMgrzPO8wx4Rk7OPot7PmkE5Tecgs/xHo3Cm
 zAsPZI+lUTX3aQRAuavT6LfJX0dAmXNKW2JB8022S90R22Uv+b3XqxCAkwzgdbE/+o
 XKTAuHHSKb8sg==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Ryder Lee <ryder.lee@mediatek.com>, Felix Fietkau <nbd@nbd.name>,
 Sasha Levin <sashal@kernel.org>, linux-wireless@vger.kernel.org,
 netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
Subject: [PATCH AUTOSEL 5.13 136/189] mt76: mt7915: fix
 IEEE80211_HE_PHY_CAP7_MAX_NC for station mode
Date: Tue,  6 Jul 2021 07:13:16 -0400
Message-Id: <20210706111409.2058071-136-sashal@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210706111409.2058071-1-sashal@kernel.org>
References: <20210706111409.2058071-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210706_041713_433150_9F1A7AEC 
X-CRM114-Status: UNSURE (   9.32  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Ryder Lee <ryder.lee@mediatek.com>

[ Upstream commit 2707ff4dd7b1479dbd44ebb3c74788084cc95245 ]

The value of station mode is always 0.

Fixed: 00b2e16e0063 ("mt76: mt7915: add TxBF capabilities")
Signed-off-by: Ryder Lee <ryder.lee@mediatek.com>
Signed-off-by: Felix Fietkau <nbd@nbd.name>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/net/wireless/mediatek/mt76/mt7915/init.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/init.c b/drivers/net/wireless/mediatek/mt76/mt7915/init.c
index 822f3aa6bb8b..feb2aa57ef22 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/init.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/init.c
@@ -480,6 +480,9 @@ mt7915_set_stream_he_txbf_caps(struct ieee80211_sta_he_cap *he_cap,
 	if (nss < 2)
 		return;
 
+	/* the maximum cap is 4 x 3, (Nr, Nc) = (3, 2) */
+	elem->phy_cap_info[7] |= min_t(int, nss - 1, 2) << 3;
+
 	if (vif != NL80211_IFTYPE_AP)
 		return;
 
@@ -493,9 +496,6 @@ mt7915_set_stream_he_txbf_caps(struct ieee80211_sta_he_cap *he_cap,
 	c = IEEE80211_HE_PHY_CAP6_TRIG_SU_BEAMFORMING_FB |
 	    IEEE80211_HE_PHY_CAP6_TRIG_MU_BEAMFORMING_PARTIAL_BW_FB;
 	elem->phy_cap_info[6] |= c;
-
-	/* the maximum cap is 4 x 3, (Nr, Nc) = (3, 2) */
-	elem->phy_cap_info[7] |= min_t(int, nss - 1, 2) << 3;
 }
 
 static void
-- 
2.30.2


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
