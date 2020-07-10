Return-Path: <SRS0=M7U7=AV=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.2 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CBCE4C433E7
	for <linux-mediatek@archiver.kernel.org>; Fri, 10 Jul 2020 13:41:18 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9C8942063A
	for <linux-mediatek@archiver.kernel.org>; Fri, 10 Jul 2020 13:41:18 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="h8Y5kO3G";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Uu1sn5nN"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9C8942063A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=4sugsloC0fv3vpeM9FNtMmqDg59HlG7wxO9+9jXSFbY=; b=h8Y5kO3GXWHWIlELU20unQhyy
	Nmm+l0WBWBHx5SAQDdY2Ph2PR0oEWv0q6L47RLr2pFl/SBACWeef+zexVOg+OK88kWoaJrfTLZGBe
	akt4SM0uN/MTmv+1XDjIGGGapsGUTatlCr6o4xMcwCkaGj2ytQ/+geGpHeCoyuAnfo9FjnrVfzGyA
	+iN4Lo/bQ8h3VgWZDNeLzOnFZb/cdTcEg2MT/tl096OJ1iuP8fwKT/XIl3iRdvfLTHc7LgOFIDHJ7
	FgZwHxWmHdFi7ygJ9QlY99iqR0D+XYcdmGb4XwJg3N5qR0sM93IXqdZgNI8LxhMH+eQVAZ7+/JcRx
	cEdC5wKmQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jttH0-0008NT-O2; Fri, 10 Jul 2020 13:41:06 +0000
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jttGy-0008MK-T9; Fri, 10 Jul 2020 13:41:05 +0000
Received: by mail-wm1-x341.google.com with SMTP id w3so5956075wmi.4;
 Fri, 10 Jul 2020 06:41:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=NVk9Crf1mCP3Su/M8SoSn97qMooLpR/mAl9IlnwRJA4=;
 b=Uu1sn5nNB7Sk2aNPazNIEFCtVdCcpdH5lCco4ygL+kTt2/PBhi60P50AbM8xQppP0F
 RKlf6pAgK5Qxxu7cZ2MGRnKr0V+Ifqyo6hkYynfPWMAGloJ48EFCp3q1gwjhFaDdDhK1
 nrfuGcEh+xwG9imoD9iwlHfI+LDW+7e/6Amw0VsP9kH0zTMG+MTECRYAqJV4NFYumOpx
 KbNeOvHHFJmB7BgNJRUG0Jy9KTCXsRrtlklumKed15meJmAfbgXUNIRkn+Fmq1k0OuT8
 gcNlJLwXZdqsP7IKKVXaXsduUuedTY3Drg5Mg7YZt8wc4vEdYDE8CQiQBupiH1e5H1cV
 0TYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=NVk9Crf1mCP3Su/M8SoSn97qMooLpR/mAl9IlnwRJA4=;
 b=TFaHONLF34Vbj+KcY34dud1y55eDzaM6GCOXZwkHS2yo61DxKkxGBGJCfKfzRZhzO3
 a4CV6rGfJMlGXFhyWd4hhuZPPs7q6bu6kdUbKwletkqk+LFzkgtXGrbeSQh/0aE9hJ3M
 EA8lN/2qFDvzVVQyxsOefWKOLSbeG/SePcNYQZC9mfCtydWHwBVKZ/0cYklfIn1EvE8m
 Q6yFYbKlHLHlb12ZY4IMWk/vl//6YdpM/+CoZ55tm4EPCE2LWLSlH8bdwxXFnIMevD4e
 yBqC3AwnNjQamo9rh//v4TIff7f5SbNhtBcG3wyp4aj7nrnbyG0QRRs5AJHV5qcaLLOb
 xtcg==
X-Gm-Message-State: AOAM533zRCXFytaKRShXgk5S80Uvi8lLfL4r8vSc2cduRk66JyJcLw4/
 GJ1ypLr1Qlr+7BAkoYt1X7A=
X-Google-Smtp-Source: ABdhPJwL7Z6KQEina07YIcKXYKWMe2+LNfZsMpS9zXaDbsoXqyM4gJxLLC96zjezb0mkvVPil/F5+A==
X-Received: by 2002:a1c:ab56:: with SMTP id u83mr5071631wme.94.1594388463868; 
 Fri, 10 Jul 2020 06:41:03 -0700 (PDT)
Received: from ziggy.stardust ([213.195.114.245])
 by smtp.gmail.com with ESMTPSA id g195sm9714253wme.38.2020.07.10.06.41.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 10 Jul 2020 06:41:03 -0700 (PDT)
Subject: Re: [PATCH v7 6/7] clk: mediatek: add UART0 clock support
To: Hanks Chen <hanks.chen@mediatek.com>,
 Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Sean Wang <sean.wang@kernel.org>
References: <1593694630-26604-1-git-send-email-hanks.chen@mediatek.com>
 <1593694630-26604-8-git-send-email-hanks.chen@mediatek.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
Message-ID: <c40d2739-92a1-3309-764a-ed3ac8ee7bc6@gmail.com>
Date: Fri, 10 Jul 2020 15:41:01 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <1593694630-26604-8-git-send-email-hanks.chen@mediatek.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200710_094104_986412_EDB1EF6B 
X-CRM114-Status: GOOD (  15.70  )
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
Cc: devicetree@vger.kernel.org, CC Hwang <cc.hwang@mediatek.com>,
 wsd_upstream@mediatek.com, Andy Teng <andy.teng@mediatek.com>,
 Loda Chou <loda.chou@mediatek.com>, linux-kernel@vger.kernel.org,
 linux-gpio@vger.kernel.org, linux-mediatek@lists.infradead.org,
 mtk01761 <wendell.lin@mediatek.com>, linux-arm-kernel@lists.infradead.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org



On 02/07/2020 14:57, Hanks Chen wrote:
> Add MT6779 UART0 clock support.
> 
> Fixes: 710774e04861 ("clk: mediatek: Add MT6779 clock support")
> Signed-off-by: Wendell Lin <wendell.lin@mediatek.com>
> Signed-off-by: Hanks Chen <hanks.chen@mediatek.com>

Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com>

> ---
>   drivers/clk/mediatek/clk-mt6779.c |    2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/clk/mediatek/clk-mt6779.c b/drivers/clk/mediatek/clk-mt6779.c
> index 9766ccc..6e0d3a1 100644
> --- a/drivers/clk/mediatek/clk-mt6779.c
> +++ b/drivers/clk/mediatek/clk-mt6779.c
> @@ -919,6 +919,8 @@
>   		    "pwm_sel", 19),
>   	GATE_INFRA0(CLK_INFRA_PWM, "infra_pwm",
>   		    "pwm_sel", 21),
> +	GATE_INFRA0(CLK_INFRA_UART0, "infra_uart0",
> +		    "uart_sel", 22),
>   	GATE_INFRA0(CLK_INFRA_UART1, "infra_uart1",
>   		    "uart_sel", 23),
>   	GATE_INFRA0(CLK_INFRA_UART2, "infra_uart2",
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
