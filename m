Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76C04CDB46F
	for <linux-mediatek@archiver.kernel.org>; Tue, 23 Jun 2026 14:35:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:In-Reply-To:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hSWVR0//HeUMGIesSUzOzzGnHMJ2w79THlL/muBHE0Q=; b=cQz7LXZItncyA3qaALN1LtIZGn
	4vEG3dsH0V1mIwt5HBApPJLhxxG1fzFO/71Xwb2WBJUt9PvkZpMSKCIN/DCI2wG2jQDSs3kBofBUI
	9inCh7D4Ll1+xQFxbNJ6TqcPZyVq/YLOHypI9yTD7ramYt44p/UdkGskn39FUVdtVNVvU43Jg9Ash
	AuzYRyOeIjMirvzfxRIjHv8jJsFDlHtsv77Gh5Xo8k2wTDXIP9PQio6YUxmNWCyKd6GQuUCjrQd6q
	JBS3pjyUhxFn3SfswWpEh6Osmj3/HXK4MziRujj2KvaE7tGLyarSreTl7U65O+U1qy+Yx1QhDKIlD
	zGbfVGBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wc2Dl-00000006Ss5-1P0i;
	Tue, 23 Jun 2026 14:35:25 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wc2Dh-00000006Sqo-424L
	for linux-mediatek@lists.infradead.org;
	Tue, 23 Jun 2026 14:35:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1782225320;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=hSWVR0//HeUMGIesSUzOzzGnHMJ2w79THlL/muBHE0Q=;
	b=Qb/Jwu7CsOmpmMNOWO1zVgnU9TgT0aMxs5KJ9UgWB1jaSmg9akfeYkluinbTEcBtfWLrZZ
	znADOK50FijE6X1FsTxcrhQkDK5aULPaV8XTHvwp//gY8nFiW6PvPyfW9OUQPQ54NKUp0c
	Zjlj1YBmCfaMRG6nTgAITmlqsrUFoX4=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-659-ZdpRNVvGP9aQidJM0UHTeA-1; Tue, 23 Jun 2026 10:35:17 -0400
X-MC-Unique: ZdpRNVvGP9aQidJM0UHTeA-1
X-Mimecast-MFC-AGG-ID: ZdpRNVvGP9aQidJM0UHTeA_1782225316
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-8dd3fe99e80so73956316d6.1
        for <linux-mediatek@lists.infradead.org>; Tue, 23 Jun 2026 07:35:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782225316; x=1782830116;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=hSWVR0//HeUMGIesSUzOzzGnHMJ2w79THlL/muBHE0Q=;
        b=fZihT/eCUgFqkWkbIXaIWIWCgfrFd0LD/AbM/BNgrD/RMvl+vSbniMsSIkaQHp/KlA
         YIAdZrYjPu63fXQMv4gjvS31q5YmlB9p/gLNhRGbMGzUvX9aY9PXjSUD7wXRpNeD5Y/K
         qm5JAGyn3jNziLpSqUn3YfDIzdMPFcjYP3G5xrTp8vPJPG89uOWyurjws/S4OZ5fZOON
         EpoYRIRYZbVOK4l+zfhR6lS3kwJarJIgBvBrHkKJ3jhji1kPXgD6oxW2ygpz4HqIJAPM
         hphplV7yx5GplTbw6Wod6nhCmd4W9hYVAPzRV7uXGf57CDqIy5jcJVPZilutIbfNTh7b
         CBBA==
X-Forwarded-Encrypted: i=1; AFNElJ+zf5xajE9O9Du4vUFj+3EnrwR1ADCh/nWytYrChTQPhay08tNfRNyemO/ROhIDRnLytrSIgmvazckfJ9+p5g==@lists.infradead.org
X-Gm-Message-State: AOJu0YyHDGXqqCWrBbVk6MG+5d45jLhKYOXyGQD3//QQ2fnIOm7lkdvI
	O2ux05U3kcMhRbFp4N2Jt8q1A4RhO4dAHyB5LkwSi/ol8lv1RFMSoZCcI1TAwPPqROXNdI99bfV
	ROOBIJ5Djq/hbhZjG0bLpOxKQJOHJgRRWlCCa4zLKHpETNkN27Fd7uWyz/UjfkLbt5ugdcjcwEw
	==
X-Gm-Gg: AfdE7cmGeeV7ewvHeKecii78tu7M+VN1bBri2PG47+M3oHFMcpAxhQqCLifuUgVefZK
	fpB0t8nyYzlTyeAX8sFG13kRDr1Ytrnkli2m6nYDon1fApo7AFVMjfhnraTrlNyL4N/6kHxObYn
	Vb4182MLTg1jqQ2UuMJbIrK+YpTV9PTq4j9yIsJloihwk1I3rwfryqVK9UgJsYrDU7Md2xA4oAo
	RYcRSNhKyipI6VZmlAhbzPNZl6HCd4P9L0fe7qNOQVR3bv2p/G1yTAPILdFGuEHevOKQOw/rllC
	vTvzfb1PJhfxihuwzHvNTkS4yxM4jsUymPe6/Wge1nByc3f6tEnLSWxJBgXxBP/zdP+lhBE+z0U
	lJV27ujWxSrY2OSl7/5dwakcxPVLUv0ONIEpW0LaFr3kSBA==
X-Received: by 2002:a05:622a:1b8c:b0:517:5e32:af20 with SMTP id d75a77b69052e-519e490624dmr281782471cf.6.1782225316414;
        Tue, 23 Jun 2026 07:35:16 -0700 (PDT)
X-Received: by 2002:a05:622a:1b8c:b0:517:5e32:af20 with SMTP id d75a77b69052e-519e490624dmr281781791cf.6.1782225315666;
        Tue, 23 Jun 2026 07:35:15 -0700 (PDT)
Received: from redhat.com (c-73-183-53-213.hsd1.pa.comcast.net. [73.183.53.213])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-51a51afc29csm24695621cf.27.2026.06.23.07.35.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jun 2026 07:35:14 -0700 (PDT)
Date: Tue, 23 Jun 2026 10:35:12 -0400
From: Brian Masney <bmasney@redhat.com>
To: Myeonghun Pak <mhun512@gmail.com>
Cc: Yassine Oudjana <y.oudjana@protonmail.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-clk@vger.kernel.org, linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	Ijae Kim <ae878000@gmail.com>
Subject: Re: [PATCH] clk: mediatek: mt6735: Unregister PLLs on probe failure
Message-ID: <ajqZoOv-TvmOMLCh@redhat.com>
References: <20260623094125.95791-1-mhun512@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20260623094125.95791-1-mhun512@gmail.com>
User-Agent: Mutt/2.3.2 (2026-04-26)
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: pAAWJNhNu-U3w7Y1S-z4yMJK_8GX5KR_1VvM62l0yPA_1782225316
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260623_073522_071659_DF949743 
X-CRM114-Status: GOOD (  21.22  )
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

Hi Myeonghun,

On Tue, Jun 23, 2026 at 06:41:11PM +0900, Myeonghun Pak wrote:
> mtk_clk_register_plls() registers the apmixedsys PLL clocks manually, while
> clk_mt6735_apmixed_remove() unregisters them on driver removal.
> 
> If devm_of_clk_add_hw_provider() fails after the PLL registration succeeds,
> probe returns the error directly and the remove callback is not run. This
> leaves the registered PLL clocks behind on the probe failure path.
> 
> Add an unregister_plls error path so provider registration failures unwind the
> PLLs before returning the error.

Please run your patches through checkpatch.pl before sending.

> 
> Fixes: 43c04ed79189 ("clk: mediatek: Add drivers for MediaTek MT6735 main clock and reset drivers")
> Co-developed-by: Ijae Kim <ae878000@gmail.com>
> Signed-off-by: Ijae Kim <ae878000@gmail.com>
> Signed-off-by: Myeonghun Pak <mhun512@gmail.com>
> 
> ---
>  drivers/clk/mediatek/clk-mt6735-apmixedsys.c | 9 ++++++++-
>  1 file changed, 8 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/clk/mediatek/clk-mt6735-apmixedsys.c b/drivers/clk/mediatek/clk-mt6735-apmixedsys.c
> index 9e30c089a2..04cf9665ec 100644
> --- a/drivers/clk/mediatek/clk-mt6735-apmixedsys.c
> +++ b/drivers/clk/mediatek/clk-mt6735-apmixedsys.c
> @@ -102,10 +102,17 @@ static int clk_mt6735_apmixed_probe(struct platform_device *pdev)
>  
>  	ret = devm_of_clk_add_hw_provider(&pdev->dev, of_clk_hw_onecell_get,
>  					  clk_data);
> -	if (ret)
> +	if (ret) {
>  		dev_err(&pdev->dev,
>  			"Failed to register clock provider: %d\n", ret);
> +		goto unregister_plls;
> +	}
> +
> +	return 0;
>  
> +unregister_plls:
> +	mtk_clk_unregister_plls(apmixedsys_plls, ARRAY_SIZE(apmixedsys_plls),
> +				clk_data);
>  	return ret;
>  }

This fix is correct. Since only one path will encounter this, personally
I would just put the call to mtk_clk_unregister_plls() inside the if
statement above to simplify this further.

Brian


