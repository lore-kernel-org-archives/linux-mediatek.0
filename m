Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94AFFC77B7D
	for <linux-mediatek@archiver.kernel.org>; Wed, 10 May 2023 14:19:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=weRq9/Oz7hsyRYpzT9X4irjExY0OdiEXcbsBvXDXnv0=; b=lzLzbwhK3Wj1nQdLQdoV7GaCey
	T6cBE2QkmDepYSR87kQbQ55p85LT0qfFdz1pmHs7VaWZ60lPks4pWWWf8bApFL6eoLZ4/fIcSJfM3
	MsROWDrth5P7hhg1YICCE8u3GkOsJRTPty1LTJA0xUshr60As2C5D1vsCC4fhTO7fStAxwYtTFdv6
	cc+ggnnBjm03daQfCSMUMlWnFrfxV0zlf1sufARvlonSBnVfptRjpYkLH7FaqI4oI7iIOMTtL6FUn
	/1F4yggOzbeofHIQYU9eE/BG8CBaOR3gdHvUEl05uEllfrerbLsCCN6LdxW5XPa1G4PNZQ3/ivDF0
	bIt8rgXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pwkfG-006Kv8-2k;
	Wed, 10 May 2023 14:19:34 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pwkfD-006KtS-1Q;
	Wed, 10 May 2023 14:19:32 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-3f4449fa085so8670345e9.0;
        Wed, 10 May 2023 07:19:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683728362; x=1686320362;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=weRq9/Oz7hsyRYpzT9X4irjExY0OdiEXcbsBvXDXnv0=;
        b=oi+tsWEn2QGAjWjNTJkbhMpYS5G/sRYnlKkP3oaNgOO2ahOe6j2zjb1zzzDbKHMw4U
         11bVu7SyMPLxoyeIe0Z02y5ILi9PZ7X3l4cLSG4NgbizHVYav9Id8DifaMppfzv8L1KZ
         C/w5vorYkLjEsOjm8s4zbw5d9ao0iKyjmLQ8WmDkI3yqbao0Z7/TH4/0Pykr/yGGQ2n+
         zNACHjzkTtC63wr+EoeCuJzJZeBt64WLVYkGESgjctfXKeAkEB0fmlU6fVVJUhawBqiI
         HjhHXEd54blsmIa9cfV5bGvZuTEtCsni5nvvxRFdvvmKLq4SVRqio5BBvzvNh5JqmZgs
         zf+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683728362; x=1686320362;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=weRq9/Oz7hsyRYpzT9X4irjExY0OdiEXcbsBvXDXnv0=;
        b=NgJy4SNcxkxYFctQ5PJpEzJ1TJbeioG300GLLtaiHEh2tr9PwOkxxzaWFPWB5nuy7p
         zot+bUDo65im4RcmABxI9We/1L5ocvdyajL8cJ8xR6Ya9ynppPlRclrFUatEiG2uh8uZ
         EWiz7pIitEDTB9fUUtTDxxs2RdGu8AbwyGmUlwdyLE+1kvgFfHvcfa0mbdnlek2zD5o/
         lJCus/pkd3jQcuCemF4DBpp4zqCgoIpsT5OWvgMenmMy0R+3kuzIwZRHh6KTX8vK+7XR
         RskcRlSge5v2cCAQEYTOIANUShPTKQYel4eIt85khJ/4z7FlZnSFBu0x2qKTm2Abihnt
         iy7g==
X-Gm-Message-State: AC+VfDzXGVoHExz5ldTotvSu1nj5V+VwxsZViGy5FiO2mPYU++fPNJLv
	c9ANOvi2e5fq935YJ+BxtWA=
X-Google-Smtp-Source: ACHHUZ690jlp38DMo0H91xICFaqGrysfxpaSisKMzpYRNVlnL9cLWYGNX5hehfwVFwuVkujpUbNS1g==
X-Received: by 2002:a05:600c:2103:b0:3f4:2cc3:2623 with SMTP id u3-20020a05600c210300b003f42cc32623mr3991733wml.22.1683728361975;
        Wed, 10 May 2023 07:19:21 -0700 (PDT)
Received: from [192.168.2.177] ([207.188.167.132])
        by smtp.gmail.com with ESMTPSA id h1-20020a5d5481000000b0030647d1f34bsm17697603wrv.1.2023.05.10.07.19.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 May 2023 07:19:20 -0700 (PDT)
Message-ID: <423c7e0b-95d7-8389-02fc-6dd5ef215e93@gmail.com>
Date: Wed, 10 May 2023 16:19:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH] mmc: mediatek: Avoid ugly error message when SDIO wakeup
 IRQ isn't used
To: Douglas Anderson <dianders@chromium.org>,
 Chaotian Jing <chaotian.jing@mediatek.com>,
 Ulf Hansson <ulf.hansson@linaro.org>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Linus Walleij <linus.walleij@linaro.org>, Yong Mao <yong.mao@mediatek.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-mmc@vger.kernel.org
References: <20230510064434.1.I935404c5396e6bf952e99bb7ffb744c6f7fd430b@changeid>
Content-Language: en-US, ca-ES, es-ES
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <20230510064434.1.I935404c5396e6bf952e99bb7ffb744c6f7fd430b@changeid>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230510_071931_497171_4E022875 
X-CRM114-Status: GOOD (  20.42  )
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



On 10/05/2023 15:44, Douglas Anderson wrote:
> When I boot a kukui-kodama board, I see an ugly warning in my kernel
> log:
>    mtk-msdc 11240000.mmc: error -ENXIO: IRQ sdio_wakeup not found
> 
> It's pretty normal not to have an "sdio_wakeup" IRQ defined. In fact,
> no device trees in mainline seem to have it. Let's use the
> platform_get_irq_byname_optional() to avoid the error message.
> 
> Fixes: 527f36f5efa4 ("mmc: mediatek: add support for SDIO eint wakup IRQ")
> Signed-off-by: Douglas Anderson <dianders@chromium.org>

Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com>

> ---
> 
>   drivers/mmc/host/mtk-sd.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/mmc/host/mtk-sd.c b/drivers/mmc/host/mtk-sd.c
> index edade0e54a0c..8ce864169986 100644
> --- a/drivers/mmc/host/mtk-sd.c
> +++ b/drivers/mmc/host/mtk-sd.c
> @@ -2707,7 +2707,7 @@ static int msdc_drv_probe(struct platform_device *pdev)
>   
>   	/* Support for SDIO eint irq ? */
>   	if ((mmc->pm_caps & MMC_PM_WAKE_SDIO_IRQ) && (mmc->pm_caps & MMC_PM_KEEP_POWER)) {
> -		host->eint_irq = platform_get_irq_byname(pdev, "sdio_wakeup");
> +		host->eint_irq = platform_get_irq_byname_optional(pdev, "sdio_wakeup");
>   		if (host->eint_irq > 0) {
>   			host->pins_eint = pinctrl_lookup_state(host->pinctrl, "state_eint");
>   			if (IS_ERR(host->pins_eint)) {

