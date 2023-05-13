Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 747C4C77B7F
	for <linux-mediatek@archiver.kernel.org>; Sat, 13 May 2023 21:00:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zV8NgaKI21AYQDcwSfLTQKxLM+XHKCDcxx81oVOTUWw=; b=vtZktGoKMIvt+jny9xH76FCaM2
	vkFuoVcpGWYOOWjHFGl2quRF7vZ3SZCvHRMDAqK5IkqyHATazrk6cAjfEmzy8G1l36qKefp966Qh2
	mscS4skS5Sn3TFnl4iJxRWSXHpcladKOKAlpNyF/RZU8UUyXDbfnt9U/NxaQUAiCUYBNCUg5y0XUd
	1efugz5M9t68oVt702s4sglNzlzcAdnzL+vugjIIRMDfrRqRRJ4Dja9/VQBOuTmj/Tg/r88nBN1dj
	pEK2HMhYvkXkiqHYJQbV/xfIRKb4AP+ruoBvaZSsdG+fCpa1RP1chi0PVCy5CHlE/EOCNrTngUX5x
	N4ZI0dzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pxwM1-00FoU6-1b;
	Sat, 13 May 2023 21:00:37 +0000
Received: from mail-lf1-x136.google.com ([2a00:1450:4864:20::136])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pxwLy-00FoT1-01;
	Sat, 13 May 2023 21:00:35 +0000
Received: by mail-lf1-x136.google.com with SMTP id 2adb3069b0e04-4ec8149907aso13189066e87.1;
        Sat, 13 May 2023 14:00:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684011625; x=1686603625;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=zV8NgaKI21AYQDcwSfLTQKxLM+XHKCDcxx81oVOTUWw=;
        b=Jytbx05Cm4hRTOEvxNhKpkt2EycSPOAApYX5iEcq1PaJuvy6ICXIOO9Db6B51iIxY4
         VY5Yqc35txmob86hBt2gP1ryznD2AQ4DiAkSqscaosGywE9/Ph9/tRXfFMd/Qs1SHfOR
         YETIirJvPgjmShxeiMhmTNAAKbSrBOgWuVoC63XvbrHsV76QKFzjXG8E7wkTmdrBAb0J
         mSBE5PrfXG1/f+Ode8WFbFkNDeZeREiXMrkaYfChmihjannARS01AbzBkJHAAH9Ny4W4
         VYAe4lgrla69MbHTPurn3FzG80xSLa7GdVzjHEd364HSVJCITe9a0CNEuIQPtOJD3vUt
         LimQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684011625; x=1686603625;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zV8NgaKI21AYQDcwSfLTQKxLM+XHKCDcxx81oVOTUWw=;
        b=L4FWFt3ssr0i/lbpYETNWO4J+jesXgtoD7lmHyGJN1eVuVksEThbA+lLu7i72R7uZH
         pcWE1CVNGS9oQarWDpOkyL14m79tXaD/9A1K+edGi2QaKpo/LlTNtVnDx6WnlWyQUS+F
         463eEWoG8Oqwa7UJXDjzyNdAE0sf9s0/t1GqfYDPmQYZ30m/+5tlzi18ZtT8B4Idzatn
         8Fv5Tni4FrDaO3TDW0lRf6EwdrPaI/TQornsAUmGul4mn66/Ck2e2T39lJxdZtDEla09
         y/66sDpItoycl3GcC5FmPTY1MJ7oV2TzDbIcjZ3vlgaJlgXRohvQoRhWROXF2zwHUvjx
         cIUA==
X-Gm-Message-State: AC+VfDx23ALXCbo+SBcdAfL/umSyNA/vuTbIOBpOkhwOB+nY/lMNsJTq
	EigzRepGg9mOpQljkI9lnuQ=
X-Google-Smtp-Source: ACHHUZ490C1IMSfYMBIJPIBdjHu0hQd16yeY8REgzrulETc0r/zO1YtaBnR0pzf3SHx8vnFcg/YI2Q==
X-Received: by 2002:ac2:5d2d:0:b0:4e9:bf83:11a4 with SMTP id i13-20020ac25d2d000000b004e9bf8311a4mr4392216lfb.7.1684011624891;
        Sat, 13 May 2023 14:00:24 -0700 (PDT)
Received: from mobilestation ([95.79.140.35])
        by smtp.gmail.com with ESMTPSA id o1-20020a05651238a100b004d8546456c6sm1927815lft.195.2023.05.13.14.00.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 May 2023 14:00:24 -0700 (PDT)
Date: Sun, 14 May 2023 00:00:21 +0300
From: Serge Semin <fancer.lancer@gmail.com>
To: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Cc: Damien Le Moal <dlemoal@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Hans de Goede <hdegoede@redhat.com>, Jens Axboe <axboe@kernel.dk>,
	Patrice Chotard <patrice.chotard@foss.st.com>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	NXP Linux Team <linux-imx@nxp.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Sergey Shtylyov <s.shtylyov@omp.ru>,
	"open list:LIBATA SUBSYSTEM" <linux-ide@vger.kernel.org>,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-sunxi@lists.linux.dev,
	linux-tegra@vger.kernel.org
Subject: Re: [PATCH] ata: libata: Make ata_platform_remove_one return void
Message-ID: <20230513210021.gver7ibozrmmbm4j@mobilestation>
References: <20230512204646.137746-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230512204646.137746-1-u.kleine-koenig@pengutronix.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230513_140034_047503_5407F086 
X-CRM114-Status: GOOD (  17.16  )
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

On Fri, May 12, 2023 at 10:46:46PM +0200, Uwe Kleine-König wrote:
> The function returned zero unconditionally, so the function returning an
> int is something between useless and irritating. With the goal to make
> platform drivers' remove function return void, it's helpful to convert
> the function accordingly. This converts several drivers to the new
> .remove_new callback that was introduced to smoothen the platform driver
> conversion.
> 
> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
> ---

[...]

>  drivers/ata/ahci_dwc.c         | 2 +-

[...]

> diff --git a/drivers/ata/ahci_dwc.c b/drivers/ata/ahci_dwc.c
> index 4bfbb09cdc02..9604a2f6ed48 100644
> --- a/drivers/ata/ahci_dwc.c
> +++ b/drivers/ata/ahci_dwc.c
> @@ -478,7 +478,7 @@ MODULE_DEVICE_TABLE(of, ahci_dwc_of_match);
>  
>  static struct platform_driver ahci_dwc_driver = {
>  	.probe = ahci_dwc_probe,
> -	.remove = ata_platform_remove_one,
> +	.remove_new = ata_platform_remove_one,
>  	.shutdown = ahci_platform_shutdown,
>  	.driver = {
>  		.name = DRV_NAME,

For DWC AHCI SATA
Acked-by: Serge Semin <fancer.lancer@gmail.com>

-Serge(y)

[...]

> -- 
> 2.39.2
> 

