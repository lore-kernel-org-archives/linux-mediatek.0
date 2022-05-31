Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3FDCC433FE
	for <linux-mediatek@archiver.kernel.org>; Tue, 31 May 2022 11:45:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=X3FlnsH4x80f82Uv7DUreC/BGdew5ttpd6/RJ2ldP8I=; b=499QKZ7/e1eRVi
	RlZGd0fPWLAv+my0LK/ZSVLM4gg2nRBWSPAK6gniToKKWsDjtsGGO1fGrvcBI7K1nkmyhFeyvw62H
	MDVnUjq4XQ/JPgUycfFe8P9yoWoSPPhKyByDEDh/PYbPtuA47ZIgsSeAkvLO1JmgT4BL/LSXDYhav
	+fnqDO0DHDW42xLaskjby4hAgS2XeHAcXLt7W8BZa+uMGIcXFtGzGmNAjssoYTtgK39WsfZohpRf9
	cC1UG4KU6Ag6C9to0PDSJv3iCgxmjFhbfvRI80S5V/Mroj+3UfF2LlCp/kvJGM4qcKI7VKmRNzU59
	oiCT8FZ6ykMYvcH3u2Vw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nw0JL-00AYZD-OZ; Tue, 31 May 2022 11:45:19 +0000
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nw0J9-00AYVv-Gt
	for linux-mediatek@lists.infradead.org; Tue, 31 May 2022 11:45:08 +0000
Received: by mail-ed1-x534.google.com with SMTP id v25so9067677eda.6
        for <linux-mediatek@lists.infradead.org>; Tue, 31 May 2022 04:45:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=O6+wiVWCxeTjduCZyyUvzxpHHklmrln6oj83M02p3Zo=;
        b=j449XP+PpAVAn2lL+V33btwaHS45cc2ztlQWFJJCsGN2eqWpJXmxFPDwjyvo98lQEy
         16+XE2Mf5EDFL/saHl/GkMdWDiDU47tW4qqWezPmabvg7/dSrFJLea4/OA3Ill36D7kR
         PVPP89/ymNhLxib/FBTYso8mOJ7mtmNpcF8ino8Cok7sXq1ey6V7Mf3Qry7WLwlILl0c
         vdOQRhOs5ONx7yB0e1pCuUkF+cOi8+3yd02PWa4Rza7Pwbno3s4OyhqD1M01h062yo98
         KexKgRkGR+LBmldwl+ulQpoCTTinm50svbIZPrMBIhJ02bOJsEfL6ZfPCOTBwrDkndw5
         IwcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=O6+wiVWCxeTjduCZyyUvzxpHHklmrln6oj83M02p3Zo=;
        b=S3k10ps7M/7rFdFoIx4YRyziBqsv7YRHjA4fYQYuisNvGXEgj5+FZvlk7s+jR4PTls
         W8OSjGcrMSYXsAJa0/wGcQEDO8EzybZLWGCnqqrbWNtip0c4PGkxVV+bopcISJ8wxGPI
         OVwzXux2Eooj15fzNiz0BP6RmfIUm45O8lqoF42g766EXgzdkZVKFU160iAmVlkzS0Wn
         bEflSrXU9qOYK8QqvHLDIMS/mY9LH8va4wycPaJaHI2xHkbHsreOnSQVYCL/IEtZHBR7
         OHb/vnJQ4TmZvJJXWMm56HU3ItH4StSNmRAHG3WavAnxLQyisgZZQId9JuZaM0sC3QFJ
         o4bQ==
X-Gm-Message-State: AOAM5338TRGKhn0L+q+tRZ4r5mUngIWQ2fAj0DJnfu+PyTbuVV30Vvk9
	UJtgbQSdJAgAVTitwa79Mm9NYA==
X-Google-Smtp-Source: ABdhPJy3aYOT5Ob3M3AXU72KcizrvpfCWWtfDQyx0gYly5JJ58ILcHIiDAne39M+iV/eJ8Ifm5Hlbg==
X-Received: by 2002:a05:6402:354c:b0:42b:4e22:203b with SMTP id f12-20020a056402354c00b0042b4e22203bmr49232992edd.308.1653997505455;
        Tue, 31 May 2022 04:45:05 -0700 (PDT)
Received: from [192.168.0.179] (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id y9-20020a056402270900b0042bca34bd15sm8359958edd.95.2022.05.31.04.45.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 31 May 2022 04:45:04 -0700 (PDT)
Message-ID: <ec0abd45-d122-2099-c06f-dbcfb01bbee9@linaro.org>
Date: Tue, 31 May 2022 13:45:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH v2 1/2] dt-bindings: clock: mediatek: add bindings for
 MT8365 SoC
Content-Language: en-US
To: Fabien Parent <fparent@baylibre.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20220530214434.1012889-1-fparent@baylibre.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220530214434.1012889-1-fparent@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220531_044507_628109_5464BCC7 
X-CRM114-Status: GOOD (  11.11  )
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

On 30/05/2022 23:44, Fabien Parent wrote:
> Add the clock bindings for the MediaTek MT8365 SoC.
> 
> Signed-off-by: Fabien Parent <fparent@baylibre.com>
> ---
> v2:
>  * Fix copy/paste: change maintainer
>  * Remove part of the descriptions. It was a copy/paste from other bindings.
>  * Add #clock-cells to list of required properties
>  * Only show one example per yaml file
>  * rename node name to clock-controller
>  * update copyright
>  * remove trailing new line at end of header file
>  * move yaml file to Documentation/devicetree/bindings/clock/
>  * rename header file to contain chip vendor
>  * fix dt_binding_check errors


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
