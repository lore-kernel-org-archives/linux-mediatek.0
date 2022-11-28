Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0183C4321E
	for <linux-mediatek@archiver.kernel.org>; Mon, 28 Nov 2022 20:43:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yShKpOzbDuo08Rg5O/TzApxhHvkpQuPMiQfCmDQcZ/U=; b=nTCXkJ2zRbzM2EqoNqObCkVSed
	sJvE/MXmFk/prROh0haUs9MiI6APads7/6cysarTAThMFyV6gc5RiCb+UZ4fPGTVyfwJtVGfTmuZQ
	l5eEmRieQXkrWlZwQVsWfDy7mzdAW8WDOJ3nHo1KXdTzihl3bfER3qmlZ27Jbtq4PJuXvlCMtw8Ak
	cktAac9dyg7/THlciqKksX0XTj+KmQ3ZqS4ire1D9cUhqK7FDDjqwlAuCBpCmCeNR9LoikdoeoLao
	EUUSR9MBouS1c3WommWi/PI+MDkcQYSGpVi49oANS9dLvGrwXxWlyK7LWTb04mSVE/DhkDKNs5g9G
	RIfEBmxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ozky6-004L52-4u; Mon, 28 Nov 2022 20:43:10 +0000
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ozky4-004L2k-1u; Mon, 28 Nov 2022 20:43:09 +0000
Received: by mail-pl1-x62b.google.com with SMTP id d3so6374145plr.10;
        Mon, 28 Nov 2022 12:43:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=yShKpOzbDuo08Rg5O/TzApxhHvkpQuPMiQfCmDQcZ/U=;
        b=Tn4UgNSh5PJ/a6+F/p3bEfoiPnJaEa3KxeftDRiIY64KDKcdZUVjA9UunfGanCITt0
         8RyFa+NNeDcpN0vrC+kn38gnjXjA3DxFBHr+z9Ao7XIh6et50vA7aguBDVjwhrBCDlJP
         aELgJRviyv5MBueGEUofC7KVQQ/NuC2/lvYWmFscYc4mPunq9N2zKwS1mOfCWAkRiJ/P
         Ac/WoFpFYjlLzPhhJblON8gZMvIX5kFHAxilBD845ZCbVOmH9Z9YlK7PiF0VvjKbL6qY
         TBFo9gz3aPQq19d/8yb62YcR1u7OTLBPTxQeXrse7xfxaPSzDEBiK8dh+auCuHk6j5Ff
         vTEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yShKpOzbDuo08Rg5O/TzApxhHvkpQuPMiQfCmDQcZ/U=;
        b=eoLKGkDQXRTInpbDBUCO2q3n2+6cmsKPI22/JujzVXr57R+SrvmAT1KD9ey+dufxWf
         K8OC0RtZgsMWf/aRBXpAOGytgGaLTz0vI+689ATJ/89QRZE9Fqwtd1bFuBDk8lJGqZJi
         M9VkoCgzUvSj+WD7yjIcqbnFATFwkp8n44PlMitk8IpRidY8MGq4qIVBp/fSjRH7an7i
         Iib08JbX35dnbmYxRbrZyD7R+1PZJaR782uLyI8sX6j5XGnNopSd9Wf6urE8NpEXOibM
         7vIqbryKfqcxUagFJM7DipMb1TLi58v9UCuQHOXbUB5aOstmx0/D0Ycne/Qb0avLjNCV
         w8BA==
X-Gm-Message-State: ANoB5pmNkdOGG/xBgqXmu7CCAHpzCDfnsTv41RomCosFjoRWV3kE5Yo1
	TohiqoQpjmqdUe8ebbT3it0=
X-Google-Smtp-Source: AA0mqf6ZzYK1KKUuoQS9eiyjwmePFmysShUH5q2ZzrN08M8GAsZ1Xf4AikNPKbV1iym4f4q7vs1Ccw==
X-Received: by 2002:a17:90b:3c0a:b0:213:7030:b2ec with SMTP id pb10-20020a17090b3c0a00b002137030b2ecmr62028618pjb.95.1669668183410;
        Mon, 28 Nov 2022 12:43:03 -0800 (PST)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.googlemail.com with ESMTPSA id x2-20020a634a02000000b0043c22e926f8sm7149770pga.84.2022.11.28.12.42.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Nov 2022 12:43:02 -0800 (PST)
Message-ID: <fdb3463f-a41a-9490-a3a6-5b091445543d@gmail.com>
Date: Mon, 28 Nov 2022 12:42:50 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v3 net-next 05/10] dt-bindings: net: dsa: qca8k: utilize
 shared dsa.yaml
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
 <20221127224734.885526-6-colin.foster@in-advantage.com>
From: Florian Fainelli <f.fainelli@gmail.com>
In-Reply-To: <20221127224734.885526-6-colin.foster@in-advantage.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221128_124308_138891_50FCC03B 
X-CRM114-Status: UNSURE (   9.34  )
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
> The dsa.yaml binding contains duplicated bindings for address and size
> cells, as well as the reference to dsa-port.yaml. Instead of duplicating
> this information, remove the reference to dsa-port.yaml and include the
> full reference to dsa.yaml.
> 
> Signed-off-by: Colin Foster <colin.foster@in-advantage.com>
> Suggested-by: Vladimir Oltean <olteanv@gmail.com>

Reviewed-by: Florian Fainelli <f.fainelli@gmail.com>
-- 
Florian


