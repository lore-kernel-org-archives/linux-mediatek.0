Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A367ECDB483
	for <linux-mediatek@archiver.kernel.org>; Wed, 18 Oct 2023 13:11:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+0xHAajk9RnoZnMNxnlpPx/L53pYS94eDmnmY1A3Dok=; b=P1Wltw3rShO+isvSoCa5p/qdrA
	qMjlPCu9rypNwUXSQojblWyZvZvQijOKPlPNk3vv1Q89DQzxk4x5nn+LmIWxRVaD0ZhVWOuTz/Zv8
	kWeOMWYk+3h+qro7435/KzdNMWaVaPZNy3zQxSLKD5f5HWk2LoGIiVxyILHTuM2wSeO053rLIMbuL
	uXngstKJiGBY82Uc5MwJ6MkAHK+PPd/btxvKkV6sup9u2jgE5jF3SvWOf9CDzHTvbi4y+GBfbcNIB
	YK7rXk9ZWUxFVsU7CNHXBgUbvA/s+B2aorpB3Wth0cJn0W0C1mVR/2qUxxJkyThUXbLPk+IHPzonr
	XTMGkhsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qt6KB-00EkSD-1t;
	Wed, 18 Oct 2023 13:10:59 +0000
Received: from mail-lj1-x22a.google.com ([2a00:1450:4864:20::22a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qt6Jy-00EkLt-03;
	Wed, 18 Oct 2023 13:10:47 +0000
Received: by mail-lj1-x22a.google.com with SMTP id 38308e7fff4ca-2c50305c5c4so83641911fa.1;
        Wed, 18 Oct 2023 06:10:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697634643; x=1698239443; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+0xHAajk9RnoZnMNxnlpPx/L53pYS94eDmnmY1A3Dok=;
        b=REZ2aTJ8IU8n1LL7F3xl+0kGAwSjHAv3CJ4oLkvEYJckvX7QQq6cH5kbxHs4NLyoSC
         zj7VI3q7aVn3bWl0yfQzqlrTpHF6oK2cgcxz2gaotXCGunELsnIdTuYEUJ1OK5VGGts3
         SH0YGRUP0HGdq1iyGAOBgSFWcL0ljC80lVgVpeIr+qTAYyt8uFWM4YZky0N9fcV+Ib1V
         G10gxwcBBxZv9JByFbaWd3359qv+4nI09yJju5IV9WluYDA2XrBq7+tcgfDGtystCawl
         bCIre2O/xpr4wbr8B0MJL2ukGv1FjUoXVStBdxCpKZrvtrc5mY6njhlUDv4tiBghaAyK
         aHqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697634643; x=1698239443;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+0xHAajk9RnoZnMNxnlpPx/L53pYS94eDmnmY1A3Dok=;
        b=C0IZyDAI60Ghu/2xVZAdF7B2l9/Q4/o3o7iqnSGFgPz9LVKsGl71O9Tk5H0lVyj0rN
         DXr5cCaN7Xpu3/26HLkTpFysuAepkQXKouL0e0z7nlswsivNTQYupXP7t5EKeMhdcyD0
         JyKFlbrv1A90dl6aJso2/iGuZ/6xj66Tbqz6OU2vTkaFq3G/ibyT8BSK49Sa3jYzJ/6i
         WoUdjeSFNCVaiqcIPPNo6xOxvMqn6pvoyTn9aIBVhhjlOjhwSI3YEwwf5tu3Y1gkTuw9
         yKQwpZOkKhtksY4Trno6mwX+9P4gRW4xMjeh/ho4vZs7tkayFcGMGnGtI7G0fUrnYB8+
         NkFg==
X-Gm-Message-State: AOJu0YwxiNQk4vKl0u4A23KtwwHfpDQ3n7vFflt1maEIyk0PN/g0cgm5
	h8TIpD6SqpuKM1N8+lEXzGY=
X-Google-Smtp-Source: AGHT+IHZCFm/FKSHMNPJ/gTl2cJ2yrV7x+5Y+s67036BkIQ4yBSpE954a8LCaTXr/6eaaE0F0B7daA==
X-Received: by 2002:ac2:4550:0:b0:507:9a13:27bd with SMTP id j16-20020ac24550000000b005079a1327bdmr3842384lfm.7.1697634643446;
        Wed, 18 Oct 2023 06:10:43 -0700 (PDT)
Received: from localhost.localdomain (93-34-89-13.ip49.fastwebnet.it. [93.34.89.13])
        by smtp.googlemail.com with ESMTPSA id u6-20020a05600c138600b004064288597bsm1677426wmf.30.2023.10.18.06.10.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Oct 2023 06:10:43 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Felix Fietkau <nbd@nbd.name>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Ryder Lee <ryder.lee@mediatek.com>,
	Shayne Chen <shayne.chen@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Kalle Valo <kvalo@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Christian Marangi <ansuelsmth@gmail.com>,
	Alexander Couzens <lynxis@fe80.eu>,
	Nicolas Cavallari <nicolas.cavallari@green-communications.fr>,
	Daniel Golle <daniel@makrotopia.org>,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH v2 3/6] wifi: mt76: limit support of precal loading for mt7915 to MTD only
Date: Wed, 18 Oct 2023 15:09:39 +0200
Message-Id: <20231018130942.31187-3-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20231018130942.31187-1-ansuelsmth@gmail.com>
References: <20231018130942.31187-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231018_061046_052667_52A7548C 
X-CRM114-Status: GOOD (  15.32  )
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

Limit support for precal loading for mt7915 only to MTD. Passing data
from DT doesn't support offset and NVMEM require a different cell name
and doesn't support offset hence only MTD way is actually supported.

Rename mt76_get_of_eeprom_from_mtd to mt76_get_of_data_from_mtd as it is
now used for a more generic purpose and export it.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 drivers/net/wireless/mediatek/mt76/eeprom.c        | 5 +++--
 drivers/net/wireless/mediatek/mt76/mt76.h          | 1 +
 drivers/net/wireless/mediatek/mt76/mt7915/eeprom.c | 2 +-
 3 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/eeprom.c b/drivers/net/wireless/mediatek/mt76/eeprom.c
index 1de3c734e136..817074a5d2fc 100644
--- a/drivers/net/wireless/mediatek/mt76/eeprom.c
+++ b/drivers/net/wireless/mediatek/mt76/eeprom.c
@@ -28,7 +28,7 @@ static int mt76_get_of_eeprom_data(struct mt76_dev *dev, void *eep, int len)
 	return 0;
 }
 
-static int mt76_get_of_epprom_from_mtd(struct mt76_dev *dev, void *eep, int offset, int len)
+int mt76_get_of_data_from_mtd(struct mt76_dev *dev, void *eep, int offset, int len)
 {
 #ifdef CONFIG_MTD
 	struct device_node *np = dev->dev->of_node;
@@ -105,6 +105,7 @@ static int mt76_get_of_epprom_from_mtd(struct mt76_dev *dev, void *eep, int offs
 	return -ENOENT;
 #endif
 }
+EXPORT_SYMBOL_GPL(mt76_get_of_data_from_mtd);
 
 static int mt76_get_of_eeprom_from_nvmem(struct mt76_dev *dev, void *eep, int len)
 {
@@ -149,7 +150,7 @@ int mt76_get_of_eeprom(struct mt76_dev *dev, void *eep, int offset, int len)
 	if (!ret)
 		return 0;
 
-	ret = mt76_get_of_epprom_from_mtd(dev, eep, offset, len);
+	ret = mt76_get_of_data_from_mtd(dev, eep, offset, len);
 	if (!ret)
 		return 0;
 
diff --git a/drivers/net/wireless/mediatek/mt76/mt76.h b/drivers/net/wireless/mediatek/mt76/mt76.h
index e8757865a3d0..f6c850557447 100644
--- a/drivers/net/wireless/mediatek/mt76/mt76.h
+++ b/drivers/net/wireless/mediatek/mt76/mt76.h
@@ -1095,6 +1095,7 @@ void mt76_seq_puts_array(struct seq_file *file, const char *str,
 
 int mt76_eeprom_init(struct mt76_dev *dev, int len);
 void mt76_eeprom_override(struct mt76_phy *phy);
+int mt76_get_of_data_from_mtd(struct mt76_dev *dev, void *eep, int offset, int len);
 int mt76_get_of_eeprom(struct mt76_dev *dev, void *data, int offset, int len);
 
 struct mt76_queue *
diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/eeprom.c b/drivers/net/wireless/mediatek/mt76/mt7915/eeprom.c
index 76be7308460b..5228f710b3da 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/eeprom.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/eeprom.c
@@ -25,7 +25,7 @@ static int mt7915_eeprom_load_precal(struct mt7915_dev *dev)
 
 	offs = is_mt7915(&dev->mt76) ? MT_EE_PRECAL : MT_EE_PRECAL_V2;
 
-	return mt76_get_of_eeprom(mdev, dev->cal, offs, val);
+	return mt76_get_of_data_from_mtd(mdev, dev->cal, offs, val);
 }
 
 static int mt7915_check_eeprom(struct mt7915_dev *dev)
-- 
2.40.1


