Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B326DC04AA5
	for <linux-mediatek@archiver.kernel.org>; Thu, 25 Aug 2022 13:21:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9Q+jKUSpU6kYeBsMhMpzIZThK1oQ2j5LfED+1XJW8bo=; b=SWqJZAPnknLJjP0+vM5ka3mSi2
	WiaI7Elro14ge84JFvT6rOpGU/rw5b1wEJB6v5HFxAqdzCtxQft/j2/wSGasSolta+h2iRZXEDjd9
	Z3u1x6fqNgE1kUNmI321/x65EOEKKOCRtl4xcbqvE1iWIP6wCefrPwGRgrQEEMN27Ki0/Xa4U6b2K
	tdicjCbw8+3DOleGiNpAtDdlrZuY3ux6hY1eBReWE6e+XznQdFBnBYu93e8tOD1C/RyoS3INHs1Ti
	eC0FaZ2IbTciuP/+bm/KYktIY9T6gfUbGLbzS75FQUC/sue1mPDOz6veS4R9hO1eWtONAuyMqQHS0
	G9D/knrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oRCn8-00Ejnf-Nz; Thu, 25 Aug 2022 13:21:02 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oRCn5-00Ejjy-RI
	for linux-mediatek@lists.infradead.org; Thu, 25 Aug 2022 13:21:01 +0000
Received: by mail-wm1-x334.google.com with SMTP id ay39-20020a05600c1e2700b003a5503a80cfso2515587wmb.2
        for <linux-mediatek@lists.infradead.org>; Thu, 25 Aug 2022 06:20:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc;
        bh=9Q+jKUSpU6kYeBsMhMpzIZThK1oQ2j5LfED+1XJW8bo=;
        b=NPOrDfXwhQw13PErVkRE/qRVT+13aqvs70sZW34P8u5ZPw3Xg8SlXtHWqoOR/28iAK
         ens5U16cjddk8184UsFHVQhwzz5bB/TV3Nq2ltCHUKTZ/srPrswr7HgSxFnNVwIFMJ6A
         oakgyqARdIGK7CEl7/nLf0eNdZ0SZ4iTO+hgwFUm1iUZqa/lrohhntohUrbNJF2/nS5F
         t4+c7OvfrG7QraiIfXRRN7PxBWjhqbzsWv/XOvwG8YtJ1jwm0V9TWsiXlR4Mamkt5Rlz
         E7XPGy0o9iUF7DHOu9Oszj4aU8seHqthrZu8kUFXvoun4MqDZ3zy60Tgf2qZLrEAlg2m
         KuAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=9Q+jKUSpU6kYeBsMhMpzIZThK1oQ2j5LfED+1XJW8bo=;
        b=Wn7kRL0uPdWgad0dohU2nHUxd1PECP5IMdv0jBg7OMq7WKuGkZoOCVC6mfU9icm5rs
         kAyZkgvRQjjjClkp5UOCshriLPDOyVVJOo7Evxqoyrn6ugz39bdSctCMwLHxMProdGB/
         7sa+W4JQCA2Ji3lhL4lOlX4GmsRhyzMOEVfpMNopqksffOQEn+vzBcZZLY3p+eLhBodQ
         k9UFnKnvu4yoXeZZkyuhnT5V3i0B+e31pEZSHLdIBQdkyywCmoNXfqdo0VQGgp59Js04
         EWf88UoTTHTN+QtApMHwLxzJ4DQZSf4Puwne+3hJR9/iVDQut+JlXWWawhbBEJ9se/V9
         mL0A==
X-Gm-Message-State: ACgBeo3xAZ6Cf8C1fLs60Cz3pOHq2/HiiPkvMmljp5b3BTxixkQjYhnR
	xndxvptGmejZNzl9N8nXLAc=
X-Google-Smtp-Source: AA6agR73Jf/8yWY2aQLwOFfOqTij7LcqWKBfMA6FeN1t3BfqeohIqdN4nIfexvaK23Z1rLt6dImShA==
X-Received: by 2002:a1c:a4c6:0:b0:3a6:539b:a820 with SMTP id n189-20020a1ca4c6000000b003a6539ba820mr8251907wme.128.1661433656162;
        Thu, 25 Aug 2022 06:20:56 -0700 (PDT)
Received: from [192.168.2.177] ([207.188.167.132])
        by smtp.gmail.com with ESMTPSA id l28-20020a056000023c00b00225213fd4a9sm19548439wrz.33.2022.08.25.06.20.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 25 Aug 2022 06:20:55 -0700 (PDT)
Message-ID: <ceddc502-0176-cff8-f4f6-06606c42a662@gmail.com>
Date: Thu, 25 Aug 2022 15:20:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.1.2
Subject: Re: [PATCH v2] soc: mediatek: Let PMIC Wrapper and SCPSYS depend on
 OF
Content-Language: en-US
To: Jean Delvare <jdelvare@suse.de>, linux-mediatek@lists.infradead.org
Cc: Sean Wang <sean.wang@mediatek.com>, LKML <linux-kernel@vger.kernel.org>,
 Chenglin Xu <chenglin.xu@mediatek.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
References: <20220730144833.0a0d9825@endymion.delvare>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <20220730144833.0a0d9825@endymion.delvare>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220825_062059_932265_2B0938E2 
X-CRM114-Status: GOOD (  24.58  )
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



On 30/07/2022 14:48, Jean Delvare wrote:
> With the following configuration options:
> CONFIG_OF is not set
> CONFIG_MTK_PMIC_WRAP=y
> CONFIG_MTK_SCPSYS=y
> we get the following build warnings:
> 
>    CC      drivers/soc/mediatek/mtk-pmic-wrap.o
> drivers/soc/mediatek/mtk-pmic-wrap.c:2138:34: warning: ‘of_pwrap_match_tbl’ defined but not used [-Wunused-const-variable=]
> drivers/soc/mediatek/mtk-pmic-wrap.c:1953:34: warning: ‘of_slave_match_tbl’ defined but not used [-Wunused-const-variable=]
>    CC      drivers/soc/mediatek/mtk-scpsys.o
> drivers/soc/mediatek/mtk-scpsys.c:1084:34: warning: ‘of_scpsys_match_tbl’ defined but not used [-Wunused-const-variable=]
> 
> Looking at the code, both drivers can only bind to OF-defined device
> nodes, so these drivers are useless without OF and should therefore
> depend on it.
> 
> Also drop of_match_ptr() from both drivers. We already know what it
> will resolve to, so we might as well save cpp some work.
> 
> Developers or QA teams who wish to test-build the code can still do
> so by enabling CONFIG_OF, which is available on all architectures and
> has no dependencies.
> 
> Signed-off-by: Jean Delvare <jdelvare@suse.de>
> Reported-by: kernel test robot <lkp@intel.com>
> Link: https://lore.kernel.org/all/202207240252.ZY5hSCNB-lkp@intel.com/
> Cc: Matthias Brugger <matthias.bgg@gmail.com>
> Cc: Chenglin Xu <chenglin.xu@mediatek.com>

Applied, thanks!

> ---
> Changes since v1:
>   * Drop of_match_ptr() (suggested by AngeloGioacchino Del Regno
> 
>   drivers/soc/mediatek/Kconfig         |    2 ++
>   drivers/soc/mediatek/mtk-pmic-wrap.c |    2 +-
>   drivers/soc/mediatek/mtk-scpsys.c    |    2 +-
>   3 files changed, 4 insertions(+), 2 deletions(-)
> 
> --- linux-5.18.orig/drivers/soc/mediatek/Kconfig	2022-07-28 11:22:23.098393325 +0200
> +++ linux-5.18/drivers/soc/mediatek/Kconfig	2022-07-28 11:23:58.635687065 +0200
> @@ -37,6 +37,7 @@ config MTK_INFRACFG
>   config MTK_PMIC_WRAP
>   	tristate "MediaTek PMIC Wrapper Support"
>   	depends on RESET_CONTROLLER
> +	depends on OF
>   	select REGMAP
>   	help
>   	  Say yes here to add support for MediaTek PMIC Wrapper found
> @@ -46,6 +47,7 @@ config MTK_PMIC_WRAP
>   config MTK_SCPSYS
>   	bool "MediaTek SCPSYS Support"
>   	default ARCH_MEDIATEK
> +	depends on OF
>   	select REGMAP
>   	select MTK_INFRACFG
>   	select PM_GENERIC_DOMAINS if PM
> --- linux-5.18.orig/drivers/soc/mediatek/mtk-pmic-wrap.c	2022-07-30 11:20:22.221919946 +0200
> +++ linux-5.18/drivers/soc/mediatek/mtk-pmic-wrap.c	2022-07-30 11:41:14.073038643 +0200
> @@ -2347,7 +2347,7 @@ static int pwrap_probe(struct platform_d
>   static struct platform_driver pwrap_drv = {
>   	.driver = {
>   		.name = "mt-pmic-pwrap",
> -		.of_match_table = of_match_ptr(of_pwrap_match_tbl),
> +		.of_match_table = of_pwrap_match_tbl,
>   	},
>   	.probe = pwrap_probe,
>   };
> --- linux-5.18.orig/drivers/soc/mediatek/mtk-scpsys.c	2022-07-30 11:20:22.221919946 +0200
> +++ linux-5.18/drivers/soc/mediatek/mtk-scpsys.c	2022-07-30 11:41:22.466154796 +0200
> @@ -1141,7 +1141,7 @@ static struct platform_driver scpsys_drv
>   		.name = "mtk-scpsys",
>   		.suppress_bind_attrs = true,
>   		.owner = THIS_MODULE,
> -		.of_match_table = of_match_ptr(of_scpsys_match_tbl),
> +		.of_match_table = of_scpsys_match_tbl,
>   	},
>   };
>   builtin_platform_driver(scpsys_drv);
> 

