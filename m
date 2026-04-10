Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C516E99071
	for <linux-mediatek@archiver.kernel.org>; Fri, 10 Apr 2026 10:13:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=qARg06qVMz9+DLd38HAj11nvFT4m9He5ePu4KsCy86E=; b=LVebeUp2uqPops4I6lUiy+f4dA
	C1zgxp7A0Yc2UYpjL5ctbEjNe5N8s5nEWDIw/4Q6lOOEFoWIiuT97VF25VvJkQ/BsHwtFK7E10WtV
	0b/skSpAWezGkSlf0tO6QB+urcwSbRTj5M2YgeheTwzFeg/93u7d/eNEIxYO1yANmE69VgMGC9DLd
	kQ7dURFcLGBuB0AoXGw0cvV0KtKNiCuKKVxk/a6SQsKlbwNn382RvVudcOBj0Vnzla0Y8rW/lVONg
	urn7BRcS3Mh5/+40aOk9AHoaRhax9cUFyKIXa3TLREom/Ik4zt/auwaxb5AyAHC/LnZ+KtONlUHFX
	gEOJdZ9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wB8rv-0000000Bz71-2Qjr;
	Fri, 10 Apr 2026 10:13:43 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wB8rt-0000000Bz6F-1FMh
	for linux-mediatek@lists.infradead.org;
	Fri, 10 Apr 2026 10:13:42 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-482f454be5bso19656605e9.0
        for <linux-mediatek@lists.infradead.org>; Fri, 10 Apr 2026 03:13:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775816019; x=1776420819; darn=lists.infradead.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qARg06qVMz9+DLd38HAj11nvFT4m9He5ePu4KsCy86E=;
        b=i1xn3rFSwk8xsNvilnSQVe8B39BGSKZVQlZysVs2CQBqEpf+SC3WTO5A7xqkNmnwL5
         6cD9l7ZmJTFFWLRJJwWfbzdkKYF/HDyLmn6+XSq9z3tzK3AV2Gq5CWPRvpNuu7ITX4FD
         1+wPWGOR1uvq8uWKbJTNiTy130wLRvNx409HXscfzUxjPpU95bPO6cD5ZdaE+tHuPJnz
         bb1zPbXb4jvRxga8r3YWce5SnILbcFqGZaeExuJs7mi2WZ2UUPhMOpdHyGH4F3QM4rMN
         jAenlLyYJCZMB4zy5pKeLGc39puaZ0elMh09hQydIAwBAxgmnurvOvMTaCEX+lt/y1Js
         izTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775816019; x=1776420819;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qARg06qVMz9+DLd38HAj11nvFT4m9He5ePu4KsCy86E=;
        b=qa5XoATcTuwr5uRWMn3cfYXycPhIB6xifl+outJ1vds3lrE+R9XlNOUNmhSWeZrj/9
         6SCANH06b1J51P8IQgVCC8oEUY5tEqUG/8Yf6kVwJANS2208oMujPzRQuNqURDR9cxR7
         g6/T07B4t/7xzR6I1uW2kaNeTRMqzHwGQfj/H0KnMwuUYbYe2PkC8IL4a3lsyeSO0C1B
         XghTv02mjVAdU4UGcHIAocB+E9zWrRMCMQ8JdSa4SsRyQvT362W7Ogg8Amw//BAibkiJ
         RNpeng6zllX4on9np6U0Xo7CyMOOq+q2rs7EO2jBJQgmovH3pVoi10rqG3PbC7TBv+VS
         1roQ==
X-Forwarded-Encrypted: i=1; AJvYcCWykMVWxHWqAwM9kw8XuD7bJaTeIsSwTBQzELO40G1t3T1i+FvL3x08H+CTq44PQdOCgwf17XU110csYh8dlw==@lists.infradead.org
X-Gm-Message-State: AOJu0YwTnQcde8XAsjkWoovPgaOAvCLd5ufl9PXpJ5TW+nwemr1s+A9s
	QRk4gWFEj0Ym0erGhYXaJuK+PQaZwiM/luxvTcFIU8OJuPuv2bzkPp+4p2o68xDw
X-Gm-Gg: AeBDievZz7qOlvuDB7dyjtr3tbgFxkgE0P6gX0M8jkHMoU9j+qWExK4ZPqtOwF9VknC
	txiPk6VqbNV5wdDxci9oYK1pY3XyEX5OWlWqHjFhe+m8fNA65ENX77U4ujP9VXEQdmigvoKIWZl
	1HUg7PKPbfZmJM2hQ7EEFVmRF6pdc1IJCUsAGRaoEvyQXAHBE3mj6XBVzwD398sJbt8ZAMCTDSc
	VtT8kONS0SomayooO4sItA3vdVSdLNaYdGVQYcLtlMeMuYRHuY5eBaD1XL7d4aX4SSQAXLzza3X
	YfDInCEjAnPSyOF8dbgu0OStTDZ35vp7qU2lXUZUBwZX5vQ1FrOl+zpnythEBwMn+c2Epa/VfSG
	IPYc8RGKaCXFgU9NFljlN52sbup94yhUyjycm5NpdSXXd1SAM4BobccCiPYwSkD4sDyAPJ2VvqZ
	6AgsfI2esHXSG2nouovRM=
X-Received: by 2002:a05:600c:3ba4:b0:488:c6e9:1e0c with SMTP id 5b1f17b1804b1-488d6847de9mr28556345e9.5.1775816019154;
        Fri, 10 Apr 2026 03:13:39 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43d63e5c981sm6388557f8f.33.2026.04.10.03.13.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Apr 2026 03:13:38 -0700 (PDT)
Date: Fri, 10 Apr 2026 13:13:35 +0300
From: Dan Carpenter <error27@gmail.com>
To: Sean Wang <sean.wang@mediatek.com>
Cc: linux-wireless@vger.kernel.org, linux-mediatek@lists.infradead.org
Subject: [bug report] wifi: mt76: mt7921: handle MT7902 irq_map quirk with
 mutable copy
Message-ID: <adjNTwO_ziI9eLWU@stanley.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260410_031341_376328_D174B674 
X-CRM114-Status: UNSURE (   8.01  )
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

Hello Sean Wang,

Commit 222606f43b58 ("wifi: mt76: mt7921: handle MT7902 irq_map quirk
with mutable copy") from Feb 18, 2026 (linux-next), leads to the
following Smatch static checker warning:

	drivers/net/wireless/mediatek/mt76/mt7921/pci.c:363 mt7921_pci_probe()
	warn: missing unwind goto?

drivers/net/wireless/mediatek/mt76/mt7921/pci.c
    258 static int mt7921_pci_probe(struct pci_dev *pdev,
    259                             const struct pci_device_id *id)
    260 {
    261         static const struct mt76_driver_ops drv_ops = {
    262                 /* txwi_size = txd size + txp size */
    263                 .txwi_size = MT_TXD_SIZE + sizeof(struct mt76_connac_hw_txp),
    264                 .drv_flags = MT_DRV_TXWI_NO_FREE | MT_DRV_HW_MGMT_TXQ |
    265                              MT_DRV_AMSDU_OFFLOAD,
    266                 .survey_flags = SURVEY_INFO_TIME_TX |
    267                                 SURVEY_INFO_TIME_RX |
    268                                 SURVEY_INFO_TIME_BSS_RX,
    269                 .token_size = MT7921_TOKEN_SIZE,
    270                 .tx_prepare_skb = mt7921e_tx_prepare_skb,
    271                 .tx_complete_skb = mt76_connac_tx_complete_skb,
    272                 .rx_check = mt7921_rx_check,
    273                 .rx_skb = mt7921_queue_rx_skb,
    274                 .rx_poll_complete = mt792x_rx_poll_complete,
    275                 .sta_add = mt7921_mac_sta_add,
    276                 .sta_event = mt7921_mac_sta_event,
    277                 .sta_remove = mt7921_mac_sta_remove,
    278                 .update_survey = mt792x_update_channel,
    279                 .set_channel = mt7921_set_channel,
    280         };
    281         static const struct mt792x_hif_ops mt7921_pcie_ops = {
    282                 .init_reset = mt7921e_init_reset,
    283                 .reset = mt7921e_mac_reset,
    284                 .mcu_init = mt7921e_mcu_init,
    285                 .drv_own = mt792xe_mcu_drv_pmctrl,
    286                 .fw_own = mt792xe_mcu_fw_pmctrl,
    287         };
    288         static const struct mt792x_irq_map irq_map = {
    289                 .host_irq_enable = MT_WFDMA0_HOST_INT_ENA,
    290                 .tx = {
    291                         .all_complete_mask = MT_INT_TX_DONE_ALL,
    292                         .mcu_complete_mask = MT_INT_TX_DONE_MCU,
    293                 },
    294                 .rx = {
    295                         .data_complete_mask = MT_INT_RX_DONE_DATA,
    296                         .wm_complete_mask = MT_INT_RX_DONE_WM,
    297                         .wm2_complete_mask = MT_INT_RX_DONE_WM2,
    298                 },
    299         };
    300         struct ieee80211_ops *ops;
    301         struct mt76_bus_ops *bus_ops;
    302         struct mt792x_dev *dev;
    303         struct mt76_dev *mdev;
    304         void __iomem *regs;
    305         u16 cmd, chipid;
    306         u8 features;
    307         int ret;
    308 
    309         ret = pcim_enable_device(pdev);
    310         if (ret)
    311                 return ret;
    312 
    313         pci_read_config_word(pdev, PCI_COMMAND, &cmd);
    314         if (!(cmd & PCI_COMMAND_MEMORY)) {
    315                 cmd |= PCI_COMMAND_MEMORY;
    316                 pci_write_config_word(pdev, PCI_COMMAND, cmd);
    317         }
    318         pci_set_master(pdev);
    319 
    320         ret = pci_alloc_irq_vectors(pdev, 1, 1, PCI_IRQ_ALL_TYPES);
    321         if (ret < 0)
    322                 return ret;
    323 
    324         ret = dma_set_mask(&pdev->dev, DMA_BIT_MASK(32));
    325         if (ret)
    326                 goto err_free_pci_vec;
    327 
    328         if (mt7921_disable_aspm)
    329                 mt76_pci_disable_aspm(pdev);
    330 
    331         ops = mt792x_get_mac80211_ops(&pdev->dev, &mt7921_ops,
    332                                       (void *)id->driver_data, &features);
    333         if (!ops) {
    334                 ret = -ENOMEM;
    335                 goto err_free_pci_vec;
    336         }
    337 
    338         mdev = mt76_alloc_device(&pdev->dev, sizeof(*dev), ops, &drv_ops);
    339         if (!mdev) {
    340                 ret = -ENOMEM;
    341                 goto err_free_pci_vec;
    342         }
    343 
    344         pci_set_drvdata(pdev, mdev);
    345 
    346         regs =  pcim_iomap_region(pdev, 0, pci_name(pdev));
    347         if (IS_ERR(regs))
    348                 return PTR_ERR(regs);

Need to goto to err_free_pci_vec before returning

    349 
    350         dev = container_of(mdev, struct mt792x_dev, mt76);
    351         dev->fw_features = features;
    352         dev->hif_ops = &mt7921_pcie_ops;
    353         dev->irq_map = &irq_map;
    354         mt76_mmio_init(&dev->mt76, regs);
    355 
    356         if (id->device == 0x7902) {
    357                 struct mt792x_irq_map *map;
    358 
    359                 /* MT7902 needs a mutable copy because wm2_complete_mask differs */
    360                 map = devm_kmemdup(&pdev->dev, &irq_map,
    361                                    sizeof(irq_map), GFP_KERNEL);
    362                 if (!map)
--> 363                         return -ENOMEM;

Same.

    364 
    365                 map->rx.wm2_complete_mask = 0;
    366                 dev->irq_map = map;
    367         }
    368 
    369         tasklet_init(&mdev->irq_tasklet, mt792x_irq_tasklet, (unsigned long)dev);
    370 
    371         dev->phy.dev = dev;
    372         dev->phy.mt76 = &dev->mt76.phy;
    373         dev->mt76.phy.priv = &dev->phy;
    374         dev->bus_ops = dev->mt76.bus;
    375         bus_ops = devm_kmemdup(dev->mt76.dev, dev->bus_ops, sizeof(*bus_ops),
    376                                GFP_KERNEL);
    377         if (!bus_ops) {
    378                 ret = -ENOMEM;
    379                 goto err_free_dev;
    380         }
    381 
    382         bus_ops->rr = mt7921_rr;
    383         bus_ops->wr = mt7921_wr;
    384         bus_ops->rmw = mt7921_rmw;
    385         dev->mt76.bus = bus_ops;
    386 
    387         if (!mt7921_disable_aspm && mt76_pci_aspm_supported(pdev))
    388                 dev->aspm_supported = true;
    389 
    390         ret = mt792xe_mcu_fw_pmctrl(dev);
    391         if (ret)
    392                 goto err_free_dev;
    393 
    394         ret = __mt792xe_mcu_drv_pmctrl(dev);
    395         if (ret)
    396                 goto err_free_dev;
    397 
    398         chipid = mt7921_l1_rr(dev, MT_HW_CHIPID);
    399         if (chipid == 0x7961 && (mt7921_l1_rr(dev, MT_HW_BOUND) & BIT(7)))
    400                 chipid = 0x7920;
    401         mdev->rev = (chipid << 16) |
    402                     (mt7921_l1_rr(dev, MT_HW_REV) & 0xff);
    403         dev_info(mdev->dev, "ASIC revision: %04x\n", mdev->rev);
    404 
    405         ret = mt792x_wfsys_reset(dev);
    406         if (ret)
    407                 goto err_free_dev;
    408 
    409         mt76_wr(dev, irq_map.host_irq_enable, 0);
    410 
    411         mt76_wr(dev, MT_PCIE_MAC_INT_ENABLE, 0xff);
    412 
    413         ret = devm_request_irq(mdev->dev, pdev->irq, mt792x_irq_handler,
    414                                IRQF_SHARED, KBUILD_MODNAME, dev);
    415         if (ret)
    416                 goto err_free_dev;
    417 
    418         ret = mt7921_dma_init(dev);
    419         if (ret)
    420                 goto err_free_irq;
    421 
    422         ret = mt7921_register_device(dev);
    423         if (ret)
    424                 goto err_free_irq;
    425 
    426         if (of_property_read_bool(dev->mt76.dev->of_node, "wakeup-source"))
    427                 device_init_wakeup(dev->mt76.dev, true);
    428 
    429         return 0;
    430 
    431 err_free_irq:
    432         devm_free_irq(&pdev->dev, pdev->irq, dev);
    433 err_free_dev:
    434         mt76_free_device(&dev->mt76);
    435 err_free_pci_vec:
    436         pci_free_irq_vectors(pdev);
    437 
    438         return ret;
    439 }

This email is a free service from the Smatch-CI project [smatch.sf.net].

regards,
dan carpenter

