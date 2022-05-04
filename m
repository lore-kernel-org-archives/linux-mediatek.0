Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2861C433EF
	for <linux-mediatek@archiver.kernel.org>; Wed,  4 May 2022 06:51:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OYtK7JOfn//zgstGh0P65LNLgD26CPEibJSc6pv3lPY=; b=uszlM+dkHid6Cq
	i2IPmaJwmwBZcU2EQwEu3p/0EXhhxoo7XEmcvuySEFmenQdmg+eGxGXe00y7Zj/B5q4y1uqvQRZlX
	H9Mpv6gF8P9LJFkzN9+F9UJoB0qJ5+h+zPofEfjBPpqdDs/EtI+zCMDuuxpD2e7UZx8gFKAXDZeLQ
	2Uf2FFuhrOiQqRKDxJPdtGbQCb199BuRcR7vWxUe/Rl7r/TFG8liKCj1MkVlnMh0/gBTpH/Zg6qoc
	S8W/IEEGxqh/VsLODH6q494yc/S8kLJDGkOVGxwXL039MP3Pz9ytPWXS0ihNMNpHrVD60LKVhlDoo
	qjgMNagPVqgc2cAc3jZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nm8rT-0096w6-OY; Wed, 04 May 2022 06:51:47 +0000
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nm8rR-0096sD-52
 for linux-mediatek@lists.infradead.org; Wed, 04 May 2022 06:51:46 +0000
Received: by mail-ej1-x62a.google.com with SMTP id l18so1059661ejc.7
 for <linux-mediatek@lists.infradead.org>; Tue, 03 May 2022 23:51:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=IjvhY+zx5+cDpT9+ShvD2wIBZoNgfMhne2yk1qc9gqc=;
 b=eic7UFuqSIPHIgZ3jSbVJ+u7i6PpSPVY7e3+WBdyR38qmzv+FWuisIiMkWe2KpzS4R
 UnwvMe2voQGKKSuW8ZMI5JMcJuI3KmJ8A1rPmi9AAtCmgjaT0GP0zo5gAqixMJ8VDV0A
 ZWXOYJlyVr6o+MnZZ6r5g2M58A7uEP4AHQtRmLBwEd6U/CAxwh0Rj84HbMsS1dJMUkQe
 6PXQTqyiXSz90DZ2JHQG9chh1I2MpCxYverENN9RufkpiACPTDTLdX76RjFtceWLbva6
 Ewux8w8+l0bPoexCeRMh+kTwR6MujG9lElvDL0zkzoJvMFTp3ZomeFypBMZbY7WGWlPH
 fuBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=IjvhY+zx5+cDpT9+ShvD2wIBZoNgfMhne2yk1qc9gqc=;
 b=bhl0y/ZkSSgodbSrJhHz1j8jVZ+hm1qc9hCSlB6a1ips72xfGv66bocOhk5nfTaUUQ
 WbBhm5q17jkdoX8eGPfDQJMPg0AmXYfq9gAnx4Ij8eiw1wHv3/YgdTzBrNdUp3ce+l7L
 B0FdUUwq7ROu4/gTyRh5xCA6z8/S4zqGQdwmu6GE2uqlCu6Mlm5iGE3HSzmubmCh0oOn
 ZksBvub/TZS3D1lzsU1up5Txzw6rO2iio3mvCqHHfKsAHp5k7DQbdQTpH1ykNChTnkxs
 voztySzhY8v73p46el4ZyDQxmQAw2MoczFPcWusUR3KTRwjW24I30VTvTcupimNIDI8F
 EjlA==
X-Gm-Message-State: AOAM531Tn8fs5qjZxRZZ47SN9X9sNkb7qaLzxLdpkzg+9dImLzegooqg
 xZlM0o862mXSQm+Rjp2AsAI0Hg==
X-Google-Smtp-Source: ABdhPJwsbQjpa6yGQ2U7HY/Ae/uny1/EgLYf0Rw+8IrJbKAirCTUtkOfDH52DAkl4hVSuhbxoPgI8w==
X-Received: by 2002:a17:906:a089:b0:6ef:e9e6:1368 with SMTP id
 q9-20020a170906a08900b006efe9e61368mr18809029ejy.626.1651647102720; 
 Tue, 03 May 2022 23:51:42 -0700 (PDT)
Received: from [192.168.0.208] (xdsl-188-155-176-92.adslplus.ch.
 [188.155.176.92]) by smtp.gmail.com with ESMTPSA id
 el8-20020a170907284800b006f3ef214e0asm5370519ejc.112.2022.05.03.23.51.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 03 May 2022 23:51:42 -0700 (PDT)
Message-ID: <95aea078-3e85-79c3-79c0-430bd7c0fbae@linaro.org>
Date: Wed, 4 May 2022 08:51:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: Aw: Re: Re: [RFC v1] dt-bindings: net: dsa: convert binding for
 mediatek switches
Content-Language: en-US
To: Frank Wunderlich <frank-w@public-files.de>
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
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <trinity-213ab6b1-ccff-4429-b76c-623c529f6f73-1651590197578@3c-app-gmx-bap25>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220503_235145_253676_04AB721B 
X-CRM114-Status: GOOD (  17.71  )
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

On 03/05/2022 17:03, Frank Wunderlich wrote:
> 
> have not posted this version as it was failing in dtbs_check, this was how i tried:
> 
> https://github.com/frank-w/BPI-R2-4.14/blob/8f2033eb6fcae273580263c3f0b31f0d48821740/Documentation/devicetree/bindings/net/dsa/mediatek.yaml#L177

You have mixed up indentation of the second if (and missing -).

(...)

>>>
>>> basicly this "ports"-property should be required too, right?
>>
>> Previous binding did not enforce it, I think, but it is reasonable to
>> require ports.
> 
> basicly it is required in dsa.yaml, so it will be redundant here
> 
> https://elixir.bootlin.com/linux/v5.18-rc5/source/Documentation/devicetree/bindings/net/dsa/dsa.yaml#L55
> 
> this defines it as pattern "^(ethernet-)?ports$" and should be processed by dsa-core. so maybe changing it to same pattern instead of moving up as normal property?

Just keep what is already used in existing DTS.

>>> for 33 there seem no constant..all other references to pio node are with numbers too and there seem no binding
>>> header defining the gpio pins (only functions in include/dt-bindings/pinctrl/mt7623-pinfunc.h)
>>
>> ok, then my comment
> 
> you mean adding a comment to the example that GPIO-flags/constants should be used instead of magic numbers?

I think something was cut from my reply. I wanted to say:
"ok, then my comment can be skipped"

But I think your check was not correct. I looked at bpi-r2 DTS (mt7623n)
and pio controller uses GPIO flags.

Best regards,
Krzysztof

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
