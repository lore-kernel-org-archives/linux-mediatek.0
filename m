Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DC64CDB483
	for <linux-mediatek@archiver.kernel.org>; Wed, 18 Oct 2023 13:10:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=I2HMXOLF5eJrUMENCt8aiW3aj9mFErqyM1uPwOqtdoQ=; b=3q0unKi/PeHYCcrAK5B33tRhpl
	zbrgvAsmquz2e/5bD4hlHFGC9Pds1FCMqyyN11r/wSEmmFrAx61l3N9OUAwxWWo+I9wF8y7UW9ewL
	p20dXy8HSVWiirtsKubG5kDGRS00ZMP1ynk11NcDIWEa4IWAbTycIAcyGZwTOit2aQiSQo7/f1IZW
	N6ttFdz+bo512iLnj+3jkOswAcHqzudVOI1GiPumfdm6tYrLEDaorGp3wKQ/VNZnJ91bG3Go+wwNB
	g7fc0Y4iYLpqOVpNkpHGi+Zf+HTf/4PSGYXdgFYDnJQI+iE1YV+Mrly9EACMQn47xq3fuuCckhpLN
	+bXC7bRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qt6K6-00EkQO-1j;
	Wed, 18 Oct 2023 13:10:54 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qt6Jx-00EkLQ-0g;
	Wed, 18 Oct 2023 13:10:46 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-40566f8a093so63965535e9.3;
        Wed, 18 Oct 2023 06:10:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697634642; x=1698239442; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=I2HMXOLF5eJrUMENCt8aiW3aj9mFErqyM1uPwOqtdoQ=;
        b=E8vXf6mHNfLuFT6eXCyQpNgmT0sztiQKH8ijM5KtcFpGB5WRtKOWPOp0csFgRSIqOG
         xncTiCEuYw4yY+m7YrWYDh2wCcQxZzF2iqnEZitAE79QU4KqAQU7NueJ8ePZ1qYDIp00
         S3ydM74q+Ipr7nHP06JdaoXBC874ThOXmrrgKdkn5MtTYSOqnOS13/cbrNjoQWm1zozk
         dob1Fh/Sr+kVy7e4h3iHZcmDYa5tuO9c/iRqpuK50Qfyam2Hrn90Chg+5HVixCKTl2lc
         etbmm8GzzU3GCm6EyvXvvUJDR7/4jwLoJrjWa6q54gd+XFLQB3LQ32vQL7v+Bl4bYQ3u
         WK1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697634642; x=1698239442;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=I2HMXOLF5eJrUMENCt8aiW3aj9mFErqyM1uPwOqtdoQ=;
        b=xM4tfADJv6rRqnJ882h6EZBek/9pkB2XJHkmkRZk5maJOfJyNbEp30wy8f6ZUYyQBD
         fds3gMK6Ur8/gpUPt/WtClk0J+1/W3fuWwh/o5Xv22GU7TqN17RhTQA3dfrJGxbGx72f
         Og/j/lpSYjgzE0Ue5WUP0a2YwGYDnierxtzP/ed8/T9CU3Y8REim2wglef2X7Zc1QiWx
         HHE9lakiJb8U4l2mlXOmy5w4VYTmA8KpAwr68jCECFFpTvN1XJ/RmAgfQCL1HcBGc+Td
         zUXOYcJqNs3sQmkjiA/7KCyGn1Z+aIPShw/YR/FaxnNxl3xD78DCOrjwch7ycUT+Mo9x
         YYQw==
X-Gm-Message-State: AOJu0YzzIZM9EjSAEHW87iMu7JPKHeUANdwFveQo/Lujjz6qUM/E4AKS
	mRl7adqSRfLpQxU/DRq2Ktk=
X-Google-Smtp-Source: AGHT+IGmg6G6k+IuVKLb4jSB/GGObbEUK/LFeHNrmueMinKJQgCi6tbVJYrMJG5JhYp3Ipf9kO4icw==
X-Received: by 2002:a05:600c:3112:b0:406:7d74:a2a4 with SMTP id g18-20020a05600c311200b004067d74a2a4mr4096893wmo.12.1697634642056;
        Wed, 18 Oct 2023 06:10:42 -0700 (PDT)
Received: from localhost.localdomain (93-34-89-13.ip49.fastwebnet.it. [93.34.89.13])
        by smtp.googlemail.com with ESMTPSA id u6-20020a05600c138600b004064288597bsm1677426wmf.30.2023.10.18.06.10.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Oct 2023 06:10:41 -0700 (PDT)
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
Subject: [PATCH v2 2/6] wifi: mt76: fix typo in mt76_get_of_eeprom_from_nvmem function
Date: Wed, 18 Oct 2023 15:09:38 +0200
Message-Id: <20231018130942.31187-2-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20231018130942.31187-1-ansuelsmth@gmail.com>
References: <20231018130942.31187-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231018_061045_255067_A303843A 
X-CRM114-Status: GOOD (  13.63  )
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

Fix typo in mt76_get_of_eeprom_from_nvmem where eeprom was misspelled as
epprom.

Fixes: 5bef3a406c6e ("wifi: mt76: add support for providing eeprom in nvmem cells")
Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 drivers/net/wireless/mediatek/mt76/eeprom.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/eeprom.c b/drivers/net/wireless/mediatek/mt76/eeprom.c
index 2558788f7ffb..1de3c734e136 100644
--- a/drivers/net/wireless/mediatek/mt76/eeprom.c
+++ b/drivers/net/wireless/mediatek/mt76/eeprom.c
@@ -106,7 +106,7 @@ static int mt76_get_of_epprom_from_mtd(struct mt76_dev *dev, void *eep, int offs
 #endif
 }
 
-static int mt76_get_of_epprom_from_nvmem(struct mt76_dev *dev, void *eep, int len)
+static int mt76_get_of_eeprom_from_nvmem(struct mt76_dev *dev, void *eep, int len)
 {
 	struct device_node *np = dev->dev->of_node;
 	struct nvmem_cell *cell;
@@ -153,7 +153,7 @@ int mt76_get_of_eeprom(struct mt76_dev *dev, void *eep, int offset, int len)
 	if (!ret)
 		return 0;
 
-	return mt76_get_of_epprom_from_nvmem(dev, eep, len);
+	return mt76_get_of_eeprom_from_nvmem(dev, eep, len);
 }
 EXPORT_SYMBOL_GPL(mt76_get_of_eeprom);
 
-- 
2.40.1


