Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C56BCFC267
	for <linux-mediatek@archiver.kernel.org>; Tue, 15 Oct 2024 05:23:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2amfIbZSfwwrInuc60WPLo9Bq9qEZCLpcMAyCEJ6kmU=; b=YA7xdQ41eYXPNt5Jkdb2iY7ta7
	EhlrYDD6PXzsCyBE8suZLrOPrHDchobvnUHPjAW3JbChEwlWLtUsmfC3xHk8hV+Ct/IKYv+xvoIut
	gZv8OOE7XNWl7X1Ou+/xkM8e80nBq1Zg+H/mY5ku5qrWBVzvDErinLrSJJUgT8wVObbNVblY9Rtmf
	JyzZe8hWyWOqQfJa9NbXS6eeRmQJReGzmRxuAnsxsE9pC0mKABd7pYIpw6IDQarQrxcWpG1wPAKj3
	T3WmnsGq26TEBGWcEbuhkgaq7YB2i+rPoEuHgTklx72jB+j4B6XKm4I/pljMahm74oXN/KRIWtiR1
	LXoySzXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t0a2G-000000076Ku-2Gqg;
	Tue, 15 Oct 2024 05:23:56 +0000
Received: from mail-lf1-x12b.google.com ([2a00:1450:4864:20::12b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t0a0p-000000076E5-3hgd
	for linux-mediatek@lists.infradead.org;
	Tue, 15 Oct 2024 05:22:29 +0000
Received: by mail-lf1-x12b.google.com with SMTP id 2adb3069b0e04-539f53973fdso1402038e87.1
        for <linux-mediatek@lists.infradead.org>; Mon, 14 Oct 2024 22:22:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1728969745; x=1729574545; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2amfIbZSfwwrInuc60WPLo9Bq9qEZCLpcMAyCEJ6kmU=;
        b=HFVLbKzeZxGuprppO9lFj1gaH2xJy2EWtCoRHn7hJJoUKImojr3QsgEBKRcRERXLS0
         8BwhiV0ZB0qye73zfBMZacl5y4s18VN2g7YGDAIqoiOq+Yx+DZzmJrJTTFCexp9TnFOf
         TXIBTyDtDVMo3M6uo5kPU1LXKBrrflL+d3I+c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728969745; x=1729574545;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2amfIbZSfwwrInuc60WPLo9Bq9qEZCLpcMAyCEJ6kmU=;
        b=fVWON2w58Mx8RB9t9GqGQQ+HHcOlhLZtYhkM7IpIMgkWH/c2N/A7ToBfa9oLPW1ju8
         HJUWn+Wp2dK5+kM3lRd8AKmFE+tn/OE9lL70ajlS3LMoBEkqqDsX/mZVJ3nq5KwFT6sC
         NnA15eGfARQ0+ZA2WijEGCnXoEfTpY5c16k5rmziTH1HzfcBVjNPU3ZXUJomQiC5K3M4
         24Dz5uDaR4CvzeomGC7v2+SLrzSRG3G1yh8aX4fm58QV/SCAf7uu+L4UpFXmjLzJarFb
         oRk7pluhViUbmGxjWJxea57u4BoLpS+wMmcCkAy34q/eHf/3y4O5Gv9lQzI0u6im8ZGJ
         qdfQ==
X-Forwarded-Encrypted: i=1; AJvYcCVbbw9u/W9qa8rmDwVg3+4awZ7gK5AVxiXOeYZpopuvCQuc2whdPkKYQ3INY3Qm+mpyKyAGRvCbThnZViJLuw==@lists.infradead.org
X-Gm-Message-State: AOJu0Yzg7eYkT8EfgrIqbSZL3t9z/LuDgxPU+5h6cUvdIBC8isRKxPCV
	ip5Fl3h18NX5CC7gNYtrUpimqwAe/6a9/WDnfWuB3z6pAEiFVB6rmGkv35QAyVQPg2ApD6T+Tp2
	Bl5I7IV9iw3FCdn8rU1nHkjpCnVPJ9VS5ZN8N
X-Google-Smtp-Source: AGHT+IGnCYIKC4fxrTKf7KXrK4wtSw6kzD/gty96rpQnFBMMz91hHJcgXAFaBjG2JNXIFl/CWbfvb9I+Di9bhTdNMZc=
X-Received: by 2002:ac2:4f0a:0:b0:539:e263:331c with SMTP id
 2adb3069b0e04-539e26334a7mr4023423e87.17.1728969744956; Mon, 14 Oct 2024
 22:22:24 -0700 (PDT)
MIME-Version: 1.0
References: <20241008073430.3992087-1-wenst@chromium.org> <20241008073430.3992087-5-wenst@chromium.org>
 <ZwfvuA2WhD_0P3gL@smile.fi.intel.com> <CAGXv+5Hm62hFsF27B-cEWTJ_AKrhcfCPaqR7BxmpwnjABzwHTQ@mail.gmail.com>
 <Zwz9djqb0Q6Ujmo_@smile.fi.intel.com>
In-Reply-To: <Zwz9djqb0Q6Ujmo_@smile.fi.intel.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Tue, 15 Oct 2024 13:22:13 +0800
Message-ID: <CAGXv+5EGq=OAymON-wj0OzQjK1VxRzdvgJgbHxaYPKP_pmTN2A@mail.gmail.com>
Subject: Re: [PATCH v8 4/8] i2c: Introduce OF component probe function
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@google.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Wolfram Sang <wsa@kernel.org>, 
	Benson Leung <bleung@chromium.org>, Tzung-Bi Shih <tzungbi@kernel.org>, 
	chrome-platform@lists.linux.dev, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Douglas Anderson <dianders@chromium.org>, 
	Johan Hovold <johan@kernel.org>, Jiri Kosina <jikos@kernel.org>, linux-i2c@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241014_222227_976976_2C588B1A 
X-CRM114-Status: GOOD (  47.00  )
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

On Mon, Oct 14, 2024 at 7:16=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> On Mon, Oct 14, 2024 at 11:53:47AM +0800, Chen-Yu Tsai wrote:
> > On Thu, Oct 10, 2024 at 11:16=E2=80=AFPM Andy Shevchenko
> > <andriy.shevchenko@linux.intel.com> wrote:
> > > On Tue, Oct 08, 2024 at 03:34:23PM +0800, Chen-Yu Tsai wrote:
>
> ...
>
> > > Fresh reading of the commit message make me think why the firmware or
> > > bootloader on such a device can't form a dynamic OF (overlay?) to ful=
fill
> > > the need?
> >
> > The firmware / bootloader on existing devices are practically not upgra=
dable.
> > On the other hand, the kernel is very easy to upgrade or swap out.
> >
> > For said shipped devices, there is also nothing to key the detection
> > off of besides actually powering things up and doing I2C transfers,
> > which takes time that the firmware has little to spare. We (ChromeOS)
> > require that the bootloader jump into the kernel within 1 second of
> > power on. That includes DRAM calibration, whatever essential hardware
> > initialization, and loading and uncompressing the kernel. Anything
> > non-essential that can be done in the kernel is going to get deferred
> > to the kernel.
> >
> > Also, due to project timelines oftentimes the devices are shipped with =
a
> > downstream kernel with downstream device trees. We don't want to tie th=
e
> > firmware too tightly to the device tree in case the downstream stuff ge=
ts
> > reworked when upstreamed.
>
> Okay, I was always under impression that DT has at least one nice feature=
 in
> comparison with ACPI that it can be replaced / updated in much quicker /
> independent manner. What you are telling seems like the same issue that

That depends on which camp one is in. Some folks advocate for shipping the
DT with the firmware. In that case you are limited by how easy the firmware
is to upgrade. Or they would leave an option for the firmware to load a
newer DT from disk.

The other camp is shipping the DT with the kernel image, which ChromeOS and
some Linux distros do.  Then the DT is as easy to upgrade as the kernel.
Opponents would argue that the DT is a hardware description and should
be separate from the kernel. However as with all hardware bringup
development, one can't really describe something that hasn't been
developed and gone through review.

However here I am specifically talking about the firmware _code_ being tied
to the DT. To implement the probing feature in firmware, one needs to eithe=
r
add a lot more code about what devices the system might have, or implement
the equivalent of this series in firmware, or something in between. This
is a lot of code that depends on the structure of the DT it was developed
against, which most likely was downstream at that point.

Say someone screwed up some DT structure downstream at the time of release,
such as the node name or address prefix, and that was fixed upstream. The
new upstream DT no longer has the structure the firmware is expecting, and
the firmware might not be able to handle it anymore, resulting in some
peripheral no longer getting probed or enabled. And you don't have a way
to upgrade the firmware to fix this.

> ACPI-based platforms have. However, there they usually put all possible d=
evices
> into DSDT and firmware enables them via run-time (ACPI) variables. Are yo=
u
> trying to implement something similar here?

Yes, that sounds similar. However for us the DT is tied to the kernel, not
the firmware, i.e. not provided by the firmware. There's also no UEFI in
our case.

> ...
>
> > > Another question is that we have the autoprobing mechanism for I2C fo=
r ages,
> > > why that one can't be (re-)used / extended to cover these cases?
> >
> > I haven't looked into it very much, but a quick read of
> > Documentation/i2c/instantiating-devices.rst suggests that it's solving
> > a different problem?
> >
> > In our case, we know that it is just one of a handful of possible
> > devices that we already described in the device tree. We don't need
> > to probe the full address range nor the full range of drivers. We
> > already have a hacky workaround in place, but that mangles the
> > device tree in a way that doesn't really match the hardware.
> >
> > The components that we are handling don't seem to have any hardware
> > ID register, nor do their drivers implement the .detect() callback.
> > There's also power sequencing (regulator and GPIO lines) and interrupt
> > lines from the device tree that need to be handled, something that is
> > missing in the autoprobe path.
> >
> > Based on the above I don't think the existing autoprobe is a good fit.
> > Trying to shoehorn it in is likely going to be a mess.
> >
> > Doug's original cover letter describes the problem in more detail,
> > including why we think this should be done in the kernel, not the
> > firmware:
> > https://lore.kernel.org/all/20230921102420.RFC.1.I9dddd99ccdca175e3ceb1=
b9fa1827df0928c5101@changeid/
>
> Perhaps it needs to be summarised to cover at least this question along w=
ith
> the above?

For the first question, it boils down to we think that the firmware should
be simple and do as little as possible. It also should not be tied to a
specific DT, so editing or fixing up the DT in firmware is something we
avoid. The firmware can do overlays if they are provided, however in this
particular case, the identifiers used by the bootloader don't cover the
variations of the I2C-based second source components.

For why autoprobing isn't a good fit, I believe my answer above covers it.

ChenYu

