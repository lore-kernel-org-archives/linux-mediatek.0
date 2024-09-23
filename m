Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37518CF9C5B
	for <linux-mediatek@archiver.kernel.org>; Mon, 23 Sep 2024 09:54:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Subject:Cc:To:From:Date:Message-ID:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=W/G5Y1Yc2GdbX/HaGBtPNbObghnd/ierGxsK5LlHR+M=; b=mDmAb8AWgTcoKDVaSBSvj/mwxn
	MfOyTLo2H/3bNLcpjuKYpspEiVN7ER49JbzhQ5lQ8MV8wgCM/BW1oRr6ceiP7OkawZMURpft95FtD
	Dy2hmoZ2aEMhuXYyONsvYCg1uUlNS3LS1YspZEw45zZF3ffBbRylW/8D8HH5lU08TGYlHlX5UANTC
	avxi1CcbcAqTVBQPAjAGgVHxeb96QrhEvypmmnkWbpW70Xs0ymwdLxpS+kgK4DQBmyN+0roLayqT0
	W1HJoNktS+K1SkxnSj0YHGAaM0xsHpmtGplnJK+iEu3elwcT6HDVrpvxYqVbaNV9sRAx4/7Co+8J8
	WyUybciA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1ssflt-0000000GtID-1JfO;
	Mon, 23 Sep 2024 09:54:21 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1ssflT-0000000GtFw-2MYi;
	Mon, 23 Sep 2024 09:53:57 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-42e748f78d6so32667135e9.0;
        Mon, 23 Sep 2024 02:53:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727085233; x=1727690033; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=W/G5Y1Yc2GdbX/HaGBtPNbObghnd/ierGxsK5LlHR+M=;
        b=SO/oiA282Lkb+b0iWhoYacYQazIU4N5ihuCsJ8+VifVCZEiPA0k5artWiQvhkU7VXT
         hzgHcVJutJSHpbHD1Jxs4wuqMtERwHrPdZOJ+LjX8xTutcW4dDcY6FPO40LNEgLqyRnc
         1cB0+cFCqRP57P5nIOEo77itwbf5VdYw2gaGOteEh6hpxtPgeGlDOyx01NgS/3hCHaFe
         cvNCtt+G1079bFSpdSlHNdoW+BhXAUXpFkt96XRSTn/SoRGUU8q7bUHFVD/MradVo+In
         GBk/l7XvIw4g+Xax1h2lweIBizK8oTy6RqLdsaJJFSzIOJFZUgEk+85GLhL8iAQjv6CK
         Atsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727085233; x=1727690033;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=W/G5Y1Yc2GdbX/HaGBtPNbObghnd/ierGxsK5LlHR+M=;
        b=OY31goKVuUq0lLexH6VEE3icYwPPEjavkonNxeXKlKY2VBq8HQGxA/VBbfHQx8TcQe
         +ESKY0hjCmVuZAVcBWTBEU/uVaqY/xSoa6xtdQr0QuUeuBka7ZSybrFkg7njnnlj2N/P
         bkZZ3+MYoxbcJ3yzuimj6NRQBm84gv62Q2Zt39IKTjo+MkZyRnB/Ir3AWq6Iuvf+tVe1
         7ZFdnpUdTLfeW5sAmS5qFwn8WqGNgNI8ITXK0JWhYM1BYf0hI1yLcoHotNQM1JkMJjlM
         FWd2Z2AK8lBFEyHVjoc0W5tKsICdJMld4j7Zt9RSNailWGFy9EJ8hLlY9wjUlM5NHtIn
         bvBw==
X-Forwarded-Encrypted: i=1; AJvYcCUX5wPNsP33JdsQR5KKF7NQ6XkD/mudU1rXbVLffLaDAHKbvzazWhOTs+o2e8LJp2n8twm6YHiQW2+oaKKTg7A=@lists.infradead.org, AJvYcCWZnNg6A0qSWmOUZ6jDgJr276CwgnpAjvpZeIGWJDdyR/dOpdizXTKZftpHJ9vw9OROVF9nKe63w2lEEZBihqNY@lists.infradead.org
X-Gm-Message-State: AOJu0YzdrgvP1uup3pWgwUoudGQ+ZS7jAe9wdWVwsTJ+zyT+jiu5fegq
	VLTQv2Loy/qcvNUbnefi9fic5U/HerO66pes81ejfP4N+wRe6eKg
X-Google-Smtp-Source: AGHT+IHFcRqze8NF48rSN4RfnRVSC5MCHRlQsylzZ05QxbfMJ+tA5vQe9UKElu6ng0HSNIhzNc4qfQ==
X-Received: by 2002:a5d:5f83:0:b0:374:c977:363 with SMTP id ffacd0b85a97d-37a43154e86mr7174926f8f.24.1727085233174;
        Mon, 23 Sep 2024 02:53:53 -0700 (PDT)
Received: from Ansuel-XPS. (93-34-90-105.ip49.fastwebnet.it. [93.34.90.105])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-378e7805193sm23850774f8f.98.2024.09.23.02.53.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Sep 2024 02:53:52 -0700 (PDT)
Message-ID: <66f13ab0.5d0a0220.b0c27.b441@mx.google.com>
X-Google-Original-Message-ID: <ZvE6rpnzlrUJHKLx@Ansuel-XPS.>
Date: Mon, 23 Sep 2024 11:53:50 +0200
From: Christian Marangi <ansuelsmth@gmail.com>
To: Lorenzo Bianconi <lorenzo@kernel.org>
Cc: Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sean Wang <sean.wang@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Lee Jones <lee@kernel.org>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <ukleinek@kernel.org>,
	linux-mediatek@lists.infradead.org, linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	upstream@airoha.com, benjamin.larsson@genexis.eu,
	linux-pwm@vger.kernel.org
Subject: Re: [PATCH v4 0/5] Add mfd, pinctrl and pwm support to EN7581 SoC
References: <20240911-en7581-pinctrl-v4-0-60ac93d760bb@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240911-en7581-pinctrl-v4-0-60ac93d760bb@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240923_025355_628181_106B343E 
X-CRM114-Status: GOOD (  27.54  )
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

On Wed, Sep 11, 2024 at 09:50:00PM +0200, Lorenzo Bianconi wrote:
> Introduce airoha-mfd driver in order to load pinctrl and pwm drivers for
> EN7581 SoC. airoha-mfd is needed since both pinctrl and pwm drivers
> needs to access the same memory block (gpio memory region) to configure
> {gio,irq}_chip and pwm functionalities respectively, so model them as
> childs of a parent mfd driver.
> Current EN7581 pinctrl driver supports the following functionalities:
> - pin multiplexing via chip_scu syscon
> - pin pull-up, pull-down, open-drain, current strength,
>   {input,output}_enable, output_{low,high} via chip_scu syscon
> - gpio controller
> - irq controller
> 
> ---
> Changes in v4:
> - add 'Limitation' description in pwm driver
> - fix comments in pwm driver
> - rely on mfd->base __iomem pointer in pwm driver, modify register
>   offsets according to it and get rid of sgpio_cfg, flash_cfg and
>   cycle_cfg pointers
> - simplify register utility routines in pwm driver
> - use 'generator' instead of 'waveform' suffix for pwm routines
> - fix possible overflow calculating duty cycle in pwm driver
> - do not modify pwm state in free callback in pwm driver
> - cap the maximum period in pwm driver
> - do not allow inverse polarity in pwm driver
> - do not set of_xlate callback in the pwm driver and allow the stack to
>   do it
> - fix MAINTAINERS file for airoha pinctrl driver
> - fix undefined reference to __ffsdi2 in pinctrl driver
> - simplify airoha,en7581-gpio-sysctl.yam binding
> - Link to v3: https://lore.kernel.org/r/20240831-en7581-pinctrl-v3-0-98eebfb4da66@kernel.org
> 
> Changes in v3:
> - introduce airoha-mfd driver
> - add pwm driver to the same series
> - model pinctrl and pwm drivers as childs of a parent mfd driver.
> - access chip-scu memory region in pinctrl driver via syscon
> - introduce a single airoha,en7581-gpio-sysctl.yaml binding and get rid
>   of dedicated bindings for pinctrl and pwm
> - add airoha,en7581-chip-scu.yaml binding do the series
> - Link to v2: https://lore.kernel.org/r/20240822-en7581-pinctrl-v2-0-ba1559173a7f@kernel.org
> 
> Changes in v2:
> - Fix compilation errors
> - Collapse some register mappings for gpio and irq controllers
> - update dt-bindings according to new register mapping
> - fix some dt-bindings errors
> - Link to v1: https://lore.kernel.org/all/cover.1723392444.git.lorenzo@kernel.org/
> 
> ---
> Benjamin Larsson (1):
>       pwm: airoha: Add support for EN7581 SoC
> 
> Christian Marangi (2):
>       dt-bindings: mfd: Add support for Airoha EN7581 GPIO System Controller
>       mfd: airoha: Add support for Airoha EN7581 MFD
> 
> Lorenzo Bianconi (2):
>       dt-bindings: arm: airoha: Add the chip-scu node for EN7581 SoC
>       pinctrl: airoha: Add support for EN7581 SoC
> 
>  .../bindings/arm/airoha,en7581-chip-scu.yaml       |   42 +
>  .../bindings/mfd/airoha,en7581-gpio-sysctl.yaml    |  433 +++
>  MAINTAINERS                                        |    7 +
>  drivers/mfd/Kconfig                                |    8 +
>  drivers/mfd/Makefile                               |    2 +
>  drivers/mfd/airoha-en7581-gpio-mfd.c               |   72 +
>  drivers/pinctrl/mediatek/Kconfig                   |   16 +-
>  drivers/pinctrl/mediatek/Makefile                  |    1 +
>  drivers/pinctrl/mediatek/pinctrl-airoha.c          | 2964 ++++++++++++++++++++
>  drivers/pwm/Kconfig                                |   10 +
>  drivers/pwm/Makefile                               |    1 +
>  drivers/pwm/pwm-airoha.c                           |  414 +++
>  include/linux/mfd/airoha-en7581-mfd.h              |    9 +
>  13 files changed, 3978 insertions(+), 1 deletion(-)
> ---
> base-commit: 264c13114bd71ddfd7b25c7b94f6cda4587eca25
> change-id: 20240818-en7581-pinctrl-1bf120154be0
> prerequisite-change-id: 20240705-for-6-11-bpf-a349efc08df8:v2
> 
>

Hi,

any news with this? Rob reviewed the DT schemas and he is ok with them.

Any other comments for the MFD driver and/or the pinctrl or PWM driver?

-- 
	Ansuel

