Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 857A5CD98C5
	for <linux-mediatek@archiver.kernel.org>; Sat, 13 Jun 2026 22:52:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EoGi64+Gj9TgVIoAAJDW1KkqWIWQ9MNir22gN9jKS9w=; b=T2/m+ARllmc8wEfQxIOO9FjOUQ
	7cBu6i6HsYA8CIdM71Yd+onyhDY/wlvL4pufxYYQKsgWA+DpdyKX4f12avRkWJOUbjsgUQJ6PL2mB
	MXIOt1KRZadtKLHtdU5MxnnmFhXyVQMD9ZZ/5kUJf5WBwii6VldXFevUqtrYs7Kjl9uBIk9Jsha3c
	BAQ5+sr6SgTUEfSS23oodUnyee0Jmts2ndmafOmrr+a7gG5SUGziVfKmbUPZulJ62PUIZ91x97ngJ
	y48Zi6E6eUp5bnOqylIpj+1o30fTNgM0XFyUET06QmAUFgNIVjL4oB72cj7+FN/x0BiAt86K5vSft
	gQc2f4DA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wYXCv-0000000CafV-1h3p;
	Sat, 13 Jun 2026 22:52:05 +0000
Received: from mail-pj1-f47.google.com ([209.85.216.47])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wYXCt-0000000Caey-0LFT
	for linux-mediatek@lists.infradead.org;
	Sat, 13 Jun 2026 22:52:04 +0000
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-36b95eb4bb4so1329919a91.3
        for <linux-mediatek@lists.infradead.org>; Sat, 13 Jun 2026 15:52:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781391122; x=1781995922;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=EoGi64+Gj9TgVIoAAJDW1KkqWIWQ9MNir22gN9jKS9w=;
        b=OZ9Ph5QE2swIoBeK0/iHjUmrsWFAmAfYLj9nvKlajTpHPCbv8heznkMNLqoQjktq/O
         dELLiiXr5x7mWf545gjnbducbNnY9hYaoakNAhR7Hrby0QPKj42+FlIqKgcHUPZgnKlA
         Hdqx8e2sNOKuYE+6XdbavsIIht1E/l3NXOXme7UWxGsA4R24yfuKauc/QH7ZBasogWId
         xzA0llQ4GvYA9QWX0EzLaaBdaOXj2cWJV90q9LzxGuX9J3IM5HWDNZ/FQSOeb3nN8VwN
         DJN84LJDyBt7OuMIoj1Is3UDJXCgsfsyegADXe5nJZnnATTABsEE8akldGt6siUG1vWO
         8rrA==
X-Forwarded-Encrypted: i=1; AFNElJ96dG2DL6LFOHmy8MjxUWfYl78hMIkuagGZaTUoLHfJQT3L2T1Yj8K3JFklDnCy1jaEDiaa9NZm6B9l0XZ2TA==@lists.infradead.org
X-Gm-Message-State: AOJu0YxACdKfm6nPsBGAZzzj4ifmFIqPhFNruNING6dDb1UUEutoEd2K
	lqriFS3tDgR+0Agy1aP71JIoI68Z3owRKdp8EwV9g9t5yUq7pZ/tstGCw5vEPO/Z
X-Gm-Gg: Acq92OEuhy5hPt78X5ZuHsZ44Zoj9XXCZduqEJICW+tljnYI1EtdP6urJbvwbtE3l0/
	ZGKQbZlN/dSxb9KDjCiuLMNx0UlNTt9ZU7UV9J6oU4fmJXic5Ka3UcGv5Nf0dZ6HXwMZaKHWstY
	QnhYYbyzRy5L8CWUgJXn2YLFNL6BgcgQ4/Ft259rhiRJ7RVjfrS5YBKgEY4gX+dTwdF/yUUqV/2
	7zZ5kq+D7lw4SEwIxC+n80sFZT7pNqc1u+MocJe2W//4cobY8arjoPt99GTD8ugYA6gd3R2PpzE
	0Ej5Ex+khyNkOjNO9GN5veti1qWzRnEPt3rNWUM6GokR/R/Qh8/aTNXalhHyM9eFayMB5i62ijW
	FuOlCMpvMsa41G323MCD0JMQp4DMY5gUbJSBS/r/arvMQFpphHac+IZZC8ZFvNgkyDwiY1HAZSs
	tKVT7nzMBxGLTFScAnLBIe0AteUhJfWphSQSRNLwFbh33AehNRjigLqNZSZoDHQEfEZB2Z1mCXU
	/fU4H6R+ThcgCa1ONzMyyjhyppFJlINEKYe9BhwhKyGPTmNOks=
X-Received: by 2002:a17:90b:48cd:b0:369:7421:b376 with SMTP id 98e67ed59e1d1-37a03ad61c1mr8783542a91.19.1781391122554;
        Sat, 13 Jun 2026 15:52:02 -0700 (PDT)
Received: from sean-HP-EliteBook-830-G6.. (114-34-228-194.hinet-ip.hinet.net. [114.34.228.194])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-379c333c43asm4215770a91.0.2026.06.13.15.51.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 Jun 2026 15:52:00 -0700 (PDT)
From: Sean Wang <sean.wang@kernel.org>
To: Felix Fietkau <nbd@nbd.name>,
	Lorenzo Bianconi <lorenzo@kernel.org>
Cc: linux-wireless@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	Sean Wang <sean.wang@mediatek.com>
Subject: [PATCH 2/2] wifi: mt76: mt7927: use real monitor vifs for dual-band monitors
Date: Sat, 13 Jun 2026 17:51:44 -0500
Message-ID: <20260613225144.2414283-2-sean.wang@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260613225144.2414283-1-sean.wang@kernel.org>
References: <20260613225144.2414283-1-sean.wang@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260613_155203_128461_5486EFB3 
X-CRM114-Status: GOOD (  10.53  )
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

From: Sean Wang <sean.wang@mediatek.com>

MT7927 needs monitor interfaces to be passed to the driver as real vifs
so each monitor interface can be configured with its own band context.

This is required to support concurrent 2 GHz and 5 GHz monitor operation
on the same hw.

Keep the existing virtual monitor behavior for older chips.

Signed-off-by: Sean Wang <sean.wang@mediatek.com>
---
 drivers/net/wireless/mediatek/mt76/mt792x_core.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt792x_core.c b/drivers/net/wireless/mediatek/mt76/mt792x_core.c
index b50825eccdaf..16afc90b7422 100644
--- a/drivers/net/wireless/mediatek/mt76/mt792x_core.c
+++ b/drivers/net/wireless/mediatek/mt76/mt792x_core.c
@@ -724,7 +724,10 @@ int mt792x_init_wiphy(struct ieee80211_hw *hw)
 	ieee80211_hw_set(hw, HAS_RATE_CONTROL);
 	ieee80211_hw_set(hw, SUPPORTS_TX_ENCAP_OFFLOAD);
 	ieee80211_hw_set(hw, SUPPORTS_RX_DECAP_OFFLOAD);
-	ieee80211_hw_set(hw, WANT_MONITOR_VIF);
+	if (is_mt7927(&dev->mt76))
+		ieee80211_hw_set(hw, NO_VIRTUAL_MONITOR);
+	else
+		ieee80211_hw_set(hw, WANT_MONITOR_VIF);
 	ieee80211_hw_set(hw, SUPPORTS_PS);
 	ieee80211_hw_set(hw, SUPPORTS_DYNAMIC_PS);
 	ieee80211_hw_set(hw, SUPPORTS_VHT_EXT_NSS_BW);
-- 
2.43.0


