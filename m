Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C821ECAAD5
	for <linux-mediatek@archiver.kernel.org>; Mon,  5 Sep 2022 17:29:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5y/yYRirByd+lMioU/3yI33k356DCFTzd+1VuBc8YOY=; b=tepGgoyCX4I2Vy0WleDAlPpBfR
	lKDxAbaM0wVj2UYPa7RZnslbHfASVu5AzdcDqba/t7Q9Q2fcsbuM7rr74700XjgZ9g3+T8HuWq1Tj
	Hey5bBgyBgZIYVFZbmnWU5cSOTRn/4AsPMmrjZ7XZryigyMqbB6657KOJXIrci65ds7Rw/uKaQIkO
	3y5nXxYUdI9Uf3jqViihwmCFizS4S1PTteHX+2787GfAZoP3NJgCjS3RVPp0w1s5NTSVzpARubUim
	w0q/MxUFWI2rofkVqMj3gp/Nf86+P8lc6IdkJoSb5Os4EiXINuCRGvj13qWVCGktWYrNUxWi/mbTV
	83fny3CQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oVFua-007Zee-IP; Mon, 05 Sep 2022 17:29:28 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oVDrJ-005n2P-D3; Mon, 05 Sep 2022 15:18:00 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 8849E61326;
	Mon,  5 Sep 2022 15:17:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2AA5AC433D6;
	Mon,  5 Sep 2022 15:17:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1662391076;
	bh=+1JZVikczD6oMQstBHmmQ6IUy+FzfgWRuCZFth/S+Dw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Yqo0TLPTEI46myyss+uHeRcfU8jMlNl/nWSkBHabM+hWfliZo8rDKXYcZM1EFORBW
	 oD0h5vJio83AnqAsoUp8raLAV7S1JNFk86UJc2drDU5jNz6D4QksFJPm/f7l6Zaj9w
	 /fBzFW3F8yu+Kqb4oHJvOaXpu2JJ1o6Z0/d9wjL8x2M2Cp2zaRDjoxZmc2hvauq7jy
	 gBsa3txjSmNd6aJDnmHFR2ofz3hBDJFO8M10YVzOVofQrrusETDUOUv2Cza8FqJrdh
	 Si5ltT72oPZY9MFr1MpNovq3zDX+hjQjm0iNUCfzwMnBeqLFXZy5HfPaWRiHQqZ+SN
	 BGexnGAQEKK7Q==
Date: Mon, 5 Sep 2022 16:17:38 +0100
From: Lee Jones <lee@kernel.org>
To: ChiaEn Wu <peterwu.pub@gmail.com>
Cc: daniel.thompson@linaro.org, jingoohan1@gmail.com, pavel@ucw.cz,
	robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
	matthias.bgg@gmail.com, sre@kernel.org, jic23@kernel.org,
	lars@metafoo.de, deller@gmx.de, broonie@kernel.org,
	mazziesaccount@gmail.com, andriy.shevchenko@linux.intel.com,
	chiaen_wu@richtek.com, alice_chen@richtek.com, cy_huang@richtek.com,
	dri-devel@lists.freedesktop.org, linux-leds@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org, linux-iio@vger.kernel.org,
	linux-fbdev@vger.kernel.org, szunichen@gmail.com,
	andy.shevchenko@gmail.com
Subject: Re: [PATCH v9 10/10] video: backlight: mt6370: Add MediaTek MT6370
 support
Message-ID: <YxYR2/knZTsy9Uh8@google.com>
References: <20220830034042.9354-2-peterwu.pub@gmail.com>
 <20220830034042.9354-11-peterwu.pub@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220830034042.9354-11-peterwu.pub@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220905_081757_655576_074E7D63 
X-CRM114-Status: GOOD (  14.26  )
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

On Tue, 30 Aug 2022, ChiaEn Wu wrote:

> From: ChiaEn Wu <chiaen_wu@richtek.com>
> 
> MediaTek MT6370 is a SubPMIC consisting of a single cell battery charger
> with ADC monitoring, RGB LEDs, dual channel flashlight, WLED backlight
> driver, display bias voltage supply, one general purpose LDO, and the
> USB Type-C & PD controller complies with the latest USB Type-C and PD
> standards.
> 
> Add support for the MediaTek MT6370 backlight driver.
> It controls 4 channels of 8 series WLEDs in
> 2048 (only for MT6370/MT6371) / 16384 (only for MT6372)
> current steps (30 mA) in exponential or linear mapping curves.
> 
> Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>
> Signed-off-by: ChiaEn Wu <chiaen_wu@richtek.com>
> ---
> 
> v9
> - Revise the format of the comments.
> ---
>  drivers/video/backlight/Kconfig            |  13 ++
>  drivers/video/backlight/Makefile           |   1 +
>  drivers/video/backlight/mt6370-backlight.c | 351 +++++++++++++++++++++++++++++
>  3 files changed, 365 insertions(+)
>  create mode 100644 drivers/video/backlight/mt6370-backlight.c

Applied, thanks.

-- 
Lee Jones [李琼斯]

