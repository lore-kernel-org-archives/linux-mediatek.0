Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 730A5C4345F
	for <linux-mediatek@archiver.kernel.org>; Tue, 30 Apr 2024 22:09:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=D8EYHlaCPYFs75yPvIGT4CAnZPHT++WuY82kIU/tKN4=; b=sOSgvDA4JYfXgHJ+m601P4/pcf
	8JvQvth23xHwjpPcXRefp1VMjXT0R0YKG7SlSV9XHRU6xTU/yycxwH4PkynnMvQ8/X3StFlfWWDHE
	snWUe4dJK204h5YaznDcOi8ycNMfN/gXNrvXW1qZ+SlJidtOsrTauEPM9ngDAs6G2R8z7btuDJ123
	8CwFZLoXCuKPWJQTAJmc/8dFW9KVkRyml6KELVZK7QP5Q+jr44vTwXftim3ag2I2tCOuSvossfdWL
	enDzDCaw2q8jRIlelYXAAZsCW7h6JOdzedWpJtOIsgy1BjvuvkHJFuE8VZoykKTVlo6WXH3hx4Mtx
	scvjg1Yg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s1vf2-000000082tw-3Fvo;
	Tue, 30 Apr 2024 22:09:16 +0000
Received: from mail-oi1-x230.google.com ([2607:f8b0:4864:20::230])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s1vey-000000082sg-1GQ2;
	Tue, 30 Apr 2024 22:09:13 +0000
Received: by mail-oi1-x230.google.com with SMTP id 5614622812f47-3c861a87d6dso2055717b6e.0;
        Tue, 30 Apr 2024 15:09:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1714514947; x=1715119747; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=D8EYHlaCPYFs75yPvIGT4CAnZPHT++WuY82kIU/tKN4=;
        b=Mu2rEM/oujV0xCUfanDNwoc86xtY6wkkud1JmxN6/bsjEzy5MeeTXAmelG1xAmjB1I
         LocL2LWgMqwMjYR9sGqSghT28wuTDkkgEhUBrWwAd9jQLHYrI31bpeH+zJocQPCHHLBb
         3DSYOW6/FubtaKEmZsUlMFbR+f71sEtkaiaDb8mgJLZuxAi4oWUTiXORbNQC1kLQ4kVV
         ZprGJ7f8UedN03jQua9Q3AaaeiFeW35u+t8XFBRzX5ZzN3gzm5sWC0EJyFCJiwTCNwGp
         CLg4D3nGAKFmGO/NizjqSy6be7EUmcM6Erl0+ErY5GfGNFq8GlCwhmFbv9utoh0CXkYh
         VCIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714514947; x=1715119747;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=D8EYHlaCPYFs75yPvIGT4CAnZPHT++WuY82kIU/tKN4=;
        b=iumE7K5gWFUgyWozVQhgTzL2uHyOKACsVCdyv4RUDWbMUmBei0CXDPK3mG7YJu80dj
         8eHzzxR6Eps5jr1gAyQ1fhOpn3NePjatev6K74P2yy0FogY46cnFvWvPUbyFbG9lupax
         3v9192kLKAcqjSRV1YW6qhZ8ChnKQKK/mkVXfejVTHjBAhb/3V9Nr2/go1EaLg5rGDEM
         ofAuh5T27hiVloL0MogE07J7ef8IASSDJtD96GWyaTPMWtja6+jkBIYCg+2tWLueC7PD
         mck7Io+jlDQiKM52ezOvTqZF7jFlWwgWZtCeXTfRl8Enl3PPu4FB2rWnkPAV/1dFsXuB
         DMqg==
X-Forwarded-Encrypted: i=1; AJvYcCURjyn84w9FwMm88b1MUfHlRjga03axQSisD/b41sTgjg/VXkQsq4XjPzpSu6Z1U1kvtsxIz9OExB0x7iO/zS4GnYikOCuzcPN9REpjwpnzm5+iK8/U95hiv74kZxGdW+y0PSOvkRQNFozVn4hxbe6JGlQhMKDnXHU=
X-Gm-Message-State: AOJu0YyC/X3+dRn5BQbeP760diNaztj1HGqfZCJL5CzGYHYqP7P8fCEC
	idku+yxvw3MDzcU0YVKR2sLn6HVj3AuX9uLHj0qT+J/ey0gSbHlF
X-Google-Smtp-Source: AGHT+IETt7byCjYF1N0xP05blWct8RPmwdPPW9i2/XgFWBAcrVKgQp4kr0uqKdBa1O0p2bnnZSWcaw==
X-Received: by 2002:a54:4e8d:0:b0:3c8:4970:70a7 with SMTP id c13-20020a544e8d000000b003c8497070a7mr919659oiy.0.1714514946863;
        Tue, 30 Apr 2024 15:09:06 -0700 (PDT)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.googlemail.com with ESMTPSA id w15-20020a0ce10f000000b0069b6e19090csm11790925qvk.10.2024.04.30.15.08.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Apr 2024 15:09:06 -0700 (PDT)
Message-ID: <ba140a7b-0627-4d73-8267-8721f6ce1c63@gmail.com>
Date: Tue, 30 Apr 2024 15:08:51 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net v2] net: dsa: mt7530: fix impossible MDIO address and
 issue warning
To: Daniel Golle <daniel@makrotopia.org>, =?UTF-8?B?QXLEsW7DpyDDnE5BTA==?=
 <arinc.unal@arinc9.com>, Felix Fietkau <nbd@nbd.name>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Simon Horman <horms@kernel.org>,
 DENG Qingfang <dqfext@gmail.com>, Sean Wang <sean.wang@mediatek.com>,
 Andrew Lunn <andrew@lunn.ch>, Vladimir Oltean <olteanv@gmail.com>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Landen Chao <Landen.Chao@mediatek.com>, devicetree@vger.kernel.org,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <11f5f127d0350e72569c36f9060b6e642dfaddbb.1714514208.git.daniel@makrotopia.org>
Content-Language: en-US
From: Florian Fainelli <f.fainelli@gmail.com>
In-Reply-To: <11f5f127d0350e72569c36f9060b6e642dfaddbb.1714514208.git.daniel@makrotopia.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240430_150912_381553_F0EED7B8 
X-CRM114-Status: GOOD (  29.94  )
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

On 4/30/24 15:01, Daniel Golle wrote:
> The MDIO address of the MT7530 and MT7531 switch ICs can be configured
> using bootstrap pins. However, there are only 4 possible options for the
> switch itself: 7, 15, 23 and 31. As in MediaTek's SDK the address of the
> switch is wrongly stated in the device tree as 0 (while in reality it is
> 31), warn the user about such broken device tree and make a good guess
> what was actually intended.
> 
> This is imporant also to not break compatibility with older device trees
> as with commit 868ff5f4944a ("net: dsa: mt7530-mdio: read PHY address of
> switch from device tree") the address in device tree will be taken into
> account.
> 
> Fixes: b8f126a8d543 ("net-next: dsa: add dsa support for Mediatek MT7530 switch")
> Signed-off-by: Daniel Golle <daniel@makrotopia.org>
> ---
> Changes since v1:
>   - use FW_WARN as suggested.
>   - fix build on net tree which doesn't have 'mdiodev' as member of the
>     priv struct. Imho including this patch as fix makes sense to warn
>     users about broken firmware, even if the change introducing the
>     actual breakage is only present in net-next for now.
> 
>   drivers/net/dsa/mt7530-mdio.c | 13 +++++++++++++
>   1 file changed, 13 insertions(+)
> 
> diff --git a/drivers/net/dsa/mt7530-mdio.c b/drivers/net/dsa/mt7530-mdio.c
> index fa3ee85a99c1..3c21c8d074c7 100644
> --- a/drivers/net/dsa/mt7530-mdio.c
> +++ b/drivers/net/dsa/mt7530-mdio.c
> @@ -193,6 +193,19 @@ mt7530_probe(struct mdio_device *mdiodev)
>   			return PTR_ERR(priv->io_pwr);
>   	}
>   
> +	/* Only MDIO bus address 7, 15, 23 and 31 are valid options */
> +	if (~(mdiodev->addr & 0x7) & 0x7) {
> +		/* If the address in DT must be wrong, make a good guess about
> +		 * the most likely intention, and issue a warning.
> +		 */
> +		int correct_addr = ((((mdiodev->addr - 7) & ~0x7) % 0x20) + 7) & 0x1f;

0x20 -> PHY_MAX_ADDR
0x1F -> PHY_MAX_ADDR - 1

> +
> +		dev_warn(&mdiodev->dev, FW_WARN
> +			 "impossible switch MDIO address in device tree: %d, assuming %d\n",
> +			 mdiodev->addr, correct_addr);
> +		mdiodev->addr = correct_addr;

Sorry for not jumping on this earlier on, there is a mixture of 
hexadecimal and decimal numbers being used which IMHO just makes this 
more difficult to read than needed. It seems like the requirement is for 
the switch's MDIO device address to have the lower 3 bits set, so can we 
give it a name like MT7530_MDIO_ADDR_VALID_MASK?	
-- 
Florian


