Return-Path: <SRS0=Vpwr=D2=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.0 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	NICE_REPLY_A,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 350F5C433DF
	for <linux-mediatek@archiver.kernel.org>; Mon, 19 Oct 2020 14:27:59 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id ADF3A222C3
	for <linux-mediatek@archiver.kernel.org>; Mon, 19 Oct 2020 14:27:58 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Ofl28CJ/";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="uxS9qthp"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org ADF3A222C3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=dMdzrCJ6FB/k6DC0nmrQpTMjStXVGfEvCGCil3GuLH8=; b=Ofl28CJ/pEodGd2CbkNr59xtN
	KfCtsIJpIpnT9CgrGbzhZbyFsQcidcwPlZdxUuWDRmJVMO28KJxK6bMbpzZb/G6iTtSrPUoloBSaD
	8UfqwzrX05CmQBCIovqrk9YGxq7O6tU5viIJEkxj46M9ZVKUdf2J76gsKQ9tDnLPQK+cykeiOJHwk
	NZeu+gJfdOq328gT6mUOoGjLTFhNEWx2kGFY9pz2hxd182cHV/LmzlKEIo/dvDb/wQwEGsJckm/Ds
	Y7kY1npW0mO/9z5RICI3Z5Z+j1j0clKcqsTPoF4H2ByFYMNm22pxUncQiOykPEYlYjKSSqrltem4R
	x+F9B7Tww==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kUW8Z-00006i-HA; Mon, 19 Oct 2020 14:27:47 +0000
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kUW8T-00005A-Ck; Mon, 19 Oct 2020 14:27:42 +0000
Received: by mail-wr1-x442.google.com with SMTP id n18so11717760wrs.5;
 Mon, 19 Oct 2020 07:27:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=J4XrE9HXCwR/KsIjqo1txSO+XN0eoJhfpbzWewRFJS4=;
 b=uxS9qthpVn3xJuHFts06PWunbbuZJSC4Fc/PvBwMhICn2Na9aaKscOIwWYX/J4F3Al
 ZfO670d04wzxjcAKPJsXo7WatjigwbNqg0VIf/YF8KW717LoKsIJ/hQXex4GDfWXu4Jx
 Vz20/NPw1O9Aw/FQy50u8BSKb/YwGbWBoxlK3RtUk53KjAupDw58jIp+caYbrFGXGIdP
 RgAaMsRpeB2bGZxLdf8qcCFBcwRZzPFBrdx5rTYwpVFeUwKTKaEyZ6cM+gu0zcXgTLGo
 kSkxmM7HxUqAg9dqguSYzD98ZJ5I/1TUZKeIPW4Ipm0zZ1vy+45yI0i8NlSB6JpUkOYH
 NcSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=J4XrE9HXCwR/KsIjqo1txSO+XN0eoJhfpbzWewRFJS4=;
 b=eYNN3qJ4mEHR4ItvWaJwxx2xlNe/vTV6YPHDnUSlmRjnlogPBZPkTYzz21G7jJI4pA
 gjGgqpJINiqNMUG4ml8yiZSx2Ae3LELd/LukQ4zadd3ZjEUbP1FuEXnSdaOHpBsRJ7QT
 DCjCqtYciG/heeO6Zt+bu2RaWEkwrmMD7pyeMBuKsL9ND3opAwiJF+ZqNITuWjUCO69q
 Bq00y7JcFb+4teUEG3Q0WVjH+Xka3m7hAsP3ZoqWxwFg/v4mk+rAoZAcn0rfjvBATtE5
 d8kKgzBHCzrTaPSq5xZPBtnhXa8i1PFFfWfzkAsg2mB5zr7fCJFNpOeOVwGNTVuoUSpe
 2mxQ==
X-Gm-Message-State: AOAM533KeW8/6ktincGBYLgQUdUCwjz8QnXs+1VTshgwkqt2cgZsmEPe
 RvUwl5ZZ1vUVgaZTEaC3HvE=
X-Google-Smtp-Source: ABdhPJxclmK5tJHztft/7mXls1Pr5LGv+p9qBjz187C5S/MF0DBGSXopG+EkdGf+Fugo0q/XVD5QDg==
X-Received: by 2002:adf:8290:: with SMTP id 16mr21330161wrc.103.1603117660325; 
 Mon, 19 Oct 2020 07:27:40 -0700 (PDT)
Received: from ziggy.stardust ([213.195.119.110])
 by smtp.gmail.com with ESMTPSA id s185sm261888wmf.3.2020.10.19.07.27.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 19 Oct 2020 07:27:39 -0700 (PDT)
Subject: Re: [PATCH 2/5] pwm: pwm-mediatek: always use bus clock
To: Fabien Parent <fparent@baylibre.com>, linux-mediatek@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-pwm@vger.kernel.org
References: <20201019140705.1518822-1-fparent@baylibre.com>
 <20201019140705.1518822-3-fparent@baylibre.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
Message-ID: <0f2dc182-868c-43c3-8ae8-999e7cf1d986@gmail.com>
Date: Mon, 19 Oct 2020 16:27:38 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20201019140705.1518822-3-fparent@baylibre.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201019_102741_475813_4D9FDFF9 
X-CRM114-Status: GOOD (  29.61  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: thierry.reding@gmail.com, robh+dt@kernel.org, lee.jones@linaro.org,
 u.kleine-koenig@pengutronix.de
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org



On 19/10/2020 16:07, Fabien Parent wrote:
> The MediaTek PWM IP can sometimes use the 26MHz source clock to generate
> the PWM signal, but the driver currently assumes that we always use
> the PWM bus clock to generate the PWM signal.
> 
> This commit modifies the PWM driver in order to force the PWM IP to
> always use the bus clock as source clock.
> 
> I do not have the datasheet of all the MediaTek SoC, so I don't know
> if the register to choose the source clk is present in all the SoCs
> or only in subset. As a consequence I made this change optional by
> using a platform data paremeter to says whether this register is
> supported or not. On all the SoC I don't have the datasheet
> (MT2712, MT7622, MT7623, MT7628, MT7629) I kept the behavior
> to be the same as before this change.
> 
> Signed-off-by: Fabien Parent <fparent@baylibre.com>

Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com>

> ---
>   drivers/pwm/pwm-mediatek.c | 12 ++++++++++++
>   1 file changed, 12 insertions(+)
> 
> diff --git a/drivers/pwm/pwm-mediatek.c b/drivers/pwm/pwm-mediatek.c
> index ab001ce55178..108881619aea 100644
> --- a/drivers/pwm/pwm-mediatek.c
> +++ b/drivers/pwm/pwm-mediatek.c
> @@ -30,12 +30,14 @@
>   #define PWM45DWIDTH_FIXUP	0x30
>   #define PWMTHRES		0x30
>   #define PWM45THRES_FIXUP	0x34
> +#define PWM_CK_26M_SEL		0x210
>   
>   #define PWM_CLK_DIV_MAX		7
>   
>   struct pwm_mediatek_of_data {
>   	unsigned int num_pwms;
>   	bool pwm45_fixup;
> +	bool has_ck_26m_sel;
>   };
>   
>   /**
> @@ -132,6 +134,10 @@ static int pwm_mediatek_config(struct pwm_chip *chip, struct pwm_device *pwm,
>   	if (ret < 0)
>   		return ret;
>   
> +	/* Make sure we use the bus clock and not the 26MHz clock */
> +	if (pc->soc->has_ck_26m_sel)
> +		writel(0, pc->regs + PWM_CK_26M_SEL);
> +
>   	/* Using resolution in picosecond gets accuracy higher */
>   	resolution = (u64)NSEC_PER_SEC * 1000;
>   	do_div(resolution, clk_get_rate(pc->clk_pwms[pwm->hwpwm]));
> @@ -281,31 +287,37 @@ static int pwm_mediatek_remove(struct platform_device *pdev)
>   static const struct pwm_mediatek_of_data mt2712_pwm_data = {
>   	.num_pwms = 8,
>   	.pwm45_fixup = false,
> +	.has_ck_26m_sel = false,
>   };
>   
>   static const struct pwm_mediatek_of_data mt7622_pwm_data = {
>   	.num_pwms = 6,
>   	.pwm45_fixup = false,
> +	.has_ck_26m_sel = false,
>   };
>   
>   static const struct pwm_mediatek_of_data mt7623_pwm_data = {
>   	.num_pwms = 5,
>   	.pwm45_fixup = true,
> +	.has_ck_26m_sel = false,
>   };
>   
>   static const struct pwm_mediatek_of_data mt7628_pwm_data = {
>   	.num_pwms = 4,
>   	.pwm45_fixup = true,
> +	.has_ck_26m_sel = false,
>   };
>   
>   static const struct pwm_mediatek_of_data mt7629_pwm_data = {
>   	.num_pwms = 1,
>   	.pwm45_fixup = false,
> +	.has_ck_26m_sel = false,
>   };
>   
>   static const struct pwm_mediatek_of_data mt8516_pwm_data = {
>   	.num_pwms = 5,
>   	.pwm45_fixup = false,
> +	.has_ck_26m_sel = true,
>   };
>   
>   static const struct of_device_id pwm_mediatek_of_match[] = {
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
