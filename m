Return-Path: <SRS0=A+tK=A7=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	NICE_REPLY_A,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EF9DDC433EC
	for <linux-mediatek@archiver.kernel.org>; Mon, 20 Jul 2020 15:44:00 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C04F52064B
	for <linux-mediatek@archiver.kernel.org>; Mon, 20 Jul 2020 15:44:00 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="mWXqJxuY";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JjmqZtkt"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C04F52064B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=pXwbIZ1OjSISRcWitgbBcFvlP0L0CVhMARS2tdyy1ms=; b=mWXqJxuYF5ohHrMzE/x81tVZW
	YO+cwWqgXa1L1zL0MiwcYh/CYWIgWhdqJCj7EQExFjXq3dV5WuUoBPFRwO9+ukRQGEkmk8uUuDRwC
	tbP7kfNXdVJXc3xFyo9AnbBye3O7rU70GiQ82hAO2jA/aN1jja6I9n1DZIItYQTVaLGMtlbubjxYR
	xxA+oqpUTdh5OUT5NioKXlE/C2TKGNf5y/dlHrR1yO5xiV+PBtZwWV4G4KvesOsi4lcVoL4siD7a9
	jeqHYtTVB4OLjNmgixWeiY4h3YQUKpCcYIqXjD9g+/vhPc50/Sre7jz1qc0HD6wJBDmfg523mumX3
	mtWyJ8vig==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jxXxE-0003iO-Bk; Mon, 20 Jul 2020 15:43:48 +0000
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jxXx4-0003ck-O9; Mon, 20 Jul 2020 15:43:39 +0000
Received: by mail-wm1-x341.google.com with SMTP id 22so4061wmg.1;
 Mon, 20 Jul 2020 08:43:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=autVWWtMkcWJD2mnHeXx5OQfP35st6FKtCjEISqTu28=;
 b=JjmqZtktLvk5Qc3N7R2sS1d6oGjjgW6kfwGPqn1Syigos8hcDhGKPO5zhOGp+p3mdM
 7oFKNkkQZHy4DktD0yhGa/K5vU5uaVMuJjOzPVn+5YIFKs57KtNwbZbuRvelWsEaccIw
 zvfTew212u4gLW5o5Px6DA8QVeHMU1ytQhfyDQrdJkrZXhBXGRmM8Lrx+Vnn29D5nKJA
 NVj5ydC0Wf/yr/gH3kB+6lCRjT5wi6q/7Wfow+gFR8X8oIg1LvNCY9qKphQA1W8OPhZ7
 qbmvTMCpGd6c734qKKg3v1DXdQBwVnv0ndrx1jbr275X5hPbR8dk3/R7fplUPwwA13g9
 iwpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=autVWWtMkcWJD2mnHeXx5OQfP35st6FKtCjEISqTu28=;
 b=tZiZ3AZrhc/mXsjO6uW/BqpB97DFWz+NZJtxiQB3X/H1rfE9UKbUTOjqkKfj6ji1iu
 K+OLu4OFFY9dDZoCmOjxSr9JyN8+XwgpzjgjRn9IGM9OVCnxnJOv+ZgSUYY+D+Uc8PeC
 EXDU5ivZAWFt2skY5E0o6vSFOyzJe+Btfg/iHf5NGxVz8vQTO8FSA/1N9rphz3G2WetK
 30I/wLWK6APvn606u0R8XnYk3eguN5HUD5Uf9HYrRdHfq400JtvRZ0rgCDBW9plSl0DL
 Wm5qFN6de85gXSGtcA7IxV0fJobbCa3lpg2MW4vJkqk2B+jCCM7O23dgxURtmp8/frBt
 1Uxw==
X-Gm-Message-State: AOAM530oF8g23KqhtE3ZrLtZdw1g2ktlnP8dA/+yIbcFORvz0FZoF9Ve
 qr1XnFqtDVUSOIiPSfOx2mk=
X-Google-Smtp-Source: ABdhPJzHR5BO0TIk52hY7BBc/k3XRAgpQOahFxFCGnpt58cP2vReN2cLRt0KiZXlFZBCmuhiMR+Qaw==
X-Received: by 2002:a7b:c857:: with SMTP id c23mr23660652wml.155.1595259815959; 
 Mon, 20 Jul 2020 08:43:35 -0700 (PDT)
Received: from ziggy.stardust (81.172.57.81.dyn.user.ono.com. [81.172.57.81])
 by smtp.gmail.com with ESMTPSA id
 e5sm16981210wrc.37.2020.07.20.08.43.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 Jul 2020 08:43:35 -0700 (PDT)
Subject: Re: [PATCH v7 2/4] mmc: mediatek: refine msdc timeout api
To: Chun-Hung Wu <chun-hung.wu@mediatek.com>, mirq-linux@rere.qmqm.pl,
 Jonathan Hunter <jonathanh@nvidia.com>, Al Cooper <alcooperx@gmail.com>,
 Adrian Hunter <adrian.hunter@intel.com>,
 Florian Fainelli <f.fainelli@gmail.com>,
 bcm-kernel-feedback-list@broadcom.com, Andy Gross <agross@kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Michal Simek <michal.simek@xilinx.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Chaotian Jing <chaotian.jing@mediatek.com>,
 Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>, Linus Walleij
 <linus.walleij@linaro.org>, Pavel Machek <pavel@ucw.cz>,
 Kate Stewart <kstewart@linuxfoundation.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Pan Bian <bianpan2016@163.com>, Thomas Gleixner <tglx@linutronix.de>,
 Allison Randal <allison@lohutok.net>, Mathieu Malaterre <malat@debian.org>,
 Stanley Chu <stanley.chu@mediatek.com>,
 Kuohong Wang <kuohong.wang@mediatek.com>
References: <1595205759-5825-1-git-send-email-chun-hung.wu@mediatek.com>
 <1595205759-5825-3-git-send-email-chun-hung.wu@mediatek.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
Message-ID: <eb1d5973-55f2-3fb4-bf9c-03b98bd6955b@gmail.com>
Date: Mon, 20 Jul 2020 17:43:33 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <1595205759-5825-3-git-send-email-chun-hung.wu@mediatek.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200720_114338_817322_C3AB28BF 
X-CRM114-Status: GOOD (  21.30  )
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
Cc: devicetree@vger.kernel.org, wsd_upstream@mediatek.com,
 linux-arm-msm@vger.kernel.org, linux-mmc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-tegra@vger.kernel.org, kernel-team@android.com,
 linux-arm-kernel@lists.infradead.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org



On 20/07/2020 02:42, Chun-Hung Wu wrote:
> Extract msdc timeout api common part to have
> better code architecture and avoid redundant code.
> 
> Signed-off-by: Chun-Hung Wu <chun-hung.wu@mediatek.com>

Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com>

> ---
>   drivers/mmc/host/mtk-sd.c | 32 ++++++++++++++++++++++----------
>   1 file changed, 22 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/mmc/host/mtk-sd.c b/drivers/mmc/host/mtk-sd.c
> index ed37a3c..347ed72 100644
> --- a/drivers/mmc/host/mtk-sd.c
> +++ b/drivers/mmc/host/mtk-sd.c
> @@ -723,21 +723,21 @@ static void msdc_unprepare_data(struct msdc_host *host, struct mmc_request *mrq)
>   	}
>   }
>   
> -/* clock control primitives */
> -static void msdc_set_timeout(struct msdc_host *host, u32 ns, u32 clks)
> +static u64 msdc_timeout_cal(struct msdc_host *host, u64 ns, u64 clks)
>   {
> -	u32 timeout, clk_ns;
> +	u64 timeout, clk_ns;
>   	u32 mode = 0;
>   
> -	host->timeout_ns = ns;
> -	host->timeout_clks = clks;
>   	if (host->mmc->actual_clock == 0) {
>   		timeout = 0;
>   	} else {
> -		clk_ns  = 1000000000UL / host->mmc->actual_clock;
> -		timeout = (ns + clk_ns - 1) / clk_ns + clks;
> +		clk_ns  = 1000000000ULL;
> +		do_div(clk_ns, host->mmc->actual_clock);
> +		timeout = ns + clk_ns - 1;
> +		do_div(timeout, clk_ns);
> +		timeout += clks;
>   		/* in 1048576 sclk cycle unit */
> -		timeout = (timeout + (0x1 << 20) - 1) >> 20;
> +		timeout = DIV_ROUND_UP(timeout, (0x1 << 20));
>   		if (host->dev_comp->clk_div_bits == 8)
>   			sdr_get_field(host->base + MSDC_CFG,
>   				      MSDC_CFG_CKMOD, &mode);
> @@ -747,9 +747,21 @@ static void msdc_set_timeout(struct msdc_host *host, u32 ns, u32 clks)
>   		/*DDR mode will double the clk cycles for data timeout */
>   		timeout = mode >= 2 ? timeout * 2 : timeout;
>   		timeout = timeout > 1 ? timeout - 1 : 0;
> -		timeout = timeout > 255 ? 255 : timeout;
>   	}
> -	sdr_set_field(host->base + SDC_CFG, SDC_CFG_DTOC, timeout);
> +	return timeout;
> +}
> +
> +/* clock control primitives */
> +static void msdc_set_timeout(struct msdc_host *host, u64 ns, u64 clks)
> +{
> +	u64 timeout;
> +
> +	host->timeout_ns = ns;
> +	host->timeout_clks = clks;
> +
> +	timeout = msdc_timeout_cal(host, ns, clks);
> +	sdr_set_field(host->base + SDC_CFG, SDC_CFG_DTOC,
> +		      (u32)(timeout > 255 ? 255 : timeout));
>   }
>   
>   static void msdc_gate_clock(struct msdc_host *host)
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
