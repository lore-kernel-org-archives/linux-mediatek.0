Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDA7AC25B4E
	for <linux-mediatek@archiver.kernel.org>; Fri, 20 Jan 2023 07:47:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SUbYG6CNFZkAaSfmbsiOn5ZLfVicT6OQUe0wKNSaOFg=; b=dcaqZiXYM9F323xGDbu+/v4Ebo
	msiA82pRatNq+6nsnlaBFr8ecJWaWXR59sgJ2fOeQokjpqpKK8nqiVZvRrdPuenH9k7AWDopj/u6w
	/+zXFRsLtRTMvYVGTqbZ/cyX1/51YJEQImmtk1tjV1L1Ax+c2Ji5nOoVHG7xMb8i9WEK9q/i9g2dC
	OJketcFOxYmluaalVsz/XgL5oeMggtrDglO/dAPPu8hYwwnqsWi4baBltV9vUjt4AKba5PquuV9Fb
	5BXJedW/+Fzk7hNLq1YEnxr8tgi+7Rs+2XZO4+rbi9vNYBZM6ajCm0nvFZyhJfsxXwEuKlkdhPpoC
	HP0JMlhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pIm7J-008s1q-U4; Fri, 20 Jan 2023 07:47:17 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pIm7B-008rz0-2h
	for linux-mediatek@lists.infradead.org; Fri, 20 Jan 2023 07:47:10 +0000
Received: by mail-wr1-x430.google.com with SMTP id r9so4056297wrw.4
        for <linux-mediatek@lists.infradead.org>; Thu, 19 Jan 2023 23:47:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=SUbYG6CNFZkAaSfmbsiOn5ZLfVicT6OQUe0wKNSaOFg=;
        b=E/gsgiKDlovjPEr1wVqqhP64WUTBcW7LnrIaA4cGorpachmtdKSTBYWEnqah2dt/ro
         1xumU7oIe5rQIZ6aGhYE5xSJwLTldpojPXW1rqA1+1h/HnlvGwt1yQMMJaWTfnLw+fGJ
         /jhjZNOe4+iFJYnBW5/8uANdzqMhKWVjryvU9eCf4ZpwED4iiCqNoKE/i7ftjwXzlMUN
         uQYg8rgLbc27HtpviXGt4mc51RFmQYU6aTIPJ1+GtcDafEg0fhIv9mkBvEfHRoRskB7d
         0+jHp1P1kPTFwujMCz268zCKy1yN454PEPflBYCbr14i5q4hrSusYofS/dqyeGNzriFe
         jOBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SUbYG6CNFZkAaSfmbsiOn5ZLfVicT6OQUe0wKNSaOFg=;
        b=tLiPjON6+7yT5flfDwKss5L4/TluX24kDFYi1RxTygNpU+q+FhO50Kuc/FZSONtY9Z
         SNqOPqTZX7OEdjWSrlRyudM9Nfy3zgBWiCU3bZhaZtRAN8SQFVia8uIAaW/1xzF0lbRS
         bNEDmHdYp9xwmCxDtUSGvDoSCsCOoT69xrVnRdKrUKSwGq77seL+QftdGQVjIKgihIVM
         6LhrnPgUMJ96LciThEUidhT0fysQ0gWvBQNXGWeLRzBYxw1NRrSGL2mn7ExKE25WeOEl
         WZXcnmg9EZNIYtnsSULuUJqT4K4/O1XRW1LeFC46xTjBL6fwlgKdEKaV+dgWxRqkMsQ9
         gFOA==
X-Gm-Message-State: AFqh2kpAmxywhNksKk5zLilQYqWrtR9deLlks4hVGH0eDZb+iW/g6Kis
	Nx7iXlCZRqdfTDuahfCqzNaRNg==
X-Google-Smtp-Source: AMrXdXuXFnAh8TD3IFzfCwiyzZGic0IxxbCUXc7p1siPzKJJVl9d52SoYbHlIXsU456hEn0aOzJiQw==
X-Received: by 2002:a5d:58e8:0:b0:2be:b07:d411 with SMTP id f8-20020a5d58e8000000b002be0b07d411mr11456316wrd.3.1674200825135;
        Thu, 19 Jan 2023 23:47:05 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id f3-20020adfdb43000000b00236883f2f5csm35975719wrj.94.2023.01.19.23.47.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Jan 2023 23:47:04 -0800 (PST)
Message-ID: <259d738b-5717-8fda-22f0-c61db4660e95@linaro.org>
Date: Fri, 20 Jan 2023 08:47:02 +0100
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
X-CRM114-CacheID: sfid-20230119_234709_145848_82EFFCE1 
X-CRM114-Status: GOOD (  11.56  )
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
> But there are no bindings for spidev. I've made some grep on already
> supported compatible devices like "micron,spi-authenta", but I didn't
> find documentation to add "mediatek,genio".

Another point - why is this after "micron"? Don't add entries to the end
but in order.

Best regards,
Krzysztof


