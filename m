Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 430B5C433F5
	for <linux-mediatek@archiver.kernel.org>; Wed, 22 Dec 2021 09:08:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kuji8XhM5ytVehFnDEVqIMTF0oo7S+TmGJlzTNbk5Ms=; b=BZJbO27t1Bt447
	QJuYdxvSiiREj8DwDQbEODMOA0DXwfPrBlJzJPrtWv29B5RbgmLJJ/oHadF97oNkcmTY/d6Xlq7xo
	72GCzBA6wW9JxLsRQ3/F7ZXmQrPxSGLzJAav3x5JBF3uHerYApMlKoXrgBNxNGXCbyErpuY7/6YpP
	0DthbpPxgWRcgs79+BQBRQ7ySrd9rH94ls4RcTslkS9vRPMbumpXk/5FmYz45Sm0m0OoZEESL0dJa
	hChKTiwhLg04RQ5UKC+Cim2q8g57T2H3nq2tVS3TbXJ6iCjGJT1oAnv/QHq6cdAoL5ph8vA7SaN6+
	nLUIffG/U3LFEbqHkgSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mzxbG-009pS0-8B; Wed, 22 Dec 2021 09:07:54 +0000
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mzxaW-009p1X-5f
 for linux-mediatek@lists.infradead.org; Wed, 22 Dec 2021 09:07:09 +0000
Received: by mail-ed1-x52f.google.com with SMTP id m21so7223431edc.0
 for <linux-mediatek@lists.infradead.org>; Wed, 22 Dec 2021 01:07:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=OH9lUZGvbIYsFS6r93OdVkoyWwer11g866A2zNPeehk=;
 b=r3WN6KoV0SzdgtxvaGk6qQynqc2rvj3SjmK9MBxRug7Pb+EVJpUK3t+F+yktx2DuJc
 OBYJ2S/tGlHwp1SwDX3Tk8FzNeauleOXb8tli4nGClkgMNhBrB5Ix0fTy1fZ49TXXAdD
 2zmt7dP0B7bijNj6jcyR5tlg2IMGqdpZNx90la65lXq+rIS/tpWu1Xm0N3FCPJn1YdV3
 sVjtI99DrXEc8h+K9oqIjtQ/ZRjSkQmJ/zpQHi4QlRjTedfonW7XGiqlDGfZBk2S4CWi
 A5DG5wlrtcO62lxYpYfdJNGpLp/TihBJ092A4EYWpnn0zu66tWHrhZlqA6gWE9bQckw8
 h80A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=OH9lUZGvbIYsFS6r93OdVkoyWwer11g866A2zNPeehk=;
 b=T1JMRHCaNtP1dhgdfmFTfiKQULy/k5qspA600EGk7MYOVfoMXa+5GJmOMEGDHdD7Ir
 D+fL/C3TUAlVHVYPHDVWK1hP0T7OwUSqCbaUSXABSSjSSviUoghJcUXOGVIS3vPvzJ0J
 hCVfOmhsaMA0GQFi3thVCKn5JCv/0xbDioLt9TKv3zcMFLm8Fw65TereZbkSAztxwEkW
 pEmIm4lLkT3jzlvekrf7l3cN/JZYlD/C+vqa1+PlgAiyWFthh0hqsXx9UzuiZ5kwRZ/C
 lgktcApwh2TEyiehJoet6vTBOZ13C2Hg1RuXQUMyVCiVPloV0onL/aoFi9uwKStZu8ya
 qpjA==
X-Gm-Message-State: AOAM533x3+5iBk5BEha3530jrSmbIZt5D+g2eoLCiXlDLgsoRh879YG6
 xqw3mhPN4HP7zOSeUZ7Dm/NpPeRy+CTs0XAOZCyCow==
X-Google-Smtp-Source: ABdhPJwlTOwQkimbTWuIr5y0SujyhX/GH7oxW5rFLOJAM7Fb2ZmmwI2kQCMkhG9muS1yczRmhCgRLzxKggSNitGnEZ0=
X-Received: by 2002:a17:907:7208:: with SMTP id
 dr8mr1727842ejc.697.1640164024530; 
 Wed, 22 Dec 2021 01:07:04 -0800 (PST)
MIME-Version: 1.0
References: <20211220132439.1194-1-andriy.shevchenko@linux.intel.com>
 <CAMRc=Md3bpCJe_eFBjiKuhCRO_xqnFxSc1sw100fgNmajy6gaw@mail.gmail.com>
 <CAHp75VcbaYXfDpc7xE=asSqUspscRoHfqrg-yMtx=uo5UNqxfw@mail.gmail.com>
 <CAMRc=MfWqV8UFWLaJO7JSo7N6MhYVMWdquMDJU7xR5gu8604AQ@mail.gmail.com>
 <CAHp75VfhY9zFxC_vDj0OH0Y0ah3RUgEEYO9p_uQsm7Xe63QF8w@mail.gmail.com>
In-Reply-To: <CAHp75VfhY9zFxC_vDj0OH0Y0ah3RUgEEYO9p_uQsm7Xe63QF8w@mail.gmail.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 22 Dec 2021 10:06:53 +0100
Message-ID: <CAMRc=Mfn9P30niRMNqV4f7VByzV0a+Sf2vS4OcU1qPa4o1O8Lg@mail.gmail.com>
Subject: Re: [PATCH v1 1/1] gpio: Remove unused local OF node pointers
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 Sergio Paracuellos <sergio.paracuellos@gmail.com>,
 Marc Zyngier <maz@kernel.org>, 
 bcm-kernel-feedback-list <bcm-kernel-feedback-list@broadcom.com>, 
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, 
 Linux ARM <linux-arm-kernel@lists.infradead.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
 "moderated list:ARM/Mediatek SoC..." <linux-mediatek@lists.infradead.org>,
 linux-unisoc@lists.infradead.org, 
 Gregory Fong <gregory.0xf0@gmail.com>, Linus Walleij <linus.walleij@linaro.org>,
 Florian Fainelli <f.fainelli@gmail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, 
 Manivannan Sadhasivam <mani@kernel.org>,
 Stephen Rothwell <sfr@canb.auug.org.au>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211222_010708_308135_BBC6AE33 
X-CRM114-Status: GOOD (  16.23  )
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

On Tue, Dec 21, 2021 at 9:21 PM Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:
>
> On Tue, Dec 21, 2021 at 9:13 PM Bartosz Golaszewski <brgl@bgdev.pl> wrote:
> > On Mon, Dec 20, 2021 at 4:11 PM Andy Shevchenko
> > <andy.shevchenko@gmail.com> wrote:
> > > On Mon, Dec 20, 2021 at 5:09 PM Bartosz Golaszewski <brgl@bgdev.pl> wrote:
> > > > On Mon, Dec 20, 2021 at 2:24 PM Andy Shevchenko
> > > > <andriy.shevchenko@linux.intel.com> wrote:
>
> ...
>
> > > > > -               gc->label = devm_kasprintf(dev, GFP_KERNEL, "%pOF", dev->of_node);
> > > > > +               gc->label = devm_kasprintf(dev, GFP_KERNEL, "%pOF", np);
> > > >
> > > > This is unrelated though. Can you make it a separate patch?
> > >
> > > It actually makes use of the local np IIRC.
> > > It's related, no?
> >
> > No, the np pointer is already used elsewhere. You just replace the
> > dev->of_node here with np. Rightfully so, but it's not part of this
> > commit logically.
>
> I see. Probably I missed that somehow.
> Nevertheless, do you want a new version or can you just revert that
> particular change?
>
> --
> With Best Regards,
> Andy Shevchenko

I removed it and queued the rest.

Bart

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
