Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F5DFC05027
	for <linux-mediatek@archiver.kernel.org>; Thu, 26 Jan 2023 15:08:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DL7X89T/Jk5kKIKwpMckofyzxBzvw1DE/W7nHUef/LM=; b=pKM0sZKden+qWP5d3Godz+fHAH
	gOozPQW0E4cwlAk0RoeRMUQAdZ+JCcoiaCaxCSOwcQE9p4QXkoMY3cRGuw5/yAaigmq4PWKs7njB0
	FnB8gRd69E9aWnAhevDSh6Ou+0FTB0XIvFahiAYcCbT7zRxaeWrntTTMSgGX78w+oTs5ylHAUhygN
	2ZYaxzEYwyMwKcaM33W3iBprT9fEeIwinyg/P3ibvGl88GzqKgtt9LfPTCmB2VzP3LutBSd194Sj6
	tPWgF7ZGOgxLc1QuxZ9StzBYzGk3BNYYvJVPwurA97aA7ZWF0x1+HXmWnAOPI9E5hbefZEaeJRAJX
	Jsx6Ykww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pL3qx-00BOyJ-FI; Thu, 26 Jan 2023 15:07:51 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pL3qL-00BOgt-Dx; Thu, 26 Jan 2023 15:07:19 +0000
Received: from notapiano (unknown [IPv6:2600:4041:5b1a:cd00:524d:e95d:1a9c:492a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nfraprado)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 1D9B06602E6E;
	Thu, 26 Jan 2023 15:07:09 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1674745630;
	bh=Ky0b++ybJbVNuqVRHMRXowRfT9Paz4o9u/pczWd8hKo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jCpm+mYDIaxj7I2OC4CjFRbivVH6XZY67zfCXl03rs+PYEeANB6wRvyngXR7Uc1uB
	 VqqKnzMDwLOfNM+epFVDoiGbrftbZ25h3gGbbOcLRq2pi6yFAdsE2qnPbTLFwFpc2r
	 xfToxQAH0Me5WUp5Nh+f3YOzCOcubTwbcYbCwACpsdO+RiqW+mhPBbs8IZ5j6fvCGJ
	 vLCdVJMOnmEzq9Z3ikc09nnSLYFi5zY+XTJHjMpF52KRCCwT3MMZcJzWp6owZGR8DR
	 HOUrXZ5DX+QvArVPZSSM28TRJC9ZhG5kmIinqnabTdy3a/PQoGhKmzLAMGcseUsHpd
	 iKBNiLnhP8DUw==
Date: Thu, 26 Jan 2023 10:06:50 -0500
From: =?utf-8?B?TsOtY29sYXMgRi4gUi4gQS4=?= Prado <nfraprado@collabora.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: thierry.reding@gmail.com, u.kleine-koenig@pengutronix.de,
	matthias.bgg@gmail.com, weiqing.kong@mediatek.com,
	jitao.shi@mediatek.com, linux-pwm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
	kernel@collabora.com
Subject: Re: [PATCH 1/2] pwm: mtk-disp: Disable shadow registers before
 setting backlight values
Message-ID: <20230126150203.dnsbw2l2fzyg3oi5@notapiano>
References: <20230123160615.375969-1-angelogioacchino.delregno@collabora.com>
 <20230123160615.375969-2-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230123160615.375969-2-angelogioacchino.delregno@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230126_070713_682119_390EC671 
X-CRM114-Status: GOOD (  19.38  )
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

On Mon, Jan 23, 2023 at 05:06:14PM +0100, AngeloGioacchino Del Regno wrote:
> If shadow registers usage is not desired, disable that before performing
> any write to CON0/1 registers in the .apply() callback, otherwise we may
> lose clkdiv or period/width updates.
> 
> Fixes: cd4b45ac449a ("pwm: Add MediaTek MT2701 display PWM driver support")
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
>  drivers/pwm/pwm-mtk-disp.c | 24 +++++++++++++-----------
>  1 file changed, 13 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/pwm/pwm-mtk-disp.c b/drivers/pwm/pwm-mtk-disp.c
> index 692a06121b28..82b430d881a2 100644
> --- a/drivers/pwm/pwm-mtk-disp.c
> +++ b/drivers/pwm/pwm-mtk-disp.c
> @@ -138,6 +138,19 @@ static int mtk_disp_pwm_apply(struct pwm_chip *chip, struct pwm_device *pwm,
>  	high_width = mul_u64_u64_div_u64(state->duty_cycle, rate, div);
>  	value = period | (high_width << PWM_HIGH_WIDTH_SHIFT);
>  
> +	if (mdp->data->bls_debug && !mdp->data->has_commit) {
> +		/*
> +		 * For MT2701, disable double buffer before writing register

Not necessarily part of this series, but I guess it would make sense to remove
the "For MT2701". It's no longer exclusive to that SoC and the condition in the
if above makes it clear when this happens.

Reviewed-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
Tested-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>

On MT8192 Asurada Spherion.

Thanks,
Nícolas

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
>  	mtk_disp_pwm_update_bits(mdp, mdp->data->con0,
>  				 PWM_CLKDIV_MASK,
>  				 clk_div << PWM_CLKDIV_SHIFT);
> @@ -152,17 +165,6 @@ static int mtk_disp_pwm_apply(struct pwm_chip *chip, struct pwm_device *pwm,
>  		mtk_disp_pwm_update_bits(mdp, mdp->data->commit,
>  					 mdp->data->commit_mask,
>  					 0x0);
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
>  	}
>  
>  	mtk_disp_pwm_update_bits(mdp, DISP_PWM_EN, mdp->data->enable_mask,
> -- 
> 2.39.0
> 
> 

