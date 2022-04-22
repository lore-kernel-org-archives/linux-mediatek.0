Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1ADE0C433F5
	for <linux-mediatek@archiver.kernel.org>; Fri, 22 Apr 2022 09:13:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:MIME-Version:
	Date:Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=g8T+iZjAXT+A86tTw8SuLvg/d9JpFAxqhU0mgSzhOdA=; b=CTduLsEyzxLpShTuYnJChMBDzs
	DLjlQ6bUAK94lsXC1BMEZfpL8kd2SLx4T/Rwuk4j1vy6+2eToTAP9LSpW8r9oDqlXuggmJ6gPHQ9Q
	5+bfMN5BSONAdfAj7CSxYhLUxLg7q7Uf++se+TkDe3pJkHWE0pMExtS7/mBR+fCMuP0XGEcd83gEC
	X5MdUmjyLftTuQ2lLDMlIYxOFhFRulYcMyVa2/710SY0beJdjInnPLiIhfqBdL2mSxDBw7f0ybtz5
	0cKdGPbtuGs+pw1WGBOXFc84yNniDVRlllXV7AdptKxbXX1vo1HZ8gkmEkFcnAPez3Ii+vUXGjvjb
	iP0nbEew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nhpM6-00HMiC-Hi; Fri, 22 Apr 2022 09:13:34 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nhpM4-00HMhV-8z; Fri, 22 Apr 2022 09:13:33 +0000
Received: by mail-wr1-x42e.google.com with SMTP id t6so6691793wra.4;
 Fri, 22 Apr 2022 02:13:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:in-reply-to:content-transfer-encoding;
 bh=MaE3GXyvHmqVxToj1PrhkmxenvkXCbYA8oJuVzgMVWA=;
 b=kznRNsvQX84099UN4iJsrnjEmeF4UCzhOiY3ZgjjIYOt6CNO2SFACmKweUpT0rN/WP
 f1jyNSGwObAIlvfQwn3EyMjQwkqVwRZB7q2ODhuBT2mqHTSBlW1PedWWgb+GJUt8HMj4
 w1wxfi9fkDBpCi38wECyA13iPOr3UJ7JQbx1Z+StsIcpIWsvvcMLPv9eWm2Df9adND1+
 cCv6T9GtLOOLzqv4Foy54M8BvEyICEa8E+hZFH7byrw2pp5s0CE9OihcyalW5D9x2aQQ
 QDAJkAOkKAhWUzfm5dZ5Zo6AxeNXafWTuyH3bB9et1g8C4rpxsGcGCaubOYTcuAdgIBi
 vU6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=MaE3GXyvHmqVxToj1PrhkmxenvkXCbYA8oJuVzgMVWA=;
 b=2aG7TTqA3MlvROZ0/liCv9qVY6tL6NBo+OQI1aW6YNOrCq7EWk357FwezcgCIYe06O
 ZU8T+K9SLdS/xCmcHzzkgGJRbOWEi0JkRYNkg6MPL4p/wljikG5S6BbgUtqyFh9LQWW6
 TGXT+GW3gKNaNw2GqjwTVY4RVk1BQ8j6Vmv/w6zRonqB1bVKLWbIi867wfFqsJQXyCyN
 bganxeTWRzr9Y6KE9ugOfX4OeQkYPtPOId5rpypIKuPz9Nj+YThXDT0G8Vhjq/HJ/nM/
 an7e5hA5VkEwHffmVZdhLFXqbzyw2gX6zJnsxXNTE27iK/0nM424wqzmGA/h3uXbfVTG
 nn/g==
X-Gm-Message-State: AOAM531scZ429CXBjpu4ogbJwxMrV9PAxOzWziX/1bJOD0Jt60A0LWlN
 Y3yRE/iHgR/3mlJ4z5Yuqxc=
X-Google-Smtp-Source: ABdhPJwjOvr2Z0NMSnDaa6MLjmARYQmBC/rlBknEZ0hCAQB2/hoMy8dQYTuQr3iI9l4fnajMagMZJw==
X-Received: by 2002:a5d:6211:0:b0:1ef:85dd:c96b with SMTP id
 y17-20020a5d6211000000b001ef85ddc96bmr2831151wru.456.1650618809425; 
 Fri, 22 Apr 2022 02:13:29 -0700 (PDT)
Received: from [192.168.1.145] ([207.188.167.132])
 by smtp.gmail.com with ESMTPSA id
 l28-20020a05600c1d1c00b0038ece66f1b0sm1238159wms.8.2022.04.22.02.13.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 22 Apr 2022 02:13:28 -0700 (PDT)
Message-ID: <234d411c-1386-d661-71e3-f1f30f5cbf36@gmail.com>
Date: Fri, 22 Apr 2022 11:13:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH] arm64: dts: mt8183-kukui: align SPI NOR node name with
 dtschema
Content-Language: en-US
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-arm-kernel@lists.infradead.org
References: <20220407142143.293740-1-krzysztof.kozlowski@linaro.org>
 <165044570803.75184.17759035800452933385.b4-ty@linaro.org>
 <38f29c29-e3c2-240a-23a0-509c4febf1ca@gmail.com>
 <f7c5c3f9-0083-c0b0-dc49-e66139268312@linaro.org>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <f7c5c3f9-0083-c0b0-dc49-e66139268312@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220422_021332_380046_DAC77E83 
X-CRM114-Status: GOOD (  24.02  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi Krzysztof,

On 21/04/2022 10:01, Krzysztof Kozlowski wrote:
> On 20/04/2022 14:35, Matthias Brugger wrote:
>>
>>
>> On 20/04/2022 11:10, Krzysztof Kozlowski wrote:
>>> On Thu, 7 Apr 2022 16:21:43 +0200, Krzysztof Kozlowski wrote:
>>>> The node names should be generic and SPI NOR dtschema expects "flash".
>>>>
>>>>
>>>
>>> Looks like no one wants to take this, so let me take care of it.
>>>
>>
>> First thing would have been a ping on the patch, don't you think?
> 
> And what does it change? The operating-points clean up [1] was sent in
> August last year, then in this April, and you responded only when I
> wrote pick-up. The Google cros-ec clean up was sent in Feb and two weeks
> later pinged [2].
> 

That I answered to the pick-up is just plain coincidence that I had some time to 
look into the patches. Sorry for being unresponsive. I'm happy that you care 
about MediaTek patches. If you think there will more patches in this cycle or 
future cycles, we can also agree on you taking the patches and send me a pull 
request later. I only want to avoid any merge conflicts, that's all.

> Pinging and resending apparently does not help. It's okay, happens, we
> are all extra busy and we all pretty often do it as part of
> community/hobby/spare time.
> 
>> Anyway as I
>> said the last time, if you take DTS patches for mediatek
> 
> I don't want to take the patches for Mediatek. But I also don't want to
> resend and ping each one of them because it did not work in the past.
> 
>> , I'd need a stable
>> branch I can merge so that we don't have any merge conflicts in the end.
> 
> Can you just pick the patch?
> 

I pushed it to v5.18-next/dts64 [1]

Let me know if there are other patches that you want me to take.

Regards,
Matthias


[1] 
https://git.kernel.org/pub/scm/linux/kernel/git/matthias.bgg/linux.git/log/?h=v5.18-next/dts64

> 
> [1]
> https://lore.kernel.org/all/?q=%22arm64%3A+dts%3A+mediatek%3A+align+operating-points+table+name+with+dtschema%22
> 
> [2]
> https://lore.kernel.org/all/?q=%22arm64%3A+dts%3A+mt8183%3A+align+Google+CROS+EC+PWM+node+name+with+dtschema%22
> 
> Best regards,
> Krzysztof

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
