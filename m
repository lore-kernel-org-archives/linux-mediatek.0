Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0649C43334
	for <linux-mediatek@archiver.kernel.org>; Fri, 24 Jun 2022 06:24:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1pWYuiEty7n8qfKXbe+MlxripfjF42zMy4YaNonGDYE=; b=H6ZzHgRuzdQGpEWscftBSE2R5b
	tTGnTEymeOzjuv0iPr+tas1UMT/k1Vg0UUwyLjhap8F7UpvDRrnjqvy2q7O7qvMPk9qxcef9kFqTQ
	Cqmt8nwWvKQO7spqSiHssewL4D6k3Tl6BRDP6YoxHn8lcIwmyHMncJ8ROg+8KLSGtaMBjk8v2Yc60
	LJKhkLGrGq1TayTv4NqQyfMmW+4x3d+9huuxfZ9fwOue+XxQcH4u4BCNlX6X2tJn+Awf+y3SX1GGW
	P7JA4ECK0d0PnFlPiBvePmoJghfhEyxLlHRrjU2IF0IBkvuLH12PmRJLwrCvgM3dNtMDMc07tpTlf
	BmyTtPWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o4cjX-000pgC-Nz; Fri, 24 Jun 2022 06:23:59 +0000
Received: from mail-yw1-x1134.google.com ([2607:f8b0:4864:20::1134])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o4cjL-000pce-H7
	for linux-mediatek@lists.infradead.org; Fri, 24 Jun 2022 06:23:49 +0000
Received: by mail-yw1-x1134.google.com with SMTP id 00721157ae682-317a66d62dfso15234847b3.7
        for <linux-mediatek@lists.infradead.org>; Thu, 23 Jun 2022 23:23:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=1pWYuiEty7n8qfKXbe+MlxripfjF42zMy4YaNonGDYE=;
        b=LWlf67Kpn5DO70LzfZDzY/86k3RghUlz3LHvmFCRfp9vgWrB54PqfNu2vRF/Bdm7wc
         ap99VK+4MQUQ+6cin3CVK00IbKjFwKj9hJY00FJWKZ+T6+Tsx1JzMXtnbwqHGT3mulUt
         H0L5JKLz7ywUjS16o9iBqqT0TcachObVtQ0ucF3TSwp90e9HmJH9RNV0ZQ6J68d/kYAX
         nEwFuUDUzDBezOwyq+6kVSYL3YCsnU3Px78klL9yrKaUWJlgIKUKeZJtWjG29iFkSFiR
         pek0U91njY9MeCQ1UyKutB0l8JPIg8lysMDZ0xBMr3cTNS7GpTVSDFQe1FKYX2yHrOFZ
         WIvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=1pWYuiEty7n8qfKXbe+MlxripfjF42zMy4YaNonGDYE=;
        b=M9Qw8kQ8GECwJ6YuFJCntiA2z5pyu9NKG1rmmyq4nXxoCwtDu8Oz7GuHRVLbSQfH8b
         3mTFI31pnMMUatBBN/gv4XZx7zD0PdmHnIZ6LR2HDsNADMjN692humHwYoMLmyf8b6hB
         EVL3+5UhdC0lQu9C9TAFGfwzpoz1QilT4UOTeY+1J3kAjxhOYXIXtxilvHYTsi2Ebr8d
         gpD8AWfdZOn74HyBAHfSTOs9XQ78+LSPpLqXC953eEh891LqlsqNLV6qeHJMzzuku4l2
         D3u0/oz8Y1xr+dS83NZetCbjB8OO5Yz316+71OWYmrenUWlbXFEN0o4B1Ht/RhBgsNQl
         ZVZQ==
X-Gm-Message-State: AJIora+cndac0buc9swS6jTAO4c9URsELFtM/w3MECxHiMH40Nhe1o4X
	LJczbEANWi88EbBr4pqCoje8bXGefHk4bmZZgy6Vmg==
X-Google-Smtp-Source: AGRyM1ugT6Af5nX5Ixp3Ow5c+O9Je/TdD9Y/945uEnJCiYAwQr3zWQy2YOg5odN0QU1EceYIiYefh3gmTCwAPJv1mBE=
X-Received: by 2002:a81:6587:0:b0:318:38c2:2fb1 with SMTP id
 z129-20020a816587000000b0031838c22fb1mr14986240ywb.118.1656051817552; Thu, 23
 Jun 2022 23:23:37 -0700 (PDT)
MIME-Version: 1.0
References: <20220623115631.22209-1-peterwu.pub@gmail.com> <20220623115631.22209-13-peterwu.pub@gmail.com>
In-Reply-To: <20220623115631.22209-13-peterwu.pub@gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 24 Jun 2022 08:23:26 +0200
Message-ID: <CACRpkdZatfOFmeGXepTrjAk1or4W6KNUEaXnP+srRebfM=52AA@mail.gmail.com>
Subject: Re: [PATCH v3 12/14] leds: mt6370: Add Mediatek MT6370 current sink
 type LED Indicator support
To: ChiaEn Wu <peterwu.pub@gmail.com>
Cc: lee.jones@linaro.org, daniel.thompson@linaro.org, jingoohan1@gmail.com, 
	pavel@ucw.cz, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, 
	matthias.bgg@gmail.com, sre@kernel.org, chunfeng.yun@mediatek.com, 
	gregkh@linuxfoundation.org, jic23@kernel.org, lars@metafoo.de, 
	lgirdwood@gmail.com, broonie@kernel.org, linux@roeck-us.net, 
	heikki.krogerus@linux.intel.com, deller@gmx.de, devicetree@vger.kernel.org, 
	linux-fbdev@vger.kernel.org, szunichen@gmail.com, alice_chen@richtek.com, 
	linux-pm@vger.kernel.org, linux-iio@vger.kernel.org, 
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, cy_huang@richtek.com, chiaen_wu@richtek.com, 
	linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-leds@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220623_232347_617135_577B24FD 
X-CRM114-Status: UNSURE (   7.52  )
X-CRM114-Notice: Please train this message.
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

Hi ChiaEn!

Thanks for your patch!

On Thu, Jun 23, 2022 at 1:58 PM ChiaEn Wu <peterwu.pub@gmail.com> wrote:

> From: ChiYuan Huang <cy_huang@richtek.com>
>
> Add Mediatek MT6370 current sink type LED Indicator driver.
>
> Signed-off-by: ChiYuan Huang <cy_huang@richtek.com>
(...)
>  drivers/leds/Kconfig       |  11 +
>  drivers/leds/Makefile      |   1 +
>  drivers/leds/leds-mt6370.c | 989 +++++++++++++++++++++++++++++++++++++++++++++

There is a drivers/leds/flash subdirectory these days, put the driver
in that directory instead.

Yours,
Linus Walleij

