Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F156E8FDCC
	for <linux-mediatek@archiver.kernel.org>; Wed,  4 Oct 2023 05:20:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VhG0fuqbdSJY3FUedHZYhk5bPq53GeQ0zyxMuC06Sx8=; b=qQkQjwu8VgNM4j
	uZEnNNCmzHbN0oCumxlmdwat/CZ2Bfi/3hcCLH9oOuIpp/pOe+67wYxhck+kDKciJnDxXBbQIpwgN
	uxRovFRTAU3Mcckg5SgKPfuzfepl97RmKqe9uunk/DKdzMMdxWBY+PJlYAypFTOxeO0Tgj2aBSOJK
	EX+i9/b3jH5WTzZaKKGE3ICb3XN2m7bJdYrg0TRrEP2HeGLejx0PAgjk+c6/CevoSvV433g4F+30Y
	tSfwcYIdVao6QQ+AF8nmfU7GMiA/3UbJ5W1zxp9RToELEzTYCWhXXOY5DWQyISL9y0zdwqTKXkFV3
	z5qVKiOzNGwq70lNZ0eA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qnuJ8-00GHmH-2z;
	Wed, 04 Oct 2023 05:20:26 +0000
Received: from wp530.webpack.hosteurope.de ([80.237.130.52])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qnuJ5-00GHlk-2E;
	Wed, 04 Oct 2023 05:20:25 +0000
Received: from [2a02:8108:8980:2478:8cde:aa2c:f324:937e]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1qnuIy-0004Si-FW; Wed, 04 Oct 2023 07:20:16 +0200
Message-ID: <3e86e69c-64bc-4776-9ee8-75b98be1bf3e@leemhuis.info>
Date: Wed, 4 Oct 2023 07:20:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: bluetooth issues since kernel 6.4 - not discovering other bt
 devices - /linux/drivers/bluetooth/btusb.c
Content-Language: en-US, de-DE
To: =?UTF-8?Q?Erik_Dob=C3=A1k?= <erik.dobak@gmail.com>,
 =?UTF-8?Q?Tomasz_Mo=C5=84?= <tomasz.mon@nordicsemi.no>
Cc: Bagas Sanjaya <bagasdotme@gmail.com>,
 Linux Stable <stable@vger.kernel.org>,
 Linux Bluetooth <linux-bluetooth@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Linux Mediatek <linux-mediatek@lists.infradead.org>,
 Linux Regressions <regressions@lists.linux.dev>,
 Marcel Holtmann <marcel@holtmann.org>,
 Johan Hedberg <johan.hedberg@gmail.com>,
 Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
References: <CAH7-e5sb+kT_LRb1_y-c5JaFN0=KrrRT97otUPKzTCgzGsVdrQ@mail.gmail.com>
 <ZRtWcgiH5JhD5NU2@debian.me>
 <CAH7-e5uspavg_VBJxKLOKJfU3nAq-OrPqzihF2opffY-ReiC-w@mail.gmail.com>
 <834062302e6a98e773dc4b03d7ed568a0f1c44fc.camel@nordicsemi.no>
 <CAH7-e5uZzmnFJAJrG664G6_JbK--DfbKC50aeVN5gMMxDJ51UA@mail.gmail.com>
 <ba7aaaed859ea2c4f5aac597deb382cceab33d65.camel@nordicsemi.no>
 <CAH7-e5unq6ggNjVkSsriUAmpvk4s7-NCYJrZnLK_3BjFO_Dceg@mail.gmail.com>
From: "Linux regression tracking (Thorsten Leemhuis)"
 <regressions@leemhuis.info>
In-Reply-To: <CAH7-e5unq6ggNjVkSsriUAmpvk4s7-NCYJrZnLK_3BjFO_Dceg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1696396823;4693e961;
X-HE-SMSGID: 1qnuIy-0004Si-FW
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231003_222023_873486_B021BEB7 
X-CRM114-Status: GOOD (  16.74  )
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
Reply-To: Linux regressions mailing list <regressions@lists.linux.dev>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On 03.10.23 18:10, Erik Dobák wrote:
> Sorry Tomasz,
> 
> that must have been a reality glitch with your commit (cant find the
> page refering to your commit now). But yes it is probably a kernel bug
> as it manifests kernels 6.4 and not in the 6.1 LTS version.

Could you then please try a bisection to get us closer to the problem?
You might want to try mainline (e.g. 6.6-rc4) first, with a bit of luck
the problem is fixed there already; FWIW, a few BT fixes that might or
might not be relevant for your case are heading that way and will most
likely be in 6.6-rc5.

Ciao, Thorsten

> On Tue, 3 Oct 2023 at 15:08, Tomasz Moń <tomasz.mon@nordicsemi.no> wrote:
>>
>> On Tue, 2023-10-03 at 14:42 +0200, Erik Dobák wrote:
>>> Sure here you go:
>>>
>>> # lsusb -d 04c5:1670 -v
>>>
>>> Bus 001 Device 004: ID 04c5:1670 Fujitsu, Ltd Bluetooth Radio
>>> Device Descriptor:
>>>   bLength                18
>>>   bDescriptorType         1
>>>   bcdUSB               1.00
>>>   bDeviceClass          224 Wireless
>>>   bDeviceSubClass         1 Radio Frequency
>>>   bDeviceProtocol         1 Bluetooth
>>>   bMaxPacketSize0        64
>>>   idVendor           0x04c5 Fujitsu, Ltd
>>>   idProduct          0x1670
>>>   bcdDevice            0.00
>>>   iManufacturer           1 Realtek
>>>   iProduct                2 Bluetooth Radio
>>>   iSerial                 3 00e04c000001
>>>   bNumConfigurations      1
>>>   Configuration Descriptor:
>>>     bLength                 9
>>>     bDescriptorType         2
>>>     wTotalLength       0x00b1
>>>     bNumInterfaces          2
>>>     bConfigurationValue     1
>>>     iConfiguration          0
>>>     bmAttributes         0xe0
>>>       Self Powered
>>>       Remote Wakeup
>>>     MaxPower              500mA
>>>     Interface Descriptor:
>>>       bLength                 9
>>>       bDescriptorType         4
>>>       bInterfaceNumber        0
>>>       bAlternateSetting       0
>>>       bNumEndpoints           3
>>>       bInterfaceClass       224 Wireless
>>>       bInterfaceSubClass      1 Radio Frequency
>>>       bInterfaceProtocol      1 Bluetooth
>>>       iInterface              4 Bluetooth Radio
>>
>> I have no idea why you referred to my commits, i.e. c13380a55522
>> ("Bluetooth: btusb: Do not require hardcoded interface numbers") later
>> fixed by eaac6e223a0d ("Bluetooth: btusb: Fix bluetooth on Intel
>> Macbook 2014") in the first place.
>>
>> BTUSB_IFNUM_2 is not even getting set for this device and therefore the
>> patches have no impact on your issue. If you were affected, like the
>> Intel Macbook 2014 was, then bear in mind that the issue would manifest
>> as btusb driver not even binding to the device. From your emails
>> however it appears that the issue is something different.
>>
>> I honestly don't think it has anything to do with my patches. If you
>> know a Linux version where your bluetooth device works, then the next
>> step would be to bisect to find the first bad commit.
>>
>> Best Regards,
>> Tomasz Moń
> 
> 

