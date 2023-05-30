Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70352C7EE23
	for <linux-mediatek@archiver.kernel.org>; Tue, 30 May 2023 07:09:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=U6hDi9v12OQsdO4dPAE39lZIv/Fbre2f2OfCHhj2zPQ=; b=4vJr3aXD1FfIGSeKBGocLBGosh
	fHuWerlXx9wd9DJAcC+SRVoiT6Q6qZ9EX084Ox1hRbROyM2ANME/TcdXV9MFwYg85d+WsjJCAxVkK
	qfwUg3knfck0uc8aAUzF+2WwzA2I5aBmw/iJrcHXM5O7cnNBNJp1Os8Ff9BU+tvYrTLoJ8/n9Ch5R
	6xjavP1bY1WDVkDWDnKPWwbzdLbq0YkCjcVnJfuicusJLg2nxkxietH++9XRrouMd6jWlRZrVQWeN
	FRTJ11druDKXZi3BUr6D70v6mxBtI5FcKbpcPQ+ow5ZZXGGKy2d4FqJ6T04fhgpmR97XwTs5As5h/
	SOaGXedQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q3tTy-00CfnI-1Z;
	Tue, 30 May 2023 07:09:26 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q3tTv-00Cfm1-2D;
	Tue, 30 May 2023 07:09:24 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-3f6e68cc738so27438445e9.1;
        Tue, 30 May 2023 00:09:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685430558; x=1688022558;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=U6hDi9v12OQsdO4dPAE39lZIv/Fbre2f2OfCHhj2zPQ=;
        b=b4DPcyVTmPBs2hE1tbo4jJ2UIvWBu8kEDuynwn6Uq6dDRrmGVWxz/WAKiG0AUOpcN5
         LpbXcGWWXUIHhxjYsnGW1h1gcKkMAgi0P8YAH6Xh7x8n/zYVBKqiOHJtrfSVtfsly0sR
         4iH/EJ1mbkWP1CSYWralqsvIURWq6q2g9Gv4yN0Yn7cg67oCC0413p4rxRKmAdVL6Aoi
         fnnO8lC3pcr7OQnwNg/lyCHcUlNwHs3zP3/dfmZOuJFb2fjW6w7g7iwk6FsFhbzVTLR+
         wN34l10R7S7mMlyPX46kmwx5qHTCjXhN5VCogZ75uvnVvSBqb/eB9v6QRiCFfXBVhtJo
         wlHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685430558; x=1688022558;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=U6hDi9v12OQsdO4dPAE39lZIv/Fbre2f2OfCHhj2zPQ=;
        b=A12SFUZaRFAQKxyKaQ8WWqvVueW3CyA6Ju2MSvos8oIWNVpHh8wnMZ++a50g3gMg3t
         V8SQQnlIbNaNGMl6VV0sO+4kiN2uQm9vJBAdwR0Tmpg1tb+Tj3p2EDi+oQJv22XOZj9W
         HM8K/Z3v5/WtSG3PcskKtWv7lqNbMiG2MycOPVXydn5LWvsfsa7QLRRj3A6HMZPngcVv
         TmXK2BXQ4IOu3iC3KHxBOfSK0TX8FO2tBwNw7VBdcS7ACscjo8MFYeG3RhyLnNuryGZT
         HObYV8pOOQgeIepQLODY0WWgyZDYyfi80vy/f6w20k1WaaNLFgj/aYYPJ5PuOWrfv554
         Amlg==
X-Gm-Message-State: AC+VfDxuRyqD2INQkjH2miXqibpm3z1ImV/blBkocIMyHkrynROPFOiB
	MIzMbVurogBOadJFNDF5PRU=
X-Google-Smtp-Source: ACHHUZ6OFB8UaPqd8uVlSeewHtEImgV4PtSa4q5BKtEuG31BOohcA+cLT9ST6PYqlXsaFbefPw/p3A==
X-Received: by 2002:a1c:4c16:0:b0:3f6:cfc7:8bc7 with SMTP id z22-20020a1c4c16000000b003f6cfc78bc7mr892697wmf.17.1685430558052;
        Tue, 30 May 2023 00:09:18 -0700 (PDT)
Received: from [192.168.2.177] ([207.188.167.132])
        by smtp.gmail.com with ESMTPSA id k6-20020a05600c0b4600b003f4fe09aa43sm20185089wmr.8.2023.05.30.00.09.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 May 2023 00:09:17 -0700 (PDT)
Message-ID: <8b1cd982-2b49-7dd8-8037-7a362aa4305c@gmail.com>
Date: Tue, 30 May 2023 09:09:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v3 2/5] thermal/drivers/mediatek/lvts_thermal: Add suspend
 and resume
Content-Language: en-US, ca-ES, es-ES
To: =?UTF-8?Q?Bernhard_Rosenkr=c3=a4nzer?= <bero@baylibre.com>,
 daniel.lezcano@linaro.org, angelogioacchino.delregno@collabora.com,
 rafael@kernel.org, amitk@kernel.org, rui.zhang@intel.com,
 robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 rdunlap@infradead.org, ye.xingchen@zte.com.cn, p.zabel@pengutronix.de
Cc: linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 devicetree@vger.kernel.org, wenst@chromium.org, james.lo@mediatek.com,
 rex-bc.chen@mediatek.com, nfraprado@collabora.com, abailon@baylibre.com,
 amergnat@baylibre.com, khilman@baylibre.com
References: <20230529164605.3552619-1-bero@baylibre.com>
 <20230529164605.3552619-3-bero@baylibre.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <20230529164605.3552619-3-bero@baylibre.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230530_000923_724849_1E760D49 
X-CRM114-Status: GOOD (  22.21  )
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



On 29/05/2023 18:46, Bernhard Rosenkränzer wrote:
> From: Balsam CHIHI <bchihi@baylibre.com>
> 
> Add suspend and resume support to LVTS driver.
> 
> Signed-off-by: Balsam CHIHI <bchihi@baylibre.com>
> Signed-off-by: Bernhard Rosenkränzer <bero@baylibre.com>

Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com>

> ---
>   drivers/thermal/mediatek/lvts_thermal.c | 34 +++++++++++++++++++++++++
>   1 file changed, 34 insertions(+)
> 
> diff --git a/drivers/thermal/mediatek/lvts_thermal.c b/drivers/thermal/mediatek/lvts_thermal.c
> index d0a3f95b7884b..5ea8a9d569ea6 100644
> --- a/drivers/thermal/mediatek/lvts_thermal.c
> +++ b/drivers/thermal/mediatek/lvts_thermal.c
> @@ -1169,6 +1169,38 @@ static int lvts_remove(struct platform_device *pdev)
>   	return 0;
>   }
>   
> +static int lvts_suspend(struct platform_device *pdev, pm_message_t state)
> +{
> +	struct lvts_domain *lvts_td;
> +	int i;
> +
> +	lvts_td = platform_get_drvdata(pdev);
> +
> +	for (i = 0; i < lvts_td->num_lvts_ctrl; i++)
> +		lvts_ctrl_set_enable(&lvts_td->lvts_ctrl[i], false);
> +
> +	clk_disable_unprepare(lvts_td->clk);
> +
> +	return 0;
> +}
> +
> +static int lvts_resume(struct platform_device *pdev)
> +{
> +	struct lvts_domain *lvts_td;
> +	int i, ret;
> +
> +	lvts_td = platform_get_drvdata(pdev);
> +
> +	ret = clk_prepare_enable(lvts_td->clk);
> +	if (ret)
> +		return ret;
> +
> +	for (i = 0; i < lvts_td->num_lvts_ctrl; i++)
> +		lvts_ctrl_set_enable(&lvts_td->lvts_ctrl[i], true);
> +
> +	return 0;
> +}
> +
>   static const struct lvts_ctrl_data mt8195_lvts_mcu_data_ctrl[] = {
>   	{
>   		.cal_offset = { 0x04, 0x07 },
> @@ -1268,6 +1300,8 @@ MODULE_DEVICE_TABLE(of, lvts_of_match);
>   static struct platform_driver lvts_driver = {
>   	.probe = lvts_probe,
>   	.remove = lvts_remove,
> +	.suspend = lvts_suspend,
> +	.resume = lvts_resume,
>   	.driver = {
>   		.name = "mtk-lvts-thermal",
>   		.of_match_table = lvts_of_match,

