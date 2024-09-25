Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51D15C369BA
	for <linux-mediatek@archiver.kernel.org>; Wed, 25 Sep 2024 09:49:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+xQSQtVIFZwDULs9lX7FQ9AJ4VCH7LXtyrHdG2hzxj8=; b=jz8/Oxn1bUcTZpArCaXUJ5Vq0A
	LyvYp3EIPK7YmdvOYkY9TNZ8iPuPncYS4bJ7Vbbkqnb+0QTKJd6wO9ovFlTyfr0rrrL7DXpTAP+4R
	/wxznMyNOzaHo+ntVtjVNKQVeKpm9tKBhgzZZ5F0oUhB4HHORB5Y94eWPWKCVWJr/n4POh1sLqSfL
	j8ZtFNtgKOIJICCmTYkByxTz/5oVtfOB2LlkTI3R/Eb00fYNGoBgY6y4Hhmg/v7O6UtceiovqlK/Z
	id3cc4XE+3c9wQXxdkUIDG0Qb5AOqi/9GCp+o5uPx2s3zi2fCtD0Yb3WbLXb4atfPaw8DccyvmvrE
	DUm06FaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1stOdn-00000004euk-0uQ7;
	Wed, 25 Sep 2024 09:48:59 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1stOcc-00000004ep7-0Yet;
	Wed, 25 Sep 2024 09:47:47 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 214575C5BFB;
	Wed, 25 Sep 2024 09:47:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7A3C1C4CEC3;
	Wed, 25 Sep 2024 09:47:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727257664;
	bh=mes99sViCBF6zif+B7hz6V9ArPg0p/BE3GMmFR/yKTY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=RuRyjlJdXf1WdwatxCxPZR1VdmzSE9r/ChvwgJke1gj0PClkIWE6mh5ksiTL8YWa9
	 tVz1iKR9HH8mZXmfZrSSb+fzw3XP2Ey53JTg8AP9SbZ5v944+o2qAppzWHRnaIjcQ6
	 3+bJ1SeljxYV5mzlYEmgQQdoEDvuoytMLKKRT06xsB59bcrXJuu/GkmgG3DmIIbimn
	 Lb9sVXRXlpCwPUqmuPfTE2j+ULDfcKIjunJSlcAWNNsrWAbmqxZ/wournJ59k/Dtys
	 rbUC1OFsr5xvucq4DyJq9SKqP7Q1K781KauxXVcWOqNIuZQmXG2F0r47zmm+pU6wbx
	 Zrli3O1Cs4tlw==
Date: Wed, 25 Sep 2024 10:47:38 +0100
From: Lee Jones <lee@kernel.org>
To: Christian Marangi <ansuelsmth@gmail.com>
Cc: Lorenzo Bianconi <lorenzo@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sean Wang <sean.wang@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <ukleinek@kernel.org>,
	linux-mediatek@lists.infradead.org, linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	upstream@airoha.com, benjamin.larsson@genexis.eu,
	linux-pwm@vger.kernel.org
Subject: Re: [PATCH v4 0/5] Add mfd, pinctrl and pwm support to EN7581 SoC
Message-ID: <20240925094738.GD7545@google.com>
References: <20240911-en7581-pinctrl-v4-0-60ac93d760bb@kernel.org>
 <66f13ab0.5d0a0220.b0c27.b441@mx.google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <66f13ab0.5d0a0220.b0c27.b441@mx.google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240925_024746_331034_60AAC0C3 
X-CRM114-Status: GOOD (  33.26  )
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

On Mon, 23 Sep 2024, Christian Marangi wrote:

> On Wed, Sep 11, 2024 at 09:50:00PM +0200, Lorenzo Bianconi wrote:
> > Introduce airoha-mfd driver in order to load pinctrl and pwm drivers for
> > EN7581 SoC. airoha-mfd is needed since both pinctrl and pwm drivers
> > needs to access the same memory block (gpio memory region) to configure
> > {gio,irq}_chip and pwm functionalities respectively, so model them as
> > childs of a parent mfd driver.
> > Current EN7581 pinctrl driver supports the following functionalities:
> > - pin multiplexing via chip_scu syscon
> > - pin pull-up, pull-down, open-drain, current strength,
> >   {input,output}_enable, output_{low,high} via chip_scu syscon
> > - gpio controller
> > - irq controller
> > 
> > ---
> > Changes in v4:
> > - add 'Limitation' description in pwm driver
> > - fix comments in pwm driver
> > - rely on mfd->base __iomem pointer in pwm driver, modify register
> >   offsets according to it and get rid of sgpio_cfg, flash_cfg and
> >   cycle_cfg pointers
> > - simplify register utility routines in pwm driver
> > - use 'generator' instead of 'waveform' suffix for pwm routines
> > - fix possible overflow calculating duty cycle in pwm driver
> > - do not modify pwm state in free callback in pwm driver
> > - cap the maximum period in pwm driver
> > - do not allow inverse polarity in pwm driver
> > - do not set of_xlate callback in the pwm driver and allow the stack to
> >   do it
> > - fix MAINTAINERS file for airoha pinctrl driver
> > - fix undefined reference to __ffsdi2 in pinctrl driver
> > - simplify airoha,en7581-gpio-sysctl.yam binding
> > - Link to v3: https://lore.kernel.org/r/20240831-en7581-pinctrl-v3-0-98eebfb4da66@kernel.org
> > 
> > Changes in v3:
> > - introduce airoha-mfd driver
> > - add pwm driver to the same series
> > - model pinctrl and pwm drivers as childs of a parent mfd driver.
> > - access chip-scu memory region in pinctrl driver via syscon
> > - introduce a single airoha,en7581-gpio-sysctl.yaml binding and get rid
> >   of dedicated bindings for pinctrl and pwm
> > - add airoha,en7581-chip-scu.yaml binding do the series
> > - Link to v2: https://lore.kernel.org/r/20240822-en7581-pinctrl-v2-0-ba1559173a7f@kernel.org
> > 
> > Changes in v2:
> > - Fix compilation errors
> > - Collapse some register mappings for gpio and irq controllers
> > - update dt-bindings according to new register mapping
> > - fix some dt-bindings errors
> > - Link to v1: https://lore.kernel.org/all/cover.1723392444.git.lorenzo@kernel.org/
> > 
> > ---
> > Benjamin Larsson (1):
> >       pwm: airoha: Add support for EN7581 SoC
> > 
> > Christian Marangi (2):
> >       dt-bindings: mfd: Add support for Airoha EN7581 GPIO System Controller
> >       mfd: airoha: Add support for Airoha EN7581 MFD
> > 
> > Lorenzo Bianconi (2):
> >       dt-bindings: arm: airoha: Add the chip-scu node for EN7581 SoC
> >       pinctrl: airoha: Add support for EN7581 SoC
> > 
> >  .../bindings/arm/airoha,en7581-chip-scu.yaml       |   42 +
> >  .../bindings/mfd/airoha,en7581-gpio-sysctl.yaml    |  433 +++
> >  MAINTAINERS                                        |    7 +
> >  drivers/mfd/Kconfig                                |    8 +
> >  drivers/mfd/Makefile                               |    2 +
> >  drivers/mfd/airoha-en7581-gpio-mfd.c               |   72 +
> >  drivers/pinctrl/mediatek/Kconfig                   |   16 +-
> >  drivers/pinctrl/mediatek/Makefile                  |    1 +
> >  drivers/pinctrl/mediatek/pinctrl-airoha.c          | 2964 ++++++++++++++++++++
> >  drivers/pwm/Kconfig                                |   10 +
> >  drivers/pwm/Makefile                               |    1 +
> >  drivers/pwm/pwm-airoha.c                           |  414 +++
> >  include/linux/mfd/airoha-en7581-mfd.h              |    9 +
> >  13 files changed, 3978 insertions(+), 1 deletion(-)
> > ---
> > base-commit: 264c13114bd71ddfd7b25c7b94f6cda4587eca25
> > change-id: 20240818-en7581-pinctrl-1bf120154be0
> > prerequisite-change-id: 20240705-for-6-11-bpf-a349efc08df8:v2
> > 
> >
> 
> Hi,
> 
> any news with this? Rob reviewed the DT schemas and he is ok with them.
> 
> Any other comments for the MFD driver and/or the pinctrl or PWM driver?

Note that the merge-window is still open.  Some maintainers, myself
included, use this lull to prioritise other things.  This set is on my
list and will be dealt with shortly.

-- 
Lee Jones [李琼斯]

