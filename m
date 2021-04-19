Return-Path: <SRS0=CMHm=JQ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C3C96C433B4
	for <linux-mediatek@archiver.kernel.org>; Mon, 19 Apr 2021 08:20:58 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4B8226101C
	for <linux-mediatek@archiver.kernel.org>; Mon, 19 Apr 2021 08:20:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4B8226101C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=rB4+HEe4eZx7tQtpMJErrMkWnGTjbVLRccH8xKXpbUU=; b=gr13on/3NCMfYCW6xeCy576kZ
	y6GxvxJX3oQidlY6QVrKDUk83DgmD9uY23CqgX9/RyahYR46J+K7cAnx0ZjQhtvlb0TD7/xv26qb2
	PVSmxECEmzRHHSt/ZeI5gQmW026QR0eC8MupPsQxQd2uJV+s2Y8e7ZpEHpMJeTMb8che/YYn0KhBj
	rYdMYhDvo5KvP9L8TKnqybSDiICHdkmC4QUS475I+nHea3JyWUSboeZbhOmTz05U7DYqDPpzb5s6f
	vC9L2stWNZAqgUn/wDTPkLbCqtwu1EOdlXfjhPMhz+I2KeAVik4Qbgu2a/eaebhU/q39DYhyJO33P
	sBEszsOYQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lYP97-009PzG-9O; Mon, 19 Apr 2021 08:20:41 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lYP91-009Pxt-MB; Mon, 19 Apr 2021 08:20:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Type:Cc:To:Subject:Message-ID
 :Date:From:In-Reply-To:References:MIME-Version:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=ltv54OOOgcKhPoH7oRaigoXMRi+Z2QqH7bQ4dTNkEvU=; b=XVY+t5xQ0TgVFtqpc9p43cW6PV
 KG0iDnunKbEnFgh3M4FMrpPEINQw8296UQ04BWEZfGWy0WO73wLt9W47iPSKkrJV+DI8Nbnomhv/u
 X8fzR1kF9fVJ4p1ZcyGQ8/P5/sj4Ny5n9Jcp4RJ97lfAsrSjY59diujRLLzrbK/hiRWTH+xKc0Rca
 d+oVjc5tiR7sxuk1+0Nrq0OoEP2BJAjgTdARf2SS42mvLSiyzkosS91+nCJ4QBzkjCONCGmAMfPfA
 mMdQHfKYMTOgMiUUrbCICiDCPUJ7NfY6pED2s1IL2A4jS44vWlegnHtwQvHa/opNLXaWqqzgXraQQ
 VXu3UOFQ==;
Received: from mail-vs1-f41.google.com ([209.85.217.41])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lYP8v-00BBFL-TH; Mon, 19 Apr 2021 08:20:34 +0000
Received: by mail-vs1-f41.google.com with SMTP id u22so6173773vsu.6;
 Mon, 19 Apr 2021 01:20:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ltv54OOOgcKhPoH7oRaigoXMRi+Z2QqH7bQ4dTNkEvU=;
 b=GG2LBldalzQHEUYB1Ctr0NASLwFy2AKoIiR93glWlwDQmQZC5A0RkJpgmEPOhWYR4K
 Bv9Lw0Xb0sQy/dbCw5ffdv4IYfHoZd9xcSkY7lka2+nUx600m3H3ff+J7mPk/S15w+rN
 mJhmopU7iBaareSdEm3oPgm9X6MtvfuPw+DxBzD6ZCzD8/ng/rEXT4R0V0gg9P51ByJ3
 lJVB3jd4lPPxSyeSuuXTeI251NIqiml6NEDRNHFXxti6G/Fcpm4lfhx/n+1GvbSZLwQ2
 tvpTy5s2HU1kGqhhFgZxjzNz/0Qt5fsfjEFUn8zhHaIeigQYRho2yeHKckhPKoKoSlTG
 iLyg==
X-Gm-Message-State: AOAM5333vZKsO55I/EDzDOHaIA67HA4GyA7JCIOeLYwfqb/b5nM/zpps
 sbVcu28OEnpYDt/eApagGJz3Hc3k8x3IFhuryDs=
X-Google-Smtp-Source: ABdhPJw0QI7XOFx1TPnFrXWAlR/QW1v6zaWS/KnYbAtB/CEX2DsVVO2yNBv9r1VAA3kWmuOXuQwF2fQGH/J1go6B4oc=
X-Received: by 2002:a67:f503:: with SMTP id u3mr12373252vsn.3.1618820424835;
 Mon, 19 Apr 2021 01:20:24 -0700 (PDT)
MIME-Version: 1.0
References: <20210419042722.27554-1-alice.guo@oss.nxp.com>
 <20210419042722.27554-2-alice.guo@oss.nxp.com>
In-Reply-To: <20210419042722.27554-2-alice.guo@oss.nxp.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 19 Apr 2021 10:20:13 +0200
Message-ID: <CAMuHMdUbrPxtJ9DCP0_nFrReuuO4vFY2J79LrKY82D7bCOfzRw@mail.gmail.com>
Subject: Re: [RFC v1 PATCH 1/3] drivers: soc: add support for soc_device_match
 returning -EPROBE_DEFER
To: "Alice Guo (OSS)" <alice.guo@oss.nxp.com>
Cc: gregkh@linuxfoundation.org, rafael@kernel.org, horia.geanta@nxp.com, 
 aymen.sghaier@nxp.com, herbert@gondor.apana.org.au, davem@davemloft.net, 
 tony@atomide.com, geert+renesas@glider.be, mturquette@baylibre.com, 
 sboyd@kernel.org, vkoul@kernel.org, peter.ujfalusi@gmail.com, 
 a.hajda@samsung.com, narmstrong@baylibre.com, robert.foss@linaro.org, 
 airlied@linux.ie, daniel@ffwll.ch, khilman@baylibre.com, tomba@kernel.org, 
 jyri.sarha@iki.fi, joro@8bytes.org, will@kernel.org, mchehab@kernel.org, 
 ulf.hansson@linaro.org, adrian.hunter@intel.com, kishon@ti.com, 
 kuba@kernel.org, linus.walleij@linaro.org, Roy.Pledge@nxp.com, 
 leoyang.li@nxp.com, ssantosh@kernel.org, matthias.bgg@gmail.com, 
 edubezval@gmail.com, j-keerthy@ti.com, balbi@kernel.org, 
 linux@prisktech.co.nz, stern@rowland.harvard.edu, wim@linux-watchdog.org, 
 linux@roeck-us.net, linux-kernel@vger.kernel.org, 
 linux-crypto@vger.kernel.org, linux-omap@vger.kernel.org, 
 linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
 dmaengine@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 iommu@lists.linux-foundation.org, linux-media@vger.kernel.org, 
 linux-mmc@vger.kernel.org, netdev@vger.kernel.org, 
 linux-phy@lists.infradead.org, linux-gpio@vger.kernel.org, 
 linuxppc-dev@lists.ozlabs.org, linux-staging@lists.linux.dev, 
 linux-mediatek@lists.infradead.org, linux-pm@vger.kernel.org, 
 linux-usb@vger.kernel.org, linux-watchdog@vger.kernel.org, 
 Arnd Bergmann <arnd@arndb.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210419_012029_956281_3B2C7EC1 
X-CRM114-Status: GOOD (  23.31  )
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

Hi Alice,

CC Arnd (soc_device_match() author)

On Mon, Apr 19, 2021 at 6:28 AM Alice Guo (OSS) <alice.guo@oss.nxp.com> wrote:
> From: Alice Guo <alice.guo@nxp.com>
>
> In i.MX8M boards, the registration of SoC device is later than caam
> driver which needs it. Caam driver needs soc_device_match to provide
> -EPROBE_DEFER when no SoC device is registered and no
> early_soc_dev_attr.

I'm wondering if this is really a good idea: soc_device_match() is a
last-resort low-level check, and IMHO should be made available early on,
so there is no need for -EPROBE_DEFER.

>
> Signed-off-by: Alice Guo <alice.guo@nxp.com>

Thanks for your patch!

> --- a/drivers/base/soc.c
> +++ b/drivers/base/soc.c
> @@ -110,6 +110,7 @@ static void soc_release(struct device *dev)
>  }
>
>  static struct soc_device_attribute *early_soc_dev_attr;
> +static bool soc_dev_attr_init_done = false;

Do you need this variable?

>
>  struct soc_device *soc_device_register(struct soc_device_attribute *soc_dev_attr)
>  {
> @@ -157,6 +158,7 @@ struct soc_device *soc_device_register(struct soc_device_attribute *soc_dev_attr
>                 return ERR_PTR(ret);
>         }
>
> +       soc_dev_attr_init_done = true;
>         return soc_dev;
>
>  out3:
> @@ -246,6 +248,9 @@ const struct soc_device_attribute *soc_device_match(
>         if (!matches)
>                 return NULL;
>
> +       if (!soc_dev_attr_init_done && !early_soc_dev_attr)

if (!soc_bus_type.p && !early_soc_dev_attr)

> +               return ERR_PTR(-EPROBE_DEFER);
> +
>         while (!ret) {
>                 if (!(matches->machine || matches->family ||
>                       matches->revision || matches->soc_id))

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
