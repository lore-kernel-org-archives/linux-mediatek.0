Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC6A6CDB474
	for <linux-mediatek@archiver.kernel.org>; Tue, 17 Oct 2023 19:28:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+0xHAajk9RnoZnMNxnlpPx/L53pYS94eDmnmY1A3Dok=; b=zOAJ7jAuaf7QcORPUWGBWjBsVe
	aUwANWDLPSHqPU2c+zY0RZEB/jEOECCESQo2jCoR2CTFx6hFHtFKQOqN+M1YAZhzwZwmrqg6HAFSx
	jlqtew4aE0r/uAUkjUSH5smWxfmPJW9scJPGizBh+KbtuFKXcmDnpFcBvucdJm821YHOGN9o7HC6x
	H9zIcOtczqyymarRpS9HWEbwh7nxzP/1ibS2Tpse1W9cqMjedPwUya+Ezkg+d5OGpFSMJJcGS6ZCo
	eNsGbPtFvufG28fLoc+EVnRJbR+Z2ejqkGUhQiN3MA7GXdSNDrsdgaP9YtOcm+DtD8SsmYHgVR3X6
	WLSLEFcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qspjX-00D5pp-2M;
	Tue, 17 Oct 2023 19:28:03 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qspjP-00D5j7-0S;
	Tue, 17 Oct 2023 19:27:56 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-405361bb94eso66706845e9.0;
        Tue, 17 Oct 2023 12:27:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697570871; x=1698175671; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+0xHAajk9RnoZnMNxnlpPx/L53pYS94eDmnmY1A3Dok=;
        b=EeFQEhfJLMJ8QEju3t8qXiqSDMtHRbUi6o/sHyioGb/VLbIBLoe1D+2RSRZAK1tG4O
         kdIUPcNIopgK7tMO9yP7AiaLKo6GNG3SaOOKaDmZrsVZJnnFJIMT0C7nuv3TDfSWZNb0
         MrEr61iujXrEoApT0u/C/mOK9q55IJTu+8bEXdypJ8DyZ6O74vXF0IahbFt/SepgFs4P
         4B1CkEl/Ipca/s5P3h8gLQ9G2467Si+EZ36ZkaQZkSvRAqBUVs+YDoDcuKpVP7bldpG0
         A5ItGKT0AoK95IwyehCWPdCM4UdGs9noOnkrr46ja8HlSR4HBHTOFZNYskto6Zvm6eXT
         JRpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697570871; x=1698175671;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+0xHAajk9RnoZnMNxnlpPx/L53pYS94eDmnmY1A3Dok=;
        b=m7jqMZydMGLTBhD0hQZDwT5j5XvGHPzkYcq0ZPp2ezu15yRWFMLWrsHcjjMYR5UcoK
         TCSvgMw1tVnVDolr91yXTHKdRT61U/DCNzgzhC93lXDRQRLUFDOOvYzIbc9HQwxHOTIn
         BgZoRhzn8z9V45N3JZ+3D6b77HX18OHfFhEXF5Rei3iiMzeDb5Vfq+tyomehtdMClxTt
         vngMAWDNSLI/QBcdAW3vLkd8cqGu8ST8MB4JPcmo7dl7iFZP0GSe7gbOGg8WGQHWgeIP
         OjMKjKleYru2gVIgGMAqo4iWJxlTss+3UmP8hfHUSQwOM9SdBw+/8mQJABpwBjPmxk6f
         9uDg==
X-Gm-Message-State: AOJu0Yz1tQMJ+h2vW0T/LCBpsl3CnZEYdpTRrUvkgVvUgqC60FoU10jx
	udiNdF4IioSIGA34/+RV2UQ=
X-Google-Smtp-Source: AGHT+IHzX9yaXcV3QWlXu9GSfGAVCIcJ0SoqRGEZUbBLGj/4l7W7+zG+ktg0AVC5pcCKK+R9qYOBXQ==
X-Received: by 2002:a5d:5947:0:b0:32d:9e4f:7190 with SMTP id e7-20020a5d5947000000b0032d9e4f7190mr2723978wri.60.1697570871353;
        Tue, 17 Oct 2023 12:27:51 -0700 (PDT)
Received: from localhost.localdomain (93-34-89-13.ip49.fastwebnet.it. [93.34.89.13])
        by smtp.googlemail.com with ESMTPSA id o2-20020adfeac2000000b0032cc35c2ef7sm435897wrn.29.2023.10.17.12.27.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Oct 2023 12:27:51 -0700 (PDT)
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
Subject: [net-next RFC PATCH 3/6] wifi: mt76: limit support of precal loading for mt7915 to MTD only
Date: Tue, 17 Oct 2023 21:05:07 +0200
Message-Id: <20231017190510.27163-3-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20231017190510.27163-1-ansuelsmth@gmail.com>
References: <20231017190510.27163-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231017_122755_178547_AE8C7C56 
X-CRM114-Status: GOOD (  14.93  )
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


