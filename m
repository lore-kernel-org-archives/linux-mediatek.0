Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E2E4CDB47C
	for <linux-mediatek@archiver.kernel.org>; Thu, 25 Jun 2026 00:19:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PfTLVu81fDyPQcXHERPJcN3IrtYpcc9/vrGzAGCrhXc=; b=biHzPXtJDYtCIz6T+giUPY5FVi
	OzEYBNQ8stUPSNfp6dugfA/x/q8OdZnio4hd3DEA1je+SG0Eho6UUphNWXU0b5SHqwEdGIGFUvUEg
	oVgk42kGQlAaT5OHw26Q45nziY1DCXSNNgdZluEPe1WsIwTDqC9DwGdWQC3X6qD1mrkF+JVoS72Px
	f5O6X0lSd6HswHWqAh+RknDznU399kFL2lLv6sfK/hzyhlB6ZW7OroWPnwVjjqyFzSaDWEveiWjlE
	DSifTyIdilWuX0nYCYCU5+Ttg+N4EjOAj0C0DoSOyl0qB1ixcOcZ2fU3O1InZFuT1VQKL2NOx+vh6
	fMGBlHtg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcXoB-00000008SY5-3qtX;
	Thu, 25 Jun 2026 00:19:07 +0000
Received: from mail-pg1-f179.google.com ([209.85.215.179])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcXo9-00000008SXX-0Jlx
	for linux-mediatek@lists.infradead.org;
	Thu, 25 Jun 2026 00:19:06 +0000
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-c89370405aaso651545a12.0
        for <linux-mediatek@lists.infradead.org>; Wed, 24 Jun 2026 17:19:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782346744; x=1782951544;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=PfTLVu81fDyPQcXHERPJcN3IrtYpcc9/vrGzAGCrhXc=;
        b=f6X8B3yGB+C01d5/nvfAcSK9Ntqe7jJXiE1WM6lYDpyWhVIIG5ZFS6R1Afa++g3qnP
         3MqoMiX9Z+28mGr/oA2b8Hsz1z0KdDGWLkSHLvbDoLgqDwhjWlyyi4sAYMGPRUgUjMSY
         ZYSRUHjiw1peZGk+/L9gBR1Y9vTdljmqYzV7rEN16Pck5DheXRRGs4mIJFhO/r9nZbeM
         MN9kL+7aW/ixctxATYn1GhhcL32KJ5TctwA4KXje9lZ1Pd6djuiZHoXDNbgH0gw1om6i
         3XZcRdpwIky52woRvyaBMgQS8kUXD8M+uz1Oy7sr1BiL8CWbTmfesa5QDKHkp+ot+CdR
         It6Q==
X-Forwarded-Encrypted: i=1; AFNElJ8zwU2luVvf3+aytLMSDDTbUoboCA0Ni1OedZxw+Lzk4ID1jouu55iw2/5IdCiTyHAaty4ib/XN7Ol95fVYnw==@lists.infradead.org
X-Gm-Message-State: AOJu0YyMXS/nO8GooB5xfAWEWW3FWnSXoHrVA2a0G7Tv67tdi6z3a0h6
	5AUe0B8jzFY6DbOQl77Xg6hFKCmtwea/o2JDmdtPiJxziSmO7Q1rn79yymCyw9vK
X-Gm-Gg: AfdE7cnhnvULXTReXk7+6Akdi8sfCRsQG8YohFVc72HCiJLl5kSP3Z3QvEEuGaFTvXg
	IcPKd2TUijF15xYBaY0upsIZvyD+H6v+ghNmhn2q2idiumL+OHKhOmucZbE7p0RuClcyf3rzZLp
	bZXOq0ppstmKP381b4042Dt85WkDNYuGqNcUACNzoyqCatJE53t7GNSdTnr2H7NidQhbbGQHA07
	xVMbeIFvgyiF8fOZUhxF9PptyR9BXV+QsB0+NhLoOS+7vDw7dMWThUICPCUuQuYKji7yjMXcBD2
	Vdll8+eu/aRQuxGmU9pbelH7dF7UXNPL+TzlxejK9LKKPWFCxKuCi90VmraduOiz4rtGDPEPxa5
	KriKNNphQiyLATnct1M+V+/OyePzvegNxrLnHM/+wfNuEwMdy6xAZ6BJEyGODXXEPwEtaomRIFE
	I10YTUN97O/zDaQt5DBal5eW1GAhRWAuksgf8FurMHsEayq2zGDpPl2nbRZT4jlfk6OHuDGS/Io
	MlUQhp7aMQL37d99UCcGHJ+HR5VUw==
X-Received: by 2002:a05:6a21:1644:b0:3bd:3536:928c with SMTP id adf61e73a8af0-3bd4aec597bmr295275637.25.1782346744094;
        Wed, 24 Jun 2026 17:19:04 -0700 (PDT)
Received: from sean-HP-EliteBook-830-G6.. (114-34-228-194.hinet-ip.hinet.net. [114.34.228.194])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c92bc1e0d10sm586839a12.21.2026.06.24.17.19.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Jun 2026 17:19:03 -0700 (PDT)
From: Sean Wang <sean.wang@kernel.org>
To: Felix Fietkau <nbd@nbd.name>,
	Lorenzo Bianconi <lorenzo@kernel.org>
Cc: chengwei.yu@mediatek.com,
	yu-ching.liu@mediatek.com,
	jenhao.yang@mediatek.com,
	posh.sun@mediatek.com,
	linux-wireless@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	Sean Wang <sean.wang@mediatek.com>
Subject: [PATCH v2 1/9] wifi: mt76: mt792x: advertise mgmt frame registration
Date: Wed, 24 Jun 2026 19:18:26 -0500
Message-ID: <20260625001834.475094-2-sean.wang@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260625001834.475094-1-sean.wang@kernel.org>
References: <20260625001834.475094-1-sean.wang@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260624_171905_118555_F451074C 
X-CRM114-Status: UNSURE (   7.34  )
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

Advertise multicast management frame registration support so userspace
can subscribe to multicast management and action frames.

This capability is required for NAN discovery and related operations.

Co-developed-by: Stella Liu <yu-ching.liu@mediatek.com>
Signed-off-by: Stella Liu <yu-ching.liu@mediatek.com>
Co-developed-by: Jeremy Yu <chengwei.yu@mediatek.com>
Signed-off-by: Jeremy Yu <chengwei.yu@mediatek.com>
Signed-off-by: Sean Wang <sean.wang@mediatek.com>
---
 drivers/net/wireless/mediatek/mt76/mt792x_core.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/net/wireless/mediatek/mt76/mt792x_core.c b/drivers/net/wireless/mediatek/mt76/mt792x_core.c
index b50825eccdaf..a0db815c27bc 100644
--- a/drivers/net/wireless/mediatek/mt76/mt792x_core.c
+++ b/drivers/net/wireless/mediatek/mt76/mt792x_core.c
@@ -719,6 +719,7 @@ int mt792x_init_wiphy(struct ieee80211_hw *hw)
 	wiphy_ext_feature_set(wiphy, NL80211_EXT_FEATURE_BEACON_RATE_HE);
 	wiphy_ext_feature_set(wiphy, NL80211_EXT_FEATURE_ACK_SIGNAL_SUPPORT);
 	wiphy_ext_feature_set(wiphy, NL80211_EXT_FEATURE_CAN_REPLACE_PTK0);
+	wiphy_ext_feature_set(wiphy, NL80211_EXT_FEATURE_MULTICAST_REGISTRATIONS);
 
 	ieee80211_hw_set(hw, SINGLE_SCAN_ON_ALL_BANDS);
 	ieee80211_hw_set(hw, HAS_RATE_CONTROL);
-- 
2.43.0


