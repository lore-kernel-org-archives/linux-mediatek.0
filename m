Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EEF3DC433F5
	for <linux-mediatek@archiver.kernel.org>; Wed, 16 Feb 2022 13:29:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:From:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=aWqfe8vSDcS5dSlmHUPd47jlzDQKYZdErkw76SUS+m0=; b=x9aAV3YmW8Rryy
	ltrT8QRHWb+9b9sdViEzyYmVf71w7bBkOScxiTQQFYWbBjQ827d4Fe4VWODlSPD/u9on3gDrjVK93
	43Nh2OYvjM6NwW8joGqjaLBqwbwB0rMr+Az1Q/yBaP59MIXgSduCUMlact1ORYVjql0fPS4/d4Zip
	3ZUbpPNAHT1A2MzhNH3YAxPZcLosy7fT23MD++wmCbFwf+AHwUH0RQdgKgWxGU01YMcnua9l9B3zM
	x5vQiqoQDfl4wh749sLPH6/YLKBVVmGalI+pn4qe3G9MUAM1U2Um397qUXXl4M9rCWEkCfUkyipJu
	mLCFz4UCI2ALwRcjieRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nKKMZ-007BCV-DB; Wed, 16 Feb 2022 13:28:55 +0000
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nKKMK-007B6D-MF
 for linux-mediatek@lists.infradead.org; Wed, 16 Feb 2022 13:28:47 +0000
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id AEB7F3F4B4
 for <linux-mediatek@lists.infradead.org>; Wed, 16 Feb 2022 13:28:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1645018118;
 bh=uvLbH9+eJYb169S0u8GtDlmAGmS1dovfO9ippBhbjag=;
 h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
 In-Reply-To:Content-Type;
 b=VejuCDpk73LG2nSO+2rGaItSvInGFyiLk8/FjmKsNurHWHsrMRcYo8To5xh/A+jIE
 IX2lYOOF/WyTAHohGvKbDMUv4htj9odDx9MzadfRubhRiIvBncc16EJPfPNZ6z9Ewt
 uE5PwJEsjsw8gXqyQbhHb0ijBvATeW4T8wCLLmk+9bJ5fKLSrcHfdabHtb3jJCLA/O
 UFHS2w0kiVbaAxmfd4Si8WjE3309eem459svAGdSCkcbXYZH1sO8guEO4NL//B1F4S
 8IlZO+K5+AjcEl1oYZYsxrgTGO+CrjhsekL+jnoYffWo5BCxsB1drx+m6i4laEGH6Z
 Iykgx6EuYnV2g==
Received: by mail-ej1-f71.google.com with SMTP id
 q3-20020a17090676c300b006a9453c33b0so828365ejn.13
 for <linux-mediatek@lists.infradead.org>; Wed, 16 Feb 2022 05:28:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:from:to:cc:references:in-reply-to
 :content-transfer-encoding;
 bh=uvLbH9+eJYb169S0u8GtDlmAGmS1dovfO9ippBhbjag=;
 b=YFBbtnOE3+7gBCQ7qgjOa7zTK6NR8LcW+Fd6nKkw1z5J4uLsxCm9wXQeNJwopdyBVy
 Vp8nvPT8IWKQ6yJ0ctQY9U+QpWzk5rNMuCkqHOmLQuSCkzT2nkmMsyZxvxALHtSnyFrk
 MKOMp+yDaHmkRW9N+UCJ+HrhL4CwPuocEV2tDPJNcikHqRnTesDD0r0Q1B9Um3Mjz1P+
 U2PFyxfR2Nc/LiOYuiHMfFrh1f4254LyNCLWCI5mqbGnWsoh9QxPc7+h5Va0VckmwV/I
 /a28HeP73+SnV6YyKp4a9cVLRglpupptpgSROTpXLq0nmTt1O/285MnBQo9LyFwrmGRX
 oKuw==
X-Gm-Message-State: AOAM5331f5fNuP/mDJvMI8Q1gFQACWD5GPh6/11dpwuMXeEup7wGBBFJ
 RAG+v+DWawNgQklOyKJSNbqTcOeC457YO5ilXIjxAyxqU1bg0f3z37YYzjQQCzPIkHX3hI9SoG/
 WUYuqLIC355ywLBJZFZEZAmciMklHtx3/y5X5+7UzNI4SElzMCA==
X-Received: by 2002:aa7:db94:0:b0:410:f0e8:c39e with SMTP id
 u20-20020aa7db94000000b00410f0e8c39emr3081985edt.14.1645018117956; 
 Wed, 16 Feb 2022 05:28:37 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyDjLnVqY6woKkNirfpbndg7T+yQE6xw/kqrdiC2tPwlz5D4kqZP8qH23TQVUGR9vke/u8BEQ==
X-Received: by 2002:aa7:db94:0:b0:410:f0e8:c39e with SMTP id
 u20-20020aa7db94000000b00410f0e8c39emr3081967edt.14.1645018117815; 
 Wed, 16 Feb 2022 05:28:37 -0800 (PST)
Received: from [192.168.0.110] (xdsl-188-155-168-84.adslplus.ch.
 [188.155.168.84])
 by smtp.gmail.com with ESMTPSA id s9sm1645056edj.48.2022.02.16.05.28.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 16 Feb 2022 05:28:37 -0800 (PST)
Message-ID: <9f90a0d0-20fe-d191-e6e9-23d794fb4efe@canonical.com>
Date: Wed, 16 Feb 2022 14:28:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH] dt-bindings: dma: Convert mtk-uart-apdma to DT schema
Content-Language: en-US
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 vkoul@kernel.org
Cc: robh+dt@kernel.org, sean.wang@mediatek.com, matthias.bgg@gmail.com,
 long.cheng@mediatek.com, dmaengine@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <20220216114054.269656-1-angelogioacchino.delregno@collabora.com>
 <79a47f67-bb66-bad4-b6bc-c6a8c0ef25dc@canonical.com>
In-Reply-To: <79a47f67-bb66-bad4-b6bc-c6a8c0ef25dc@canonical.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220216_052840_878005_07083C04 
X-CRM114-Status: GOOD (  12.94  )
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

On 16/02/2022 14:26, Krzysztof Kozlowski wrote:
> On 16/02/2022 12:40, AngeloGioacchino Del Regno wrote:
>> Convert the MediaTek UART APDMA Controller binding to DT schema.
>>
>> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
>> ---
>>  .../bindings/dma/mediatek,uart-dma.yaml       | 112 ++++++++++++++++++
>>  .../bindings/dma/mtk-uart-apdma.txt           |  56 ---------
>>  2 files changed, 112 insertions(+), 56 deletions(-)
>>  create mode 100644 Documentation/devicetree/bindings/dma/mediatek,uart-dma.yaml
>>  delete mode 100644 Documentation/devicetree/bindings/dma/mtk-uart-apdma.txt
>>
>> diff --git a/Documentation/devicetree/bindings/dma/mediatek,uart-dma.yaml b/Documentation/devicetree/bindings/dma/mediatek,uart-dma.yaml
>> new file mode 100644
>> index 000000000000..4583c8f535b2
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/dma/mediatek,uart-dma.yaml
>> @@ -0,0 +1,112 @@
>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/dma/mediatek,uart-dma.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: MediaTek UART APDMA controller
>> +
>> +maintainers:
>> +  - Long Cheng <long.cheng@mediatek.com>

Is this still up-to-date? Emails bounce:

  smtp; 550 Relaying mail to long.cheng@mediatek.com is not allowed


Best regards,
Krzysztof

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
