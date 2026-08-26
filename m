Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03459C61DBD
	for <linux-mediatek@archiver.kernel.org>; Wed, 26 Aug 2026 04:37:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=RYhyGaWYmpci56QhJSuWVc944fdh64JWw/7VVEY/WQ0=; b=YYAuj8LBblkYWzsCcScOPfg8hG
	w7mz0wlHcfi5GK1VUyPH9/11Jg4UHbwSxm9IATxfcsc5dhHyxS+gJOJBpod4ij4MiFti+UDd/Jl2L
	RRpf4MJ9k1vTQztD7NgGmoWsBhtVGwq3roWgLCAQhSMOWcYdz9AfFxtrywOO6TGP6tPKUnVXlM+Y5
	srTdXC8VvCus+ZqlxV+PYZuYsK0HX3WT5YjhCFIIbXhhNRWYZVryNVkdOSFCGMfIehULT0qwmFxdG
	+OrYY0/TZg4Tl6BKjvf/EeWAxFiEWd21BDR3+u2u6GUy8rwg/Rk8bEMqz9669oDnRkPnwuV3hua+c
	XQk9w6Mw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wz5Ob-00000001tDi-2Nay;
	Wed, 26 Aug 2026 04:37:53 +0000
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wz5OX-00000001tCu-3TIM
	for linux-mediatek@lists.infradead.org;
	Wed, 26 Aug 2026 04:37:51 +0000
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id C1E203FC0D
	for <linux-mediatek@lists.infradead.org>; Wed, 26 Aug 2026 04:37:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20251003; t=1787719065;
	bh=RYhyGaWYmpci56QhJSuWVc944fdh64JWw/7VVEY/WQ0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version;
	b=JzV68nQWsfORF3qNKEvOtpwr1ABOvX3CK5TIaFGZCRvs23PHiIRDLq4fzzLcdNYQQ
	 E26yh+St3jbZlisIlB05T4FuLPZK/pmWzBRVp2+7mMXbOUrMwaTSYSQkH+sMfOEoE8
	 bs1+um86oXtgsH7nT9EGMA9IOskzKqRpdbKbMwPDqetgv0Mei4gIDuP2zgstiBAsIL
	 KHynBj5xcNlMT6Eu4b13OpYtDL4wvZtXqd7lNDC5ou21qaHyxXaDI0YPA/CakQlkHr
	 MjZhafSzfxDYj/YT2uIDR2mGn8NYjrWkB7VZqLauVJK2oRQQjS65JMEeLXVT0fVZg0
	 KmYUZ0Ho9yx4aqYIPdHxthehupdxvfPXlrl1QN2somPnqYLjk2kqPLDup99h2/dGzs
	 J7j2UYH9IGfaXvR7TDPLYCSAUe4OBMbUlhQqSjT/yfciuadSxTDOjG7kGF9iW7YY+u
	 Nnhpwb9whccraxcC4urUGI5rP1cIjKDfaWYnn6HIP9eP1naq9JsEZoS5UBDBaTDKp7
	 TVT13w3H9yZh+qp59Nsl4BGejWx5u7um8K/Wxr6hSYT0Ioo0dKGk2f/kFMitxIeenY
	 K2UTKoW6wuYX/d9z8bSLtTQSyqtrF9eQAE/y/qYXqrbin0pKhy8XViYe4UPkjLMTPH
	 d2R5al5HWA4ZdWsst8C0UP38=
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-38e2f61c09dso402410a91.2
        for <linux-mediatek@lists.infradead.org>; Tue, 25 Aug 2026 21:37:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787719064; x=1788323864;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RYhyGaWYmpci56QhJSuWVc944fdh64JWw/7VVEY/WQ0=;
        b=Yyc93Gvgqn1upBtmuXE7fnVH1QcGXYbysAqCTDNslRpxISEZH5RwsA7gHZHjiJTdLx
         74rRIPzSsmnUk9uDq7ohlTyY7Z7UIdV57+yUjw6alGZ5gUnlsI23qjTAnZeV12y+I7rN
         C6bHoWlkqVIPgnx/64oOPTh3VWS36xpNJQTUSRHp0sGTghhzehgByPRNxotQsE3+Dyco
         JnohQuCpH0GbdaXzviRFxUVMouTWDE23VGHq4pnomlYdom8nBLmFkOsyPlLDVzTDrIJR
         yzNEpOEz2tUk/a83k8Jy6+PGNRSlN7eFF6nmiGmvuGIJUQ5XuVR5mqhaZupiHkCEZpgO
         1sqQ==
X-Forwarded-Encrypted: i=1; AHgh+RrRec3AzfrnHCyNKG5xbJhbNln4ySOuhi7ajBxoInclLc6fc151eb7NTPH9sLGrQLcng0SSyGu2WmGtp9AdUQ==@lists.infradead.org
X-Gm-Message-State: AFuF++nzPK34tNGyw1rbg07Jo6og6biQR4Ngo5e1Xzv6wz8oePFBJC1u
	+L+BeN3VTDxT7X0n/NeecZbxSg5Sxn+rLPANFC+pzZ/Uwe8z3JokX4BZy8d2KhDRaQ650otUoFP
	vxzhtMh+/0fxJA5Zoi/Uorg4CnbHMUt57EWOwTfkQMaCGXhwg96FM2YbKX2i/LB9H701UKHlFMM
	TNqq7tXQDD6CH7vg==
X-Gm-Gg: AR+sD13+vxGhAj0004RxbP76O98YRE9/HEZcT8KWL8cFp78TkXRmzC90zMHBEtYC6l5
	XIiexDRzti2pLo1/dyEzZbK8jLQGi3Rt9jY0hpqOxDfdYfZEnuTXq0pjDPIrJtiP1tMoPx6BDaq
	8f92PkxHUDe/N0kGE0w3GrKwB+Hb2JMOv/ZbcdGVygQt6FxzmvcoK35YAeqgBapLI+UVQ6SvPDr
	aIl1epMAvxeCCU0P/pNLnyBuR2d4Y3G9O2me1Nj08HApeU1mNCUoBHGwrQ+fqf4+BBy8DZkL2nu
	PVQn0O3OFPYbvpavWbAmgWOPMDwxPwGDtNtQAq9UVjK/YpJYN7+Dw7Zj4BCuMJcjFslixKQ98C5
	+VeOSkmIce2VGtPlScnVYPX6fInn4T8SWVX3cVAK919qim1wBc0wwnWsumMMJZyHoruIayKucu4
	HLkircU5bSYupS3/iZ8TCZSmT4DOJsvYCBcn89vQ==
X-Received: by 2002:a17:90b:1fc3:b0:38e:9eb2:9d43 with SMTP id 98e67ed59e1d1-3966d5c1384mr8498997a91.16.1787719063979;
        Tue, 25 Aug 2026 21:37:43 -0700 (PDT)
X-Received: by 2002:a17:90b:1fc3:b0:38e:9eb2:9d43 with SMTP id 98e67ed59e1d1-3966d5c1384mr8498836a91.16.1787719063361;
        Tue, 25 Aug 2026 21:37:43 -0700 (PDT)
Received: from u-ThinkPad-X1-Extreme-Gen-4i ([103.155.100.7])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-396689fa52csm2423547a91.12.2026.08.25.21.37.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Aug 2026 21:37:42 -0700 (PDT)
From: Aaron Ma <aaron.ma@canonical.com>
To: Felix Fietkau <nbd@nbd.name>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Ryder Lee <ryder.lee@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Shayne Chen <shayne.chen@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Ming Yen Hsieh <mingyen.hsieh@mediatek.com>,
	Stefan Bader <stefan.bader@canonical.com>,
	Edoardo Canepa <edoardo.canepa@canonical.com>,
	Mehmet Basaran <mehmet.basaran@canonical.com>,
	ElXreno <elxreno@gmail.com>,
	Leon Yen <leon.yen@mediatek.com>,
	Jack Kao <jack.kao@mediatek.com>,
	Aaron Ma <aaron.ma@canonical.com>,
	Michael Lo <michael.lo@mediatek.com>,
	"Chia-Lin Kao (AceLan)" <acelan.kao@canonical.com>,
	Deren Wu <deren.wu@mediatek.com>,
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/Mediatek SoC support),
	linux-mediatek@lists.infradead.org (moderated list:ARM/Mediatek SoC support)
Subject: [PATCH] wifi: mt76: mt7925: restore the legacy BSS after MLO teardown
Date: Wed, 26 Aug 2026 12:36:58 +0800
Message-ID: <20260826043658.2255553-1-aaron.ma@canonical.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260825_213750_266811_091633CA 
X-CRM114-Status: GOOD (  13.37  )
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

Removing the last link of an MLD interface leaves the firmware with the
MLD BSS and DEV entry: the removal loop skips the deflink, and the
hweight16(mvif->valid_links) fallback reads the stale pre-update
valid_links, which is still non-zero. The entry keeps the per-link MAC
address, so every subsequent legacy association fails authentication
until the interface is removed or the module is reloaded.

Remove the deflink BSS and add it back as a legacy BSS on the transition
to zero links.

Fixes: 69acd6d910b0 ("wifi: mt76: mt7925: add mt7925_change_vif_links")
Signed-off-by: Aaron Ma <aaron.ma@canonical.com>
---
 drivers/net/wireless/mediatek/mt76/mt7925/main.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/main.c b/drivers/net/wireless/mediatek/mt76/mt7925/main.c
index e7e6d20848d27..bb93008d3d75e 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/main.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/main.c
@@ -2036,6 +2036,21 @@ mt7925_change_vif_links(struct ieee80211_hw *hw, struct ieee80211_vif *vif,
 
 	mvif->valid_links = new_links;
 
+	/* The firmware would keep the MLD BSS and DEV entry: the removal
+	 * loop skips the deflink and the hweight16() fallback above reads
+	 * the stale pre-update valid_links. Restore the legacy BSS.
+	 */
+	if (old_links && !new_links) {
+		mt792x_mac_link_bss_remove(dev, &mvif->bss_conf,
+					   &mvif->sta.deflink);
+		err = mt7925_mac_link_bss_add(dev, &vif->bss_conf,
+					      &mvif->sta.deflink);
+		if (err < 0) {
+			mt792x_mutex_release(dev);
+			return err;
+		}
+	}
+
 	mt792x_mutex_release(dev);
 
 	return 0;
-- 
2.53.0


