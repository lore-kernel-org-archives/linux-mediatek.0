Return-Path: <SRS0=WaF/=KA=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9D9F4C433ED
	for <linux-mediatek@archiver.kernel.org>; Wed,  5 May 2021 16:34:31 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 452216162C
	for <linux-mediatek@archiver.kernel.org>; Wed,  5 May 2021 16:34:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 452216162C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=wc+vhOL2kecXuVFzdgZ2Z3ggHu80FIFQzFw2T0S+idA=; b=IOuqzGBu+9gPlwCe3Bd6Y7E4Y
	JwmCVe9An2KBMaCEpPZHwfvqWmKr5Iu530fEll3uPFAUkDEwjiT9IBAT8Or1/JpPf35nQiAOVNq+t
	78Z8jTuJAFFbNKirNYTJ0rFn94Jy1TpREJBmUMOGWv67qTXA+B5jIO8kFbtFOot5Q3wYFtkYx4ja0
	V/TmetZGy/QXtHfZmxQDiAvDR0mJ18gQOR6qHPrIjxr9uATXeilsEma87mIftmuPQdG5dgMBov1Hn
	NRIAwTjNK5mxo4Gb3S8UF/CW1LgzmJ0DmnY9L+iq8Su8WAfCtbi7/Bgllk6MZcJepeeSZDY0GKy+W
	TPsT39nLQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1leKTe-001f3Z-Nr; Wed, 05 May 2021 16:34:22 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1leKS8-001eWf-F9; Wed, 05 May 2021 16:32:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=Y/DuqoX4gJ169NtajAYMD9lJq29GKJ6hy1AHDih3mKk=; b=Ve50eBglnK4g7mcFlbGzyg3+a1
 gZgEtBAYx84ayjC3qLt/DjcDRoLZuq6pOj/sgq/lWg+OUXQPoobaWn4m5hbV+z+y2ZalRvyAZxjUz
 zSbqQLh6MTHU/Q6CgejgQBI+zlxZ51qATXqkgJJoeLuEaQDijJmDviG//TytnlDAFP9Zp77gmZuZB
 yTSNTl082Z7XuRBeuw0I4+nA78myJTJ4SDolrGKrDq/IShDOmJWTPRJp53hdLvuYi11FZQguZSVWp
 KzoZdCTBveg0R7Q1gv9ogBfkJbBqc1mnIEJtnbxvf6yQ9zFLSfpGJu/RkKmXutNyESGWNgdb2z41y
 Qo5fWpoA==;
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1leKS6-004wOW-0f; Wed, 05 May 2021 16:32:47 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id AEBE26142F;
 Wed,  5 May 2021 16:32:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1620232365;
 bh=2Htp6dURzsP1SUR5ARGfwS+oapd+HszsASpsqXB1VAQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=UKNfqUGZAOteBUPVKX43aCiuaFtQXA2wVVROhoLRb2eCnF8US4yPTMblMRuqJQitW
 XL5DZ22wArEshn5dXw/8EdPIxUFBpdStHYZE5cmGY4VUYSpinTQpt1F9DVlE3NJ84i
 zC4v0b0eXhCYeVDQMo+byP5YnIK78JD20tw23JWFO19LVYuqN1593KpHDI77xsW3yV
 7ctik/5asmUtGP00gPPs5GHusKS9zUVR2YCq9G9dIidQvgSzpWIWDuXQB05C8fpuON
 gmVzZ2/FnqVNHfJ0/ml+Nen6i6p5BsmOMvZ3naqaDC6mnUnYsb+ItiqmbUP9ZqC3fP
 eLrPxCRgzgRNg==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: David Bauer <mail@david-bauer.net>, Felix Fietkau <nbd@nbd.name>,
 Sasha Levin <sashal@kernel.org>, linux-wireless@vger.kernel.org,
 netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
Subject: [PATCH AUTOSEL 5.12 058/116] mt76: mt76x0: disable GTK offloading
Date: Wed,  5 May 2021 12:30:26 -0400
Message-Id: <20210505163125.3460440-58-sashal@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210505163125.3460440-1-sashal@kernel.org>
References: <20210505163125.3460440-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210505_093246_099249_599723F5 
X-CRM114-Status: GOOD (  11.51  )
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

From: David Bauer <mail@david-bauer.net>

[ Upstream commit 4b36cc6b390f18dbc59a45fb4141f90d7dfe2b23 ]

When operating two VAP on a MT7610 with encryption (PSK2, SAE, OWE),
only the first one to be created will transmit properly encrypteded
frames.

All subsequently created VAPs will sent out frames with the payload left
unencrypted, breaking multicast traffic (ICMP6 NDP) and potentially
disclosing information to a third party.

Disable GTK offloading and encrypt these frames in software to
circumvent this issue. THis only seems to be necessary on MT7610 chips,
as MT7612 is not affected from our testing.

Signed-off-by: David Bauer <mail@david-bauer.net>
Signed-off-by: Felix Fietkau <nbd@nbd.name>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/net/wireless/mediatek/mt76/mt76x02_util.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/net/wireless/mediatek/mt76/mt76x02_util.c b/drivers/net/wireless/mediatek/mt76/mt76x02_util.c
index ab671e21f882..02db5d66735d 100644
--- a/drivers/net/wireless/mediatek/mt76/mt76x02_util.c
+++ b/drivers/net/wireless/mediatek/mt76/mt76x02_util.c
@@ -447,6 +447,10 @@ int mt76x02_set_key(struct ieee80211_hw *hw, enum set_key_cmd cmd,
 	    !(key->flags & IEEE80211_KEY_FLAG_PAIRWISE))
 		return -EOPNOTSUPP;
 
+	/* MT76x0 GTK offloading does not work with more than one VIF */
+	if (is_mt76x0(dev) && !(key->flags & IEEE80211_KEY_FLAG_PAIRWISE))
+		return -EOPNOTSUPP;
+
 	msta = sta ? (struct mt76x02_sta *)sta->drv_priv : NULL;
 	wcid = msta ? &msta->wcid : &mvif->group_wcid;
 
-- 
2.30.2


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
