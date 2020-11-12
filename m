Return-Path: <SRS0=Fc+n=ES=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D7CE8C2D0A3
	for <linux-mediatek@archiver.kernel.org>; Thu, 12 Nov 2020 14:09:07 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D3D4420A8B
	for <linux-mediatek@archiver.kernel.org>; Thu, 12 Nov 2020 14:09:06 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Q6x11XYA"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D3D4420A8B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=GiOG8tHDUzz+olfumRyjicz1fb0Fop9M7/OXoDZUrY4=; b=Q6x11XYAeX0CmmR7hUIDeq2au
	qq+ZyWt7mlSsMnsBuozca87JwC7fJzNGLShz+yROlbjD5VQ029foQN5jzTr64cQAGW3qxGwv/kjdC
	Nqs986khKGoJKJylRmxykCY3xQOxONDIt9UCjtXPyUV5pTSHHb2etIx7qcu7GkKR3bSNSiYvyCPJd
	gfnsyJalA3Ti44ozM/IkmWGPBFWD989zX5EMHHTlqzX/dkIdUKb+9Ducb1OHQL/sg7JL7PmybU7Hw
	X1klzSHHgY3vus4kZU95RQufCbgQkBDBaaKRUXz2dRP7Sbc/QAcePmB5ThjfIn9+giswTei6kf3Dh
	o9NSM/ewQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kdDHS-0007Tu-50; Thu, 12 Nov 2020 14:08:54 +0000
Received: from mail-oi1-f196.google.com ([209.85.167.196])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kdDHM-0007SU-Mx; Thu, 12 Nov 2020 14:08:49 +0000
Received: by mail-oi1-f196.google.com with SMTP id d9so6495142oib.3;
 Thu, 12 Nov 2020 06:08:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=kbihsDClb1B2917jEi922Nsd76R5TECIX8wIsf+GP/4=;
 b=WuYWRZF61sxjQgZQ4PM+RDB/E0wFfua42lM7pVmsos8wGe9d45jbLeN4HJ3yrlAyds
 6Aio3oe03HYjBT57y7T6ADk3Eln5CbUgHJ9OWDViGR475+hH6bgqeA6X2aAYYqfvgvtW
 IQ0e+6PgXeeaSeUnoVLjQjSEswy9ZO4yZF5pcnr6kKlF25O72ImR6IlHwVNxqnwPnmdn
 ODLSH1sUUtGkkb0CgIit9e7ejyjn4uQuVf6eAlYBf/QLmqRU2Wae6ZJmm/J6QVlnI2sm
 Ut+fdeP3AjgBIcDv9IBT1dmJVKBZDfKvVsgpluL0EWjt8KUEuqjUruHIF/PbPj9wZ5wU
 8CKQ==
X-Gm-Message-State: AOAM530W1Xszm7xcyS/dekZpEdDGoVCFc5Hs1ZgI4gaEQ2xn3R+3xMtD
 +BDNZQK6LdHpKX2a2xG81Ucs+7TLAtYd0gPizmtzzwZUjAh7Wg==
X-Google-Smtp-Source: ABdhPJwq7NBruaHnXszKMr0TlCiN7NsMHhv5ZOBvSSB+qrwM2D5GDCDxKEK8IkAObrwiJw9k0TF9NyjAeUO4yR6sGuY=
X-Received: by 2002:aca:4bc3:: with SMTP id y186mr5372923oia.153.1605190127602; 
 Thu, 12 Nov 2020 06:08:47 -0800 (PST)
MIME-Version: 1.0
References: <1595404275-8449-1-git-send-email-chunfeng.yun@mediatek.com>
 <1595404275-8449-7-git-send-email-chunfeng.yun@mediatek.com>
In-Reply-To: <1595404275-8449-7-git-send-email-chunfeng.yun@mediatek.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 12 Nov 2020 15:08:36 +0100
Message-ID: <CAMuHMdU8ow7J-Db_v3HUM8MmPfYcNpirzpUFmjUQrneeaVGFoA@mail.gmail.com>
Subject: Re: [PATCH 7/7] usb: musb: convert to
 devm_platform_ioremap_resource_byname
To: Chunfeng Yun <chunfeng.yun@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201112_090848_831171_BE724330 
X-CRM114-Status: GOOD (  14.84  )
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
Cc: Felipe Balbi <balbi@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 USB list <linux-usb@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>,
 Bin Liu <b-liu@ti.com>, Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi Chunfeng,

On Wed, Jul 22, 2020 at 9:54 AM Chunfeng Yun <chunfeng.yun@mediatek.com> wrote:
> Use devm_platform_ioremap_resource_byname() to simplify code
>
> Cc: Bin Liu <b-liu@ti.com>
> Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>

Thanks for your patch, which is now commit 2d30e408a2a6b344 ("usb: musb:
convert to devm_platform_ioremap_resource_byname") in v5.9.

> --- a/drivers/usb/musb/musb_dsps.c
> +++ b/drivers/usb/musb/musb_dsps.c
> @@ -429,12 +429,10 @@ static int dsps_musb_init(struct musb *musb)
>         struct platform_device *parent = to_platform_device(dev->parent);
>         const struct dsps_musb_wrapper *wrp = glue->wrp;
>         void __iomem *reg_base;
> -       struct resource *r;
>         u32 rev, val;
>         int ret;
>
> -       r = platform_get_resource_byname(parent, IORESOURCE_MEM, "control");
> -       reg_base = devm_ioremap_resource(dev, r);
> +       reg_base = devm_platform_ioremap_resource_byname(parent, "control");
>         if (IS_ERR(reg_base))
>                 return PTR_ERR(reg_base);
>         musb->ctrl_base = reg_base;

On Beaglebone Black, where each interface has 2 children:

    musb-dsps 47401c00.usb: can't request region for resource [mem
0x47401800-0x474019ff]
    musb-hdrc musb-hdrc.1: musb_init_controller failed with status -16
    musb-hdrc: probe of musb-hdrc.1 failed with error -16
    musb-dsps 47401400.usb: can't request region for resource [mem
0x47401000-0x474011ff]
    musb-hdrc musb-hdrc.0: musb_init_controller failed with status -16
    musb-hdrc: probe of musb-hdrc.0 failed with error -16

Before, devm_ioremap_resource() was called on "dev" ("musb-hdrc.0" or
"musb-hdrc.1"), after it is called on "&pdev->dev" ("47401400.usb" or
"47401c00.usb"), leading to a duplicate region request, which fails.

I have sent a revert:
https://lore.kernel.org/linux-usb/20201112135900.3822599-1-geert+renesas@glider.be/

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
