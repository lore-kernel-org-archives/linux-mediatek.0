Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52DA4C7619A
	for <linux-mediatek@archiver.kernel.org>; Wed,  5 Apr 2023 09:26:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=j86FY1X3mQJSpSUEyPXpteWdgUQhvm2ft4SxXMxYnjA=; b=I+gy6gE9v2WuOPNPc1f1Zse+QD
	hj1dVdNIH9Nukea/eIh/jr4DrXIInmQ3j86OttQzEKOfZL68aDabOCkhksAy6dRNojPjq/6+tjmgx
	Dt6R5hfpR2G7IYIfppe7XG4SJngx8BgMFlzq2ozFKblY7p9vd44+afYVq+9zud+n/fxs9CwX816pX
	VA+erKe3QeJrdDOlmZ4wsCnAbBVrGmXIrIiGo53wYKg9iztiGTZuoUz4Lnzey1u2AwJjG5dNkjatU
	qyBsbpnhO8mHIONoSxS+Ji3tdkf567XCLK/axe60DpMCw6vMqHBg0sdeIz+4btRcbThSwbYVLJThC
	RSYFb9jQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pjzPa-003wbg-1E;
	Wed, 05 Apr 2023 09:26:38 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pjzPX-003waS-1r
	for linux-mediatek@lists.infradead.org;
	Wed, 05 Apr 2023 09:26:37 +0000
Received: by mail-wr1-x42d.google.com with SMTP id l27so35514735wrb.2
        for <linux-mediatek@lists.infradead.org>; Wed, 05 Apr 2023 02:26:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112; t=1680686792;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=j86FY1X3mQJSpSUEyPXpteWdgUQhvm2ft4SxXMxYnjA=;
        b=JZe6wEaenAlkzh6A+1SZGKPIIY7+28I3FbXLdAPA642CT61U15GFayMED3USy2vRur
         cnbsEM61d76fdpGl1Fp43vpXgh/pbVd1RNpCtrcxKxodCsLRcn2TD10MV6TChmFOcmxq
         bAfQZN/1MLLqUqBa5MuDi80FDwDM9rsv3Cr8bzvonlV68Q2now/PCsJPotFN5h0SDUpi
         1hSyWfVY6gTWtsYurymkF8JgnXpoxqfKd2QV368FNEQneJd0WzHoFGH6Q49synXoxzMC
         bduw8wIButE9cgIZUbMablcXnwTNxIbaY3B9Xb2wXBV6xb9UmOQhfaNb0MQWZikYiVMH
         FX1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680686792;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=j86FY1X3mQJSpSUEyPXpteWdgUQhvm2ft4SxXMxYnjA=;
        b=r/Qi/Xxa82n6Vx/NDe0lf/t/G3K+/SIOhxCaFM0tCq08tLSXdE+PVm7iB3X+Q5t8ck
         gy/m12QnmVxE2cocV/95NxZlpMgaeGAZVqIxS7Um48FOklV3UwNY/rXCTx+vRiB0TfJn
         aCr3ICMvTp5jQCfwCHgBJk2BmQkCdsbkp1a6sVXOG88ei0ddNofQhPERagIdSbnJn7Il
         FnEs4/Ap4z/pAp1gtNKwRoHYqVEydM+0nBIZgV8t1C/1GRMEIwx8m6dgh5O03xEHhDq8
         TiX7NQqOYFrUsdW6HIJZR09GlB36roG6f1VPfV7Sg2dRWMqhoy4Vo/p0CPycWcJ1KBax
         i39Q==
X-Gm-Message-State: AAQBX9c2GZ41DasNA/l4T42pxjzEIWHn7K//tOQo/296wxjHWasEPakN
	MuOBXE3LWeo4rizac8CNpr7Ofw==
X-Google-Smtp-Source: AKy350a42YeJ75k615TMGQYvStQrB2Lwyie5IHBEE2n0FdEzZ/N7NZ9pnWljziB9hk5G3LjzKvWGSA==
X-Received: by 2002:adf:e30e:0:b0:2c7:46f:c410 with SMTP id b14-20020adfe30e000000b002c7046fc410mr3314136wrj.36.1680686792347;
        Wed, 05 Apr 2023 02:26:32 -0700 (PDT)
Received: from [192.168.1.172] (158.22.5.93.rev.sfr.net. [93.5.22.158])
        by smtp.gmail.com with ESMTPSA id s12-20020adfeccc000000b002da1261aa44sm14576762wro.48.2023.04.05.02.26.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 05 Apr 2023 02:26:31 -0700 (PDT)
Message-ID: <b9c35799-7abf-116a-d0f4-531d1d3cd7b2@baylibre.com>
Date: Wed, 5 Apr 2023 11:26:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH RESEND 1/2] pwm: mtk-disp: Disable shadow registers before
 setting backlight values
Content-Language: en-US
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 thierry.reding@gmail.com
Cc: u.kleine-koenig@pengutronix.de, matthias.bgg@gmail.com,
 weiqing.kong@mediatek.com, jitao.shi@mediatek.com,
 linux-pwm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 kernel@collabora.com, wenst@chromium.org,
 =?UTF-8?Q?N=c3=adcolas_F_=2e_R_=2e_A_=2e_Prado?= <nfraprado@collabora.com>
References: <20230403133054.319070-1-angelogioacchino.delregno@collabora.com>
 <20230403133054.319070-2-angelogioacchino.delregno@collabora.com>
From: Alexandre Mergnat <amergnat@baylibre.com>
In-Reply-To: <20230403133054.319070-2-angelogioacchino.delregno@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230405_022635_618845_5995EDDC 
X-CRM114-Status: GOOD (  16.87  )
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

On 03/04/2023 15:30, AngeloGioacchino Del Regno wrote:
> If shadow registers usage is not desired, disable that before performing
> any write to CON0/1 registers in the .apply() callback, otherwise we may
> lose clkdiv or period/width updates.
> 
> Fixes: cd4b45ac449a ("pwm: Add MediaTek MT2701 display PWM driver support")
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> Reviewed-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
> Tested-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
> ---
>   drivers/pwm/pwm-mtk-disp.c | 24 +++++++++++++-----------
>   1 file changed, 13 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/pwm/pwm-mtk-disp.c b/drivers/pwm/pwm-mtk-disp.c
> index 692a06121b28..82b430d881a2 100644
> --- a/drivers/pwm/pwm-mtk-disp.c
> +++ b/drivers/pwm/pwm-mtk-disp.c
> @@ -138,6 +138,19 @@ static int mtk_disp_pwm_apply(struct pwm_chip *chip, struct pwm_device *pwm,
>   	high_width = mul_u64_u64_div_u64(state->duty_cycle, rate, div);
>   	value = period | (high_width << PWM_HIGH_WIDTH_SHIFT);
>   
> +	if (mdp->data->bls_debug && !mdp->data->has_commit) {
> +		/*
> +		 * For MT2701, disable double buffer before writing register
> +		 * and select manual mode and use PWM_PERIOD/PWM_HIGH_WIDTH.
> +		 */
> +		mtk_disp_pwm_update_bits(mdp, mdp->data->bls_debug,
> +					 mdp->data->bls_debug_mask,
> +					 mdp->data->bls_debug_mask);
> +		mtk_disp_pwm_update_bits(mdp, mdp->data->con0,
> +					 mdp->data->con0_sel,
> +					 mdp->data->con0_sel);
> +	}
> +
>   	mtk_disp_pwm_update_bits(mdp, mdp->data->con0,
>   				 PWM_CLKDIV_MASK,
>   				 clk_div << PWM_CLKDIV_SHIFT);
> @@ -152,17 +165,6 @@ static int mtk_disp_pwm_apply(struct pwm_chip *chip, struct pwm_device *pwm,
>   		mtk_disp_pwm_update_bits(mdp, mdp->data->commit,
>   					 mdp->data->commit_mask,
>   					 0x0);
> -	} else {
> -		/*
> -		 * For MT2701, disable double buffer before writing register
> -		 * and select manual mode and use PWM_PERIOD/PWM_HIGH_WIDTH.
> -		 */
> -		mtk_disp_pwm_update_bits(mdp, mdp->data->bls_debug,
> -					 mdp->data->bls_debug_mask,
> -					 mdp->data->bls_debug_mask);
> -		mtk_disp_pwm_update_bits(mdp, mdp->data->con0,
> -					 mdp->data->con0_sel,
> -					 mdp->data->con0_sel);
>   	}
>   
>   	mtk_disp_pwm_update_bits(mdp, DISP_PWM_EN, mdp->data->enable_mask,

Hi,

I've made a non-regression test for the mt8365-evk (i350-evk) board.
It's fine for me.

Reviewed-by: Alexandre Mergnat <amergnat@baylibre.com>
Tested-by: Alexandre Mergnat <amergnat@baylibre.com>

Regards,
Alex

