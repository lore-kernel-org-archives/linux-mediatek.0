Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FDDAC46CD2
	for <linux-mediatek@archiver.kernel.org>; Tue, 30 Jan 2024 10:43:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ql0oyYDm/ONLDgpSOg+sQ97/Ipoz0ZGMbVNoqcIynPY=; b=lnI1sXpImIAGaGIG5KVP6FLCSo
	LE59qdByBbgnCJMgsyZsJUGQBs/nZshN24rMxeK65MKuo2+2E5U+/FyMnZG2vmDJ5PzeRQ/jURLIg
	vTs5ECyFmQdbVQr64OWYdXqsyVbzclROF8ceD76BKNjcXOXlCXsCiuhkbjKPvar3UTRU1OoGBBegF
	DxcIOSFsikrmPW4J9Qyph/7B3sLXNUfieGz2Z2TnOZXviQHNf5OhbLqE8eMcP3p1XdxPierm+zKLb
	e8CWhCDtMQAKR5rNDHK9uCGlfCUoMUcm5qEHs8k0BtpxUeklp1HbMlOjXn8HOSLfSaUfDBdwV5Ung
	DRzQ0e0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rUlaY-0000000GFHB-3lp1;
	Tue, 30 Jan 2024 10:43:34 +0000
Received: from mail-ej1-f41.google.com ([209.85.218.41])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rUlaV-0000000GFFW-3Mij;
	Tue, 30 Jan 2024 10:43:33 +0000
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-a3566c0309fso301212766b.1;
        Tue, 30 Jan 2024 02:43:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706611409; x=1707216209;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ql0oyYDm/ONLDgpSOg+sQ97/Ipoz0ZGMbVNoqcIynPY=;
        b=onxtfixBt1DVJGJFccmsEpFZM7ZNP2Un7RSB7spAkgCPG9Tr2dbMcouV9SCbpFs6Fw
         xf6YDTmBGEMYrsvufALnrMRcnfY/Dly5eelzm+bfDJPB6ZFw9OAEtcjLTwITN5v/REjH
         giaV2H4GE/trfSMNSg7e5pMnlm9WrbcUJ6Gb/TBx1SZMQoWBtbQ5CZx+PAdkde7XbI8C
         qy/WhRcdc7m6KoTZ5gpTad2FIgapxZAgGacuMWwSyatxk3EOYhhR2CklMGGWlSeChAVP
         LvpyzrfiGaueTJN1oXE6mAOyMgh6Gb8P3x4fGg/EEmTvW6/svrTtjpteX6Ljb/1tKeAT
         SpuA==
X-Gm-Message-State: AOJu0YzGOtZyTvFP0lyNJeJdH4NT8By9/PawFiOt9k9OOXiNJQoMJ5L2
	yMdKlzvUEZb/BQxS2jhYDiBqxTn7DmgWOnwsTcyIt94TtHRCFLHG
X-Google-Smtp-Source: AGHT+IEtxpY+u54zGhcCVwYX9YjdB+nRP8nrec/HVsZO+vZBGj/3TYmuPEqUfjAxkz+cHNpgDKF4+g==
X-Received: by 2002:a17:906:724b:b0:a28:8dc:455a with SMTP id n11-20020a170906724b00b00a2808dc455amr6190722ejk.48.1706611408740;
        Tue, 30 Jan 2024 02:43:28 -0800 (PST)
Received: from localhost (fwdproxy-lla-118.fbsv.net. [2a03:2880:30ff:76::face:b00c])
        by smtp.gmail.com with ESMTPSA id gy14-20020a170906f24e00b00a28f51adc39sm4968837ejb.61.2024.01.30.02.43.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jan 2024 02:43:28 -0800 (PST)
From: Breno Leitao <leitao@debian.org>
To: kuba@kernel.org,
	davem@davemloft.net,
	pabeni@redhat.com,
	edumazet@google.com,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: dsahern@kernel.org,
	weiwan@google.com,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	horms@kernel.org,
	andrew@lunn.ch,
	leit@fb.com,
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/Mediatek SoC support:Keyword:mediatek),
	linux-mediatek@lists.infradead.org (moderated list:ARM/Mediatek SoC support:Keyword:mediatek)
Subject: [PATCH net 0/9] wifi: Fix MODULE_DESCRIPTION() for net (p4)
Date: Tue, 30 Jan 2024 02:42:34 -0800
Message-Id: <20240130104243.3025393-1-leitao@debian.org>
X-Mailer: git-send-email 2.39.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240130_024331_865932_D3492D96 
X-CRM114-Status: UNSURE (   7.18  )
X-CRM114-Notice: Please train this message.
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

There are hundreds of network modules that misses MODULE_DESCRIPTION(),
causing a warning when compiling with W=1. Example:

        WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/net/wireless/microchip/wilc1000/wilc1000-sdio.o
        WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/net/wireless/microchip/wilc1000/wilc1000-spi.o
        WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/net/wireless/ti/wl18xx/wl18xx.o

This part4 of the patchset focus on the missing wifi drivers, which
is now warning free.

Here are all the MODULE_DESCRIPTION added:

        MODULE_DESCRIPTION("Atheros AR5523 wireless driver");
        MODULE_DESCRIPTION("Atmel WILC1000 core wireless driver");
        MODULE_DESCRIPTION("Atmel WILC1000 SDIO wireless driver");
        MODULE_DESCRIPTION("Atmel WILC1000 SPI wireless driver");
        MODULE_DESCRIPTION("Broadcom FullMAC WLAN driver plugin for Broadcom AP chipsets");
        MODULE_DESCRIPTION("Broadcom FullMAC WLAN driver plugin for Broadcom mobility chipsets");
        MODULE_DESCRIPTION("Broadcom FullMAC WLAN driver plugin for Cypress/Infineon chipsets");
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


Breno Leitao (9):
  wifi: fill in MODULE_DESCRIPTION()s for wlcore
  wifi: fill in MODULE_DESCRIPTION()s for wl1251 and wl12xx
  wifi: fill in MODULE_DESCRIPTION()s for Broadcom WLAN
  wifi: fill in MODULE_DESCRIPTION()s for ar5523
  wifi: fill in MODULE_DESCRIPTION()s for wcn36xx
  wifi: fill in MODULE_DESCRIPTION()s for p54spi
  wifi: fill in MODULE_DESCRIPTION()s for wl18xx
  wifi: fill in MODULE_DESCRIPTION()s for wilc1000
  wifi: fill in MODULE_DESCRIPTION()s for mt76 drivers

 drivers/net/wireless/ath/ar5523/ar5523.c                      | 1 +
 drivers/net/wireless/ath/wcn36xx/main.c                       | 1 +
 drivers/net/wireless/broadcom/brcm80211/brcmfmac/bca/module.c | 1 +
 drivers/net/wireless/broadcom/brcm80211/brcmfmac/cyw/module.c | 1 +
 drivers/net/wireless/broadcom/brcm80211/brcmfmac/wcc/module.c | 1 +
 drivers/net/wireless/intersil/p54/p54spi.c                    | 1 +
 drivers/net/wireless/mediatek/mt76/mt7603/main.c              | 1 +
 drivers/net/wireless/mediatek/mt76/mt7615/main.c              | 1 +
 drivers/net/wireless/mediatek/mt76/mt7615/mmio.c              | 1 +
 drivers/net/wireless/mediatek/mt76/mt7615/sdio.c              | 1 +
 drivers/net/wireless/mediatek/mt76/mt7615/usb.c               | 1 +
 drivers/net/wireless/mediatek/mt76/mt7615/usb_sdio.c          | 1 +
 drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c          | 1 +
 drivers/net/wireless/mediatek/mt76/mt76x0/eeprom.c            | 1 +
 drivers/net/wireless/mediatek/mt76/mt76x0/pci.c               | 1 +
 drivers/net/wireless/mediatek/mt76/mt76x0/usb.c               | 1 +
 drivers/net/wireless/mediatek/mt76/mt76x02_usb_mcu.c          | 1 +
 drivers/net/wireless/mediatek/mt76/mt76x02_util.c             | 1 +
 drivers/net/wireless/mediatek/mt76/mt76x2/eeprom.c            | 1 +
 drivers/net/wireless/mediatek/mt76/mt76x2/pci.c               | 1 +
 drivers/net/wireless/mediatek/mt76/mt76x2/usb.c               | 1 +
 drivers/net/wireless/mediatek/mt76/mt7915/mmio.c              | 1 +
 drivers/net/wireless/mediatek/mt76/mt7921/main.c              | 1 +
 drivers/net/wireless/mediatek/mt76/mt7921/pci.c               | 1 +
 drivers/net/wireless/mediatek/mt76/mt7921/sdio.c              | 1 +
 drivers/net/wireless/mediatek/mt76/mt7921/usb.c               | 1 +
 drivers/net/wireless/mediatek/mt76/mt7925/main.c              | 1 +
 drivers/net/wireless/mediatek/mt76/mt7925/pci.c               | 1 +
 drivers/net/wireless/mediatek/mt76/mt7925/usb.c               | 1 +
 drivers/net/wireless/mediatek/mt76/mt792x_core.c              | 1 +
 drivers/net/wireless/mediatek/mt76/mt792x_usb.c               | 1 +
 drivers/net/wireless/mediatek/mt76/mt7996/mmio.c              | 1 +
 drivers/net/wireless/mediatek/mt76/sdio.c                     | 1 +
 drivers/net/wireless/mediatek/mt76/usb.c                      | 1 +
 drivers/net/wireless/mediatek/mt76/util.c                     | 1 +
 drivers/net/wireless/microchip/wilc1000/netdev.c              | 1 +
 drivers/net/wireless/microchip/wilc1000/sdio.c                | 1 +
 drivers/net/wireless/microchip/wilc1000/spi.c                 | 1 +
 drivers/net/wireless/ti/wl1251/sdio.c                         | 1 +
 drivers/net/wireless/ti/wl1251/spi.c                          | 1 +
 drivers/net/wireless/ti/wl12xx/main.c                         | 1 +
 drivers/net/wireless/ti/wl18xx/main.c                         | 1 +
 drivers/net/wireless/ti/wlcore/main.c                         | 1 +
 drivers/net/wireless/ti/wlcore/sdio.c                         | 1 +
 drivers/net/wireless/ti/wlcore/spi.c                          | 1 +
 45 files changed, 45 insertions(+)

-- 
2.39.3


