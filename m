Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7BEACDB484
	for <linux-mediatek@archiver.kernel.org>; Tue, 17 Oct 2023 19:28:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=g6jQJsBRBLmDkm3I/0qquR/3BJtEfnv9Twl5IETKE8Y=; b=daSPR4aCm2hWwvNeIobGfxhQ09
	9w9BVfsqTNkw8DYuGZPBh/xWNt3KkvnSyLJvO3NMW2CzA3E8g/SDpUiPXH0Wy5aVMvbCmVVhM65k4
	lfzIhQj+lKd/5z0Fk2XgFsuiuU4laIG2wlR6s3MHRG6RYcohOu8C4WKZzoK5W4FxZjIPqWl6dWJjJ
	/VO+ST1oTtSJsO2Knh/C42FNcSAuBZy6GWDBokMuL+qzVTc7RxI9GDXeQgraZWHY2Sdm/RPhJFLGu
	K0RRC2t/oY4PAniLFyQWsSFlVc44r7F8qz0kMZldSh4rLHo4zEksMeZNbaSg6G0Xl8xv3bU0Opm3E
	Fyr8Ejbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qspjX-00D5pR-18;
	Tue, 17 Oct 2023 19:28:03 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qspjP-00D5kE-0e;
	Tue, 17 Oct 2023 19:27:56 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-40806e40fccso6965275e9.2;
        Tue, 17 Oct 2023 12:27:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697570874; x=1698175674; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=g6jQJsBRBLmDkm3I/0qquR/3BJtEfnv9Twl5IETKE8Y=;
        b=izPmPsVliM8Awzf0gyVUgOUlGbidmnCtwsgwzFPuaoOEk7TS5FhP8gRmAOXTYotWpV
         fJEJCBTGWG8CxbHziGBmyQq4QVHksK3NmE2/zupczzXCJfmHyzKZWh7cVLAWSkeLHXCX
         nfp+K3hcVoZ4lCkPO4h5ic8tc8mvgZwmb+4GzHJTrLLtgygFdLQT68nVUkzgNX+yLNm8
         vWjKMN0DhcuVXgQue6RgnJ6ce+EW2szRPUQxMNHkp5z9C/eDGpPcU0DV6OoW4jy9UuwK
         /rLOIMVhmtL3ALH1+D3Fp6FULx/vu14YcbMIDK7OWb+MVNv82dLsn6jwJQPEuX4RPv0v
         hUSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697570874; x=1698175674;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=g6jQJsBRBLmDkm3I/0qquR/3BJtEfnv9Twl5IETKE8Y=;
        b=GXQI+MoFidypYLqpVZWepkHiZxLq6Eq2iDOjU67WVbzu3fTAtthbaT/XoPa56tC2E5
         4hNgI+GbnmUeu2hX999dEQzP7uQY8Zt/Il0xFnC05FLE29b3N11SV3RyHCPEfvybQUOw
         bqyNeKHqgcRxzUvkgDq4MuJmIFV3RNJbLMeocKfCA0P5Qc/NV1fdemtLzzdNalsAk/Ay
         Y4BkAPX6dkqDixkm4wu8jUhnJDMY5WctVMkUMfKTCTJwLiWfbDaUk2DB8l14OaWLaxrA
         t8+xx/Nz6lJoEqf0oD3xgOhmx+emjCtD1nNRzxXqgm5S36/6OnTrtRHrmrJ0k51tL2VF
         bXGw==
X-Gm-Message-State: AOJu0Yx71AhKW024OoeWckoDsrbZg8PAXdPHRo0ZSnFdikqnvZedCC0p
	qfdw2bjqSeHkx76s8yyHxOYDlfk7pNI=
X-Google-Smtp-Source: AGHT+IEnQ5HC+BuPuzufGE10gWuIiTfP965Vnpx9uNXzZJjYccZpAg+E7wcKaRLYSLxC56LOmeRrdA==
X-Received: by 2002:a05:6000:8b:b0:31f:a62d:264 with SMTP id m11-20020a056000008b00b0031fa62d0264mr2704276wrx.37.1697570873841;
        Tue, 17 Oct 2023 12:27:53 -0700 (PDT)
Received: from localhost.localdomain (93-34-89-13.ip49.fastwebnet.it. [93.34.89.13])
        by smtp.googlemail.com with ESMTPSA id o2-20020adfeac2000000b0032cc35c2ef7sm435897wrn.29.2023.10.17.12.27.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Oct 2023 12:27:53 -0700 (PDT)
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
	Simon Horman <horms@kernel.org>,
	Alexander Couzens <lynxis@fe80.eu>,
	Nicolas Cavallari <nicolas.cavallari@green-communications.fr>,
	Daniel Golle <daniel@makrotopia.org>,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [net-next RFC PATCH 5/6] wifi: mt76: permit to use alternative cell name to eeprom NVMEM load
Date: Tue, 17 Oct 2023 21:05:09 +0200
Message-Id: <20231017190510.27163-5-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20231017190510.27163-1-ansuelsmth@gmail.com>
References: <20231017190510.27163-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231017_122755_244677_21FD10FA 
X-CRM114-Status: GOOD (  13.06  )
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

Generilize mt76_get_of_eeprom_from_nvmem to use alternative cell name by
passing the cell name as an arg and expose it.

Rename it to mt76_get_of_data_from_nvmem to better reflect the now more
generic usage.

This is to permit driver to load additional cell, like precal cell.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 drivers/net/wireless/mediatek/mt76/eeprom.c | 8 +++++---
 drivers/net/wireless/mediatek/mt76/mt76.h   | 2 ++
 2 files changed, 7 insertions(+), 3 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/eeprom.c b/drivers/net/wireless/mediatek/mt76/eeprom.c
index 748f4b643a5e..ac6c0a0e876f 100644
--- a/drivers/net/wireless/mediatek/mt76/eeprom.c
+++ b/drivers/net/wireless/mediatek/mt76/eeprom.c
@@ -107,7 +107,8 @@ int mt76_get_of_data_from_mtd(struct mt76_dev *dev, void *eep, int offset, int l
 }
 EXPORT_SYMBOL_GPL(mt76_get_of_data_from_mtd);
 
-static int mt76_get_of_eeprom_from_nvmem(struct mt76_dev *dev, void *eep, int len)
+int mt76_get_of_data_from_nvmem(struct mt76_dev *dev, void *eep,
+				const char *cell_name, int len)
 {
 	struct device_node *np = dev->dev->of_node;
 	struct nvmem_cell *cell;
@@ -115,7 +116,7 @@ static int mt76_get_of_eeprom_from_nvmem(struct mt76_dev *dev, void *eep, int le
 	size_t retlen;
 	int ret = 0;
 
-	cell = of_nvmem_cell_get(np, "eeprom");
+	cell = of_nvmem_cell_get(np, cell_name);
 	if (IS_ERR(cell))
 		return PTR_ERR(cell);
 
@@ -137,6 +138,7 @@ static int mt76_get_of_eeprom_from_nvmem(struct mt76_dev *dev, void *eep, int le
 
 	return ret;
 }
+EXPORT_SYMBOL_GPL(mt76_get_of_data_from_nvmem);
 
 static int mt76_get_of_eeprom(struct mt76_dev *dev, void *eep, int len)
 {
@@ -154,7 +156,7 @@ static int mt76_get_of_eeprom(struct mt76_dev *dev, void *eep, int len)
 	if (!ret)
 		return 0;
 
-	return mt76_get_of_eeprom_from_nvmem(dev, eep, len);
+	return mt76_get_of_data_from_nvmem(dev, eep, "eeprom", len);
 }
 
 void
diff --git a/drivers/net/wireless/mediatek/mt76/mt76.h b/drivers/net/wireless/mediatek/mt76/mt76.h
index 41e4f398083e..c9934258c49d 100644
--- a/drivers/net/wireless/mediatek/mt76/mt76.h
+++ b/drivers/net/wireless/mediatek/mt76/mt76.h
@@ -1096,6 +1096,8 @@ void mt76_seq_puts_array(struct seq_file *file, const char *str,
 int mt76_eeprom_init(struct mt76_dev *dev, int len);
 void mt76_eeprom_override(struct mt76_phy *phy);
 int mt76_get_of_data_from_mtd(struct mt76_dev *dev, void *eep, int offset, int len);
+int mt76_get_of_data_from_nvmem(struct mt76_dev *dev, void *eep,
+				const char *cell_name, int len);
 
 struct mt76_queue *
 mt76_init_queue(struct mt76_dev *dev, int qid, int idx, int n_desc,
-- 
2.40.1


