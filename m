Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA391EFCE53
	for <linux-mediatek@archiver.kernel.org>; Wed,  4 Mar 2026 23:50:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=DENFRZ7KWOZocO3IIbqB68mf1LkYaLSXQWPItVkVVdk=; b=jcATkBuaVFT+r32F8EXJiqaJXi
	UY+47d25DGqKRyW6MHMdMH/41Ur3GsP0LXkRTiCsSjKExoHwSusE5qNhKsiNaAqKoYDSPIIU0wJxG
	ZdOO+CQoW5TkkdAaF4o8ak9C1DprjTtFGih8Mk9ocAGz/BFLZEpJx/n0EpcN4MMrIUH71U8DhYwTD
	zcb2SyvUUgWCg8sigffwqaTssh49By5hNc23/V/v+0qRQGiA22LAoxKk5SjoJ9wvju+iVvC9zGQ6s
	JoCbtzHUXwk0ZzlMtE89FbEGpPm/1ZS91z9q8HBQ/QFnpl9z9TAt5mlclCY6Qj8TVaPW4WehsI5xr
	gjmFzfMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxvzJ-00000000eAc-2sSA;
	Wed, 04 Mar 2026 23:50:45 +0000
Received: from mail-oo1-f51.google.com ([209.85.161.51])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxvzD-00000000eAF-1lOA
	for linux-mediatek@lists.infradead.org;
	Wed, 04 Mar 2026 23:50:44 +0000
Received: by mail-oo1-f51.google.com with SMTP id 006d021491bc7-679f980a239so3496944eaf.2
        for <linux-mediatek@lists.infradead.org>; Wed, 04 Mar 2026 15:50:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772668238; x=1773273038;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DENFRZ7KWOZocO3IIbqB68mf1LkYaLSXQWPItVkVVdk=;
        b=DqXd3TacVmWh72UMzuJNc6JBJcrYlKZ6ZIvG+zbLwu85/2Dn1CtfNgm9uJm9f81pkQ
         50Rlk9oXPCx2Nx/NEduKk3R0W2mJyehfOmsu8plPBzQmYIpZ8UKbeMIMVdf3pYQ+xAPy
         57Az/JTvJNKhBmM2+euffAVod74ZbSj/uK/whs8a212r2KsLJjevHabd1YDoewkJSOo0
         XIIndlyTBTGghZDfB3mNpZ04gcb5mValcr9l3niqoTkTUPBzm59woSgAfdSrbBEX920e
         1NKHhBK4hBHYs0EurevS/l0Q7YDxu9h7Ol6gtW79mGwm29Lwp1DahaiGL8Al0PrJuBEg
         Dupw==
X-Forwarded-Encrypted: i=1; AJvYcCVVVGjg35BOoLI3JilLsjbF6vqd74t9SWLqrq4hqr/V95aFPTKXIiNxvbBDb9OG/70r7UZGqMS8yXZLj54U9w==@lists.infradead.org
X-Gm-Message-State: AOJu0Yy7uOUL5cEHSnUbYZiGAvDd5RqUALPfQlMZEi64mAUEP45RWjWy
	GR/9s5U6pACt16ZKP1v2+xPOD9LRJG4fjWcUY6RBLIGYvywtExxs3Ak7
X-Gm-Gg: ATEYQzwTae2r8zrDJywN17E0DitYVcZs9WPGyX1ujPoI92fFNo7PbOYtsULG41upfmu
	L3X2ZSfkf0+buTgU7T6WQS3epVRAykNQ2COSflMqKXMns6nd4SuSDuXXSQ5N8AXQHaH2lQs4gGg
	X2a8sj9oMGEHNcFrwQ2IF1P44//N18sxIT0nGTftQ1/CdLcoGKzGTU+YeLiUeg7CdTnAARk6jfm
	XMKxfJ3hDBvDjeRnttyN43lpjqdEa72dtpxWG1H91aeZ6waV0PRNbsyLjuWystCefPbnHmS1yZf
	H4z9cGy/7Bsc5h3Rqvxfd25ZHLPlN6DOdWCw5K7dNEA0QMTqn6L9vjifLdhsE8VLijm0dhtOBzJ
	qVHHGVjhQagx1qDNcaKyV6+K9utYNss47BcVeI1tbiFfmWQUyVAY1sL6ArhV6yIkidDlKK1wjcI
	7quRyy+DBQ9cRm63fHJF/6ZJWOG+9CIysO2TcxCf+3BCbe8lU=
X-Received: by 2002:a05:6820:4ccb:b0:678:cf78:1ea5 with SMTP id 006d021491bc7-67b1e90212amr2283431eaf.67.1772668237927;
        Wed, 04 Mar 2026 15:50:37 -0800 (PST)
Received: from sean-HP-EliteBook-830-G6.lan ([207.191.35.252])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-679f2bfee3csm14410687eaf.7.2026.03.04.15.50.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Mar 2026 15:50:36 -0800 (PST)
From: Sean Wang <sean.wang@kernel.org>
To: nbd@nbd.name,
	lorenzo.bianconi@redhat.com
Cc: linux-wireless@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	yu-ching.liu@mediatek.com,
	yuchi.wang@mediatek.com,
	jenhao.yang@mediatek.com,
	posh.sun@mediatek.com,
	Sean Wang <sean.wang@mediatek.com>
Subject: [PATCH 1/7] wifi: mt76: mt792x: advertise multicast management frame registration support
Date: Wed,  4 Mar 2026 17:50:14 -0600
Message-ID: <20260304235020.40451-1-sean.wang@kernel.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260304_155039_460879_560BCABA 
X-CRM114-Status: UNSURE (   7.41  )
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

From: Sean Wang <sean.wang@mediatek.com>

Advertise NL80211_EXT_FEATURE_MULTICAST_REGISTRATIONS so userspace can
register to receive multicast management/action frames.

This capability is required for NAN discovery and related operations.

Co-developed-by: Stella Liu <yu-ching.liu@mediatek.com>
Signed-off-by: Stella Liu <yu-ching.liu@mediatek.com>
Signed-off-by: Sean Wang <sean.wang@mediatek.com>
---
 drivers/net/wireless/mediatek/mt76/mt792x_core.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/net/wireless/mediatek/mt76/mt792x_core.c b/drivers/net/wireless/mediatek/mt76/mt792x_core.c
index 152cfcca2f90..f12cbfb35f9b 100644
--- a/drivers/net/wireless/mediatek/mt76/mt792x_core.c
+++ b/drivers/net/wireless/mediatek/mt76/mt792x_core.c
@@ -678,6 +678,7 @@ int mt792x_init_wiphy(struct ieee80211_hw *hw)
 	wiphy_ext_feature_set(wiphy, NL80211_EXT_FEATURE_BEACON_RATE_HE);
 	wiphy_ext_feature_set(wiphy, NL80211_EXT_FEATURE_ACK_SIGNAL_SUPPORT);
 	wiphy_ext_feature_set(wiphy, NL80211_EXT_FEATURE_CAN_REPLACE_PTK0);
+	wiphy_ext_feature_set(wiphy, NL80211_EXT_FEATURE_MULTICAST_REGISTRATIONS);
 
 	ieee80211_hw_set(hw, SINGLE_SCAN_ON_ALL_BANDS);
 	ieee80211_hw_set(hw, HAS_RATE_CONTROL);
-- 
2.43.0


