Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD9C9CD342F
	for <linux-mediatek@archiver.kernel.org>; Wed,  6 May 2026 01:40:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EU+q7eWhkGer8GyP69DC5ptsWUViocS21pDQ3GPfREM=; b=nmdgsP/oyOQwwQcaWkwwZV3zgM
	lADEHT0NuAmMzhTsEJvcqPvNA30P65mL+5rexD+sK0AYZVpJFkvxJp7Y0RUcza3YarYYYaeKToaiw
	hvdrHGHSS3P2EdvVBTcmIFNpf9SZ+FlTZZDEhso6eAt72s/X1WveH56ttsBCWv64fP4D43Ma1JhJu
	hUMa575WawJjCiRbyWBUnOsVm4luGFoL7negSjMKTgZrU6PKSq6u0J9SLF81LXmxhmsW9Xj3fjpyw
	Zs+RvufL2SsUIIp+fGrtZdgDX7u+CeB0hwjjbYDUJlv8ro/YTLvHi/DsQBpk4NrGPp1FMs5YSD1iB
	e+/uz4hA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKRFA-00000000Qkg-3ZDF;
	Wed, 06 May 2026 01:40:08 +0000
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKRF4-00000000QdX-3sjF
	for linux-mediatek@lists.infradead.org;
	Wed, 06 May 2026 01:40:04 +0000
Received: by mail-ed1-x52c.google.com with SMTP id 4fb4d7f45d1cf-67b7c71c165so7265151a12.0
        for <linux-mediatek@lists.infradead.org>; Tue, 05 May 2026 18:40:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778031601; x=1778636401; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EU+q7eWhkGer8GyP69DC5ptsWUViocS21pDQ3GPfREM=;
        b=rVO4RBkFWYYEihdt65R7W57M5KDTagm1l+CzYHMZ4TRyN+MtlBTRwgS8jrt7F1cFnI
         TLURokl2h0pFPyvvmWwKQ8W59UK//+hCQOaBvh3/djFFA91i715tGEnqRc3Ajtd16wAg
         TpEJvIOzREio8XKaQ+kAV6N2tirfHQN7FFRA83Zu+MgyKQF6sTXJ9XVuldqYIS+915Xy
         Bz2fmdvEPRGCJRCkmcJIP2CFm1v4iPb1faLvVZTfRGbOdPV8AHti7gRz/LXxK2pE6Ekl
         cwq+k0cUnxF1suxkyyjOXvfrZbR+zO1uInN41g0Izxe6IPPXBSdSbzXK1A+EletjN3Cx
         v6bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778031601; x=1778636401;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=EU+q7eWhkGer8GyP69DC5ptsWUViocS21pDQ3GPfREM=;
        b=H/03XY5iEJCRQKMoxS83qm2HmYMcGgKEBP26OTlB4/3uXiUGwogosXANuRTcf3e1jU
         R3HRJGN1blIV7DEeIyVYLb8uOFe+yDlJnnFHBgwBF97mZfKaU6MIFUlKPNhI0RCVTLxi
         CIDpvW+MZ1+KNTlexDQKW0bXB7FRYd5ClOS9WUt54Vm+6gAKjGSRX6gOrdhSHXumwavj
         kg1xv8ysnJPHW3ZRpZvaggS/u01jby2L9GD2ZdE1mjPH0Ulzpbt69gAbpzz1lwlqc3M1
         hiedE7e2jrZlzTQs0FN5RKo3ipW5Cq3V6a8RtzhLTMmZnZG/0VP/gSusLJ3lnzznRKc5
         nULQ==
X-Forwarded-Encrypted: i=1; AFNElJ8ZCmubHRFlbjotCaqwk05GGYYxVzH+oO3O4gnalFIS8nINy2OOlF6uAfLTY/hP/bssEbQ4JbK5vRQ6+TY3kw==@lists.infradead.org
X-Gm-Message-State: AOJu0YzDKOp/pRVZYh1SmFeloL+6/mogwqGKRJ0x0uC+KdTKIIgsanwj
	imciHYNtxfYBXIiUTBkmYlxcwKBdf2FC3OUvNIFQZR1CbC8lbgKtxOEF
X-Gm-Gg: AeBDiev2IdgZeGIaVtZ6Z+5n7HwfJ0D/yrEoK2MKOvy/atr3Vofv1Z0M4pF1y0vYKyl
	+WKTWVzay17jpFGPIkdlHONgcnBM5YMSSDg5xYfJt6y85bmBwcfR37pXfMGNWCDU1eFfYnAnqCX
	q1KctAK2Z2mWkOU11Sy0mYSt/edtX5NgnMFNlQaBsjWwGpSoAGoihytA0NoWdYoWndNYlEoVkGB
	p6Hw4IoMKCDiFfMTW8j6rGnc94JAupDKN21ZV1hBj7ApVhaFoGLwyBANoE/ZNvds+WjUnadlU2g
	NuznB64LTiHYoPMrAA89CtYD4aj4piZqoMFf9N4Qynx0K3l+7HUasJe/tQpcPDyEaf/cfQSu+++
	jeJbKmnnPZhGWqoLopNfb/BuJbLHJGiyGlG9QI/X3WiUEds/GQ2Js+Lvlqs6IsXlPyl6XFGYPSW
	bbyPJmtIgvaaf+WtGn6agvAx5YltkN2gcN09X4OxjvA4TNofGyf5AycojWVmVcLbBgsz/+7lU2o
	LhqbPJTjuRBr0S96JayE+rvO/HZlsmAivu/Y/Oe6Hx9
X-Received: by 2002:aa7:da97:0:b0:67b:790e:bf12 with SMTP id 4fb4d7f45d1cf-67d642c098cmr294960a12.12.1778031600972;
        Tue, 05 May 2026 18:40:00 -0700 (PDT)
Received: from KURWA.angora-ide.ts.net (mm-195-107-126-178.vitebsk.dynamic.pppoe.byfly.by. [178.126.107.195])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-67cd904fe68sm849388a12.0.2026.05.05.18.39.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 May 2026 18:40:00 -0700 (PDT)
From: ElXreno <elxreno@gmail.com>
Date: Wed, 06 May 2026 04:39:16 +0300
Subject: [PATCH v2 2/2] wifi: mt76: mt7925: don't disable AP BSS when
 removing TDLS peer
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260506-mt7925-tdls-fixes-v2-2-46aa826ba8bb@gmail.com>
References: <20260506-mt7925-tdls-fixes-v2-0-46aa826ba8bb@gmail.com>
In-Reply-To: <20260506-mt7925-tdls-fixes-v2-0-46aa826ba8bb@gmail.com>
To: Felix Fietkau <nbd@nbd.name>, Lorenzo Bianconi <lorenzo@kernel.org>, 
 Ryder Lee <ryder.lee@mediatek.com>, Shayne Chen <shayne.chen@mediatek.com>, 
 Sean Wang <sean.wang@mediatek.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Ming Yen Hsieh <mingyen.hsieh@mediatek.com>, 
 Deren Wu <deren.wu@mediatek.com>
Cc: linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 ElXreno <elxreno@gmail.com>, stable@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2827; i=elxreno@gmail.com;
 h=from:subject:message-id; bh=Gr7EWkvsipUpzm6yGXOHgRC0cyi+bO2nl/KB1dA/mFg=;
 b=owJ4nJvAy8zAJXa0WDmKX5v/EeNptSSGzF+z37i4btCS8Hxb1Jjfq5GaszDbxFTh898l1w1sQ
 pn37H/EGNpRysIgxsUgK6bIwnNub23Osrolk+u5MmDmsDKBDGHg4hSAiewpZvhneTPCnv9UuPQc
 l8k1B5Juay1R3BVzXovxruVS1ZBrrMkhjAznmaYfWXBieixbQsqpA1N445dZTxbw/yXbrpVXMDH
 K1IQbAIBdQ48=
X-Developer-Key: i=elxreno@gmail.com; a=openpgp;
 fpr=0CCEBD7D6CA67EA4937F0A68C573235A0F2B0FE2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260505_184003_027595_CADC83F8 
X-CRM114-Status: GOOD (  12.68  )
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

On a STATION vif, removing a TDLS peer takes the mt7925_mac_sta_remove
-> mt7925_mac_sta_remove_links path. The first loop in that function
calls mt7925_mcu_add_bss_info(..., enable=false) for every link of the
station being removed. For a non-MLO STATION vif there is exactly one
link, link 0, whose bss_conf is the AP's. TDLS peers do not have their
own bss_conf - they share the AP's BSS.

The result is that every TDLS peer teardown sends a BSS_INFO_UPDATE
with enable=0 for the AP's BSS to the firmware, which wipes the AP-side
rate-control context. The connection stays associated and TX from the
host still works at the negotiated rate, but the AP's downlink to us
collapses to the lowest mandatory OFDM rate (HE-MCS 0 / 6 Mbit/s OFDM)
and only slowly recovers as rate adaptation re-learns under sustained
traffic. With brief or bursty traffic the link can stay at 6-72 Mbit/s
indefinitely, requiring a manual reconnect.

mt7925_mac_link_sta_remove() already guards its own
mt7925_mcu_add_bss_info(..., false) call with
"vif->type == NL80211_IFTYPE_STATION && !link_sta->sta->tdls".
Add the equivalent guard at the top of the cleanup loop in
mt7925_mac_sta_remove_links(), above the link_sta / link_conf /
mlink / mconf lookups, so TDLS peer teardown skips the loop body
entirely without doing the per-link work that would just be thrown
away.

Verified on mt7925e by triggering Samsung-S938B auto-TDLS via iperf3
and watching iw rx bitrate after teardown:

  Before: rx bitrate collapses to 6.0-72.0 Mbit/s, oscillates 17/72/
          137/288/432 Mbit/s for 30+ seconds, no full recovery without
          a manual reassoc.
  After:  rx bitrate stays at 1200.9 Mbit/s HE-MCS 11 NSS 2 80 MHz
          across the entire TDLS lifecycle.

bpftrace confirms a single mt7925_mcu_add_bss_info(enable=0) call per
teardown before the fix; zero such calls after.

Fixes: 3878b4333602 ("wifi: mt76: mt7925: update mt7925_mac_link_sta_[add, assoc, remove] for MLO")
Cc: stable@vger.kernel.org
Signed-off-by: ElXreno <elxreno@gmail.com>
Assisted-by: Claude:claude-opus-4-7 bpftrace
---
 drivers/net/wireless/mediatek/mt76/mt7925/main.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/main.c b/drivers/net/wireless/mediatek/mt76/mt7925/main.c
index 61330e3c18b2..041d06143ef1 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/main.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/main.c
@@ -1268,6 +1268,9 @@ mt7925_mac_sta_remove_links(struct mt792x_dev *dev, struct ieee80211_vif *vif,
 		if (vif->type == NL80211_IFTYPE_AP)
 			break;
 
+		if (vif->type == NL80211_IFTYPE_STATION && sta->tdls)
+			continue;
+
 		link_sta = mt792x_sta_to_link_sta(vif, sta, link_id);
 		if (!link_sta)
 			continue;

-- 
2.53.0


