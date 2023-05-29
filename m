Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36E73C77B7A
	for <linux-mediatek@archiver.kernel.org>; Mon, 29 May 2023 10:43:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TlXsffIo/L+kqdH7G4cgKFcqeg5Ddsyfs99NjT62XR0=; b=mbzOwoLXBdjjqLlJlsX4o8r2lO
	mBGmflZVWSDxYjzXk/qzFrPxsmPLdW06rYMH16mNwniyfWXnCY/CdhttXiSq4q+m+m1Q+q6aReD/x
	JMkoL75AFYV7xrLNVOLuhUOJR1k6/nfYjarUosvkRrbDfLj+ACQ9aHW61DoYxtl8H8JXUYxWwxuYu
	2s1lF1rPH3m2aNJ9QE2ZfStK2UB13sqPRfnZLyr0644zwQqjpkidO95MmPRBDOkcuJFAy49xkQVbi
	Dl+ad7/bt+2LOvwiQdQ1iFOPB/HlnF4OjAnZEF0AafthJi9jqC3kEnwafoCtRByDJsEM0QqG0Kpu2
	I7vfuYGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q3aLc-00A9yP-2k;
	Mon, 29 May 2023 10:43:32 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q3aLZ-00A9w0-1e;
	Mon, 29 May 2023 10:43:30 +0000
Received: by mail-wr1-x432.google.com with SMTP id ffacd0b85a97d-30a892c45c4so1821671f8f.3;
        Mon, 29 May 2023 03:43:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685357006; x=1687949006;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=TlXsffIo/L+kqdH7G4cgKFcqeg5Ddsyfs99NjT62XR0=;
        b=EnvTo00wkAKLMtoqFGLvi4W/YB7706/2c8SCT0SwMNQ3+pkfme8KI4yEiYWFlVqCAq
         d945IbI9mN7zA8SlLc/zgkBmLP5haKZIgMBg82pOiGMzYcOw099B1l3X8v7APSYbaeDo
         31foG6mi/PrfAShYbpKynBiEIdG3vjBrLtjskeW7619fwiOIBJSbpgFrGp2PzFFh8lF7
         hhS+r7Q3GOUARarEoG71NOf9mFEHZ0tqBl5yEEPFBhpl3lM174god86ZZz4JgxvRgFLY
         0sav5dPH69qTaUyDsS9uOCY4XvjIezh1mmql9jHAUlIdq8jvOolQqahEgdQqKK6VGsds
         TIfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685357006; x=1687949006;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TlXsffIo/L+kqdH7G4cgKFcqeg5Ddsyfs99NjT62XR0=;
        b=fN389UlDBceCqJjM61/6X66WgG42tJcMoTo5CJJT7+5Pl8WRPsuC9tplbqYdhz1FfS
         ViUPGbaC3O0xiYK2VcH6do0MJpyXOSm6cxw323wiyCEYyIm6uYa1MMzkK6TT5ZXDkyr3
         VMZU3eeggC7ZqdhqwoGzro2cC+H1MvYyxQmVskwd2fG11yfeHkq/KOPL+iFlOmSg1XLk
         oWzLGkix+vuiPNncyU2+ScmUBPctJ1++yhQP2LYG9efA4EnwVGlh9f2G7FaD0LAOHucf
         55wd8AsZ7euTPZgfDc5qh2rEhfcZ5TmB+ePlTz/mYzegY6yY09iNbjipYTGNPC8uNupX
         ZXFg==
X-Gm-Message-State: AC+VfDzfrR1/xZG2kq5+hWFvyeRiFiYAiUK7yV4uMQJcWcsQqn5FXMjJ
	tAOMwyVAf+sO1izz/h2hihE=
X-Google-Smtp-Source: ACHHUZ7CjLIg3UX/43lAqvLYo2kYHppv7AAeFOm98QxZc1G1aJsABrKHd8VUKghu08PFLHVkTkjQfw==
X-Received: by 2002:a5d:5086:0:b0:309:1532:8287 with SMTP id a6-20020a5d5086000000b0030915328287mr8940723wrt.19.1685357005863;
        Mon, 29 May 2023 03:43:25 -0700 (PDT)
Received: from [192.168.2.177] ([207.188.167.132])
        by smtp.gmail.com with ESMTPSA id r6-20020adff706000000b0030903371ef9sm13399824wrp.22.2023.05.29.03.43.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 May 2023 03:43:24 -0700 (PDT)
Message-ID: <0ff74fff-9e48-e2a6-617c-13d4cfc2e157@gmail.com>
Date: Mon, 29 May 2023 12:43:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v2] pwm: mtk_disp: Fix the disable flow of disp_pwm
Content-Language: en-US, ca-ES, es-ES
To: Shuijing Li <shuijing.li@mediatek.com>, thierry.reding@gmail.com,
 u.kleine-koenig@pengutronix.de, angelogioacchino.delregno@collabora.com
Cc: devicetree@vger.kernel.org, linux-pwm@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com, jitao.shi@mediatek.com
References: <20230518115258.14320-1-shuijing.li@mediatek.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <20230518115258.14320-1-shuijing.li@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230529_034329_547655_937077F2 
X-CRM114-Status: GOOD (  20.03  )
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



On 18/05/2023 13:52, Shuijing Li wrote:
> There is a flow error in the original mtk_disp_pwm_apply() function.
> If this function is called when the clock is disabled, there will be a
> chance to operate the disp_pwm register, resulting in disp_pwm exception.
> Fix this accordingly.
> 
> Signed-off-by: Shuijing Li <shuijing.li@mediatek.com>

We are missing a fixes tag here.
Fixes: 888a623db5d0 ("pwm: mtk-disp: Implement atomic API .apply()")


with that:
Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com>

> ---
> Changes in v2:
> Use
> if (A && B) {
> 	something();
> }
> instead of
> if (A) {
> 	if (B) {
> 		something();
> 	}
> }
> per suggestion from the previous thread:
> https://lore.kernel.org/lkml/20230515140346.bxeu6xewi6a446nd@pengutronix.de/
> ---
>   drivers/pwm/pwm-mtk-disp.c | 13 +++++--------
>   1 file changed, 5 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/pwm/pwm-mtk-disp.c b/drivers/pwm/pwm-mtk-disp.c
> index 79e321e96f56..2401b6733241 100644
> --- a/drivers/pwm/pwm-mtk-disp.c
> +++ b/drivers/pwm/pwm-mtk-disp.c
> @@ -79,14 +79,11 @@ static int mtk_disp_pwm_apply(struct pwm_chip *chip, struct pwm_device *pwm,
>   	if (state->polarity != PWM_POLARITY_NORMAL)
>   		return -EINVAL;
>   
> -	if (!state->enabled) {
> -		mtk_disp_pwm_update_bits(mdp, DISP_PWM_EN, mdp->data->enable_mask,
> -					 0x0);
> -
> -		if (mdp->enabled) {
> -			clk_disable_unprepare(mdp->clk_mm);
> -			clk_disable_unprepare(mdp->clk_main);
> -		}
> +	if (!state->enabled && mdp->enabled) {
> +		mtk_disp_pwm_update_bits(mdp, DISP_PWM_EN,
> +					 mdp->data->enable_mask, 0x0);
> +		clk_disable_unprepare(mdp->clk_mm);
> +		clk_disable_unprepare(mdp->clk_main);
>   
>   		mdp->enabled = false;
>   		return 0;

