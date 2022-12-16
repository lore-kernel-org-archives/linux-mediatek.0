Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66B56C4332F
	for <linux-mediatek@archiver.kernel.org>; Fri, 16 Dec 2022 10:59:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SVJpKmqfc75gvy1Z50KnGNDLe2BU4CCyVDTSkolvh5U=; b=ejMmtw7lAJMB7JKe9s++M0ZAiQ
	fwK/xrYscV4h6ImDNTQ5rBHy2FDesW/drGNkLIXfI1KhN7rxDVKf8N8vPtztbeS7K6g9hmzFE8Axn
	HUiu0bBmZn/q6VIK45bQh8wSnQHZr3+jpE+WGwdmbGLqIvMAJ1oB9TidKhtHMNX3kTQgTyNiL0wWe
	Jpr2H6ljAXuqbd9O9gTiup+zQEPbB5Drpmvm8/s1s+8FhHgAyg1W8HUTtBbR4obeYuPz9mr8ds3jw
	oxJQU9kGZuxyGBeY+Q7nnk8Monl9rrPZDdGcZDQoTxx+XaAqIQjoUvWWG9W1+JNf58y1eSh2MMJO6
	1EFUHLGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p68Qd-00EHMF-Gk; Fri, 16 Dec 2022 10:58:59 +0000
Received: from mail-lf1-x133.google.com ([2a00:1450:4864:20::133])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p68QL-00EHAF-5J
	for linux-mediatek@lists.infradead.org; Fri, 16 Dec 2022 10:58:42 +0000
Received: by mail-lf1-x133.google.com with SMTP id z26so2898122lfu.8
        for <linux-mediatek@lists.infradead.org>; Fri, 16 Dec 2022 02:58:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=SVJpKmqfc75gvy1Z50KnGNDLe2BU4CCyVDTSkolvh5U=;
        b=GTH5VXht+LUVhVD4aiQbpvosHo19veTLjxLnnhc4l3jyFskwcw+y2XqDD7hrJNuPiJ
         ZceDWQlYpDbuOG3mJp88TnZ5d8utsea4yDTzW7m+J+oILl/AVK13luoaTyJnPIpk6KXV
         Qfctmz6JoIL6vaD7lHv9Cr75MvmwHzz9pKqQpPFWYbr5pN9iZ46Gpma+Hk9MJY8/DGn3
         guLTL+gJNeBvCai9fYeYPPVmJeOfEuI7/r/1kxTTrDSdbPlAwZWWk8qEZptMBkK23o/F
         eDcnOsXUH5jhaCm7oXoWzvPjI780NnDjo+ZPdJ8tLgO6WwiLw0QFwZIOJtpelnSlkESc
         yEsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SVJpKmqfc75gvy1Z50KnGNDLe2BU4CCyVDTSkolvh5U=;
        b=pFyBFvYWZOTXnnxOoRrMABxbcaIoxYrrWtonqXrXTnkJrRRTG4OMAGuZNv0WwS3UuU
         Gs5sI394yHYOd93FgqmerGcdiX/D6tom86dcy067N6LYkW7dDnDKgcVVOghzTHh0bFdb
         vMT/ow6qOfDFvh66fjktohFabVAKSCCGEmUiIn6tODjK7WTStqbTG5p+e71CbQ15oDA9
         K69oXgNoPxBaqEE+S4m6tBgfDVINH88ctofvoOObYa7RNQCAoM2wqrz3qAoY6WxHt5xI
         zKbygd13UEEm4Tllicl8eAIjxv1809YTNEEmMSawMeviiWH8V939d1hEbI/BF8RkIam7
         AmOA==
X-Gm-Message-State: ANoB5pnJoR9qFABbVhf+hE+ZTblmNcEom8EjnunPoQKHM4ltO+3D8OQq
	85DUKJjqMn3onjlUUhhS94DGshpKZKPPwCAG
X-Google-Smtp-Source: AA0mqf7KaaxHndY+Tb6alrKKxdHUig3JmTRuspaG46BrfUxehq2Cv44HHpYc4kJwqPQg9utm8NEgCA==
X-Received: by 2002:a05:6512:2586:b0:4b5:2eb9:8d3 with SMTP id bf6-20020a056512258600b004b52eb908d3mr8322317lfb.19.1671188318546;
        Fri, 16 Dec 2022 02:58:38 -0800 (PST)
Received: from [192.168.0.20] (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id f10-20020a19ae0a000000b004b40f2e25d3sm188358lfc.122.2022.12.16.02.58.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 Dec 2022 02:58:38 -0800 (PST)
Message-ID: <e7f8b106-b71e-eac9-c2a0-83579382f0f4@linaro.org>
Date: Fri, 16 Dec 2022 11:58:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH] arm64: dts: mt8183: kukui: Split out keyboard node and
 describe detachables
Content-Language: en-US
To: Hsin-Yi Wang <hsinyi@chromium.org>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20220527045353.2483042-1-hsinyi@chromium.org>
 <CAJMQK-jWwDm4dy-ELzJ5gzLby37Ztqn9qhGT9zqFhmowdok51g@mail.gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <CAJMQK-jWwDm4dy-ELzJ5gzLby37Ztqn9qhGT9zqFhmowdok51g@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221216_025841_221043_DF9FD53E 
X-CRM114-Status: GOOD (  10.58  )
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

On 16/12/2022 11:54, Hsin-Yi Wang wrote:
> On Fri, May 27, 2022 at 12:54 PM Hsin-Yi Wang <hsinyi@chromium.org> wrote:
>>
>> Kukui devices krane, kodana, and kakadu use detachable keyboards, which
>> only have switches to be registered.
>>
>> Change the keyboard node's compatible of those boards to the newly
>> introduced "google,cros-ec-keyb-switches", which won't include matrix
>> properties.
>>
>> Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
>> ---
> 
> hi Matthias,
> 
> Kindly ping on this patch. Thanks.

It's a merge window, so for what do you ping now?

Best regards,
Krzysztof


