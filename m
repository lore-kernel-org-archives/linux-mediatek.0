Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5F1FC433EF
	for <linux-mediatek@archiver.kernel.org>; Thu,  5 May 2022 08:47:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=62q2pfSjmvTXeZxIEFgfhmO/D5RwsjJxlNg939hTrxQ=; b=PG0+t7+zPZgbNj
	2wZaMYen0VmgpbYxWnror8CdRcQNGuaGTjk0UqirdR9el7ePCkQFGdE/6SbOgR9+kGLd9l+otS6sU
	tM4cY/2V4fbOBi98Dzh2CeKrgKGi7KZXVxS7wKKUQBHjViFzahFbeWRbwLn4DHMrWrLjGfXbwAqtJ
	p9wJSRnHGdye8+thoX0AX/E3iLdsCToSsRbIMvRWfG94I7Er91EdTnX/ETm77xLk4kAZhBBKvrbmC
	0te/pNA+TJaUK/D3tG0mKHHaZSAjLqMM9eRYP/w3HCjnJxyfhGd3gE6U0SYAT46pv7XfiinMrEvAr
	iPax+FczWyWsT6lXJqiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nmX8o-00Eotx-3U; Thu, 05 May 2022 08:47:18 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nmX8Y-00EoiP-MZ
 for linux-mediatek@lists.infradead.org; Thu, 05 May 2022 08:47:05 +0000
Received: by mail-wr1-x434.google.com with SMTP id q23so5153189wra.1
 for <linux-mediatek@lists.infradead.org>; Thu, 05 May 2022 01:46:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=KAi9SgYYEJZdQCddUzbx52lypx3cIglFyl/qHafebhw=;
 b=tkNfdzaaxw1oNzzHEFi5PsCP9pSRB2g18WUgVkc6DnnNJz4opSwgzEVFoUUkq98Kud
 DmFNXaVYExw1NuJr8DqujznLa2az0lWDiTc0qWvNUCAP5r5OW9iSR8QEqSlWZJONTS4P
 F30VkUEk9v9uHoJqLqcvFr87lcceheNYz87udcrXOAHtFnIyEOvlcZaxaIZkOdNhT30Y
 dB4ud6EWIxegH+EYbtLr/2s0zJ21Uw2TaCRSfxNT1dPyuAPqkA2Ti2WZXu8bcR/8mxNC
 eMgh7vO/iGZwuEnOROZ+GPB0E6E/imyXgauO3i4m/vz/qEwWxwP3ttMVK1mz2Ist0shg
 sbpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=KAi9SgYYEJZdQCddUzbx52lypx3cIglFyl/qHafebhw=;
 b=eC+qX0iRlbTqUOWzRvW9MtghvnG6t8B8xqiyr12qlJiUxRr0VUEzg3nxPn0lYafyAJ
 iFdpkuNMD/6zLdzw/0LqCDw2yi4FtcuQDfs5oVzSVUzyFePfX/8v02niq4cLNcDLXXjq
 YRncRb581m7xrNrSP4HJZoveCVdZ56hp5zNzA30DbHudJPKfw5Q33DgorpKUUkMSiyOI
 1GLpdpux6bATR39gx4qsvbv3er9XrOyLVVmADhUCKGw/9MxOGx0+9b0KbcIke9AIpAxM
 g6qMeMJ+fGcXw7sWSb7ocENMtdg3T3MtR0cafRtoTL3JLRskTA2zz03FOkATbB0XVUSW
 ir8g==
X-Gm-Message-State: AOAM532Zc/0oOFn2B/zGww08ZGY9vnC86Xu62d7CmynjJyTRYBf3JKjY
 z6IdIeZIGwcZmD7LqFYW0UHLIA==
X-Google-Smtp-Source: ABdhPJx0cG82J35HyxF+U/lAjaHUyieUfdukDsGukXiyDflYgKWosvfKkWmN+5Kvijh4a8XoYMPHpw==
X-Received: by 2002:a5d:6551:0:b0:20a:e23c:a7fa with SMTP id
 z17-20020a5d6551000000b0020ae23ca7famr19657153wrv.535.1651740417622; 
 Thu, 05 May 2022 01:46:57 -0700 (PDT)
Received: from [192.168.0.217] (xdsl-188-155-176-92.adslplus.ch.
 [188.155.176.92]) by smtp.gmail.com with ESMTPSA id
 67-20020a1c1946000000b003942a244f2csm6771728wmz.5.2022.05.05.01.46.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 05 May 2022 01:46:57 -0700 (PDT)
Message-ID: <313a5b2e-c571-a13f-3447-b1cd7200f4c9@linaro.org>
Date: Thu, 5 May 2022 10:46:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [RFC v2 4/4] arm64: dts: rockchip: Add mt7531 dsa node to
 BPI-R2-Pro board
Content-Language: en-US
To: Vladimir Oltean <olteanv@gmail.com>,
 Frank Wunderlich <frank-w@public-files.de>
Cc: Frank Wunderlich <linux@fw-web.de>, linux-mediatek@lists.infradead.org,
 linux-rockchip@lists.infradead.org, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Heiko Stuebner <heiko@sntech.de>, Sean Wang <sean.wang@mediatek.com>,
 Landen Chao <Landen.Chao@mediatek.com>, DENG Qingfang <dqfext@gmail.com>,
 Andrew Lunn <andrew@lunn.ch>, Vivien Didelot <vivien.didelot@gmail.com>,
 Florian Fainelli <f.fainelli@gmail.com>,
 "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 Peter Geis <pgwipeout@gmail.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 netdev@vger.kernel.org
References: <20220430130347.15190-1-linux@fw-web.de>
 <20220430130347.15190-5-linux@fw-web.de>
 <20220504152450.cs2afa4hwkqp5b5m@skbuf>
 <trinity-9f557027-8e00-4a4a-bc19-bc576e163f7b-1651678399970@3c-app-gmx-bs42>
 <20220504154720.62cwrz7frjkjbb7u@skbuf>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220504154720.62cwrz7frjkjbb7u@skbuf>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220505_014702_803414_87BF77F7 
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On 04/05/2022 17:47, Vladimir Oltean wrote:
>>
>> current device-tree nodes using "switch" and "ports"
>>
>> see discussioon here about make it fixed to "ports" property instead of PatternProperties including optional "ethernet-"
>>
>> https://patchwork.kernel.org/project/linux-mediatek/patch/20220502153238.85090-1-linux@fw-web.de/#24843155
> 
> Hmm, I don't get why Krzysztof said to just keep what is used in
> existing device trees. The schema validator should describe what is
> valid, 

These were talks about bindings which describe hardware. The node name,
except Devicetree spec asking for generic names, does not matter here
actually.

> and since the mt7530 driver does not care one way or another
> (some drivers do explicitly parse the "ports"/"ethernet-ports" node),
> then whatever is valid for the DSA core is also valid for the mt7530
> bindings. And "ethernet-ports" is valid too, so I think it should be
> accepted by mediatek.yaml...

You can make it "(ethernet-)?ports" as well. My comment was purely to
make it simpler, for bindings (goes into properties, not
patternProperties) and for us. If you prefer to keep it like DSA core,
also fine.

Best regards,
Krzysztof

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
