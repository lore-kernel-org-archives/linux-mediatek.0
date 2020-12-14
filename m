Return-Path: <SRS0=EHBe=FS=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-20.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3D0D5C4361B
	for <linux-mediatek@archiver.kernel.org>; Mon, 14 Dec 2020 22:28:43 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A39AE22507
	for <linux-mediatek@archiver.kernel.org>; Mon, 14 Dec 2020 22:28:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A39AE22507
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=L0M0YOx8h/qayRr2lVcz2HsocXJFheuOK51o7ntmm38=; b=YGizC7it2RjQmdkJlqqSAuLSk
	X4B5oN8gffo8Q95GZL0IIuW7E7l7e+JutIloBAChETfUif/85BiQnjxBHtn07e4QzwM+z8YINLDuU
	BXSLcAMD4f6vjyoMb6hGLaXglZ2RjnG9MlPPsVI0h2fiqRX+RUpvEi5pHRhuXmVN1pOzWFb53SRai
	kDqdvmNawff/1WSlOJu5xoTjWqwOdtpL3ZKmmqE4xQUilxEchJWYfPoXLSjocYGUymBtJpTM3vbFE
	Ws6qj+KkOfhYpbHg0Ry16jAu0v+gG9EhGI+qa/n92YW+o4oOhoBqFIFXXxyyB1b+uB9YdpVQr+7N9
	/jOgH5i0Q==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kowKU-0006eE-8H; Mon, 14 Dec 2020 22:28:30 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kowKR-0006dm-7u
 for linux-mediatek@lists.infradead.org; Mon, 14 Dec 2020 22:28:28 +0000
Received: from [IPv6:2a00:5f00:102:0:a0b6:46ff:fefa:49e7] (unknown
 [IPv6:2a00:5f00:102:0:a0b6:46ff:fefa:49e7])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: gtucker)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 6DA3E1F4503D;
 Mon, 14 Dec 2020 22:28:23 +0000 (GMT)
Subject: Re: linusw/devel bisection:
 baseline.bootrr.mediatek-mt8173-pinctrl-probed on mt8173-elm-hana
To: Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 Linus Walleij <linus.walleij@linaro.org>
References: <5fd76cf2.1c69fb81.6f19b.b16a@mx.google.com>
From: Guillaume Tucker <guillaume.tucker@collabora.com>
Message-ID: <483b08f2-09c3-e753-d2ce-4e34fee627f3@collabora.com>
Date: Mon, 14 Dec 2020 22:28:19 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.2
MIME-Version: 1.0
In-Reply-To: <5fd76cf2.1c69fb81.6f19b.b16a@mx.google.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201214_172827_481101_DAEDCDCD 
X-CRM114-Status: GOOD (  35.51  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: "kernelci-results@groups.io" <kernelci-results@groups.io>,
 Geert Uytterhoeven <geert+renesas@glider.be>, Sean Wang <sean.wang@kernel.org>,
 open list <linux-kernel@vger.kernel.org>, Johan Hovold <johan@kernel.org>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 linux-mediatek@lists.infradead.org,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 Collabora Kernel ML <kernel@collabora.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi Linus,

Please see the bisection report below about the pinctrl driver
failing to probe on the arm64 mt8173-elm-hana platform.

Reports aren't automatically sent to the public while we're
trialing new bisection features on kernelci.org but this one
looks valid.

This is the error message:

[    0.051788] gpio gpiochip0: Detected name collision for GPIO name ''
[    0.051813] gpio gpiochip0: GPIO name collision on the same chip, this is not allowed, fix all lines on the chip to have unique names
[    0.051832] gpiochip_add_data_with_key: GPIOs 377..511 (1000b000.pinctrl) failed to register, -17
[    0.051946] mediatek-mt8173-pinctrl: probe of 1000b000.pinctrl failed with error -22

and the full log:

  https://storage.kernelci.org/linusw/devel/v5.10-rc4-91-g65efb43ac94b/arm64/defconfig/gcc-8/lab-collabora/baseline-mt8173-elm-hana.html#L492

I guess some GPIO now needs to be renamed following your patch
which enforces uniqueness, so it's not a problem with the patch
per se.  As I'm not sure if it's something you would want to fix
yourself, I've also CC-ed MediaTek and others such as Enric who
knows about this platform and helped enable the test in KernelCI.

Best wishes,
Guillaume

On 14/12/2020 13:47, KernelCI bot wrote:
> * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
> * This automated bisection report was sent to you on the basis  *
> * that you may be involved with the breaking commit it has      *
> * found.  No manual investigation has been done to verify it,   *
> * and the root cause of the problem may be somewhere else.      *
> *                                                               *
> * If you do send a fix, please include this trailer:            *
> *   Reported-by: "kernelci.org bot" <bot@kernelci.org>          *
> *                                                               *
> * Hope this helps!                                              *
> * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
> 
> linusw/devel bisection: baseline.bootrr.mediatek-mt8173-pinctrl-probed on mt8173-elm-hana
> 
> Summary:
>   Start:      65efb43ac94b gpiolib: Disallow identical line names in the same chip
>   Plain log:  https://storage.kernelci.org/linusw/devel/v5.10-rc4-91-g65efb43ac94b/arm64/defconfig/gcc-8/lab-collabora/baseline-mt8173-elm-hana.txt
>   HTML log:   https://storage.kernelci.org/linusw/devel/v5.10-rc4-91-g65efb43ac94b/arm64/defconfig/gcc-8/lab-collabora/baseline-mt8173-elm-hana.html
>   Result:     65efb43ac94b gpiolib: Disallow identical line names in the same chip
> 
> Checks:
>   revert:     PASS
>   verify:     PASS
> 
> Parameters:
>   Tree:       linusw
>   URL:        https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gpio.git/
>   Branch:     devel
>   Target:     mt8173-elm-hana
>   CPU arch:   arm64
>   Lab:        lab-collabora
>   Compiler:   gcc-8
>   Config:     defconfig
>   Test case:  baseline.bootrr.mediatek-mt8173-pinctrl-probed
> 
> Breaking commit found:
> 
> -------------------------------------------------------------------------------
> commit 65efb43ac94bffeb652cddba4106817bb38c5e71
> Author: Linus Walleij <linus.walleij@linaro.org>
> Date:   Sat Dec 12 01:34:47 2020 +0100
> 
>     gpiolib: Disallow identical line names in the same chip
>     
>     We need to make this namespace hierarchical: at least do not
>     allow two lines on the same chip to have the same name, this
>     is just too much flexibility. If we name a line on a chip,
>     name it uniquely on that chip.
>     
>     I don't know what happens if we just apply this, I *hope* there
>     are not a lot of systems out there breaking this simple and
>     intuitive rule.
>     
>     As a side effect, this makes the device tree naming code
>     scream a bit if names are not globally unique.
>     
>     I think there are not super-many device trees out there naming
>     their lines so let's fix this before the problem becomes
>     widespread.
>     
>     Cc: Geert Uytterhoeven <geert+renesas@glider.be>
>     Cc: Johan Hovold <johan@kernel.org>
>     Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
>     Link: https://lore.kernel.org/r/20201212003447.238474-1-linus.walleij@linaro.org
> 
> diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
> index 5ce0c14c637b..fe1b96b7f127 100644
> --- a/drivers/gpio/gpiolib.c
> +++ b/drivers/gpio/gpiolib.c
> @@ -330,11 +330,9 @@ static struct gpio_desc *gpio_name_to_desc(const char * const name)
>  
>  /*
>   * Take the names from gc->names and assign them to their GPIO descriptors.
> - * Warn if a name is already used for a GPIO line on a different GPIO chip.
>   *
> - * Note that:
> - *   1. Non-unique names are still accepted,
> - *   2. Name collisions within the same GPIO chip are not reported.
> + * - Fail if a name is already used for a GPIO line on the same chip.
> + * - Allow names to not be globally unique but warn about it.
>   */
>  static int gpiochip_set_desc_names(struct gpio_chip *gc)
>  {
> @@ -343,13 +341,19 @@ static int gpiochip_set_desc_names(struct gpio_chip *gc)
>  
>  	/* First check all names if they are unique */
>  	for (i = 0; i != gc->ngpio; ++i) {
> -		struct gpio_desc *gpio;
> +		struct gpio_desc *gpiod;
>  
> -		gpio = gpio_name_to_desc(gc->names[i]);
> -		if (gpio)
> +		gpiod = gpio_name_to_desc(gc->names[i]);
> +		if (gpiod) {
>  			dev_warn(&gdev->dev,
>  				 "Detected name collision for GPIO name '%s'\n",
>  				 gc->names[i]);
> +			if (gpiod->gdev == gdev) {
> +				dev_err(&gdev->dev,
> +					"GPIO name collision on the same chip, this is not allowed, fix all lines on the chip to have unique names\n");
> +				return -EEXIST;
> +			}
> +		}
>  	}
>  
>  	/* Then add all names to the GPIO descriptors */
> @@ -402,8 +406,22 @@ static int devprop_gpiochip_set_names(struct gpio_chip *chip)
>  		return ret;
>  	}
>  
> -	for (i = 0; i < count; i++)
> +	for (i = 0; i < count; i++) {
> +		struct gpio_desc *gpiod;
> +
> +		gpiod = gpio_name_to_desc(names[i]);
> +		if (gpiod) {
> +			dev_warn(&gdev->dev,
> +                                 "Detected name collision for GPIO name '%s'\n",
> +                                 names[i]);
> +			if (gpiod->gdev == gdev) {
> +				dev_err(&gdev->dev,
> +					"GPIO name collision on the same chip, this is not allowed, fix all lines on the chip to have unique names\n");
> +				return -EEXIST;
> +			}
> +		}
>  		gdev->descs[i].name = names[i];
> +	}
>  
>  	kfree(names);
> -------------------------------------------------------------------------------
> 
> 
> Git bisection log:
> 
> -------------------------------------------------------------------------------
> git bisect start
> # good: [9777d0bfdae796de3f8d73879a43bc00145dc8ee] gpio: cs5535: Simplify the return expression of cs5535_gpio_probe()
> git bisect good 9777d0bfdae796de3f8d73879a43bc00145dc8ee
> # bad: [65efb43ac94bffeb652cddba4106817bb38c5e71] gpiolib: Disallow identical line names in the same chip
> git bisect bad 65efb43ac94bffeb652cddba4106817bb38c5e71
> # good: [a8f25236e6e3d945139b62da0c4398778f77a5b3] MAINTAINERS: Add maintainer for HiSilicon GPIO driver
> git bisect good a8f25236e6e3d945139b62da0c4398778f77a5b3
> # first bad commit: [65efb43ac94bffeb652cddba4106817bb38c5e71] gpiolib: Disallow identical line names in the same chip
> -------------------------------------------------------------------------------
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Groups.io Links: You receive all messages sent to this group.
> View/Reply Online (#4626): https://groups.io/g/kernelci-results/message/4626
> Mute This Topic: https://groups.io/mt/78950269/924702
> Group Owner: kernelci-results+owner@groups.io
> Unsubscribe: https://groups.io/g/kernelci-results/unsub [guillaume.tucker@collabora.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 
> 


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
