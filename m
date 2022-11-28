Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08B35C4321E
	for <linux-mediatek@archiver.kernel.org>; Mon, 28 Nov 2022 20:43:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vEnIqnlBXltqKqAFyMwZ9D4cXMhUwtre5BGpsyfjDZA=; b=svVf5yaST1RaeLF4lZ+FFetXwR
	FRFNIPnxAp42I02V+gfxV0In0QFX/XeDYYWJMzPiIVNEbuo69fX8eJ66DeSm5Z/mia8iaj6CyYObg
	W91GoKFqclUZjbVR50Sw8uuZyOn71IMJB7p58ZH5E+mDGp18lrRYOXkbVOKA7Lm3rLBFnUV6sFl5S
	rAVGxvWYFZGwRZR0mluNXkdpiWjbwc7MC2HhyEFOniSblNgUhr0EEf9PQLtknspV5PAm+vB+O3I12
	htJuFxMVjTo1oQGzoMdF0F9KmFD1iJD5STW9zuSfnTzZjXiMIBM/OjlFMed1rkbjrtlzMHsnbEPhx
	wR50sirA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ozkyh-004LKF-5N; Mon, 28 Nov 2022 20:43:47 +0000
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ozkye-004LIN-L6; Mon, 28 Nov 2022 20:43:45 +0000
Received: by mail-pl1-x62f.google.com with SMTP id g10so11348529plo.11;
        Mon, 28 Nov 2022 12:43:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=vEnIqnlBXltqKqAFyMwZ9D4cXMhUwtre5BGpsyfjDZA=;
        b=ZecIg/2kg1a7dhSGJa3syxbA71E6/awO/n4mN5KEYHdMCgGBR3F/7DVIBBt+9ohuTv
         Ui3/kRi4qLRLuUqLF5xixECLUoHhuxsxM3qV3KwmxIkLqhiDCCWkNTaihd3eYlEr7grp
         +mX1r6/mR/q6/tK0ZDirWff46qujHs8ixoMMmjVD2ob8zk5nAE6qrcoUB8WOkC9umd9+
         7aZLoHNsEivy5y5xjMajj2xiq2tx5gu8qhe+4RKTzEjxH2ftSRvQKj5kZo0+glBdR27p
         mL4u5238LGBZB7HRpmMjzlgjiVk2/dj2Mhs08MD83LAW9hDUhjivBHgN8lakvYMdGyNQ
         DyPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vEnIqnlBXltqKqAFyMwZ9D4cXMhUwtre5BGpsyfjDZA=;
        b=JrSmpz/YSx5HZScNuj55rX328bGDhgiGVy/a36RGZkPTpu1STX8qgeMEpPo0czrorE
         5bkt4IFIWhMMhqYNC8Np43+t49RFfgP79N+HQjyRFDM0eLjNd6YoulLFD7cg/Ky95Dzc
         OSvj9kW6tUXcKqMY+hSu9z/tyvD/nzRTfHGpHfZjvIdTXJ7CwTx1KPXN3vVHiKBgtHPi
         /LEEOmIUrammabDUTEdlWLI2RgMQWY0NNCe5R+qSgYIAXEAT30MG8PioecQBMotLi0As
         Usy5kBDVc/Coj9RrJ89i/Ne3FPntkls+PN0dW98CZSceQYEUbCt1kPJRCUlS8OOkMwlM
         n/pw==
X-Gm-Message-State: ANoB5pl3Ob9yZqhVh0aAfqfLUMY/jmZIdwDttGClg/8peAbUeShw8Hyj
	C4AayV6e31t6pAN5BoOp/F4=
X-Google-Smtp-Source: AA0mqf60NIuzlcRi+5sNXaNgA7LZBhrZzcytRRa7yn3AAljNCa2kyfI4J5oyEJbXUiEWGgzx5Yrzgw==
X-Received: by 2002:a17:902:74c3:b0:189:8001:b553 with SMTP id f3-20020a17090274c300b001898001b553mr10547033plt.59.1669668222500;
        Mon, 28 Nov 2022 12:43:42 -0800 (PST)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.googlemail.com with ESMTPSA id ix11-20020a170902f80b00b00186b758c9fasm9291820plb.33.2022.11.28.12.43.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Nov 2022 12:43:42 -0800 (PST)
Message-ID: <937638e5-02f0-38be-8a78-942296cf3e44@gmail.com>
Date: Mon, 28 Nov 2022 12:43:29 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v3 net-next 07/10] dt-bindings: net: dsa: mediatek,mt7530:
 remove unnecessary dsa-port reference
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
 <20221127224734.885526-8-colin.foster@in-advantage.com>
From: Florian Fainelli <f.fainelli@gmail.com>
In-Reply-To: <20221127224734.885526-8-colin.foster@in-advantage.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221128_124344_709508_30AE26D7 
X-CRM114-Status: UNSURE (   8.94  )
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
> dsa.yaml contains a reference to dsa-port.yaml, so a duplicate reference to
> the binding isn't necessary. Remove this unnecessary reference.
> 
> Signed-off-by: Colin Foster <colin.foster@in-advantage.com>
> Suggested-by: Vladimir Oltean <olteanv@gmail.com>
> Reviewed-by: Arınç ÜNAL <arinc.unal@arinc9.com>

Reviewed-by: Florian Fainelli <f.fainelli@gmail.com>
-- 
Florian


