Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E5A6C433EF
	for <linux-mediatek@archiver.kernel.org>; Mon, 25 Apr 2022 07:54:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TlCg+Oxvz4dY278H8BTnxYoNJtVsGhOs/9LbFIHpAoE=; b=5ABoStD8gzmoPT
	czE1V6cdXPSo4taR2zjGobJET2WIzCO5GqpC4cktT8dX2LKT2+MGtYuJUpbyUrEDOD5LEvViQYw8/
	8bMOrR1PXwDC7H6LGVBMlOVRPkFFxeGdJ39X7BnXG2Wrm/LUyTJH3GejQjgrMar6mZjXeXXx4jAFo
	cVK35WBOhm6YfDUlDla1dNI/U386x15AKN6N5V0D5A079ftOYWCfpH6MFHJBYyfzKKTfkXjVUJOPD
	74tMOUPZnnbOEbdK0xbTKc+TjsrTtUgsHhXT6TGSUgLdlfZkqlj4pKl3u/I4ASHkkKki4/8BN08Qr
	iNOg9c0QrCXuIcLngQYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nitXl-008gUB-Ks; Mon, 25 Apr 2022 07:54:01 +0000
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nitXZ-008gNF-Jf
 for linux-mediatek@lists.infradead.org; Mon, 25 Apr 2022 07:53:51 +0000
Received: by mail-ed1-x533.google.com with SMTP id z99so17345584ede.5
 for <linux-mediatek@lists.infradead.org>; Mon, 25 Apr 2022 00:53:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=OiK9CfJmGobcKXoR/dSPps5LgKGx0NOgsw4L8/dJuus=;
 b=ExJdKICN8IBJk5lwYIf06MEy9FFprcu4zkW60YPGX6p5vrEl4y6eoYg//8OShTJ+EV
 5BFiUh4ElVofGoJWGYwh6kAvauwtOVwvj1bDQ5fpxQnxbYMtLCsUEdQmRehE4BfbOeJO
 I1lk1lxK2gfmG2JOlToGQc1nJE9kMgWwVwFFjuiYBYkEN/mrljIFDlkA6OMxU8B+ENxH
 dNI7FczHVKl4YnTIdMlFeQ0rHuynNZ3HngnLGBF4KLOoY5HM6LObpbIyn39YSvbyh8Fk
 64NwKlZRZ/m3/4z/hhD9OWrOHzRaF9f3kUGQgW/xlqw0/HzZ84G4/2AoqlLbTdzXAAhT
 fE7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=OiK9CfJmGobcKXoR/dSPps5LgKGx0NOgsw4L8/dJuus=;
 b=BFHP/1xv0ZvqcmZpLsJ9MLi1mlEcPZHGBGt3rU3yAeF1oBjfwyVuGlKDWTlb0x3eJq
 q8YqemyZ+GzrwRh1Utczkl4VkucmLUvDQmo28mQdZZTJP6YjPwxrOq1KX4lsTa9An9CW
 59aYbsKXrvpA1bmEYmN6jSuELUm/ZUaXo43EUAvrbe5xX7NMudzZM4XiD5wzSWdrQsc2
 t+e99PTYDXAc79wJm6LKeCegxUEZuysh5+I4uSGeRx/Uw7NbtZ8QtdAANw7ozf0omrTc
 IWtXOWFX29H+PN7GjTMrUQegpQ8+6JCVQo+T0JMDOUFzOfjjwzI3z5LeySdWOYFNWHEs
 LM2Q==
X-Gm-Message-State: AOAM531gqD8l2q7RtGlQyg2sOIf/Amf7deNhAo74TPl2KWX3t7LZJeXf
 cXZy7/TH+swxzlmdDABR8KWL2A==
X-Google-Smtp-Source: ABdhPJztHTkEpB7MVHqX/Ny1SZCOSlStNRQ6mr3ZjdYNdrfB6wI15Hl3ZlezTmilaoywtLjJooZh9A==
X-Received: by 2002:aa7:da43:0:b0:425:cd4c:e43f with SMTP id
 w3-20020aa7da43000000b00425cd4ce43fmr10883182eds.106.1650873225101; 
 Mon, 25 Apr 2022 00:53:45 -0700 (PDT)
Received: from [192.168.0.239] (xdsl-188-155-176-92.adslplus.ch.
 [188.155.176.92]) by smtp.gmail.com with ESMTPSA id
 t19-20020a508d53000000b00425c9fd2b10sm3129190edt.68.2022.04.25.00.53.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 25 Apr 2022 00:53:44 -0700 (PDT)
Message-ID: <5175fe30-0449-ac5f-7e37-53c07adc433a@linaro.org>
Date: Mon, 25 Apr 2022 09:53:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH 2/2] dt-bindings: watchdog: mediatek: Convert binding to
 YAML
Content-Language: en-US
To: "allen-kh.cheng" <allen-kh.cheng@mediatek.com>,
 Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck
 <linux@roeck-us.net>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 nfraprado@collabora.com
Cc: Project_Global_Chrome_Upstream_Group@mediatek.com,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 srv_heupstream@mediatek.com, Chen-Yu Tsai <wenst@chromium.org>,
 Ryder Lee <ryder.lee@kernel.org>
References: <20220422121017.23920-1-allen-kh.cheng@mediatek.com>
 <20220422121017.23920-3-allen-kh.cheng@mediatek.com>
 <e2e4ead0-d8eb-1302-93e9-f330807d811e@linaro.org>
 <b850f88f5044eb6cd57bec4fb864e5670618c9e7.camel@mediatek.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <b850f88f5044eb6cd57bec4fb864e5670618c9e7.camel@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220425_005349_675072_B166BCA2 
X-CRM114-Status: GOOD (  10.54  )
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

On 25/04/2022 09:37, allen-kh.cheng wrote:

>>> +examples:
>>> +  - |
>>> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
>>> +
>>> +    watchdog@10007000 {
>>> +        compatible = "mediatek,mt8183-wdt",
>>> +                     "mediatek,mt6589-wdt";
>>> +        mediatek,disable-extrst;
>>
>> Did you test your bindings? Does not look like. Please run
>> dt_binding_check (see writing-schema for instructions).
>>
> 
> Yes, I have run dt_binding_check.
> 
> But example is from original binding txt file.
> 
> Is it ok I can write a new expample?

Yes, please. Correct the example in the conversion so it is
reasonable/proper.


Best regards,
Krzysztof

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
