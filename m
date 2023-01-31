Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DC91C38142
	for <linux-mediatek@archiver.kernel.org>; Tue, 31 Jan 2023 12:59:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3UndeySbwJtYhBstLS+7W0sTuNpKqoxWhQG5bKCKu1E=; b=Rnvio0ine9+RgFeoMT++wlPNqK
	cMJUmtzAcwGgWcdxaeSsOWI7ia6eZRO5L1UZo4dPEyfdGys8vGECl/fDUSbGTLbB2/SiRMdIF/eV0
	atXGhWe9LxXMboD8IF62aEpVV45eSYAqoW7hdYZO02+GcNkLsaKd4A4obGiJw5xJOC4bXcWkMDNpj
	6SxA9CMEXMoRCzaTpkD/P7AdM1SJQCWy45bkueLcw23l9VEEm5+ppUTvnkoydJXp9rwMOems92f33
	YwFMBk+6kFDEMtrpIXXb3wTwcWu3hxHR/TpgZC1wMWcx176KuTIDLxMylyzrP3UHbMBDJwgZz7lkR
	mv3sEfSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pMqEn-007w3s-U5; Tue, 31 Jan 2023 12:59:49 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pMqEd-007w2a-KQ; Tue, 31 Jan 2023 12:59:41 +0000
Received: by mail-wr1-x432.google.com with SMTP id q5so14165520wrv.0;
        Tue, 31 Jan 2023 04:59:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3UndeySbwJtYhBstLS+7W0sTuNpKqoxWhQG5bKCKu1E=;
        b=kcA47SugyoASWc7ydEtwePhQFM0twx4+y19Z7wadyt7XQFZsZEJSpna+gvXiMiscEq
         IFOkCKqb6zFJl8Hll5lSlYJu8amy7v6m6HNpc7AB9o177uxiIjaCKPFc5aRo5PGFxVyM
         N23MA+9g8B+nUGHIW9Quq4A9Sveb1HSRp+4DNsKCP3RuIeVz14NU5O9RVD3WVhrkrhSi
         cW4H8Mnj8bCiB/ngDAqhyGzFIbm3qfrp0Ki3vJdRZ8cyBKvwWmUFbvPcgGIxNETLk0ZI
         gnslR4N/O0vXCZbyvSER8rWmxvarMbqbS+BGhLdFvPRPiNwKx0TUzkj0BOC1LoqtbaWw
         d4tQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3UndeySbwJtYhBstLS+7W0sTuNpKqoxWhQG5bKCKu1E=;
        b=bre4flgVXH2vmBE+ngSo/6Oa47gUKzQcb+7l9rkKMOusUnkAmtGwZAPpqOEzZI2vDd
         stXLwlVBBOZOpR+ahDe98VqlA8EHa6unltGx034DIjmUEHHoIqFUJEpBQZhvCAN0hwft
         UddvB6mffeTdRxNKMclQgmK2/UMyGXDskorIg9YroLZKWFybXg+h+V8/ui/qQS/+TIG9
         sE05LCDUMBeFvNOPMnh5vLqNjmbcESHgKWqmVV1LTfTsDEC1YP6Pj4Ssq6XhnT9qwAA3
         9hLdTXyTTHgkfBDy+h0/DV/NCd9aNfRRqIcFvWMtlXSJeu/RJl5J+FXWMVJ1f4s48XRN
         QkBg==
X-Gm-Message-State: AFqh2kqd8ajAv9RU3VgBCgeHsHkLw4iH9NJNAWE4qV9cp+JsrMKCOkYP
	utJyVEQZcPA2fsaAX4mSz58=
X-Google-Smtp-Source: AMrXdXuQTnI7ooh6atfJ1l+iKecwB8hqvSyt3CFwVI9zZ+9rWAa4lGHia0YO6Ocu7iA5lZ7l35q2iw==
X-Received: by 2002:adf:a31a:0:b0:2bf:96ae:7cc8 with SMTP id c26-20020adfa31a000000b002bf96ae7cc8mr33668033wrb.4.1675169977792;
        Tue, 31 Jan 2023 04:59:37 -0800 (PST)
Received: from [192.168.2.177] ([207.188.167.132])
        by smtp.gmail.com with ESMTPSA id b14-20020a05600010ce00b0029e1aa67fd2sm14798814wrx.115.2023.01.31.04.59.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 31 Jan 2023 04:59:37 -0800 (PST)
Message-ID: <561d9a97-64c7-6633-ff10-d85ae2c7f314@gmail.com>
Date: Tue, 31 Jan 2023 13:59:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v4 03/14] soc: mediatek: mtk-svs: enable the IRQ later
Content-Language: en-US
To: Roger Lu <roger.lu@mediatek.com>,
 Enric Balletbo Serra <eballetbo@gmail.com>, Kevin Hilman
 <khilman@kernel.org>, Nicolas Boichat <drinkcat@google.com>
Cc: Fan Chen <fan.chen@mediatek.com>,
 Jia-wei Chang <jia-wei.chang@mediatek.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 Ricardo Ribalda <ribalda@chromium.org>
References: <20230111074528.29354-1-roger.lu@mediatek.com>
 <20230111074528.29354-4-roger.lu@mediatek.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <20230111074528.29354-4-roger.lu@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230131_045939_700342_58846CCD 
X-CRM114-Status: GOOD (  21.27  )
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



On 11/01/2023 08:45, Roger Lu wrote:
> From: Ricardo Ribalda <ribalda@chromium.org>
> 
> If the system does not come from reset (like when is booted via
> kexec(), the peripheral might trigger an IRQ before the data structures
> are initialized.
> 
> Fixes:
> 
> [    0.227710] Unable to handle kernel NULL pointer dereference at virtual address 0000000000000f08
> [    0.227913] Call trace:
> [    0.227918]  svs_isr+0x8c/0x538
> 

This patch is different from
https://lore.kernel.org/r/20221127-mtk-svs-v2-0-145b07663ea8@chromium.org

If you think the patch from Ricardo is wrong, then you should have mentioned 
that in the review.

Regards,
Matthias

> Fixes: 681a02e95000 ("soc: mediatek: SVS: introduce MTK SVS engine")
> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> Signed-off-by: Roger Lu <roger.lu@mediatek.com>
> ---
>   drivers/soc/mediatek/mtk-svs.c | 28 ++++++++++++++--------------
>   1 file changed, 14 insertions(+), 14 deletions(-)
> 
> diff --git a/drivers/soc/mediatek/mtk-svs.c b/drivers/soc/mediatek/mtk-svs.c
> index a803b92afc3d..64d4d03ab71c 100644
> --- a/drivers/soc/mediatek/mtk-svs.c
> +++ b/drivers/soc/mediatek/mtk-svs.c
> @@ -2403,20 +2403,6 @@ static int svs_probe(struct platform_device *pdev)
>   		goto svs_probe_free_resource;
>   	}
>   
> -	svsp_irq = platform_get_irq(pdev, 0);
> -	if (svsp_irq < 0) {
> -		ret = svsp_irq;
> -		goto svs_probe_free_resource;
> -	}
> -
> -	ret = devm_request_threaded_irq(svsp->dev, svsp_irq, NULL, svs_isr,
> -					IRQF_ONESHOT, svsp->name, svsp);
> -	if (ret) {
> -		dev_err(svsp->dev, "register irq(%d) failed: %d\n",
> -			svsp_irq, ret);
> -		goto svs_probe_free_resource;
> -	}
> -
>   	svsp->main_clk = devm_clk_get(svsp->dev, "main");
>   	if (IS_ERR(svsp->main_clk)) {
>   		dev_err(svsp->dev, "failed to get clock: %ld\n",
> @@ -2438,6 +2424,20 @@ static int svs_probe(struct platform_device *pdev)
>   		goto svs_probe_clk_disable;
>   	}
>   
> +	svsp_irq = platform_get_irq(pdev, 0);
> +	if (svsp_irq < 0) {
> +		ret = svsp_irq;
> +		goto svs_probe_iounmap;
> +	}
> +
> +	ret = devm_request_threaded_irq(svsp->dev, svsp_irq, NULL, svs_isr,
> +					IRQF_ONESHOT, svsp->name, svsp);
> +	if (ret) {
> +		dev_err(svsp->dev, "register irq(%d) failed: %d\n",
> +			svsp_irq, ret);
> +		goto svs_probe_iounmap;
> +	}
> +
>   	ret = svs_start(svsp);
>   	if (ret) {
>   		dev_err(svsp->dev, "svs start fail: %d\n", ret);

