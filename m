Return-Path: <SRS0=cyKo=BC=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0C511C433E8
	for <linux-mediatek@archiver.kernel.org>; Thu, 23 Jul 2020 08:48:58 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CED482080D
	for <linux-mediatek@archiver.kernel.org>; Thu, 23 Jul 2020 08:48:57 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="bInvdLMj"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CED482080D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arndb.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=KUnGV9XUoX3ggKLs1vGwFdrCplzlbyAdc/4f5BW5kyc=; b=bInvdLMjMZBe8vnM0/axnkuqP
	37Facf4Bb65AUkYYnivFOV3GfOmcKq21tM/4fZeYw1bpBP/pW/1soGLEQ105a/GtCqr8vt92+YJhf
	ZxA5Q9rUOOx8jPA2j8OqOGJ7EAOOYjlBrgVVAj6+upa4zT5wyKKv5Gr/jyt62TzatCfJBUVdwGmyX
	W64MeYDkwbS+id6K5N+p8pb9dV98aUZ7sxiSaco1IYDAamkPyjCBa/4yPsdXttg3Chx7wgl5YCzTr
	BKql7EPSZs2mzLcPiR0e/hLx/aUEp1l3QFQlhbEjm3qB2qenK4kcxVLLlCNoxWJ21XKiXq0wu6MzX
	yf0uPOhTg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jyWuC-00070T-PA; Thu, 23 Jul 2020 08:48:44 +0000
Received: from mout.kundenserver.de ([212.227.17.13])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jyWuA-0006yi-L8; Thu, 23 Jul 2020 08:48:43 +0000
Received: from mail-qt1-f175.google.com ([209.85.160.175]) by
 mrelayeu.kundenserver.de (mreue109 [212.227.15.145]) with ESMTPSA (Nemesis)
 id 1MXp1O-1kJOji2LoS-00YBmC; Thu, 23 Jul 2020 10:48:38 +0200
Received: by mail-qt1-f175.google.com with SMTP id o22so3600581qtt.13;
 Thu, 23 Jul 2020 01:48:36 -0700 (PDT)
X-Gm-Message-State: AOAM532DhtmyuhNp7ZYPkdwzQawE8NVDL9K9taVa1o5rWbctnX+liy+9
 wld5Nz+pDYJTnqwjewVvkLuRXWy7NGMDeuU9PUM=
X-Google-Smtp-Source: ABdhPJxIKTuSteato6jqyke4C3qQizgz+kXKWTXrT7ek9BY4C2QafHHN8TpUaT0zIkV/nhaSrqqklNABRKQujZiGvQw=
X-Received: by 2002:ac8:4507:: with SMTP id q7mr3191244qtn.142.1595494116048; 
 Thu, 23 Jul 2020 01:48:36 -0700 (PDT)
MIME-Version: 1.0
References: <20200723073744.13400-1-krzk@kernel.org>
 <20200723073744.13400-15-krzk@kernel.org>
In-Reply-To: <20200723073744.13400-15-krzk@kernel.org>
From: Arnd Bergmann <arnd@arndb.de>
Date: Thu, 23 Jul 2020 10:48:19 +0200
X-Gmail-Original-Message-ID: <CAK8P3a3btGD5oqmPXJk=UOmA=wuUxn-vOOO982uAjuRcE3crVg@mail.gmail.com>
Message-ID: <CAK8P3a3btGD5oqmPXJk=UOmA=wuUxn-vOOO982uAjuRcE3crVg@mail.gmail.com>
Subject: Re: [PATCH 14/23] memory: ti-emif-pm: Fix cast to iomem pointer
To: Krzysztof Kozlowski <krzk@kernel.org>
X-Provags-ID: V03:K1:nhJBKhOS57un1e4yIRJWV6G/mY+RpF1eQTiT258AZt4CmdN8xrU
 mYAMj/xwUMoQimb0OtzPY4UM7CjRYrTryGK9tKJa1u4MrsIH9D4HylA1hLgOpa+0WgmZEp7
 jiw8XoFaIVm0FuJp/qDniBPP3XKw4HWvsuQFxk4rWDZVhmmhgnep5E/aXSRsVOwQ0z9Zs/B
 Nh6rt50EXmtuwF/MZhx8A==
X-UI-Out-Filterresults: notjunk:1;V03:K0:WcXf8r0R0jg=:hcP2WVf1wlkwMp/KIbGQnQ
 tCD05nrydsAJenrzO3GdHjH7ZGaQ8Z0ChtYiJ5bgHYErWiCZk/U6HZHnHOWQOSbs9AirZJXAA
 Zy3AJ2v+X/LnijGyuQ/soZbXo3oDTbweU1GP7up8Gxuaghl8MZ8d3EYI5YLXsdzIHw9vxrYJ1
 k+0nuFfdkkPcW1JR/6CH3Yy0XzkBezfcVga526Tc1inRAQtMeZLDhiEb7LIT2M671w7J3ybiu
 E6N/Iwf+PynDfGAdxJh9/XGpadqJ7mX0u+Ed+CqaZdoPa7ugweZsIab/3OdVvvLs7xVozO4Lr
 bcOibJ04v8LtMAlYmXMfq2wWS7ayYrCS+DTETEib+ZNumjWb5V1GsuQY29mV5jw2ZdDTXJ7L9
 YbyIwWa7jSClSeJF3TLyFxoLXzILakB/etU4LI8zcMFzAQDk7dID1HSJDlYRsyOULvacLOlVa
 jv+LRWESmN7Ox1as5fO5aZd/tAOGrqvX4YJ9R/Cp5AcBllrJs8DuiWrc4HlnrLMJ+Ek6hpKaO
 +Z3uj8JGVMMfRMxkELu9YhoIw/1QytDY9FVpaBlgULm7NnwGzwppDT00xw3i2D0c41rcyBBsq
 +VcWO9pMJgoVkOxyXmiqhRJVH+h6FtrRyAhQOEP4BhN+Qb4kfYHTR+z2AM+nkDGYZYW7yRO26
 cY7eAxifhYng2uEmPqQpMO0wXCcIGagcZPKpjWQN+l6K+2NIkwT0nZnjjzG00YXs8qjhEGyUY
 nNQeDzFIEFBZTzlWGLsM0RFA72zd1iToZrr/shpQ4ywZ8FpdmlDKLjjo4z/ylgOzjW2dvL3Pt
 py+TsFhuTLONKN2SmE0VVLLZmqVb05Hbi0cScxVDWkA3JPHJIaFBqI1ELgNIALLb2kwwzky
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200723_044842_929261_8AE2C1C8 
X-CRM114-Status: GOOD (  18.88  )
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
List-Id: <soc.lore.kernel.org>
Cc: Florian Fainelli <f.fainelli@gmail.com>,
 "open list:TEGRA ARCHITECTURE SUPPORT" <linux-tegra@vger.kernel.org>,
 linux-omap <linux-omap@vger.kernel.org>, Tony Lindgren <tony@atomide.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "moderated list:ARM/Mediatek SoC..." <linux-mediatek@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Vladimir Zapolskiy <vz@mleia.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 SoC Team <soc@kernel.org>, arm-soc <arm@kernel.org>,
 bcm-kernel-feedback-list <bcm-kernel-feedback-list@broadcom.com>,
 Markus Mayer <mmayer@broadcom.com>, Santosh Shilimkar <ssantosh@kernel.org>,
 Olof Johansson <olof@lixom.net>, Thierry Reding <thierry.reding@gmail.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Roger Quadros <rogerq@ti.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Thu, Jul 23, 2020 at 9:39 AM Krzysztof Kozlowski <krzk@kernel.org> wrote:
>
> Cast pointer to iomem memory properly to fix sparse warning:
>
>     drivers/memory/ti-emif-pm.c:251:38: warning: incorrect type in argument 1 (different address spaces)
>     drivers/memory/ti-emif-pm.c:251:38:    expected void const volatile [noderef] __iomem *addr
>     drivers/memory/ti-emif-pm.c:251:38:    got void *
>
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> ---
>  drivers/memory/ti-emif-pm.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/memory/ti-emif-pm.c b/drivers/memory/ti-emif-pm.c
> index 9c90f815ad3a..6c747c1e98cb 100644
> --- a/drivers/memory/ti-emif-pm.c
> +++ b/drivers/memory/ti-emif-pm.c
> @@ -248,7 +248,7 @@ MODULE_DEVICE_TABLE(of, ti_emif_of_match);
>  static int ti_emif_resume(struct device *dev)
>  {
>         unsigned long tmp =
> -                       __raw_readl((void *)emif_instance->ti_emif_sram_virt);
> +                       __raw_readl((void __iomem *)emif_instance->ti_emif_sram_virt);
>

Maybe this shouldn't even be __raw_readl(), but instead READ_ONCE()?

The other accesses in this file don't use MMIO wrappers either but just treat
it as a pointer. The effect would be the same though.

      Arnd

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
