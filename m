Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD664C433FE
	for <linux-mediatek@archiver.kernel.org>; Thu,  6 Oct 2022 18:13:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DPvMVkgPdsNf80rz7k0a5WRJw4bKxleUIlz2BgflFH8=; b=C0id7varzzf2LThWqEVfG/d0iZ
	mZY2DEPa8uSnBUrLzPbx+eX7MM4TQcB75XjeQJySQmoBYSvQMJp2WZogQRBlZ/PtUk9SA5mf1USYK
	KVp0Zx79hN7V2xPa/qAHfMAzHvCxgoWSHBstW7ky7L+mLIZCuG6SQ/BOEvoBAU2cTUTtTFXKvg9a+
	8GkKfpJOtdmayOikX33g/udIzarneN5GILYYq+Lilfz58cndR0rMpl8TfDBbwuoj+9HRyDKl+Ot4X
	1B2PQxwlT0f2K1Kt/QIS4IhgDyFUbMntRaMSAz9YqmZ5Vmjx6Az/ojuSxrCIAlnVLKvG9gxzgqD+k
	iLHyETkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ogVNJ-004Old-4R; Thu, 06 Oct 2022 18:13:37 +0000
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ogVN9-004OWF-3N; Thu, 06 Oct 2022 18:13:28 +0000
Received: by mail-pl1-x636.google.com with SMTP id l1so2391569pld.13;
        Thu, 06 Oct 2022 11:12:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DPvMVkgPdsNf80rz7k0a5WRJw4bKxleUIlz2BgflFH8=;
        b=qiwpMb5sCiOOvdw8s4nYdgUGzTk18rO6iLScxPrheyllF+geonkIrPRddQ6cwQH4pc
         mB31K9yGLj9S2eo7MR0SU+fSAXJ3hsUt4TXENovPuH6MdzIFYUfaq1Hj7DVs18//KA0C
         M3g5hGc9hKHGOu0mCOG53waM9tBhEjYXP2fhISS5LvZXZhKnaoy2kIiqvVaoNDqkwEyR
         SlWRvwgs6Syh4pSkYwYdR+4JsVyvYTop8YUKW1f15xKfWuuk9VyXUsLYcGZODsR/s6Zs
         7zMdK6aIVUGuNgMslpPJjZ4HxeoGBhyNGFTFnrHsm10DfX2Zck2RB/TBS/n/St8xniwW
         VQTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DPvMVkgPdsNf80rz7k0a5WRJw4bKxleUIlz2BgflFH8=;
        b=ot5e3L3EipDgFs7mZa9TQW+5YbvnXpZ8B4q+dl6MYcDOfAC170zZN4UV9FlfN0OtZK
         ij2EyVGXpGI7QWPhLasD0b6FUmpYid+boA1oL2qN75gaV8nvgHALmxpadtDKzIzco3nG
         TJA2tJoYey62+71fwQNSaf8F8ecVvNPXqYf8xqjXGjFeDTamYVKqwBNuIrDu7avRF7sR
         5ZhdTFrr6/5jiXHwU7IVU3hLJlypovTQVtJf34YsyWhHwkft2LgZEl9R6T8JlrhgwoMr
         4rekzdBk1TGz5bcrVKJIBbu4C1j1eawRuGQUTgYaQKQY/qxZbxehVIWursXAVmB154gy
         h4sw==
X-Gm-Message-State: ACrzQf2rpK3oFlNktbrYualDng/DAysvGvuuGOeTs6yuHcGsUvP/thKf
	W95PZjGHms7aj3mU2EnSiFk=
X-Google-Smtp-Source: AMsMyM4KyrcrFHmKtPHVDrezSvqbeuuip0f3OCMsAV0JwH2L8T6IIqzdzWEOKogxHO36cFnHopaWAA==
X-Received: by 2002:a17:90b:3b47:b0:202:d9d4:23f7 with SMTP id ot7-20020a17090b3b4700b00202d9d423f7mr11794193pjb.56.1665079975573;
        Thu, 06 Oct 2022 11:12:55 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id w191-20020a627bc8000000b00560e5da42d5sm9068974pfc.201.2022.10.06.11.12.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Oct 2022 11:12:54 -0700 (PDT)
Date: Thu, 6 Oct 2022 11:12:53 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
Cc: Wim Van Sebroeck <wim@linux-watchdog.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Rob Herring <robh+dt@kernel.org>, nfraprado@collabora.com,
	angelogioacchino.delregno@collabora.com,
	Project_Global_Chrome_Upstream_Group@mediatek.com,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org
Subject: Re: [PATCH 7/8] watchdog: mtk_wdt: Add support for MT6795 Helio X10
 watchdog and toprgu
Message-ID: <20221006181253.GA761987@roeck-us.net>
References: <20221006120715.24815-1-allen-kh.cheng@mediatek.com>
 <20221006120715.24815-8-allen-kh.cheng@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221006120715.24815-8-allen-kh.cheng@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221006_111327_185211_0E5AD546 
X-CRM114-Status: GOOD (  18.11  )
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

On Thu, Oct 06, 2022 at 08:07:14PM +0800, Allen-KH Cheng wrote:
> From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> 
> Add support for the toprgu reset controller and watchdog for the
> MediaTek MT6795 SoC.
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> Co-developed-by: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
> Signed-off-by: Allen-KH Cheng <allen-kh.cheng@mediatek.com>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

> ---
>  drivers/watchdog/mtk_wdt.c | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/drivers/watchdog/mtk_wdt.c b/drivers/watchdog/mtk_wdt.c
> index e97787536792..5fa42b7d4b4d 100644
> --- a/drivers/watchdog/mtk_wdt.c
> +++ b/drivers/watchdog/mtk_wdt.c
> @@ -10,6 +10,7 @@
>   */
>  
>  #include <dt-bindings/reset/mt2712-resets.h>
> +#include <dt-bindings/reset/mediatek,mt6795-resets.h>
>  #include <dt-bindings/reset/mt7986-resets.h>
>  #include <dt-bindings/reset/mt8183-resets.h>
>  #include <dt-bindings/reset/mt8186-resets.h>
> @@ -78,6 +79,10 @@ static const struct mtk_wdt_data mt2712_data = {
>  	.toprgu_sw_rst_num = MT2712_TOPRGU_SW_RST_NUM,
>  };
>  
> +static const struct mtk_wdt_data mt6795_data = {
> +	.toprgu_sw_rst_num = MT6795_TOPRGU_SW_RST_NUM,
> +};
> +
>  static const struct mtk_wdt_data mt7986_data = {
>  	.toprgu_sw_rst_num = MT7986_TOPRGU_SW_RST_NUM,
>  };
> @@ -426,6 +431,7 @@ static int mtk_wdt_resume(struct device *dev)
>  static const struct of_device_id mtk_wdt_dt_ids[] = {
>  	{ .compatible = "mediatek,mt2712-wdt", .data = &mt2712_data },
>  	{ .compatible = "mediatek,mt6589-wdt" },
> +	{ .compatible = "mediatek,mt6795-wdt", .data = &mt6795_data },
>  	{ .compatible = "mediatek,mt7986-wdt", .data = &mt7986_data },
>  	{ .compatible = "mediatek,mt8183-wdt", .data = &mt8183_data },
>  	{ .compatible = "mediatek,mt8186-wdt", .data = &mt8186_data },
> -- 
> 2.18.0
> 

