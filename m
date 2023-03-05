Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B7E7C61DA4
	for <linux-mediatek@archiver.kernel.org>; Sun,  5 Mar 2023 10:18:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=h7M8sRm10nGVM8/85XBdBclcWWTWXZlGpoghN1sTLrY=; b=pIsQbXgAlx3Wbxanaf8PZqlMCO
	OKP/Ip980lUG+4ZqUG4okj4GC0EMh5cMyAzE7UcPOu4vUgIUdG1714Rnt31erYg2iIvIebQuFGLOh
	PyjFARWKVdNBKGeT6T0RcTh/oCB1yrBpp1QvHymnp+5l1qZ0790zTfdux7GwEWbMml/+ln8G7td1C
	9KNPX3olubvxQBEYzih08Use12imVRd5VxwdM93onb0g8rK3I6BJ95EQ6L4jiJpvqYfZ/3nVZeTpW
	iXAsdf2L4DFQ97SarWZ70+CJmjB+mGXkZ4sL58qNEREAjq3xXt5aF2FXVuKRQ44JRtPv86DzAdNit
	OW0Nkrbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pYlS3-00A5KC-Sl; Sun, 05 Mar 2023 10:18:47 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pYlRt-00A5Hp-RP; Sun, 05 Mar 2023 10:18:39 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 55560B80A37;
	Sun,  5 Mar 2023 10:18:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1D873C433D2;
	Sun,  5 Mar 2023 10:18:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1678011511;
	bh=BqiMKn3RghRbcr4+/wUZ/+Ee50jKJj55sBSSUqyBSfg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OtThlPKDFnTfNx5xXDxaCUoxkiBM/T7WP33tkYkit2llqBNoPX93N91X8zCR+7Kg2
	 iFXBb/OtAXkXJWncbFAI0A7lWLj4u6fHr08IBd/dinZpPlRIEtp/Q35sW+5JMI9Hmz
	 Q2Xcyar0XSUkp+9gFb9jmlqKeCb0gVFwCy/0QXGOLDDsS2Wr9WhXZHP2w/+2m6azaj
	 CwiGbBXMG+fPk8XEqByRrWYJKoAC2/DYbZ5rIArkYglc6oXTXsTfSZAGEf4+f77mtr
	 X4DDTQj9BhWapPsktMtmyXpm6ZTXHpemaJoTiUtwhFgVMkKpmarqQ3KtRpOsc1t3NE
	 tPwIjFe96wqZg==
Date: Sun, 5 Mar 2023 10:18:24 +0000
From: Lee Jones <lee@kernel.org>
To: ChiaEn Wu <chiaen_wu@richtek.com>
Cc: corbet@lwn.net, pavel@ucw.cz, matthias.bgg@gmail.com,
	andriy.shevchenko@linux.intel.com, jacek.anaszewski@gmail.com,
	angelogioacchino.delregno@collabora.com, linux-doc@vger.kernel.org,
	peterwu.pub@gmail.com, cy_huang@richtek.com,
	linux-leds@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
	szunichen@gmail.com
Subject: Re: [PATCH v17 RESEND 3/3] docs: leds: Add MT6370 RGB LED pattern
 document
Message-ID: <20230305101824.GE2574592@google.com>
References: <cover.1677150607.git.chiaen_wu@richtek.com>
 <c6487954daff5e514023056ad7de1d0ddee674a8.1677150607.git.chiaen_wu@richtek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <c6487954daff5e514023056ad7de1d0ddee674a8.1677150607.git.chiaen_wu@richtek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230305_021838_192078_A418225C 
X-CRM114-Status: GOOD (  22.83  )
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

On Thu, 23 Feb 2023, ChiaEn Wu wrote:

> From: ChiYuan Huang <cy_huang@richtek.com>
> 
> Document the MT6370 RGB LED pattern trigger.
> 
> This simply describe how the pattern works, each timing period, and the
> pattern diagram for MT6370 RGB LED.
> 
> Signed-off-by: ChiYuan Huang <cy_huang@richtek.com>
> Signed-off-by: ChiaEn Wu <chiaen_wu@richtek.com>
> ---
>  Documentation/leds/leds-mt6370-rgb.rst | 64 ++++++++++++++++++++++++++++++++++
>  1 file changed, 64 insertions(+)
>  create mode 100644 Documentation/leds/leds-mt6370-rgb.rst
> 
> diff --git a/Documentation/leds/leds-mt6370-rgb.rst b/Documentation/leds/leds-mt6370-rgb.rst
> new file mode 100644
> index 00000000..d1b2e4f
> --- /dev/null
> +++ b/Documentation/leds/leds-mt6370-rgb.rst
> @@ -0,0 +1,64 @@
> +.. SPDX-License-Identifier: GPL-2.0
> +
> +=========================================
> +Kernel driver for Mediatek MT6370 RGB LED

Are you describing the device or the kernel driver?

> +=========================================
> +
> +Description
> +-----------
> +
> +The MT6370 integrates a four-channel RGB LED driver, designed to provide a
> +variety of lighting effect for mobile device applications. The RGB LED driver

"devices"

> +includes a smart LED string controller and it can drive 3 channels of LEDs with
> +a sink current up to 24mA and a CHG_VIN power good indicator LED with sink
> +current up to 6mA. It provides three operation modes for RGB LEDs:
> +PWM Dimming mode, breath pattern mode, and constant current mode. The device
> +can increase or decrease the brightness of the RGB LED via I2C interface.

"an I2C interface"

> +The breath pattern for a channel can be programmed using the "pattern" trigger,
> +using the hw_pattern attribute.
> +
> +/sys/class/leds/<led>/hw_pattern
> +--------------------------------
> +
> +Specify a hardware breath pattern for a MT6370 RGB LED.
> +
> +The breath pattern is a series of timing pairs, with the hold-time expressed in
> +milliseconds. And the brightness is controlled by
> +'/sys/class/leds/<led>/brightness'. The pattern doesn't include the brightness
> +setting. Hardware pattern only controls the timing for each pattern stage
> +depending on the current brightness setting.
> +
> +Pattern diagram::
> +
> +     "0 Tr1 0 Tr2 0 Tf1 0 Tf2 0 Ton 0 Toff" --> '0' for dummy brightness code
> +
> +      ^
> +      |           ============
> +      |          /            \                                /
> +Icurr |         /              \                              /
> +      |        /                \                            /
> +      |       /                  \                          /   .....repeat
> +      |      /                    \                        /
> +      |   ---                      ---                  ---
> +      |---                            ---            ---
> +      +----------------------------------============------------> Time
> +       < Tr1><Tr2><   Ton    ><Tf1><Tf2 ><  Toff    >< Tr1><Tr2>
> +
> +Timing description::
> +
> +Tr1:    First rising time for duty 0 to 30%.
> +Tr2:    Second rising time for duty 31% to 100%.
> +Ton:    On time for duty 100%.
> +Tf1:    First falling time for duty 100% to 31%.
> +Tf2:    Second falling time for duty 30% to 0%.
> +Toff:   Off time for duty 0%.
> +
> +Tr1/Tr2/Tf1/Tf2/Ton: 125ms to 3125ms, 200ms per step.
> +Toff: 250ms to 6250ms, 400ms per step.
> +
> +Pattern example::
> +
> +       "0 125 0 125 0 125 0 125 0 625 0 1050"
> +
> +This Will configure Tr1/Tr2/Tf1/Tf2 to 125m, Ton to 625ms, and Toff to 1050ms.
> -- 
> 2.7.4
> 

-- 
Lee Jones [李琼斯]

