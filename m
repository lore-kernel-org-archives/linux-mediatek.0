Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D3F1C433FE
	for <linux-mediatek@archiver.kernel.org>; Mon, 28 Nov 2022 20:42:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0cSg9x/ccvep07LQXRqXIRSRKMxrUjkPjTlD/qxYYyA=; b=HpasvttGJ7yaBO+j5z6t27Fngy
	VwFwGuxTx9KdljlXZmqBI/SmaCivsrm8mcCn9rZrLJkMmjTVV+4nMG7KUvP90W8u19CCkYRwpbqF3
	RviaD2nwafujBAYCrC0muLGUZoxiSxx7h2cJFzRtA2K6VkiZ1Y002cw6M4dI9D0z/9af141NXDIlM
	ZSO8dO6Q1uHcdcL7So0qe9HVoCWoUQNlxtAbfZWdG+1Al5Ngpee/R60DL0++MrTkiRwa11vJlqPMg
	tgDrCIsjHn6VWoBS38mZz67mQi6LT1PPxUiCWehZgCK5koXx6woPLLve3gRUq0jj+Vs5bgGLMVUjN
	AZFErA7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ozkxN-004Knv-2m; Mon, 28 Nov 2022 20:42:25 +0000
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ozkxK-004Kle-D7; Mon, 28 Nov 2022 20:42:23 +0000
Received: by mail-pf1-x432.google.com with SMTP id c15so2373720pfb.13;
        Mon, 28 Nov 2022 12:42:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0cSg9x/ccvep07LQXRqXIRSRKMxrUjkPjTlD/qxYYyA=;
        b=S0DuPK6TEGCJ7JyEmFc8u5RL+2tGc8suNcD0riR8/Yu3fSNWayulBRhUpXNtSWef2P
         nVW59s7DRIwzuHW4MAmF3FlsqwG1AN/79k+Xb2QzphMwBJ7RLutWrJRaaAz8d1QsrZPv
         ZcmaPU3MHCgZlxQ5ZCH8c3b8/Vg6ybCshJXWyZU3DHkhkFc5pJwlO5vA3NVZvYIuZsdu
         9MBdRtSRJY3Tg+07WXUSIl4sHp/iqv7KgNkSmpZVgZkq4eA+El4guVU7r6OuzCy/PIjT
         aNVeMe3QaYiqOcmwlt3eGwGcHLAi3xctj3eGdJBOieaHK6FMEWbzi7J/MSaGsaCUDNsD
         iEjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0cSg9x/ccvep07LQXRqXIRSRKMxrUjkPjTlD/qxYYyA=;
        b=RIF3muNV/KYFEV1TYjll+7bpvy5wWdAz4LU6ytzhYHOgAXf3LdqKoP0sOZJMf8oWR3
         KQQV7I/EBeqEiTtKGQqgumlWWojqGmo8p2uffagHfRsMSFztTMwyGZw0lA85Q25RyZPx
         ndH1/0LRMMCHGO9yqnEiJtVU8A7wV3w8s3eTyci4G5jCGi8UfWZH+PfobDTEn4YMxtrA
         h+gwfmQf+KKf6+NKaTCGMaSQku1HsAre8tI09kY/Ry6aFMnFVH5sbjUIl+ayrG8+cKPj
         /1/aSlXvlWwm8rLhrsCOpsHiFjd2tEWdlmPcfsZyu0zxMAMaiIfbuWziF9Z0CcSxT500
         d1FA==
X-Gm-Message-State: ANoB5pm9I+smkSfa5ZJHZGQ8QhkRGDrNh0VLFjU5vhrKaJcZ3vonGnyx
	VBSJyu/tMfLp5unn/5yXR54=
X-Google-Smtp-Source: AA0mqf4nfHopmFULKIYvx0fPGZ3A6Rthh28Y+yrTorZs36JLYJwEXiFWELazalo3brIHfrsrPkDupA==
X-Received: by 2002:aa7:80d0:0:b0:565:c4e2:2634 with SMTP id a16-20020aa780d0000000b00565c4e22634mr37235658pfn.0.1669668138462;
        Mon, 28 Nov 2022 12:42:18 -0800 (PST)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.googlemail.com with ESMTPSA id q6-20020a170902a3c600b0017e64da44c5sm9210604plb.203.2022.11.28.12.42.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Nov 2022 12:42:18 -0800 (PST)
Message-ID: <0477095e-3db5-850e-2dd8-5163a05ac0e2@gmail.com>
Date: Mon, 28 Nov 2022 12:42:06 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v3 net-next 04/10] dt-bindings: net: dsa: allow additional
 ethernet-port properties
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
 <20221127224734.885526-5-colin.foster@in-advantage.com>
From: Florian Fainelli <f.fainelli@gmail.com>
In-Reply-To: <20221127224734.885526-5-colin.foster@in-advantage.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221128_124222_479901_9D44B059 
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
> Explicitly allow additional properties for both the ethernet-port and
> ethernet-ports properties. This specifically will allow the qca8k.yaml
> binding to use shared properties.
> 
> Signed-off-by: Colin Foster <colin.foster@in-advantage.com>

Reviewed-by: Florian Fainelli <f.fainelli@gmail.com>
-- 
Florian


