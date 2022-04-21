Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB091C433EF
	for <linux-mediatek@archiver.kernel.org>; Thu, 21 Apr 2022 08:01:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sihMaaWCWFp6YR9Q4yKyoB8iaxRE0D1S9yWo6hPth+Y=; b=Fsv47cMxwQg08a
	evr+8aZWOq5I04WYCj9b18y08ljae94420OdhbKQjYtEcdu8pZ7JjCpR2YvGUN4SKy405irq5vcMZ
	DKllvtWMOSFHqKl33V9C8n8UfCQkadp2JSSUAVcamuI3DA+aT1ApzrNCmX7R5/xiUQRlKt/jDZPu4
	j2UHE/UZ07Sua4RQsc/y6nwTT9sT49zM02Zl6VRtqw4p7w75xjVUzw9EM7v/BGGVZT5WiMNBTWNrX
	oZqAMN6V1jg4TsTJupxmdz6YHLXWJLpgSjJHvwj00Ef+jmBMPZo7eDhGI2zDAD4Iakbeo+Mdc7M/c
	5JBfOGpTt6/J+2MtNkSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nhRl0-00CGgd-Rn; Thu, 21 Apr 2022 08:01:42 +0000
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nhRkk-00CGYp-Ei
 for linux-mediatek@lists.infradead.org; Thu, 21 Apr 2022 08:01:28 +0000
Received: by mail-ed1-x533.google.com with SMTP id d6so340924ede.8
 for <linux-mediatek@lists.infradead.org>; Thu, 21 Apr 2022 01:01:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:in-reply-to:content-transfer-encoding;
 bh=MjMj7j2b58g3Fs2GDoRx9AQenU1ytemGpXtMCrxETUc=;
 b=NYdGQxPPwnRdIBVwF7pPrMR6GN1BDIcM0wDpBYNTF+2n4Gad4PqA8rEEzED/xk+1eZ
 0lK1WjBy/qAX+TXrQ9FmP/n605QPm6LIUb/UsG8afL/FClUWaRvec/X4CyIxCtEKTgYO
 dYYgoG+shjdDoy+zLXCAY2BZDZgZ33JGo0aady4rulQeCfiBwZsbBsyRYAchXtrns/A1
 RA6WiEvyzMX4/E4z8oOLj8yKedcICvBAatoOyNtI+4sm1ax121UKcpFFPVP9OrPbIoga
 kMpy0my6M1Wg/f9Oczhtb6NdZS69ufzTgEP7bKH2SOdQNZxyNKmHtJxZ9PY1NoFfznf7
 UOOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=MjMj7j2b58g3Fs2GDoRx9AQenU1ytemGpXtMCrxETUc=;
 b=c+trX99hWqFnD/yFb1DYHpRGfRV2pKhpJG9wgYhOC6u37pzHjCvAnQMP8YblcXXcZP
 4Xkfd/InEuswx8dYZ8ywuD/QNQxjlUFNVA01LRDZVeBaHjyva+qKrI47g67qAnDBUDlu
 T9qq36Gc93WAG2/ebZPoScItgUXPO84VVd8nK0sLPthC98aanEK1nPBLa8LpF+DVoEKK
 /W1SFgcY0tSIQ6SGeDhtOh8A4jipb78CwOsjHD/cAFgGvaCxy4z1bZus0AGz+5r3GV/Q
 R0TM7XQySt05AKIrLfQOClkQ0LSfUYqaRH2Lc8HZ73fnmf+9+dcFAx2FY6qTIJhJc97T
 7O7A==
X-Gm-Message-State: AOAM530FvaFlytCR3uctqgkbV4v9gSWPp97OkKAeEdbIb8/DHQAkLfh6
 JmS3mTj27hulQLJsoSUYG1l2MQ==
X-Google-Smtp-Source: ABdhPJyarBv6DNgivhvvzolW+CQw8vVO1R8UHNq38QMh0dgBHplqLk+dS95uG2+e9Egg0If3tYFQzA==
X-Received: by 2002:a05:6402:2547:b0:423:f342:e0e3 with SMTP id
 l7-20020a056402254700b00423f342e0e3mr17476265edb.371.1650528084407; 
 Thu, 21 Apr 2022 01:01:24 -0700 (PDT)
Received: from [192.168.0.226] (xdsl-188-155-176-92.adslplus.ch.
 [188.155.176.92]) by smtp.gmail.com with ESMTPSA id
 j10-20020aa7de8a000000b004215209b077sm10565025edv.37.2022.04.21.01.01.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 21 Apr 2022 01:01:23 -0700 (PDT)
Message-ID: <f7c5c3f9-0083-c0b0-dc49-e66139268312@linaro.org>
Date: Thu, 21 Apr 2022 10:01:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH] arm64: dts: mt8183-kukui: align SPI NOR node name with
 dtschema
Content-Language: en-US
To: Matthias Brugger <matthias.bgg@gmail.com>,
 linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-arm-kernel@lists.infradead.org
References: <20220407142143.293740-1-krzysztof.kozlowski@linaro.org>
 <165044570803.75184.17759035800452933385.b4-ty@linaro.org>
 <38f29c29-e3c2-240a-23a0-509c4febf1ca@gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <38f29c29-e3c2-240a-23a0-509c4febf1ca@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220421_010126_665008_988C7345 
X-CRM114-Status: GOOD (  16.54  )
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

On 20/04/2022 14:35, Matthias Brugger wrote:
> 
> 
> On 20/04/2022 11:10, Krzysztof Kozlowski wrote:
>> On Thu, 7 Apr 2022 16:21:43 +0200, Krzysztof Kozlowski wrote:
>>> The node names should be generic and SPI NOR dtschema expects "flash".
>>>
>>>
>>
>> Looks like no one wants to take this, so let me take care of it.
>>
> 
> First thing would have been a ping on the patch, don't you think? 

And what does it change? The operating-points clean up [1] was sent in
August last year, then in this April, and you responded only when I
wrote pick-up. The Google cros-ec clean up was sent in Feb and two weeks
later pinged [2].

Pinging and resending apparently does not help. It's okay, happens, we
are all extra busy and we all pretty often do it as part of
community/hobby/spare time.

> Anyway as I 
> said the last time, if you take DTS patches for mediatek

I don't want to take the patches for Mediatek. But I also don't want to
resend and ping each one of them because it did not work in the past.

> , I'd need a stable 
> branch I can merge so that we don't have any merge conflicts in the end.

Can you just pick the patch?


[1]
https://lore.kernel.org/all/?q=%22arm64%3A+dts%3A+mediatek%3A+align+operating-points+table+name+with+dtschema%22

[2]
https://lore.kernel.org/all/?q=%22arm64%3A+dts%3A+mt8183%3A+align+Google+CROS+EC+PWM+node+name+with+dtschema%22

Best regards,
Krzysztof

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
