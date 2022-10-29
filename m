Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A57CC433FE
	for <linux-mediatek@archiver.kernel.org>; Sat, 29 Oct 2022 03:45:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gz8chRT8BgwvM1bBz/hqcVOXEH6efHhKugP2b6d/KNA=; b=0KfuN59tHijVBJMZBdQT2LsmcN
	q3Dit1+6R0/48LdnAyDTMTtwryw9acmtqtOxHWnSD7melebRHFECGhAM2DY2cRtT83JaKb9LrEQMx
	6Ztm/+auovLodXC1JZQuHynn+L4kkp6cSNXq+eEe7lz5pyzqrnwczW9tyLei991S1O2IDsVvWR+48
	36pUfkW/AeFGXcS4hVxNPjC50oUACeJkY/NHFQ1YZ9GU8Dv4krQXXrfZOyGZrVDuqT+NdPuTwpNdR
	HxonLB9tLUlZNl5yAqnVfCBS5tKdCjDsIsprFWqwPxJmm+EdAQFfzfPAB8y0xwswp2eQ2BEHw8oEP
	XxHLaYnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oocmB-003k25-ED; Sat, 29 Oct 2022 03:44:51 +0000
Received: from mail-yb1-xb35.google.com ([2607:f8b0:4864:20::b35])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oocm8-003k1S-AY
	for linux-mediatek@lists.infradead.org; Sat, 29 Oct 2022 03:44:49 +0000
Received: by mail-yb1-xb35.google.com with SMTP id t186so8120717yba.12
        for <linux-mediatek@lists.infradead.org>; Fri, 28 Oct 2022 20:44:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=gz8chRT8BgwvM1bBz/hqcVOXEH6efHhKugP2b6d/KNA=;
        b=g6MMhZCmMEfh5a1DNSkgtctHLoc0Zxx78dPchuD8LfuYJuM5a1iKBrVY3MzEJpWdSU
         St2AbaMMDtRXzuN7Q9fGU5SuwvRBV8GtPCtMKFew5Jgeo3SqAp3VI2Uff9lQ4/h7Xgjv
         e87BsOqWIITvxqZrgqybtQZCsPPTDd+GZ/aDgY1yOHLKqOuhxyFLlNxRFYJbUVplgX/b
         Nr1A7IKy/E9utSKzdSQGIo8zwRASo1XvlR14JZTP3iaAwE60u+5pauhotsJQew5rfIhz
         o07M4q7QLt1ZdhZ2j+qK4jcCgzprDxNjmdyBOeBCztLzR3zFNw+3a/w8RQH3ndmDNtaW
         h3rA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gz8chRT8BgwvM1bBz/hqcVOXEH6efHhKugP2b6d/KNA=;
        b=1+vbExUF8JHCy/YHXC013ZScthTSmpKtfir4vbMeO3LBsDO26xFag5iPX3CFD+a3SZ
         HDpmg6AdEbVNMNu79upwYzi0WWzftCoJm/anJVyhPZGL2kG+YReamGi0E2KnlI4Syv7k
         OVPDTt4l2QtAHyPLKbW6DToyXmG+0u5DDW7ztD2xXF7n5S0NgC83gWNiHTW484AcK9+m
         9fwQqraffawWXu0ZAlur5jjXQTxd4XwsL2CUVIx+qbWEJR2R5am4uLSmdZxg+0TNfG1I
         4V6AxXXiJXDCluz99uHuGbRtoYdqvlm8L4nGi4EOKDuL9opvm9nzT3XfHLBn7DrK1nUs
         Vyrg==
X-Gm-Message-State: ACrzQf3JIWubWC4W2R6HqGXibz4ojz9owo1LZ5y1JmDebjtbNioYd9O3
	DSo1dNSE5nnMUbVJHykhJvF+HH9flfXuEz9vptykgQ==
X-Google-Smtp-Source: AMsMyM66Ody47i2fsJ1hG0H/GOy1qXYYvmBtbpesojjIICAXjadL3JpiUK2chgxERuVe2gXSvIE968uC4fCiiR0bu24=
X-Received: by 2002:a25:420e:0:b0:6ca:2d9b:bdcb with SMTP id
 p14-20020a25420e000000b006ca2d9bbdcbmr2339348yba.453.1667015086809; Fri, 28
 Oct 2022 20:44:46 -0700 (PDT)
MIME-Version: 1.0
References: <20221028172215.1471235-1-ajye_huang@compal.corp-partner.google.com>
 <20221028172215.1471235-2-ajye_huang@compal.corp-partner.google.com>
 <628ac98c-0755-e6f6-e010-f1e772c4b71a@linaro.org> <CALprXBY8FUc_w=JO3bp9m1e=1d5Fcvrou_En1JG8Hx0BYuETKw@mail.gmail.com>
 <Y1wi+g9yVR+++iIg@sirena.org.uk>
In-Reply-To: <Y1wi+g9yVR+++iIg@sirena.org.uk>
From: Ajye Huang <ajye_huang@compal.corp-partner.google.com>
Date: Sat, 29 Oct 2022 11:44:41 +0800
Message-ID: <CALprXBZ0qTkd1UoJ-TNEA8Epp5nBJW1KYsBQz_Wtm4YnxewmrA@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] ASoC: mediatek: dt-bindings: modify machine
 bindings for two MICs case
To: Mark Brown <broonie@kernel.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, linux-kernel@vger.kernel.org, 
	Liam Girdwood <lgirdwood@gmail.com>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Rob Herring <robh+dt@kernel.org>, 
	linux-mediatek@lists.infradead.org, "chunxu . li" <chunxu.li@mediatek.com>, 
	Takashi Iwai <tiwai@suse.com>, Jaroslav Kysela <perex@perex.cz>, Jiaxin Yu <jiaxin.yu@mediatek.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	=?UTF-8?B?TsOtY29sYXMgRiAuIFIgLiBBIC4gUHJhZG8=?= <nfraprado@collabora.com>, 
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
	alsa-devel@alsa-project.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221028_204448_424101_7941FCC7 
X-CRM114-Status: GOOD (  10.85  )
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

Hi Mark Brown,

On Sat, Oct 29, 2022 at 2:44 AM Mark Brown <broonie@kernel.org> wrote:
>
> There was my thing about putting the names in DT too.

> @@ -72,6 +76,8 @@ examples:
>          pinctrl-0 = <&aud_clk_mosi_off>;
>          pinctrl-1 = <&aud_clk_mosi_on>;
>
> +        dmic-gpios = <&pio 23 0>;

I think I added the pinctrl-name and pinctrl id in its example, to
make it easier for the user to understand , like below, what do you
think? thanks
examples:
  - |

    sound: mt8186-sound {
        compatible = "mediatek,mt8186-mt6366-rt1019-rt5682s-sound";
        mediatek,platform = <&afe>;
        pinctrl-names = "aud_clk_mosi_off",
                        "aud_clk_mosi_on";
+                       "aud_gpio_dmic_sec";
        pinctrl-0 = <&aud_clk_mosi_off>;
        pinctrl-1 = <&aud_clk_mosi_on>;
+       pinctrl-2 = <&aud_gpio_dmic_sec>;

+       dmic-gpios = <&pio 23 GPIO_ACTIVE_HIGH>;

        headset-codec {
            sound-dai = <&rt5682s>;
        };

        playback-codecs {
             sound-dai = <&it6505dptx>,
                         <&rt1019p>;
        };
    };

