Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E661C6FA83
	for <linux-mediatek@archiver.kernel.org>; Mon, 12 Sep 2022 18:13:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8E7PntAsREeNfSHyD8ppPZ5kkKGXgsJxyvl0PQ0fJI8=; b=zD4Ov3e5IekZd8XD34+TVKZy5k
	JVbshNDNj1vwyN57+/k6jW3vQL7RxXDrteASZis3uNb+MCCHu25nqLNfIdjgn4KHIOm2PC9TpptBZ
	7HNB2X4S2++emzkOCN5Y+3l9KA/o+9VFsgNSw5Ou1hoeCQ7GGxnqOPB54hMLzRCc1TU+vJyy/h7X0
	RUL6FNMl2+lVpuCyIN/y8cYAFZbs0Qz0+85RWv4lJi9iIP6wPT/3oiwHJQysCQjpg0VrbyL76CwMN
	2uIOHhQ6q/HgPnwqr7o7Bk/yD909u8j98lnE46WM8P5S1DB8s1P8ITTVHumWaikEt89A9PkJotM+v
	X/dUTvog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oXnvS-00CMh0-1S; Mon, 12 Sep 2022 18:12:54 +0000
Received: from mail-qk1-x730.google.com ([2607:f8b0:4864:20::730])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oXnvB-00CMX5-QU; Mon, 12 Sep 2022 18:12:39 +0000
Received: by mail-qk1-x730.google.com with SMTP id d15so6645658qka.9;
        Mon, 12 Sep 2022 11:12:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=8E7PntAsREeNfSHyD8ppPZ5kkKGXgsJxyvl0PQ0fJI8=;
        b=I/7RINzP0Z0yZPVoIdOreH/t6XQdmWwGtveYCBeVEu5VJWh7lW6ppFjR9BkhxaUGo9
         AXnm14DvFNOfLCYuhMPnWdMDSyu4jNhn/TQCzSO7SzxJl6HR8kmL8dsZdXp1D9OCxw/L
         ++SJAmew/2FAK7arDApyRpJPCVPmVDtqADcTUVX2YwFFI3OKeqQyyQq7lnDwX8gVHdxy
         pQpaIMgO2POsUO1G/jQD7sNfN1xGL/Pp7VweYWJem1GbMTBu/QqAAWj39zxADN7sBQIR
         u83wMD9Ydf812TL92+6+Nk+IYGDxuqNZ+RqlMan0MaNnL7tRAkew40Son8O+TYzh1fo8
         WwWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=8E7PntAsREeNfSHyD8ppPZ5kkKGXgsJxyvl0PQ0fJI8=;
        b=Hy4saTtizXXNA6Fy0P1BXxW9BB8BzWD/8hgqoyi1Zoz0oHmydCkYrvdm+HElWD0iDb
         32adScqAKBDsKLwdGsRJxhvAEfjSLOdOS+r5Xwv/KP4xHkSBd8bLcIrdqFyIXIk/XM6k
         cPwkOILdadAj8MK6ku7pqFj85i9fYD9/kj209SfGouTwQcjIeZ/P1kTVjM967buW6aMD
         0DeC+VpkfGg+o1Lfs3xT2u30hLHsjnPSHQH+CbxRjsEQf/Z2nvDLj9stOm4bRpjmEfmu
         sxRSRvjuIcOd0TloT0lvJPtDd+3TNfex+iwIsoXamLejkdO72hXMKVyFdZYPGpGlJp6x
         Tb1g==
X-Gm-Message-State: ACgBeo1IU3EgLdTdNQaUHaTQsaApmqxd0qFi+aZ+2Xqw1J44uaTt6TbY
	MAZyMS3SOd6Hfn1ov9fpdz4=
X-Google-Smtp-Source: AA6agR7EaWz1dfDbiGlBhX0giEUzB6WX6YP4xReDzRQPT/z8Lax4IuXZ12+4iPhwm+Wyq1EU8+FPrA==
X-Received: by 2002:a05:620a:22f9:b0:6ce:5ea1:a957 with SMTP id p25-20020a05620a22f900b006ce5ea1a957mr1658052qki.359.1663006356312;
        Mon, 12 Sep 2022 11:12:36 -0700 (PDT)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.googlemail.com with ESMTPSA id h8-20020a05620a284800b006cbc40f4b36sm7450846qkp.39.2022.09.12.11.12.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Sep 2022 11:12:35 -0700 (PDT)
Message-ID: <cb90a930-8322-3d4b-ff7a-2bdde0787bd4@gmail.com>
Date: Mon, 12 Sep 2022 11:12:28 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH net-next 3/3] dt-bindings: net: dsa: remove label = "cpu"
 from examples
Content-Language: en-US
To: Vladimir Oltean <vladimir.oltean@nxp.com>, netdev@vger.kernel.org
Cc: Andrew Lunn <andrew@lunn.ch>, Vivien Didelot <vivien.didelot@gmail.com>,
 Vladimir Oltean <olteanv@gmail.com>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 George McCollister <george.mccollister@gmail.com>,
 Kurt Kanzenbach <kurt@linutronix.de>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Woojung Huh <woojung.huh@microchip.com>, UNGLinuxDriver@microchip.com,
 Linus Walleij <linus.walleij@linaro.org>,
 =?UTF-8?Q?Alvin_=c5=a0ipraga?= <alsi@bang-olufsen.dk>,
 =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <clement.leger@bootlin.com>,
 =?UTF-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>,
 Landen Chao <Landen.Chao@mediatek.com>, DENG Qingfang <dqfext@gmail.com>,
 Sean Wang <sean.wang@mediatek.com>, Marek Vasut <marex@denx.de>,
 John Crispin <john@phrozen.org>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-renesas-soc@vger.kernel.org
References: <20220912175058.280386-1-vladimir.oltean@nxp.com>
 <20220912175058.280386-4-vladimir.oltean@nxp.com>
From: Florian Fainelli <f.fainelli@gmail.com>
In-Reply-To: <20220912175058.280386-4-vladimir.oltean@nxp.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220912_111237_888789_BB639902 
X-CRM114-Status: GOOD (  10.36  )
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

On 9/12/22 10:50, Vladimir Oltean wrote:
> This is not used by the DSA dt-binding, so remove it from all examples.
> 
> Signed-off-by: Vladimir Oltean <vladimir.oltean@nxp.com>

Reviewed-by: Florian Fainelli <f.fainelli@gmail.com>
-- 
Florian

