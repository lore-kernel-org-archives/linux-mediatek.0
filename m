Return-Path: <SRS0=XaoX=OK=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 93398C433EF
	for <linux-mediatek@archiver.kernel.org>; Mon, 20 Sep 2021 10:05:57 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 63FA660F21
	for <linux-mediatek@archiver.kernel.org>; Mon, 20 Sep 2021 10:05:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 63FA660F21
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2TvOfm+2BYOAUXlpGRnl9AWgPd5rBkM7Udl1UK38Fd0=; b=B1ts2vC4upj54t
	XouyMA59ghxJ2rVziCS+BgN4V/xwG2v0s6KA3251T7B1z8va+L0qp7OD3iyMEFfdx1i8vwKQumVKY
	WkMn0AgjwbhCcIYkKGnNSKjyDXEKxFHSMbQspKq+hgYwwqk4wnnGV+8F0VYX++YybFVrn3PvW8mpG
	KMdNqNLdeHjjmaM43j13wIMPMKfvyo8pxyp7KIwUg4GV1aSinzJ1wLOrdvKHllpzqU2Pd35dle0Ty
	HBLmkazOQaPqIKOWpReMr4/ctDmtHUK1GVh5JeXdE7f/lRkrX0sPanXe11rbPcc5IRrQe29lEeIMZ
	acy5OwGFqtFalu/KUBrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mSGBG-001Dtn-CS; Mon, 20 Sep 2021 10:05:46 +0000
Received: from mail-vk1-f170.google.com ([209.85.221.170])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mSGAx-001DoL-1s; Mon, 20 Sep 2021 10:05:28 +0000
Received: by mail-vk1-f170.google.com with SMTP id g15so968378vke.5;
 Mon, 20 Sep 2021 03:05:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=CJlXbAv3u12lESrV/6ZqM6UNLLxRX/MyMpJQH7eW+7g=;
 b=QmSvP2eIROaBcNS8TmuaEMp4D1Gvq54lYF36z///uP7RIiBQt//LFL+kkeowwjTDlC
 RWEtoCNQJnq/MInz7QV3CmwLf9IlxfEAhqKSU+sXUL2tOOUqAGhOfBauIRlkLPBvll/s
 4ga2JUu4ZVfJ4XYRnvNaKtSZGpVOuTEImWa3qM0vfbIM6lRoqJALgutBjw6EiMit8V3k
 0EkuoLfbg8DBYy5tGgnCoUJhkK/l02kY2qSSguUaCstVHK1PNsV2yxibjNZj+SOzBc+k
 tnWKVkf95ckQsxW1WpLgZDhuhSoRg8jXnPqTIh6TGLdWIcXRaSwT9x2DJbB/q2qElv0X
 a5KA==
X-Gm-Message-State: AOAM532hLhuI3wRGGql8ge+GTCqk34S3S9zalMA8fg7IIk049qcLFHyw
 WaZeXmUQP+liXRTRV9uaqhAkasBhbHWBXlO01vU=
X-Google-Smtp-Source: ABdhPJw21KYJ6+E01J7XKEBzRND+bYGJxtvpgL/KCdlzvGuzKjTv1Xd3XS/lrKcKi3oLR3yuOCRgqcDqibrEOieac7U=
X-Received: by 2002:a1f:230c:: with SMTP id j12mr13427328vkj.11.1632132324735; 
 Mon, 20 Sep 2021 03:05:24 -0700 (PDT)
MIME-Version: 1.0
References: <20210920100206.1418649-1-arnd@kernel.org>
In-Reply-To: <20210920100206.1418649-1-arnd@kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 20 Sep 2021 12:05:13 +0200
Message-ID: <CAMuHMdUvb=nCZ=qfeUyUHQJ7TRjMjs4OVtd2q3yQT5SPk6Dx_g@mail.gmail.com>
Subject: Re: [PATCH] ASoC: mediatek: mt8195: force COMMON_CLK dependency
To: Arnd Bergmann <arnd@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, Trevor Wu <trevor.wu@mediatek.com>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, Arnd Bergmann <arnd@arndb.de>, 
 Jiaxin Yu <jiaxin.yu@mediatek.com>, Tzung-Bi Shih <tzungbi@google.com>, 
 ALSA Development Mailing List <alsa-devel@alsa-project.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 linux-mediatek@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210920_030527_165244_E499F2B9 
X-CRM114-Status: GOOD (  28.68  )
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

Hi Arnd,

Thanks for your patch!

On Mon, Sep 20, 2021 at 12:02 PM Arnd Bergmann <arnd@kernel.org> wrote:
> From: Arnd Bergmann <arnd@arndb.de>
>
> Without CONFIG_COMMON_CLK, this driver fails to link:
>
> ERROR: modpost: "clk_unregister_gate" [sound/soc/mediatek/mt8195/snd-soc-mt8195-afe.ko] undefined!
> ERROR: modpost: "clk_register_gate" [sound/soc/mediatek/mt8195/snd-soc-mt8195-afe.ko] undefined!
>
> Add the proper Kconfig dependency for compile testing.
>
> Fixes: 6746cc858259 ("ASoC: mediatek: mt8195: add platform driver")
> Fixes: 940ffa194547 ("ASoC: mediatek: SND_SOC_MT8195 should depend on ARCH_MEDIATEK")

I don't think the second Fixes tag is appropriate, as that commit did not
relax the dependencies.

> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>  sound/soc/mediatek/Kconfig | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/sound/soc/mediatek/Kconfig b/sound/soc/mediatek/Kconfig
> index 5a2f4667d50b..268c1f74aa3e 100644
> --- a/sound/soc/mediatek/Kconfig
> +++ b/sound/soc/mediatek/Kconfig
> @@ -187,7 +187,7 @@ config SND_SOC_MT8192_MT6359_RT1015_RT5682
>
>  config SND_SOC_MT8195
>         tristate "ASoC support for Mediatek MT8195 chip"
> -       depends on ARCH_MEDIATEK || COMPILE_TEST
> +       depends on ARCH_MEDIATEK || (COMPILE_TEST && COMMON_CLK)

Why not add a second line

    depends on COMMON_CLK

to make a clear distinction between hard and soft dependencies?

>         select SND_SOC_MEDIATEK
>         help
>           This adds ASoC platform driver support for Mediatek MT8195 chip

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
