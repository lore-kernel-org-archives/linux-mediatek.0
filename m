Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87297C4332F
	for <linux-mediatek@archiver.kernel.org>; Wed,  1 Nov 2023 15:49:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gi/cA1xFlkm8PTXHxgTpI8HEV8sUdw+/4F8StYPG7eQ=; b=T16XbrVkCmiuM5akozn5yH1FUT
	nFvHS2G9wgznS7hYjjtowiWTA//aKRSzcW9MknscseF7czuef6ink2aTo822z7J+xsWuZB24kilaU
	Am+aWNu1Mxb7pZ59kng/ucABto1OvWSCG6XwKAwBJZxSsOUSxLJDoMjOaCT7aRR2rMEOeevIvEzue
	4r3gNPf59eT0P20kZqWcNq8YeqDFLJeyB0Ua9/hcgsU9ALKdaC0Mfj2HpzI59PyDcLTgx2bOcCCmI
	mOJ5qTZq6QSWXysil2ut2qVxKuocb/D9XudUYKV1mFATecV2d5N0uql6LxKoABA79ST9pdgJ8c3vu
	CTBcIePw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qyDSp-007lkn-14;
	Wed, 01 Nov 2023 15:49:03 +0000
Received: from mail-ej1-f47.google.com ([209.85.218.47])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qyDSj-007liy-1O;
	Wed, 01 Nov 2023 15:49:01 +0000
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-9ae2cc4d17eso1068882966b.1;
        Wed, 01 Nov 2023 08:48:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698853734; x=1699458534;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gi/cA1xFlkm8PTXHxgTpI8HEV8sUdw+/4F8StYPG7eQ=;
        b=gmetEhRrNGqBEoKW5IzSY7Gjk+No1Pu1zBF59BnRpgPmk4x9wfW+datR3nugCeqV1s
         HN/ZFkam9lXu1dNJGPMfoeipRS/vj/3V6vOAkuhXpXnN7pHxc4tIGPEGHYL6/YuZBnLs
         3palhDgX+mhpHVJnh4un2oIg1hKJCrQyOl1TYeTlSOxaJDG4Cti4KLDIZuv6+xIJJhrr
         pFcEvgFcboM3zgdLPgdwd4mD5X88K4t9bCBYdPug/jhQQ+9BXr0SkvaUUmxOIydrzEQx
         t1oJaPMgv1rGo2TmzyKxEVrVZ2qof5sD88HRuRPoQckHZIKijijLw6mipsd8wDyXlwLL
         dt9g==
X-Gm-Message-State: AOJu0Yx3f6GPZcO9+adVe7AGGwTsL/YUa1eBk4iZDyrQ/NloFtzdLf48
	+zafc5g9/c5nM+4jAR+NGgw88V3z38OQLg==
X-Google-Smtp-Source: AGHT+IEWw0arIEp7UW5gweAh9QRRAxCqAoc+x+dyeWywDxJhoYOY857NRXyfrn+A/JUXdmTmGnlgEg==
X-Received: by 2002:a17:907:3f85:b0:9b2:b149:b81a with SMTP id hr5-20020a1709073f8500b009b2b149b81amr1992998ejc.64.1698853734225;
        Wed, 01 Nov 2023 08:48:54 -0700 (PDT)
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com. [209.85.208.41])
        by smtp.gmail.com with ESMTPSA id lo10-20020a170906fa0a00b009b947aacb4bsm65149ejb.191.2023.11.01.08.48.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Nov 2023 08:48:54 -0700 (PDT)
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-53e04b17132so11410427a12.0;
        Wed, 01 Nov 2023 08:48:54 -0700 (PDT)
X-Received: by 2002:a17:907:3ac5:b0:9c6:1143:b73 with SMTP id
 fi5-20020a1709073ac500b009c611430b73mr1494767ejc.51.1698853733927; Wed, 01
 Nov 2023 08:48:53 -0700 (PDT)
MIME-Version: 1.0
References: <20231101095533.45258-1-tom@baremetal.dev> <ZUJoFAcKMrVD5Glo@lore-desk>
 <CANjHDnBkCW_zQxyCcKcyrZOYnnLNVKT1Z2AJr6x6DT55UZ+A7Q@mail.gmail.com> <ZUJwJ+bimXFVcXps@lore-desk>
In-Reply-To: <ZUJwJ+bimXFVcXps@lore-desk>
From: Tom Waldron <tom@baremetal.dev>
Date: Wed, 1 Nov 2023 15:48:21 +0000
X-Gmail-Original-Message-ID: <CANjHDnBsTaqPsMBtN1EU8rUdQwPu3riXcy66BTFBcJcy45HcDw@mail.gmail.com>
Message-ID: <CANjHDnBsTaqPsMBtN1EU8rUdQwPu3riXcy66BTFBcJcy45HcDw@mail.gmail.com>
Subject: Re: [PATCH 1/1] wifi: mt76: mt7921: Add a new VID/PID 0b48/7922 for MT7922
To: Lorenzo Bianconi <lorenzo@kernel.org>
Cc: linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231101_084857_495446_C0E44BC8 
X-CRM114-Status: GOOD (  22.14  )
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

Just realised that I had based my changes on the wrong repo(linux
stable). Also that this change has already been made in the
wireless-next repo. It seems the ITTIM vendor was used in this case.

Please ignore this submission and please accept my apologies for
taking up your time.

Regards

Tom

On Wed, 1 Nov 2023 at 15:35, Lorenzo Bianconi <lorenzo@kernel.org> wrote:
>
> > PCI VID 0x0b48 doesn't appear to be listed anywhere I can find, though
> > a website named pcilookup.com suggests it belongs to TechnoTrend AG. I
> > think it's more likely to be part of AMD RZ600 series - rebranded
> > mediatek devices. Not sure how any of this might be verified.
>
> I have just found it here: include/linux/pci_ids.h
> but I am not sure if it is related. Anyway:
>
> Acked-by: Lorenzo Bianconi <lorenzo@kernel.org>
>
> >
> > On Wed, 1 Nov 2023 at 15:00, Lorenzo Bianconi <lorenzo@kernel.org> wrote:
> > >
> > > > Add VID/PID 0b48/7922 for MediaTek MT7922 wifi chip.
> > > > Change tested on Redmi Book Pro 15 2023 (Fedora 38).
> > > >
> > > > Signed-off-by: Tom Waldron <tom@baremetal.dev>
> > > > ---
> > > >  drivers/net/wireless/mediatek/mt76/mt7921/pci.c | 2 ++
> > > >  1 file changed, 2 insertions(+)
> > > >
> > > > diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/pci.c b/drivers/net/wireless/mediatek/mt76/mt7921/pci.c
> > > > index 3dda84a93..ba805cb02 100644
> > > > --- a/drivers/net/wireless/mediatek/mt76/mt7921/pci.c
> > > > +++ b/drivers/net/wireless/mediatek/mt76/mt7921/pci.c
> > > > @@ -21,6 +21,8 @@ static const struct pci_device_id mt7921_pci_device_table[] = {
> > > >               .driver_data = (kernel_ulong_t)MT7921_FIRMWARE_WM },
> > > >       { PCI_DEVICE(PCI_VENDOR_ID_MEDIATEK, 0x0616),
> > > >               .driver_data = (kernel_ulong_t)MT7922_FIRMWARE_WM },
> > > > +     { PCI_DEVICE(0x0b48, 0x7922),
> > > > +             .driver_data = (kernel_ulong_t)MT7922_FIRMWARE_WM },
> > >
> > > is PCI VID 0x0b48 PCI_VENDOR_ID_ITTIM?
> > >
> > > Regards,
> > > Lorenzo
> > >
> > > >       { },
> > > >  };
> > > >
> > > > --
> > > > 2.41.0
> > > >

