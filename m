Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38D90C433F5
	for <linux-mediatek@archiver.kernel.org>; Fri, 14 Jan 2022 12:57:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OPcGj7qdbJuKMVXWoRLFupx28USpwyoUF7iJXlngW24=; b=tRpCgYWoMn8sR4
	COd4Zgrknn8hbYBuyn+p5/XmPeT383h6Ma0DTx4bxa/aM6+PvxlQrbVZSYj1rfuqbwguPANDfL4go
	lxRCzSjg5PhhxCbYjs2yx96O4BTOBCO6cp/hLTo4JALiz5cmAswtctTn74baXictvd171FvoflKVZ
	K754wFA69fGJQam3YkhLKpiBE68S1dF7jYy4PyUCmG2rl+vQEy5RRPeg9js+3TX5WLGndnCtVJteC
	8qmnLH3DTmj7wDkrHeOanoB9JUpt6ZD7k6IR7QKk/Tmthejz7zNz12vY3FZrLTtNpu0bRhoq5J721
	mHmkzJJ9vmOrQOax+jsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n8M8i-0098HF-Et; Fri, 14 Jan 2022 12:57:08 +0000
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n8M8V-0098DR-BT; Fri, 14 Jan 2022 12:56:56 +0000
Received: by mail-wr1-x435.google.com with SMTP id r28so15519372wrc.3;
 Fri, 14 Jan 2022 04:56:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=6+XPkUMm8vPCVvtG6187AZZdz7kVpOT0XAljAcndVfk=;
 b=Eqg+rdI5PROleZ3u1XK+eavtOp/BrisKa7wo005r7keuzmuHSUz6liVg6QTxaYkyqo
 Yp4BFeYRkA5LXxdICXYIVXKhQ6qR3vCF8K7e1xaDLsIGO8FM4N7296gUrFz2MRYfjy3w
 +oi/Z5QgaTrlwoIBWlOBtM0ayzGUITrPdRM7l156eQ5JIr41gRk7TpbMjSQJCSgP544f
 EZoDekBitnOjoth4pPa4nNcSskD7/k2tgkYzs4hicXjavrrxbMRmSp2+r3r/fvid3luk
 71c31olVXKfqCrm/zZNckMgotH0QuAeziowJyW79BD0J2YeJD8GbzlGoQ3sSokHJCywi
 /ubg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=6+XPkUMm8vPCVvtG6187AZZdz7kVpOT0XAljAcndVfk=;
 b=a2UpPyilB+k1ih9VO0+ZKrPneLaUmgrGhrrUhFur5FwoG8FXUw5LPGiPkGhxFrkxKO
 jc8jj6zFrX/DK/gPBaaE0N5P8GvEAG6aElTX99ko0jD0h4ehZOInAbCxzniELwcdFMPL
 Bk2CDPeCeIODyKCveGECXYwJWLMrPRAiysAV+Wxbv2d5PyO1VMpp9mimgB6cjbgo31PM
 qHJu0HlDk84zju/e0XbUZ66QH/ZVxdnRGmNEuSUkuoldm0J53St0kahttwLhGBObjZRn
 7l+TRhK+vu8AI1vc/n45vJkFw4A64BMGzf6xu3pY/icPgOKcAWHWObBJHfrvVSkn3s5w
 YvZQ==
X-Gm-Message-State: AOAM531zOcniQOmCpL+sb0vuPzYRtU+g+0PxYH+j3dfE+oraxjpswoMy
 p2g7wjVWvXcsWGS5oa4fbAI=
X-Google-Smtp-Source: ABdhPJyKccl9MD30RAV7WANDNOdgbomQjWho6NuISKT5xLydQxgrnwNACK6FKuKi1T+gqMjy4w8E8g==
X-Received: by 2002:adf:eed1:: with SMTP id a17mr8236811wrp.306.1642165013521; 
 Fri, 14 Jan 2022 04:56:53 -0800 (PST)
Received: from [192.168.0.22] ([37.223.145.74])
 by smtp.gmail.com with ESMTPSA id b14sm6170924wri.112.2022.01.14.04.56.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 14 Jan 2022 04:56:52 -0800 (PST)
Message-ID: <6719557c-b5a3-e6f4-3046-b53e5c229cf8@gmail.com>
Date: Fri, 14 Jan 2022 13:56:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH 2/2] watchdog: mtk_wdt: mt7986: Add toprgu reset
 controller support
Content-Language: en-US
To: Sam Shih <sam.shih@mediatek.com>,
 Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck
 <linux@roeck-us.net>, Philipp Zabel <p.zabel@pengutronix.de>,
 Rob Herring <robh+dt@kernel.org>, Ryder Lee <ryder.lee@kernel.org>,
 linux-kernel@vger.kernel.org, linux-watchdog@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 devicetree@vger.kernel.org
Cc: John Crispin <john@phrozen.org>
References: <20220105100456.7126-1-sam.shih@mediatek.com>
 <20220105100456.7126-3-sam.shih@mediatek.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <20220105100456.7126-3-sam.shih@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220114_045655_434146_6E1E6554 
X-CRM114-Status: GOOD (  15.26  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org



On 05/01/2022 11:04, Sam Shih wrote:
> Besides watchdog, the mt7986 toprgu module also provides software reset
> functionality for various peripheral subsystems
> (eg, ethernet, pcie, and connectivity)
> 
> Signed-off-by: Sam Shih <sam.shih@mediatek.com>

Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com>

> ---
>   drivers/watchdog/mtk_wdt.c | 6 ++++++
>   1 file changed, 6 insertions(+)
> 
> diff --git a/drivers/watchdog/mtk_wdt.c b/drivers/watchdog/mtk_wdt.c
> index 543cf38bd04e..c6437fe1f4c0 100644
> --- a/drivers/watchdog/mtk_wdt.c
> +++ b/drivers/watchdog/mtk_wdt.c
> @@ -10,6 +10,7 @@
>    */
>   
>   #include <dt-bindings/reset/mt2712-resets.h>
> +#include <dt-bindings/reset/mt7986-resets.h>
>   #include <dt-bindings/reset/mt8183-resets.h>
>   #include <dt-bindings/reset/mt8192-resets.h>
>   #include <dt-bindings/reset/mt8195-resets.h>
> @@ -76,6 +77,10 @@ static const struct mtk_wdt_data mt2712_data = {
>   	.toprgu_sw_rst_num = MT2712_TOPRGU_SW_RST_NUM,
>   };
>   
> +static const struct mtk_wdt_data mt7986_data = {
> +	.toprgu_sw_rst_num = MT7986_TOPRGU_SW_RST_NUM,
> +};
> +
>   static const struct mtk_wdt_data mt8183_data = {
>   	.toprgu_sw_rst_num = MT8183_TOPRGU_SW_RST_NUM,
>   };
> @@ -418,6 +423,7 @@ static int mtk_wdt_resume(struct device *dev)
>   static const struct of_device_id mtk_wdt_dt_ids[] = {
>   	{ .compatible = "mediatek,mt2712-wdt", .data = &mt2712_data },
>   	{ .compatible = "mediatek,mt6589-wdt" },
> +	{ .compatible = "mediatek,mt7986-wdt", .data = &mt7986_data },
>   	{ .compatible = "mediatek,mt8183-wdt", .data = &mt8183_data },
>   	{ .compatible = "mediatek,mt8192-wdt", .data = &mt8192_data },
>   	{ .compatible = "mediatek,mt8195-wdt", .data = &mt8195_data },
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
