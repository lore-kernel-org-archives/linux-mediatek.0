Return-Path: <SRS0=oKwZ=FU=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9ED3FC4361B
	for <linux-mediatek@archiver.kernel.org>; Wed, 16 Dec 2020 10:10:26 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 150172313C
	for <linux-mediatek@archiver.kernel.org>; Wed, 16 Dec 2020 10:10:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 150172313C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=pH4JdHcPuC/mVWaw7UjjImTt5ouD7KAsmUSn9cgoh3U=; b=RvPYWK3VHgLCRRcmPrGiTWOql
	hWn4AuZubDsURW4GefpZ/BfwFWAz9/ly/xYN5sgCpGVTQibrFL6dFMFqtpujNNj9dPuMHR2tRrnn9
	JB9RRgp9CQe6HQ/fQlOSy7R1WPKvdYKvtgd/K1dEocfI2yEOtCO4d+Lo6JzIGOxEXdmpSg5bbi1y7
	gdWUfEL5arNNfRNFl0Pd5eacedoCW5FhHq4AH1jTI3aFzy1TqEUwaf66AEjdVaQr+x4ZfLqEiuYea
	moYbhnyrB3OP7kt0iesSPXem+IDxwj97Dp/1pL3QPqXxKu2KBFD9nqYse8GXT5b9cEogivBBWBYwa
	ZYjW53VMQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kpTl8-0005tR-E7; Wed, 16 Dec 2020 10:10:14 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kpTl5-0005s8-0T
 for linux-mediatek@lists.infradead.org; Wed, 16 Dec 2020 10:10:12 +0000
Received: from [IPv6:2a00:5f00:102:0:b08e:75ff:fe3e:2a49] (unknown
 [IPv6:2a00:5f00:102:0:b08e:75ff:fe3e:2a49])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: gtucker)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 5F6C51F448B1;
 Wed, 16 Dec 2020 10:10:07 +0000 (GMT)
Subject: Re: linusw/devel bisection:
 baseline.bootrr.mediatek-mt8173-pinctrl-probed on mt8173-elm-hana
To: Linus Walleij <linus.walleij@linaro.org>
References: <5fd76cf2.1c69fb81.6f19b.b16a@mx.google.com>
 <483b08f2-09c3-e753-d2ce-4e34fee627f3@collabora.com>
 <CACRpkdbozXM3FHQB9+GcPJZdNT+Vi1223m2uEqqJ21ukY1A4Gw@mail.gmail.com>
From: Guillaume Tucker <guillaume.tucker@collabora.com>
Message-ID: <8e5e0251-9450-5c93-cd2e-c44779a72b0c@collabora.com>
Date: Wed, 16 Dec 2020 10:10:04 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.2
MIME-Version: 1.0
In-Reply-To: <CACRpkdbozXM3FHQB9+GcPJZdNT+Vi1223m2uEqqJ21ukY1A4Gw@mail.gmail.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201216_051011_162336_24424F0C 
X-CRM114-Status: GOOD (  15.64  )
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
 Geert Uytterhoeven <geert+renesas@glider.be>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 Sean Wang <sean.wang@kernel.org>, Johan Hovold <johan@kernel.org>,
 open list <linux-kernel@vger.kernel.org>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 Collabora Kernel ML <kernel@collabora.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On 15/12/2020 12:20, Linus Walleij wrote:
> On Mon, Dec 14, 2020 at 11:28 PM Guillaume Tucker
> <guillaume.tucker@collabora.com> wrote:
> 
>> Please see the bisection report below about the pinctrl driver
>> failing to probe on the arm64 mt8173-elm-hana platform.
> 
> That's an excellent, helpful report which helps a lot!
> Thank you for doing this!

Thanks for the feedback!  Glad this helped.

>> This is the error message:
>>
>> [    0.051788] gpio gpiochip0: Detected name collision for GPIO name ''
>> [    0.051813] gpio gpiochip0: GPIO name collision on the same chip, this is not allowed, fix all lines on the chip to have unique names
>> [    0.051832] gpiochip_add_data_with_key: GPIOs 377..511 (1000b000.pinctrl) failed to register, -17
>> [    0.051946] mediatek-mt8173-pinctrl: probe of 1000b000.pinctrl failed with error -22
> 
> It seems we need to teach the core to ignore the name (empty string).

OK great, I see you've sent a patch for that.  I'll check if we
can confirm it fixes the issue (something I'd like to also
automate...).

Best wishes,
Guillaume

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
