Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 853C8C4321E
	for <linux-mediatek@archiver.kernel.org>; Mon, 28 Nov 2022 20:48:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iLOqHU1tk/AJz68/ud/iFS8k8mU5vLevr7eNlqKJAW0=; b=MdeEi90Z4kPYBlXoF6mZjqIU7M
	xJcuVZ9SENLOIuss8ZyyTxTGm3yVz0I6SwliLka860qzqekOLrS++aZL9O4tS+q2DugsNoZlcve9J
	Zssv5JcHjet71MECXDE55lo4wKoUnxs5NDaGdramZxCc7FsdZgNg6c67hlyGwYDP+SqYPLfJot+9J
	dY82TjK4qfCyQQmrzD6WmTCa8hxJ6+HzEZxxmN6DcaL0cCm4e7uJkxBcafv7F/wVg0a5wZjayJ5nE
	4R97ikyTMlp/gEOF08vQRCUQfnUxhTOGP8/oIyRfITcbNsUbqAnJ1MJYWZFf/1DCeUNim2YhmyDb+
	nQ6fKKNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ozl36-004MqP-L2; Mon, 28 Nov 2022 20:48:20 +0000
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ozl2v-004MkO-Qr; Mon, 28 Nov 2022 20:48:11 +0000
Received: by mail-pj1-x1036.google.com with SMTP id o12so2857920pjo.4;
        Mon, 28 Nov 2022 12:48:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=iLOqHU1tk/AJz68/ud/iFS8k8mU5vLevr7eNlqKJAW0=;
        b=QTpId1RE6T1nRmPPMUjuHE5ouaNrjjiq59Pz6+vXiM5WC2z2oiN+wUmwOsGhZinsOX
         QXvQh3DHY+i/g1sy5Ty9+P5LPCul35pN97+a/4YR5DOtWMcbfaY0DKwUT7N3+beLLT60
         U2fiHa/wwCA8XO9pqlD0XSgImVKo5rAi7T8B35rUVkbY6pw97GeYajS77fYP1kYkor5V
         fyAtcZ9eOQiJfScvF4IZuBpNWrcJ/SABneI8uB7L4lApPqUgEbomKZs8kju+x4GA8cuY
         UBBzW+umLki9Btm9KHSuMiWML780Fcq42bLNUwzqmVAmoQJdDrgx/2Kt4nIfLWkYtgf8
         F9Rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=iLOqHU1tk/AJz68/ud/iFS8k8mU5vLevr7eNlqKJAW0=;
        b=HHo1hckukVbggApkhUVI6/z/QFj/DZspw1FT9InRrRiDbqVODjsc/yd7wS8lO/CfsK
         iul+6D83r0oJv2ZT9URPJmrGrnvXLvnU8g4A1+KqU9IEPhU8Ngy0rLCewBb3E2cWhJ9u
         3jWM0zCzQD8Ytr1hMqVztugqJO7EfCPxbcsNWVzINmc2Y7sSN0zFFgt9sccuRPxIynfx
         vuAIuOXCTkx4RTI3zChFnswtj3mYNfByQeJE6mQDbUYz2wmwHQEcuVKA7KzuTPK4Jusl
         TngtPslkZMYmYbfXjNzyrp65PEouNoZ6I8T+00VDgyZYN7FI2jgR5FeQAQtA66mr7FJl
         wjRA==
X-Gm-Message-State: ANoB5pkE62XAXIna+Lh39C++fo2R0mnuEv57fJ8cgv0DK8sTAz7Fyqq2
	k1IudyR5nRorf0+ePhEvnXY=
X-Google-Smtp-Source: AA0mqf7JCODsPMlVjPeI01VRgoosZS9kxy1/2O2yaQXA2bRmrjVsWBSuQv73rghdqgWrVixyRSrp4Q==
X-Received: by 2002:a17:90b:4b42:b0:20a:e38c:8c5f with SMTP id mi2-20020a17090b4b4200b0020ae38c8c5fmr62292579pjb.217.1669668486801;
        Mon, 28 Nov 2022 12:48:06 -0800 (PST)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.googlemail.com with ESMTPSA id c10-20020a170902d48a00b00188a7bce192sm9264970plg.264.2022.11.28.12.47.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Nov 2022 12:48:06 -0800 (PST)
Message-ID: <f2e3bdb9-fc96-42d2-a143-e13b143c8cb2@gmail.com>
Date: Mon, 28 Nov 2022 12:47:55 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v3 net-next 10/10] dt-bindings: net: mscc,vsc7514-switch:
 utilize generic ethernet-switch.yaml
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
 <olteanv@gmail.com>, Andrew Lunn <andrew@lunn.ch>,
 George McCollister <george.mccollister@gmail.com>
References: <20221127224734.885526-1-colin.foster@in-advantage.com>
 <20221127224734.885526-11-colin.foster@in-advantage.com>
From: Florian Fainelli <f.fainelli@gmail.com>
In-Reply-To: <20221127224734.885526-11-colin.foster@in-advantage.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221128_124809_934938_910D3BF8 
X-CRM114-Status: UNSURE (   9.05  )
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

On 11/27/22 14:47, Colin Foster wrote:
> Several bindings for ethernet switches are available for non-dsa switches
> by way of ethernet-switch.yaml. Remove these duplicate entries and utilize
> the common bindings for the VSC7514.
> 
> Signed-off-by: Colin Foster <colin.foster@in-advantage.com>
> Suggested-by: Vladimir Oltean <olteanv@gmail.com>

Reviewed-by: Florian Fainelli <f.fainelli@gmail.com>
-- 
Florian


