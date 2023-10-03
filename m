Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E4A2E75457
	for <linux-mediatek@archiver.kernel.org>; Tue,  3 Oct 2023 12:43:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4D5yrQwAB5o2ihQ86wqsOMYFEN0hjw1F6HyvBzf1fiE=; b=K+BCY42Lqrm3pcahfEHknSg6w+
	7UFgiXqFriMjGBIFYmdWKOqcrb5ozYnmYZP6Ruk35+MCPoFOLf7fPJCZ+VCEV6Gb1X58Xkg5HlXEj
	AVUsXOuKoUdjTCjYt9TllfeZGIolH8EWS2pX2382mEMPBcIUZaXr5cSRev2bTvh+Ua0ocRl6HPEcg
	b5VE/9UvnvlSrU/KxoemcuPA6lKIrIYhADa52eZmSIpy69HNsVnQYaHKxXzOq/OBy+uAGz5DF5IDg
	x/2ubotULY7wRS4iktcQj1BdJRytfLKnWAChxJAGVu1rfVc5cOuBYgDTF1oDkpzI0qR2/uOC7+XLd
	ohcim9CQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qnek3-00EdTG-09;
	Tue, 03 Oct 2023 12:43:11 +0000
Received: from mail-yw1-x112d.google.com ([2607:f8b0:4864:20::112d])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qnejy-00EdRu-2P;
	Tue, 03 Oct 2023 12:43:08 +0000
Received: by mail-yw1-x112d.google.com with SMTP id 00721157ae682-59f4bc88f9fso9876227b3.2;
        Tue, 03 Oct 2023 05:43:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1696336983; x=1696941783; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4D5yrQwAB5o2ihQ86wqsOMYFEN0hjw1F6HyvBzf1fiE=;
        b=PIthg8FjFgyZWuP63YJ/pjGh/j9aNqMVpWEfbCRAxVMLLvTR2/KK7hpgzwJS5ifdg9
         oTMBZOt6xwFS/tCbC4TNUxx4wIQBQjJDFLUjcHvpkhPFy0EAuxVxaGuYpMhVWxSTuyeM
         VWXtK23i5LlTqQ3DyPw+rEm5ew+IdyOg/9kWdRaZHNfG54qG5k2G3feuM4zpfnWKo6MV
         hw5aLi0xQO/kyfZw2TTDaef/ZYxMl797rFEeC9GBl52APmg4XSrB0ooloc50UdbreZ3I
         YlemuoKqRyiPkd/n3jP+ZNqMrXmvxxSymt9DrPyiBykdZrDusXnmAvZBckxfQpPsKQ4P
         0RFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696336983; x=1696941783;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4D5yrQwAB5o2ihQ86wqsOMYFEN0hjw1F6HyvBzf1fiE=;
        b=L0879MGUw/sol2gmeDb6AfXhGL60HixnZCp7jcsknIEebxcwNjrlonn1vYovma9ncs
         zCudtzK+91744WYANKhUXA9ifkgsIlSGgE4QBeIh9iMHAKdKZwoOF2HH6AQzEJc6NLDY
         uP/QbxOGdqhISkVIBm1DzpONzamodE1IcYCPmu8rMW2nrh919aQWYJASNhKYkgmnWap/
         TQbavtCWjrIsGg3pXkUofTrEmEODg86HGsSq6xzOcbMeTBgqlBOP3oo4wLCgW3ubulC6
         3ksQL6BILvNN1tpVMVBhCEkcemHhqRs8QnDLzRJvClPXvKPqA8oPX3pSJe78DjVed38d
         O+og==
X-Gm-Message-State: AOJu0Yyo0wP9hH6ts3tWjAjy9pi1vrqKxHbkiFerI/fpof7cnOj6s1Lq
	Am53GpDCuXEx+AGcOUM/znUBnkLzN0mciaAr3ZM61eWufOVXRQ==
X-Google-Smtp-Source: AGHT+IGKRsmT9DgPHuTJmO3N9CH6pljRjBRrifC5fsGPjYUKRDiNean3VywF0pwdC17BP1/gPJNHu4wjqF28NCD2LIU=
X-Received: by 2002:a25:cbd7:0:b0:d06:f0ab:e17b with SMTP id
 b206-20020a25cbd7000000b00d06f0abe17bmr12013032ybg.55.1696336983056; Tue, 03
 Oct 2023 05:43:03 -0700 (PDT)
MIME-Version: 1.0
References: <CAH7-e5sb+kT_LRb1_y-c5JaFN0=KrrRT97otUPKzTCgzGsVdrQ@mail.gmail.com>
 <ZRtWcgiH5JhD5NU2@debian.me> <CAH7-e5uspavg_VBJxKLOKJfU3nAq-OrPqzihF2opffY-ReiC-w@mail.gmail.com>
 <834062302e6a98e773dc4b03d7ed568a0f1c44fc.camel@nordicsemi.no>
In-Reply-To: <834062302e6a98e773dc4b03d7ed568a0f1c44fc.camel@nordicsemi.no>
From: =?UTF-8?Q?Erik_Dob=C3=A1k?= <erik.dobak@gmail.com>
Date: Tue, 3 Oct 2023 14:42:52 +0200
Message-ID: <CAH7-e5uZzmnFJAJrG664G6_JbK--DfbKC50aeVN5gMMxDJ51UA@mail.gmail.com>
Subject: Re: bluetooth issues since kernel 6.4 - not discovering other bt
 devices - /linux/drivers/bluetooth/btusb.c
To: =?UTF-8?Q?Tomasz_Mo=C5=84?= <tomasz.mon@nordicsemi.no>
Cc: Bagas Sanjaya <bagasdotme@gmail.com>, Linux Stable <stable@vger.kernel.org>, 
	Linux Bluetooth <linux-bluetooth@vger.kernel.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux ARM <linux-arm-kernel@lists.infradead.org>, 
	Linux Mediatek <linux-mediatek@lists.infradead.org>, 
	Linux Regressions <regressions@lists.linux.dev>, Marcel Holtmann <marcel@holtmann.org>, 
	Johan Hedberg <johan.hedberg@gmail.com>, Luiz Augusto von Dentz <luiz.dentz@gmail.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231003_054306_805137_84F94B0A 
X-CRM114-Status: GOOD (  12.80  )
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

On Tue, 3 Oct 2023 at 14:32, Tomasz Mo=C5=84 <tomasz.mon@nordicsemi.no> wro=
te:
>
> On Tue, 2023-10-03 at 14:25 +0200, Erik Dob=C3=A1k wrote:
> > Hi i booted now into linux-6.6-rc4 and the issue is still there. No
> > bluetooth devices are discovered.
> > with this device: Bus 001 Device 004: ID 04c5:1670 Fujitsu, Ltd Bluetoo=
th Radio
>
> Can you please be more specific and for example attach the full
> descriptor? One way to get the descriptor would be to run:
>   lsusb -d 04c5:1760 -v
>
> Best Regards,
> Tomasz Mo=C5=84

Sure here you go:

# lsusb -d 04c5:1670 -v

Bus 001 Device 004: ID 04c5:1670 Fujitsu, Ltd Bluetooth Radio
Device Descriptor:
  bLength                18
  bDescriptorType         1
  bcdUSB               1.00
  bDeviceClass          224 Wireless
  bDeviceSubClass         1 Radio Frequency
  bDeviceProtocol         1 Bluetooth
  bMaxPacketSize0        64
  idVendor           0x04c5 Fujitsu, Ltd
  idProduct          0x1670
  bcdDevice            0.00
  iManufacturer           1 Realtek
  iProduct                2 Bluetooth Radio
  iSerial                 3 00e04c000001
  bNumConfigurations      1
  Configuration Descriptor:
    bLength                 9
    bDescriptorType         2
    wTotalLength       0x00b1
    bNumInterfaces          2
    bConfigurationValue     1
    iConfiguration          0
    bmAttributes         0xe0
      Self Powered
      Remote Wakeup
    MaxPower              500mA
    Interface Descriptor:
      bLength                 9
      bDescriptorType         4
      bInterfaceNumber        0
      bAlternateSetting       0
      bNumEndpoints           3
      bInterfaceClass       224 Wireless
      bInterfaceSubClass      1 Radio Frequency
      bInterfaceProtocol      1 Bluetooth
      iInterface              4 Bluetooth Radio
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x81  EP 1 IN
        bmAttributes            3
          Transfer Type            Interrupt
          Synch Type               None
          Usage Type               Data
        wMaxPacketSize     0x0010  1x 16 bytes
        bInterval               1
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x02  EP 2 OUT
        bmAttributes            2
          Transfer Type            Bulk
          Synch Type               None
          Usage Type               Data
        wMaxPacketSize     0x0040  1x 64 bytes
        bInterval               0
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x82  EP 2 IN
        bmAttributes            2
          Transfer Type            Bulk
          Synch Type               None
          Usage Type               Data
        wMaxPacketSize     0x0040  1x 64 bytes
        bInterval               0
    Interface Descriptor:
      bLength                 9
      bDescriptorType         4
      bInterfaceNumber        1
      bAlternateSetting       0
      bNumEndpoints           2
      bInterfaceClass       224 Wireless
      bInterfaceSubClass      1 Radio Frequency
      bInterfaceProtocol      1 Bluetooth
      iInterface              4 Bluetooth Radio
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x03  EP 3 OUT
        bmAttributes            1
          Transfer Type            Isochronous
          Synch Type               None
          Usage Type               Data
        wMaxPacketSize     0x0000  1x 0 bytes
        bInterval               1
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x83  EP 3 IN
        bmAttributes            1
          Transfer Type            Isochronous
          Synch Type               None
          Usage Type               Data
        wMaxPacketSize     0x0000  1x 0 bytes
        bInterval               1
    Interface Descriptor:
      bLength                 9
      bDescriptorType         4
      bInterfaceNumber        1
      bAlternateSetting       1
      bNumEndpoints           2
      bInterfaceClass       224 Wireless
      bInterfaceSubClass      1 Radio Frequency
      bInterfaceProtocol      1 Bluetooth
      iInterface              4 Bluetooth Radio
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x03  EP 3 OUT
        bmAttributes            1
          Transfer Type            Isochronous
          Synch Type               None
          Usage Type               Data
        wMaxPacketSize     0x0009  1x 9 bytes
        bInterval               1
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x83  EP 3 IN
        bmAttributes            1
          Transfer Type            Isochronous
          Synch Type               None
          Usage Type               Data
        wMaxPacketSize     0x0009  1x 9 bytes
        bInterval               1
    Interface Descriptor:
      bLength                 9
      bDescriptorType         4
      bInterfaceNumber        1
      bAlternateSetting       2
      bNumEndpoints           2
      bInterfaceClass       224 Wireless
      bInterfaceSubClass      1 Radio Frequency
      bInterfaceProtocol      1 Bluetooth
      iInterface              4 Bluetooth Radio
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x03  EP 3 OUT
        bmAttributes            1
          Transfer Type            Isochronous
          Synch Type               None
          Usage Type               Data
        wMaxPacketSize     0x0011  1x 17 bytes
        bInterval               1
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x83  EP 3 IN
        bmAttributes            1
          Transfer Type            Isochronous
          Synch Type               None
          Usage Type               Data
        wMaxPacketSize     0x0011  1x 17 bytes
        bInterval               1
    Interface Descriptor:
      bLength                 9
      bDescriptorType         4
      bInterfaceNumber        1
      bAlternateSetting       3
      bNumEndpoints           2
      bInterfaceClass       224 Wireless
      bInterfaceSubClass      1 Radio Frequency
      bInterfaceProtocol      1 Bluetooth
      iInterface              4 Bluetooth Radio
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x03  EP 3 OUT
        bmAttributes            1
          Transfer Type            Isochronous
          Synch Type               None
          Usage Type               Data
        wMaxPacketSize     0x0019  1x 25 bytes
        bInterval               1
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x83  EP 3 IN
        bmAttributes            1
          Transfer Type            Isochronous
          Synch Type               None
          Usage Type               Data
        wMaxPacketSize     0x0019  1x 25 bytes
        bInterval               1
    Interface Descriptor:
      bLength                 9
      bDescriptorType         4
      bInterfaceNumber        1
      bAlternateSetting       4
      bNumEndpoints           2
      bInterfaceClass       224 Wireless
      bInterfaceSubClass      1 Radio Frequency
      bInterfaceProtocol      1 Bluetooth
      iInterface              4 Bluetooth Radio
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x03  EP 3 OUT
        bmAttributes            1
          Transfer Type            Isochronous
          Synch Type               None
          Usage Type               Data
        wMaxPacketSize     0x0021  1x 33 bytes
        bInterval               1
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x83  EP 3 IN
        bmAttributes            1
          Transfer Type            Isochronous
          Synch Type               None
          Usage Type               Data
        wMaxPacketSize     0x0021  1x 33 bytes
        bInterval               1
    Interface Descriptor:
      bLength                 9
      bDescriptorType         4
      bInterfaceNumber        1
      bAlternateSetting       5
      bNumEndpoints           2
      bInterfaceClass       224 Wireless
      bInterfaceSubClass      1 Radio Frequency
      bInterfaceProtocol      1 Bluetooth
      iInterface              4 Bluetooth Radio
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x03  EP 3 OUT
        bmAttributes            1
          Transfer Type            Isochronous
          Synch Type               None
          Usage Type               Data
        wMaxPacketSize     0x0031  1x 49 bytes
        bInterval               1
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x83  EP 3 IN
        bmAttributes            1
          Transfer Type            Isochronous
          Synch Type               None
          Usage Type               Data
        wMaxPacketSize     0x0031  1x 49 bytes
        bInterval               1
Device Status:     0x0001
  Self Powered

