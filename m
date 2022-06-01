Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57E3EC433EF
	for <linux-mediatek@archiver.kernel.org>; Wed,  1 Jun 2022 11:47:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=M+DYgJ6CyX8KZ6Z7GDY0sDFBdFDvvKN1Xkn/cJZ5tnU=; b=AQqNLD3IAejiBi
	9kLsr8jgYqQivJIgaTmL/ua2BtKQRrXWc02LRcv6+4AOKFX/7wKN86haCR1WkZfKacD5+cXStGVSH
	LktSTDYwwVS9zTJo83RKwcTF0pcF6RoUQqB8YN671J6UGUALX0LZlQZDCZ6b1ajA3zWgOEPIs4MWG
	oEx0PSQJBvBUrMc0VbLDYAoMEKa68/YljC43Mfd2HQAJzGBGg52tSkf97AsSIWFlTv25Mv7n/LZs5
	AEediTQzHb3IhZiYzpslO0QM+aLcdOsXpX1fLqDZmXZSWb3XRen+/ubUaVQqbRkEqCXfu/8QZ1hWx
	yUNjZxdRTBMwWiHbR/aQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nwMoY-00FkQQ-L2; Wed, 01 Jun 2022 11:47:02 +0000
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nwMoM-00FkN6-Dp
	for linux-mediatek@lists.infradead.org; Wed, 01 Jun 2022 11:46:52 +0000
Received: by mail-ed1-x530.google.com with SMTP id er5so1770742edb.12
        for <linux-mediatek@lists.infradead.org>; Wed, 01 Jun 2022 04:46:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=xS22Lp44Ny9t4COxTYX6v7RHBsJp3R38gvuPhap8Xxk=;
        b=Vdn/A8bcMrep9u5fPo6z2dUQv9j2g8Y38q6W24RAuco0o8ZmtR2X4HrXfSeipCInZv
         GziXgtzzhIdD+Rffxs0dfyLMnzEJhQKfHlTJNQ5UkuAHUkHvSNhjaoQ+iZZcHaafXISs
         Q/GdYLaAe/LhlPRYcssTLh1kLuDiSDNCxT7Xm5/dLvfpxKA4m7kTnhyMla688A8TpSyd
         ETjc2aA53R15ujLw0V8qqlgQ5jN3uzrjWwzdiawaqw3UdOtPRRBlvikMEm7umlEe54Os
         eEl7yci3R24UScUi7upYPMNosnbr2K9WuZ84XcTBqmo4FQYneoj+dexSxQoVQL50ccjB
         /Iqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=xS22Lp44Ny9t4COxTYX6v7RHBsJp3R38gvuPhap8Xxk=;
        b=Agq09ZAXGIxVzRAcHi/fYvFdKAMAyChHlTbuJPjk0PXiM6Rj4RYw9GqR2TU+ewQggR
         9n1av6hqMVMBL5LNvKVlG5b9WYKuPpc/SsZvhQagm4x9Dkxv51ytfAWLShdFLznw2apK
         g+JF7lZ/cPIVlKpITznNdF93IPDwAco3hfeha5NrewN9U8Hh2sY6M/QBw7b0g0HTO7g+
         Mmr3r2RQY4rHIAQTe6/McM8tZwaElUWfYc4GnEpgEHoi/Ga43wLHEh1qz9VNtc2WWE4Q
         B06Rr7XOPv3FF3BZ3ZPn+DYfkVZzLPvvUbcrwUXSUKVPe443lM2Db6wJ4Y1IXo4+JHOy
         D4tg==
X-Gm-Message-State: AOAM533g1qpZ6abS0skzTpeJDwL1DAT45yzxRddrcQaxiVYRJ/roY2ev
	Spv6YatOTwx2NMXKOAytqw+oww==
X-Google-Smtp-Source: ABdhPJz7sWA7VmvSrlhCTYtzkutCkqbYbNVnexW8hgWLjCkRZAmC5rj1rW2ZtfehuZ38O0Py78VTtA==
X-Received: by 2002:aa7:d59a:0:b0:42d:d14e:598 with SMTP id r26-20020aa7d59a000000b0042dd14e0598mr16574106edq.215.1654084008362;
        Wed, 01 Jun 2022 04:46:48 -0700 (PDT)
Received: from [192.168.0.179] (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id f11-20020a056402004b00b0042dbc55f6e4sm881774edu.7.2022.06.01.04.46.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Jun 2022 04:46:46 -0700 (PDT)
Message-ID: <919ca8ee-4b01-e601-714c-26098647d5c7@linaro.org>
Date: Wed, 1 Jun 2022 13:46:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH v1 00/15] Add support for MT8195 SCP 2nd core
Content-Language: en-US
To: Tinghan Shen <tinghan.shen@mediatek.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Mathieu Poirier <mathieu.poirier@linaro.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Lee Jones <lee.jones@linaro.org>,
 Benson Leung <bleung@chromium.org>, Guenter Roeck <groeck@chromium.org>,
 Daisuke Nojiri <dnojiri@chromium.org>,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 "Dustin L. Howett" <dustin@howett.net>, Tzung-Bi Shih <tzungbi@kernel.org>,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 Prashant Malani <pmalani@chromium.org>,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 Brian Norris <briannorris@chromium.org>
Cc: linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, chrome-platform@lists.linux.dev,
 Project_Global_Chrome_Upstream_Group@mediatek.com, weishunc@google.com
References: <20220601112201.15510-1-tinghan.shen@mediatek.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220601112201.15510-1-tinghan.shen@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220601_044650_545594_C7AD25AA 
X-CRM114-Status: UNSURE (   9.70  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On 01/06/2022 13:21, Tinghan Shen wrote:
> The MT8195 System Companion Processor(SCP) is a dual-core RISC-V MCU.
> Current mediatek remoteproc driver only supports bring-up single core 
> SCP or the 1st core of a dual-core SCP. This series support to bring-up 
      ^^ this or is confusing a bit.

Does this mean that MT8195 has three RISC-V MCUs?

> the 2nd core of a dual-core SCP.



Best regards,
Krzysztof

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
