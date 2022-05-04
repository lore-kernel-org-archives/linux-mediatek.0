Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E628C433EF
	for <linux-mediatek@archiver.kernel.org>; Wed,  4 May 2022 07:47:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=G6fDdjlmqFLEw1MVysYakJtGMvy/Dt5ZMVs0xlE3xaY=; b=Vt+EfSR3Av0Mhb
	ElysViEanmKwUTURiEHRhDOHAxcuH4AQ6F5aXEZbjpv8ZMe8lcDR5+Forew1eke2VMHaEZigIo6QB
	CdgUvuXxNIFNdRkrZCGftKeZ/dcAtbJC2mY6sqvm4sjxvvdmmQj1e3NC1jXhVjTza8vjOUW6A3Sw1
	zN3+ONBK/yEEd9Yk12D2fzHONf7rhx8sZr110p9sq6N0V2QimEcbwW3NbQmYDhrk4CAIqX50PQVqo
	IYlO0sovqQsJxFUgL4ga4oa6a+mpet0ic/MKZeyASGiwfM/Va2I2bxBrc5hqvKaPNud9hKHrACzmN
	3Jr3faV2W0noNyHFbqHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nm9j3-009JJ6-CW; Wed, 04 May 2022 07:47:09 +0000
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nm9is-009JFU-8g
 for linux-mediatek@lists.infradead.org; Wed, 04 May 2022 07:46:59 +0000
Received: by mail-ej1-x635.google.com with SMTP id kq17so1300133ejb.4
 for <linux-mediatek@lists.infradead.org>; Wed, 04 May 2022 00:46:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=dbzifzA6YWjAHWM9xC9m3ofdq7acNbmRxozpGYUPCtE=;
 b=WtFgU7UglwUUumyb36pSqBc+1d5a/d2D8JfIWgvVj7vb1AzP1+o+nBh1742oBFe1yG
 A85bEMM1H33grTxN/5vEwJHRIJT5Wp9ZKuMI0K06oQNpRJdLBLKXKvAs0EFqMMqpipeO
 fIQ+e5iFKEUkbArJO6EAwAJmIr/SxDKjBpOWAxuX8o4J/5HI1i4KMUaFIz/QY72UDqAw
 frQZyzHKLsqzlcOj3cZBhgYk8H4Nf5y5mdDYWMXdZR9UArhe2KDqdHb01ecfJAyAk4/J
 Rth9rgKqLtPLs8dHdJNbpSKqueNFFuaNqDnTFmYHOiMqfTg32gcMgdd5V7TmTVAfsKyX
 Ouzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=dbzifzA6YWjAHWM9xC9m3ofdq7acNbmRxozpGYUPCtE=;
 b=xVYTgiEYRu1wCq0Lc6iz1YIxUUqvmmsMRyPs9565pY0X3wHxy3Wb5TYlUy6i5lH2o1
 tko5n3XxkjQnjqGqSivkW24MyvP7cfJ75W+dRWVf0yG3vP8DuYxGf8PuF1XQiaQ1/Z3Q
 RLWK0OxlylAmljMYze+Wnhc3CypAxJaW2T2R6xPfFhojEhORIGnkgaa8MSajUiijcy7B
 5APrAhxEKX6SleubQk0hHplLIfCvHvcmP0oYIUHU/6Y5hg7mDwUV3hIIm4qia/7gUpNb
 qvPZZi0+4FYVkfeQ0BTbWdqHpah//DkQbUBDaYijoiZKgV+82G84VMZu8MTR9Z/pi2YK
 4Jug==
X-Gm-Message-State: AOAM530eCbF+EYbciKO3TNjAMUJc/vZIZwvQ5QfXISmf3+adSsxWmBqC
 9h6oEsNb+GL1i9Ltr9Gr6HjZrg==
X-Google-Smtp-Source: ABdhPJza/rONsXGNOhvKUQVjcTRriV992KVrug0N5dRQ5ZwwdofSpjQfWff2pSW3E7l9neelG9GSVQ==
X-Received: by 2002:a17:907:97d4:b0:6f4:c876:6f6b with SMTP id
 js20-20020a17090797d400b006f4c8766f6bmr861238ejc.627.1651650415791; 
 Wed, 04 May 2022 00:46:55 -0700 (PDT)
Received: from [192.168.0.209] (xdsl-188-155-176-92.adslplus.ch.
 [188.155.176.92]) by smtp.gmail.com with ESMTPSA id
 x42-20020a50baad000000b00426cae11e63sm5570458ede.43.2022.05.04.00.46.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 04 May 2022 00:46:55 -0700 (PDT)
Message-ID: <876cbf68-121a-2cae-e40b-67f4556fd2fd@linaro.org>
Date: Wed, 4 May 2022 09:46:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: Aw: Re: Re: [RFC v1] dt-bindings: net: dsa: convert binding for
 mediatek switches
Content-Language: en-US
To: frank-w@public-files.de
Cc: Greg Ungerer <gerg@kernel.org>, =?UTF-8?Q?Ren=c3=a9_van_Dorst?=
 <opensource@vdorst.com>, Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
 Frank Wunderlich <linux@fw-web.de>, Andrew Lunn <andrew@lunn.ch>,
 Vivien Didelot <vivien.didelot@gmail.com>,
 Florian Fainelli <f.fainelli@gmail.com>, Vladimir Oltean
 <olteanv@gmail.com>, "David S. Miller" <davem@davemloft.net>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Sean Wang
 <sean.wang@mediatek.com>, Landen Chao <Landen.Chao@mediatek.com>,
 DENG Qingfang <dqfext@gmail.com>, netdev@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <20220502153238.85090-1-linux@fw-web.de>
 <d29637f8-87ff-b5f0-9604-89b51a2ba7c1@linaro.org>
 <trinity-cda3b94f-8556-4b83-bc34-d2c215f93bcd-1651587032669@3c-app-gmx-bap25>
 <10770ff5-c9b1-7364-4276-05fa0c393d3b@linaro.org>
 <trinity-213ab6b1-ccff-4429-b76c-623c529f6f73-1651590197578@3c-app-gmx-bap25>
 <95aea078-3e85-79c3-79c0-430bd7c0fbae@linaro.org>
 <69290DD3-0179-49C2-8E7D-9F8DBDEBC96F@public-files.de>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <69290DD3-0179-49C2-8E7D-9F8DBDEBC96F@public-files.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220504_004658_376049_10F81F19 
X-CRM114-Status: GOOD (  16.41  )
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

On 04/05/2022 09:44, Frank Wunderlich wrote:
> m 4. Mai 2022 08:51:41 MESZ schrieb Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>:
>> On 03/05/2022 17:03, Frank Wunderlich wrote:
>>>
>>> have not posted this version as it was failing in dtbs_check, this
>> was how i tried:
>>>
>>>
>> https://github.com/frank-w/BPI-R2-4.14/blob/8f2033eb6fcae273580263c3f0b31f0d48821740/Documentation/devicetree/bindings/net/dsa/mediatek.yaml#L177
>>
>> You have mixed up indentation of the second if (and missing -).
> 
> The "compatible if" should be a child of the "if" above,because phy-mode property only exists for cpu-port. I can try with additional "-" (but i guess this is only needed for allOf)
> 
> Rob told me that i cannot check compatible in subnode and this check will be always true...just like my experience.
> I can only make the compatible check at top-level and then need to define substructure based on this (so define structure twice). He suggested me adding this to description for now.
> 
> Imho this can be added later if really needed...did not found any example checking for compatible in a subnode. All were in top level. Afair these properties are handled by dsa-core/phylink and driver only compares constants set there.


Sure.

> 
>> But I think your check was not correct. I looked at bpi-r2 DTS
>> (mt7623n)
>> and pio controller uses GPIO flags.
> 
> I see only same as in the example
> 
> https://elixir.bootlin.com/linux/latest/source/arch/arm/boot/dts/mt7623n-bananapi-bpi-r2.dts#L196

I meant other consumers of pio GPIOs:
https://elixir.bootlin.com/linux/latest/source/arch/arm/boot/dts/mt7623n-bananapi-bpi-r2.dts#L97

https://elixir.bootlin.com/linux/latest/source/arch/arm/boot/dts/mt7623n-bananapi-bpi-r2.dts#L320

Best regards,
Krzysztof

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
