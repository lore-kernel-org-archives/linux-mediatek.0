Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82467CA1009
	for <linux-mediatek@archiver.kernel.org>; Wed,  3 Sep 2025 18:56:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MjiZpHaOGAzMnI40BIIZ11hI7GlxfYSDqRw3KpQJVjo=; b=UvX6n7DDJgf3C3m8OyWM8+1sCZ
	O1muoSvHJ1AYZpOVrnzWEs6FIijU99u0BBRGK3K2cr/P4YtuWqEm9pCM8JI5uBqLXQNmsXkgfhbyU
	NYUvO18CZUvkNqrhwofbX/yFpk2wwJ6jk8m0W6fR67HMbQd2jCn9dRWD95i75QkQeZFNvCT/THIha
	HVdttP4wPG9CPDDRvvlv6zRGyxKsivpdXwPKqkhcNwpatwCS0XaCZCg3LRnhqjwiO5lwbwlaFvndm
	dBQsyZb/0X8HgfooNQHZflW1HQ6AGJzuCRMAA9EzIxLa68OYC/ryPIDqhVdsJOaLhkz5sGrPdDcBB
	mlEkK29g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utsf1-00000007NAk-2YNN;
	Wed, 03 Sep 2025 18:56:47 +0000
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uto7j-00000006gjy-2Jew
	for linux-mediatek@lists.infradead.org;
	Wed, 03 Sep 2025 14:06:08 +0000
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-248ff68356aso6775605ad.1
        for <linux-mediatek@lists.infradead.org>; Wed, 03 Sep 2025 07:06:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=wbinvd.org; s=wbinvd; t=1756908367; x=1757513167; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=MjiZpHaOGAzMnI40BIIZ11hI7GlxfYSDqRw3KpQJVjo=;
        b=ZMz0Ku5OnJ2crvJYilLlpw7F792M7QcYVAKLDAgrvCTTnSCUnPF8U1jcOB3sodZ2Q1
         lZ3scoDcQUav5BuoyOPwld0l0MMdP1kH7Cza5ER17j+SGqwNB6c+b1yqI42yCxN4GLNz
         uX51DJ85IY5Pf6my9OWCcYT1wK+bp8oeMxKfMU/2mBSeMz/ZsaYlTVn740HOMN+eTyUw
         0YN4HUif4RAjJHV9Xsz/67Y7H7b5fjRfq2b5P4zz+BEh5Pwih8Ox1Of9Q0DGvjGB9H/M
         iUKPAmb2yfaaJ34BIybc4oPT9hTilga2KSK8Xwc6id3s0dFH9X638DGFl0x4U0gSpH0U
         7lBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756908367; x=1757513167;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MjiZpHaOGAzMnI40BIIZ11hI7GlxfYSDqRw3KpQJVjo=;
        b=Lrly548FAMv/+jBrSMOlsQ/OZBJsyFPw9Bg30BDGiA1oWyBYO9iylbMFFTygZqWROg
         nxFakaqe4B9jbC87Y34o/gfhNpfHbUu9+HTL9KMGhqHaHnu/Tw9t8UcFQInwkRqBs8bh
         9MBl5Qq6xVz3gqIuYB971ONMms/cqj/yuZa4T78NRxQsMMZqqmSplQqjRj74uLFwXfEy
         iYn9uAheIcOfruMpZqrWJyJhdAXat6vpGlVOBZKLdLrBcub2XluBZ/5i2TsTD44IHzT7
         EUaBnozoK6R+jje+2ZMkz9pfLFIEaIHQhy+1TAGL86eT+CiP9XT4aIGoIbIvERBBVj1S
         plOA==
X-Forwarded-Encrypted: i=1; AJvYcCXf8Q25i9QMX4iFzwRmudo5uWVLdZInWHm+PfU64UgTP6dS4BNxVtVR5O2yjtrYkwjeGVafHfsD+ZJTYNN54w==@lists.infradead.org
X-Gm-Message-State: AOJu0YwK2qxMGrnYtNAb8YFZ4Q/IU++bfKroEUt1sIzJirQw0kNMnQ65
	x6jwOazk4EFkVQk51Ha00J46rz7nTv6/wU11SYj8rNSP2+pRTPobuai35HVYCGP+WeM=
X-Gm-Gg: ASbGnctD/bhc6QHxt0s1vJdHRj581umMpEPskG99i4ScpL5l/pf66hth5LSOosvslM4
	22GP4IojQ93KM1QvV23mpoI9HVzyiji0APSiK7hFguyZ2Q+ipWtk3Ll7GfLTUjYZXWHAoPc9d8K
	XBrdZ73/RyFxfV/eGuVdoOIYG96ViO+tygDamj1WP6laRkPOQa/mgRLcdPIObnq0ldUndP/Pr6a
	Fb0vE55japjXVpD2n8w2PeBwDQbUu2pveMH4+kAV7UDSLV8WPM/4bQsU3++m44JeG5WgAUGlN+B
	BH20l9RcdSIyVTJZtfsnxPpZiCrK8xzWoL9czwKF//a+k95T4nB6rtdYkFwIvk8gXPJGbDg2B4v
	tbqRXn6zhmiBCEClGcXyDotwo
X-Google-Smtp-Source: AGHT+IFlIeuwMod5aclkQ/QtX6cKW39pAdUeh1p1zXqs3QyuVJvhTttccp2Nuw4HcUpvwD0nuOddbQ==
X-Received: by 2002:a17:903:186:b0:246:2cb3:5768 with SMTP id d9443c01a7336-24944b4323fmr220781315ad.30.1756908366468;
        Wed, 03 Sep 2025 07:06:06 -0700 (PDT)
Received: from mozart.vkv.me ([192.184.167.117])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-24c9e39094dsm16821705ad.84.2025.09.03.07.06.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Sep 2025 07:06:05 -0700 (PDT)
Date: Wed, 3 Sep 2025 07:06:06 -0700
From: Calvin Owens <calvin@wbinvd.org>
To: Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Cc: Paul Menzel <pmenzel@molgen.mpg.de>, linux-kernel@vger.kernel.org,
	linux-bluetooth@vger.kernel.org,
	Luiz Augusto von Dentz <luiz.von.dentz@intel.com>,
	oe-kbuild-all@lists.linux.dev,
	Marcel Holtmann <marcel@holtmann.org>,
	Sean Wang <sean.wang@mediatek.com>,
	linux-mediatek@lists.infradead.org, naresh.kamboju@linaro.org
Subject: [PATCH v3] Bluetooth: Fix build after header cleanup
Message-ID: <aLhLTiIMRnjHfvOn@mozart.vkv.me>
References: <202508300413.OnIedvRh-lkp@intel.com>
 <b78a4255d17adbb74140aa23f89cb7653af96c75.1756513671.git.calvin@wbinvd.org>
 <84fd4012-966b-4983-b015-ffce06509b5e@molgen.mpg.de>
 <aLNRvzXE4O9dKZoN@mozart.vkv.me>
 <CABBYNZJBDgQHwmx82H2XJ-LCeOsxc77PPo6NA4zzT0dt7Uxddw@mail.gmail.com>
 <aLcQsE3x9o4BzXxp@mozart.vkv.me>
 <aLhK5wEHgxc3BIgb@mozart.vkv.me>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <aLhK5wEHgxc3BIgb@mozart.vkv.me>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250903_070607_589826_256B9E96 
X-CRM114-Status: GOOD (  12.98  )
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

Fixes: 0e272fc7e17d ("Bluetooth: remove duplicate h4_recv_buf() in header")
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


