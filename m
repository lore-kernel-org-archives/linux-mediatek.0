Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E91C5C433FE
	for <linux-mediatek@archiver.kernel.org>; Wed, 20 Apr 2022 22:50:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8UixUM0UCOB2mBmSGSM5RF2l5IDy5ARhMLj9EOT6XjI=; b=BxHUuz/gP9vMiq
	f5XNBFXvgVX4589pgQ8XK2x56HWc4oWOuoINsdXXGv2Cu7BzZEmCtnM7BUBmWPKpAZZcunGNRmpQi
	Ne/IhlSnb3GQ/vdEewTQ7mI7zjl9R2ebEjQp0thAHquOJnsFlDqJlnetY/V6ykMFnnJ80LkUA4fO3
	kwye6wpe04pwUNAXJxwgDb2D1GCvXOjD4SKK8twLBRHP0+Xla/ZlxoDw98F0rFPT2qbg+20/SWGXr
	ncB/N2ENZc51D6gaJBmS91aI16qerXfORxJzsjyXDNZZOzELqAa749ZPlDTl5LGjJhMu9rIVvH2Gf
	dmKcc6jBEga0vG8AYXrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nhJ9l-00Amjd-6Q; Wed, 20 Apr 2022 22:50:41 +0000
Received: from mail-yb1-xb2a.google.com ([2607:f8b0:4864:20::b2a])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nhJ9Z-00AmfZ-M2
 for linux-mediatek@lists.infradead.org; Wed, 20 Apr 2022 22:50:31 +0000
Received: by mail-yb1-xb2a.google.com with SMTP id w133so2876849ybe.5
 for <linux-mediatek@lists.infradead.org>; Wed, 20 Apr 2022 15:50:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=X8s23fLxLi04YEMH4bxBt9AiWpQLyo5GBs2JMum7Vug=;
 b=zUWotnmPLjRieffw34mfhGBLWp6ZmSUK+lMvEh3AAjgoh6G3ietR/j1OUgrrTOk3fB
 oxpLx6YA4m081foKHie5D4iyQqQ0txptgUsovgj4EMtYFuFInJgB19IZRwSVWTAD6R3d
 YPT6DxRtEmWmBD4PqAtWos7uyMz+C6yK9ch3hfoZnPKNif25y+eQhKjszEDXH7B86C5e
 b/AC31Koeyh2SS/8ckGayCEl81M2RkVnMk2kVxqCrfwtExeozqtEen57SpjU+AkIHAAe
 wfpjnftV8FkzqegVexZOxE+fdo/idu+r9ekhIQbruFtIrDyZCsTRd5PAikXzLAhdoCyw
 pHQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=X8s23fLxLi04YEMH4bxBt9AiWpQLyo5GBs2JMum7Vug=;
 b=gZ4K9usSyIgu7/c4pDT8y60a2vXJE3T08MGqbscHE/plJqciWwu8lEFiUReuZEaq9l
 uYkwcoRz/ZFvzvdNCa3l1zMLlFF1YvlNGCsD5tC+1TAlprH/cMC5daqrEV7YP0wvaI2n
 zf6QA4fScYJaTfd6KFtgQBdZr9HOJozOi/hY8PvGGpVP/VaxedWlf2KQXT9O5HGHpoc2
 LlQs5i1nwEKUWM9zm/i0BrcSdvSUHbQ6CXy23sfnvQS+ajfSblZmYkkp4TxCNCYyeoIV
 sm/Pzqlke1rGXZzOF+XsTrQImtpLhSt+I64qQulSLw9MRfw7mqO5jwZAECPclK9OFsMU
 bBZg==
X-Gm-Message-State: AOAM5314ujMfQxD0dKREtELRdkoWaBEYxRIDvSJ7sieTGJAojaobiGZZ
 P4olz2Xn5E5J55K8/t7NwIvdxMdg8tl1DOLv0JBZPw==
X-Google-Smtp-Source: ABdhPJxG7ifSltsyteZyw+NK8chpzsnfyLwzIcd9/d+dlKaytJ2om9/FWed2AjIrfeGR1DUKfQzCg2kJm8PBQdunyzc=
X-Received: by 2002:a25:e6d5:0:b0:645:7257:8271 with SMTP id
 d204-20020a25e6d5000000b0064572578271mr1390597ybh.291.1650495026644; Wed, 20
 Apr 2022 15:50:26 -0700 (PDT)
MIME-Version: 1.0
References: <20220409105958.37412-1-yuehaibing@huawei.com>
In-Reply-To: <20220409105958.37412-1-yuehaibing@huawei.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 21 Apr 2022 00:50:15 +0200
Message-ID: <CACRpkdYVHPA7GyjyeOU_Q78dZR_VD1-=6pVX74j5FKee7cKpGQ@mail.gmail.com>
Subject: Re: [PATCH -next] pinctrl: mediatek: moore: Fix build error
To: YueHaibing <yuehaibing@huawei.com>
Cc: sean.wang@kernel.org, matthias.bgg@gmail.com, light.hsieh@mediatek.com, 
 linux-mediatek@lists.infradead.org, linux-gpio@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220420_155029_764493_757D9095 
X-CRM114-Status: UNSURE (   8.23  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Sat, Apr 9, 2022 at 1:00 PM YueHaibing <yuehaibing@huawei.com> wrote:

> If EINT_MTK is m and PINCTRL_MTK_V2 is y, build fails:
>
> drivers/pinctrl/mediatek/pinctrl-moore.o: In function `mtk_gpio_set_config':
> pinctrl-moore.c:(.text+0xa6c): undefined reference to `mtk_eint_set_debounce'
> drivers/pinctrl/mediatek/pinctrl-moore.o: In function `mtk_gpio_to_irq':
> pinctrl-moore.c:(.text+0xacc): undefined reference to `mtk_eint_find_irq'
>
> Select EINT_MTK for PINCTRL_MTK_V2 to fix this.
>
> Fixes: 8174a8512e3e ("pinctrl: mediatek: make MediaTek pinctrl v2 driver ready for buidling loadable module")
> Signed-off-by: YueHaibing <yuehaibing@huawei.com>

Good catch! Patch applied for fixes.

Yours,
Linus Walleij

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
