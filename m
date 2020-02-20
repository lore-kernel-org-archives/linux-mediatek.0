Return-Path: <SRS0=Q2+k=4I=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 71389C11D0B
	for <linux-mediatek@archiver.kernel.org>; Thu, 20 Feb 2020 15:36:02 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3877A208CD
	for <linux-mediatek@archiver.kernel.org>; Thu, 20 Feb 2020 15:36:02 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="icR19xhc";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="ah4g48g+";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="FB6lzG1Q"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3877A208CD
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sMJg+ctuhyb0KJ9vK5p00LLrsW3v9oFnEs8Q9OafZNg=; b=icR19xhcPQ7VqJ
	EB7Py0otP+6vBrFoNTGLVlx/DIcHNwqh+PU5Hg8mvMFAMe4Uc6XQANaNDmcPPGmUQrbtmNfHR0Mzb
	pDhJ32y+f8m/GIJUpO5YfG1Hnd6DYeqoSyYEHW/8GYYzWvLj4meZsaeWJDNA9uEtgJ6R4+RTNZSVc
	Cj9JA3XVfsZxeVJRoTTDZwXDY55QqgvfsfJirrsGEC4d7X3f44jyJ/YK7nRY7x8b178iW+7NApG75
	LulwqxHTUZvpt8RKbUR4+LxBqVB5a57k5commkw8QujFQtBN5hTTYeeY/XP83Z7UGfh+eOKsxIBdn
	H24uwwzNvTEKaDjwsx8w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j4nri-000128-JN; Thu, 20 Feb 2020 15:35:50 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j4nrd-0000w2-2Q
 for linux-mediatek@bombadil.infradead.org; Thu, 20 Feb 2020 15:35:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Type:Cc:To:Subject:Message-ID:
 Date:From:In-Reply-To:References:MIME-Version:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=nyYfAxHT6CRHzAhL+Lfi1DTcyn2H/tLwm1L1QgCaoUc=; b=ah4g48g+tDnKuM7THDmP/W1LFo
 kAaA3msbdDYXUfFOGmyWdlTUeIF68GE9xNhXYNoTWQCkie/jEU3b1nTEyg4O5nuIDgxLiCOq2DaSE
 Li6rqz9RV3WbuUDHqbIJ10ObveBSJEqZl4/+/+5Fracw71SfKdFrF0mCSJt0IijsXTv1VBaJxuioa
 9bbYGVH581GoZ9g6vWx9Wih80uNEocARtShcR3rNizzQRAjgoOF+TkFqUQrx5gCw8qwmCIJaQM+v3
 yvy8+HaoNVTHa0q2k+hI9zDj5cMHWjGNJyre5XPZB15j8662CaxXa/TyHYicbNsv6ULtDaCW+3U8w
 jKQfp6AQ==;
Received: from mail-lj1-x244.google.com ([2a00:1450:4864:20::244])
 by casper.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j4nWx-0005qa-8Q
 for linux-mediatek@lists.infradead.org; Thu, 20 Feb 2020 15:14:26 +0000
Received: by mail-lj1-x244.google.com with SMTP id n18so4590899ljo.7
 for <linux-mediatek@lists.infradead.org>; Thu, 20 Feb 2020 07:14:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=nyYfAxHT6CRHzAhL+Lfi1DTcyn2H/tLwm1L1QgCaoUc=;
 b=FB6lzG1QsIqJHCuslHP3XrKS96DyFbJ/GgtiTNNd+l2lp80jw0+yLLjt0yAnjFUU6/
 8WD/q9sg3t58MaC9meV35lDEcTrOtbdtPD1gGvBOTvftfV6FsjjVwS4RSzkAV6QEiTmI
 VkJrdusURrmMv0GCiczAYp9z8LUIdgMCgb5L33aNByuSoyffErjFIldKL9bea4/kpf8N
 RI/47mpW1GDKEPL7hpCsxbmnKlj2JtpAdfgYY/N13m1vHCq8UlzrBbEpSVbNXnebI2Jk
 7y7BA/Uxnxq6PfuBrRb+x1Z032LUiaaFim9zrrTNbinVCNYATV2YijjptrZYmbGw2eFb
 iKXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=nyYfAxHT6CRHzAhL+Lfi1DTcyn2H/tLwm1L1QgCaoUc=;
 b=SoPmReIfilzlGj+jqsQ8qohGBjbOC5NaMopxsyKmHZgOXUik7qH9cn6fHTEnIXq/iY
 Ja5H2Ka39es1f2ZA0ROifHpFNxzMhSZT1Ru77vDUhn+FnxznaOlK84NkmYLuISH9D+1q
 4FpOZzLeL45+wbjOR9QOwXufw7FNoJ+kiaAQkoxy3XsOlUtgVjluXgTvBra6h28K2hWY
 lj1JGoEQgr7MzToXaF7a+z/dGK58yzy7UGe9NkCm+crLR2BRnCasq4EpJhvMCrfBC43k
 ifr582a7rpkosLTSyoBPAtIPGUVL82k2BLhbzVlv21Yd+PhftSC8KMydhc+xUyqP+Oj4
 c+hQ==
X-Gm-Message-State: APjAAAVP2YunA2cER+3R5EnJolA+/UTw+ybAbeKfRmIWq0UcTGJ/Yr4I
 r5/dpXb45J5sVoZRJn5pGq2LP68ritquad70ymA/Iu3HlEM=
X-Google-Smtp-Source: APXvYqxtKVKfD5MHxlSSaj0Vz28Axw6Zu0+dlk/mKScpMhfCjU4oekoeWPt9CHiwud40m5c1q60F4dL0wXI2I30UJCs=
X-Received: by 2002:a2e:81c3:: with SMTP id s3mr18719210ljg.168.1582211654160; 
 Thu, 20 Feb 2020 07:14:14 -0800 (PST)
MIME-Version: 1.0
References: <20200218023625.14324-1-yuehaibing@huawei.com>
In-Reply-To: <20200218023625.14324-1-yuehaibing@huawei.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 20 Feb 2020 16:14:03 +0100
Message-ID: <CACRpkdbgWj3FtKP2S1BcNDphYRS5G-c6-Ms1HGyrcOox8EFpOA@mail.gmail.com>
Subject: Re: [PATCH -next] pinctrl: mediatek: remove set but not used variable
 'e'
To: YueHaibing <yuehaibing@huawei.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200220_151423_551490_12CD1736 
X-CRM114-Status: UNSURE (   9.98  )
X-CRM114-Notice: Please train this message.
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
Cc: linux-arm-kernel@listd.org, Sean Wang <sean.wang@kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Light Hsieh <light.hsieh@mediatek.com>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Matthias Brugger <matthias.bgg@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Tue, Feb 18, 2020 at 3:36 AM YueHaibing <yuehaibing@huawei.com> wrote:

> drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c: In function mtk_hw_pin_field_lookup:
> drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c:70:39: warning:
>  variable e set but not used [-Wunused-but-set-variable]
>
> Since commit 3de7deefce69 ("pinctrl: mediatek: Check gpio pin
> number and use binary search in mtk_hw_pin_field_lookup()"),
> it is not used any more, so remove it, also remove redundant
> assignment to variable c, it will be assigned a new value later
> before used.
>
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Signed-off-by: YueHaibing <yuehaibing@huawei.com>

Patch applied with Matthias Review tag.

Yours,
Linus Walleij

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
