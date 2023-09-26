Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA470E7F127
	for <linux-mediatek@archiver.kernel.org>; Tue, 26 Sep 2023 20:32:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7e8pTP8dawYEYAgdlTPvMxdmnzzd4ZSMO7Pw/iww7Wc=; b=eD37vLkdml+6Z492FNqFJlIWCR
	22oqCQIFdebU6bo8ZcQjqXp8GfFv+9u7rl29ER4rj4fQekaahhS7rrS6vdDQ0Hw1XwUszG4gRYjCK
	g5VoLiABtm1jvrxI0IfLp/EO2PZYSaZNQgUDAZlVZznUQSjT009AMOZhu7N9vL0rr3pxTDV4G1med
	910iRKlIpm4LG1B9a6Yl/yCzUJNI9nt/qbyxauhvFoqXj1Yf0T/LvdTk5aL66AwT8sPtEBMLxQ0gO
	siIvi3WA72e9ID0OpQ++p/4GE6Khegvg/ItLvjEeS4K20jcG5nuzjBlROXzBWrrnKJatyI8TjFVF7
	B1l00ixw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qlEjm-00H0CA-0q;
	Tue, 26 Sep 2023 20:32:54 +0000
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qlEji-00H0B7-37
	for linux-mediatek@lists.infradead.org;
	Tue, 26 Sep 2023 20:32:52 +0000
Received: by mail-ed1-x531.google.com with SMTP id 4fb4d7f45d1cf-533f193fc8dso6839018a12.2
        for <linux-mediatek@lists.infradead.org>; Tue, 26 Sep 2023 13:32:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1695760368; x=1696365168; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7e8pTP8dawYEYAgdlTPvMxdmnzzd4ZSMO7Pw/iww7Wc=;
        b=Yw8fJ1m4xZpJ0ATPAiPB0fzFB2BefPnk8J5muVEXH6ahW4uXsygJ7v2H0PTitt8m7G
         8V85AuRrjOvUmsphWnWL8U6it6k4Wx/142RQU0Mo67F8cyiuFNZ9xf+MEBHZeXJWOr5x
         RoyyPTRn8wiMeywz5+bYwmwXS9Z87+mkeKtZcj3nRPqyWbwSx4N2ubv2PeLkD5+hw3zo
         q+kBKJFNRdrbOsJiSZYM1Wu5E94O0BToYUqjH+jNDQkTi12X+OEMjRajRjntEoNLPZIY
         y4PzYGTkkaaohAjpvWVfHorZWad7g/7vOikY/i6EZuLIojQRcx7T9iX1vyp3xiyEwrzk
         rxTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695760368; x=1696365168;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7e8pTP8dawYEYAgdlTPvMxdmnzzd4ZSMO7Pw/iww7Wc=;
        b=cRi2ip8d6J5tqlC7fzcN8frakiG0uXCdpqyBIZVOLP4WxE88jlXCUTbf0WxUWEKcQz
         r5Lqc8iYmYVft2UOlyfiQGPiF4ZC3/b8er4moctU3b/OJTieKjZn9zRlRSFFybGClRc/
         wtibw/Lfk5r051oBsNMMduRAlImcm26QSvjzhkzKZiscq3bt5MgBuHn7UMZrVetWQkBT
         8/ruKhmVyuiBfGN0hpI0JPrPrNXUkumKdJEpJ0p/hfrsWUY6kJJ8OZrIZ+C9AHP/YfYe
         cFwrtgPfzRPV6vF0130SYCROZUoUxnewAoaMOFn/zDZ8q4s27y6d1g7wgCRPbrlOnJxM
         9b7w==
X-Gm-Message-State: AOJu0YwfNnE+L8qd/mrFHVmm2dF+BiJV8qFt+lazW/4sal5XoxFKin9w
	e71KC08De7orMe6GC5Xoh4r/Tg==
X-Google-Smtp-Source: AGHT+IENSkHbeIdYnqFpbjj8u1Q1auAKdAPXMrVdNxRtw50ov/r/C4TlFMWx9b2UsFtP3yL9kSbD8Q==
X-Received: by 2002:a17:907:75f4:b0:9ae:40d1:999b with SMTP id jz20-20020a17090775f400b009ae40d1999bmr9385158ejc.16.1695760368021;
        Tue, 26 Sep 2023 13:32:48 -0700 (PDT)
Received: from [192.168.1.141] (host-87-4-82-94.retail.telecomitalia.it. [87.4.82.94])
        by smtp.gmail.com with ESMTPSA id dp4-20020a170906c14400b009b2823a6626sm3329888ejc.26.2023.09.26.13.32.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 26 Sep 2023 13:32:47 -0700 (PDT)
Message-ID: <0d2588fd-c100-4406-948a-9d67827fd90a@linaro.org>
Date: Tue, 26 Sep 2023 22:32:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 07/15] mailbox: mediatek: Add loop pkt flag and irq
 handling for loop command
Content-Language: en-US
To: =?UTF-8?B?SmFzb24tSkggTGluICjmnpfnnb/npaUp?= <Jason-JH.Lin@mediatek.com>,
 "jassisinghbrar@gmail.com" <jassisinghbrar@gmail.com>,
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
 "chunkuang.hu@kernel.org" <chunkuang.hu@kernel.org>,
 "robh+dt@kernel.org" <robh+dt@kernel.org>,
 "krzysztof.kozlowski+dt@linaro.org" <krzysztof.kozlowski+dt@linaro.org>,
 "angelogioacchino.delregno@collabora.com"
 <angelogioacchino.delregno@collabora.com>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 =?UTF-8?B?U2luZ28gQ2hhbmcgKOW8teiIiOWciyk=?= <Singo.Chang@mediatek.com>,
 =?UTF-8?B?Sm9obnNvbiBXYW5nICjnjovogZbpkasp?= <Johnson.Wang@mediatek.com>,
 =?UTF-8?B?SmFzb24tY2ggQ2hlbiAo6Zmz5bu66LGqKQ==?=
 <Jason-ch.Chen@mediatek.com>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 =?UTF-8?B?U2hhd24gU3VuZyAo5a6L5a2d6KyZKQ==?= <Shawn.Sung@mediatek.com>,
 =?UTF-8?B?TmFuY3kgTGluICjmnpfmrKPonqIp?= <Nancy.Lin@mediatek.com>,
 "conor+dt@kernel.org" <conor+dt@kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 =?UTF-8?B?RWx2aXMgV2FuZyAo546L5YabKQ==?= <Elvis.Wang@mediatek.com>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 Project_Global_Chrome_Upstream_Group
 <Project_Global_Chrome_Upstream_Group@mediatek.com>
References: <20230918192204.32263-1-jason-jh.lin@mediatek.com>
 <20230918192204.32263-8-jason-jh.lin@mediatek.com>
 <5d528036-e506-7b95-69bb-7748b26d2aa8@linaro.org>
 <00f0bae9940be7b397c587c651e23c6c1e19a174.camel@mediatek.com>
 <c08630a2-3e3d-4975-a863-a9e58c6d78f5@linaro.org>
 <0ff1b980f649f20801d0254a189adcae6a449518.camel@mediatek.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <0ff1b980f649f20801d0254a189adcae6a449518.camel@mediatek.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230926_133251_006105_6631FBB8 
X-CRM114-Status: GOOD (  16.10  )
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

On 26/09/2023 05:20, Jason-JH Lin (林睿祥) wrote:
mdq_pkt_finialize_loop() at [PATCH 8/15].
>>>
>>> mtk-cmdq-helper.c and mtk-cmdq-mailbox.c are not in the
>>> same maintainer's tree, so I separate this to another patch from
>> [PATCH
>>> 8/15].
>>
>> Why? Anyway it has to go through same tree. You have dependencies.
>> Such
>> artificial split makes it only difficult to review and understand.
>> Re-organize your patchset to be correctly split per each logical
>> feature/change. Split per subsystems is not the same.
>>
> 
> Yes, these related files are in the different maintainer's tree.
> Refer to https://www.kernel.org/doc/linux/MAINTAINERS
> 
> MAILBOX API
> M: Jassi Brar
> F: drivers/mailbox/
> - drivers/mailbox/mtk-cmdq-mailbox.c
> - drivers/mailbox/mtk-cmdq-sec-
> mailbox.c
> 
> ARM/Mediatek SoC support
> M: Matthias Brugger
> F: drivers/soc/mediatek/
> K: mediatek
> - drivers/soc/mediatek/mtk-cmdq-helper.c
> -
> include/linux/soc/mediatek/mtk-cmdq.h
> 
> I think we should add a new MAINTAINER label for mediatek CMDQ mailbox
> and put these files together, such as "MAILBOX ARM MHUv2" and "QUALCOM
> IPCC MAILBOX DRIVER".

Why? It's not related to the topic of splitting patchset into patches.
There is no problem of patchsets touching multiple subsystems. We
already solved this problem many years ago...


> But I don't know how to make a request for that.

Anyway, you would not be a maintainer taking patches, just a reviewer
called "M:" here...

> 
> Anyway, I'll squash this logical feature to the same patch, no matter
> these files are not in the same tree.
> 
Best regards,
Krzysztof


