Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5CA99CA1009
	for <linux-mediatek@archiver.kernel.org>; Wed,  3 Sep 2025 12:13:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TY99cVzo51RXHn+Vw+SAL0C6lDtANRsUUB+6t6UiVNI=; b=06KK6mKLr+cuxlMs1m2bPDUU2D
	PG2AKgyyTgRZX6MAizGsJaxmoQ26Lk2ISMCxvTku3jPWJj+7MZbZ+nfkMf181tXD6GZ/BMCeo7kcv
	NiRSDc+Gvh0R0ai98RyMNKyjzMegkP59+ZqgCe0SDxQtGg1j+m3AQ5/2zoSuu+/JOQaFXeFP9DCCs
	Evy+pC3S/VzddxJY7jzFmmssS36S40X23KbVcCQ8y8RVnBeo73lAFLWFgReKZUlmWCVuWrurNCqbs
	mtzuB+J4+3CrfohLaxmAK7P8ao1NvEyXKLPerlXakFf3n6rHAKl8Kp0YxICCVwLqOa5gtZJIpObhS
	juas37/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utmMe-00000006LjN-05Dm;
	Wed, 03 Sep 2025 12:13:24 +0000
Received: from mail-lf1-x12b.google.com ([2a00:1450:4864:20::12b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utlJ6-00000006Azt-2OVa
	for linux-mediatek@lists.infradead.org;
	Wed, 03 Sep 2025 11:05:41 +0000
Received: by mail-lf1-x12b.google.com with SMTP id 2adb3069b0e04-55f6ad5146eso3936872e87.0
        for <linux-mediatek@lists.infradead.org>; Wed, 03 Sep 2025 04:05:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1756897539; x=1757502339; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TY99cVzo51RXHn+Vw+SAL0C6lDtANRsUUB+6t6UiVNI=;
        b=hA9/4BWSYs9AgVJHyG+xSUUtngNRpsDCnByDIuvIfF6Y21Oo6RQDC4yKXXDYrMnszF
         /SdoG1UIGc2vPcePKN/YbutdT1gF73PsgXuQqI0P/BEr0Hy0Yr7KJpgB3T1nGfwqav/7
         5UaGdeGxit/03cwHUee3fTxF28lryTAM1mFYJR3ciccKp/sR+nWU0NLnFPELaJkqDOdC
         4I67ih/EHKGk9iO7gRpPxeuQ7rg9o2W1ou8lFMV1kt1sV0S3bViBpcM0bHRMhA+z3g+Z
         NGbr7QBqxXGka2o2b6xxp05yQi+CjaF80itEKEzZl6tSCd9LhjEFDB8VPFZpClT9nFhK
         p/6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756897539; x=1757502339;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TY99cVzo51RXHn+Vw+SAL0C6lDtANRsUUB+6t6UiVNI=;
        b=utrXvsaGVwNtkN90YLxVdZUKYKG0LfjWvqEZwTL0ZHzD0Xuu/GrgAtXviCfQ4e5GvU
         7TMdaCe5cTHG7Gr382Yvk76Oe2smbbNJq1vL7wIpMwsvroxNA+2t0+8xzSJzd3iyzcmz
         zUK+XUqWP1Rh/K9XfTKaBHoii4QYDX8fRHVyqUJ+nN2baHSGglvII+t7tRz9xyHeYU9P
         k1nUTV+WCFNIPXIuDiXnJmzTBm3rR8PGjLB5Iu82UzCtSJj8BAJT0+SbimQROrWmwBLl
         O+8XcrJsD8D0IaGxwA+QU7FKTrQwehgXeshJeF56K1ymCJOGtEj9oabPvGmvKlG7zLfI
         5zHg==
X-Forwarded-Encrypted: i=1; AJvYcCWp3CxTVJ3OeU9HaV3C3L0glep2Yw6aMTnEVD7ZJYz2rQ90z/U14RJKnBzZaNBEKzSUP7WDjPrlaGpMRY43OQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yzs7mAOQEhZ6/MPXvJOU1xhGxKy+Cv+mHMDJY11rnf/e8rVk0hN
	YLPsGw0+TjQFGVbMhmrucZz8WoJac5QAyInXea4HGmUu3df3MXy6pWA1rz4fdxhfZbw8/gG2oL3
	22t/AQ7b//bgBPPFqYpJp+SsUFSbT45GHEUDT0NPt4A==
X-Gm-Gg: ASbGnctCH/Morzye75eVJNmuqGIRo+wZUOmoQ2O04Q3qLbO5VxoRwnlrmQkw/IolGPR
	ZZg4mRGY4nPlcA29f7DZ5nauieu058yGzbCwN3frlG4K25DcDadnz+cxur4Q9jjPKFwBlT+UO4k
	H8L7VKbTIfXwuVf6bgaxmQve6Pi03cika4BOF47g0QaNkMC9lh1C2IIExIn/nWlqv7XwVAaOsbV
	YYJswO5zPyY8nSUTnxagGB5dWhh/I93KU/o9tUsi0a86/e4zg==
X-Google-Smtp-Source: AGHT+IGaO6jKgae4Bb0nnUY/KIMNPM9fcQrt4rcPCJpxbytVdpNy16Q2X9IuotKVynxw9JndtWotWpVme+DKGbgxexI=
X-Received: by 2002:a05:6512:b8a:b0:55f:62f9:cad2 with SMTP id
 2adb3069b0e04-55f7093e564mr3786208e87.26.1756897538646; Wed, 03 Sep 2025
 04:05:38 -0700 (PDT)
MIME-Version: 1.0
References: <20250902-pinctrl-gpio-pinfuncs-v7-0-bb091daedc52@linaro.org>
 <20250902-pinctrl-gpio-pinfuncs-v7-16-bb091daedc52@linaro.org>
 <aLcBcjvMbrxoDYoC@smile.fi.intel.com> <CAMRc=MfcFMgkNqWNZV5o0NxkAvxBTjC3vv56Cr98n0R2CkxuPw@mail.gmail.com>
 <CAHp75VcgaqnDrPH27wxfgyK6zz4RAKJQB0r7G2vbTONTxkEzTw@mail.gmail.com>
 <CAMRc=MfhhX2NJ0fhhX8u+7=sdyUy0G27n7caGf9=TpHxUDJVxg@mail.gmail.com>
 <aLgW7J-j4nn0u8uo@smile.fi.intel.com> <CAMRc=MdA21fwnamymG6YhqBjKDso_nJs_4xefPNONQNfEcPHXA@mail.gmail.com>
 <aLgaoivmBUgoeO6B@smile.fi.intel.com> <CAMRc=Me84OX=UEmAXxmwE8oOH=1UBsyHe-7XmU0c8a2gG9JnCA@mail.gmail.com>
 <aLgeDNLABpmkShIU@smile.fi.intel.com>
In-Reply-To: <aLgeDNLABpmkShIU@smile.fi.intel.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 3 Sep 2025 13:05:27 +0200
X-Gm-Features: Ac12FXyayAu5ynqkVYj2uRlegQC_XlF19483EKV3MWs-LYc9T7mcvfMXmn9zXkQ
Message-ID: <CAMRc=MdD9g4WiBCP0qYGuy5e3pnQf5MUHTqkUOnrUvcWUYK27A@mail.gmail.com>
Subject: Re: [PATCH v7 16/16] pinctrl: qcom: make the pinmuxing strict
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Andy Shevchenko <andy.shevchenko@gmail.com>, Linus Walleij <linus.walleij@linaro.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Alexey Klimov <alexey.klimov@linaro.org>, Lorenzo Bianconi <lorenzo@kernel.org>, 
	Sean Wang <sean.wang@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Paul Cercueil <paul@crapouillou.net>, Kees Cook <kees@kernel.org>, 
	Andy Shevchenko <andy@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, 
	David Hildenbrand <david@redhat.com>, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, 
	"Liam R. Howlett" <Liam.Howlett@oracle.com>, Vlastimil Babka <vbabka@suse.cz>, 
	Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, 
	Dong Aisheng <aisheng.dong@nxp.com>, Fabio Estevam <festevam@gmail.com>, 
	Shawn Guo <shawnguo@kernel.org>, Jacky Bai <ping.bai@nxp.com>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, NXP S32 Linux Team <s32@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Tony Lindgren <tony@atomide.com>, 
	Haojian Zhuang <haojian.zhuang@linaro.org>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Mark Brown <broonie@kernel.org>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-mips@vger.kernel.org, linux-hardening@vger.kernel.org, 
	linux-mm@kvack.org, imx@lists.linux.dev, linux-omap@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, 
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250903_040540_616753_085517EF 
X-CRM114-Status: GOOD (  36.78  )
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

On Wed, Sep 3, 2025 at 12:53=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@intel.com> wrote:
>
> On Wed, Sep 03, 2025 at 12:41:48PM +0200, Bartosz Golaszewski wrote:
> > On Wed, Sep 3, 2025 at 12:38=E2=80=AFPM Andy Shevchenko
> > <andriy.shevchenko@intel.com> wrote:
> > > On Wed, Sep 03, 2025 at 12:34:00PM +0200, Bartosz Golaszewski wrote:
> > > > On Wed, Sep 3, 2025 at 12:22=E2=80=AFPM Andy Shevchenko
> > > > <andriy.shevchenko@intel.com> wrote:
> > > > > On Wed, Sep 03, 2025 at 09:33:34AM +0200, Bartosz Golaszewski wro=
te:
> > > > > > On Tue, Sep 2, 2025 at 10:46=E2=80=AFPM Andy Shevchenko
> > > > > > <andy.shevchenko@gmail.com> wrote:
> > > > > > > On Tue, Sep 2, 2025 at 8:42=E2=80=AFPM Bartosz Golaszewski <b=
rgl@bgdev.pl> wrote:
> > > > > > > > On Tue, Sep 2, 2025 at 4:38=E2=80=AFPM Andy Shevchenko
> > > > > > > > <andriy.shevchenko@intel.com> wrote:
> > > > > > > > > On Tue, Sep 02, 2025 at 01:59:25PM +0200, Bartosz Golasze=
wski wrote:
>
> ...
>
> > > > > > > > > > The strict flag in struct pinmux_ops disallows the usag=
e of the same pin
> > > > > > > > > > as a GPIO and for another function. Without it, a rouge=
 user-space
> > > > > > > > > > process with enough privileges (or even a buggy driver)=
 can request a
> > > > > > > > > > used pin as GPIO and drive it, potentially confusing de=
vices or even
> > > > > > > > > > crashing the system. Set it globally for all pinctrl-ms=
m users.
> > > > > > > > >
> > > > > > > > > How does this keep (or allow) I=C2=B2C generic recovery m=
echanism to work?
> > > > > >
> > > > > > Anyway, what is your point? I don't think it has any impact on =
this.
> > > > >
> > > > > If we have a group of pins that are marked as I=C2=B2C, and we wa=
nt to use recovery
> > > > > via GPIOs, would it be still possible to request as GPIO when con=
troller driver
> > > > > is in the strict mode?
> > > >
> > > > Yes, if you mark that function as a "GPIO" function in the pin
> > > > controller driver.
> > >
> > > How would it prevent from requesting from user space?
> >
> > It wouldn't, we don't discriminate between user-space and in-kernel
> > GPIO users. A function either is a GPIO or isn't. Can you point me to
> > the driver you're thinking about or is this a purely speculative
> > question?
>
> The recovery mechanism is in I=C2=B2C core and many drivers use that.
> I'm not aware of Qualcomm drivers in particular. But mechanism is
> in use in I=C2=B2C DesignWare which is distributed a lot among platforms,
> so using word 'purely' is incorrect, and word 'speculative' is a bit
> strong, but you can think of the issue coming later on when somebody
> does something like this.
>
> The same applies to the in-band wakeup UART mechanism.
>
> Which means that with this series we will relax it back anyway for
> the above mentioned cases.
>
> (Not sure, but SPI DesignWare requires programming SPI native chip select=
s even
>  if the GPIO is used for that, this might have also some implications, bu=
t here
>  it's for real 'purely speculative'.)
>

The high-level answer is: yes, a pin that will be used by GPIOLIB
needs the function it's muxed to, to be marked as "GPIOable" in its
parent pin controller if it's strict. That's still better than the
current situation.

I can imagine we could differentiate between in-kernel and user-space
users of GPIOs and then make it impossible for the latter to request
certain pins while they could still be requested in the kernel but
that's outside of the scope of this series.

I don't see why this would stop these patches though, as they don't
break anything unless you decide to make your pin controller strict in
which situation you'd need to verify which functions can GPIOs anyway.

Bartosz

