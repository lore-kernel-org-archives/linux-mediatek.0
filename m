Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 623B3C54EE9
	for <linux-mediatek@archiver.kernel.org>; Thu, 22 Sep 2022 12:51:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Sea27jK2pOb0ADt+U+OOXz14ad+JYjdidyw5ceH+6tY=; b=PmrFmXzjKPo87yjnC5qbQL8IlX
	hY0aF+wr/8JJasdIlN1MNBNzGXtA8ZQA+R9lnA/U7+flZ9hQWlS3Ia4JOWeBQUI6HApdiDh3tuF+h
	+plMO0lPVF1DJ6RtLaT+Xlq/zjHenSpvlYvIdaLqvLiDJpM3JmabDk8fj/hpnjV2pPyqHsbS/hO3F
	VymOJBh27rTWPj7slxWsxEBmt1jIobBkPQnjZ22qFKqNeWJB9GgLU9eDkl9ufrDCsIyhJ/wlcuDr2
	m7o8H5k2M6DHiTdAzLTgNTihL0BB8QLVgCLZgfmNsDn5QjQ8Hg7CiVAfSjTUiXdSkDcgrauHbo2Ou
	sbT199aw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1obLft-00FTjf-19; Thu, 22 Sep 2022 12:51:29 +0000
Received: from mail-lj1-x22b.google.com ([2a00:1450:4864:20::22b])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1obLfY-00FTYr-02
	for linux-mediatek@lists.infradead.org; Thu, 22 Sep 2022 12:51:09 +0000
Received: by mail-lj1-x22b.google.com with SMTP id z20so10887791ljq.3
        for <linux-mediatek@lists.infradead.org>; Thu, 22 Sep 2022 05:51:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=Sea27jK2pOb0ADt+U+OOXz14ad+JYjdidyw5ceH+6tY=;
        b=bEQc5o4c96kL003lNdFFNF/PheTKYPzGOx1XlLuWx4uUt3ZZ8u82nZSviwPUHfH2xv
         bUDvPw5aOQbeDKQmaq1CoRgZsOnIg2YGfJh8cvDV5F9+JLKSUyn50zDSIBxJOcnrj4PR
         A/jflBtwfF7dKCfnIUVH8sg+arNoqIgkz9k9j9ZFaFWktQEtF1ZrBOG6ExeV2+xa5sCd
         gIaN+jPceaw/AtbWvWGSXMYZ/VYa/BVnHTn4+MNDa2/tr3mx3BIFfKkZZCFjQpef8XiE
         zuMwWdRrzBII8cLpO+PWCCMW0r7uAoqveKC5p2LZphYcvpAG3bcSeCk7PVaftA5tgi0M
         8RZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=Sea27jK2pOb0ADt+U+OOXz14ad+JYjdidyw5ceH+6tY=;
        b=hvhaZpzPU+9XxLQhLKjE14M3SI1Dl05oUa3Q0VtN/dOMRzhevaAxJ45iyD7A7yudXv
         DNNeFIOMP59KiAAC1aCkoOqlPd0uNhAFrnQhiXWYwXvgSYLwk2MZYFPmnJ8oAt9edW75
         +AZXFFNROjZYGKxDsyupbDnnOHO2o5CKvjeG523uRKcrNXsqqlUzAWE3Wl8bu1RkAHPf
         QgIpJEiZtehEbsfvFi7WuBOv57sIy8X/BeMfnrXMmL9vjWlhdeiy9UjfqajGtUzZGiea
         LG5EGvRA0qF372E3pD0934VvBI1atJxXBwfUMrtSozX+iyRLiap/j3u7g/3cVlkstTil
         wO/g==
X-Gm-Message-State: ACrzQf0ltCwG6UlWfBdyOYzkrzuoxkEkoS5I34L2846zP1xs8jySPw23
	M1DlHxDNIpWiaj5gDddIXxKv5w==
X-Google-Smtp-Source: AMsMyM7SDptjdpkW7tuuttAy0kYzK4MBmIe60uRZtol4i0HW5ltX1B+Cjzu/BNFNwE3TBkr+rbuBQA==
X-Received: by 2002:a2e:1458:0:b0:26c:3b83:e039 with SMTP id 24-20020a2e1458000000b0026c3b83e039mr1098450lju.484.1663851062438;
        Thu, 22 Sep 2022 05:51:02 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id v12-20020ac258ec000000b0049496608d58sm925362lfo.155.2022.09.22.05.51.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Sep 2022 05:51:01 -0700 (PDT)
Message-ID: <6b24be8f-94d7-6973-6f35-18cb15fc8cd4@linaro.org>
Date: Thu, 22 Sep 2022 14:51:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH v1 01/17] dt-bindings: clk: mediatek: Add MT8195 DPI
 clocks
Content-Language: en-US
To: Guillaume Ranquet <granquet@baylibre.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Vinod Koul <vkoul@kernel.org>,
 Stephen Boyd <sboyd@kernel.org>, David Airlie <airlied@linux.ie>,
 Rob Herring <robh+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Daniel Vetter <daniel@ffwll.ch>, Chunfeng Yun <chunfeng.yun@mediatek.com>,
 CK Hu <ck.hu@mediatek.com>, Jitao shi <jitao.shi@mediatek.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Kishon Vijay Abraham I <kishon@ti.com>,
 Bo-Chen Chen <rex-bc.chen@mediatek.com>
Cc: linux-mediatek@lists.infradead.org, dri-devel@lists.freedesktop.org,
 Pablo Sun <pablo.sun@mediatek.com>, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org, Mattijs Korpershoek
 <mkorpershoek@baylibre.com>, linux-arm-kernel@lists.infradead.org,
 linux-phy@lists.infradead.org, devicetree@vger.kernel.org
References: <20220919-v1-0-4844816c9808@baylibre.com>
 <20220919-v1-1-4844816c9808@baylibre.com>
 <d01e4a03-1d6d-9616-45ca-1c927f2d8237@linaro.org>
 <CABnWg9uZ=FrumgUzyUoUiS6T51nZTEf5JZ-1KF0-Ra9Ood5ufA@mail.gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <CABnWg9uZ=FrumgUzyUoUiS6T51nZTEf5JZ-1KF0-Ra9Ood5ufA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220922_055108_047152_30888DAC 
X-CRM114-Status: GOOD (  14.92  )
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

On 22/09/2022 14:45, Guillaume Ranquet wrote:
> On Thu, 22 Sep 2022 09:11, Krzysztof Kozlowski
> <krzysztof.kozlowski@linaro.org> wrote:
>> On 19/09/2022 18:55, Guillaume Ranquet wrote:
>>> From: Pablo Sun <pablo.sun@mediatek.com>
>>>
>>> Expand dt-bindings slot for VDOSYS1 of MT8195.
>>> This clock is required by the DPI1 hardware
>>> and is a downstream of the HDMI pixel clock.
>>>
>>> Signed-off-by: Pablo Sun <pablo.sun@mediatek.com>
>>> Signed-off-by: Guillaume Ranquet <granquet@baylibre.com>
>>> Reviewed-by: Mattijs Korpershoek <mkorpershoek@baylibre.com>
>>>
>>
>> Looks like broken patch.
>>
>> Best regards,
>> Krzysztof
>>
> 
> Hi Bo-Chen and Krzysztof,
> I've sent the patches using the rather new b4 prep/send commands.
> 
> Though it produces valid patches, it's using `git show --format=email`
> to produce the patches, which lacks a diffstat.
> 
> My understanding is that the diffstat is considered to be comments and thus
> are not necessary to produce a valid patch.
> 
> I've reported the issue on the tools mailing list [1], I'm looking at providing
> a fix.
> 
> I'll be extra careful at the patch format for V2.

Thanks for explanation! Probably your patches are perfectly fine and
should apply, although I must admit diffstat is often useful.

Best regards,
Krzysztof


