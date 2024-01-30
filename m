Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12EC2C46CD2
	for <linux-mediatek@archiver.kernel.org>; Tue, 30 Jan 2024 10:45:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bpiXd8yOdGb/x61CqjHFkTx8CPpwJCc0noD+q8kgsCo=; b=apPan/xk7dchANhOmaagHudw7b
	a8iIJsSmvsP7V4FBQwS8eMlurLMRLPZAH2+yE4ijPqL/bTVkm/264MeIJQRQBuAonpHkXHC4L0267
	7R3LWZoyUpI2BIC7fP6iGY6glW88nSDdOec1ff7LfspSmVcCWZWNP5/a8xtPjU6m7oj0VDrMpAqXA
	SFL+5jZOSeYIJAakvTkyHdXZulCBWed0H3BBYQVn0t6Sj8o80HDzi5yda4AKfypEx8ePu1BsO66Qg
	44L8b0RxDd9CV+tidQmRvgbEmWb4U+6jT2eqGvvcvLYpd4M9jQlrfLVjn3x+LTP4J1b+Tl1qI7RVK
	w5HWdYcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rUlc4-0000000GFfa-34V3;
	Tue, 30 Jan 2024 10:45:08 +0000
Received: from mail-ej1-f51.google.com ([209.85.218.51])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rUlc1-0000000GFeI-0YTZ;
	Tue, 30 Jan 2024 10:45:06 +0000
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-a34c5ca2537so416118766b.0;
        Tue, 30 Jan 2024 02:45:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706611504; x=1707216304;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bpiXd8yOdGb/x61CqjHFkTx8CPpwJCc0noD+q8kgsCo=;
        b=ayRdnMEAInpzFMbj70x1VjHZTn6YqmMv0Fpuep/ySiQ+gqVE/heuduk2BSwNZUFomS
         E0qJ6Nz+wDpoVfyOOQLMstE6buFXpwpwEfS1gNxf3J3UHeU3oHAS1weVQFKGhae2JrwG
         gmrCNgJq9spvRtS7uHBYUYhBy9D2uGraxEbhkkc3wc6XZ8zX4I77H0wvy9Evh5N1FmSM
         oRj5YuPsWsBITnFSYR3i23uk6apLAI3MF5ul9zflA3CYpNVVuzlSqCUas3P+7ooQrC05
         pgGnADcQIJLAGn3L6RAk71cKMI77YUZm4R1X8ubL5yRo3XYwSD/Y3XGhmUs6rx7wLZTY
         n/0g==
X-Gm-Message-State: AOJu0YxND/5LGmZG/s7Mu/WO783ysHxtg8yT6p00QJRDUQN6auA19LiU
	+HqSr6+FazAEJFVb+zKKfznjxWNnBqEGBvV13Up3dZ2elvhWIt+y
X-Google-Smtp-Source: AGHT+IH5NtmX2UOIfAAIqb81xRoM9I1TXzG17zteYGxFxOGSK55yXkMKy5dfKhHKdZCzYWeoQRbE1Q==
X-Received: by 2002:a17:906:abc9:b0:a35:70a0:cdc9 with SMTP id kq9-20020a170906abc900b00a3570a0cdc9mr4837674ejb.29.1706611503611;
        Tue, 30 Jan 2024 02:45:03 -0800 (PST)
Received: from localhost (fwdproxy-lla-111.fbsv.net. [2a03:2880:30ff:6f::face:b00c])
        by smtp.gmail.com with ESMTPSA id s6-20020a170906bc4600b00a35512c7fa7sm3617964ejv.216.2024.01.30.02.45.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jan 2024 02:45:03 -0800 (PST)
From: Breno Leitao <leitao@debian.org>
To: kuba@kernel.org,
	davem@davemloft.net,
	pabeni@redhat.com,
	edumazet@google.com,
	Felix Fietkau <nbd@nbd.name>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Ryder Lee <ryder.lee@mediatek.com>,
	Shayne Chen <shayne.chen@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Kalle Valo <kvalo@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: dsahern@kernel.org,
	weiwan@google.com,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	horms@kernel.org,
	andrew@lunn.ch,
	leit@fb.com,
	Deren Wu <deren.wu@mediatek.com>,
	Wang Zhao <wang.zhao@mediatek.com>,
	Sujuan Chen <sujuan.chen@mediatek.com>,
	Peter Chiu <chui-hao.chiu@mediatek.com>,
	Alexander Couzens <lynxis@fe80.eu>,
	Ming Yen Hsieh <mingyen.hsieh@mediatek.com>,
	Neil Chen <yn.chen@mediatek.com>,
	Quan Zhou <quan.zhou@mediatek.com>,
	Dongliang Mu <dzm91@hust.edu.cn>,
	Chuanhong Guo <gch981213@gmail.com>,
	Reese Russell <git@qrsnap.io>,
	Jiefeng Li <jiefeng_li@hust.edu.cn>,
	Nelson Yu <nelson.yu@mediatek.com>,
	Rong Yan <rong.yan@mediatek.com>,
	Bo Jiao <Bo.Jiao@mediatek.com>,
	StanleyYP Wang <StanleyYP.Wang@mediatek.com>,
	linux-wireless@vger.kernel.org (open list:MEDIATEK MT76 WIRELESS LAN DRIVER),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/Mediatek SoC support),
	linux-mediatek@lists.infradead.org (moderated list:ARM/Mediatek SoC support)
Subject: [PATCH net 9/9] wifi: fill in MODULE_DESCRIPTION()s for mt76 drivers
Date: Tue, 30 Jan 2024 02:42:43 -0800
Message-Id: <20240130104243.3025393-10-leitao@debian.org>
X-Mailer: git-send-email 2.39.3
In-Reply-To: <20240130104243.3025393-1-leitao@debian.org>
References: <20240130104243.3025393-1-leitao@debian.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240130_024505_337020_3FA6B702 
X-CRM114-Status: GOOD (  11.41  )
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

W=1 builds now warn if module is built without a MODULE_DESCRIPTION().
Add descriptions to the MediaTek mt76 drivers.

Here is a sorted list of descriptions. It might make the reviewing
process easier.

	MODULE_DESCRIPTION("MediaTek MT7603E and MT76x8 wireless driver");
	MODULE_DESCRIPTION("MediaTek MT7615E and MT7663E wireless driver");
	MODULE_DESCRIPTION("MediaTek MT7615E MMIO helpers");
	MODULE_DESCRIPTION("MediaTek MT7663 SDIO/USB helpers");
	MODULE_DESCRIPTION("MediaTek MT7663S (SDIO) wireless driver");
	MODULE_DESCRIPTION("MediaTek MT7663U (USB) wireless driver");
	MODULE_DESCRIPTION("MediaTek MT76x02 helpers");
	MODULE_DESCRIPTION("MediaTek MT76x02 MCU helpers");
	MODULE_DESCRIPTION("MediaTek MT76x0E (PCIe) wireless driver");
	MODULE_DESCRIPTION("MediaTek MT76x0U (USB) wireless driver");
	MODULE_DESCRIPTION("MediaTek MT76x2 EEPROM helpers");
	MODULE_DESCRIPTION("MediaTek MT76x2E (PCIe) wireless driver");
	MODULE_DESCRIPTION("MediaTek MT76x2U (USB) wireless driver");
	MODULE_DESCRIPTION("MediaTek MT76x connac layer helpers");
	MODULE_DESCRIPTION("MediaTek MT76x EEPROM helpers");
	MODULE_DESCRIPTION("MediaTek MT76x helpers");
	MODULE_DESCRIPTION("MediaTek MT76x SDIO helpers");
	MODULE_DESCRIPTION("MediaTek MT76x USB helpers");
	MODULE_DESCRIPTION("MediaTek MT7915E MMIO helpers");
	MODULE_DESCRIPTION("MediaTek MT7921 core driver");
	MODULE_DESCRIPTION("MediaTek MT7921E (PCIe) wireless driver");
	MODULE_DESCRIPTION("MediaTek MT7921S (SDIO) wireless driver");
	MODULE_DESCRIPTION("MediaTek MT7921U (USB) wireless driver");
	MODULE_DESCRIPTION("MediaTek MT7925 core driver");
	MODULE_DESCRIPTION("MediaTek MT7925E (PCIe) wireless driver");
	MODULE_DESCRIPTION("MediaTek MT7925U (USB) wireless driver");
	MODULE_DESCRIPTION("MediaTek MT792x core driver");
	MODULE_DESCRIPTION("MediaTek MT792x USB helpers");
	MODULE_DESCRIPTION("MediaTek MT7996 MMIO helpers");

Signed-off-by: Breno Leitao <leitao@debian.org>
---
 drivers/net/wireless/mediatek/mt76/mt7603/main.c     | 1 +
 drivers/net/wireless/mediatek/mt76/mt7615/main.c     | 1 +
 drivers/net/wireless/mediatek/mt76/mt7615/mmio.c     | 1 +
 drivers/net/wireless/mediatek/mt76/mt7615/sdio.c     | 1 +
 drivers/net/wireless/mediatek/mt76/mt7615/usb.c      | 1 +
 drivers/net/wireless/mediatek/mt76/mt7615/usb_sdio.c | 1 +
 drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c | 1 +
 drivers/net/wireless/mediatek/mt76/mt76x0/eeprom.c   | 1 +
 drivers/net/wireless/mediatek/mt76/mt76x0/pci.c      | 1 +
 drivers/net/wireless/mediatek/mt76/mt76x0/usb.c      | 1 +
 drivers/net/wireless/mediatek/mt76/mt76x02_usb_mcu.c | 1 +
 drivers/net/wireless/mediatek/mt76/mt76x02_util.c    | 1 +
 drivers/net/wireless/mediatek/mt76/mt76x2/eeprom.c   | 1 +
 drivers/net/wireless/mediatek/mt76/mt76x2/pci.c      | 1 +
 drivers/net/wireless/mediatek/mt76/mt76x2/usb.c      | 1 +
 drivers/net/wireless/mediatek/mt76/mt7915/mmio.c     | 1 +
 drivers/net/wireless/mediatek/mt76/mt7921/main.c     | 1 +
 drivers/net/wireless/mediatek/mt76/mt7921/pci.c      | 1 +
 drivers/net/wireless/mediatek/mt76/mt7921/sdio.c     | 1 +
 drivers/net/wireless/mediatek/mt76/mt7921/usb.c      | 1 +
 drivers/net/wireless/mediatek/mt76/mt7925/main.c     | 1 +
 drivers/net/wireless/mediatek/mt76/mt7925/pci.c      | 1 +
 drivers/net/wireless/mediatek/mt76/mt7925/usb.c      | 1 +
 drivers/net/wireless/mediatek/mt76/mt792x_core.c     | 1 +
 drivers/net/wireless/mediatek/mt76/mt792x_usb.c      | 1 +
 drivers/net/wireless/mediatek/mt76/mt7996/mmio.c     | 1 +
 drivers/net/wireless/mediatek/mt76/sdio.c            | 1 +
 drivers/net/wireless/mediatek/mt76/usb.c             | 1 +
 drivers/net/wireless/mediatek/mt76/util.c            | 1 +
 29 files changed, 29 insertions(+)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7603/main.c b/drivers/net/wireless/mediatek/mt76/mt7603/main.c
index 89d738deea62..e2146d30e553 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7603/main.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7603/main.c
@@ -728,6 +728,7 @@ const struct ieee80211_ops mt7603_ops = {
 	.set_sar_specs = mt7603_set_sar_specs,
 };
 
+MODULE_DESCRIPTION("MediaTek MT7603E and MT76x8 wireless driver");
 MODULE_LICENSE("Dual BSD/GPL");
 
 static int __init mt7603_init(void)
diff --git a/drivers/net/wireless/mediatek/mt76/mt7615/main.c b/drivers/net/wireless/mediatek/mt76/mt7615/main.c
index dab16b5fc386..0971c164b57e 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7615/main.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7615/main.c
@@ -1375,4 +1375,5 @@ const struct ieee80211_ops mt7615_ops = {
 };
 EXPORT_SYMBOL_GPL(mt7615_ops);
 
+MODULE_DESCRIPTION("MediaTek MT7615E and MT7663E wireless driver");
 MODULE_LICENSE("Dual BSD/GPL");
diff --git a/drivers/net/wireless/mediatek/mt76/mt7615/mmio.c b/drivers/net/wireless/mediatek/mt76/mt7615/mmio.c
index ac036a072439..87a956ea3ad7 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7615/mmio.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7615/mmio.c
@@ -270,4 +270,5 @@ static void __exit mt7615_exit(void)
 
 module_init(mt7615_init);
 module_exit(mt7615_exit);
+MODULE_DESCRIPTION("MediaTek MT7615E MMIO helpers");
 MODULE_LICENSE("Dual BSD/GPL");
diff --git a/drivers/net/wireless/mediatek/mt76/mt7615/sdio.c b/drivers/net/wireless/mediatek/mt76/mt7615/sdio.c
index 67cedd2555f9..9692890ba51b 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7615/sdio.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7615/sdio.c
@@ -253,4 +253,5 @@ module_sdio_driver(mt7663s_driver);
 
 MODULE_AUTHOR("Sean Wang <sean.wang@mediatek.com>");
 MODULE_AUTHOR("Lorenzo Bianconi <lorenzo@kernel.org>");
+MODULE_DESCRIPTION("MediaTek MT7663S (SDIO) wireless driver");
 MODULE_LICENSE("Dual BSD/GPL");
diff --git a/drivers/net/wireless/mediatek/mt76/mt7615/usb.c b/drivers/net/wireless/mediatek/mt76/mt7615/usb.c
index 04963b9f7498..df737e1ff27b 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7615/usb.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7615/usb.c
@@ -281,4 +281,5 @@ module_usb_driver(mt7663u_driver);
 
 MODULE_AUTHOR("Sean Wang <sean.wang@mediatek.com>");
 MODULE_AUTHOR("Lorenzo Bianconi <lorenzo@kernel.org>");
+MODULE_DESCRIPTION("MediaTek MT7663U (USB) wireless driver");
 MODULE_LICENSE("Dual BSD/GPL");
diff --git a/drivers/net/wireless/mediatek/mt76/mt7615/usb_sdio.c b/drivers/net/wireless/mediatek/mt76/mt7615/usb_sdio.c
index 0052d103e276..820b39590027 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7615/usb_sdio.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7615/usb_sdio.c
@@ -349,4 +349,5 @@ EXPORT_SYMBOL_GPL(mt7663_usb_sdio_register_device);
 
 MODULE_AUTHOR("Lorenzo Bianconi <lorenzo@kernel.org>");
 MODULE_AUTHOR("Sean Wang <sean.wang@mediatek.com>");
+MODULE_DESCRIPTION("MediaTek MT7663 SDIO/USB helpers");
 MODULE_LICENSE("Dual BSD/GPL");
diff --git a/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c b/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c
index 96494ba2fdf7..3a20ba0d2492 100644
--- a/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c
@@ -3160,4 +3160,5 @@ int mt76_connac2_mcu_fill_message(struct mt76_dev *dev, struct sk_buff *skb,
 EXPORT_SYMBOL_GPL(mt76_connac2_mcu_fill_message);
 
 MODULE_AUTHOR("Lorenzo Bianconi <lorenzo@kernel.org>");
+MODULE_DESCRIPTION("MediaTek MT76x connac layer helpers");
 MODULE_LICENSE("Dual BSD/GPL");
diff --git a/drivers/net/wireless/mediatek/mt76/mt76x0/eeprom.c b/drivers/net/wireless/mediatek/mt76/mt76x0/eeprom.c
index c3a392a1a659..bcd24c9072ec 100644
--- a/drivers/net/wireless/mediatek/mt76/mt76x0/eeprom.c
+++ b/drivers/net/wireless/mediatek/mt76/mt76x0/eeprom.c
@@ -342,4 +342,5 @@ int mt76x0_eeprom_init(struct mt76x02_dev *dev)
 	return 0;
 }
 
+MODULE_DESCRIPTION("MediaTek MT76x EEPROM helpers");
 MODULE_LICENSE("Dual BSD/GPL");
diff --git a/drivers/net/wireless/mediatek/mt76/mt76x0/pci.c b/drivers/net/wireless/mediatek/mt76/mt76x0/pci.c
index 9277ff38b7a2..293e66fa83d5 100644
--- a/drivers/net/wireless/mediatek/mt76/mt76x0/pci.c
+++ b/drivers/net/wireless/mediatek/mt76/mt76x0/pci.c
@@ -302,6 +302,7 @@ static const struct pci_device_id mt76x0e_device_table[] = {
 MODULE_DEVICE_TABLE(pci, mt76x0e_device_table);
 MODULE_FIRMWARE(MT7610E_FIRMWARE);
 MODULE_FIRMWARE(MT7650E_FIRMWARE);
+MODULE_DESCRIPTION("MediaTek MT76x0E (PCIe) wireless driver");
 MODULE_LICENSE("Dual BSD/GPL");
 
 static struct pci_driver mt76x0e_driver = {
diff --git a/drivers/net/wireless/mediatek/mt76/mt76x0/usb.c b/drivers/net/wireless/mediatek/mt76/mt76x0/usb.c
index 0422c332354a..dd042949cf82 100644
--- a/drivers/net/wireless/mediatek/mt76/mt76x0/usb.c
+++ b/drivers/net/wireless/mediatek/mt76/mt76x0/usb.c
@@ -336,6 +336,7 @@ static int __maybe_unused mt76x0_resume(struct usb_interface *usb_intf)
 MODULE_DEVICE_TABLE(usb, mt76x0_device_table);
 MODULE_FIRMWARE(MT7610E_FIRMWARE);
 MODULE_FIRMWARE(MT7610U_FIRMWARE);
+MODULE_DESCRIPTION("MediaTek MT76x0U (USB) wireless driver");
 MODULE_LICENSE("GPL");
 
 static struct usb_driver mt76x0_driver = {
diff --git a/drivers/net/wireless/mediatek/mt76/mt76x02_usb_mcu.c b/drivers/net/wireless/mediatek/mt76/mt76x02_usb_mcu.c
index 02da543dfc5c..b2cc44914294 100644
--- a/drivers/net/wireless/mediatek/mt76/mt76x02_usb_mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt76x02_usb_mcu.c
@@ -293,4 +293,5 @@ void mt76x02u_init_mcu(struct mt76_dev *dev)
 EXPORT_SYMBOL_GPL(mt76x02u_init_mcu);
 
 MODULE_AUTHOR("Lorenzo Bianconi <lorenzo.bianconi83@gmail.com>");
+MODULE_DESCRIPTION("MediaTek MT76x02 MCU helpers");
 MODULE_LICENSE("Dual BSD/GPL");
diff --git a/drivers/net/wireless/mediatek/mt76/mt76x02_util.c b/drivers/net/wireless/mediatek/mt76/mt76x02_util.c
index 8a0e8124b894..8020446be37b 100644
--- a/drivers/net/wireless/mediatek/mt76/mt76x02_util.c
+++ b/drivers/net/wireless/mediatek/mt76/mt76x02_util.c
@@ -696,4 +696,5 @@ void mt76x02_config_mac_addr_list(struct mt76x02_dev *dev)
 }
 EXPORT_SYMBOL_GPL(mt76x02_config_mac_addr_list);
 
+MODULE_DESCRIPTION("MediaTek MT76x02 helpers");
 MODULE_LICENSE("Dual BSD/GPL");
diff --git a/drivers/net/wireless/mediatek/mt76/mt76x2/eeprom.c b/drivers/net/wireless/mediatek/mt76/mt76x2/eeprom.c
index 8c01855885ce..1fe5f5a02f93 100644
--- a/drivers/net/wireless/mediatek/mt76/mt76x2/eeprom.c
+++ b/drivers/net/wireless/mediatek/mt76/mt76x2/eeprom.c
@@ -506,4 +506,5 @@ int mt76x2_eeprom_init(struct mt76x02_dev *dev)
 }
 EXPORT_SYMBOL_GPL(mt76x2_eeprom_init);
 
+MODULE_DESCRIPTION("MediaTek MT76x2 EEPROM helpers");
 MODULE_LICENSE("Dual BSD/GPL");
diff --git a/drivers/net/wireless/mediatek/mt76/mt76x2/pci.c b/drivers/net/wireless/mediatek/mt76/mt76x2/pci.c
index df85ebc6e1df..30959746e924 100644
--- a/drivers/net/wireless/mediatek/mt76/mt76x2/pci.c
+++ b/drivers/net/wireless/mediatek/mt76/mt76x2/pci.c
@@ -165,6 +165,7 @@ mt76x2e_resume(struct pci_dev *pdev)
 MODULE_DEVICE_TABLE(pci, mt76x2e_device_table);
 MODULE_FIRMWARE(MT7662_FIRMWARE);
 MODULE_FIRMWARE(MT7662_ROM_PATCH);
+MODULE_DESCRIPTION("MediaTek MT76x2E (PCIe) wireless driver");
 MODULE_LICENSE("Dual BSD/GPL");
 
 static struct pci_driver mt76pci_driver = {
diff --git a/drivers/net/wireless/mediatek/mt76/mt76x2/usb.c b/drivers/net/wireless/mediatek/mt76/mt76x2/usb.c
index 55068f3252ef..ca78e14251c2 100644
--- a/drivers/net/wireless/mediatek/mt76/mt76x2/usb.c
+++ b/drivers/net/wireless/mediatek/mt76/mt76x2/usb.c
@@ -147,4 +147,5 @@ static struct usb_driver mt76x2u_driver = {
 module_usb_driver(mt76x2u_driver);
 
 MODULE_AUTHOR("Lorenzo Bianconi <lorenzo.bianconi83@gmail.com>");
+MODULE_DESCRIPTION("MediaTek MT76x2U (USB) wireless driver");
 MODULE_LICENSE("Dual BSD/GPL");
diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/mmio.c b/drivers/net/wireless/mediatek/mt76/mt7915/mmio.c
index aff4f21e843d..3039f53e2245 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/mmio.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/mmio.c
@@ -958,4 +958,5 @@ static void __exit mt7915_exit(void)
 
 module_init(mt7915_init);
 module_exit(mt7915_exit);
+MODULE_DESCRIPTION("MediaTek MT7915E MMIO helpers");
 MODULE_LICENSE("Dual BSD/GPL");
diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/main.c b/drivers/net/wireless/mediatek/mt76/mt7921/main.c
index 0645417e0582..0d5adc5ddae3 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7921/main.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7921/main.c
@@ -1418,5 +1418,6 @@ const struct ieee80211_ops mt7921_ops = {
 };
 EXPORT_SYMBOL_GPL(mt7921_ops);
 
+MODULE_DESCRIPTION("MediaTek MT7921 core driver");
 MODULE_LICENSE("Dual BSD/GPL");
 MODULE_AUTHOR("Sean Wang <sean.wang@mediatek.com>");
diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/pci.c b/drivers/net/wireless/mediatek/mt76/mt7921/pci.c
index 57903c6e4f11..dde26f327478 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7921/pci.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7921/pci.c
@@ -544,4 +544,5 @@ MODULE_FIRMWARE(MT7922_FIRMWARE_WM);
 MODULE_FIRMWARE(MT7922_ROM_PATCH);
 MODULE_AUTHOR("Sean Wang <sean.wang@mediatek.com>");
 MODULE_AUTHOR("Lorenzo Bianconi <lorenzo@kernel.org>");
+MODULE_DESCRIPTION("MediaTek MT7921E (PCIe) wireless driver");
 MODULE_LICENSE("Dual BSD/GPL");
diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/sdio.c b/drivers/net/wireless/mediatek/mt76/mt7921/sdio.c
index 7591e54d2897..a9ce1e746b95 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7921/sdio.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7921/sdio.c
@@ -323,5 +323,6 @@ static struct sdio_driver mt7921s_driver = {
 	.drv.pm		= pm_sleep_ptr(&mt7921s_pm_ops),
 };
 module_sdio_driver(mt7921s_driver);
+MODULE_DESCRIPTION("MediaTek MT7921S (SDIO) wireless driver");
 MODULE_AUTHOR("Sean Wang <sean.wang@mediatek.com>");
 MODULE_LICENSE("Dual BSD/GPL");
diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/usb.c b/drivers/net/wireless/mediatek/mt76/mt7921/usb.c
index e5258c74fc07..8b7c03c47598 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7921/usb.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7921/usb.c
@@ -336,5 +336,6 @@ static struct usb_driver mt7921u_driver = {
 };
 module_usb_driver(mt7921u_driver);
 
+MODULE_DESCRIPTION("MediaTek MT7921U (USB) wireless driver");
 MODULE_AUTHOR("Lorenzo Bianconi <lorenzo@kernel.org>");
 MODULE_LICENSE("Dual BSD/GPL");
diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/main.c b/drivers/net/wireless/mediatek/mt76/mt7925/main.c
index 8f1075da4903..125a1be3cb64 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/main.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/main.c
@@ -1450,4 +1450,5 @@ const struct ieee80211_ops mt7925_ops = {
 EXPORT_SYMBOL_GPL(mt7925_ops);
 
 MODULE_AUTHOR("Deren Wu <deren.wu@mediatek.com>");
+MODULE_DESCRIPTION("MediaTek MT7925 core driver");
 MODULE_LICENSE("Dual BSD/GPL");
diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/pci.c b/drivers/net/wireless/mediatek/mt76/mt7925/pci.c
index 734f31ee40d3..1fd99a856541 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/pci.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/pci.c
@@ -583,4 +583,5 @@ MODULE_FIRMWARE(MT7925_FIRMWARE_WM);
 MODULE_FIRMWARE(MT7925_ROM_PATCH);
 MODULE_AUTHOR("Deren Wu <deren.wu@mediatek.com>");
 MODULE_AUTHOR("Lorenzo Bianconi <lorenzo@kernel.org>");
+MODULE_DESCRIPTION("MediaTek MT7925E (PCIe) wireless driver");
 MODULE_LICENSE("Dual BSD/GPL");
diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/usb.c b/drivers/net/wireless/mediatek/mt76/mt7925/usb.c
index 9b885c5b3ed5..1e0f094fc905 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/usb.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/usb.c
@@ -329,4 +329,5 @@ static struct usb_driver mt7925u_driver = {
 module_usb_driver(mt7925u_driver);
 
 MODULE_AUTHOR("Lorenzo Bianconi <lorenzo@kernel.org>");
+MODULE_DESCRIPTION("MediaTek MT7925U (USB) wireless driver");
 MODULE_LICENSE("Dual BSD/GPL");
diff --git a/drivers/net/wireless/mediatek/mt76/mt792x_core.c b/drivers/net/wireless/mediatek/mt76/mt792x_core.c
index 502be22dbe36..c42101aa9e45 100644
--- a/drivers/net/wireless/mediatek/mt76/mt792x_core.c
+++ b/drivers/net/wireless/mediatek/mt76/mt792x_core.c
@@ -862,5 +862,6 @@ int mt792x_load_firmware(struct mt792x_dev *dev)
 }
 EXPORT_SYMBOL_GPL(mt792x_load_firmware);
 
+MODULE_DESCRIPTION("MediaTek MT792x core driver");
 MODULE_LICENSE("Dual BSD/GPL");
 MODULE_AUTHOR("Lorenzo Bianconi <lorenzo@kernel.org>");
diff --git a/drivers/net/wireless/mediatek/mt76/mt792x_usb.c b/drivers/net/wireless/mediatek/mt76/mt792x_usb.c
index 2dd283caed36..589a3efb9f8c 100644
--- a/drivers/net/wireless/mediatek/mt76/mt792x_usb.c
+++ b/drivers/net/wireless/mediatek/mt76/mt792x_usb.c
@@ -314,5 +314,6 @@ void mt792xu_disconnect(struct usb_interface *usb_intf)
 }
 EXPORT_SYMBOL_GPL(mt792xu_disconnect);
 
+MODULE_DESCRIPTION("MediaTek MT792x USB helpers");
 MODULE_LICENSE("Dual BSD/GPL");
 MODULE_AUTHOR("Lorenzo Bianconi <lorenzo@kernel.org>");
diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/mmio.c b/drivers/net/wireless/mediatek/mt76/mt7996/mmio.c
index c50d89a445e9..9f2abfa273c9 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7996/mmio.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7996/mmio.c
@@ -650,4 +650,5 @@ static void __exit mt7996_exit(void)
 
 module_init(mt7996_init);
 module_exit(mt7996_exit);
+MODULE_DESCRIPTION("MediaTek MT7996 MMIO helpers");
 MODULE_LICENSE("Dual BSD/GPL");
diff --git a/drivers/net/wireless/mediatek/mt76/sdio.c b/drivers/net/wireless/mediatek/mt76/sdio.c
index c52d550f0c32..3e88798df017 100644
--- a/drivers/net/wireless/mediatek/mt76/sdio.c
+++ b/drivers/net/wireless/mediatek/mt76/sdio.c
@@ -672,4 +672,5 @@ EXPORT_SYMBOL_GPL(mt76s_init);
 
 MODULE_AUTHOR("Sean Wang <sean.wang@mediatek.com>");
 MODULE_AUTHOR("Lorenzo Bianconi <lorenzo@kernel.org>");
+MODULE_DESCRIPTION("MediaTek MT76x SDIO helpers");
 MODULE_LICENSE("Dual BSD/GPL");
diff --git a/drivers/net/wireless/mediatek/mt76/usb.c b/drivers/net/wireless/mediatek/mt76/usb.c
index 1584665fe3cb..5a0bcb5071bd 100644
--- a/drivers/net/wireless/mediatek/mt76/usb.c
+++ b/drivers/net/wireless/mediatek/mt76/usb.c
@@ -1128,4 +1128,5 @@ int mt76u_init(struct mt76_dev *dev, struct usb_interface *intf)
 EXPORT_SYMBOL_GPL(mt76u_init);
 
 MODULE_AUTHOR("Lorenzo Bianconi <lorenzo.bianconi83@gmail.com>");
+MODULE_DESCRIPTION("MediaTek MT76x USB helpers");
 MODULE_LICENSE("Dual BSD/GPL");
diff --git a/drivers/net/wireless/mediatek/mt76/util.c b/drivers/net/wireless/mediatek/mt76/util.c
index fc76c66ff1a5..d6c01a2dd198 100644
--- a/drivers/net/wireless/mediatek/mt76/util.c
+++ b/drivers/net/wireless/mediatek/mt76/util.c
@@ -138,4 +138,5 @@ int __mt76_worker_fn(void *ptr)
 }
 EXPORT_SYMBOL_GPL(__mt76_worker_fn);
 
+MODULE_DESCRIPTION("MediaTek MT76x helpers");
 MODULE_LICENSE("Dual BSD/GPL");
-- 
2.39.3


