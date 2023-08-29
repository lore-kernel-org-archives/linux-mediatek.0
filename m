Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD4EFC83F12
	for <linux-mediatek@archiver.kernel.org>; Tue, 29 Aug 2023 09:44:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=+CFHTRDewVdnK8OrD5TrZ50kQYQ3rXzCo0CKBhJFbdU=; b=Rhb6lskDSNJ/uo9IRjR4243VGj
	Tu9UgwyuSPVuNWTvFsKDx2iKq82TlojEX++k2bPSxYr2H1jBHyWI40xnXiXU39WTB5J5g9Tg5siPM
	l3nHpc9SpcYPNaH3M9xcv+ZLnIEP+jylvY01QHN7rrwG7XzehOqV7uQEloLvUQIJb6jPxyt5N6vZ9
	QRwG6oP5yW89z9H1AsG7d7f9j9emA79oK1m6kJ16WycLQIYkPCcDZ+iAAez2imc6GpLrwwpz+UMkv
	zzjpBq5IHxcQDf/Ep1mdpWj2dhUSi6xOlIvWzoFluDiRSmQbOewQT0NINMvB3iiynmla3On68lf74
	z94/1NVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qavGu-00BAWG-1w;
	Tue, 29 Aug 2023 09:44:28 +0000
Received: from forward102c.mail.yandex.net ([2a02:6b8:c03:500:1:45:d181:d102])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qavGr-00BATg-2e
	for linux-mediatek@lists.infradead.org;
	Tue, 29 Aug 2023 09:44:27 +0000
Received: from mail-nwsmtp-smtp-production-main-29.myt.yp-c.yandex.net (mail-nwsmtp-smtp-production-main-29.myt.yp-c.yandex.net [IPv6:2a02:6b8:c12:2a2:0:640:b6bd:0])
	by forward102c.mail.yandex.net (Yandex) with ESMTP id 386596003A;
	Tue, 29 Aug 2023 12:44:19 +0300 (MSK)
Received: by mail-nwsmtp-smtp-production-main-29.myt.yp-c.yandex.net (smtp/Yandex) with ESMTPSA id HiMaKXADYqM0-H0VTu0gE;
	Tue, 29 Aug 2023 12:44:18 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex.ru; s=mail; t=1693302258;
	bh=+CFHTRDewVdnK8OrD5TrZ50kQYQ3rXzCo0CKBhJFbdU=;
	h=Message-ID:Date:Cc:Subject:To:From;
	b=PP/NbdlYmbCb8Gby8AoCKfBjnUg4CJGpxr/RsfFmppPkWEdIN+CSnvu45C6oygdzd
	 V4lT3TTUa1lLxKyWfG/nqvgtbej3yTNKC75dSZV8ZxcmRmLUaLK80qJfQUicbHFsJ9
	 BsnIMBaIYjJhPBwrSfJo7VDp6mJ7FW79Qpq5aujs=
Authentication-Results: mail-nwsmtp-smtp-production-main-29.myt.yp-c.yandex.net; dkim=pass header.i=@yandex.ru
From: Dmitry Antipov <dmantipov@yandex.ru>
To: Felix Fietkau <nbd@nbd.name>
Cc: Kalle Valo <kvalo@kernel.org>,
	linux-mediatek@lists.infradead.org,
	linux-wireless@vger.kernel.org,
	Dmitry Antipov <dmantipov@yandex.ru>
Subject: [PATCH] wifi: mt76: fix clang-specific fortify warnings
Date: Tue, 29 Aug 2023 12:43:49 +0300
Message-ID: <20230829094353.234713-1-dmantipov@yandex.ru>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230829_024426_034135_AF2BB72E 
X-CRM114-Status: GOOD (  12.91  )
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

When compiling with clang 16.0.6 and CONFIG_FORTIFY_SOURCE=y, I've
noticed the following (somewhat confusing due to absence of an actual
source code location):

In file included from drivers/net/wireless/mediatek/mt76/mt792x_core.c:4:
In file included from ./include/linux/module.h:13:
In file included from ./include/linux/stat.h:19:
In file included from ./include/linux/time.h:60:
In file included from ./include/linux/time32.h:13:
In file included from ./include/linux/timex.h:67:
In file included from ./arch/x86/include/asm/timex.h:5:
In file included from ./arch/x86/include/asm/processor.h:23:
In file included from ./arch/x86/include/asm/msr.h:11:
In file included from ./arch/x86/include/asm/cpumask.h:5:
In file included from ./include/linux/cpumask.h:12:
In file included from ./include/linux/bitmap.h:11:
In file included from ./include/linux/string.h:254:
./include/linux/fortify-string.h:592:4: warning: call to '__read_overflow2_field'
declared with 'warning' attribute: detected read beyond size of field (2nd
parameter); maybe use struct_group()? [-Wattribute-warning]
                        __read_overflow2_field(q_size_field, size);

In file included from drivers/net/wireless/mediatek/mt76/mt7915/main.c:4:
In file included from ./include/linux/etherdevice.h:20:
In file included from ./include/linux/if_ether.h:19:
In file included from ./include/linux/skbuff.h:15:
In file included from ./include/linux/time.h:60:
In file included from ./include/linux/time32.h:13:
In file included from ./include/linux/timex.h:67:
In file included from ./arch/x86/include/asm/timex.h:5:
In file included from ./arch/x86/include/asm/processor.h:23:
In file included from ./arch/x86/include/asm/msr.h:11:
In file included from ./arch/x86/include/asm/cpumask.h:5:
In file included from ./include/linux/cpumask.h:12:
In file included from ./include/linux/bitmap.h:11:
In file included from ./include/linux/string.h:254:
./include/linux/fortify-string.h:592:4: warning: call to '__read_overflow2_field'
declared with 'warning' attribute: detected read beyond size of field (2nd
parameter); maybe use struct_group()? [-Wattribute-warning]
                        __read_overflow2_field(q_size_field, size);

In file included from drivers/net/wireless/mediatek/mt76/mt7996/main.c:6:
In file included from drivers/net/wireless/mediatek/mt76/mt7996/mt7996.h:9:
In file included from ./include/linux/interrupt.h:8:
In file included from ./include/linux/cpumask.h:12:
In file included from ./include/linux/bitmap.h:11:
In file included from ./include/linux/string.h:254:
./include/linux/fortify-string.h:592:4: warning: call to '__read_overflow2_field'
declared with 'warning' attribute: detected read beyond size of field (2nd
parameter); maybe use struct_group()? [-Wattribute-warning]
                        __read_overflow2_field(q_size_field, size);

The compiler actually complains on 'mt7915_get_et_strings()',
'mt792x_get_et_strings()' and 'mt7996_get_et_strings()' due to the same
reason: fortification logic inteprets call to 'memcpy()' as an attempt
to copy the whole array from its first member and so issues an overread
warning. These warnings may be silenced by passing an address of the whole
array and not the first member to 'memcpy()'.

Signed-off-by: Dmitry Antipov <dmantipov@yandex.ru>
---
 drivers/net/wireless/mediatek/mt76/mt7915/main.c | 2 +-
 drivers/net/wireless/mediatek/mt76/mt792x_core.c | 2 +-
 drivers/net/wireless/mediatek/mt76/mt7996/main.c | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/main.c b/drivers/net/wireless/mediatek/mt76/mt7915/main.c
index 8ebbf186fab2..53348dd80c3b 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/main.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/main.c
@@ -1386,7 +1386,7 @@ void mt7915_get_et_strings(struct ieee80211_hw *hw,
 	if (sset != ETH_SS_STATS)
 		return;
 
-	memcpy(data, *mt7915_gstrings_stats, sizeof(mt7915_gstrings_stats));
+	memcpy(data, mt7915_gstrings_stats, sizeof(mt7915_gstrings_stats));
 	data += sizeof(mt7915_gstrings_stats);
 	page_pool_ethtool_stats_get_strings(data);
 }
diff --git a/drivers/net/wireless/mediatek/mt76/mt792x_core.c b/drivers/net/wireless/mediatek/mt76/mt792x_core.c
index 46be7f996c7e..81f316ddc111 100644
--- a/drivers/net/wireless/mediatek/mt76/mt792x_core.c
+++ b/drivers/net/wireless/mediatek/mt76/mt792x_core.c
@@ -358,7 +358,7 @@ void mt792x_get_et_strings(struct ieee80211_hw *hw, struct ieee80211_vif *vif,
 	if (sset != ETH_SS_STATS)
 		return;
 
-	memcpy(data, *mt792x_gstrings_stats, sizeof(mt792x_gstrings_stats));
+	memcpy(data, mt792x_gstrings_stats, sizeof(mt792x_gstrings_stats));
 
 	data += sizeof(mt792x_gstrings_stats);
 	page_pool_ethtool_stats_get_strings(data);
diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/main.c b/drivers/net/wireless/mediatek/mt76/mt7996/main.c
index c3a479dc3f53..2405ec1a663f 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7996/main.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7996/main.c
@@ -1192,7 +1192,7 @@ void mt7996_get_et_strings(struct ieee80211_hw *hw,
 			   u32 sset, u8 *data)
 {
 	if (sset == ETH_SS_STATS)
-		memcpy(data, *mt7996_gstrings_stats,
+		memcpy(data, mt7996_gstrings_stats,
 		       sizeof(mt7996_gstrings_stats));
 }
 
-- 
2.41.0


