Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF4B6C41513
	for <linux-mediatek@archiver.kernel.org>; Sat,  6 Jul 2024 08:28:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VBS3wbdRxNhopEBbNwl9R2AdLE3ypdIAsNxw00p9SqU=; b=ZVu3c49lzvwCncY2xa1kr+yRRa
	UPDhZBp7RTkVEYefVZ595wVKeAye+/H5j6HyfaFGH0p1M1YfuK4StSTZSPx6xtrzO8/PyLJVJfxgw
	2CmyRZOxN31h+PgDNpAz5nsWui7eFgC38CMj75B7rtAmpI4ghqnSgteFH/gKzzNsEAYJZoGlLgbZ/
	/kMF2WehwM7mJ1L0thxVHGnG89y0C1t/jSjFSlywlwzTo7d531u6RkDU9IeNE/1KvkLYlVnrYet5g
	8hYlUT47X2GQ0XvwJhfw2IDJ/fSZevjOUyvQvVq9wI9LQGyWW6vx1BwZGedHgPS30/aCGqTA/+LuK
	rjg+Nl0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sQ0mQ-0000000HXeu-0Bsi;
	Sat, 06 Jul 2024 08:28:26 +0000
Received: from mail-oa1-f53.google.com ([209.85.160.53])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sQ0mN-0000000HXe0-0g2m
	for linux-mediatek@lists.infradead.org;
	Sat, 06 Jul 2024 08:28:24 +0000
Received: by mail-oa1-f53.google.com with SMTP id 586e51a60fabf-25e19660ffeso38923fac.2
        for <linux-mediatek@lists.infradead.org>; Sat, 06 Jul 2024 01:28:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720254502; x=1720859302;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VBS3wbdRxNhopEBbNwl9R2AdLE3ypdIAsNxw00p9SqU=;
        b=MLTMrg1TjJZ14okvYbEt95+/BYLXkAf27bRqtdNcZm71YEpK4MX02dmuZMFAm2CPvh
         xzfmJlDJKJi+ZKg5zwiOKx1hnTljxeMsgSX+WX9OFF3bmAXJlkokocV+Jkfg5F3IQn37
         +Li0eNiWj/1Qa9gLe1DUofTKIpJw5RX/6yFqkh1TutYaXCdjRiCKrahIBedvY8VdPj/b
         nDpH9umhZpGxlVArur0JJBiwezVIcDAtlDxNKkkrXXLhftBk879DnQs1P9LkFJfMR7iv
         IYm70cseurjA+uY5FTUJ6rP872H2H+SxwHDq+eBQCtH1LZnKMbbTdEKyyuCLMmISLIGF
         4oSg==
X-Forwarded-Encrypted: i=1; AJvYcCUMVA6E0BPaeyWUaO7PHlOSdJERJ0/uxY3/hkKlH5CsXKMqQGFWInp338QaregL1/JYBXNbvnv7RfTN5igB09kZywYll4wiUljK4mdXEri7lZU0
X-Gm-Message-State: AOJu0Yw9+tTtn1DiILrjXM7rCd3RS/lp/bM1XrFn8wwOnFt8IGyjzd+E
	f5WoNtTVuUbcrEDBF+tMU84O/Oa14VyVb1OYpu4YN29vFyoJ7ZNI
X-Google-Smtp-Source: AGHT+IEk6eY+anZuLZtshXs5jcY3ZABNoDdpwliXhfVBQqinwJqJUuK5I+eA1bn/Byd1GVaRQ7nPXQ==
X-Received: by 2002:a05:6871:588c:b0:25e:2624:eb5f with SMTP id 586e51a60fabf-25e2b8cf269mr6539491fac.1.1720254502068;
        Sat, 06 Jul 2024 01:28:22 -0700 (PDT)
Received: from sean-ThinkPad-T450s.attlocal.net ([2600:1702:5083:7610:1e13:57ab:ecc5:1fd4])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-25e71070ba1sm10744fac.34.2024.07.06.01.28.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 06 Jul 2024 01:28:20 -0700 (PDT)
From: sean.wang@kernel.org
To: nbd@nbd.name,
	lorenzo.bianconi@redhat.com
Cc: sean.wang@mediatek.com,
	deren.wu@mediatek.com,
	mingyen.hsieh@mediatek.com,
	linux-wireless@vger.kernel.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH v2 01/37] wifi: mt76: mt7925: update mt76_connac_mcu_uni_add_dev for MLO
Date: Sat,  6 Jul 2024 01:27:41 -0700
Message-Id: <5c184808c54b4e71c6feec05828a9f1f5be9b14d.1720248331.git.sean.wang@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1720248331.git.sean.wang@kernel.org>
References: <cover.1720248331.git.sean.wang@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240706_012823_228271_6DAD026F 
X-CRM114-Status: GOOD (  10.69  )
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

Set OMAC address with the per-link BSS. The change remains compatible with
the non-MLO mode and the older firmware.

Co-developed-by: Ming Yen Hsieh <mingyen.hsieh@mediatek.com>
Signed-off-by: Ming Yen Hsieh <mingyen.hsieh@mediatek.com>
Co-developed-by: Deren Wu <deren.wu@mediatek.com>
Signed-off-by: Deren Wu <deren.wu@mediatek.com>
Signed-off-by: Sean Wang <sean.wang@mediatek.com>
---
 drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c b/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c
index 4e3c8af98fe7..18801aaf6764 100644
--- a/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c
@@ -4,6 +4,7 @@
 #include <linux/firmware.h>
 #include "mt76_connac2_mac.h"
 #include "mt76_connac_mcu.h"
+#include "mt792x.h"
 
 int mt76_connac_mcu_start_firmware(struct mt76_dev *dev, u32 addr, u32 option)
 {
@@ -1141,7 +1142,8 @@ int mt76_connac_mcu_uni_add_dev(struct mt76_phy *phy,
 				struct mt76_wcid *wcid,
 				bool enable)
 {
-	struct mt76_vif *mvif = (struct mt76_vif *)bss_conf->vif->drv_priv;
+	struct mt792x_bss_conf *mconf = mt792x_link_conf_to_mconf(bss_conf);
+	struct mt76_vif *mvif = &mconf->mt76;
 	struct mt76_dev *dev = phy->dev;
 	struct {
 		struct {
@@ -1214,7 +1216,7 @@ int mt76_connac_mcu_uni_add_dev(struct mt76_phy *phy,
 	idx = mvif->omac_idx > EXT_BSSID_START ? HW_BSSID_0 : mvif->omac_idx;
 	basic_req.basic.hw_bss_idx = idx;
 
-	memcpy(dev_req.tlv.omac_addr, bss_conf->vif->addr, ETH_ALEN);
+	memcpy(dev_req.tlv.omac_addr, bss_conf->addr, ETH_ALEN);
 
 	cmd = enable ? MCU_UNI_CMD(DEV_INFO_UPDATE) : MCU_UNI_CMD(BSS_INFO_UPDATE);
 	data = enable ? (void *)&dev_req : (void *)&basic_req;
-- 
2.25.1


