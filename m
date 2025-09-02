Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21755CA1005
	for <linux-mediatek@archiver.kernel.org>; Tue,  2 Sep 2025 21:44:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gkt6jh8He1kXHojoNOHUR+RVSUvV3fJpjiiQf61S0dw=; b=xOQUI7B6z/KXrsF182c1oFFq3B
	EtPdUglyxiLgY5Q46GWh3132LEmgxHXCjX76AOwEM5/gGrOKhEJIfiZkJAMIf2VvTuIS9LZM6rDAj
	LgtSuUbpa7Cca0dk6IkLK3brBHHv0RjX5fGQJ5yFntbGjIoMvnkm3lkUEqVDt9o7yVlpKjENuv6yO
	zPKmDZd1Lcyhe7ifF1XRLuuo3fiT+7t1n4libQaK00z88g5Jdz/Z5Nr4mZRyNPFg74/f/3nPRSZME
	uy58HDs4+1Ll3ifB4Ghj6oUHYUr8yJt420ns4VG1FQY37GzQ1LsuxeWXOu9MUt8oiONCnugqzr3Pg
	OvNGCQ8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utYnH-00000002CDX-1npD;
	Tue, 02 Sep 2025 21:43:59 +0000
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utTAj-00000000kLc-1gWc
	for linux-mediatek@lists.infradead.org;
	Tue, 02 Sep 2025 15:43:50 +0000
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-2489acda3bbso44550585ad.1
        for <linux-mediatek@lists.infradead.org>; Tue, 02 Sep 2025 08:43:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=wbinvd.org; s=wbinvd; t=1756827828; x=1757432628; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=gkt6jh8He1kXHojoNOHUR+RVSUvV3fJpjiiQf61S0dw=;
        b=COOME/h4RvMQ8JhijuUuWIXRKItyrg0KdL1B6K+NFu7ft7Z8vvSD+hnWFNplKf2oyd
         LepChkUtTt2DPlI/U7g0EG1nKtFJF8PokdRX/ers5NCI7gWOxzCWFKX6CkerOX5ZPlEx
         1YYkQt4IHmCJT5+/btWMP7lQqCHd/JfUw7BdX7SYP28krkpaUDO/iaFiTmxybBy9v0zB
         URJKOpxFQk9WSbOcQdMtwpHj843crFxHnKZHYXOXcC3qU+qeBsb1NZ7Hpo7NIkSNeakY
         HB3p9cWfVxgxiwR7dZSTBeeeuttnVm4H9lqydS1SHnFqnXDcMsz24zBq2rAfT+ziKTLE
         l+Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756827828; x=1757432628;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gkt6jh8He1kXHojoNOHUR+RVSUvV3fJpjiiQf61S0dw=;
        b=FJW6HbV1R3Y8s1coDOZkHwKFiGKlcWzwxZhsytaUUQb9D3sjc6XdkQqGPceTNvVXDK
         3UgiigOZtoSgYWiIq2oPS2Jhwb3DntwAP5xAlyWQnF+n+24AqkyZA+npSobDeVs2ohk7
         PNdWmnMcYSRgMoQJWvgs9dOpSo+wlR8DyxMHQ5o028WgkHIlapatwJfs2k8A09Q8m8Qj
         pDoLy+jf/HglEO+dk0Dnvwj3TqGcoaLCVPKCuDMB2Nkc141vWaz+lJL8jcwHuOba5OKD
         ZtOEkrr99BhhV3LfYRUGKeQrUrhnwwg+qHyEfCxX1c2YwTXKeMC1MWvZ7yFm26eHgjxz
         3iOg==
X-Forwarded-Encrypted: i=1; AJvYcCUx+6usekMvqFyq5qMTHyiXRgKlqYPINUqDxFABM0J1wQ9oNYpczAMNAqPgXGk1qFeo60fSOaNx4OF3FUIMdQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YwmK96Td7M5ZDgjOZMh4oj8YpFkemlyTBbbqt0Aguyo5qX94oga
	E+2/ZdhtrapCiYS2OXxgweQygm0Sb1ACecFXWde8jSF5dmUTO2JEMIFAd1PL8YUotsM=
X-Gm-Gg: ASbGncusL2CfSXHpXILvyR4xFs9jIqaV9oGpilsOHxZskbAtiskRvm4tMs7zDI16uoK
	OgbEY4u0wT+Om28SJ76JbSqqK5Q3alI5vZK8COwcKWsJZpAfGda3kUFEQq13eOwvciG6IxZiUVq
	7pYu9Nrqf0+VwBCMg1zjDDTKVOL+Qm45xul9RmnqWMpi+pYKQbqWw21EZmgw1nNKpm3DiEh0eN6
	72So0W0imqLs6Caet7EL6/Nubt+TMuVvlc/S4gdis01yHio1jUKj9U2pjkdRcqtbIhar9MLfobb
	z9328pU8ZSETUQan+U/8+iCeWCefk8Bb5gG2V08mLmDwQI2A+G1/WgXugkQHNF8jKv9ompLidwL
	sQ2EYnrP2nvyy1Dr1iSs2ddC49IIe6vJjjo0RVjtW0jNjIQ==
X-Google-Smtp-Source: AGHT+IGlZIJUkPm51/UzPGDsdAct3krCic7IzLREXEY9/oW76ewvmB7K7S3GcX3yQJ4WmturI/w3dQ==
X-Received: by 2002:a17:903:186:b0:248:6d1a:430f with SMTP id d9443c01a7336-24944a173famr145263995ad.25.1756827828044;
        Tue, 02 Sep 2025 08:43:48 -0700 (PDT)
Received: from mozart.vkv.me ([192.184.167.117])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3278f881f21sm9364227a91.2.2025.09.02.08.43.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Sep 2025 08:43:47 -0700 (PDT)
Date: Tue, 2 Sep 2025 08:43:44 -0700
From: Calvin Owens <calvin@wbinvd.org>
To: Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Cc: Paul Menzel <pmenzel@molgen.mpg.de>, linux-kernel@vger.kernel.org,
	linux-bluetooth@vger.kernel.org,
	Luiz Augusto von Dentz <luiz.von.dentz@intel.com>,
	oe-kbuild-all@lists.linux.dev,
	Marcel Holtmann <marcel@holtmann.org>,
	Sean Wang <sean.wang@mediatek.com>,
	linux-mediatek@lists.infradead.org, naresh.kamboju@linaro.org
Subject: [PATCH v2] Bluetooth: Fix build after header cleanup
Message-ID: <aLcQsE3x9o4BzXxp@mozart.vkv.me>
References: <202508300413.OnIedvRh-lkp@intel.com>
 <b78a4255d17adbb74140aa23f89cb7653af96c75.1756513671.git.calvin@wbinvd.org>
 <84fd4012-966b-4983-b015-ffce06509b5e@molgen.mpg.de>
 <aLNRvzXE4O9dKZoN@mozart.vkv.me>
 <CABBYNZJBDgQHwmx82H2XJ-LCeOsxc77PPo6NA4zzT0dt7Uxddw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CABBYNZJBDgQHwmx82H2XJ-LCeOsxc77PPo6NA4zzT0dt7Uxddw@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250902_084349_440262_CBA7B72D 
X-CRM114-Status: GOOD (  13.35  )
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

Some Kconfig dependencies are needed after my recent cleanup, since
the core code has its own option.

Since btmtksdio does not actually call h4_recv_buf(), move the
definitions it uses outside the BT_HCIUART_H4 gate in hci_uart.h to
avoid adding a dependency for btmtksdio.

The rest I touched (bpa10x, btmtkuart, and btnxpuart) do really call
h4_recv_buf(), so the dependency is required, add it for them.

Fixes: 74bcec450eea ("Bluetooth: remove duplicate h4_recv_buf() in header")
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202508300413.OnIedvRh-lkp@intel.com/
Signed-off-by: Calvin Owens <calvin@wbinvd.org>
---
 drivers/bluetooth/Kconfig    | 6 ++++++
 drivers/bluetooth/hci_uart.h | 8 ++++----
 2 files changed, 10 insertions(+), 4 deletions(-)

diff --git a/drivers/bluetooth/Kconfig b/drivers/bluetooth/Kconfig
index 4ab32abf0f48..7df69ccb6600 100644
--- a/drivers/bluetooth/Kconfig
+++ b/drivers/bluetooth/Kconfig
@@ -312,7 +312,9 @@ config BT_HCIBCM4377
 
 config BT_HCIBPA10X
 	tristate "HCI BPA10x USB driver"
+	depends on BT_HCIUART
 	depends on USB
+	select BT_HCIUART_H4
 	help
 	  Bluetooth HCI BPA10x USB driver.
 	  This driver provides support for the Digianswer BPA 100/105 Bluetooth
@@ -437,8 +439,10 @@ config BT_MTKSDIO
 
 config BT_MTKUART
 	tristate "MediaTek HCI UART driver"
+	depends on BT_HCIUART
 	depends on SERIAL_DEV_BUS
 	depends on USB || !BT_HCIBTUSB_MTK
+	select BT_HCIUART_H4
 	select BT_MTK
 	help
 	  MediaTek Bluetooth HCI UART driver.
@@ -483,7 +487,9 @@ config BT_VIRTIO
 
 config BT_NXPUART
 	tristate "NXP protocol support"
+	depends on BT_HCIUART
 	depends on SERIAL_DEV_BUS
+	select BT_HCIUART_H4
 	select CRC32
 	select CRC8
 	help
diff --git a/drivers/bluetooth/hci_uart.h b/drivers/bluetooth/hci_uart.h
index 5ea5dd80e297..cbbe79b241ce 100644
--- a/drivers/bluetooth/hci_uart.h
+++ b/drivers/bluetooth/hci_uart.h
@@ -121,10 +121,6 @@ void hci_uart_set_flow_control(struct hci_uart *hu, bool enable);
 void hci_uart_set_speeds(struct hci_uart *hu, unsigned int init_speed,
 			 unsigned int oper_speed);
 
-#ifdef CONFIG_BT_HCIUART_H4
-int h4_init(void);
-int h4_deinit(void);
-
 struct h4_recv_pkt {
 	u8  type;	/* Packet type */
 	u8  hlen;	/* Header length */
@@ -162,6 +158,10 @@ struct h4_recv_pkt {
 	.lsize = 2, \
 	.maxlen = HCI_MAX_FRAME_SIZE \
 
+#ifdef CONFIG_BT_HCIUART_H4
+int h4_init(void);
+int h4_deinit(void);
+
 struct sk_buff *h4_recv_buf(struct hci_dev *hdev, struct sk_buff *skb,
 			    const unsigned char *buffer, int count,
 			    const struct h4_recv_pkt *pkts, int pkts_count);
-- 
2.47.2


