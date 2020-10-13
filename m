Return-Path: <SRS0=564r=DU=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.0 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	NICE_REPLY_A,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 40CBDC433E7
	for <linux-mediatek@archiver.kernel.org>; Tue, 13 Oct 2020 15:11:04 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9FF9E248EE
	for <linux-mediatek@archiver.kernel.org>; Tue, 13 Oct 2020 15:11:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="xIsId1yQ";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pRt3/UN2"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9FF9E248EE
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=QVyZ7mL6hQEHmLaKC54fhmf7xXY2mmhSDz6A5himsXE=; b=xIsId1yQsNVPGyT5poL/Et++H
	+VCPOvLGLlYooV/0gD73+xTHZeDw7Z4/b+ADmIGFTpfvCg0xhYn0Vp7vad15y93jalecumV1sg2yb
	akJc4LMmE6Wkp4SqFKJZwYhuXqy6fqv8RywltpAnTmCDxldZWrjyNYoKdMK8VxXuCemxk7VzYofq3
	PmU/Q6fYnV0pBdorwOpmrLRnDBgSdPF8zA+hIIUNV1ZP2mjOc9AZa65Kvfg2VoHbxja4DRzF/xHOR
	L4JDYhwXTfZbonoP3o79eiXcEV0zfwmcBRo+Mu8UeHAlSDk+58J0te/ApQZgLX9sNEgBMappurcxz
	GAfpM19FQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kSLwx-0001DR-Q2; Tue, 13 Oct 2020 15:10:51 +0000
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kSLww-0001Bu-10; Tue, 13 Oct 2020 15:10:50 +0000
Received: by mail-wr1-x441.google.com with SMTP id s9so12392840wro.8;
 Tue, 13 Oct 2020 08:10:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=JuBX8r/Y6bGRUCSeRJ3CivsANkHlQS6AI/ICS0f0yZY=;
 b=pRt3/UN2sjp/Id17E5+iGB+94CwhIYyP+J0ZVxahLZjhYewvdy85p6E9qVH8mcDu/w
 Ma3byumuQbCvWjoxsAbJW0h9gvZLfP0hODyLYPb4jaAc6LzlEhDGij6xWsWm3n9sxLUf
 Y5rBrxFXjECN11m9EMkIOKoMbnLZAve13uQMowkDZfElmt1rBDlqBQDqGG5xuxoTZTGn
 A6f85//dkMxRUTK45bcV3JGGijKAaJzUd4tVdcH6w2iU+1IQzZjujWhrlRnaPHFO/u5I
 TwoDZIkPmDhBYcERTV9R8lQD/E/99qfus11PWOKi7U7sNRgo9fP4mXVVptNJKNu/orur
 1eGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=JuBX8r/Y6bGRUCSeRJ3CivsANkHlQS6AI/ICS0f0yZY=;
 b=GUXgYLHjq25laAUEnFw+6uaydc7jheiOAbXSkUtJ8z4T3RW05qEQpFiyowHKfmKYWN
 dKX+hkUqNFyjkeWqv1VZHqRzo3gBK/XOkqYOP+tsTwnfI0+NE5dHnCHCViDogiVssA94
 DlWv2vbUyU6zIkORl2sTLPYZGoZYSK+nPwhJg4R1QGe8FGs8W0gwgg+9oFNx6fQszibE
 l3fYCScJNuR0O91+oXk0eBCe1aLtGfioOQMCBe5fLbst7f8g2OZvUyE4pEUArNiWn06p
 S9xjGtLzj6yZdNX/uTW6Zu/aWPMJ54HpTwW/Krmvgvn3OD23PiE4Jb0oOCUeW9EC+JTJ
 3Jzw==
X-Gm-Message-State: AOAM53385J+cu9UCCZk36pixr2fW+XIZcRAO57vXaVZrabLlPY2TWg7/
 dSEENUqomYEGnCJHqB/woLo=
X-Google-Smtp-Source: ABdhPJxvj/okZcxLvRTRo8EX8POYCQcaPyYdM1hZZbF6KXlzxIMolIv8YA31Et7icSS3qcMo/t9L9g==
X-Received: by 2002:adf:f4d1:: with SMTP id h17mr107075wrp.41.1602601848929;
 Tue, 13 Oct 2020 08:10:48 -0700 (PDT)
Received: from ziggy.stardust ([213.195.119.110])
 by smtp.gmail.com with ESMTPSA id l11sm31014653wrt.54.2020.10.13.08.10.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 13 Oct 2020 08:10:47 -0700 (PDT)
Subject: Re: [PATCH v6 4/4] mmc: mediatek: Add subsys clock control for MT8192
 msdc
To: Wenbin Mei <wenbin.mei@mediatek.com>, Ulf Hansson
 <ulf.hansson@linaro.org>, Rob Herring <robh+dt@kernel.org>
References: <20201012124547.16649-1-wenbin.mei@mediatek.com>
 <20201012124547.16649-5-wenbin.mei@mediatek.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
Message-ID: <72ae1d89-fe31-4f50-15c0-29119d662ea1@gmail.com>
Date: Tue, 13 Oct 2020 17:10:46 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20201012124547.16649-5-wenbin.mei@mediatek.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201013_111050_113307_BAF70497 
X-CRM114-Status: GOOD (  20.51  )
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
Cc: devicetree@vger.kernel.org, srv_heupstream@mediatek.com,
 linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, Chaotian Jing <chaotian.jing@mediatek.com>,
 linux-arm-kernel@lists.infradead.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org



On 12/10/2020 14:45, Wenbin Mei wrote:
> MT8192 msdc is an independent sub system, we need control more bus
> clocks for it.
> Add support for the additional subsys clocks to allow it to be
> configured appropriately.
> 
> Signed-off-by: Wenbin Mei <wenbin.mei@mediatek.com>
> ---
>   drivers/mmc/host/mtk-sd.c | 74 +++++++++++++++++++++++++++++----------
>   1 file changed, 56 insertions(+), 18 deletions(-)
> 
> diff --git a/drivers/mmc/host/mtk-sd.c b/drivers/mmc/host/mtk-sd.c
> index a704745e5882..c7df7510f120 100644
> --- a/drivers/mmc/host/mtk-sd.c
> +++ b/drivers/mmc/host/mtk-sd.c
[...]
> +static int msdc_of_clock_parse(struct platform_device *pdev,
> +			       struct msdc_host *host)
> +{
> +	int ret;
> +
> +	host->src_clk = devm_clk_get(&pdev->dev, "source");
> +	if (IS_ERR(host->src_clk))
> +		return PTR_ERR(host->src_clk);
> +
> +	host->h_clk = devm_clk_get(&pdev->dev, "hclk");
> +	if (IS_ERR(host->h_clk))
> +		return PTR_ERR(host->h_clk);
> +
> +	host->bus_clk = devm_clk_get_optional(&pdev->dev, "bus_clk");
> +	if (IS_ERR(host->bus_clk))
> +		host->bus_clk = NULL;
> +
> +	/*source clock control gate is optional clock*/
> +	host->src_clk_cg = devm_clk_get_optional(&pdev->dev, "source_cg");
> +	if (IS_ERR(host->src_clk_cg))
> +		host->src_clk_cg = NULL;
> +
> +	host->sys_clk_cg = devm_clk_get_optional(&pdev->dev, "sys_cg");
> +	if (IS_ERR(host->sys_clk_cg))
> +		host->sys_clk_cg = NULL;
> +
> +	/* If present, always enable for this clock gate */
> +	clk_prepare_enable(host->sys_clk_cg);
> +
> +	host->bulk_clks[0].id = "pclk_cg";
> +	host->bulk_clks[1].id = "axi_cg";
> +	host->bulk_clks[2].id = "ahb_cg";

That looks at least suspicious. The pointers of id point to some strings defined 
in the function. Aren't they out of scope once msdc_of_clock_parse() has returned?

Regards,
Matthias

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
