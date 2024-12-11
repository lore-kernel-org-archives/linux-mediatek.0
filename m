Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32089E7717F
	for <linux-mediatek@archiver.kernel.org>; Wed, 11 Dec 2024 01:20:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4sCOLPelO32qVuyU8xDyaBPcPYTcYPDXfN9EW5NAA6Y=; b=nXIhPEtgQLlpI419mJTTPwhrTR
	EmDIgXDQhOQMCONzjaFTlod8HYpi58x1Ma/M9hRltQbSNvTGHgf1ytaVcOZMw9qqMpQOVK4vhMLbQ
	vb6HMhJUk/Rf3pgv3Zy3hMoPB7VhpA1oUaTT7G0Dnp2lPKnjoLwNmLR+kRoSBjlDBp8L1M3WXIfO9
	OZH7UjuA/0EI9wdyf/rZdSmnCVVtaGo4aZuAXcIal0vmUoBSdJEaZb8b3VxezBGLiUfJAruWQ09A3
	xwG1Uav+SjaSpbJgNKWTUwkkVtIfE7pYGEYryeR9PK0V5jEVNurhy/jwatPAILOXjTke+w8nVOwEu
	ki6cOR8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLBOv-0000000DP07-1ScD;
	Wed, 11 Dec 2024 01:20:29 +0000
Received: from mail-oi1-f180.google.com ([209.85.167.180])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLBOs-0000000DOyB-3uMq
	for linux-mediatek@lists.infradead.org;
	Wed, 11 Dec 2024 01:20:27 +0000
Received: by mail-oi1-f180.google.com with SMTP id 5614622812f47-3eb6b16f1a0so518752b6e.3
        for <linux-mediatek@lists.infradead.org>; Tue, 10 Dec 2024 17:20:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733880026; x=1734484826;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4sCOLPelO32qVuyU8xDyaBPcPYTcYPDXfN9EW5NAA6Y=;
        b=u8M2OhZTOYLzUFjYJ04RgyXbszdRC7dEpbKQRohOmL3CI4+DT8c9dCBYgwYX+e0csz
         CaZAO5n4SSTC0Jh6X76/6IqhdYn2jK19/KykN/mWogT4xz1YhUd6jFJQ65sVSCZF5UcY
         zCUIQminJMpTVw5axJNKPAC/9h4To6c3CraoUnDC3fJKDVDKyaYJ1Lfq7H6XXeGBBzTo
         yJbWULhWSMAnqlzO+77Tp6t7n8gRTVdTSix4shb65z+u6ITZyRSBV4AxDpGjk7kxf+uQ
         Ic5xpiY27B2JgoUbGq7j4bGpaTC8HSGgDxiJaJJF4r0bnJtobCgLp1u6VR8WtMgSMzw5
         0aIg==
X-Forwarded-Encrypted: i=1; AJvYcCV2aRizxsprN5/QPQM+shneu/dVI4TJonGba7KcTCg/SA8BWW+X0EYpbhfe94Tsd5OqpvHUKsgOFKU9siddUA==@lists.infradead.org
X-Gm-Message-State: AOJu0YwjzEuLOF55bJm5Y+zLCLc20w03CjLGZInRjuH0IolR8VkJybzh
	GOv8RgcRxmNYms/vKJQIEVRHilQZrmBAbF6uzZf80U3ztMNLR42RP00At2C3dNs=
X-Gm-Gg: ASbGnctGb1Yg2ZDgqbZz9lmLcQuRCPEi5RNKOWNlfGpIpyDLaS7o4+T1n0+4bV8LZOR
	uMYnCbdE25C1LVVHsF1xTU3VVw7ZFQ9Shhkdu+ZZDwxS7UP/FAGWCsNrsIa+2LzvAvB+NLGh+VX
	3qXci+bOW76UPZKKeugvYF2wk/QTUPDLeaSGYL6Ou+5D8EVHxBaf24CvF2cRIXI4elRzSXB86cv
	dqH4xRTEJzTpYVs/Q5QWUGuq0a5S0ilsWOFYd6IExuEG1jUCpbgZYN6IagI0aQbJVIzrNo=
X-Google-Smtp-Source: AGHT+IG8GhzuwchpKQMFJgrUxyXInhFmPd8FCXfE2Y/ubZ3c+ERwZS6Wcs+IRVz6tFSwIZGIH1lR/Q==
X-Received: by 2002:a05:6871:821:b0:29e:3132:5897 with SMTP id 586e51a60fabf-2a012d35af8mr656068fac.5.1733880026039;
        Tue, 10 Dec 2024 17:20:26 -0800 (PST)
Received: from sean-ThinkPad-T450s.lan ([207.191.35.252])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-29f93552d34sm2705701fac.24.2024.12.10.17.20.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Dec 2024 17:20:25 -0800 (PST)
From: sean.wang@kernel.org
To: nbd@nbd.name,
	lorenzo.bianconi@redhat.com
Cc: sean.wang@mediatek.com,
	deren.wu@mediatek.com,
	mingyen.hsieh@mediatek.com,
	linux-wireless@vger.kernel.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH 14/17] wifi: mt76: mt7925: Init secondary link PM state
Date: Tue, 10 Dec 2024 17:19:23 -0800
Message-Id: <20241211011926.5002-14-sean.wang@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241211011926.5002-1-sean.wang@kernel.org>
References: <20241211011926.5002-1-sean.wang@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241210_172026_967497_3B639AA7 
X-CRM114-Status: UNSURE (   7.97  )
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

From: Ming Yen Hsieh <mingyen.hsieh@mediatek.com>

Initialize secondary link PM state.

Fixes: 86c051f2c418 ("wifi: mt76: mt7925: enabling MLO when the firmware supports it")
Signed-off-by: Ming Yen Hsieh <mingyen.hsieh@mediatek.com>
Signed-off-by: Sean Wang <sean.wang@mediatek.com>
---
 drivers/net/wireless/mediatek/mt76/mt7925/main.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/main.c b/drivers/net/wireless/mediatek/mt76/mt7925/main.c
index f2a0159be9c1..6b2b91a0475e 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/main.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/main.c
@@ -1989,6 +1989,8 @@ mt7925_change_vif_links(struct ieee80211_hw *hw, struct ieee80211_vif *vif,
 			goto free;
 
 		if (mconf != &mvif->bss_conf) {
+			mt7925_mcu_set_bss_pm(dev, link_conf, true);
+
 			err = mt7925_set_mlo_roc(phy, &mvif->bss_conf,
 						 vif->active_links);
 			if (err < 0)
-- 
2.25.1


