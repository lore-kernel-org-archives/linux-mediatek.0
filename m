Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1990CDB47E
	for <linux-mediatek@archiver.kernel.org>; Wed, 18 Oct 2023 13:11:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Z3Xg+Zl530t6+yLtJ2L7UJ10F06niahRGDT6Y4EkH+w=; b=qBeYkayxZz7Xq+p+7RFE8+R71i
	pzJtIqA1yqD4VXoNYHCmuHxzA3Tt9lQItqrkQ6cZOkFXglef0bN41Z3pYeBKgb6/neyrCTzfoZNKc
	R8pzWk5vzkNECC0p6O+dgdmtF0RJZaAmT9TiM1kiVKng28kcDE2JehZ0BC89zi5Iuze9hrzgyt7C0
	xHGVgMQdi1YDNMo1DoInd6DSytsQayNiS/BbgiQDMunS6jUOQuW1YQsRWaQb3ktmdf7NOBUTlBg0y
	PQVn7PYvLKzmUpwv3VEe3zNKSY4m1CBbWRmjHS0UdHgW0qik2xZk8aWoiTYcL3tweYIFdK3phQVeu
	BDJTmEXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qt6KN-00EkX6-29;
	Wed, 18 Oct 2023 13:11:11 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qt6K0-00EkNH-2r;
	Wed, 18 Oct 2023 13:10:50 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-40839807e82so6244205e9.0;
        Wed, 18 Oct 2023 06:10:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697634646; x=1698239446; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Z3Xg+Zl530t6+yLtJ2L7UJ10F06niahRGDT6Y4EkH+w=;
        b=Y5Qi+BeywyQLOZ7Pd5e3dOuGgfxBO/VLAGkhE8ErVQRdfNgsL00+vDBBt2QC4rU1zk
         1Lx6RGuGALY9a2CnOK6W7ncPOftYNtlq8rr1kyNqdxn9H+tqnxIZ3PbQ8a1LerHdch+C
         VQ7+oVQ6skpxTYCIgjZ2+hIEcZFPaEMvhx15VClnea0TONucHM9nYSHOwNGLOUOjG5y7
         YAR7kvHNepcItWRcqmlUb41KY+tBQN2V8i75bc/zVctpfuZUsbehCRBOijEzFUl4xbBn
         wm8wgTBu+LjzM5Q5+ukQxEn1Q1b3O2ziW2YS3XkELpwXHmiDZRbww14dzRttYqBgsSfp
         DNgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697634646; x=1698239446;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Z3Xg+Zl530t6+yLtJ2L7UJ10F06niahRGDT6Y4EkH+w=;
        b=jlZAWOPBcg47xdE3mHKBa1nFaOd6Rc6iUiKs/eS5FmWx9OwMjJRgeH9gf66Kk1QQ2l
         N44No6TX5HjQNVE2afpMyQlWF2FKNKoX2HL/336/jFP2VOj/WbL7+HOcxKQBl6jU8BBE
         0L684pzlGS+0UP3D36y2OfArARLFcz8O8dFqFJBg2+bemfJtwNrPoXsvpIyJBU571Qag
         CXcDRuyTP6IKLK4V0rp1weCosjOSQFG8ZqCLH0difw0gdqtmx4yeX4onIhkTsjgmzdxR
         h+klmnTopDHmM4qnoNJMKjTvYVB8l9OGR3hRLVMnGcr5827XSYW6ghMbu05rQcpjRirE
         Z9YQ==
X-Gm-Message-State: AOJu0YwWb1XtAYu2Grv6Dg/CVqENVcP/exjmw4E7Dt5Wucw6dnExtIVD
	J1ONcBovhMpX9xPwKLG7OMI=
X-Google-Smtp-Source: AGHT+IHEbRqesj7l3D4EwIgtEAeke37ZIpRp6Fma1JEUtHbnVo9gJbSp4GsHnwTbRcZjmmaHwkjWiA==
X-Received: by 2002:a05:600c:4d0d:b0:405:3f06:d2ef with SMTP id u13-20020a05600c4d0d00b004053f06d2efmr4621449wmp.4.1697634646084;
        Wed, 18 Oct 2023 06:10:46 -0700 (PDT)
Received: from localhost.localdomain (93-34-89-13.ip49.fastwebnet.it. [93.34.89.13])
        by smtp.googlemail.com with ESMTPSA id u6-20020a05600c138600b004064288597bsm1677426wmf.30.2023.10.18.06.10.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Oct 2023 06:10:45 -0700 (PDT)
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
Cc: Shiji Yang <yangshiji66@outlook.com>
Subject: [PATCH v2 5/6] wifi: mt76: permit to use alternative cell name to eeprom NVMEM load
Date: Wed, 18 Oct 2023 15:09:41 +0200
Message-Id: <20231018130942.31187-5-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20231018130942.31187-1-ansuelsmth@gmail.com>
References: <20231018130942.31187-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231018_061048_925510_D73C209C 
X-CRM114-Status: GOOD (  13.36  )
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

Tested-by: Shiji Yang <yangshiji66@outlook.com>
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


