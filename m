Return-Path: <SRS0=76sT=BB=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	NICE_REPLY_A,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CCE68C433E6
	for <linux-mediatek@archiver.kernel.org>; Wed, 22 Jul 2020 15:22:16 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9823C207CD
	for <linux-mediatek@archiver.kernel.org>; Wed, 22 Jul 2020 15:22:16 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="yj8yJg5m";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="imeZj4AE"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9823C207CD
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Q6yEEMR158YLFKU/VVgraFdFmG7fum0T5otuozXlUk4=; b=yj8yJg5mAo56HGL+RhCrCUC8G
	ntdACDUMwwHKnaZPtKKNPju8hQ0fRwhHmIyBXX2XDw52t9qNXvuiAYdq4PLr4HcnLT3V4Z4n5unT0
	slAyacn4TDuhI7EAv7a/nf8TZmP8IiTw6VlY01ZHdmyKi3mtVMwmcarhAsmaf776FMcKEP6SkgC1x
	Ol7MHJqjzLnjq09czRWPMH7Io04U8/DUo3DSQbhnxVeWC+BwccaMiRBDp6XKUp9vWwZ6yGx/BmgGW
	vy+r8n/zs0hISmxv3xcFPAvGLSu+Kd4ZCtcYAsSnowC9QULm06Hsn5GbjyePwtYvt98JLsKguAtcI
	3zguoMqrg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jyGZL-0005K8-BE; Wed, 22 Jul 2020 15:22:07 +0000
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jyGZJ-0005JG-6W; Wed, 22 Jul 2020 15:22:05 +0000
Received: by mail-wm1-x341.google.com with SMTP id 9so2274942wmj.5;
 Wed, 22 Jul 2020 08:22:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=UokfCGgQvnD2I8kwHgAfuGQiMzG41Bmy/qva1i+Xr9Q=;
 b=imeZj4AEQyXBwgRrZlJdwAXZqNDjzwecGKQh0aKMXJ1vzp2W0nXKyPJU9w23CE/aFp
 jK95QcRtfBrgTZZXK4f7d3Pq36AwEGyEbyOpZEbQYa0OSAkOALs2OvRxsqhCEU+T2dN0
 BTrCx5VQXaHOKGktrfqurfjLvpU6LM5FxE+n19bEtjpZUHPBrHv5YPT7MGNA5ECQUDmN
 xW4MdCnPNLn6hcnVVdjyxlho0UiRJszsUlxtgjGCXu3iSHdvFM83TAIraQIpLnFVTEwc
 dLvne+O3+bb7jcvCum4AYlmxfNPWDLv36ws1h7TX/EiyZChzZhgV11i+xEGBS+720NCr
 exlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=UokfCGgQvnD2I8kwHgAfuGQiMzG41Bmy/qva1i+Xr9Q=;
 b=e87JWNN4xai640t51W+9RviP1PJmhDNwLxaNN9mz8Z9Laq8Jk328R81gogQ6TarxEW
 m/FdmAVASpZGczUyGASKFIrPuudOKBMjAwyDfLfmQbjG2LHoHteRgR2+AZ/Q+gxEV7Bk
 0fAQnslyf/nR312tGPbXm8qHT0LsuxwJVo8zeSLpnizQvnYLziKe+PZW0yFm4963JDk2
 rLstXPEyDUt5yP/BL5KZWCG8VZpdFy9w+VhBVz8hbgQz7fl9/sx1D/Q+igUFWHKqeR89
 KYWl78510JdJqwDJ9DgRYp+Yvkqv6onWGF3MZuzg0MmKDCKn0MW63MWpRaOlv1vHxUOV
 zQxQ==
X-Gm-Message-State: AOAM532543B6eG6pf/RcmXdZ6RcjzkZyoMqudNv8duIAmU8+Z0YVcWsf
 a+mJZK1lK/s311K+38M9N1k=
X-Google-Smtp-Source: ABdhPJyAPut+TAg/un14lNKUNan1m8Z2X5FFrV8YS2K81Ftu5MA3wRE94lOSafgYYhDz4Vb0ZrTUcw==
X-Received: by 2002:a1c:7510:: with SMTP id o16mr164221wmc.146.1595431324185; 
 Wed, 22 Jul 2020 08:22:04 -0700 (PDT)
Received: from ziggy.stardust ([213.195.122.158])
 by smtp.gmail.com with ESMTPSA id z6sm329784wrs.36.2020.07.22.08.22.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 22 Jul 2020 08:22:03 -0700 (PDT)
Subject: Re: [PATCH v2 1/2] dt-bindings: clock: remove UART3 clock support
To: Hanks Chen <hanks.chen@mediatek.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh+dt@kernel.org>
References: <1595387397-13110-1-git-send-email-hanks.chen@mediatek.com>
 <1595387397-13110-2-git-send-email-hanks.chen@mediatek.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
Message-ID: <fe7cca1e-467e-e693-6d2d-16ffb0954621@gmail.com>
Date: Wed, 22 Jul 2020 17:22:01 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <1595387397-13110-2-git-send-email-hanks.chen@mediatek.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200722_112205_276171_99BC57DC 
X-CRM114-Status: GOOD (  14.50  )
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
Cc: CC Hwang <cc.hwang@mediatek.com>, wsd_upstream@mediatek.com,
 YueHaibing <yuehaibing@huawei.com>, linux-kernel@vger.kernel.org,
 linux-gpio@vger.kernel.org, linux-mediatek@lists.infradead.org,
 mtk01761 <wendell.lin@mediatek.com>, linux-arm-kernel@lists.infradead.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org



On 22/07/2020 05:09, Hanks Chen wrote:
> remove the redundant clk interface of uart.
> 
> Signed-off-by: Hanks Chen <hanks.chen@mediatek.com>

Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com>

> ---
>   include/dt-bindings/clock/mt6779-clk.h | 1 -
>   1 file changed, 1 deletion(-)
> 
> diff --git a/include/dt-bindings/clock/mt6779-clk.h b/include/dt-bindings/clock/mt6779-clk.h
> index b083139afbd2..2b5f2354d7eb 100644
> --- a/include/dt-bindings/clock/mt6779-clk.h
> +++ b/include/dt-bindings/clock/mt6779-clk.h
> @@ -229,7 +229,6 @@
>   #define CLK_INFRA_UART0			21
>   #define CLK_INFRA_UART1			22
>   #define CLK_INFRA_UART2			23
> -#define CLK_INFRA_UART3			24
>   #define CLK_INFRA_GCE_26M		25
>   #define CLK_INFRA_CQ_DMA_FPC		26
>   #define CLK_INFRA_BTIF			27
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
