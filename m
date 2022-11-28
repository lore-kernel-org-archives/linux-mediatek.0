Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA1D2C433FE
	for <linux-mediatek@archiver.kernel.org>; Mon, 28 Nov 2022 20:44:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nBb+P0/n49Id7n7ZlG8fSGtAH3uSOCjmcnFinIp66gs=; b=N8OPdPtdrY2rHZ8oWovgRbjzGX
	4b0+kW6Vk4xVzNDHVd4n46xzRvIPIl/UIKqQvR6rLKvEWTzsvjrPLkn1/8KlesP259QLjrWsHGMyh
	61EfVd74bNAgATth5oYlwkfDt+d952mvA6IwUl+8qAO8ksNYmpmY8KDusHrUf55OHTce+58CBrUyQ
	7mXXdPpotzXj8a1OZCEiO1gyY7eZyFaSVjKkvURb54kyqeEVhHw8/iGSQxPiFnSvUyWi6TP3J5+zt
	4piqc6HjXIwuUSed+KLqYmcI5zr4bXfMQOHKOgghr46ZebxncLuzIUDYwH1xoAalK60Z98ItnY7Po
	+VMv0RmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ozkzV-004LdA-7P; Mon, 28 Nov 2022 20:44:37 +0000
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ozkzR-004LaX-7V; Mon, 28 Nov 2022 20:44:35 +0000
Received: by mail-pj1-x102b.google.com with SMTP id k2-20020a17090a4c8200b002187cce2f92so15239034pjh.2;
        Mon, 28 Nov 2022 12:44:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=nBb+P0/n49Id7n7ZlG8fSGtAH3uSOCjmcnFinIp66gs=;
        b=fU8qukFdsMAw9M3IR/Uz+aCBg+OcMJv/R1U1B7fnrh1//qeaceCwWyi+wwn8n+b40C
         UvFWgbeALna8ygBhyV2QnUs2CK8C4zeqFevfHGggvBwAtwok3G5ym5TuhvtlZSxPEidj
         mCu78GsYp1MVJYemhrWgsnnS3u9LTlGWraMi1a6FLzTAUX37cEizr1JUxB2WWuMa4IOH
         AAnMB9+pHJiF5iiJa6I3SUmvoOevK5GC276VR+BAj927mGJHbGeX77mAWvSxKPKG0LP7
         qz7gjgE92DWvLbCi18WUNWS4TjfukB6yMOu9d4P1OwrSF/dcn/r2c7azW2G1ikt+rRu3
         Bbmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nBb+P0/n49Id7n7ZlG8fSGtAH3uSOCjmcnFinIp66gs=;
        b=M/6ajRj9PMIFKo8eF3Uhjeo+MQzUT7llQfduaSrDdvW+3Ipn8lY5IZlZkZ4gGoAppy
         dbbjo30OU8b4Q8B0D7TSMFp+Viu90YqzMtwnP38AKxr6vCsLA+sLYixvJUvW1XoXK5W8
         eaQrgotKzYpcATYj3i/ikRy0lpBR5Pz2mCezzsRurXvrz9OerQv3TtjQq6UmwftgxZmh
         JEb5+21RznQsWIY0ZtTbiVm/LsVIlQxxgRPTkljjI/DOX3SrSkEfQ8Sb3UAIDcVuDNAF
         054/g3s/yaefciR8XG4rNH5GC8EA9GrYXoSDMA6RI/2HBHpjPMeVU8+9XB+oA68YKZkZ
         7wLQ==
X-Gm-Message-State: ANoB5pnYDpkCmZpxk7K1sf5G6QBu4tSCTPt1WH1Kg93PNXm0EP7T0XWO
	GAWZwOOHIGFVXGVoxn20Jko=
X-Google-Smtp-Source: AA0mqf6vQCiSvx/+6VWhAHkNMd1v1xkv3c2ocMTBBfl1gCa5YPuS3GX/NyDzDEA3kZ6nnq4P03GRuA==
X-Received: by 2002:a17:902:ecca:b0:189:ee1:23f with SMTP id a10-20020a170902ecca00b001890ee1023fmr35017558plh.75.1669668268572;
        Mon, 28 Nov 2022 12:44:28 -0800 (PST)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.googlemail.com with ESMTPSA id c17-20020a6566d1000000b0046f469a2661sm7257597pgw.27.2022.11.28.12.44.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Nov 2022 12:44:28 -0800 (PST)
Message-ID: <c07e6089-5d87-2a4a-df1f-fbbd0c94136d@gmail.com>
Date: Mon, 28 Nov 2022 12:44:16 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v3 net-next 08/10] dt-bindings: net: add generic
 ethernet-switch
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
 <20221127224734.885526-9-colin.foster@in-advantage.com>
From: Florian Fainelli <f.fainelli@gmail.com>
In-Reply-To: <20221127224734.885526-9-colin.foster@in-advantage.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221128_124433_322807_672382AC 
X-CRM114-Status: UNSURE (   8.92  )
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
> The dsa.yaml bindings had references that can apply to non-dsa switches. To
> prevent duplication of this information, keep the dsa-specific information
> inside dsa.yaml and move the remaining generic information to the newly
> created ethernet-switch.yaml.
> 
> Signed-off-by: Colin Foster <colin.foster@in-advantage.com>
> Suggested-by: Vladimir Oltean <olteanv@gmail.com>

Reviewed-by: Florian Fainelli <f.fainelli@gmail.com>
-- 
Florian


