Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD83ACCD19B
	for <linux-mediatek@archiver.kernel.org>; Wed, 18 Sep 2024 10:56:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=p41HDdPJ9Xqsou/GrXV93VQCKVWaaOB67+1yPY3lbP0=; b=Qe+8XEh4hqgHs1CGNPvBbkqMLe
	dbcb4dsqBA39Fy1isMAQWpMhOPzHOmU84Yf1bD20finnao2wSlPnCXvvlQzPNCoNl34SboGlTo7kc
	YeL8lkr99RqU0vqfOuv4W0ALL3lL+4VQEGjORKsHsLx4915opr9Nvx4wRdkd7zaYn5jQuYhd+ud4T
	QZUnWggmhr7h+K+E2vuPDAi5KjaWHOehH0Aaa2oBMYfPAY2VLD8WDOvBG1ffkZIxdCOPj3Zy01eUG
	MCs5pk2pD6QpmA1FP9jc2NKrF4+OtbmRKjUbvXAp6cB7uPWaFpkKAOllGVNBUoQPPjOoAEeNlyLkc
	f+dwac3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sqsM7-000000084aM-1JAi;
	Wed, 18 Sep 2024 10:56:19 +0000
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sqsM4-000000084Yb-0pXk
	for linux-mediatek@lists.infradead.org;
	Wed, 18 Sep 2024 10:56:17 +0000
Received: by mail-pf1-x42c.google.com with SMTP id d2e1a72fcca58-7191fb54147so4768499b3a.2
        for <linux-mediatek@lists.infradead.org>; Wed, 18 Sep 2024 03:56:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1726656975; x=1727261775; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=p41HDdPJ9Xqsou/GrXV93VQCKVWaaOB67+1yPY3lbP0=;
        b=epM29VE0rxS6TrEWcF4vD0vPZiXom3CBWmtTxg+ArPvnfLBfWoZb6iUmOKdbLxZw9w
         vReV+GFbSV5Kdbn9oGYL+EC1XDcoweNkWH16xCKyKjKJMqk05wXIgVvjaJNngOORO7dm
         LDA2yPQGu/i8K1sxbmsX5K4UyHUTWExXHjxy4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726656975; x=1727261775;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=p41HDdPJ9Xqsou/GrXV93VQCKVWaaOB67+1yPY3lbP0=;
        b=Ky172P02pF/CQJO1ZS9LgbVZbXuFTRRTBED25UlYlAYRGAg8Co985s31PHvVGVa5/h
         Qjx4PR01NxPpRIESNPUuWNiwO9sg2K9Z8KTUTWisgQP/YRzBSBeCrI2xMLE+ogiyTtMJ
         kyUz3VeyEM2yqli4BeDtRpIaawRUUWziFLWGdbsTTIELUMe5NGEyRSw+FSNUAkXd95TA
         asUJ67aN4kyTESK5C7/G/xDiqSsM3xxTbqzM+puSpH2RWQZijE0OTnwG+ZwKBW9Fi/TA
         SB0t0xkv+SlqCtJJ2bRih8K+dCA2xWYqPeKRdA5WS86OTqX8LkwLhwiuUzhu9oHVXDqD
         oYyQ==
X-Forwarded-Encrypted: i=1; AJvYcCVbJ3FZlfk+fEp2sJGkw+ggNNkoLhaJmlI+VLMaXyKQlFgqT1Gv3gmRBI8u/2vJcb4OkFliKlhwGFs/oilqQg==@lists.infradead.org
X-Gm-Message-State: AOJu0YwumWQZi672JtLI6NqJXQZgQth69uZ6HhV2I1QvQM0hWpak44Vd
	7TAwLKsG6r7Gv4LjycyloxnOPPMJoQ6XQHzKaOzTAg3RG8vr4uhgE4hfXZET5w==
X-Google-Smtp-Source: AGHT+IFhMb15QzWlbO320Kzkgs8u2zWlJt0MSXq3KFswpzmoxO8x4jWlVrgugevSX5yLlMwZDNzRXw==
X-Received: by 2002:a05:6a00:1906:b0:70d:2621:5808 with SMTP id d2e1a72fcca58-7192607fcb9mr33427847b3a.9.1726656974863;
        Wed, 18 Sep 2024 03:56:14 -0700 (PDT)
Received: from [192.168.0.103] ([103.163.98.64])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71944b7b754sm6505848b3a.105.2024.09.18.03.56.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Sep 2024 03:56:14 -0700 (PDT)
Message-ID: <110f6583-f76d-4c7c-bd77-cdeb21b78704@chromium.org>
Date: Wed, 18 Sep 2024 16:26:10 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dt-bindings: display: mediatek: dpi: Add power domain for
 MT8195 DP_INTF
To: Rob Herring <robh@kernel.org>
Cc: chunkuang.hu@kernel.org, krzk+dt@kernel.org, ck.hu@mediatek.com,
 linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 kernel test robot <lkp@intel.com>
References: <20240911071722.558960-1-rohiagar@chromium.org>
 <20240916171107.GA605353-robh@kernel.org>
Content-Language: en-US
From: Rohit Agarwal <rohiagar@chromium.org>
In-Reply-To: <20240916171107.GA605353-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240918_035616_299864_3BF40BFC 
X-CRM114-Status: GOOD (  16.07  )
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


On 16/09/24 10:41 PM, Rob Herring wrote:
> On Wed, Sep 11, 2024 at 07:17:21AM +0000, Rohit Agarwal wrote:
>> Add power domain binding for MT8195 DP_INTF that resolves the following
>> error and many more similar ones:
>>
>> arch/arm64/boot/dts/mediatek/mt8195-cherry-dojo-r1.dtb: dp-intf@1c113000:
>> power-domains: False schema does not allow [[55, 18]]
>>
>> Reported-by: kernel test robot <lkp@intel.com>
>> Closes: https://lore.kernel.org/oe-kbuild-all/202409102119.AYvaTjUi-lkp@intel.com/
> Fixes?
Will add in the next version.
>
>> Signed-off-by: Rohit Agarwal <rohiagar@chromium.org>
>> ---
>>   .../devicetree/bindings/display/mediatek/mediatek,dpi.yaml       | 1 +
>>   1 file changed, 1 insertion(+)
>>
>> diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.yaml
>> index 3a82aec9021c..07acc8a76bfc 100644
>> --- a/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.yaml
>> +++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.yaml
>> @@ -89,6 +89,7 @@ allOf:
>>                   - mediatek,mt6795-dpi
>>                   - mediatek,mt8173-dpi
>>                   - mediatek,mt8186-dpi
>> +                - mediatek,mt8195-dp-intf
> mt8183 is also missing. There's a patch[1] to fix it, but it's wrong
> given the recent changes. It would be best to fix both in one
> patch/series as 2 separate patches will have conflicts.
>
> Rob
>
>
> [1] https://lore.kernel.org/all/20240912144430.3161717-2-treapking@chromium.org/

Ok, Sure will have a new (separate) patch added here to include the 
compatible strings. Thanks for pointing out.

Thanks,
Rohit.



