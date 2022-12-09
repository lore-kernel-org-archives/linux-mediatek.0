Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59D80C04FDE
	for <linux-mediatek@archiver.kernel.org>; Fri,  9 Dec 2022 09:11:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=H3FnNOdvI4rWjnHyWgDozXRbaw2AYIAUlqPWPsqxkL4=; b=K7jHFzfitlYVEh8i2s3s6/lBjc
	w/38Q5+/kglI7Jb6FY4s57R4R7Ebd1klMaeY7wDZFb7pbnkdHqlDi21N5AQd2pWGqSPZBlpl79oaV
	Ltrk8jiwE1fFEu2QG6yRAd1glbv2IhI4+SZOuLdKjTfN4d3py9OiBFyzrRo4u+5BZ2cLPPFwqFnHm
	Ohpq1lE9IQQVOyS7yWw2Ry72nMQpyhCVVcW6LpS4Tk1qey2B+cBlTCv+dbV/5R57DBTTvAvSdiELS
	AbeR5RtM0T464SMdnF4gY7miiqYFKWTrspR8s4xQlshSVPuxF8jgPv0Xsb7EU6xDhvw2M4ETsYs4/
	ViO2/L1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p3ZPK-0068Am-Bm; Fri, 09 Dec 2022 09:11:02 +0000
Received: from mail-lf1-x12e.google.com ([2a00:1450:4864:20::12e])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p3ZP9-00688V-I2
	for linux-mediatek@lists.infradead.org; Fri, 09 Dec 2022 09:10:52 +0000
Received: by mail-lf1-x12e.google.com with SMTP id b13so6075810lfo.3
        for <linux-mediatek@lists.infradead.org>; Fri, 09 Dec 2022 01:10:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=H3FnNOdvI4rWjnHyWgDozXRbaw2AYIAUlqPWPsqxkL4=;
        b=KVD+7kE5lL+pTeO+6c4//dBqt1KZPY3HulvHg+MoL6IdGUPCh+ks/OvIUzmXSBeEZw
         bcZmjv0cv6XT05ZOc/dnJzmDozJjL246ZFrSno03viiWBYVODbdpzpHEIhmdSeDfI16V
         flZB2ySxV2+7+m77ICY/k1pWlMzq7oD6sXN6d+ielbPXEnbl93/eVV86wfJ5qCjOVoDD
         lr17Kjufd+bsqRgl9pAc3iYAlKiubrAR7RZ+fTNNA8R+731rLSlX0xBLtpZKgmnf3++J
         gcv59wEAqSoD9TDOswZUYuIXE+l+SF61eJnC0ojJnkqOoxulqUbiwQwxvavlZyvMLKY8
         PhMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=H3FnNOdvI4rWjnHyWgDozXRbaw2AYIAUlqPWPsqxkL4=;
        b=fqxjQQPUgnGkneakJPZYmdgKnYeg+BSitiFAA7OG1GUTMW0+HLVpOkz883vkoit7J/
         fHGw6oebhejWoJ3i1IArgKBk/LTSvU0iKatLRrSXSXNfXt5bX+KRC7b7/ze9JmbmFirv
         BdqpNd3RrkkyMAzWaE4aitcZPHcB11/lu+6RSa9wQNDZri7B2RiQuKqoS4jEhOiK2SSK
         Xj2YVNNoArztIRYsnOA3ev5KEK3ZbursBv+Xy5/Oq+oyFel/ca/4Z1wfiCtdTWxeqqtD
         Xd7FTbLlXjkaDSuwDCbzWE9IT9djAR4LyA20HFBFltMB3AfOF9ZbLzTOyX9pqHLTs6bH
         dIqA==
X-Gm-Message-State: ANoB5pkMNHWOmxy7h9OXBAcQ69x5zBFFyB2e5h/S1+Qg8wLuRyDY7f6B
	CvO867Ifg9KM0CUjw5CuFsgmnA==
X-Google-Smtp-Source: AA0mqf7xEULdEwSJaPke8khzMoilV4EuukcDjEPYH9CA6fV2c9nDO1TqTdVqHoLoVpg4ATBzhLO7RQ==
X-Received: by 2002:a05:6512:3d05:b0:4ac:959a:a23 with SMTP id d5-20020a0565123d0500b004ac959a0a23mr1775763lfv.7.1670577049659;
        Fri, 09 Dec 2022 01:10:49 -0800 (PST)
Received: from [192.168.0.20] (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id y17-20020ac24211000000b004b01305732bsm175657lfh.216.2022.12.09.01.10.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 Dec 2022 01:10:49 -0800 (PST)
Message-ID: <15d9461c-5b31-dfb5-ec9d-4b79ea120aeb@linaro.org>
Date: Fri, 9 Dec 2022 10:10:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH v4 net-next 3/9] dt-bindings: net: dsa: utilize base
 definitions for standard dsa switches
Content-Language: en-US
To: Colin Foster <colin.foster@in-advantage.com>,
 linux-renesas-soc@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, netdev@vger.kernel.org
Cc: John Crispin <john@phrozen.org>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Claudiu Manoil <claudiu.manoil@nxp.com>, Marek Vasut <marex@denx.de>,
 Sean Wang <sean.wang@mediatek.com>, DENG Qingfang <dqfext@gmail.com>,
 Landen Chao <Landen.Chao@mediatek.com>, =?UTF-8?B?bsOnIMOcTkFM?=
 <arinc.unal@arinc9.com>, Vivien Didelot <vivien.didelot@gmail.com>,
 =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <clement.leger@bootlin.com>,
 =?UTF-8?Q?Alvin_=c5=a0ipraga?= <alsi@bang-olufsen.dk>,
 Linus Walleij <linus.walleij@linaro.org>, UNGLinuxDriver@microchip.com,
 Woojung Huh <woojung.huh@microchip.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Kurt Kanzenbach <kurt@linutronix.de>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Rob Herring <robh+dt@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Jakub Kicinski <kuba@kernel.org>, Eric Dumazet <edumazet@google.com>,
 "David S. Miller" <davem@davemloft.net>, Vladimir Oltean
 <olteanv@gmail.com>, Florian Fainelli <f.fainelli@gmail.com>,
 Andrew Lunn <andrew@lunn.ch>,
 George McCollister <george.mccollister@gmail.com>,
 Rob Herring <robh@kernel.org>
References: <20221202204559.162619-1-colin.foster@in-advantage.com>
 <20221202204559.162619-4-colin.foster@in-advantage.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221202204559.162619-4-colin.foster@in-advantage.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221209_011051_634530_9F170A48 
X-CRM114-Status: UNSURE (   9.81  )
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

On 02/12/2022 21:45, Colin Foster wrote:
> DSA switches can fall into one of two categories: switches where all ports
> follow standard '(ethernet-)?port' properties, and switches that have
> additional properties for the ports.
> 
> The scenario where DSA ports are all standardized can be handled by
> swtiches with a reference to the new 'dsa.yaml#/$defs/ethernet-ports'.

typo: switches

> 
> The scenario where DSA ports require additional properties can reference
> '$dsa.yaml#' directly. This will allow switches to reference these standard
> defitions of the DSA switch, but add additional properties under the port

typo: definitions


Best regards,
Krzysztof


