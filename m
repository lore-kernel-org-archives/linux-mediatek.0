Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D853FC44501
	for <linux-mediatek@archiver.kernel.org>; Wed, 15 Jul 2026 12:15:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:To:
	Subject:Message-ID:Date:References:MIME-Version:In-Reply-To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RKDnp51m/COvv5+IfZcdloAqKtTMb40rJD0x+eX0ID8=; b=mEk4ytFhIuO1eOghXyYev0L6GM
	NLCyzexPM0rpjr6j+zttQGjY6OrIiUp0bOm4UQKYuTP8lMJakIKWaHCo1CLFvllBdjKgf8rMGzA4L
	ygWG8QaauLpZ/NMi9lalWdW1MVmnDrWkbRjd5sYhoSuU4eRgft/XI2Ig9WytnffjNEL+6RRBM1CAl
	pibyblFkKlPDSKNzZkDHcj9st9NZWZocwXNg9wl5F0JpE01JqYQWL6rTpiVIvlzwHQ1BzKE1ci4Yr
	PRTmt6B6SYL05Lpi7Jds9m/vsEyCAMh8IY+HDwdfrwkOJwhiqbTFrNztI91Dej9J95q9lhUyEtVhQ
	0AYkxKiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjyWl-0000000EkKz-3IwD;
	Wed, 15 Jul 2026 12:15:51 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjyWk-0000000EkKF-1VZS
	for linux-mediatek@lists.infradead.org;
	Wed, 15 Jul 2026 12:15:50 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 949E7601ED
	for <linux-mediatek@lists.infradead.org>; Wed, 15 Jul 2026 12:15:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 485CD1F00ACF
	for <linux-mediatek@lists.infradead.org>; Wed, 15 Jul 2026 12:15:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784117749;
	bh=RKDnp51m/COvv5+IfZcdloAqKtTMb40rJD0x+eX0ID8=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=obLTZAJfx4lImVTbXUB5pPXY26He5+Fc1vqFYT60SkAVloafptn6VGq/0NyAgC6I8
	 eOo5R4kqG7/jnfzjCv4J+M4pPR9Hm/iyx+axJVj8fnvaJhXzVc1i+zwlDm7j8Y4uKB
	 e841oUHJKarxoxWGINalhaLxsm9umQTT8+oVdOvdXDoNfYk7VYOIIZDgd+mfGpRdWr
	 APscYwaJNokzpfOkJ51g0CFlnwXS89SZjGbTsS9R5VTucmL43q0p9NiJKE5srZMFxj
	 Ni4sXGb/jLcWnswih2SsGxRi/QUF14zMvhcoFyVxKtB/S2nCyC7zLGsjoWhNc/m/eH
	 LscLf7fHjPVWg==
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-5b0117d49dcso5049585e87.3
        for <linux-mediatek@lists.infradead.org>; Wed, 15 Jul 2026 05:15:49 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RqLO57ySOivojaZXcxXtHjm0RLl8FjRU+6h/4eh8U5tu7/koAvurK06H52JYImmsmC2YyiCjuW5pQiAI3sivA==@lists.infradead.org
X-Gm-Message-State: AOJu0YyL0xXq3s41GkHjX504T5i0jo43L1okWsBOk1A6lQaBo+H35dRX
	76lzYqmVp95DwmxqCcQZV0TolsDPVWXyA90DkEcwXY5CQP5u/QGoocf7tMqcxguF19gWp+l+vuv
	K+bQNeCiiJilr82x4z8hxEoHJJoMcfWechNbofnoYcA==
X-Received: by 2002:a05:6512:668c:20b0:5b0:1aa5:b869 with SMTP id
 2adb3069b0e04-5b159b6bd5bmr813218e87.25.1784117747953; Wed, 15 Jul 2026
 05:15:47 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 15 Jul 2026 05:15:46 -0700
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 15 Jul 2026 05:15:46 -0700
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <alX3PLGgoKTgSy_-@ashevche-desk.local>
MIME-Version: 1.0
References: <4c67cf0839ccf57db35a826df6d8fc779531509a.1783974733.git.daniel@makrotopia.org>
 <alX3PLGgoKTgSy_-@ashevche-desk.local>
Date: Wed, 15 Jul 2026 05:15:46 -0700
X-Gmail-Original-Message-ID: <CAMRc=MddZtuuZ-dOaCui8ngO4hnZzNZrPj+1Hutoecit9WdCmg@mail.gmail.com>
X-Gm-Features: AUfX_myIhBXpXPOWc6e4XKEkjqdGIsljv9t_WEO6AKgHBeBaw-_g1hKvslbVK7M
Message-ID: <CAMRc=MddZtuuZ-dOaCui8ngO4hnZzNZrPj+1Hutoecit9WdCmg@mail.gmail.com>
Subject: Re: [PATCH] gpiolib: tolerate gpio-hogs lacking a hogging state
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Daniel Golle <daniel@makrotopia.org>
Content-Type: text/plain; charset="UTF-8"
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
Cc: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>, Mika Westerberg <mika.westerberg@linux.intel.com>, linux-arm-kernel@lists.infradead.org, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Tue, 14 Jul 2026 10:45:48 +0200, Andy Shevchenko
<andriy.shevchenko@linux.intel.com> said:
> On Tue, Jul 14, 2026 at 12:30:53AM +0100, Daniel Golle wrote:
>> Commit d1d564ec4992 ("gpio: move hogs into GPIO core") made
>> gpiochip_add_hog() return -EINVAL for hog nodes lacking any of the
>> 'input', 'output-low' or 'output-high' properties. The error is
>> propagated by gpiochip_hog_lines() and fails registration of the
>> whole GPIO chip.
>>
>> The previous OF-specific implementation tolerated such nodes:
>> of_parse_own_gpio() warned "no hogging state specified, bailing out"
>> and of_gpiochip_add_hog() stopped processing the node without failing
>> chip registration.
>>
>> Some boards deliberately ship hog nodes without a hogging state in
>> their base devicetree and supply the state via overlay, e.g. the PCIe
>> slot key selection hogs on the BananaPi R4 Pro added in
>> commit e309fa232d12 ("arm64: dts: mediatek: mt7988a-bpi-r4pro: rework
>> pcie gpio-hog handling"), as the polarity set in the base devicetree
>> could not be overridden from an overlay.
>>
>> Booting such a board without an overlay applied now fails to register
>> the gpiochip. On the BananaPi R4 Pro this means the MT7988A pinctrl
>> device fails to probe, all peripherals including the console UART
>> defer forever, and the board finally hangs when clk_disable_unused()
>> gates the clocks of the UART still in use by earlycon:
>>
>>   gpiochip_add_data_with_key: GPIOs 512..595 (pinctrl_moore) failed to register, -22
>>   mt7988-pinctrl 1001f000.pinctrl: error -EINVAL: Failed to add gpio_chip
>>   ...
>>   clk: Disabling unused clocks
>>   (hangs)
>>
>> Restore the previous behaviour by warning about hog nodes lacking a
>> hogging state and skipping them instead of failing the registration
>> of the whole GPIO chip.
>
> Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
>
> ...
>
>> -	if (fwnode_property_present(fwnode, "input"))
>> +	if (fwnode_property_present(fwnode, "input")) {
>>  		dflags |= GPIOD_IN;
>> -	else if (fwnode_property_present(fwnode, "output-low"))
>> +	} else if (fwnode_property_present(fwnode, "output-low")) {
>>  		dflags |= GPIOD_OUT_LOW;
>> -	else if (fwnode_property_present(fwnode, "output-high"))
>> +	} else if (fwnode_property_present(fwnode, "output-high")) {
>>  		dflags |= GPIOD_OUT_HIGH;
>
> For a fix I would make it less invasive and yes, break the style, by just
> replacing
>

Nah, this is fine as is, let me queue this and sorry for the trouble, thanks
for spotting and fixing it!

Bart

