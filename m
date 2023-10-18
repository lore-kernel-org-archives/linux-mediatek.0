Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AFFE9CDB482
	for <linux-mediatek@archiver.kernel.org>; Wed, 18 Oct 2023 13:11:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DGsOIe2+gPILwGffb1seZvDCNStpRAryY2lIF4RhpfU=; b=iwBjHhBZEWGGJ9bxeuOIilARro
	XpKxl3WUjn9oVQ+m3CHY0P+R5lcY3X315H3Dd9aMbwa+fHubro3RHhhx8CkmjmN3MEuFRxM77Ny9v
	8Wxg663jVeGhITdk+ERoYZGT3u/ykJ0YMT1e6xCmNPYTkIea01ojHq+kSiFFy/5fX2jZ7S0Ltw8hY
	9vmnI17Xu/sssZ/fHxuQ+HF2zCNBa8bHbAx3ijAG/UR7vTr55ZlkfejZY9DJbUcpcJgawOxpnCRI5
	4zHxXHLFqEDhke4CDosCR42FYRlHslF2xvj1ZFIfBLlO/QwaYDRb6vXzaM7fYlfYC2/OV9xjjF9CE
	XHUp4g0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qt6KO-00EkXm-1x;
	Wed, 18 Oct 2023 13:11:12 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qt6K2-00EkOE-1r;
	Wed, 18 Oct 2023 13:10:51 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-40839807e82so6244575e9.0;
        Wed, 18 Oct 2023 06:10:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697634648; x=1698239448; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DGsOIe2+gPILwGffb1seZvDCNStpRAryY2lIF4RhpfU=;
        b=lvTUjnnqlpG3cYdnct1Kb82d0iyLKfYoK/jyNOnzF99M9mcBD6BXcx0XevXPa0WB7Z
         j3sU2me2AnMlHPOtBhR3QgDLwk2+lzfPVAWkE1h3Qr6W05bBlihtXycpNNLyBPl2eRZ+
         V0R2eM/aYPytxsD9UjLiPjyE2Cbm0oeCxVGApV4wvhC2PoSrv91nQdRgb9zXIB0WvFNj
         Hr3Mzhg2rqgAFNRbvtD9GTd2Z1k80yU2PsON9lvKMZV7FK4WjJAcQPNYsla7kWcA3bZH
         WfeKEugCrfyTUyLfQM/tB4GrO2583YJSnvPi3Em7/9KM6gYqXap+pjI89OijHZrTFnzz
         BX+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697634648; x=1698239448;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DGsOIe2+gPILwGffb1seZvDCNStpRAryY2lIF4RhpfU=;
        b=ljrljTheU5gm3oFF5+SGMbeclCUBjDS4NU8bxhwwqpZOBmXxzJMHSfZXzPmwvF9yQK
         tGLKzHNfxOc92gjZDpH9Y55mx9fPr2Dj1eXjGw+2B2FrEyZQWL969wV1qrXDzU55nQM4
         DVt5+FDBrtxFqXpiSNlpQ8kC97M0mXgu7ZfXOF8IKrpjq3rNKU0bGENQ0/fQJpLBw6kE
         4mwPegHgXAKZNRO4AuBPWhkQc3PNnQJBs1qiDsT9N5167Y/pj2tH9YgCpwECOfUjiVwK
         zmyTGzdqKMWgjH3o6nHhNv2GIxKa5ADQElPK/1lLquGko9uS+vF+xdUQiImV7MRVhmoH
         fsbA==
X-Gm-Message-State: AOJu0YztXPrhPpoYg1dXgdcYndrcj7aW+PDLDBYeV2HT3ZEgSBqzPQgJ
	TgKHMlAvQo4MCrZk8EOzE7s=
X-Google-Smtp-Source: AGHT+IE+sCuWLXpMpKKSnIlfOUq+4N22pU9jPx36Nsbry/7Ty+ZgoJU7ODY9iOR5ZJrkAcpV+SNbSw==
X-Received: by 2002:a05:600c:4ecb:b0:3fe:1fd9:bedf with SMTP id g11-20020a05600c4ecb00b003fe1fd9bedfmr4798254wmq.11.1697634647542;
        Wed, 18 Oct 2023 06:10:47 -0700 (PDT)
Received: from localhost.localdomain (93-34-89-13.ip49.fastwebnet.it. [93.34.89.13])
        by smtp.googlemail.com with ESMTPSA id u6-20020a05600c138600b004064288597bsm1677426wmf.30.2023.10.18.06.10.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Oct 2023 06:10:47 -0700 (PDT)
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
Subject: [PATCH v2 6/6] wifi: mt76: permit to load precal from NVMEM cell for mt7915
Date: Wed, 18 Oct 2023 15:09:42 +0200
Message-Id: <20231018130942.31187-6-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20231018130942.31187-1-ansuelsmth@gmail.com>
References: <20231018130942.31187-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231018_061050_641470_0FA1D32B 
X-CRM114-Status: GOOD (  12.14  )
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

Permit to load precal from NVMEM cell for mt7915. The NVMEM cell must be
named "precal" to be correctly loaded.

NVMEM cell must already account the correct offset and be placed after
the EEPROM as the function expect the data right from the start.

Tested-by: Shiji Yang <yangshiji66@outlook.com>
Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 drivers/net/wireless/mediatek/mt76/mt7915/eeprom.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/eeprom.c b/drivers/net/wireless/mediatek/mt76/mt7915/eeprom.c
index 5228f710b3da..3bb2643d1b26 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/eeprom.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/eeprom.c
@@ -11,6 +11,7 @@ static int mt7915_eeprom_load_precal(struct mt7915_dev *dev)
 	u8 *eeprom = mdev->eeprom.data;
 	u32 val = eeprom[MT_EE_DO_PRE_CAL];
 	u32 offs;
+	int ret;
 
 	if (!dev->flash_mode)
 		return 0;
@@ -25,7 +26,11 @@ static int mt7915_eeprom_load_precal(struct mt7915_dev *dev)
 
 	offs = is_mt7915(&dev->mt76) ? MT_EE_PRECAL : MT_EE_PRECAL_V2;
 
-	return mt76_get_of_data_from_mtd(mdev, dev->cal, offs, val);
+	ret = mt76_get_of_data_from_mtd(mdev, dev->cal, offs, val);
+	if (!ret)
+		return ret;
+
+	return mt76_get_of_data_from_nvmem(mdev, dev->cal, "precal", val);
 }
 
 static int mt7915_check_eeprom(struct mt7915_dev *dev)
-- 
2.40.1


