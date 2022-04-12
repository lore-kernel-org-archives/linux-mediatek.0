Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8EEE3C433EF
	for <linux-mediatek@archiver.kernel.org>; Tue, 12 Apr 2022 08:51:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5oZW516mG3Szrs4HjZ2pnF3fQFYiLiMwP++3MJP5c/w=; b=K7mZ1ak1pxe2V5
	gFBfWJJtxbCiXYSL1e8x9TKTfU7oNCgc0lZxELHTgCEZBvvfZh14CdAparUdx+Kc6EEq9RUvUXUVC
	27ZoXgllDG3QQ0XGnb78ZyQBs9PlcBoYohM7AFPr5hQBTESr26TioWK55yr5jva77sEXtlVE65xvh
	XHmq+ofzw+7YQaEymzB00kTbt05ut5DYjLmt/0PZr0dmowoh/9H6FH8s0Ca0BEtYot1G6Dhw1fXCJ
	tuzuMelIS2nk9HXenHBb0qBN18bI11d9BqrsGVt1ug9ORKLezkIwrPreKirdRxfJ6HWOjVdc6erx+
	RgLQyEGyvJ71xSC9ElYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1neCFO-00Cgh4-BH; Tue, 12 Apr 2022 08:51:38 +0000
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1neCFL-00Cges-9G
 for linux-mediatek@lists.infradead.org; Tue, 12 Apr 2022 08:51:36 +0000
Received: by mail-ed1-x52d.google.com with SMTP id c6so6367288edn.8
 for <linux-mediatek@lists.infradead.org>; Tue, 12 Apr 2022 01:51:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=VyKuoVOFtbJpQqYL42DYs7vEqjn6TG+3AG+tuB3ScVs=;
 b=R4JpCrbTrv7VPod1/4uHIpPG60WwEs6xdg5RD47te/xuroYSMJV17AJ9kTj+IjCRfl
 1vvR6A9B+eDfXxQpkBMMoUr1qtN8ZykBYccQDCshfgpuJSIW6r2x+qMueE6JZN8/31sv
 NyxM36AjZiwkWybsHCh+WNLUkZD/m+HTzhkVN5d3GsSnz+TOnW+oZ6DWwlnQHfFNEKt9
 8gi6kCzc/6dfh+pI59Xll/cqC4SVrUG0AYHSAy1sC30xGWHvUIYFVVrzPJp0NTKtNUrU
 FC70CNLpMPZ8gckRC69enVnqUIZkm5W9p4O3G3x5WYY7IOVJDDiJcmOAAI8CsfkInQX8
 5p5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=VyKuoVOFtbJpQqYL42DYs7vEqjn6TG+3AG+tuB3ScVs=;
 b=ORJa7o710JtSW9N0HjoL9C1NL1fbSHBeyP3j1EIhDdO/ebIRcT5gFEFH54DZbzsNeT
 xqnJC9JwhdwjT9XVurGNr7iWn3UzhsTX57vCTVYa0i+HrHCwzSWPxDysQklOSDpHVVXA
 hni9yVxfkj7xBj9RlFlg8qjQ1mHB3zabL7SMCJWansHtJQ4ZM+geaaIy/xB3vnUPAkSV
 agskoIDYiYCm38EYsskkQ4hYrp6+z6+EzZ9lThHxgk2uktxNjcvb1Ncm+Vblifldkvco
 N87pCY1dIQLsDj/k6bLj1b5upS7oy8MFIb8rjxytSO1zwXNv2Xx8Y/UvN0L5JFYwxwBx
 rp0Q==
X-Gm-Message-State: AOAM531CNcMLf1/h6njfuSOyhFUYDcJPFZQomvgjmpCRaen8I60bj1TZ
 1bv4kD4Ta7oZZ4DOGUHHD8iXqQ==
X-Google-Smtp-Source: ABdhPJzhgwKUzzSz6he1cnlPJJ1RdVI6ilJSVC2f6gsXEHJNEA9nt9WQDY78OnBYwejeXogZpjSQFA==
X-Received: by 2002:aa7:cac4:0:b0:418:85b7:adec with SMTP id
 l4-20020aa7cac4000000b0041885b7adecmr37427381edt.231.1649753490825; 
 Tue, 12 Apr 2022 01:51:30 -0700 (PDT)
Received: from [192.168.0.194] (xdsl-188-155-201-27.adslplus.ch.
 [188.155.201.27]) by smtp.gmail.com with ESMTPSA id
 g2-20020a50bf42000000b0041cc5233252sm13505771edk.57.2022.04.12.01.51.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 12 Apr 2022 01:51:30 -0700 (PDT)
Message-ID: <ad2c72e8-4608-9527-146d-43aa006e1306@linaro.org>
Date: Tue, 12 Apr 2022 10:51:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v2 2/2] PM / devfreq: mediatek: Introduce MediaTek CCI
 devfreq driver
Content-Language: en-US
To: Johnson Wang <johnson.wang@mediatek.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, cw00.choi@samsung.com,
 krzk+dt@kernel.org, robh+dt@kernel.org, kyungmin.park@samsung.com
Cc: khilman@kernel.org, linux-pm@vger.kernel.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 jia-wei.chang@mediatek.com, Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20220408052150.22536-1-johnson.wang@mediatek.com>
 <20220408052150.22536-3-johnson.wang@mediatek.com>
 <76d58182-2f56-32b2-42e9-2ecbdd09ba3d@linaro.org>
 <d900f8181bddb20a56231310d46b9427c40e77b8.camel@mediatek.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <d900f8181bddb20a56231310d46b9427c40e77b8.camel@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220412_015135_353515_57356955 
X-CRM114-Status: GOOD (  12.89  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On 12/04/2022 10:39, Johnson Wang wrote:
>>> +static struct platform_driver mtk_ccifreq_platdrv = {
>>> +	.probe	= mtk_ccifreq_probe,
>>> +	.remove	= mtk_ccifreq_remove,
>>> +	.driver = {
>>> +		.name = "mtk-ccifreq",
>>> +		.of_match_table = of_match_ptr(mtk_ccifreq_machines),
>>
>> You use of_match_ptr() so is it possible to build it without OF? If
>> so,
>> then mtk_ccifreq_machines needs maybe_unused.
>>
> 
> No, this driver must be built with OF due to our CPU arch.

COMPILE_TEST does not use your arch... There are stubs for most of
of-like functions, so !OF should build anyway.

> Should I add some dependencies in Kconfig to ensure OF is enabled?

There are different ways to solve it and it depends on what goal do you
want to achieve? One ways is to use maybe_unused and of_match_ptr. Other
way is to do not use them (skip both).

Best regards,
Krzysztof

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
