Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79619ECAAD2
	for <linux-mediatek@archiver.kernel.org>; Mon, 29 Aug 2022 11:15:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lOhpCObqWHdCARz2NDIqCtnDWiHAAEeM53JGliLfbVs=; b=fUZJAsBfuoP5flt9q0FGz/glMN
	i3k8A+KwcZkUFPq1tAhnxey+XEdJDNI6ku2ay6o4Zr0XOsrhYv+PEUPHgm9i6OG1hDU8j1EEpcc0o
	qGtPIZCsLZ+0WNnk5e5mXim+tNeopklDs0dCVjlsaSQxiFq5LmmbSUsdxonai94kJYsaDCp7xyfw+
	ztMcTwcwBmFVU9W5jGTX1ksf1T3BR+uNsxNKhK7y8DTteJnZX3KMxxR0wE+UYnu5uTFuflDxfvXy2
	co+ysy0bB/WopkY0tR7PnK2bzF0di62cgmCC0/NCr7kZOdjhUo2wgukprO7IR75n7Pb53tgZIrfK5
	A6hbZFOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oScjd-007yUs-Gs; Mon, 29 Aug 2022 11:15:17 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oScjK-007yIt-1y; Mon, 29 Aug 2022 11:14:59 +0000
Received: by mail-wm1-x32b.google.com with SMTP id d5so4074211wms.5;
        Mon, 29 Aug 2022 04:14:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=lOhpCObqWHdCARz2NDIqCtnDWiHAAEeM53JGliLfbVs=;
        b=lPGL8ZYWjAj7lle2UsdjAKp8K4qbyHtSf55Qa20c3HvaGTUBoTNNE3UbgpAQzUSdJ9
         ScCRoCdu1b/tozGYB49Vrh6y22+ltPQmKoFzXnjAP0eRt9MgOtyhCAd7/zptlTRSuZCi
         /ri+vo2WEQD3283UxpbIfrcLtUaV/d8oNSdkqRSM/2Ruya08cC9WnnUsE2ji6bI4u17V
         iN6gRKwKEXi6I/BhxBOFIJpsAtiYkn3Yz/OWGaHZy0sMIzQ56ise+n4dZwylixG3w9bK
         a8mB3KaYAA6kF4kPDdGk0WG25mg27N4E3Xn0ORxHPpWWRdkD2VR7Cl1HfkI0rrcyBWGb
         Q4gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=lOhpCObqWHdCARz2NDIqCtnDWiHAAEeM53JGliLfbVs=;
        b=rTWoIxlp1AndTmccFyuGXyDzQO9/CBbNxlLRtOy6NL3aQTAdkVMQ7p/DIkh7YSftaG
         xM/RL9+KhlK82siAPL3+xaLZ+smtTrCglpnR0OcUzY1xXP2GpkuBFESd0XnUtzYfXfNg
         r1iEu+X+muIUVOnL1JWBaPmlHygTHSUMGzOr5X6JsJxdgiwBfsaUHQVXcKL5WT1rd+ou
         5QTDM5jAHyOvMx8Lr7cWvC+Z2lDzn8QHnbnE/hbV3bd1udi+062j+HszoNf2byTUoKzb
         FQZLH1GrM2VV50nZ6PWFoOSLhB3Nnh728oiEX81vP5Plg8iy1XjDDYRaL2fCCBEOfo1W
         779w==
X-Gm-Message-State: ACgBeo0cpXxdxBcpz5bnJcIb22XsOOvd0rSk9CopabeVtK8dOnduNusR
	l2qwmzjlKMmMDPUxZvE4ONsLmj2lMl4=
X-Google-Smtp-Source: AA6agR4qShWVRNC4Kl1p705Z5ez+1h9e3xNpc5r4siUX0qgzgQ1wfjL7bmInQOMaCVIxez4Wdyz4KA==
X-Received: by 2002:a05:600c:198e:b0:3a5:d4a2:8896 with SMTP id t14-20020a05600c198e00b003a5d4a28896mr6318695wmq.140.1661771694406;
        Mon, 29 Aug 2022 04:14:54 -0700 (PDT)
Received: from [192.168.0.30] ([47.62.125.55])
        by smtp.gmail.com with ESMTPSA id n8-20020adff088000000b002258235bda3sm6624936wro.61.2022.08.29.04.14.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Aug 2022 04:14:53 -0700 (PDT)
Message-ID: <ae3523f9-6420-9413-30cf-ab6a081c8500@gmail.com>
Date: Mon, 29 Aug 2022 13:14:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.1.2
Subject: Re: [PATCH 2/4] spi: mt7621: Use the devm_clk_get_enabled() helper to
 simplify error handling
Content-Language: en-US
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>, broonie@kernel.org,
 gregkh@linuxfoundation.org, neil@brown.name, blogic@openwrt.org
Cc: linux-spi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 kernel-janitors@vger.kernel.org
References: <cover.1661599671.git.christophe.jaillet@wanadoo.fr>
 <05a7fd22719008c8a905d6328aa9548ce40f2a7a.1661599671.git.christophe.jaillet@wanadoo.fr>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <05a7fd22719008c8a905d6328aa9548ce40f2a7a.1661599671.git.christophe.jaillet@wanadoo.fr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220829_041458_193432_BB019DCE 
X-CRM114-Status: GOOD (  25.46  )
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



On 27/08/2022 13:42, Christophe JAILLET wrote:
> The devm_clk_get_enabled() helper:
>     - calls devm_clk_get()
>     - calls clk_prepare_enable() and registers what is needed in order to
>       call clk_disable_unprepare() when needed, as a managed resource.
> 
> This helper is well suited for cases where the clock would be kept
> prepared or enabled for the whole lifetime of the driver.
> 
> This simplifies the error handling a lot.
> 
> The order between spi_unregister_controller() (in the remove function) and
> the clk_disable_unprepare() (now handle by a  managed resource) is kept
> the same.
> (see commit 46b5c4fb87ce ("spi: mt7621: Don't leak SPI master in probe
> error path") to see why it matters)
> 
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>

Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com>

> ---
> The order with  devm_spi_release_controller() (which undoes
> devm_spi_alloc_master()) is reversed, but I don't think it is an issue.
> ---
>   drivers/spi/spi-mt7621.c | 14 +-------------
>   1 file changed, 1 insertion(+), 13 deletions(-)
> 
> diff --git a/drivers/spi/spi-mt7621.c b/drivers/spi/spi-mt7621.c
> index 351b0ef52bbc..2580b28042be 100644
> --- a/drivers/spi/spi-mt7621.c
> +++ b/drivers/spi/spi-mt7621.c
> @@ -327,7 +327,6 @@ static int mt7621_spi_probe(struct platform_device *pdev)
>   	struct spi_controller *master;
>   	struct mt7621_spi *rs;
>   	void __iomem *base;
> -	int status = 0;
>   	struct clk *clk;
>   	int ret;
>   
> @@ -339,19 +338,14 @@ static int mt7621_spi_probe(struct platform_device *pdev)
>   	if (IS_ERR(base))
>   		return PTR_ERR(base);
>   
> -	clk = devm_clk_get(&pdev->dev, NULL);
> +	clk = devm_clk_get_enabled(&pdev->dev, NULL);
>   	if (IS_ERR(clk))
>   		return dev_err_probe(&pdev->dev, PTR_ERR(clk),
>   				     "unable to get SYS clock\n");
>   
> -	status = clk_prepare_enable(clk);
> -	if (status)
> -		return status;
> -
>   	master = devm_spi_alloc_master(&pdev->dev, sizeof(*rs));
>   	if (!master) {
>   		dev_info(&pdev->dev, "master allocation failed\n");
> -		clk_disable_unprepare(clk);
>   		return -ENOMEM;
>   	}
>   
> @@ -376,13 +370,10 @@ static int mt7621_spi_probe(struct platform_device *pdev)
>   	ret = device_reset(&pdev->dev);
>   	if (ret) {
>   		dev_err(&pdev->dev, "SPI reset failed!\n");
> -		clk_disable_unprepare(clk);
>   		return ret;
>   	}
>   
>   	ret = spi_register_controller(master);
> -	if (ret)
> -		clk_disable_unprepare(clk);
>   
>   	return ret;
>   }
> @@ -390,13 +381,10 @@ static int mt7621_spi_probe(struct platform_device *pdev)
>   static int mt7621_spi_remove(struct platform_device *pdev)
>   {
>   	struct spi_controller *master;
> -	struct mt7621_spi *rs;
>   
>   	master = dev_get_drvdata(&pdev->dev);
> -	rs = spi_controller_get_devdata(master);
>   
>   	spi_unregister_controller(master);
> -	clk_disable_unprepare(rs->clk);
>   
>   	return 0;
>   }

