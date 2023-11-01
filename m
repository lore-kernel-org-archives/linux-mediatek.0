Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14BDDC4332F
	for <linux-mediatek@archiver.kernel.org>; Wed,  1 Nov 2023 15:27:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YHvK9y12HVFPPCcFRFW7IlBRtyM+hFYAm7yaHjfI6As=; b=VzlwAwQFdCLw8/hPsxIoXA6diz
	yCRDI0/iMbssY18nu/wTj+sdjnvQJqW9BuNyiUYCOEjcbWe/ozSepPyWYgfmnvYfjuci5dwDe+jHk
	9ZIunxTi9PEXaM0/ZSfbBRaDfHC5HprB1kz7ttLb2GKxyrCFL2pfbL+KXidaQ7aMoQWn4MZJlvr5c
	wtzrnB7tLb8s8B8Fa8xHAjMolhJByd9Gv8yhTjYLoMX6q4H1Zei0amO9nUGr3oB7zkMWZv+q4K3dS
	FS5D9uvihXnf91fYJDivH7CprkAqbJ0lWptd614bQZhr9z/5MlgmVwRBnaisqkCY+6O50KtJQ95O+
	wzBYTHhg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qyD7w-007k81-0N;
	Wed, 01 Nov 2023 15:27:28 +0000
Received: from mail-ed1-f41.google.com ([209.85.208.41])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qyD7q-007k7A-2S;
	Wed, 01 Nov 2023 15:27:26 +0000
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-543c3756521so806263a12.2;
        Wed, 01 Nov 2023 08:27:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698852439; x=1699457239;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YHvK9y12HVFPPCcFRFW7IlBRtyM+hFYAm7yaHjfI6As=;
        b=vHZgLHUPqhdrVn9Vax4zpboC3bIPLTZl5wojk7F1wQpdX13hW65BuM3YUtkCpZzWcK
         1fqQ+iOpMV/BrmR7tbTIFr73IbFIG8wrqMpHz73QTSLp5T5bs/KjXuzqb/W3sABx9p0Y
         vkvSihm/CTxfb7AtflWWPyx9by9AC3x9FNrTFj9WtHxCgr1OaKaAytQHZcXzMB09ePpV
         XurH/LlBXkbgKGxSB4V7WRxdxyZ3TSGlC65vYCz5caAgYceMyJpzYviFvvV0vf6mPKWd
         kCJ1U9akYn0+2Ru2G0M56bbK12dCfaYsEkxJCrC1OTqf6nugOkqlWoa1AQxll6+bMsFH
         zCMg==
X-Gm-Message-State: AOJu0YwvASgQtobJOoyFlpEaOgJ27cGvNEBBwleZDczdwTPJVNcPzqB3
	pQaCz2odd2Dl/rFXvlv2yRedfOEe43f0Gw==
X-Google-Smtp-Source: AGHT+IGq7jDpn28MeQVd/ng6FYhAVo+dyCavDtqx81PGd4lnHRlQ4AvxHs4XJqoctW+w3mfjv70VLw==
X-Received: by 2002:a17:907:1b0c:b0:9cf:18ce:95e6 with SMTP id mp12-20020a1709071b0c00b009cf18ce95e6mr2686653ejc.62.1698852439346;
        Wed, 01 Nov 2023 08:27:19 -0700 (PDT)
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com. [209.85.218.48])
        by smtp.gmail.com with ESMTPSA id w4-20020a17090652c400b009b2c5363ebasm54706ejn.26.2023.11.01.08.27.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Nov 2023 08:27:19 -0700 (PDT)
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-9d2d8343dc4so586730666b.0;
        Wed, 01 Nov 2023 08:27:19 -0700 (PDT)
X-Received: by 2002:a17:906:db0d:b0:9d3:ccd1:a905 with SMTP id
 xj13-20020a170906db0d00b009d3ccd1a905mr2191785ejb.51.1698852439007; Wed, 01
 Nov 2023 08:27:19 -0700 (PDT)
MIME-Version: 1.0
References: <20231101095533.45258-1-tom@baremetal.dev> <ZUJoFAcKMrVD5Glo@lore-desk>
In-Reply-To: <ZUJoFAcKMrVD5Glo@lore-desk>
From: Tom Waldron <tom@baremetal.dev>
Date: Wed, 1 Nov 2023 15:26:46 +0000
X-Gmail-Original-Message-ID: <CANjHDnBkCW_zQxyCcKcyrZOYnnLNVKT1Z2AJr6x6DT55UZ+A7Q@mail.gmail.com>
Message-ID: <CANjHDnBkCW_zQxyCcKcyrZOYnnLNVKT1Z2AJr6x6DT55UZ+A7Q@mail.gmail.com>
Subject: Re: [PATCH 1/1] wifi: mt76: mt7921: Add a new VID/PID 0b48/7922 for MT7922
To: Lorenzo Bianconi <lorenzo@kernel.org>
Cc: linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231101_082722_803361_70FFFFED 
X-CRM114-Status: GOOD (  16.05  )
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

PCI VID 0x0b48 doesn't appear to be listed anywhere I can find, though
a website named pcilookup.com suggests it belongs to TechnoTrend AG. I
think it's more likely to be part of AMD RZ600 series - rebranded
mediatek devices. Not sure how any of this might be verified.

On Wed, 1 Nov 2023 at 15:00, Lorenzo Bianconi <lorenzo@kernel.org> wrote:
>
> > Add VID/PID 0b48/7922 for MediaTek MT7922 wifi chip.
> > Change tested on Redmi Book Pro 15 2023 (Fedora 38).
> >
> > Signed-off-by: Tom Waldron <tom@baremetal.dev>
> > ---
> >  drivers/net/wireless/mediatek/mt76/mt7921/pci.c | 2 ++
> >  1 file changed, 2 insertions(+)
> >
> > diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/pci.c b/drivers/net/wireless/mediatek/mt76/mt7921/pci.c
> > index 3dda84a93..ba805cb02 100644
> > --- a/drivers/net/wireless/mediatek/mt76/mt7921/pci.c
> > +++ b/drivers/net/wireless/mediatek/mt76/mt7921/pci.c
> > @@ -21,6 +21,8 @@ static const struct pci_device_id mt7921_pci_device_table[] = {
> >               .driver_data = (kernel_ulong_t)MT7921_FIRMWARE_WM },
> >       { PCI_DEVICE(PCI_VENDOR_ID_MEDIATEK, 0x0616),
> >               .driver_data = (kernel_ulong_t)MT7922_FIRMWARE_WM },
> > +     { PCI_DEVICE(0x0b48, 0x7922),
> > +             .driver_data = (kernel_ulong_t)MT7922_FIRMWARE_WM },
>
> is PCI VID 0x0b48 PCI_VENDOR_ID_ITTIM?
>
> Regards,
> Lorenzo
>
> >       { },
> >  };
> >
> > --
> > 2.41.0
> >

