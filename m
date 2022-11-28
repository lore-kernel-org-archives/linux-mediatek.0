Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70BDAC4321E
	for <linux-mediatek@archiver.kernel.org>; Mon, 28 Nov 2022 20:23:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=My8u4kRmGK+Yn8/6QhVO+EnqDs3urMiLBxUcHmmyiGk=; b=Wzd/kb75ihr2wIvqcu+53lIH4B
	UM+9pq2pIc079pBydz3VqI+Y1bvhBioYWXV+ISHSPEJX1a5pcfxWRqUdZ64MQlcVX2TPiQTFogzrA
	ilPACC0zlF11GQA3wTCzLWHTt9gTJlrMb+2WZO6fH0RFfAJt/ryOYcXLigq2f4V8X9/R9UGEA1iFv
	QJYdMvb2PH0lVSa0bYWwu/GZtmkn3egQYeafHNjSthbzKdRYCJxBbfS3/bLsSR4XHsO6GcQroe1Z4
	QShGkA0Z2xkLIcG5Kz0uLexarEl/KgwU4fzeaFj1s4g8w9wR+LZhu2ifFALPB9zGKGdfa6JuoHLjJ
	y/1FZAxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ozker-004IYK-UY; Mon, 28 Nov 2022 20:23:17 +0000
Received: from mail-pg1-x536.google.com ([2607:f8b0:4864:20::536])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ozkep-004IWI-En; Mon, 28 Nov 2022 20:23:16 +0000
Received: by mail-pg1-x536.google.com with SMTP id w37so5830521pga.5;
        Mon, 28 Nov 2022 12:23:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=My8u4kRmGK+Yn8/6QhVO+EnqDs3urMiLBxUcHmmyiGk=;
        b=UcFlC9OhsKqP3QUePtkbMS7mo/ibRjDzrbPHmpCZ8njlXrOFkM2hBoVx05wMHJqoq0
         rMls6J6TkFWss4JvG614aHONu5Z5C/3ZqZZ4ylzMnbYmPkh+L0c9pp8FjcewgBY+qiAq
         YPHdtSYtlZUAyWvCNkd/B1tBANSJrTuHuQbT0jKDaEeJStOXyBrGNyl7L63Zxv0Ix0YU
         8HlAQI9uyd5hFst8Hpv3xxaOcq4Bq0hVXW+0AMB37o4IFQIvwEorhLQNE6C0g5REhGRV
         PuCBHD5y2JqM156Lklpq5p8zM58NJsaihK5z10jRDNVcC/8rWTfiMx5NleoBG8/1Icei
         W6pQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=My8u4kRmGK+Yn8/6QhVO+EnqDs3urMiLBxUcHmmyiGk=;
        b=W4vb1obwadVOqo6Lqm1BKm+fGflbOIzxHrlPRdGmJeREPX/x0r370TmrdvNbtSxHc9
         P/QZriaTLdtgJ+ZwYUdkqki2IatA+Q6VwMwY9FpHaO1aEgQUC9Kw8icolaGrhW9XRwLN
         flmD+VSR/Wg+rfxjxRK3aa3ACiniDY3cjTmjD2TQ2X/6uaN1IvEJOZwKHZhSiQprH/Pb
         eHZz+0aCb5htyNdiZWhUxmXXz6QCPe5U1jIrcKhZwfPIk9TZkt/Gc5mHXfMJf7Qw2Mlh
         CjBUqveR5K1yHAsmW5529rKMyYzuhqPCkPmxc8YKRGXI7DnbaJe1k87EHqZgW1lQQyD+
         P5wA==
X-Gm-Message-State: ANoB5pn4gTrzH/uFI/knk6mqx90GCfin82r78xjlHaGdvaM3f6w776oj
	qliJK8yn/nFALcnKUtMeEo0=
X-Google-Smtp-Source: AA0mqf4oImiJC3pygvUY6NUG2A7aDmbpiDXe7PORw+aNCo2Foi05c3TORWEg7Yh4zqDkFEQEZkJB6Q==
X-Received: by 2002:a05:6a00:1bcb:b0:574:ba25:1e43 with SMTP id o11-20020a056a001bcb00b00574ba251e43mr18146677pfw.63.1669666991536;
        Mon, 28 Nov 2022 12:23:11 -0800 (PST)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.googlemail.com with ESMTPSA id u4-20020a63ef04000000b00476b165ff8bsm7189694pgh.57.2022.11.28.12.23.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Nov 2022 12:23:10 -0800 (PST)
Message-ID: <3249e731-e7bd-e9f5-1c76-3ac41def3565@gmail.com>
Date: Mon, 28 Nov 2022 12:23:03 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v3 net-next 01/10] dt-bindings: net: dsa: sf2: fix
 brcm,use-bcm-hdr documentation
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
 George McCollister <george.mccollister@gmail.com>,
 Rob Herring <robh@kernel.org>
References: <20221127224734.885526-1-colin.foster@in-advantage.com>
 <20221127224734.885526-2-colin.foster@in-advantage.com>
From: Florian Fainelli <f.fainelli@gmail.com>
In-Reply-To: <20221127224734.885526-2-colin.foster@in-advantage.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221128_122315_531994_BD111609 
X-CRM114-Status: UNSURE (   9.74  )
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
> The property use-bcm-hdr was documented as an entry under the ports node
> for the bcm_sf2 DSA switch. This property is actually evaluated for each
> port. Correct the documentation to match the actual behavior and properly
> reference dsa-port.yaml for additional properties of the node.
> 
> Suggested-by: Rob Herring <robh@kernel.org>
> Signed-off-by: Colin Foster <colin.foster@in-advantage.com>

Acked-by: Florian Fainelli <f.fainelli@gmail.com>
-- 
Florian


