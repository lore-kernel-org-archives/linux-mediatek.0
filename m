Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C353C433FE
	for <linux-mediatek@archiver.kernel.org>; Tue, 18 Oct 2022 18:29:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Jf71w/kMAtLTuZpw+aeynxFbJonRYosXdM0sN0F9YJQ=; b=XWWcSITfHM3NQ7V19zcw8FNdHa
	MWC0w3rcogBltoBT8tuqNj4LI/PlMANWyylfz7D1XqXZrAev0q9rn03/d3qYFjzYKjsFiFnRSTIDG
	2L9QGHWu0hCGuyLnOYeSvE7pamRwcjP/IJipQ3aOOoCEtyQvgGtBEE/1dhl/Q+LKceWTgQZE2YlwD
	9Yq3hz1FSpxglfJnVYGkEwYzp/3FrN0vySZqA4OReQY1uyrB8yKCvxDVISF9opk11icJTmPImz2oq
	cy1yTSgORiQ+9Z8h2t6wus7koW2gMPBehJSF1e3dpgjBYqCdt4Z6ugm6d/pWzG6ABiCCHImzfOSFq
	TGb+zFKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1okrL7-009v4G-2Y; Tue, 18 Oct 2022 18:29:21 +0000
Received: from mail-qk1-x72f.google.com ([2607:f8b0:4864:20::72f])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1okrKw-009v2Q-P0
	for linux-mediatek@lists.infradead.org; Tue, 18 Oct 2022 18:29:11 +0000
Received: by mail-qk1-x72f.google.com with SMTP id t25so9236050qkm.2
        for <linux-mediatek@lists.infradead.org>; Tue, 18 Oct 2022 11:29:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Jf71w/kMAtLTuZpw+aeynxFbJonRYosXdM0sN0F9YJQ=;
        b=QyPtio5WxIjCn0zb+wjna2OySfw2zIuGY3eeBmkvLgsfLTvwctfMJVZB2v95/HPEjG
         W/LzBAjV7nX5q6D6mL2vXB9CwWc35oUIbragvzLNU2vBhPn0HQMAXTeIOPg9WKdKbcj0
         oRvf72Vpd6pIkGIsOe4Nk11/QqMfBFl5IRjl5qnV6xLDQ9WYhqCtAVO6YWTPfYa2gFcf
         wqFEzpDL89d8RZ/IjCHCC6fAnFN4xyxb7vQbY2vloC81sFeyAZWHHFq7g6wqOjHucsWJ
         JzBwV7nPLTdeMJVBK6GvWgsUOvghhC4kEYesz8jNDvMMMLvCLzsoU5S6HglApZ8IPcMB
         JP4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Jf71w/kMAtLTuZpw+aeynxFbJonRYosXdM0sN0F9YJQ=;
        b=jL56iAHfokOOkwZtyOfJAQlUKVgQSDMtX90ogfAdsAP/PUtjZnrb7RiDw/k6VcgoiL
         KxIfPvE+NrweDN3Wn2XkdwGoZD+iyAItqZVzsdXg0RdtxcrpH79xmBIjqul9keqOEcY6
         OWaFBOTYqBPhLlRPtR2ZwEhkXJJGukxZC5mWMtmaRBN1Y2/7xuQjp3VM+0FILaXj/6JH
         nZEyN/70pZHmVw86LQCgTHrDd8+GPxPDHFFs3Ki7I4lR6w6PkIURl+aJ9EAzLR6ian4N
         Jrds2rlm1KyJYL87byzbBdh2+O56Qy4yxNQtMRN0MM8da6hdcVriT1bhkdty0F7llXwX
         Nwpw==
X-Gm-Message-State: ACrzQf05Q5ZWnciEQZU+SSEJal37XCpWl2GLwvp/kyOAdZM7TaMRGeDd
	0Nu2JD4YVjlHlCJpyZ619pHGjA==
X-Google-Smtp-Source: AMsMyM6Ka5CO8JW+udIuW1pTo+oi3POKxDhOQ2etdGB19wypOpdxMZP7SqrspYTEsdDdzY/4x5HGTg==
X-Received: by 2002:a05:620a:1452:b0:6ec:3f82:522b with SMTP id i18-20020a05620a145200b006ec3f82522bmr2719440qkl.402.1666117745901;
        Tue, 18 Oct 2022 11:29:05 -0700 (PDT)
Received: from [192.168.10.124] (pool-72-83-177-149.washdc.east.verizon.net. [72.83.177.149])
        by smtp.gmail.com with ESMTPSA id y4-20020a37e304000000b006b5cc25535fsm2699092qki.99.2022.10.18.11.29.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Oct 2022 11:29:04 -0700 (PDT)
Message-ID: <5d87f1c3-1c73-054b-dca1-9f52939e187d@linaro.org>
Date: Tue, 18 Oct 2022 14:29:03 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Subject: Re: [PATCH 2/2] dt-bingdings: mmc: Mediatek: add ICE clock
Content-Language: en-US
To: Mengqi Zhang <mengqi.zhang@mediatek.com>, chaotian.jing@mediatek.com,
 ulf.hansson@linaro.org, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, matthias.bgg@gmail.com,
 wenbin.mei@mediatek.com
Cc: linux-mmc@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20221017142007.5408-1-mengqi.zhang@mediatek.com>
 <20221017142007.5408-3-mengqi.zhang@mediatek.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221017142007.5408-3-mengqi.zhang@mediatek.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221018_112910_822468_2E882107 
X-CRM114-Status: UNSURE (   9.51  )
X-CRM114-Notice: Please train this message.
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

On 17/10/2022 10:20, Mengqi Zhang wrote:
> Document the binding for crypto clock of the Inline Crypto Engine
> of Mediatek SoCs.

This does not match the patch contents at all.

> 
> Signed-off-by: Mengqi Zhang <mengqi.zhang@mediatek.com>
> ---
>  Documentation/devicetree/bindings/mmc/mtk-sd.yaml | 2 ++
>  1 file changed, 2 insertions(+)

Best regards,
Krzysztof


