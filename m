Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADAEAD47CAF
	for <linux-mediatek@archiver.kernel.org>; Fri, 16 Jan 2026 01:05:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7ZFGFJGnMesEgV/ggwEQUIQPbrKFKaXQBFGLJsUOfUw=; b=4SGETxY1rLng52edp8ufaVKk5S
	/ZEKKs8bDrG8tt+BDyLHMU46nWBTdIyIyNQdNcH4EHyi4/BpEE0mv3vnCHs3all7xccqJSbzirym0
	VijZvt77cPdEBHCoz7SLhSKNpZfr3kQ+Gl7W7EPvzNLYvO31TSgqjSLxjWoNDJDNrWhVRdVvCZW4o
	BtiWwWWRabIZP2JooH7VzRgbbI5Jg88Bj/LuD4RMIJWX0LmcK8lWg4l8nixEsDxnmu6wxaJtmgw6X
	gy26EXyyvl3IUYVZXgBxYCjMfaYukNpS3+9PN1t+1I9oePlTnTOcne1UCLgW9/tP6cjesZQETLOyJ
	SrcKcI5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgYHe-0000000DOeT-2x9m;
	Fri, 16 Jan 2026 01:05:50 +0000
Received: from mail-dy1-x1342.google.com ([2607:f8b0:4864:20::1342])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgYHU-0000000DOUp-2R2b
	for linux-mediatek@lists.infradead.org;
	Fri, 16 Jan 2026 01:05:41 +0000
Received: by mail-dy1-x1342.google.com with SMTP id 5a478bee46e88-2b6ae4c2012so847361eec.0
        for <linux-mediatek@lists.infradead.org>; Thu, 15 Jan 2026 17:05:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768525540; x=1769130340; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7ZFGFJGnMesEgV/ggwEQUIQPbrKFKaXQBFGLJsUOfUw=;
        b=gX92e4V3J2tInPZzb7kvvvulHNmaiUD9hE5mV8y0AMnCbt+VeS+buZiFNp8AKeoYf8
         8oEtk2Xa8hwszxnDxNYTh0n4tc0Q5jUjqD01ep5FR/3HJ0nLJwaFYxrghtaBQ33u8CeB
         ustkQHDioEaMrRTXs7OMU0I2oB8dKMQ0eDtN9pzWoeaTxPdsJ3r+BT6uZe857sPMbqCo
         GE+d0kBECqdLThHyVwokLwWXSK/2ZwFxvmbKRV8OFTM1rjdwcl4RyXMpV/l5D9dKB2E6
         //7bSFwQ2kKpfi5x8dPkgv0qUU534Fh8TGEfuVpuv4reIR3IQXUViXtoLUSgMMIwSNfz
         3BYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768525540; x=1769130340;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7ZFGFJGnMesEgV/ggwEQUIQPbrKFKaXQBFGLJsUOfUw=;
        b=jWCMqei5xgEJUE26CYv0DaeEJIO+JnDMkh0UliIaF0ojhuQFjItMbqrFLQZTa2X4Gq
         DxRh/1uMhUDQDPBaBXlGzeHQhTfbdnTrAkFaAtubybv9SDxbkzcU3rFZU0nlLQGxlk4q
         gRILGGK7qZi6qC7j7KxHQSww5vMZQHzWwRKZyzpQWolxMn7EfgR056VBgNAFxYu6oW/7
         fwgyb7+ImYfqQTDZ9GwF5mJZAU1/BpXmms2SrhPkA4VHUqj4mDhgjSwSYMIfbfpT2a74
         F0+4wtFQg6gai8ur71XQGRumfLiTcwfN2mI41M/ifWS/V5zwiZxSR7qK7BTq9Pb0cRjn
         HA+g==
X-Forwarded-Encrypted: i=1; AJvYcCX8G4Ey7cw9YSsb2p/11VYBl5UhhWhgZuvP+ESLFuHo2xvoi1Ax6ra92H30FuvfZDBEzlo30y0WS/oVVmE7vg==@lists.infradead.org
X-Gm-Message-State: AOJu0YzpSVHvltXjSuzuJNEgH2e6Gs/o0oekgSkvnHqlig2KFSMHcX8D
	eP9tfZFXahdIFDp2Qmyy+8MDxJ8IeV2VwLvLx6GlUXnveDKc0geV5LAH
X-Gm-Gg: AY/fxX7E4wraMrkt2JwHbHAIQ7Bab0DflEUBWH8du3mVKZWZ4e+oQYBhL2nNnkTFcaq
	L12IA5UvctoFi66RNyV+MMdIxmKgez+aKmj0JBY9qBZAVfWP8GTkLWmKvEpmwyObua/yh50+VNw
	mVIxZzIbPmFTF+CMqP3THlpbUG4DjKJSmNXtqrn6NQqP6JJ1OyTLVbJFLk0ifePBQOnQxxosyf4
	UzYn/uEZz+5ZSMU7jPKEmbSIT/m9hiyVVp8fv/PpJqsoXhGZuHIL0nZ09PjOrOLdZV71mV812CC
	4y/oZalU18ZW6W83gUgKnWz+qmkhOUD/zdHTKAU9bsdxDln+xhhIKe2uDWeiabCHQRGQ7txyrnC
	3jVmOCf/N+/+gMpFVq+GOqt+2TER31DyYwA4hWLekW+XNbWH5ZMlo35OtfSECzaJZU7lDM59QTt
	csX75jws1pJsjJRHTxPE+F+RlzBI76dq/BcCqrbvBu3L+G0lS0qe3hgvnSOnSw6Q==
X-Received: by 2002:a05:7300:cc0a:b0:2b0:56fd:4b67 with SMTP id 5a478bee46e88-2b6b3f074e7mr1271641eec.12.1768525539493;
        Thu, 15 Jan 2026 17:05:39 -0800 (PST)
Received: from zcache.home.zacbowling.com ([2001:5a8:60d:bc9:f1d2:502c:a6ff:5556])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b6b367cbc9sm1019884eec.32.2026.01.15.17.05.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Jan 2026 17:05:38 -0800 (PST)
From: Zac <zac@zacbowling.com>
To: sean.wang@kernel.org
Cc: deren.wu@mediatek.com,
	kvalo@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-wireless@vger.kernel.org,
	lorenzo@kernel.org,
	nbd@nbd.name,
	linux@frame.work,
	ryder.lee@mediatek.com,
	sean.wang@mediatek.com,
	Zac Bowling <zbowling@gmail.com>,
	Zac Bowling <zac@zacbowling.com>
Subject: [PATCH v4 11/21] wifi: mt76: mt7925: add lockdep assertions for mutex verification
Date: Thu, 15 Jan 2026 17:05:09 -0800
Message-ID: <20260116010519.37001-12-zac@zacbowling.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260116010519.37001-1-zac@zacbowling.com>
References: <CAGp9LzpuyXRDa=TxqY+Xd5ZhDVvNayWbpMGDD1T0g7apkn7P0A@mail.gmail.com>
 <20260116010519.37001-1-zac@zacbowling.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260115_170540_619602_41C926E8 
X-CRM114-Status: UNSURE (   9.50  )
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

From: Zac Bowling <zbowling@gmail.com>

Add lockdep_assert_held() calls to critical MCU functions to help catch
mutex violations during development and debugging. This follows the
pattern used in other mt76 drivers (mt7996, mt7915, mt7615).

Functions with new assertions:
- mt7925_mcu_add_bss_info(): Core BSS configuration MCU command
- mt7925_mcu_sta_update(): Station record update MCU command
- mt7925_mcu_uni_bss_ps(): Power save state MCU command

These functions modify firmware state and must be called with the
device mutex held to prevent race conditions. The lockdep assertions
will trigger warnings at runtime if code paths exist that call these
functions without proper mutex protection.

This aids in detecting the class of bugs fixed by patches in this series.

Signed-off-by: Zac Bowling <zac@zacbowling.com>
---
 drivers/net/wireless/mediatek/mt76/mt7925/mcu.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
index d61a7fbda7..958ff9da9f 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
@@ -1527,6 +1527,8 @@ int mt7925_mcu_uni_bss_ps(struct mt792x_dev *dev,
 		},
 	};
 
+	lockdep_assert_held(&dev->mt76.mutex);
+
 	if (link_conf->vif->type != NL80211_IFTYPE_STATION)
 		return -EOPNOTSUPP;
 
@@ -2037,6 +2039,8 @@ int mt7925_mcu_sta_update(struct mt792x_dev *dev,
 	struct mt792x_sta *msta;
 	struct mt792x_link_sta *mlink;
 
+	lockdep_assert_held(&dev->mt76.mutex);
+
 	if (link_sta) {
 		msta = (struct mt792x_sta *)link_sta->sta->drv_priv;
 		mlink = mt792x_sta_to_link(msta, link_sta->link_id);
@@ -2843,6 +2847,8 @@ int mt7925_mcu_add_bss_info(struct mt792x_phy *phy,
 	struct mt792x_link_sta *mlink_bc;
 	struct sk_buff *skb;
 
+	lockdep_assert_held(&dev->mt76.mutex);
+
 	skb = __mt7925_mcu_alloc_bss_req(&dev->mt76, &mconf->mt76,
 					 MT7925_BSS_UPDATE_MAX_SIZE);
 	if (IS_ERR(skb))
-- 
2.52.0


