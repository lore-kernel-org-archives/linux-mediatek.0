Return-Path: <SRS0=w4bH=ZF=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5395AC43331
	for <linux-mediatek@archiver.kernel.org>; Wed, 13 Nov 2019 09:40:36 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2568E2196E
	for <linux-mediatek@archiver.kernel.org>; Wed, 13 Nov 2019 09:40:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="XHGDVZqG";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="a676ZUZ7"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2568E2196E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=amK8ahizsJD9l4+znWuqiOOV9AS8MN8Vdu8w8KdXQRA=; b=XHGDVZqGcSYifi
	q3OhgfD1kZe8DMcrHIVGxKzNSXiB/Yfg/sENWs7KVVEcfOimMpbsH2hft0WZdp9wSQURFl8/PQDA7
	+z9FvREJLDGX1+V0Qwux3epADIubOqfRm00wjT5TVPh8kgdhY/4MDn9gaHXcHOWNTEn8VL5C8+GTM
	eNCmBCPGLRCMfKzeavT3Zr01gYFC4bJ9eeOnZcZ4aNNVPUly7rWeP53SQsubllQ3Iut8G2aKYiCoA
	sEpVuev4hH9kDkh7PawTsuZCP5kyoJRh81GcPNPw8stGUbRhb4Wdvp/W+15B1ifjinmoznA3xYd5n
	AJ7XMKP0CEo/ZnvKrthg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iUp8d-0007LD-Ca; Wed, 13 Nov 2019 09:40:35 +0000
Received: from mail-lj1-x244.google.com ([2a00:1450:4864:20::244])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iUp8b-0007KA-FL
 for linux-mediatek@lists.infradead.org; Wed, 13 Nov 2019 09:40:34 +0000
Received: by mail-lj1-x244.google.com with SMTP id y23so1756595ljh.10
 for <linux-mediatek@lists.infradead.org>; Wed, 13 Nov 2019 01:40:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=OrN8x9LyxKD7Xl1d/h9oz7KZmMmc0A5znbrf73E9+bA=;
 b=a676ZUZ7j8Q/YVK0Bi4A2cENhUW9DTDHjr8EReuSTbfFGUvF8kqNCs8Bo51EzHCTfr
 +kz0MvywQjdwCzed5RVZ/ltsXL1ng8RXtD1/6GPl8H7lg6uitxQgbRh7337hfbTPpxi7
 c0MPzJXnqSmZh5BK1mNl7g00o+3ot7uwReiUDx8mf+Xz1Qmy/8XCuM5WWG4bdkpxJ5O9
 LYO93Tg8FD4Z9PTaV5yL+ij91p4VjwPnYIyaurBh2OCqLjLQFUa58DJr7ylP/keLOwt9
 NA1P+BqzIB/OLwx5vA0TxDOn2k4Vuj1byrU1h72J11w+AOeOqJ3Z0rsAXcI5encccpgy
 Splg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=OrN8x9LyxKD7Xl1d/h9oz7KZmMmc0A5znbrf73E9+bA=;
 b=XJ03KV90SBLec8wfhmGVlLrNtmjluxjbVGUEv771+vJFqlqyd6K0YmnB8wVWzV0HAJ
 +3W/AOzwlcDjZ1+gxybKyX+KgLfbKCyG9tXJhG1xmMs5rbpODiouB0PGu3rSl1PmdZ8j
 SDyxBPfzvEgRbmVum8D4grz6D4ZuSZ8KlKP8aAs5Syc5o4mH7hyebmHZu/DIcfa9y0dP
 8aN/nfIhAjGzk9ekcBGwQFAPcmsbhgkQjtC2ouJ53y1z1CV1sbfZ33BDVgIyNnqPXYk3
 d6u1kRD5C2AEoeCcujDKEab+a+UEhnTyyLWb1lagueCp6FELttAEMpqyj04tMDmWxg1K
 tmBA==
X-Gm-Message-State: APjAAAUPfunx8nWtI4QGTc2kNrxPUZC4HSYZM81KWQdrpJdTbTAX0fnf
 k7v6CIlfm69yg5qEXyl9eDIAfweHO4jA9iLq97ESrw==
X-Google-Smtp-Source: APXvYqyOFp98GI7jY2XSDtkSfkrTqobC6IABhD/Iv9amdhinzj3w5mpyUY8ScymlvcvvrEEwwPsb6sgbGb33/qncEqU=
X-Received: by 2002:a2e:5c46:: with SMTP id q67mr1815120ljb.42.1573638029531; 
 Wed, 13 Nov 2019 01:40:29 -0800 (PST)
MIME-Version: 1.0
References: <20191112141819.GA22076@localhost.localdomain>
 <201911131438.KT6pnFZ7%lkp@intel.com>
 <ac16492e11899ef4ec981f7f2e84714c7d61d2a7.camel@fi.rohmeurope.com>
In-Reply-To: <ac16492e11899ef4ec981f7f2e84714c7d61d2a7.camel@fi.rohmeurope.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 13 Nov 2019 10:40:17 +0100
Message-ID: <CACRpkdYAmye8wT39fqy=LN+6pXDvrcQ0SyDTCvG7aSgea3Uumw@mail.gmail.com>
Subject: Re: [PATCH 2/2] pinctrl: Use new GPIO_LINE_DIRECTION
To: "Vaittinen, Matti" <Matti.Vaittinen@fi.rohmeurope.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191113_014033_530157_F86ED137 
X-CRM114-Status: GOOD (  12.06  )
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
Cc: "andrew@lunn.ch" <andrew@lunn.ch>,
 "alexandre.belloni@bootlin.com" <alexandre.belloni@bootlin.com>,
 "heiko@sntech.de" <heiko@sntech.de>,
 "geert+renesas@glider.be" <geert+renesas@glider.be>,
 "narmstrong@baylibre.com" <narmstrong@baylibre.com>,
 "patrice.chotard@st.com" <patrice.chotard@st.com>,
 "paul@crapouillou.net" <paul@crapouillou.net>,
 "eric@anholt.net" <eric@anholt.net>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>,
 "jason@lakedaemon.net" <jason@lakedaemon.net>,
 "f.fainelli@gmail.com" <f.fainelli@gmail.com>, "lkp@intel.com" <lkp@intel.com>,
 "gregory.clement@bootlin.com" <gregory.clement@bootlin.com>,
 "ludovic.desroches@microchip.com" <ludovic.desroches@microchip.com>,
 "linux-rockchip@lists.infradead.org" <linux-rockchip@lists.infradead.org>,
 "wens@csie.org" <wens@csie.org>, "agross@kernel.org" <agross@kernel.org>,
 "bcm-kernel-feedback-list@broadcom.com"
 <bcm-kernel-feedback-list@broadcom.com>,
 "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
 "sebastian.hesselbarth@gmail.com" <sebastian.hesselbarth@gmail.com>,
 "alexandre.torgue@st.com" <alexandre.torgue@st.com>,
 "mazziesaccount@gmail.com" <mazziesaccount@gmail.com>,
 "rjui@broadcom.com" <rjui@broadcom.com>,
 "nicolas.ferre@microchip.com" <nicolas.ferre@microchip.com>,
 "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "linux-rpi-kernel@lists.infradead.org" <linux-rpi-kernel@lists.infradead.org>,
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
 "bjorn.andersson@linaro.org" <bjorn.andersson@linaro.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "kbuild-all@lists.01.org" <kbuild-all@lists.01.org>,
 "sbranden@broadcom.com" <sbranden@broadcom.com>,
 "sean.wang@kernel.org" <sean.wang@kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
 "wahrenst@gmx.net" <wahrenst@gmx.net>,
 "mcoquelin.stm32@gmail.com" <mcoquelin.stm32@gmail.com>,
 "linux-oxnas@groups.io" <linux-oxnas@groups.io>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Wed, Nov 13, 2019 at 7:52 AM Vaittinen, Matti
<Matti.Vaittinen@fi.rohmeurope.com> wrote:
> On Wed, 2019-11-13 at 14:30 +0800, kbuild test robot wrote:
> > Hi Matti,
> >
> > Thank you for the patch! Perhaps something to improve:
> >
> > [auto build test WARNING on 70d97e099bb426ecb3ad4bf31e88dbf2ef4b2e4c]
> >
>
> >    480        static int wmt_gpio_get_direction(struct gpio_chip
> > *chip, unsigned offset)
> >    481        {
> >    482                struct wmt_pinctrl_data *data =
> > gpiochip_get_data(chip);
> >    483                u32 bank = WMT_BANK_FROM_PIN(offset);
> >    484                u32 bit = WMT_BIT_FROM_PIN(offset);
> >    485                u32 reg_dir = data->banks[bank].reg_dir;
> >    486                u32 val;
> >    487
> >    488                val = readl_relaxed(data->base + reg_dir);
> >    489                if (val & BIT(bit))
> >  > 490                        GPIO_LINE_DIRECTION_OUT;
>
> Right. Return is missing. I think I already fixed this - I guess I sent
> wrong version... Sorry guys. I'll do v3 with only this return added -
> and I'll send it to limited amount of recipients as I think most of you
> guys may not be interested. Probably to Linus W, Geert and GPIO list
> only. Let me know if you want to see the v3 (or other subsequent
> patches)

I think I already merged it, just send a new patch on top fixing the
problem.

Yours,
Linus Walleij

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
