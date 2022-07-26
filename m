Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8468DC43334
	for <linux-mediatek@archiver.kernel.org>; Tue, 26 Jul 2022 08:38:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=B6DEMn3hYz41j569CkR+YFJd1hPBVvnweT2sOXXUE8A=; b=iKQJFCRdmRhHr2ZQE1skcvNU20
	8GKopRA0jSjXJOlz2+gTJPzaJE6J6h83dbrtl7WvddBvCFcTWP6z5R4wlvfHZ7qZG9+fBzuYKjGIw
	dtXLzchZCFVXqPqiPBlckPMeH+wBSuAyMS4qCPddfNA9gbjty96C3NlGhRlbdJfC0lx/Sq8yRCyUa
	4T/wZjEtl8ILTL2ZO6uhT9CkCDCtuEusSFOdCKyRJ80Wg+uU9vfyPrCroY/+NnUbIUzT097Ka5pnG
	SqTgYGIMgcEDm64mTvphF9MJiJRuANRZJ8mTqysECA0EBzAxJ5GUil3mLMCGv2T+aBgICa+vlzco6
	EuhVQYEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oGG5D-00ALY3-Go; Tue, 26 Jul 2022 08:38:27 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oGG4j-00AL2s-OQ; Tue, 26 Jul 2022 08:37:59 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 4C9B56601B15;
	Tue, 26 Jul 2022 09:37:53 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1658824673;
	bh=0hpTpMu1PlsmFVxK/jUIe3xEx9/IlTDGkldyO8mPlWw=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=WE6vLudeCO1T//X5ucDe+PsHvpbMiHR+a7knzIQXw8lisYxk40D3fY1zycQZp2yIP
	 zhqKqDR2/HKQsYJa03BOZ5B5og6aLy7h31ZiMc3vlULLEPWdfL7BmAsB6ype+uc0ZA
	 Clu9OYgisWCgymKoHX1nTUIYtx9288MtXSECy1mJYLfHY+khj3f0dA+U8egZjjCTPh
	 S9FklaS6ju4XZXVIC6dU+91WarMuUD8vL5HLmWXtiAzOc5CDbS2LZ82kZXBFtPqr4B
	 iLe9J+XmOwouJrqI6tS8wDDBP2LBCvKwG5HWC14EJIniikOg2jEGWq453LQpIgYSRE
	 KyhNHChf32Hxw==
Message-ID: <91613700-3335-7499-1b48-3d88edd9da36@collabora.com>
Date: Tue, 26 Jul 2022 10:37:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH] watchdog: mtk_wdt: Move mt6589-wdt fallback compatible to
 end of list
Content-Language: en-US
To: Chen-Yu Tsai <wenst@chromium.org>,
 Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck
 <linux@roeck-us.net>, Matthias Brugger <matthias.bgg@gmail.com>,
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-watchdog@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20220726062057.320342-1-wenst@chromium.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220726062057.320342-1-wenst@chromium.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220726_013757_975718_CC5EE4C7 
X-CRM114-Status: GOOD (  26.66  )
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

Il 26/07/22 08:20, Chen-Yu Tsai ha scritto:
> The watchdog facility in the MediaTek SoCs are all the same, but the
> hardware block also contains a reset controller, which differs in the
> number of resets used between different SoCs. This difference is
> supported with of_device_get_match_data() supplying the number of reset
> lines for the newer compatible strings. The original mt6589-wdt only
> covers the watchdog facility.
> 
> of_device_is_compatible(), and by extension of_device_get_match_data(),
> works by going through the given list of compatible strings sequentially,
> and checks if any of the device node's compatible strings match.
> 
> To avoid early matching on the "mediatek,mt6589-wdt" fallback compatible,
> which only provides watchdog functionality and no reset controller, move
> the fallback entry to the end of the list, so that other, more specific
> compatible strings have a chance at getting matched.
> 
> Fixes: c254e103082b ("watchdog: mtk_wdt: mt8183: Add reset controller")
> Fixes: adc318a34066 ("watchdog: mt8192: add wdt support")
> Fixes: 8c6b5ea6ac68 ("watchdog: mediatek: mt8195: add wdt support")
> Fixes: 4dbabc4d9e8c ("watchdog: mediatek: mt8186: add wdt support")
> Fixes: 711a5b25bac9 ("watchdog: mtk_wdt: mt7986: Add toprgu reset controller support")
> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>

Uhm, I don't think that this is an issue?

Ordering precedence is given to the list that you specify in devicetree, that's why
"the second one" is a fallback, meaning: ("impossible" example below)

compatible = "mediatek,mt8195-wdt", "mediatek,mt8183-wdt", "mediatek,mt6589-wdt";

This gets walked as per the order in which you wrote the compatibles, so:
* Check match for mt8195-wdt, does not exist?
  * Check match for mt8183-wdt, exists!
  * Put everything into dev->of_node (having mediatek,mt8183-wdt only!)

__of_device_is_compatible() gets dev->of_node and compares that to all of the
possible matches.

struct device_node for this device hence does *not* contain any of the other
compatibles that we specified in devicetree, so it does *not* contain any of
"mediatek,mt8195-wdt", or "mediatek,mt6589-wdt", because we have previously
successfully matches 8183.

I don't think that I've misinterpreted this flow, but if I have, let's pull
in devicetree people and check with them?

Cheers,
Angelo

> ---
> 
> This change complements the removal of the fallback compatible from the
> bindings and DTSI files [1].
> 
> [1] https://lore.kernel.org/linux-mediatek/20220721014845.19044-1-allen-kh.cheng@mediatek.com/
> 
>   drivers/watchdog/mtk_wdt.c | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/watchdog/mtk_wdt.c b/drivers/watchdog/mtk_wdt.c
> index e97787536792..3d5a239b93ba 100644
> --- a/drivers/watchdog/mtk_wdt.c
> +++ b/drivers/watchdog/mtk_wdt.c
> @@ -425,12 +425,13 @@ static int mtk_wdt_resume(struct device *dev)
>   
>   static const struct of_device_id mtk_wdt_dt_ids[] = {
>   	{ .compatible = "mediatek,mt2712-wdt", .data = &mt2712_data },
> -	{ .compatible = "mediatek,mt6589-wdt" },
>   	{ .compatible = "mediatek,mt7986-wdt", .data = &mt7986_data },
>   	{ .compatible = "mediatek,mt8183-wdt", .data = &mt8183_data },
>   	{ .compatible = "mediatek,mt8186-wdt", .data = &mt8186_data },
>   	{ .compatible = "mediatek,mt8192-wdt", .data = &mt8192_data },
>   	{ .compatible = "mediatek,mt8195-wdt", .data = &mt8195_data },
> +	/* Fallback compatible string must be last entry */
> +	{ .compatible = "mediatek,mt6589-wdt" },
>   	{ /* sentinel */ }
>   };
>   MODULE_DEVICE_TABLE(of, mtk_wdt_dt_ids);


-- 

