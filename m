Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36C0CC7619A
	for <linux-mediatek@archiver.kernel.org>; Wed,  5 Apr 2023 09:29:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5Kvyw5dfxPzoo5ahaTvmbkIzP92SGsSe2Eci+KOZOgQ=; b=WznVicQlgs34dCAYvetfNmJSOI
	BpcuL1p1ECQ9pSDYn1Yq8/NFwN1z49mGTRsCxORf//6oSKwPkRTQDGceAA+wv7UV9d+Z0eSrJ06eF
	B0ZXrWcKwpxiIO6NMBV6ThdjjbhmNjc25a1DPsuaosuAgZ2Quddt/DKPFPA0YDQpDipPQdO+DvlIn
	8jCuweaIOifklj7DMKcumoCariWCmo7IRAE/KouCLT2fIBTsYXFZaGQbDSvDKf2Rpj49M4jK3Jmrn
	n+zFoXjrpphuxp7YzCB6eezS1MjQWELqQ2MPBDIWvYOwhzxl0Aj0ONRUPs2uWDuEQn4oLJ6+XsfTL
	gb+qftlQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pjzRy-003xIX-2e;
	Wed, 05 Apr 2023 09:29:06 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pjzRw-003xF2-0W
	for linux-mediatek@lists.infradead.org;
	Wed, 05 Apr 2023 09:29:05 +0000
Received: by mail-wm1-x32c.google.com with SMTP id m6-20020a05600c3b0600b003ee6e324b19so21593150wms.1
        for <linux-mediatek@lists.infradead.org>; Wed, 05 Apr 2023 02:29:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112; t=1680686939;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5Kvyw5dfxPzoo5ahaTvmbkIzP92SGsSe2Eci+KOZOgQ=;
        b=wF1lWf2eN0nUHCgOcCLxBDuhW1WkQrs+62puD9WNVvY7Mo5D8pOZ2TSkvQCKKu167b
         D78Tc6I4UMR+qRZjENNm8ZR63xBDJ+9INVtOyo4CZP3h7ac498k/2p3iMoBEK3GscOAy
         MbjgEqn4YM0vHTtG3S1Ejkf6lOVdHZ7NgRt05J+IKT9DmaGVG8zk1HxqXRCaT5bBvQ2d
         b0ih3yx8sTfwHtEX4FncfqTCvdwAWmwRJYrTAr7tM4OR55XoP30oTy2YGWIQN3kPszTA
         aH7q20+uxSFTB4onIndCPhYM6upwYP6t8ESJL5xAtE63OOtYmm5r8CiJIU6V+ojKYOYU
         FgeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680686939;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5Kvyw5dfxPzoo5ahaTvmbkIzP92SGsSe2Eci+KOZOgQ=;
        b=L8ebpBAPrqIE9iFjMZF5geDtAUUcv0SMygwBFFWr3XnXC4JBBC3/UXodoBkcL2SH1j
         6GYZXyL3KmGeQW7pumOBrNifJn3g1TtH9/Q3yNvQOJclrSCMW+aCaYT/qlw0QtOkE9I1
         ujbzMCPRO/+o3luDenB/m2WBBC+W0jh13izxPYNvF/KXSl4sll9Z/h4eMJDsdiQ/CW/j
         2iLSU9Mr8H0i/sAp5bXnFwQ0deD2+z0dYqpudOGMsGmimD1njGmvSJ0nBNF7zdmfRNwD
         alTp/1htZj1QAPBRdXXVmurtKHh3WYz3qJ1eNbw6O2Xs+wwh8EHEfB4EzVCQg7eRqjB2
         n6Vw==
X-Gm-Message-State: AAQBX9fKZzbq6mLnC72sSOavhevuMVWMVT4bv1jKT403j6IpHhcjY93N
	fFRuVqglidzlPFSWLlgisNJg/g==
X-Google-Smtp-Source: AKy350aDTMdjfvThV2Vky13AG+hkacl/fNweYYwzs5gGLiaI7bwyGGJPmWR2lBZvoBxleaHAB1fyzw==
X-Received: by 2002:a05:600c:3644:b0:3eb:42fa:39d5 with SMTP id y4-20020a05600c364400b003eb42fa39d5mr4113162wmq.29.1680686939585;
        Wed, 05 Apr 2023 02:28:59 -0700 (PDT)
Received: from [192.168.1.172] (158.22.5.93.rev.sfr.net. [93.5.22.158])
        by smtp.gmail.com with ESMTPSA id t12-20020a7bc3cc000000b003ee42696acesm1581457wmj.16.2023.04.05.02.28.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 05 Apr 2023 02:28:59 -0700 (PDT)
Message-ID: <61c93793-1586-bba0-0f9d-f028d5d636b9@baylibre.com>
Date: Wed, 5 Apr 2023 11:28:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH RESEND 2/2] pwm: mtk-disp: Configure double buffering
 before reading in .get_state()
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
 <20230403133054.319070-3-angelogioacchino.delregno@collabora.com>
From: Alexandre Mergnat <amergnat@baylibre.com>
In-Reply-To: <20230403133054.319070-3-angelogioacchino.delregno@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230405_022904_209756_1692C901 
X-CRM114-Status: GOOD (  23.42  )
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
> The DISP_PWM controller's default behavior is to always use register
> double buffering: all reads/writes are then performed on shadow
> registers instead of working registers and this becomes an issue
> in case our chosen configuration in Linux is different from the
> default (or from the one that was pre-applied by the bootloader).
> 
> An example of broken behavior is when the controller is configured
> to use shadow registers, but this driver wants to configure it
> otherwise: what happens is that the .get_state() callback is called
> right after registering the pwmchip and checks whether the PWM is
> enabled by reading the DISP_PWM_EN register;
> At this point, if shadow registers are enabled but their content
> was not committed before booting Linux, we are *not* reading the
> current PWM enablement status, leading to the kernel knowing that
> the hardware is actually enabled when, in reality, it's not.
> 
> The aforementioned issue emerged since this driver was fixed with
> commit 0b5ef3429d8f ("pwm: mtk-disp: Fix the parameters calculated
> by the enabled flag of disp_pwm") making it to read the enablement
> status from the right register.
> 
> Configure the controller in the .get_state() callback to avoid
> this desync issue and get the backlight properly working again.
> 
> Fixes: 3f2b16734914 ("pwm: mtk-disp: Implement atomic API .get_state()")
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> Reviewed-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
> Tested-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
> ---
>   drivers/pwm/pwm-mtk-disp.c | 10 ++++++++++
>   1 file changed, 10 insertions(+)
> 
> diff --git a/drivers/pwm/pwm-mtk-disp.c b/drivers/pwm/pwm-mtk-disp.c
> index 82b430d881a2..fe9593f968ee 100644
> --- a/drivers/pwm/pwm-mtk-disp.c
> +++ b/drivers/pwm/pwm-mtk-disp.c
> @@ -196,6 +196,16 @@ static int mtk_disp_pwm_get_state(struct pwm_chip *chip,
>   		return err;
>   	}
>   
> +	/*
> +	 * Apply DISP_PWM_DEBUG settings to choose whether to enable or disable
> +	 * registers double buffer and manual commit to working register before
> +	 * performing any read/write operation
> +	 */
> +	if (mdp->data->bls_debug)
> +		mtk_disp_pwm_update_bits(mdp, mdp->data->bls_debug,
> +					 mdp->data->bls_debug_mask,
> +					 mdp->data->bls_debug_mask);
> +
>   	rate = clk_get_rate(mdp->clk_main);
>   	con0 = readl(mdp->base + mdp->data->con0);
>   	con1 = readl(mdp->base + mdp->data->con1);

Hi,

Same test.
Looks fine.

Reviewed-by: Alexandre Mergnat <amergnat@baylibre.com>
Tested-by: Alexandre Mergnat <amergnat@baylibre.com>

Regards,
Alex

