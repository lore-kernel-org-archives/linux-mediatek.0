Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1855EC4332F
	for <linux-mediatek@archiver.kernel.org>; Sun,  6 Nov 2022 09:43:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject
	:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=j3uoZ8eg/BvFs8rs7FPp0J3kaSE2I30G0Ccj5oJr1j0=; b=RAq7qQA7w7/t+/
	e0iOP6UqdmsNUZboGw2Q0xmDCC5sRMwFFbURkkGZj7mQupGUd9097SRCWt6Frjd/ezvVkDXKfKh/Y
	1KDGlgXPEsMfYwmukhT+j0n7zb0gIFw3nHQlt4Tjyg6b3xYPncBCVUlHGOunLVtmb5jEknTdmssLM
	JYTbU9EbmEHG+sCtsOhocxp3aH84F8nQF/+JmGIHd1Xi67J2hMaqvkjggl7Xc0LYr+qBhhWMnnUdZ
	PllEnVYKTWaS1l2jk4KmYPvVCabpy4rps4EtlFj+HrZUszDQH2/SSSuBS6TDIThOP0UvnBOBr/HdA
	8r5l4H2azIPaPA+rQycQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1orcBb-007rlG-6F; Sun, 06 Nov 2022 09:43:27 +0000
Received: from mail-lf1-x12e.google.com ([2a00:1450:4864:20::12e])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1orcBO-007rhi-MQ
	for linux-mediatek@lists.infradead.org; Sun, 06 Nov 2022 09:43:17 +0000
Received: by mail-lf1-x12e.google.com with SMTP id f37so13027920lfv.8
        for <linux-mediatek@lists.infradead.org>; Sun, 06 Nov 2022 01:43:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=j3uoZ8eg/BvFs8rs7FPp0J3kaSE2I30G0Ccj5oJr1j0=;
        b=JhCFu/aUzf0W6T5ML6C7E94GeMV8WaJYKN5uI7XxEQ1qKbP9iZx2yKA3gdoRXBUY2z
         G/fWgv2s4UwsyGK+b+YcsLB+TAb3J1498wTMjElMK1w0V7u5IGc5N59aYO4LhWPBjbV/
         ymHpL33lLG9uCKa53lE6Zh9bK1bWlQsaKoVrdL9ypsbPvHgqBAqRyetcyUHSO7pxTfzU
         WIyxSazI18dj4uWtsregYMTY+05XvBnHJTNwAV39HzjU3XbY77N85RcCsLIinP5fcuPh
         B7ovO/lRaOKsrPsTB9JqRK9QDYeFygiIRitdN8uZZGDxL3F6NoxTK6nnEbwdb7Wl8t97
         bVSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=j3uoZ8eg/BvFs8rs7FPp0J3kaSE2I30G0Ccj5oJr1j0=;
        b=Oc9Yk67aUBD1HwpyZ+4daJq69iYzu7V0ZEE0h8hOJ2m6rWsYfkxw1okn6IXjkxeoP5
         TvJ31UBabVsRpdZTVzn9cE9oy5NtQgLe1ij+kMqnmr4H483P86JdtouJURC1v8UQP4Pl
         vE+CVBvXQhjZvnT36BBA765+SsV/t1LNtULJtVHa8sinVtj6dgX5nQ4A9QkutKOhGsSg
         vgDGlweWt2YOWMbPg/SS08W+mkWxnBM7Mm/1eyzziBsUdWxlROakiEcNGy7diXjITP11
         O7e4lrRGuOGJ9n0BqQMeAspACMSviONFI2FwuI9o99sn1g4CWQ/6VtAcdq18wDLva3MJ
         +4qg==
X-Gm-Message-State: ACrzQf2XJJbtsEJeNm31q/XIj39eGPJUepFShXNgF3Z56gDycdoW0v75
	hT2mLthLulhIgf3t5cqW2+qRWg==
X-Google-Smtp-Source: AMsMyM6yFiVzkAiG6SuBOtUyuRrODZlYhfqyISkrKpHDvrih18jZcYBcgFsRYtxM2rvLqfCkOewXRg==
X-Received: by 2002:ac2:4c47:0:b0:4a2:c07b:4b62 with SMTP id o7-20020ac24c47000000b004a2c07b4b62mr15311753lfk.426.1667727792787;
        Sun, 06 Nov 2022 01:43:12 -0800 (PST)
Received: from [192.168.0.20] (088156142199.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.199])
        by smtp.gmail.com with ESMTPSA id be13-20020a056512250d00b004a8b9c68735sm628148lfb.102.2022.11.06.01.43.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 06 Nov 2022 01:43:12 -0800 (PST)
Message-ID: <143bcd9f-b4af-2651-4f5f-752912b553e1@linaro.org>
Date: Sun, 6 Nov 2022 10:43:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v2 3/6] dt-bindings: pinctrl: mt7986: add generic
 bias-pull* support
Content-Language: en-US
To: Frank Wunderlich <linux@fw-web.de>, linux-mediatek@lists.infradead.org
References: <20221106080114.7426-1-linux@fw-web.de>
 <20221106080114.7426-4-linux@fw-web.de>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221106080114.7426-4-linux@fw-web.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221106_014314_764005_ED842B2A 
X-CRM114-Status: UNSURE (   8.75  )
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
Cc: devicetree@vger.kernel.org, Sam Shih <sam.shih@mediatek.com>, Linus Walleij <linus.walleij@linaro.org>, Sean Wang <sean.wang@kernel.org>, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Matthias Brugger <matthias.bgg@gmail.com>, linux-arm-kernel@lists.infradead.org
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On 06/11/2022 09:01, Frank Wunderlich wrote:
> From: Sam Shih <sam.shih@mediatek.com>
> 
> Since the bias-pull-{up,down} attribute already defines in pinctrl driver
> of mediatek MT7986 SoC, this patch updates bindings to support mediatek
> common bias-pull* function.
> 
> Signed-off-by: Sam Shih <sam.shih@mediatek.com>
> Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
> ---

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


