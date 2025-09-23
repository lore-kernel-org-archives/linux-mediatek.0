Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52007CAC5A7
	for <linux-mediatek@archiver.kernel.org>; Tue, 23 Sep 2025 13:11:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cYLukBQ17FPEmEKg/j/keCvoGNFtY2B2OCdn9YrZHqE=; b=IuoEvOfpbdu283pcn4hkCyyHf6
	9Axv6BPewvI89fVUidv64ply0usXqtr6ShKQ1YF/NvBQwL8DV9LfL/KnNA/83ZwMX1R3uMU0Tm5Aq
	oNc/isqczFeWAP2HdpjAP8aRIZXxUzLYCg0w2ggVMtRN5o/3qPCV05fu+LsvfAcmNjkb9qsonnmW8
	Z0kwOm/73FRFvUchoBQmD+bgBDBmZ7zSeS/lL6ffPDMXCsLwcCVAPnSwIkJzARzy1E/xGZqhDcOfn
	xrk2njzWNSSBxZfGJR45gG+S0WBrPOg07tYmcLAxqQoTo60iVOuR/6mMoy+UodIptdtC2+ycVSFRk
	obHretNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v12o6-0000000DRvD-08LZ;
	Tue, 23 Sep 2025 13:11:46 +0000
Received: from mail-oo1-xc2b.google.com ([2607:f8b0:4864:20::c2b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v12o3-0000000DRt6-1cbj
	for linux-mediatek@lists.infradead.org;
	Tue, 23 Sep 2025 13:11:44 +0000
Received: by mail-oo1-xc2b.google.com with SMTP id 006d021491bc7-62f5f5cfc58so871729eaf.0
        for <linux-mediatek@lists.infradead.org>; Tue, 23 Sep 2025 06:11:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758633102; x=1759237902; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cYLukBQ17FPEmEKg/j/keCvoGNFtY2B2OCdn9YrZHqE=;
        b=izRmRRYANfq7iSPIzIS9//b/PkQtMWUYwmR5j95Ts4GrkR02itY1NupAsBsP1H6D8U
         Su77dvM+GXD/eBH7LQuX+21yar3buKmDKXU9nvD2IhsFNmtM26e6j3iuFE7DyeeLtQL9
         Kkfb0qt+sE6arlOWJ1Aw2ECth858DvQViSmufxo841iqkD3DNJRsOY6Pky8VgYFfIF3p
         qZ6RWJSwtRDVnrMqzj1hvLlZY1v2UBmP8BxNVJcIDXdHNH8OafD5h4ohvnLgQduWXaGc
         b+vkisdCn1B/flNm1WGKIuFfFfX1RpPtgmjE+vUVeSfH8KOW9DVfB+uxBfS5I0vPZZCf
         FY0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758633102; x=1759237902;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cYLukBQ17FPEmEKg/j/keCvoGNFtY2B2OCdn9YrZHqE=;
        b=FiD5WxLsN/+PS/ZTY3I47O6MvPEqGV/43r+fpZw3dgA0Mc0twva+Z8XKbXyZ1P5zBr
         GBEn/lNGhK7lKknm8LqITMHBxDMdcumjGka/PrSMnfKEYj9c7aabi1hI21r3NgrxTRZB
         TLIqiPzyvG3Tpt43Mrv9CRKCUjT0qaq5nQEzd98QB9epHq7/PSeL66uODxInZwRVEEBw
         tSVolLXYuYn7JjdajV75D1qhBL+qCJBUm2J/JGS+JHEEors7+/fxwDEsHbJ5sMlypOj8
         vdaeHjN1UUWzs1ES0wBoHW5iujSW385KZjdeEYVGpgqNdwW0v0CNQiM8O0bu4ys3vGul
         Td5A==
X-Forwarded-Encrypted: i=1; AJvYcCVYIKFRLXqkjeLeGa3Jg6eF5xbNBItv9N/efLf54Po5rYpomFBfOJEDKdiIwrhk6av3llRF/29m65sIfdEwaQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YyMpmrEIOlZi5Hv9EGi9XvtXqUXFX33LDp3o9nIKBusU/1gvG1S
	vySkUa+kOq5ipzqyTx6Oo4tvuPOmZ2yUQDqKGuhKVJy5pgUiF+IQQwHEuZsGn8YiHM2PIh05yUS
	rmbr5NrFS3MYhu3foZloF5Lcie39E9DE=
X-Gm-Gg: ASbGnctj2Z9CxoIV4/UR4B5IZePX7BTgU7qLe5O1bIGAlfPrKJ1AfbNqin9/foiaS2V
	LuFjFVsxetIMPJ0nBStohNqlQ9PlXlUg5LWbCJ+gbuY/WxOkVwv9gvuNETV33VeKhTC88XZfXk4
	vqaVqykOrVhiUIAmOiwd2IQUN5vOvTme0b4F53RXC6NtL/JAmveLdhotF/zTqYe77IaFCbZUYLS
	NY1ONUy
X-Google-Smtp-Source: AGHT+IFk37z9A5OnXp4wGR0Qz6tmc2B/fCuFkSXnr4AQAOqobsq/8dZcTNp3FhmVzy9qfW4xwfMc32NUWauN7gIvh50=
X-Received: by 2002:a05:6808:344c:b0:439:b1eb:300e with SMTP id
 5614622812f47-43f2d445abemr977911b6e.33.1758633101752; Tue, 23 Sep 2025
 06:11:41 -0700 (PDT)
MIME-Version: 1.0
References: <20250822021217.1598-1-jjian.zhou@mediatek.com>
 <20250822021217.1598-3-jjian.zhou@mediatek.com> <CABb+yY16DPJwVTHap4F6n5YJoOJzQLtqKiCQ-2MUm67pzF8uXg@mail.gmail.com>
 <24a916ece6971d3ab9156dd8277eb23935e9cb13.camel@mediatek.com>
In-Reply-To: <24a916ece6971d3ab9156dd8277eb23935e9cb13.camel@mediatek.com>
From: Jassi Brar <jassisinghbrar@gmail.com>
Date: Tue, 23 Sep 2025 08:11:30 -0500
X-Gm-Features: AS18NWBF4NguOxMN8xnesFe-YY3RY5n_pyTUQl_94Lw7IZuBIdJPh4k0eaZQ2eo
Message-ID: <CABb+yY0njdWUd=HWT1rSYSpNM9QoO_jf6piY9ny1enB+rZZF+g@mail.gmail.com>
Subject: Re: [PATCH v5 2/2] mailbox: mediatek: Add mtk-vcp-mailbox driver
To: =?UTF-8?B?SmppYW4gWmhvdSAo5ZGo5bu6KQ==?= <Jjian.Zhou@mediatek.com>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>, 
	"wenst@chromium.org" <wenst@chromium.org>, 
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "conor+dt@kernel.org" <conor+dt@kernel.org>, 
	Project_Global_Chrome_Upstream_Group <Project_Global_Chrome_Upstream_Group@mediatek.com>, 
	"robh@kernel.org" <robh@kernel.org>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
	"matthias.bgg@gmail.com" <matthias.bgg@gmail.com>, "krzk+dt@kernel.org" <krzk+dt@kernel.org>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250923_061143_427658_537CAE90 
X-CRM114-Status: GOOD (  17.79  )
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

On Tue, Sep 23, 2025 at 1:46=E2=80=AFAM Jjian Zhou (=E5=91=A8=E5=BB=BA) <Jj=
ian.Zhou@mediatek.com> wrote:
>
> On Thu, 2025-09-18 at 18:50 -0500, Jassi Brar wrote:
> > External email : Please do not click links or open attachments until
> > you have verified the sender or the content.
> >
> >
> > On Thu, Aug 21, 2025 at 9:12=E2=80=AFPM Jjian Zhou <jjian.zhou@mediatek=
.com>
> > wrote:
> >
> > .....
> >
> > > +#include <linux/module.h>
> > > +#include <linux/of.h>
> > > +#include <linux/platform_device.h>
> > > +#include <linux/slab.h>
> > > +
> > > +struct mtk_vcp_mbox_priv {
> >
> > Maybe 'mtk_vcp_mbox' is a more appropriate name ?
> >
> > > +       void __iomem *base;
> > > +       struct device *dev;
> > > +       struct mbox_controller mbox;
> > > +       const struct mtk_vcp_mbox_cfg *cfg;
> > > +       struct mtk_ipi_info ipi_recv;
> >
> > Maybe also have "struct mbox_chan chan[1]; " so that you don't have
> > to
> > allocate one during the probe.
> > Also if you have  "struct mbox_controller mbox;" as the first member,
> > you could simply typecast that to get this structure.
> > Something like "struct mpfs_mbox" in mailbox-mpfs.c
> >
>
>
> ERROR:FLEXIBLE_ARRAY: Use C99 flexible arrays - see
> https://docs.kernel.org/process/deprecated.html#zero-length-and-one-eleme=
nt-arrays
> #81: FILE: drivers/mailbox/mtk-vcp-mailbox.c:24:
> +       struct mbox_chan chans[1];
> +};
>
> Can we ignore this error?
>
It seems single element style is deprecated. While we know what we are
doing, let us placate that error by
       struct mbox_chan mch;
       struct mbox_chan chans[];
and set  chans =3D &mch

