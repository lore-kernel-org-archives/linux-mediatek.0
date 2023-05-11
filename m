Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD7E1C7EE22
	for <linux-mediatek@archiver.kernel.org>; Thu, 11 May 2023 05:29:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=y4x62um4Cta2MQq5bfpbv18O8tiAYzIjxL+XVu9krq4=; b=2IcldVRqyUAM2+YGIA2oXmguJm
	ET1Zs+orSot5wf0sFIl6YstyD9Rfhzwla+iquGj5wfneQXCtX58yyQ37HojECmWUP9ACsdjnqR8Mq
	+UlOPtXwkSGY/D34D9rVf5VjehHG103lyxBjrrYJ7A5oRJ5og9Zmzu4ArcNSP0JtZ/nCUWYBY6AYv
	YJsG0N5Ggp1FZ1elr1VrpLl4AWGrCr39Rsq9+XZX4UhOxmGzQZz0GJw6S5/QyPVq6d8lfouW5pGgK
	O0B3gXLKtzRvE9DbLr1xoAz4fU6qdbzV7IOJkJCDkG5Bi2Hlkc5bBQ3g5WqXf8D/RyofugQS1YfNV
	7ufOUdlw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pwyrq-007t7j-0x;
	Thu, 11 May 2023 05:29:30 +0000
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pwyrn-007t76-1H;
	Thu, 11 May 2023 05:29:28 +0000
Received: by mail-ej1-x62a.google.com with SMTP id a640c23a62f3a-965ddb2093bso1138340766b.2;
        Wed, 10 May 2023 22:29:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683782965; x=1686374965;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=y4x62um4Cta2MQq5bfpbv18O8tiAYzIjxL+XVu9krq4=;
        b=BqiVoaul5DML2AqPp+E7WU7ceWXoBHlpyTtNNIMKY0tZejHwgMHdmHVlp18lYeBX51
         KBZe5HxHrPy9UKGdt4UWv+n2tne9YlLrDJ5C6p95YeUtbLvugYgkp40MY+0s+JDC3wE/
         OvdwXJXCdPW9gwlBDIZ3TVVT8uCjLFaNLCzTtloaMWliMO9hACDK++fZU3+5zpVlfjwm
         QjZJtM3YPmpfMooM/Vu0VGelf9K6FaGDUvH/FFLodarhpj2TnnapceAplCOv0F2SpmE5
         GPz2i+zVGpP1mX4JJkZCQb2cFA0G22BhmFrbYijzyxVy9IOnoR7kQxHYrmJBo1z6pLEq
         QYqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683782965; x=1686374965;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=y4x62um4Cta2MQq5bfpbv18O8tiAYzIjxL+XVu9krq4=;
        b=HQsGoTtliMjkeZMtOPyMWvZZsphmWrNInhNI/fdKvaV8PEK/nZQNDVtnZJ3G03joRe
         d6UlNCK1z1UcP7ZpVMXNpHpgPCHrony4EK4nhXkbAFz6xMjspGZDX3UFkJeZpnvrbQ1y
         HXZFP2fqGawGVwSrE37/0ocYq1vIGaQYhvzzfMjVOQ9Q7tm9Ppfa9eNmhRICbCM64rlz
         HyAUH5pFbetn142vitXnFe+YrJniK3oGGqIwU9RquLt8hNtD3W5BQVl1dNPWkaljfh4P
         baACoiby0vDhwLtVBYyThSR9HXXmrtV7NcyvO0pa8m9oyqpxuVnf+bY8ggiZEaUXGXv1
         Rmqw==
X-Gm-Message-State: AC+VfDxwp3W+oH9EOL3kpdAMnMpoEHK66Sd7hkHs5ZZLRiCufAaQsdCI
	XZXus3fhhr28GrpUlDm643I=
X-Google-Smtp-Source: ACHHUZ7vvF+qW3TK0cuJqLdLw9Uk4jrATGpY2Ush2Z+Cvi9O0kUzQSGq/YHYtzqKPLGW6ubNDQbOlA==
X-Received: by 2002:a17:907:2684:b0:94e:75f8:668 with SMTP id bn4-20020a170907268400b0094e75f80668mr16593122ejc.56.1683782964468;
        Wed, 10 May 2023 22:29:24 -0700 (PDT)
Received: from ?IPV6:2a01:c23:c58e:b900:6079:61ec:4537:dead? (dynamic-2a01-0c23-c58e-b900-6079-61ec-4537-dead.c23.pool.telefonica.de. [2a01:c23:c58e:b900:6079:61ec:4537:dead])
        by smtp.googlemail.com with ESMTPSA id 13-20020a170906328d00b00969f44bbef1sm2875122ejw.89.2023.05.10.22.29.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 May 2023 22:29:24 -0700 (PDT)
Message-ID: <018df89a-c3d2-1bda-9966-7f06b24f87f2@gmail.com>
Date: Thu, 11 May 2023 07:29:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH net-next 0/8] Improvements for RealTek 2.5G Ethernet PHYs
To: Daniel Golle <daniel@makrotopia.org>, netdev@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Andrew Lunn <andrew@lunn.ch>,
 Russell King <linux@armlinux.org.uk>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
References: <cover.1683756691.git.daniel@makrotopia.org>
Content-Language: en-US
From: Heiner Kallweit <hkallweit1@gmail.com>
In-Reply-To: <cover.1683756691.git.daniel@makrotopia.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230510_222927_440610_CE96671D 
X-CRM114-Status: GOOD (  19.92  )
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

On 11.05.2023 00:53, Daniel Golle wrote:
> Improve support for RealTek 2.5G Ethernet PHYs (RTL822x series).
> The PHYs can operate with Clause-22 and Clause-45 MDIO.
> 
> When using Clause-45 it is desireable to avoid rate-adapter mode and
> rather have the MAC interface mode follow the PHY speed. The PHYs
> support 2500Base-X for 2500M, and Cisco SGMII for 1000M/100M/10M.
> 
> Also prepare support for proprietary RealTek HiSGMII mode which will
> be needed for situations when used with RealTek switch or router SoCs
> such as RTL839x or RTL93xx.
> 
> Add support for Link Down Power Saving Mode (ALDPS) which is already
> supported for older RTL821x series 1GbE PHYs.
> 
> Make sure that link-partner advertised modes are only used if the
> advertisement can be considered valid. Otherwise we are seeing
> false-positives warning about downscaling eventhough higher speeds
> are not actually advertised by the link partner.
> 
> While at it, use helper function for paged operation and make sure
> to use use locking for that as well.
> 
> Changes since RFC:
>  * Turns out paged read used to identify the PHY needs to be hardcoded
>    for the simple reason that the function pointers for paged operations
>    have not yet been populated at this point. Hence keep open-coding it,
>    but use helper function and make sure it happening while the MDIO bus
>    mutex is locked.
> 
> Alexander Couzens (1):
>   net: phy: realtek: rtl8221: allow to configure SERDES mode
> 
> Chukun Pan (1):
>   net: phy: realtek: switch interface mode for RTL822x series
> 
> Daniel Golle (6):
>   net: phy: realtek: use genphy_soft_reset for 2.5G PHYs
>   net: phy: realtek: disable SGMII in-band AN for 2.5G PHYs
>   net: phy: realtek: make sure paged read is protected by mutex
>   net: phy: realtek: use inline functions for 10GbE advertisement
>   net: phy: realtek: check validity of 10GbE link-partner advertisement
>   net: phy: realtek: setup ALDPS on RTL8221B
> 
>  drivers/net/phy/realtek.c | 161 ++++++++++++++++++++++++++++++++------
>  1 file changed, 138 insertions(+), 23 deletions(-)
> 

Has this series been tested with RTL8125A/B to ensure that the internal
PHY use case still works?


