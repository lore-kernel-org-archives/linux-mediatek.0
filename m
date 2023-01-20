Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41353C25B4E
	for <linux-mediatek@archiver.kernel.org>; Fri, 20 Jan 2023 07:44:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=drfFdgpb4YkUjSwdoc9Z5a3O+ognmoqBbo2eF6alSdU=; b=VWQOOmZmgA8ELbMQaMeBJACjVT
	4Ooe1W/deWd4y5FgE1UvlP5VM/7FCXmNwS14EZSrJKo+UmJYaBWL5gon+vYkxbxcdJ0HaUEXY7417
	W0SAwbDDHoeHcuBXeSnhNwCm8hD75d66uuRS+xC9dpYzSvbjdJXaE4yfvplunoY0FR6R43pCLqPN2
	PKCz3LFtFHqsmwlsgBSOvD45qqHVkKgyzns/DVTUUqjbxEefeXU4Wv0BzNqBkYSUkbI+7XRj7E6/q
	SGSX0FzLDVQfkQExeRetEgudRqpZkPYiygyadYy0rAV/0omwlaLf+voaAef5EpNBAm0l77URKja/A
	3/jBnGLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pIm4t-008rPh-1d; Fri, 20 Jan 2023 07:44:47 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pIm4h-008rKN-TJ
	for linux-mediatek@lists.infradead.org; Fri, 20 Jan 2023 07:44:37 +0000
Received: by mail-wm1-x333.google.com with SMTP id m5-20020a05600c4f4500b003db03b2559eso2994700wmq.5
        for <linux-mediatek@lists.infradead.org>; Thu, 19 Jan 2023 23:44:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=drfFdgpb4YkUjSwdoc9Z5a3O+ognmoqBbo2eF6alSdU=;
        b=e+mfRRxTfGW5YTv/Rk9ZBMpWJa9fMCCQ17hOT/s5m2unxnuD9/dQh529Rr8DacQ8/9
         Pyn4ZGgPU0hBpE4SZEuuurb0zU1EOSM3CGagMFIn+q7stgDJm3j+dM3p5zO7GSu+Kp/1
         Vl6gjh8CuC7mH346RLr42h9JUD5657RToSf8famYSTfsPFxiucbg+DLVP1EYB0SX5PeB
         Nia+5KEjroz2gFWuMsvL+Nf++pfSdjOXfB+ohS03PZRyUTWwM6F/cTpEBWLt7Q3oHZ34
         OunY3n/J6VouQ5NEnAJP60JSmc8OdVhgFHg1vhcqS1+5+2qCjwPZcurLVSIwbbWMl0YP
         k+rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=drfFdgpb4YkUjSwdoc9Z5a3O+ognmoqBbo2eF6alSdU=;
        b=pKIXGRe4isq0VdkUyHhIMQL7BT7Py6grdULfq6DSjHVf6nL+tuP5BuzNH5GQV78IzV
         +2qw59DU23GeMUdMkJm97vjTLQa25rpuhpRXeTaCJg0+TODwFn6kHG4jdFmIc9yCjDi0
         eN+eRy/IFf3PFwgoDH2XbhvGhsWKBMy4gMBBITsQZUZrvSqYZmE12nYBNFVxssZcVQ6R
         ZYFuZ7/dFxW7za+YFRMnE+AtoiMha9oE+cVsl59btD3DkByfvkat0ewXd8ZVJZXOkZPQ
         BFmz9QmrzcF0u/QzRfYD9w30h6HJhw2Ns8HB+lEZhB5Bdm8oU9ejTNa0aR1k+upHe3tN
         1Y5w==
X-Gm-Message-State: AFqh2krh7UHq147kdxqElXbR848XuXfkZzxu8SfRs3Tu9+qtNgIG9cHp
	Ku0cSgxWFk3xYdikH4PkhocwhA==
X-Google-Smtp-Source: AMrXdXul6atu6mzYQTY69VMfekx6QHfoNRoaaWTtrahYGNQRtASVGIqsSfmGvRdAjKSkA656+k/cyA==
X-Received: by 2002:a05:600c:4c21:b0:3cf:900c:de6b with SMTP id d33-20020a05600c4c2100b003cf900cde6bmr12667812wmp.15.1674200673849;
        Thu, 19 Jan 2023 23:44:33 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id j25-20020a05600c1c1900b003c71358a42dsm1893276wms.18.2023.01.19.23.44.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Jan 2023 23:44:33 -0800 (PST)
Message-ID: <b277b67c-bd00-a543-1945-f986134a78f7@linaro.org>
Date: Fri, 20 Jan 2023 08:44:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.0
Subject: Re: [PATCH 2/2] spi: spidev: add new mediatek support
Content-Language: en-US
To: Alexandre Mergnat <amergnat@baylibre.com>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Mark Brown <broonie@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-spi@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20230118-mt8365-spi-support-v1-0-842a21e50494@baylibre.com>
 <20230118-mt8365-spi-support-v1-2-842a21e50494@baylibre.com>
 <60766c7b-abb2-3afb-aa16-0e1385b88a73@linaro.org>
 <CAFGrd9rtO0B2XWEEU6gtv39PndjdjLL6tbRWimWT3RvLu1GFrQ@mail.gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <CAFGrd9rtO0B2XWEEU6gtv39PndjdjLL6tbRWimWT3RvLu1GFrQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230119_234436_003318_4D4CA46D 
X-CRM114-Status: UNSURE (   9.38  )
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

On 19/01/2023 20:18, Alexandre Mergnat wrote:
> Le jeu. 19 janv. 2023 à 17:49, Krzysztof Kozlowski
> <krzysztof.kozlowski@linaro.org> a écrit :
>>
>> On 19/01/2023 17:28, Alexandre Mergnat wrote:
>>>       { .compatible = "micron,spi-authenta", .data = &spidev_of_check },
>>> +     { .compatible = "mediatek,genio", .data = &spidev_of_check },
>>
>> Please run scripts/checkpatch.pl and fix reported warnings.
> 
> Actually I did.
> I saw: "WARNING: DT compatible string "mediatek,genio" appears
> un-documented -- check ./Documentation/devicetree/bindings/"
> But there are no bindings for spidev. 

There are. Just some other people were as well ignoring warnings. What
is the purpose of having tools if people keep ignoring the warnings, sigh...


Best regards,
Krzysztof


