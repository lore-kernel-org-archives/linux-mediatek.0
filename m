Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA3FE105F79B
	for <linux-mediatek@archiver.kernel.org>; Fri, 13 Mar 2026 11:25:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=GyRvJlRhY8jPRhKnZ9bp3+S6rw2AeCh8tRAok2f8lWo=; b=M1I8UkDLs/PaXbbe64rREATJg+
	QdhoaRPtuzxDwylF/Q4y0Q8FdOz7OngPVBBWAKwa0yC485y18JNN/7bVsR8lideDlSrxcSz7YQFiw
	MfpWeEFvMyVHlN7M2/QWnayO+h26qYylijp1KuDmfQUUtH6gwzTzhNg4dmSivc7LT+0qiGYAxCHk4
	05SfhLAGgQ4gs4kNPVy1H2Fk7y0EUZ9mo8hAlcBFRxHCz9WBl3tzsOAl5h9vOKCKfqu8f9a5tOTsM
	HfNlXFxANKABjvSTLWmCQan5Hj5HnlFKwVt+ujaXFu9S2/QV7DdAHeOSM91iGfqmEDWBy4kin+xMT
	Wj7tBR7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w10e0-000000001QS-2eXn;
	Fri, 13 Mar 2026 11:25:28 +0000
Received: from mailgate02.uberspace.is ([185.26.156.114])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w10dw-000000001PC-1Mq5
	for linux-mediatek@lists.infradead.org;
	Fri, 13 Mar 2026 11:25:26 +0000
Received: from perseus.uberspace.de (perseus.uberspace.de [95.143.172.134])
	by mailgate02.uberspace.is (Postfix) with ESMTPS id 0D07E17FA2B
	for <linux-mediatek@lists.infradead.org>; Fri, 13 Mar 2026 12:25:15 +0100 (CET)
Received: (qmail 12959 invoked by uid 988); 13 Mar 2026 11:25:14 -0000
Authentication-Results: perseus.uberspace.de;
	auth=pass (plain)
Received: from unknown (HELO unkown) (::1)
	by perseus.uberspace.de (Haraka/3.1.1) with ESMTPSA; Fri, 13 Mar 2026 12:25:14 +0100
From: David Bauer <mail@david-bauer.net>
To: Felix Fietkau <nbd@nbd.name>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Ryder Lee <ryder.lee@mediatek.com>,
	Shayne Chen <shayne.chen@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH mt76] wifi: mt76: mt7915: set mt76 specific PS flag
Date: Fri, 13 Mar 2026 12:25:00 +0100
Message-ID: <20260313112502.2026974-1-mail@david-bauer.net>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Bar: /
X-Rspamd-Report: SUSPICIOUS_RECIPS(1.5) BAYES_HAM(-2.999991) MID_CONTAINS_FROM(1) MIME_GOOD(-0.1) R_MISSING_CHARSET(0.5)
X-Rspamd-Score: -0.099991
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=david-bauer.net; s=uberspace;
	h=from:to:cc:subject:date;
	bh=zV7neuLkSOIlzYViwAfwLRYPEUuyu/AOjQWX/yJqh5c=;
	b=p4GdMm6OX8p1shu1IHk2C2EUFa/IUErWxQ39poHEQ6qhB1JV89F/6YstW2qr41yXeR7tO76Z1n
	QbrVXYQLeP+ViXsEQAe5xdidL81a4BSDQC7u2HQNGxG1SOpObTXwHbb9vRh9oy7sR7YL8trnTZTt
	Yf/WvESlH6FdUDAno6aeYfzLqq5L+EyWwHMk0j2wpSyFGTaoVXklM9ImPpp2waAmG9AvBLloCeVk
	2hmQi3VqU3RJHujs+mX7/hGnt3JmrXs4V0bf5T432QhXd2uz3UHgF6tH9tuaFaMYFd+BMRwJ1GAU
	fl9f7yveIsotOybZL6E3CbnGXPGVHTp8EpH2J9KE29w4xKlIS/A+yyJLCkigdN0qdOehV2N80EiT
	FAsfU2jkqP8wsqB3+cUcWpUfIBm6uyu5TV81Fj3YTyBMijj7zCTlFtt/Zlza3hwCQRxu242OxV1+
	g0UhYj5euxqqe6QpuHyBvsz9v6ea9tsK6F4UTEXwORvLXwQj/eul3C822xHO1ecqEbGQ1ohK6z1P
	Ajeq4A5rAZGvwSgco66kcVWf5b4uB/e97basxzAPo7Uz66arXjxfu+LObAZ7YOFncSyIibiWKo0x
	uaPZZ3ZSbgxEc2zc0peNTwlj3csPIONcN4IC2hdjeqVL9SJmx6CQB0yuaCch3aszEwzQaU14gSKD
	w=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260313_042524_691898_A89E62FB 
X-CRM114-Status: UNSURE (   8.69  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

mt76 tracks the PSM state of a sta internally with a wcid flag. TX to
such clients is skipped based on the presence of this flag.

This flag was not added to the PS state notify handler for MT7915 chips.
Without this flag, mt76 queues pending frames to the hardware,
accounting for airtime when a PSM notification is received while in a TX
iteration.

Set the PS flag for the STA WCID to prevent this from happening. TX gets
skipped in presence of this flag.

Signed-off-by: David Bauer <mail@david-bauer.net>
---
 drivers/net/wireless/mediatek/mt76/mt7915/mcu.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c
index 51a52ed072eb4..0598bea29e498 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c
@@ -421,6 +421,11 @@ static void mt7915_mcu_rx_ps_sync(struct mt7915_dev *dev, struct sk_buff *skb)
 	if (!sta)
 		goto out;
 
+	if (p->ps_bit)
+		set_bit(MT_WCID_FLAG_PS, &wcid->flags);
+	else
+		clear_bit(MT_WCID_FLAG_PS, &wcid->flags);
+
 	ieee80211_sta_ps_transition_ni(sta, !!p->ps_bit);
 
 out:
-- 
2.51.0


