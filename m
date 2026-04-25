Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3266FFF8863
	for <linux-mediatek@archiver.kernel.org>; Sat, 25 Apr 2026 19:51:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Nn0IDzT+W9CDGbojhoLfTqkBiBGELCUWb519tH5lz+U=; b=lqUYqdgUQ7/9pUZRE1p0VfTPbh
	h/UsW5MQ7qaZuwr5YJOvuL+MwPwbT6DTx5ap65VqlR7VslH5L1YaXQ8s9cipFJNWHKDnKiAvj9/Fe
	eGWpW+szubGdv+VmEqyJW64obz2Cj/hTmhTP1MDGoEgFLmrEtfr0wHFishkQhUf7+Fg/ayn6kQmSo
	J9if1qKhkSO2Kg1pMGfPlm879VjyKF7hWrra2GooOdkMG89NJ1aDjF5tsSxaxwXhBGPEZgLo7/Hsd
	FdK17HTsjQePAZPdvX9uSPtso822F3UNEntHexJV5zbLrJJrl3+P6YCM7Ud7nSlwZWlyAE2XD2Q91
	AvH5qGvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGj2L-0000000EmQE-1qGT;
	Sat, 25 Apr 2026 19:51:33 +0000
Received: from mail-ot1-f42.google.com ([209.85.210.42])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGj2J-0000000EmPF-1bwk
	for linux-mediatek@lists.infradead.org;
	Sat, 25 Apr 2026 19:51:32 +0000
Received: by mail-ot1-f42.google.com with SMTP id 46e09a7af769-7d4be94eeacso9234945a34.2
        for <linux-mediatek@lists.infradead.org>; Sat, 25 Apr 2026 12:51:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777146690; x=1777751490;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Nn0IDzT+W9CDGbojhoLfTqkBiBGELCUWb519tH5lz+U=;
        b=NPFhFYgurIx5x4dj0G0XTW6NQXjpd+vcm/Pt+K+LKbmuqOO48HJ3+bIqvJLufyqzRe
         9aHPUVIUfHEfaFYu4CiGEgyZDPtQrvCi0o+Kzde7lQM50570NU0j3ycMA4fcCiA3ZJHO
         JkDwc7Q9Hx3p5gdURfL6V/7mSaNqUcAFlGu+NoX3e5s5o293CI/FndGBxV4jB0aiU3N7
         0adwxpCmnnthJpX9t5rwwBYV8sWmfd2J25ijbT3sAZiNl0JWQhAyk4sbb/RzhNdD60vK
         GFEhmhwuONAuJtoZxve2/bcuxWME7zrpYlO76mkE2fl+gPgAPE7B4hQ1BMS3YV4cWTlm
         MI1Q==
X-Forwarded-Encrypted: i=1; AFNElJ+P991Qdon3yyovMq9a9qXStB4bI0zCSzouvddLn+ih6v0rzxb0luWjTR44Mp0h+hka8Qu9hR4PofhvHtmzvw==@lists.infradead.org
X-Gm-Message-State: AOJu0YyAxbbBhgw2pvpWuifZRTPiSmHN7wd7VlUx5Fg7pFY4ydn99dxE
	qKN555lzuTzcnlVnnjGRjNEke0tg35qzTrTD+cxq6auKWrInO+fhdpJ/
X-Gm-Gg: AeBDies8aa/AmZ02pSBqDXsCgmYNgxdArOeZ+IHo4p2CEpcn2A2NG1fWuFYbK5tuJIr
	JljC1/gls6lXS26RKRD7QkLs7yjP6xxLauqdwQUcbQK+MKrm5J6FRQPslaG7ihs8YtsaYLqbLxJ
	tKZPpK5gVSuAHykMMS+V1M5aq/nVinseLJF3nVLu9iGC+LjxvbbJfFrAKMqlBdG5Wui3npXzzC1
	6qMMZ2iFTV8ZjzEmnkjjM1RPNGlP6AyCBLB5g7ZsPeNq23bkZeypyxEKbJK1ZeCXHsbBQ0ct4eP
	zWQ5o3yaoq/QIc0Ww0VgC6EZlGqBWw/jAyPW3O8sBqs2n+MDDzRNF5WjgvU+Fu4tiYP1BLIYFrj
	xDOOHJqRJji3gKkcFps4/EvhzMpKKSREqn5I+/wTK1J6dOtLW86+R4L/q++3pd3eaSQE4ju4m9t
	n3BW6khz4wEjTdF6B6aN5Ux4xhzT3pWsoJTZ5UTKw7Qr4OtGgtIv8l14zUovpbOwvLKs4tXpCNZ
	g==
X-Received: by 2002:a05:6830:4c12:b0:7dc:cefa:1c37 with SMTP id 46e09a7af769-7dccefa1e5dmr11880631a34.23.1777146690330;
        Sat, 25 Apr 2026 12:51:30 -0700 (PDT)
Received: from sean-HP-EliteBook-830-G6.attlocal.net ([2600:1702:5083:7610:2e29:c3c3:de27:ce76])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7dcd164d2c3sm13987624a34.24.2026.04.25.12.51.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Apr 2026 12:51:28 -0700 (PDT)
From: Sean Wang <sean.wang@kernel.org>
To: nbd@nbd.name,
	lorenzo.bianconi@redhat.com
Cc: linux-wireless@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	Sean Wang <sean.wang@mediatek.com>
Subject: [PATCH v5 12/21] wifi: mt76: connac: tolerate inactive BSS deactivation
Date: Sat, 25 Apr 2026 14:50:02 -0500
Message-ID: <20260425195011.790265-13-sean.wang@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260425195011.790265-1-sean.wang@kernel.org>
References: <20260425195011.790265-1-sean.wang@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260425_125131_548176_8CE7C1FA 
X-CRM114-Status: GOOD (  13.90  )
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

Firmware may return wlan_failure when deactivating a BSS that is already
inactive. This is a valid teardown case and should not fail the remove
path.

Keep activation failures unchanged since they still indicate that firmware
failed to create or activate the BSS state.

Signed-off-by: Sean Wang <sean.wang@mediatek.com>
---
 .../wireless/mediatek/mt76/mt76_connac_mcu.c  |  9 +++++++-
 .../wireless/mediatek/mt76/mt76_connac_mcu.h  | 23 +++++++++++++++++++
 .../net/wireless/mediatek/mt76/mt7925/mcu.c   |  6 +++--
 3 files changed, 35 insertions(+), 3 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c b/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c
index 2b1c887d6709..0f2d580c7b4a 100644
--- a/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c
@@ -1227,6 +1227,9 @@ int mt76_connac_mcu_uni_add_dev(struct mt76_phy *phy,
 	len = enable ? sizeof(dev_req) : sizeof(basic_req);
 
 	err = mt76_mcu_send_msg(dev, cmd, data, len, true);
+	if (err && cmd == MCU_UNI_CMD(BSS_INFO_UPDATE))
+		err = mt76_connac_mcu_bss_deact_err(dev, err, enable);
+
 	if (err < 0)
 		return err;
 
@@ -1234,7 +1237,11 @@ int mt76_connac_mcu_uni_add_dev(struct mt76_phy *phy,
 	data = enable ? (void *)&basic_req : (void *)&dev_req;
 	len = enable ? sizeof(basic_req) : sizeof(dev_req);
 
-	return mt76_mcu_send_msg(dev, cmd, data, len, true);
+	err = mt76_mcu_send_msg(dev, cmd, data, len, true);
+	if (err && cmd == MCU_UNI_CMD(BSS_INFO_UPDATE))
+		err = mt76_connac_mcu_bss_deact_err(dev, err, enable);
+
+	return err;
 }
 EXPORT_SYMBOL_GPL(mt76_connac_mcu_uni_add_dev);
 
diff --git a/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.h b/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.h
index 552cb94edaa0..4691b9b5e2be 100644
--- a/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.h
+++ b/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.h
@@ -1906,6 +1906,29 @@ mt76_connac_mcu_get_wlan_idx(struct mt76_dev *dev, struct mt76_wcid *wcid,
 	}
 }
 
+#define MT76_CONNAC_MCU_STATUS_WLAN_FAILURE	0xc0000001
+
+static inline int
+mt76_connac_mcu_bss_deact_err(struct mt76_dev *mdev, int err, bool enable)
+{
+	if (err != (int)MT76_CONNAC_MCU_STATUS_WLAN_FAILURE)
+		return err;
+
+	/* Ignore wlan_failure state false alarm when deactivating an
+	 * inactive network. It does not harm the firmware state.
+	 */
+	if (!enable) {
+		dev_dbg(mdev->dev,
+			"ignore wlan_failure when bss is deactivated\n");
+		return 0;
+	}
+
+	dev_warn(mdev->dev,
+		 "wlan_failure when bss is activated\n");
+
+	return err;
+}
+
 struct sk_buff *
 __mt76_connac_mcu_alloc_sta_req(struct mt76_dev *dev, struct mt76_vif_link *mvif,
 				struct mt76_wcid *wcid, int len);
diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
index f403d9d925e3..b338d6bf02f5 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
@@ -2832,6 +2832,7 @@ int mt7925_mcu_add_bss_info_sta(struct mt792x_phy *phy,
 	struct mt792x_bss_conf *mconf = mt792x_link_conf_to_mconf(link_conf);
 	struct mt792x_dev *dev = phy->dev;
 	struct sk_buff *skb;
+	int err;
 
 	skb = __mt7925_mcu_alloc_bss_req(&dev->mt76, &mconf->mt76,
 					 MT7925_BSS_UPDATE_MAX_SIZE);
@@ -2857,8 +2858,9 @@ int mt7925_mcu_add_bss_info_sta(struct mt792x_phy *phy,
 		mt7925_mcu_bss_mbssid_tlv(skb, link_conf, enable);
 	}
 
-	return mt76_mcu_skb_send_msg(&dev->mt76, skb,
-				     MCU_UNI_CMD(BSS_INFO_UPDATE), true);
+	err = mt76_mcu_skb_send_msg(&dev->mt76, skb,
+				    MCU_UNI_CMD(BSS_INFO_UPDATE), true);
+	return mt76_connac_mcu_bss_deact_err(&dev->mt76, err, enable);
 }
 
 int mt7925_mcu_add_bss_info(struct mt792x_phy *phy,
-- 
2.43.0


