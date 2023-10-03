Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3F9FE7AD7A
	for <linux-mediatek@archiver.kernel.org>; Tue,  3 Oct 2023 16:11:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KJIb/JY4n8tGZSqHXme95COkElXYXHHoPPYozHgYq+o=; b=pWkDdcSrKZWIsMkC4q2I4TNOe5
	g8w0IfsVwgl9uYDfUS4/KtcVPlSBkIao52OWIDHVCyNA63Tm2JaPo9KsfVQzxzWD+75kFhQWOuBjo
	7kHJDAnJajulivJO7EWRMPiWshLlDTnRHpoN5o1xG8JcHo8/c+hSAAwhoKQQQCY0uE1DsyqQVK1eW
	cSjIPpGNuBINkxNpPvs7MPI4nyVIJLvw4e1Ktfw1PsEdZA19kEiT+32xqznvkq0/Vf69nszVUWcjD
	yfEL8QTD7+TnPQldxCCFBiAgJpWiGlwLNG5Nv0nQO2tscMZ4/+0XXgArN2CUVhFco1xd3pERbMjb8
	Ntv4i1CQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qnhzC-00Ewgr-1I;
	Tue, 03 Oct 2023 16:11:02 +0000
Received: from mail-yb1-xb30.google.com ([2607:f8b0:4864:20::b30])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qnhz9-00Ewdq-2j;
	Tue, 03 Oct 2023 16:11:01 +0000
Received: by mail-yb1-xb30.google.com with SMTP id 3f1490d57ef6-d818d65f23cso1139030276.3;
        Tue, 03 Oct 2023 09:10:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1696349458; x=1696954258; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KJIb/JY4n8tGZSqHXme95COkElXYXHHoPPYozHgYq+o=;
        b=D06Qt2ehPbnyEW0e/0lmDlpmFQ6vcn8qKPHleIsHEPmAENfkrnYFa047iSwj+c5g3Z
         LGWWIncosHpRQ6hZ4V0n7u9MKytFCrLGmflnaPmPbu1zJRHt7cqdjgXtKw1kxdN8gjR5
         KWDmSZojzeOco3f3NJz/cTuhzK5O3j9aetQ939QTByMO0ZqqrXaCPvXZDh7XfgNfKYXU
         U/eAQIsWGwWk+JD5A1qsQFYyb23rkXI6U85kKIac7V4hBe8/nlWARau0Q92WBDQvKb2/
         CfpjPUY+SukPYqOeAfaXixaXBtMvJVZK2vWhjlpYMQ8JAjPPO+RusZQ/kWR13loWvECJ
         +VUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696349458; x=1696954258;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KJIb/JY4n8tGZSqHXme95COkElXYXHHoPPYozHgYq+o=;
        b=Y1KgGkv1x3CqpHbnGNbn08vvozCqdUE7NO4Vu8/k22HJWVH09N2mflbIofflu8Iw1P
         wSqnzZdi26QXBvNNJdY2UeUQZMhUWoAKFujnnx/GxjG63y5XRgaYhnPhRF7QTlEfkmEm
         WG20JdG3giqo8wlTWqL3Y1WklMLexWgXeBJJEso1EFE6KmUq9pncyIfSk66HAZh8Zlk0
         AwL5trx+1gxQzmF/Dm7PIgbG8LzR1++WLraoH2CdidsA+bOufnQfwgmF7hjmjbajwviQ
         MTDh/e4UT5RYRQUALucETWKntpcPTNFhgNh9LLbwm7pGOpZqQla3Uu6Zw3LBPRpDyLo+
         ndWg==
X-Gm-Message-State: AOJu0YwF/vvpR+AeEe3BBy+YzvIS//PuXbAfdddN85kD4yob7jpz4oMP
	++yfeD5f8DL/G0V7K2FkgJe+khbMH8uXdbTj498=
X-Google-Smtp-Source: AGHT+IG/rOtVRw7F1FQYoc2gJxlkY9rYdDDcV+U8qqwVIQAeOKxjsSAmjvcNMnfvzHJq5/eE+kYTAKspnaDSyL4EZ10=
X-Received: by 2002:a25:cf95:0:b0:d80:1161:5ec1 with SMTP id
 f143-20020a25cf95000000b00d8011615ec1mr13414568ybg.20.1696349457871; Tue, 03
 Oct 2023 09:10:57 -0700 (PDT)
MIME-Version: 1.0
References: <CAH7-e5sb+kT_LRb1_y-c5JaFN0=KrrRT97otUPKzTCgzGsVdrQ@mail.gmail.com>
 <ZRtWcgiH5JhD5NU2@debian.me> <CAH7-e5uspavg_VBJxKLOKJfU3nAq-OrPqzihF2opffY-ReiC-w@mail.gmail.com>
 <834062302e6a98e773dc4b03d7ed568a0f1c44fc.camel@nordicsemi.no>
 <CAH7-e5uZzmnFJAJrG664G6_JbK--DfbKC50aeVN5gMMxDJ51UA@mail.gmail.com> <ba7aaaed859ea2c4f5aac597deb382cceab33d65.camel@nordicsemi.no>
In-Reply-To: <ba7aaaed859ea2c4f5aac597deb382cceab33d65.camel@nordicsemi.no>
From: =?UTF-8?Q?Erik_Dob=C3=A1k?= <erik.dobak@gmail.com>
Date: Tue, 3 Oct 2023 18:10:46 +0200
Message-ID: <CAH7-e5unq6ggNjVkSsriUAmpvk4s7-NCYJrZnLK_3BjFO_Dceg@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20231003_091059_885009_9D93DB34 
X-CRM114-Status: GOOD (  17.31  )
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

Sorry Tomasz,

that must have been a reality glitch with your commit (cant find the
page refering to your commit now). But yes it is probably a kernel bug
as it manifests kernels 6.4 and not in the 6.1 LTS version.

Yours

E

On Tue, 3 Oct 2023 at 15:08, Tomasz Mo=C5=84 <tomasz.mon@nordicsemi.no> wro=
te:
>
> On Tue, 2023-10-03 at 14:42 +0200, Erik Dob=C3=A1k wrote:
> > Sure here you go:
> >
> > # lsusb -d 04c5:1670 -v
> >
> > Bus 001 Device 004: ID 04c5:1670 Fujitsu, Ltd Bluetooth Radio
> > Device Descriptor:
> >   bLength                18
> >   bDescriptorType         1
> >   bcdUSB               1.00
> >   bDeviceClass          224 Wireless
> >   bDeviceSubClass         1 Radio Frequency
> >   bDeviceProtocol         1 Bluetooth
> >   bMaxPacketSize0        64
> >   idVendor           0x04c5 Fujitsu, Ltd
> >   idProduct          0x1670
> >   bcdDevice            0.00
> >   iManufacturer           1 Realtek
> >   iProduct                2 Bluetooth Radio
> >   iSerial                 3 00e04c000001
> >   bNumConfigurations      1
> >   Configuration Descriptor:
> >     bLength                 9
> >     bDescriptorType         2
> >     wTotalLength       0x00b1
> >     bNumInterfaces          2
> >     bConfigurationValue     1
> >     iConfiguration          0
> >     bmAttributes         0xe0
> >       Self Powered
> >       Remote Wakeup
> >     MaxPower              500mA
> >     Interface Descriptor:
> >       bLength                 9
> >       bDescriptorType         4
> >       bInterfaceNumber        0
> >       bAlternateSetting       0
> >       bNumEndpoints           3
> >       bInterfaceClass       224 Wireless
> >       bInterfaceSubClass      1 Radio Frequency
> >       bInterfaceProtocol      1 Bluetooth
> >       iInterface              4 Bluetooth Radio
>
> I have no idea why you referred to my commits, i.e. c13380a55522
> ("Bluetooth: btusb: Do not require hardcoded interface numbers") later
> fixed by eaac6e223a0d ("Bluetooth: btusb: Fix bluetooth on Intel
> Macbook 2014") in the first place.
>
> BTUSB_IFNUM_2 is not even getting set for this device and therefore the
> patches have no impact on your issue. If you were affected, like the
> Intel Macbook 2014 was, then bear in mind that the issue would manifest
> as btusb driver not even binding to the device. From your emails
> however it appears that the issue is something different.
>
> I honestly don't think it has anything to do with my patches. If you
> know a Linux version where your bluetooth device works, then the next
> step would be to bisect to find the first bad commit.
>
> Best Regards,
> Tomasz Mo=C5=84

