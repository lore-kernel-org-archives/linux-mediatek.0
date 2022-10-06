Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F257DC4332F
	for <linux-mediatek@archiver.kernel.org>; Thu,  6 Oct 2022 18:16:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=INuwAkmrXHqnSNjAnlxKdqABDBx0o7c8IwuxVAwc7ks=; b=tDcG+WyasD02rYjADjDUxRhpCI
	J1JIt2wG3/iNmsdpbuVmwhSNrX5RbsLktolmGeWcfPKvCmHpaYuyQe3C/v5FlR8MA3PxJjVrjzTYd
	cEPU+JrCGaRhmVJlAqnrehGW5Sq8eEOMcmUtgJ7MfW1n67y0tBKruPlHuvTBdc49NT9gswsn2h3sp
	/gcXFyPQdaepLCmgCMpLW/+evT/2mwoLJZbgvKKZx66FY/vHOL1xRFnXdu0rKyjYJs45kwD5IEj+0
	30CSBPmFS8VGR5m9wB5nPZBPQczNfpPSy40ieP9b4oznepSNmI8GRPChPTUgQEkoO3XS5G4Tt69k6
	z/DWB21Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ogVPo-004PtY-5K; Thu, 06 Oct 2022 18:16:12 +0000
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ogVPb-004PoB-Rj; Thu, 06 Oct 2022 18:16:01 +0000
Received: by mail-pl1-x62e.google.com with SMTP id d24so2445933pls.4;
        Thu, 06 Oct 2022 11:15:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=INuwAkmrXHqnSNjAnlxKdqABDBx0o7c8IwuxVAwc7ks=;
        b=DJ1zlZzwwZ3npaG7z4VyIw6AXG5DKyK43lDsBwzClOf1w79t3Qn3/E/1iidGT5YaAX
         oRHFN4DWlUuNbOt/9rcuHh21i98fpXO9eqR0bVdeF5g6kQKlfLWYk/lH6hrw+Lwg834d
         Q9yjllg6CuB0s5kaoQF1RR4mXcLc6m72Pq00CRY2nvFJpS+/CnY2mLjeYXg9J+gZDnzg
         wziIrRf8yg+JZxMyQvnZQrs85lCd/dNXPBLeO/z3aIt50z4alkQGIUdyJQoLLQMmRIbk
         Q9MewppXq5UU9Q0gR5HeMzlm3LDdWDvkN6uPtMgncsS+w9DXH347yMLAFREDFjCttk+z
         JKJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=INuwAkmrXHqnSNjAnlxKdqABDBx0o7c8IwuxVAwc7ks=;
        b=Lv9zMcYpBr6wulkvlSkYqnAAnaUZT6cCfczra7dvyU9v0ZVuPjnxS+T+o3r7FRfACM
         xJAfRfUf32IaAjwZ8JtSliFyPWLVpDv2dnqu+ijhkaok2V+H20IiAOnpL2oTwmIMGepq
         XHmoI6LUF8uhd2Get2NKNTdD9M5KSnuTPFK63q3r3OsEEzM/fKZDbKPsiMEcyHzDmIvW
         AN6ANgzypCgC2BHejynSQgY0/iMYg3ds9+8ogaXmarU93onVeeR0LFIYNWdl+bu5Qbu+
         q3oyceAlZ1DFbbuRAA5GJe9z6cO/cROcpBXto2X6xvskX8lNxe7ROb/lKi2pJa0B45BF
         Uu9w==
X-Gm-Message-State: ACrzQf2AbRKzaY2KXk2rX6etiYtJp/hs6wuUZwJvvVDqKsOvC2t0OE/t
	Qekgfv+Kqfo2qJp2wR+sIVA=
X-Google-Smtp-Source: AMsMyM6c64HgA/XQXZ3v7axjSYazhpsFlm79JcdUGoueQB46M8UKKFfOXW67AIijeqJSBFg6kzqueA==
X-Received: by 2002:a17:903:32ce:b0:17f:75dd:de88 with SMTP id i14-20020a17090332ce00b0017f75ddde88mr1091980plr.5.1665080157064;
        Thu, 06 Oct 2022 11:15:57 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id d19-20020a631d53000000b00440507bb7fcsm54117pgm.31.2022.10.06.11.15.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Oct 2022 11:15:55 -0700 (PDT)
Date: Thu, 6 Oct 2022 11:15:54 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: wim@linux-watchdog.org, robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org, matthias.bgg@gmail.com,
	allen-kh.cheng@mediatek.com, seiya.wang@mediatek.com,
	tinghan.shen@mediatek.com, linux-watchdog@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 5/5] watchdog: mtk_wdt: Add support for MT6795 Helio X10
 watchdog and toprgu
Message-ID: <20221006181554.GA762091@roeck-us.net>
References: <20221005113517.70628-1-angelogioacchino.delregno@collabora.com>
 <20221005113517.70628-6-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221005113517.70628-6-angelogioacchino.delregno@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221006_111559_914167_6704EA4D 
X-CRM114-Status: GOOD (  16.50  )
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

On Wed, Oct 05, 2022 at 01:35:17PM +0200, AngeloGioacchino Del Regno wrote:
> Add support for the toprgu reset controller and watchdog for the
> MediaTek MT6795 SoC.
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

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
> 2.37.2
> 

