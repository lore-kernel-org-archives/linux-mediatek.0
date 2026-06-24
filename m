Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15395CDB479
	for <linux-mediatek@archiver.kernel.org>; Wed, 24 Jun 2026 14:45:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8bXUdI+guwfcRMBA0cDxWQJ5EDYVxWF74RchWdZtg0c=; b=vyeKJA68gXoxwT/5Ojh2dfSO5+
	umiVE/rTaiy+gCavDw8aZz5CEI5KBtZPI0euatyhx5am8zY+KxF5JdHWdmnSZchIdYG220CmzOk05
	rva21fhE4GRzs3qXKNcRqNOZYGo+cEqqcJaozjE/vAD2QV+xzfuYMo4Wxsf5TXV7KUeYiLVFOEa7V
	ktaIEGixzq9LIs+U23SJaGyzesAwOaCnav9tGicv2/yKxIWEHA6isH5s/o/qUMHRhyGd4ui5UUxRx
	iV8xAdmyOs26BzmdaU/bpud9PlT6AwOYDuB1IAXC7p/okv2lYt1kWclh12TiSblpJIHfISaSF1Pmq
	lsiqFalg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcOrK-00000007wDT-2our;
	Wed, 24 Jun 2026 14:45:46 +0000
Received: from mail-dy1-x1334.google.com ([2607:f8b0:4864:20::1334])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcOrH-00000007wCh-1LX1
	for linux-mediatek@lists.infradead.org;
	Wed, 24 Jun 2026 14:45:45 +0000
Received: by mail-dy1-x1334.google.com with SMTP id 5a478bee46e88-30c23abc62eso1238150eec.1
        for <linux-mediatek@lists.infradead.org>; Wed, 24 Jun 2026 07:45:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782312342; x=1782917142; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8bXUdI+guwfcRMBA0cDxWQJ5EDYVxWF74RchWdZtg0c=;
        b=gshtYA+HXUCfysGfojqyqdyu48UDoaOE6IvDwkjPRPuJcHtDLRocNbJYplppPeCMNB
         YveSHfnsOvaypcyYp1vXcoX9Qx9L35jjTG3jLeR3ZpROZSxewwJ7uhURgYW8zsSakwEU
         9P5gyZIwMyy/DwSnQohiBxmfcswwAqnxlqI6cXRouyYN/XPWzX6FeMJmEFM8nKT3rT6d
         4QCZZjztF94KBT+ESNyxEIexK+UfHnvEMIomFZ+grjtfzCnpPTezxkHYxPaCLuPz5PeU
         ZXJNuAB29smVzEmPjwrdcrLEI6MH35qJyUyQoV//c7BrkF2FGRabqzcg0f63jf5TgvL9
         0S6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782312342; x=1782917142;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=8bXUdI+guwfcRMBA0cDxWQJ5EDYVxWF74RchWdZtg0c=;
        b=UBISq6pxxNWLdjA6ec1hPdwikZay1gD7g4xm/ofHm/W6Uo7BIZGnLkwHCezs4F/XoT
         7uKlgQ5WEW0bYBOGSz9nPq1G2jY35nhvm1Bm3hXOyCdoCktELRU1Gx1NLm7E7v0of2v/
         2xUlyv3g5rGmAs7OiQbOcpxXvP0HIqngvrzWpb58tI86yiqoB2NpORN+kRCfz+yDn5yV
         kWjBOa8bjJDiOWl6h8OGO7LmmrO6A5JZXmyRSB7TrAZEQJ0qfwBgpwCSfugXEl7gjmNH
         b2lWQCJ0niRUT6ZwyNe4RfoWMqG6zNuzgtTVA/Jj/dscARj76lJiUg4UVYsFcuW7QHMG
         +zXQ==
X-Gm-Message-State: AOJu0YyQknM/5g436C8U8OZT9I7etnYPc8fTtOSPRZxZA9ZZgpgX8b+x
	fBo229FutCSyV2smpUjVnrEdw0PXGi0PklEEsvPu1OLU5/lcEdeCRVO0
X-Gm-Gg: AfdE7cmGlesMcquXYSBFWTpglavmfWs2LVm7N1uinUccO8XlxLOr+I4nBsov7GxdkpE
	TQMcBbRMFOWcZOHzyouRCFNifgWnxtyEMXD9jMA5dgYqszBT6QCmYpPcew1HO6zMB6GSP6QMu63
	sjXiDFWijpm9ImaAo1fNb7qQNcWXRdQGGsT6Zenj5dgNekFZbq9nf8+7soDmxWPnn+T+jbGx1VY
	tC+Cv8UHn1pVXhhXRoy94dJNE2qW3KBHBoIpesH8AWqJu+SU3WD2lDiGHVa1MSKqltYvDbBeNfJ
	4WnR06+fV7dmHHfO23lSMjulADwhQiEaCHCQO2SC84w7WRUQkQ5vaSCyLhg6ZS3HEUkExtzxdhv
	HSdaNFhE9d+ymek/AjVH/vsNfQ2EUSAMUK9MTRGZIdfzItlniXxsePgnkCyKXB/i7H7HJOOxCgc
	tCo3nQUMzjyp/U0LdoGPVHI0V3Ck51gTeFBQMm
X-Received: by 2002:a05:7300:cb13:b0:307:934e:da79 with SMTP id 5a478bee46e88-30c68e9019emr3758358eec.34.1782312342370;
        Wed, 24 Jun 2026 07:45:42 -0700 (PDT)
Received: from yyh-VMware-Virtual-Platform.lan ([45.32.131.238])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30c1ba5c25csm24899292eec.8.2026.06.24.07.45.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Jun 2026 07:45:41 -0700 (PDT)
From: Yanghan Ye <yyh94306@gmail.com>
To: Felix Fietkau <nbd@nbd.name>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Ryder Lee <ryder.lee@mediatek.com>,
	Shayne Chen <shayne.chen@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Deren Wu <deren.wu@mediatek.com>
Cc: linux-mediatek@lists.infradead.org,
	linux-wireless@vger.kernel.org,
	Yanghan Ye <yyh94306@gmail.com>
Subject: [PATCH v1 1/2] wifi: mt76: mt7996: refresh power limits on txpower changes
Date: Wed, 24 Jun 2026 22:45:15 +0800
Message-ID: <20260624144516.1841063-2-yyh94306@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260624144516.1841063-1-yyh94306@gmail.com>
References: <20260624144516.1841063-1-yyh94306@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260624_074543_364537_D81BAD01 
X-CRM114-Status: GOOD (  15.10  )
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

mt7996_config() currently ignores mac80211 configuration changes. As a
result, user txpower updates may change the cfg80211 visible power level
without refreshing the firmware SKU table used by mt7996.

Refresh the SKU table when mac80211 reports power or channel changes. Only
copy hw->conf.power_level into the cached PHY txpower on global power
changes so channel-only updates do not overwrite a BSS txpower limit.

Also refresh the SKU table and channel information for BSS txpower changes,
and report MCU failures instead of silently ignoring them.

Signed-off-by: Yanghan Ye <yyh94306@gmail.com>
---
 mt7996/main.c | 62 +++++++++++++++++++++++++++++++++++++++++++++++++--
 1 file changed, 60 insertions(+), 2 deletions(-)

diff --git a/mt7996/main.c b/mt7996/main.c
index 560fe30d..c32e7819 100644
--- a/mt7996/main.c
+++ b/mt7996/main.c
@@ -736,7 +736,50 @@ static int mt7996_set_key(struct ieee80211_hw *hw, enum set_key_cmd cmd,
 
 static int mt7996_config(struct ieee80211_hw *hw, int radio_idx, u32 changed)
 {
-	return 0;
+	struct mt7996_dev *dev = mt7996_hw_dev(hw);
+	struct mt7996_phy *phy;
+	int ret = 0;
+
+	if (!(changed & (IEEE80211_CONF_CHANGE_POWER |
+			 IEEE80211_CONF_CHANGE_CHANNEL)))
+		return 0;
+
+	mutex_lock(&dev->mt76.mutex);
+
+	if (radio_idx >= 0) {
+		if (radio_idx >= ARRAY_SIZE(dev->radio_phy)) {
+			ret = -EINVAL;
+			goto out;
+		}
+
+		phy = dev->radio_phy[radio_idx];
+		if (phy) {
+			if (changed & IEEE80211_CONF_CHANGE_POWER)
+				phy->txpower = hw->conf.power_level;
+
+			ret = mt7996_mcu_set_txpower_sku(phy);
+			if (!ret && (changed & IEEE80211_CONF_CHANGE_POWER))
+				ret = mt7996_mcu_set_chan_info(phy,
+							       UNI_CHANNEL_SWITCH);
+		}
+	} else {
+		mt7996_for_each_phy(dev, phy) {
+			if (changed & IEEE80211_CONF_CHANGE_POWER)
+				phy->txpower = hw->conf.power_level;
+
+			ret = mt7996_mcu_set_txpower_sku(phy);
+			if (!ret && (changed & IEEE80211_CONF_CHANGE_POWER))
+				ret = mt7996_mcu_set_chan_info(phy,
+							       UNI_CHANNEL_SWITCH);
+			if (ret)
+				break;
+		}
+	}
+
+out:
+	mutex_unlock(&dev->mt76.mutex);
+
+	return ret;
 }
 
 static int
@@ -1025,9 +1068,24 @@ mt7996_link_info_changed(struct ieee80211_hw *hw, struct ieee80211_vif *vif,
 		mt7996_update_mu_group(hw, link, info);
 
 	if (changed & BSS_CHANGED_TXPOWER &&
+	    info->txpower != INT_MIN &&
 	    info->txpower != phy->txpower) {
+		int ret;
+
 		phy->txpower = info->txpower;
-		mt7996_mcu_set_txpower_sku(phy);
+		ret = mt7996_mcu_set_txpower_sku(phy);
+		if (ret) {
+			dev_err_ratelimited(dev->mt76.dev,
+					    "failed to update txpower SKU: %d\n",
+					    ret);
+			goto out;
+		}
+
+		ret = mt7996_mcu_set_chan_info(phy, UNI_CHANNEL_SWITCH);
+		if (ret)
+			dev_err_ratelimited(dev->mt76.dev,
+					    "failed to update txpower channel info: %d\n",
+					    ret);
 	}
 
 out:
-- 
2.43.0


