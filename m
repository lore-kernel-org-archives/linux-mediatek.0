Return-Path: <SRS0=8MsW=7V=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 564B8C433E1
	for <linux-mediatek@archiver.kernel.org>; Mon,  8 Jun 2020 23:08:46 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2501F20890
	for <linux-mediatek@archiver.kernel.org>; Mon,  8 Jun 2020 23:08:46 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="NYXLvPpU";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="LNcUfdbA"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2501F20890
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wB6VTMREnBkm7n/AhwDfqmKZifiyVh+AZEq4iumXUX8=; b=NYXLvPpUn+Bhyt
	iZFQ5N+S54Na6BizV46AkXYJaBHQUEfAYPyZxQdeOIHB7r5UzA05+bKXdAyHRinwTJHdbq0SfRvim
	QdQnDjbXflx0CY4TAexkwMAJPkfjl7Pp5m8Wz3/jnUlWHOA12iXcRYbuiN/cSsLU4Vve8TOZgW5Zu
	bRjsDkjvaNsSQE0mbERBCHjGOlqkzYQJ3STLk6VWWIOM9iDzVODx5lBeq90ER4v/UdZHhjEL6WxuE
	8mlk5VTjKks9C1WfLukhPj5XCQsPY1Gzagsmn12ER/jXJ1G39weB+0HaNwpq3BgWP380RaFc9TowM
	qif10+ns52CdgZcGBV3Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jiQsf-0008Q1-3o; Mon, 08 Jun 2020 23:08:37 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jiQrA-00071X-Qn; Mon, 08 Jun 2020 23:07:08 +0000
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id D4E9B20801;
 Mon,  8 Jun 2020 23:07:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1591657623;
 bh=T1TFFnuOR8yP9KXZ3SI9ba8JrUEjNEAKKapF2hBhyM8=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=LNcUfdbAu+qPxo9Ufa+tE7TZQCgGYeUaoDOC6FDj1G8PdoARt/a1ytmvIDfpcvOCT
 yrsnDjlQpErv7WeqJW2vz1u6XYXuE1HJtWiZuR8W9IeB0DY4hB/v0USCwEBMMXqKCO
 h0269BWE4U5SAhNsytWzTllwocfxoCTMijUsSzFQ=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.7 044/274] mt76: mt7615: fix aid configuration in
 mt7615_mcu_wtbl_generic_tlv
Date: Mon,  8 Jun 2020 19:02:17 -0400
Message-Id: <20200608230607.3361041-44-sashal@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200608230607.3361041-1-sashal@kernel.org>
References: <20200608230607.3361041-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200608_160704_888775_B9DA9AF7 
X-CRM114-Status: GOOD (  10.09  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: Sasha Levin <sashal@kernel.org>, netdev@vger.kernel.org,
 linux-wireless@vger.kernel.org, linux-mediatek@lists.infradead.org,
 Lorenzo Bianconi <lorenzo@kernel.org>, linux-arm-kernel@lists.infradead.org,
 Felix Fietkau <nbd@nbd.name>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Lorenzo Bianconi <lorenzo@kernel.org>

[ Upstream commit fdf433121f82766ff508a6f06665d2aca3e258d5 ]

If the vif is running in station mode the aid will be passed by mac80211
using bss_conf.aid. Fix aid configuration in mt7615_mcu_wtbl_generic_tlv

Fixes: 04b8e65922f6 ("mt76: add mac80211 driver for MT7615 PCIe-based chipsets")
Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
Signed-off-by: Felix Fietkau <nbd@nbd.name>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/net/wireless/mediatek/mt76/mt7615/mcu.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7615/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7615/mcu.c
index 610cfa918c7b..a19fb0cb7794 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7615/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7615/mcu.c
@@ -823,8 +823,11 @@ mt7615_mcu_wtbl_generic_tlv(struct sk_buff *skb, struct ieee80211_vif *vif,
 	generic = (struct wtbl_generic *)tlv;
 
 	if (sta) {
+		if (vif->type == NL80211_IFTYPE_STATION)
+			generic->partial_aid = cpu_to_le16(vif->bss_conf.aid);
+		else
+			generic->partial_aid = cpu_to_le16(sta->aid);
 		memcpy(generic->peer_addr, sta->addr, ETH_ALEN);
-		generic->partial_aid = cpu_to_le16(sta->aid);
 		generic->muar_idx = mvif->omac_idx;
 		generic->qos = sta->wme;
 	} else {
-- 
2.25.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
