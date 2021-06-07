Return-Path: <SRS0=qtn6=LB=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7EC85C47095
	for <linux-mediatek@archiver.kernel.org>; Mon,  7 Jun 2021 16:13:55 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 518406140D
	for <linux-mediatek@archiver.kernel.org>; Mon,  7 Jun 2021 16:13:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 518406140D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=w7HzCtGide9z+PP6f42xesMdCRCuOfYOnytj91ajqe8=; b=v0K/dtHHvmTxxj
	Z6voPDUXami0amDQ2ylxNqpMYYJtY63+tKbQDSBKgSJzSvE+tIBAm8vv6DEgxwUjqLv1HZW+X0AlQ
	CekLD5lPkZlWLM9w0D8UqHJV2EHGjDSS6HA+5OVCb5mdq6Xwx75DGG2INRflw+WH7u7WOPV0/wQKa
	+jcQtg+rKLtHjsPwbdLcrwnO26Pv3n4a+glfXWOPPPqUBP/bsgua7Pa3MZeS08d+kkC30mZI2S73k
	YOqwddNQoHQvi/eiSjdWcdKQGN9EOBFMZAAP4ttJkLA5IGDEarb686Q7kMNCXo9PmqwnzPpEPPMDO
	UmwfnwNx4wPPyTPUWMKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lqHsi-004OnK-B1; Mon, 07 Jun 2021 16:13:40 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lqHrv-004OBg-1C; Mon, 07 Jun 2021 16:12:52 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id CC2C76141E;
 Mon,  7 Jun 2021 16:12:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1623082370;
 bh=0Tu5Uz0GUjDfRA36Cq/kM4LadVNUM41ye8xS8GOdVhk=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=q+qKzKEFkIuNtIUtgNM7bnoPlSFLk6MMY0ZJgkx5c3cKzHuaY6sI4FXaOfxluayUt
 0UM9mFRU95zpWE0da6mS/ckAKHNUhmvtkX/no9XRddJ+h1jAzbE2gzE6GHeBIS4JRV
 BzDCyU2MFo5P7IiQMJDHMkSkx0ojapvzw7iVed6O8J6obUNptYlOCeXLj8jvj6LO7k
 uGurb6N1SIz/mN474HKqPPwy+z0o4OTgfzvImInQhttckecWYuEARXGQ3vd/Lp9G2X
 xay9Yp/ZJCREdoY6LQDNaZXHq3fsOVk+y/5uIeNrctD/jVa8PTVAe7mRsIhNtv5lwI
 W4j8IevOd/m+A==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Felix Fietkau <nbd@nbd.name>, Kalle Valo <kvalo@codeaurora.org>,
 Sasha Levin <sashal@kernel.org>, linux-wireless@vger.kernel.org,
 netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
Subject: [PATCH AUTOSEL 5.12 28/49] mt76: mt7921: remove leftover 80+80 HE
 capability
Date: Mon,  7 Jun 2021 12:11:54 -0400
Message-Id: <20210607161215.3583176-28-sashal@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210607161215.3583176-1-sashal@kernel.org>
References: <20210607161215.3583176-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210607_091251_116476_A2E2940F 
X-CRM114-Status: UNSURE (   8.83  )
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

From: Felix Fietkau <nbd@nbd.name>

[ Upstream commit d4826d17b3931cf0d8351d8f614332dd4b71efc4 ]

Fixes interop issues with some APs that disable HE Tx if this is present

Signed-off-by: Felix Fietkau <nbd@nbd.name>
Signed-off-by: Kalle Valo <kvalo@codeaurora.org>
Link: https://lore.kernel.org/r/20210528120304.34751-1-nbd@nbd.name
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/net/wireless/mediatek/mt76/mt7921/main.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/main.c b/drivers/net/wireless/mediatek/mt76/mt7921/main.c
index ada943c7a950..2c781b6f89e5 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7921/main.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7921/main.c
@@ -74,8 +74,7 @@ mt7921_init_he_caps(struct mt7921_phy *phy, enum nl80211_band band,
 				IEEE80211_HE_PHY_CAP0_CHANNEL_WIDTH_SET_40MHZ_IN_2G;
 		else if (band == NL80211_BAND_5GHZ)
 			he_cap_elem->phy_cap_info[0] =
-				IEEE80211_HE_PHY_CAP0_CHANNEL_WIDTH_SET_40MHZ_80MHZ_IN_5G |
-				IEEE80211_HE_PHY_CAP0_CHANNEL_WIDTH_SET_80PLUS80_MHZ_IN_5G;
+				IEEE80211_HE_PHY_CAP0_CHANNEL_WIDTH_SET_40MHZ_80MHZ_IN_5G;
 
 		he_cap_elem->phy_cap_info[1] =
 			IEEE80211_HE_PHY_CAP1_LDPC_CODING_IN_PAYLOAD;
-- 
2.30.2


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
