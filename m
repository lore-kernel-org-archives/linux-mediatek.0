Return-Path: <SRS0=h4nU=NZ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DFC03C433EF
	for <linux-mediatek@archiver.kernel.org>; Fri,  3 Sep 2021 21:00:30 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 66159610FD
	for <linux-mediatek@archiver.kernel.org>; Fri,  3 Sep 2021 21:00:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 66159610FD
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sntech.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KgN2tmF9qnPSHjDMFBYeMCSrCxfUX5YjUJdntWh1Kb0=; b=bf+MvLqz/KHAzk
	LufnuwdGC9wXph1boq5jccE5eDlPnZ2QKdSIly0njXQejY0ZSKUHZ1Xn6KoeskeYKRXGXmCKheJDo
	vh7HIKuEiqpJJaqIcKIXIXGOKh4h7m668fOvEYcQYZim5chS2qyvuNJZL/D/RIUiHHcLnDK65bqPd
	OSDu7VH9sx/Rul4cj9kSXQZfMcwNaiWdYnQMZzx0sgZ73laB5TvRJETWIqA4KQXdB0t+QWld6qRQ5
	Fq9BUVqermZz94noNcCT+w5HsrNqwj4gQGdo7xrbPpDCcqVUSe+VEvcvsn4ULgLdJG9zm5emiPCEe
	mr8qr6Rkk3TAzCHf+/sw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mMGIM-00Cy9l-Mw; Fri, 03 Sep 2021 21:00:18 +0000
Received: from gloria.sntech.de ([185.11.138.130])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mMGI8-00Cy6T-Rd; Fri, 03 Sep 2021 21:00:06 +0000
Received: from ip5f5a6e92.dynamic.kabel-deutschland.de ([95.90.110.146]
 helo=diego.localnet)
 by gloria.sntech.de with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <heiko@sntech.de>)
 id 1mMGI2-0007Iw-D3; Fri, 03 Sep 2021 22:59:58 +0200
From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To: Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Miles Chen <miles.chen@mediatek.com>
Cc: linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, wsd_upstream@mediatek.com,
 Miles Chen <miles.chen@mediatek.com>
Subject: Re: [PATCH] clk: rockchip: use module_platform_driver_probe
Date: Fri, 03 Sep 2021 22:59:57 +0200
Message-ID: <1764446.vrLGdHa7mH@diego>
In-Reply-To: <20210902075713.7563-1-miles.chen@mediatek.com>
References: <20210902075713.7563-1-miles.chen@mediatek.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210903_140004_950806_B1274FAE 
X-CRM114-Status: GOOD (  16.08  )
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

Am Donnerstag, 2. September 2021, 09:57:13 CEST schrieb Miles Chen:
> Replace builtin_platform_driver_probe with module_platform_driver_probe
> because that rk3399 and rk3568 can be built as kernel modules.
> 
> Cc: Stephen Boyd <sboyd@kernel.org>
> Signed-off-by: Miles Chen <miles.chen@mediatek.com>

on both rk3399 and rk3568:
Tested-by: Heiko Stuebner <heiko@sntech.de>

and also
Reviewed-by: Heiko Stuebner <heiko@sntech.de>


Heiko

> ---
>  drivers/clk/rockchip/clk-rk3399.c | 2 +-
>  drivers/clk/rockchip/clk-rk3568.c | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/clk/rockchip/clk-rk3399.c b/drivers/clk/rockchip/clk-rk3399.c
> index 62a4f2543960..a5169156f1d2 100644
> --- a/drivers/clk/rockchip/clk-rk3399.c
> +++ b/drivers/clk/rockchip/clk-rk3399.c
> @@ -1653,7 +1653,7 @@ static struct platform_driver clk_rk3399_driver = {
>  		.suppress_bind_attrs = true,
>  	},
>  };
> -builtin_platform_driver_probe(clk_rk3399_driver, clk_rk3399_probe);
> +module_platform_driver_probe(clk_rk3399_driver, clk_rk3399_probe);
>  
>  MODULE_DESCRIPTION("Rockchip RK3399 Clock Driver");
>  MODULE_LICENSE("GPL");
> diff --git a/drivers/clk/rockchip/clk-rk3568.c b/drivers/clk/rockchip/clk-rk3568.c
> index 75ca855e720d..939e7079c334 100644
> --- a/drivers/clk/rockchip/clk-rk3568.c
> +++ b/drivers/clk/rockchip/clk-rk3568.c
> @@ -1719,7 +1719,7 @@ static struct platform_driver clk_rk3568_driver = {
>  		.suppress_bind_attrs = true,
>  	},
>  };
> -builtin_platform_driver_probe(clk_rk3568_driver, clk_rk3568_probe);
> +module_platform_driver_probe(clk_rk3568_driver, clk_rk3568_probe);
>  
>  MODULE_DESCRIPTION("Rockchip RK3568 Clock Driver");
>  MODULE_LICENSE("GPL");
> 





_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
