Return-Path: <SRS0=uG8S=M4=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E313DC4338F
	for <linux-mediatek@archiver.kernel.org>; Thu,  5 Aug 2021 01:35:24 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id ADBB460F01
	for <linux-mediatek@archiver.kernel.org>; Thu,  5 Aug 2021 01:35:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org ADBB460F01
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gorani.run
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:Cc:To:Subject:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=qMASn9F02u00QG7GroLDZDxnP7Tqben497j0+d3ovkk=; b=g3iqtBnFUOrQQZD4wDYfyTvDk1
	iMurUInwYEBMVHFkU19Aa9pt8TQ3Fz/oq2raeJOw9224KANlyZZ2lgqRBHmkgjjqGYf0D9kOPFwPt
	DAqxkeV9epNSXjkTI+V3YhgGT1jsYGCPRlCRUUm6LtLrp/W2sNIOvJO3fnj281zTPh13sibY3NOh2
	Rj+IkaJ/kNugcMfYddeV60JSgCznXrQh2blBakdgzC3+hLdl7PWvndOIm/UrABkheXpxrxrNsifU2
	0ru4y8TK2FWHr6DTQmaloGMn3VnHLh9HK6KulxPT2MxMBygbdECjDgSBypywgLfHOMw/jVFNo8Y+T
	evmOebSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mBSHu-007os7-4t; Thu, 05 Aug 2021 01:35:10 +0000
Received: from mout-p-101.mailbox.org ([2001:67c:2050::465:101])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mBSHf-007oq9-VC; Thu, 05 Aug 2021 01:34:58 +0000
Received: from smtp1.mailbox.org (smtp1.mailbox.org
 [IPv6:2001:67c:2050:105:465:1:1:0])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4GgB4B36xPzQk2m;
 Thu,  5 Aug 2021 03:34:50 +0200 (CEST)
X-Virus-Scanned: amavisd-new at heinlein-support.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gorani.run; s=MBO0001; 
 t=1628127286;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZE+O5cegW+iGebRWUhEH5E4wIAzdvgqgde4doV7RxnQ=;
 b=vTi3Q3bMHhE54KV89e8W4EIYg7qQRDhTc58ZeJ0z1tt+6aDO+XQ6B/FMOvSOpgdS1NrvLi
 UlXbHDDn6yTwNJ8Kxp0Rq4ikcIl35uwBFRBVQuJOEwH3wn9U4VXJO6/nQXhRKGdDkbLgvi
 pDmT0bvrKUWzAkOcyMHdGnc8Y5bypaKdDX9CKkDc5JWyLMAlZemAQuYIj6osPdbQcBe1xD
 sqjNvXTmGAgRrBnP2DxemGDX4mgM+UYNjSP2w6EhUKw+Xb6nNGyonL9R52NdSfnTuItalD
 sKUBkehXbmmMqvcHzmoeEASFCXoced4ojdrp+zMzUn6mxptWLhRnBI6XrCUNWA==
Received: from smtp1.mailbox.org ([80.241.60.240])
 by spamfilter03.heinlein-hosting.de (spamfilter03.heinlein-hosting.de
 [80.241.56.117]) (amavisd-new, port 10030)
 with ESMTP id gunOhzsQxFz4; Thu,  5 Aug 2021 03:34:45 +0200 (CEST)
Subject: Re: Aw: Re: [PATCH 0/2] Add MUSB for MT7623
To: Frank Wunderlich <frank-w@public-files.de>
Cc: linux-mediatek@lists.infradead.org,
 Chunfeng Yun <chunfeng.yun@mediatek.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Rob Herring <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Min Guo <min.guo@mediatek.com>, devicetree@vger.kernel.org,
 linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20210803151320.71531-1-mans0n@gorani.run>
 <trinity-0f9449b8-5114-46e5-9a4f-00b62155a938-1628010948338@3c-app-gmx-bs54>
 <f3607979-ea50-fc1c-0afe-a55881aa24f0@gorani.run>
 <trinity-8910c659-6e4e-4979-a6d0-eaf5b8bee213-1628064668849@3c-app-gmx-bap67>
From: Sungbo Eo <mans0n@gorani.run>
Message-ID: <a6f4d24f-c79b-35e4-43fb-90eb75623dc2@gorani.run>
Date: Thu, 5 Aug 2021 10:34:35 +0900
MIME-Version: 1.0
In-Reply-To: <trinity-8910c659-6e4e-4979-a6d0-eaf5b8bee213-1628064668849@3c-app-gmx-bap67>
X-Rspamd-Queue-Id: 6EE5B1887
X-Rspamd-UID: ce070d
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210804_183456_259867_35F6AA03 
X-CRM114-Status: GOOD (  22.69  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On 2021-08-04 17:11, Frank Wunderlich wrote:
>> Gesendet: Mittwoch, 04. August 2021 um 02:14 Uhr
>> Von: "Sungbo Eo" <mans0n@gorani.run>
> 
>>> thanks for working on it. do both otg-roles (host/client) work on your device?
>>
>> Yes, I tested it with host mode and device mode.
>> I also tried manual role-switch via sysfs and it worked with some prior setup.
>> Note that my device has a USB Type-A connector and not micro B, so I can't help with id pin stuff...
> 
>>> but usb-stick is not powered (led of the stick is off) and of course i see no mass-storage device.
>>
>> I observed the same symptom (but different error log).
>>
>> [    2.722253] musb-hdrc musb-hdrc.1.auto: VBUS_ERROR in a_idle (80, <SessEnd), retry #0, port1 00000104
>>
>> In my case adding `regulator-always-on;` in the regulator node solved the problem temporarily.
>> But after that I switched to relying on pinctrl.
> 
> i've found out that usb-stick is powered if i first connect otg-cable and then the stick to the cable...regulator always on does not change anything for me (only supporess "disabling vusb" message on boot). traceback on poweroff is still there.

I tried to reproduce your usb-conn-gpio message on my machine but I failed.
Probably because my USB port does not have ID pin...

Currently OpenWrt does not enable CONFIG_POWER_RESET_MT6323 so I was not aware of the poweroff error.
After I enabled it I got the same error and I could not resolve it... I'd better disable it for now.

> 
> role switch happen on inserting stick into cable, not before (insert cable into r2) as i expected.
> 
> need to figure out which CONFIG options i need to get USB-Stick as mass storage working.

Do you mean that vbus turns on but your usb stick is not detected?
Does that change if you use `dr_mode = "host"`?

> 
> i wonder why it works on your board without the vusb/connector subnodes

Do you mean vbus subnode in musb or vusb subnode in pmic?
I've never used vusb node, it did not affect me in any way.
When I used usb_vbus regulator node to enable vbus line, it did not turn on the line unless I added `regulator-always-on`...
It seems the connector node is not really required for me.

> 
>> +&pio {
>> +       musb_pins: musb {
>> +               pins-musb {
>> +                       pinmux = <MT7623_PIN_237_EXT_SDIO2_FUNC_DRV_VBUS>;
>> +               };
>> +       };
>> +};
> 
> imho it's the same gpio used for regulator, right? whats the difference?
> i tried this instead of the regulator-node => not powered (cable first, then stick).

I don't really know how it does work, but for me it does turn on vbus in host mode and turn it off in device mode.
I imagined DRV_VBUS setup will make the musb controller itself (and not kernel) control the line as needed, but it's just my guess.

> 
>> +&usb3 {
>> +       pinctrl-names = "default";
>> +       pinctrl-0 = <&musb_pins>;
>> +       status = "okay";
>> +
>> +       dr_mode = "host";
>> +
>> +       connector {
>> +               compatible = "usb-a-connector";
>> +       };
>> +};
>>
>> root@OpenWrt:~# lsusb -t
>> /:  Bus 03.Port 1: Dev 1, Class=root_hub, Driver=musb-hdrc/1p, 480M
>>     |__ Port 1: Dev 2, If 0, Class=, Driver=usb-storage, 480M
>> /:  Bus 02.Port 1: Dev 1, Class=root_hub, Driver=xhci-mtk/1p, 5000M
>> /:  Bus 01.Port 1: Dev 1, Class=root_hub, Driver=xhci-mtk/1p, 480M
>>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
