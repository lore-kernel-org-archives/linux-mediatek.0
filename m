Return-Path: <SRS0=tlsQ=F6=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 28543C433DB
	for <linux-mediatek@archiver.kernel.org>; Sat, 26 Dec 2020 20:17:46 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 594B02184D
	for <linux-mediatek@archiver.kernel.org>; Sat, 26 Dec 2020 20:17:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 594B02184D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=holtmann.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:References:Message-Id:Date:In-Reply-To:From:
	Subject:Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=4kAddFzkOqhBGluaXV7EyixFoFWHqMy0Hgd+XMswntk=; b=DD3PYs2Rbvz6W7gI0vC9mBokM
	506gpjExwKYlq6U1v/HJn5euW+jVYZDBAIZtnezdHP2qgdxVxjbUhi50dfvfC6/eWpXP5zimYP2EB
	buBUTZuIANGiK9CfTwVdfnxT/IB8AIAFlqWkqfVA0CwmgrN6KHfQXBujxLEpEfJkDMvG45FUYTXfg
	c+vsxJmRAuh/NskaLYu60unhMcJ9adX7Ac922/yNu2P2cF43+25A7tBb2/AF7ebLdG6eXzx5OF/fL
	6/CweRmJ8NvVqzuFYASl6f2u0XqNmdIJCJwEGaKmruPmIqDSJ4MSUsJkwE4WNZ8ojg3IqGi8PuMXa
	oPFk4FmtA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ktG0L-0003tM-Nb; Sat, 26 Dec 2020 20:17:33 +0000
Received: from coyote.holtmann.net ([212.227.132.17] helo=mail.holtmann.org)
 by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ktG0I-0003su-IK
 for linux-mediatek@lists.infradead.org; Sat, 26 Dec 2020 20:17:31 +0000
Received: from marcel-macbook.holtmann.net (p4ff9f924.dip0.t-ipconnect.de
 [79.249.249.36])
 by mail.holtmann.org (Postfix) with ESMTPSA id 955D2CED2F;
 Sat, 26 Dec 2020 21:24:43 +0100 (CET)
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.40.0.2.32\))
Subject: Re: [PATCH 1/1] [Add support Mediatek mt7921U]
From: Marcel Holtmann <marcel@holtmann.org>
In-Reply-To: <292c69c1038242d5b0d03fb7b4675555@mtkmbs08n1.mediatek.inc>
Date: Sat, 26 Dec 2020 21:17:24 +0100
Message-Id: <5925338F-C8E3-4FDE-9477-256EC2363C49@holtmann.org>
References: <20201222150527.22904-1-Mark-YW.Chen@mediatek.com>
 <06C876AD-8232-418E-B3CB-96B88579BAF7@holtmann.org>
 <292c69c1038242d5b0d03fb7b4675555@mtkmbs08n1.mediatek.inc>
To: =?utf-8?B?Ik1hcmstWVcgQ2hlbiAo6Zmz5o+a5paHKSI=?=
 <Mark-YW.Chen@mediatek.com>
X-Mailer: Apple Mail (2.3654.40.0.2.32)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201226_151730_732417_3C3FB29D 
X-CRM114-Status: GOOD (  20.06  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: Johan Hedberg <johan.hedberg@gmail.com>, Sean Wang <Sean.Wang@mediatek.com>,
 LKML <linux-kernel@vger.kernel.org>,
 linux-bluetooth <linux-bluetooth@vger.kernel.org>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 =?utf-8?B?IlBldGVyIFRzYW8gKOabueePhuW9sCki?= <Peter.Tsao@mediatek.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi Mark,

> Thanks for your suggestions, I will remove the duplicate definitions and functions.
> 
> Firstly, we will add the support of enabling MT7921U in btusb.c
> Secondary, we will discuss the driver architecture with you.
> Finally, we update the common part and hif part for MT7921.
> 
> I have a couple questions for driver architecture.
> 1. Global dev.
> 2. Unify common part.
> 3. HIF part (usb/sdio/pcie/uart)
>> 
>>> This patch adds the support of enabling MT7921U, it's USB-based
>>> Bluetooth function.
>>> 
>>> There are some component in the Mediatek driver.
>>> 1. Btmtk_main: it's common code for Mediatek devices,
>>>  such as firmware download, chip initialization,
>>>  state machine handling and etc.
>>> 2. Btmtkusb: it's for usb interface,
>>>  such as usb endpoint enumeration, urb handling and etc.
>>> 
>>> Firstly, we update the common part and usb part for MT7921U.
>>> Secondly, we will add the support MT7921S, it's SDIO-based device.
>>> Finally, we will add the procedure to support uart/pcie interfaces.
>> 
>> create a btmtk.[ch] module like the other vendors did if it makes sense.
>> Otherwise just skip that part for now and get btmtkusb.c driver working. You
>> can later unify between all 3 transports.
>> 
>> I would do the latter since it would first make sense to really see where the
>> common parts are. And I have to be frank, this driver needs massive cleanup. I
>> am not going to accept this tons of copy-and-paste left and right.
>> 
>> Please provide the content of /sys/kernel/debug/usb/devices in the commit
>> message.
>> 
>>> +/* To support dynamic mount of interface can be probed */
>>> +static int btmtk_intf_num = BT_MCU_MINIMUM_INTERFACE_NUM;
>>> +/* To allow g_bdev being sized from btmtk_intf_num setting */
>>> +static struct btmtk_dev **g_bdev;
>> 
>> NO. Period. No global dev instances.
> 
> [Global dev.]
> The global dev is for our state machine that design for error recovery, such as chip reset, memory dump and etc.
> We must to make sure state machine transition that is the same flow for each interfaces (usb/sdio/pcie/uart).
> [Mediatek driver]
> -> Create a dev before interface probe.
> [Linux kernel Bluetooth driver]
> -> Create a dev in interface probe (btusb_probe).
> 
> May we create a global dev before interface probe?

No. Please design things properly. Non of the drivers have global devices.

>>> +
>>> +/**
>>> + * Kernel Module init/exit Functions
>>> + */
>>> +static int __init main_driver_init(void)
>>> +{
>>> +	int ret = 0;
>>> +	int i;
>>> +
>>> +	/* Mediatek Driver Version */
>>> +	BTMTK_INFO("%s: MTK BT Driver Version : %s", __func__, VERSION);
>>> +
>>> +	ret = main_init();
>>> +	if (ret < 0)
>>> +		return ret;
>>> +
>>> +	for (i = 0; i < btmtk_intf_num; i++)
>>> +		btmtk_set_chip_state(g_bdev[i], BTMTK_STATE_DISCONNECT);
>>> +
>>> +	ret = btmtk_cif_register();
>>> +	if (ret < 0) {
>>> +		BTMTK_ERR("*** USB registration failed(%d)! ***", ret);
>>> +		main_exit();
>>> +		return ret;
>>> +	}
>>> +
>>> +	BTMTK_INFO("%s: Done", __func__);
>>> +	return ret;
>>> +}
>> 
>> NO. Period. Use module_usb_driver() and if you need anything more, you are
>> doing something wrong.
> 
> We would like to unify state machine, dev allocate, hif_hook and hif_register.
> [Unify Common Part]: btmtk_main
> State machine: Mediatek chip error recovery
> Dev allocate: Bluetooth dev.
> Mediatek chip-related behavior: Firmware download.
> HCI device-related: hci register, open, close and send_frame.
> 
> [HIF Part] : btmtkusb/btmtksdio/btmtkuart
> hif_hook (cif interface): read/write register, open/close, chip reset and etc.
> hif_register (cif register): hif registration-related, such as usb_register/sdio_register_driver.
> 
> May we use the driver architecture?

You can do that, but then first start with the existing btmtksdio and btmtkuart drivers to show me how you want to design it. You still have to design it cleanly.

Regards

Marcel


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
