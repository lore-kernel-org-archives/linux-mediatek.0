Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6E8BFF8860
	for <linux-mediatek@archiver.kernel.org>; Mon, 27 Apr 2026 03:45:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=o7US79DzYi1oz6JsAlo7MAoEcS/s37RIVJeKWp9La9I=; b=nxxjrBOr2hFYrIyf3lVDq5mUZK
	17lACEbarTepo0GOxqYTFYOlpvb5vFwapFJtgYBP0fHuBPTEwEsTt4J5zT/ilTPsxK8v/WEjiMzmo
	KPz0zF0hqXSmX+yB8SlJvuQtdVztEtDiD53bWb/h3oQI7By7bTphU3ACFGPKKJRPRmMGDzukV2ryt
	whgoWuLUBTgrNKddmavqsr18M2/T7fFFxWyAE+W6c5MqfmypiFOEBJPbVAzNy0QQ7Jtkh06BpzNOu
	4JhRyznkg4Hu2vYiQeCchWA3EEQ3lTjKVNB3qTc57bGXYG6CJmrZACXNDfmikQZDDi+SNLxgBkRZh
	nIT4+Vfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHCu7-0000000G78U-44qd;
	Mon, 27 Apr 2026 03:45:03 +0000
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHCtv-0000000G71q-3Lz6
	for linux-mediatek@lists.infradead.org;
	Mon, 27 Apr 2026 03:44:52 +0000
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-2b2589c26e3so91117165ad.1
        for <linux-mediatek@lists.infradead.org>; Sun, 26 Apr 2026 20:44:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777261491; x=1777866291; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=o7US79DzYi1oz6JsAlo7MAoEcS/s37RIVJeKWp9La9I=;
        b=nzDnDgRvn5ioFMdDf0ZP8jsI07dmlrM4kzIKO9/jDAqc3OezfJ3nl8Eut3DG3hSf2/
         Dhep9oTrdXXs9e3cC27INOPnh4Xg9wxNIDQycqXiwi5z4mrGz33UcSmYnHjK27qVoC7m
         uu8Be9ojwlFxkkg5J1Yl//im2+63lrwI4O3/pQAJ3arLwRg7FC0IMypFBRRzlVN9gk1E
         kEvVz+zaSE0dh8WucsneSMk8WwUm/DyzwPPjC/iIvsk50NLnLbX3mwb8G7w7AHn+C+oY
         eycYubTNQH805Y9nDvEEsaDfkfEUInwTrX0RXO9v3IDivjD4CakXxk21MuEhynlpUp4i
         Kytg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777261491; x=1777866291;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=o7US79DzYi1oz6JsAlo7MAoEcS/s37RIVJeKWp9La9I=;
        b=I4peDMiX83eG95kQpY0b2cW1LEa/WRM7usVn27LEGo1qoKD1LRcmzo+m2j+u8eojeY
         bL5Z+5QKIeUxmEzfotyO5O1dD0BWSQ+qDtxrWRUiDadND+rtoQaY1wHWWga/U4py9Osn
         3P6CKkYlnCvSQY1CXRkjh7Bir1LOzoPfdJin5ZtMypXPfXJFRsZkkgf7pxcTXi8DcShS
         0AJvQQp6/PYwP2cAK+GUnBRVlAAYPdole8BV89mYXCNjGdcUufIheovXoQLcEbJVwrm0
         +3EiCyRxsKo+nokaeFukggeWHhRo++EfucItmd4ILdfBFLLjyK2FIa5JdWbz3KtfRvwj
         3H8A==
X-Forwarded-Encrypted: i=1; AFNElJ+9442bXH7S+nZ+XT39n2d8UwsLuVKEwApcoTObr6O6ylehFeiYv+NCkbtm753SvwhERQwU10Vq43dBzS8YOA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yw8ecukhxD6fooby+Ke/8jcQvUGq3CAv+A6BB2sedLjyKvhIuIa
	9IYhd2gkY6lFdST3kfpRxlIdxxM69Ze6BMVVUcG5pw321IwdJ0O7vuCK
X-Gm-Gg: AeBDiet5T68s6mMociJ3AfUwlKPWrZey6HURnKeBrOzDtZQIF0dSfd95jyV+pDFzkVV
	ZbcqIHyXwGlS7kWXEEJAxMFsmkKd2KtSL4V+Q2K2+CxxMYs+uOvg+Dt6l1CZpp/BO2tlBZ0w0ie
	dpb9NRzsdlcynQMgEMIGZ1iawM0QnageVWp6hgDMUbky6pskfs7fGbvcC4Z+rVJBK6DMz+L/q6S
	yWTRRMA5+Jryk6guhxNNGDrLpHGPwTXr6CsgyMch3upPuNkRc1Ac3eOIoQMH71lQSZdHn0Umf7k
	yvd00k5QqrAVm/WCSBXTQm+ya7029n0emEy+7iCLwSL6sBdFl+OKb2FNrvc+Ahr13ATnmFs+PiC
	lUexurHP+M2gtTVvTIu9YzMT9Zlh4ss+nHoBqJtjPDvnYfpsWWBU3Rr8A/ySXF5Gu0U83bxu/Lr
	pNU2gmH3iCgZxD2msvk0AcF5ufUIwx0/ikK1n07Wdv3/hmZswNH4OFUwFTHF3JAYkfZYbl8vugN
	Wy5jr9n3yL08G5Iu90SM2JoWw==
X-Received: by 2002:a17:903:32c9:b0:2b0:5923:5194 with SMTP id d9443c01a7336-2b5f9fa70e1mr428464165ad.27.1777261491168;
        Sun, 26 Apr 2026 20:44:51 -0700 (PDT)
Received: from ryzen ([2601:644:8000:5b5d::8bd])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b5faa4f092sm290610585ad.36.2026.04.26.20.44.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Apr 2026 20:44:50 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: devicetree@vger.kernel.org
Cc: Felix Fietkau <nbd@nbd.name>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Ryder Lee <ryder.lee@mediatek.com>,
	Shayne Chen <shayne.chen@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Johannes Berg <johannes@sipsolutions.net>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	linux-wireless@vger.kernel.org (open list:MEDIATEK MT76 WIRELESS LAN DRIVER),
	linux-kernel@vger.kernel.org (open list:ARM/Mediatek SoC support),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/Mediatek SoC support),
	linux-mediatek@lists.infradead.org (moderated list:ARM/Mediatek SoC support),
	linux-mips@vger.kernel.org (open list:MIPS)
Subject: [PATCH 3/3] wifi: mt76: remove mt76_get_of_data_from_mtd
Date: Sun, 26 Apr 2026 20:44:27 -0700
Message-ID: <20260427034427.881389-4-rosenp@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260427034427.881389-1-rosenp@gmail.com>
References: <20260427034427.881389-1-rosenp@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260426_204451_842002_E77485A4 
X-CRM114-Status: GOOD (  12.66  )
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

mt76_get_of_data_from_mtd has been replaced by
mt76_get_of_data_from_nvmem in all usages.

Remove it to prevent people from using the deprecated
mediatek,mtd-eeprom binding.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/net/wireless/mediatek/mt76/eeprom.c   | 87 -------------------
 drivers/net/wireless/mediatek/mt76/mt76.h     |  1 -
 .../wireless/mediatek/mt76/mt7915/eeprom.c    |  4 -
 3 files changed, 92 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/eeprom.c b/drivers/net/wireless/mediatek/mt76/eeprom.c
index afdb73661866..092804323d81 100644
--- a/drivers/net/wireless/mediatek/mt76/eeprom.c
+++ b/drivers/net/wireless/mediatek/mt76/eeprom.c
@@ -35,89 +35,6 @@ static int mt76_get_of_eeprom_data(struct mt76_dev *dev, void *eep, int len)
 	return 0;
 }
 
-int mt76_get_of_data_from_mtd(struct mt76_dev *dev, void *eep, int offset, int len)
-{
-#ifdef CONFIG_MTD
-	struct device_node *np = dev->dev->of_node;
-	struct mtd_info *mtd;
-	const __be32 *list;
-	const char *part;
-	phandle phandle;
-	size_t retlen;
-	int size;
-	int ret;
-
-	list = of_get_property(np, "mediatek,mtd-eeprom", &size);
-	if (!list)
-		return -ENOENT;
-
-	phandle = be32_to_cpup(list++);
-	if (!phandle)
-		return -ENOENT;
-
-	np = of_find_node_by_phandle(phandle);
-	if (!np)
-		return -EINVAL;
-
-	part = of_get_property(np, "label", NULL);
-	if (!part)
-		part = np->name;
-
-	mtd = get_mtd_device_nm(part);
-	if (IS_ERR(mtd)) {
-		ret =  PTR_ERR(mtd);
-		goto out_put_node;
-	}
-
-	if (size <= sizeof(*list)) {
-		ret = -EINVAL;
-		goto out_put_node;
-	}
-
-	offset += be32_to_cpup(list);
-	ret = mtd_read(mtd, offset, len, &retlen, eep);
-	put_mtd_device(mtd);
-	if (mtd_is_bitflip(ret))
-		ret = 0;
-	if (ret) {
-		dev_err(dev->dev, "reading EEPROM from mtd %s failed: %i\n",
-			part, ret);
-		goto out_put_node;
-	}
-
-	if (retlen < len) {
-		ret = -EINVAL;
-		goto out_put_node;
-	}
-
-	if (of_property_read_bool(dev->dev->of_node, "big-endian")) {
-		u8 *data = (u8 *)eep;
-		int i;
-
-		/* convert eeprom data in Little Endian */
-		for (i = 0; i < round_down(len, 2); i += 2)
-			put_unaligned_le16(get_unaligned_be16(&data[i]),
-					   &data[i]);
-	}
-
-#ifdef CONFIG_NL80211_TESTMODE
-	dev->test_mtd.name = devm_kstrdup(dev->dev, part, GFP_KERNEL);
-	if (!dev->test_mtd.name) {
-		ret = -ENOMEM;
-		goto out_put_node;
-	}
-	dev->test_mtd.offset = offset;
-#endif
-
-out_put_node:
-	of_node_put(np);
-	return ret;
-#else
-	return -ENOENT;
-#endif
-}
-EXPORT_SYMBOL_GPL(mt76_get_of_data_from_mtd);
-
 int mt76_get_of_data_from_nvmem(struct mt76_dev *dev, void *eep,
 				const char *cell_name, int len)
 {
@@ -163,10 +80,6 @@ static int mt76_get_of_eeprom(struct mt76_dev *dev, void *eep, int len)
 	if (!ret)
 		return 0;
 
-	ret = mt76_get_of_data_from_mtd(dev, eep, 0, len);
-	if (!ret)
-		return 0;
-
 	return mt76_get_of_data_from_nvmem(dev, eep, "eeprom", len);
 }
 
diff --git a/drivers/net/wireless/mediatek/mt76/mt76.h b/drivers/net/wireless/mediatek/mt76/mt76.h
index 527bef97e122..f447ecac664d 100644
--- a/drivers/net/wireless/mediatek/mt76/mt76.h
+++ b/drivers/net/wireless/mediatek/mt76/mt76.h
@@ -1339,7 +1339,6 @@ void mt76_seq_puts_array(struct seq_file *file, const char *str,
 
 int mt76_eeprom_init(struct mt76_dev *dev, int len);
 int mt76_eeprom_override(struct mt76_phy *phy);
-int mt76_get_of_data_from_mtd(struct mt76_dev *dev, void *eep, int offset, int len);
 int mt76_get_of_data_from_nvmem(struct mt76_dev *dev, void *eep,
 				const char *cell_name, int len);
 
diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/eeprom.c b/drivers/net/wireless/mediatek/mt76/mt7915/eeprom.c
index eb92cbf1a284..c24e1276700b 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/eeprom.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/eeprom.c
@@ -29,10 +29,6 @@ static int mt7915_eeprom_load_precal(struct mt7915_dev *dev)
 
 	offs = is_mt7915(&dev->mt76) ? MT_EE_PRECAL : MT_EE_PRECAL_V2;
 
-	ret = mt76_get_of_data_from_mtd(mdev, dev->cal, offs, size);
-	if (!ret)
-		return ret;
-
 	ret = mt76_get_of_data_from_nvmem(mdev, dev->cal, "precal", size);
 	if (!ret)
 		return ret;
-- 
2.54.0


