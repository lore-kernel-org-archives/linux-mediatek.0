Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8F3ECA1009
	for <linux-mediatek@archiver.kernel.org>; Tue,  2 Sep 2025 21:45:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HY/P1wmmQ5CXIAhE0M3q1QG3EUDBLGeGAVW5/TOHSa0=; b=waojCn7n2ncq1hQFrbTaXCH7vB
	+a076r8dil55cdGGlfDAejo0NpbOXUYaW63+VLJuFC8IDMOmbsa85nP6XVQPFBOLvZOqc+4e1WkSv
	vYjGFOpGoHDadjNFw+CMpE6LYC415JK0oPGNMIqgSm3QdPxEgTGaqJf+80bTMsSKZeOhQ7C9M47Ra
	Swh+9apJywEtcTcgeJJh75EXReg/eHs03JiMC5HvXnr2q9NiWRLBBQGsGV5jmtrVHhnf6UyTCbyHJ
	DDWiWlU6umCnT2da2d/scdMkSBWLWGkGcFxr+Rpgywk9sjfxWmNpXl1AZD9gXD+P6zCdMkjGvHPOT
	LAfa2QQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utYos-00000002EFU-1jzW;
	Tue, 02 Sep 2025 21:45:38 +0000
Received: from mail-lf1-x12c.google.com ([2a00:1450:4864:20::12c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utV15-00000001EvF-3X1U
	for linux-mediatek@lists.infradead.org;
	Tue, 02 Sep 2025 17:42:00 +0000
Received: by mail-lf1-x12c.google.com with SMTP id 2adb3069b0e04-55f687fd3bdso5653305e87.1
        for <linux-mediatek@lists.infradead.org>; Tue, 02 Sep 2025 10:41:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1756834918; x=1757439718; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HY/P1wmmQ5CXIAhE0M3q1QG3EUDBLGeGAVW5/TOHSa0=;
        b=2cy5RgDRjWyQG/gAVthA4yZM3N7PiEl+lsmAsRU/MW7KJ79IY4Y+87fpXQtR2ZXj0F
         xoh2h073Y9nF33wHbWZlIWFz/NOpx5YQieqcd4OjFXxu2su2g5R3l6KdcZzd1p8A2xDP
         yuc3y2g0hgaDkdEhW+6uJ7iDzFZUtob3qzWgw7GBKS6qWv1gNdQDXWFe0w+o1unme/8H
         uujPvb04rBD3w1QpIfSoiSaysLFhZUTWGVPyVTzzdfx+00IKbRHAcPIvHIWpwyg3hTDI
         GZpE8RtF6N5o63Xc2sPWjEp28VsLJ3nbx4fJFEMIjTcGscVa+Lc6tKZwCpa/eL7VH4g8
         Q5NQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756834918; x=1757439718;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HY/P1wmmQ5CXIAhE0M3q1QG3EUDBLGeGAVW5/TOHSa0=;
        b=BjZT18JmBEkOJzkqBioLnbkPbTqWUgf0+vydreiaSEUWwkgKrpKVf/tBzdiHmvIvEp
         BCicTm6oa9+zvvewYIoc9dafZFniFIhYTzLuA6wLGRSm75ftXx6xzMul1oAEEnAX1ugJ
         0Chp6uQ4ojr1NF5LL5UC25L3l7KqAXFbN5a8jCJ0WvkEdXLj/tsF2ZRgoBPx6kx5I+8N
         58PhtJvzqvzzY0MSJZulqbAVFRQu0oEV328fiLSDxtBdD1Uh0ZeFXSOWTGhK4WFTgQbt
         JQ5drl0DNHOQhg6a3VLUg6YvCCWtfC/CZf2ut5oHLEFZuWUxuHy0aSLg1789+UWvKv1n
         yPlw==
X-Forwarded-Encrypted: i=1; AJvYcCVNsHjHRU6QKfQnqFuJnHMQQBSa6HUUIMStqBlpPU5+ld0ZE1QDxQRrq9PCFfcspk32BCGDfr8JHQDIuwtiIQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yys2C8YulsmDXCkKqOzkeFaozFHdZeACqMoqvpp6QLM/O3AnOhJ
	H3nTu62T00OrLO6z6chB9LArUIeoMh7rNyn1XO9jHqC7nMKZjdDyM8mhPOYNQjekAqgKfnaVJVh
	I3hzwg7cdno2qIB9oMRWOu9HIHEg+Hc267prb8DCWlA==
X-Gm-Gg: ASbGnct460XbUxaBiFF/5vd3lqiY6pvCM3f9aKkwxeGOjBXtxjDIjXcH5msJC1UlOPi
	c4k0tEWUER4a6BdkZDnE8WtD2+jqvz9OMEnnwjC8uoLAwQfK6Lg6usQ8+cUuChH3PVIXXXDldzf
	CR2bgSKLfMxTmTWFRLQVXD3Ii1jICxzZEQOxudlv/EWA/pw8woO38w1wHX2OSIzHc0Og3oJ2ZVT
	Fmh4b1yySmKAJH1yJIL6IT/JD/277La7shaStQMa4oENcI2jA==
X-Google-Smtp-Source: AGHT+IEj8d7P3cFn9WHSMlcQJco2rutroHWRWEZV/BsdBzW10JlelDxpX/d5bcqoiRzS4+dxD5+bg22V2Ltijnn3kOg=
X-Received: by 2002:a05:6512:61d5:20b0:55f:727d:408c with SMTP id
 2adb3069b0e04-55f727d46c3mr3142298e87.50.1756834918139; Tue, 02 Sep 2025
 10:41:58 -0700 (PDT)
MIME-Version: 1.0
References: <20250902-pinctrl-gpio-pinfuncs-v7-0-bb091daedc52@linaro.org>
 <20250902-pinctrl-gpio-pinfuncs-v7-16-bb091daedc52@linaro.org> <aLcBcjvMbrxoDYoC@smile.fi.intel.com>
In-Reply-To: <aLcBcjvMbrxoDYoC@smile.fi.intel.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 2 Sep 2025 19:41:47 +0200
X-Gm-Features: Ac12FXz-Ict8QGMZawDnah9byaE6SYSj17yQF92en6o4smsRWpZmv8sya_ULoRc
Message-ID: <CAMRc=MfcFMgkNqWNZV5o0NxkAvxBTjC3vv56Cr98n0R2CkxuPw@mail.gmail.com>
Subject: Re: [PATCH v7 16/16] pinctrl: qcom: make the pinmuxing strict
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Alexey Klimov <alexey.klimov@linaro.org>, 
	Lorenzo Bianconi <lorenzo@kernel.org>, Sean Wang <sean.wang@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
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
X-CRM114-CacheID: sfid-20250902_104159_879556_C0291A0C 
X-CRM114-Status: GOOD (  15.27  )
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

On Tue, Sep 2, 2025 at 4:38=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@intel.com> wrote:
>
> On Tue, Sep 02, 2025 at 01:59:25PM +0200, Bartosz Golaszewski wrote:
> > From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> >
> > The strict flag in struct pinmux_ops disallows the usage of the same pi=
n
> > as a GPIO and for another function. Without it, a rouge user-space
> > process with enough privileges (or even a buggy driver) can request a
> > used pin as GPIO and drive it, potentially confusing devices or even
> > crashing the system. Set it globally for all pinctrl-msm users.
>
> How does this keep (or allow) I=E6=B6=8E generic recovery mechanism to wo=
rk?
>

What even is the "generic recovery mechanism"? That's the first time
I'm hearing this name.

Bartosz

