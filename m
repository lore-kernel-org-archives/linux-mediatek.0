Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3D33C4345F
	for <linux-mediatek@archiver.kernel.org>; Sun, 14 Apr 2024 08:18:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BfwBj4vjnnl0637/puHgd5sch6iAATiC8ktUrfFMQW0=; b=mtfnFVjCRZTMBKn0dUTdGd57vt
	5YmPBKHlWEY+MeU776E4aJH4KQJ1Yj7ej848cvoQbc6/8Z8hCXss3C4LCdDx8qPd5A1TOjoffCPLU
	GsMNfXs5zp/tW6FSkysC6iUysOnWQzCzYR4a37ijiGj1VhjoGPytLt+ri55yv0g3iuM+QQNp9HCPd
	7Ip17Ad/yR3IOfqh9ow6SN/pKipB9fpnrmGwpsGaeo0obdYMKFQFZBGnCxZRwEHX8MPz1inn+m1t9
	SQPWv42yiCSqRKC7ek+WTNluWA1mSfXsZmTnEjcf5SoF8nnanvJCPYbkl2HkSAV7KkztzEBpCiGox
	Edejvjkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rvv45-00000004zwY-0RdA;
	Sun, 14 Apr 2024 08:18:17 +0000
Received: from relay4-d.mail.gandi.net ([217.70.183.196])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rvv40-00000004zuz-31Vc;
	Sun, 14 Apr 2024 08:18:14 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id F2402E0002;
	Sun, 14 Apr 2024 08:18:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arinc9.com; s=gm1;
	t=1713082686;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=BfwBj4vjnnl0637/puHgd5sch6iAATiC8ktUrfFMQW0=;
	b=GW+EhPMwCld/Lg8sXJgylZKh/8bNa61mqz3fV32It1OjNzlMzH+1ePtSWPCOoc8aDDDktC
	2wMV5aFTlvpGX4M1CJRVqN0CHQ7kRT9kvdxkayIQzP+Q7ANptYf/IgGSHlvuDKB3SfH4vG
	3JKnl+/s1t7emgiuviNuIQ3gR+1eQiuyZivtsgMmhitODgXclIp5NrN0zgbuHlF3Rc0yjG
	4h1FJZhsa4/1ZAjhotlm4hsmmeJ2wFzDv6bXD4laysb7YtNlkEc664XznZ/NedoIUk/5n9
	9uIV2ZAg/3BCFBYg8GANKB4qen0CY4FM3LrhNZNyACpBR/gkzrWHItFQPJqHRQ==
Message-ID: <4ba57ce2-bd8a-43e8-93b4-155499d59db8@arinc9.com>
Date: Sun, 14 Apr 2024 11:17:52 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v2 1/2] net: dsa: mt7530-mdio: read PHY address
 of switch from device tree
To: Daniel Golle <daniel@makrotopia.org>, DENG Qingfang <dqfext@gmail.com>,
 Sean Wang <sean.wang@mediatek.com>, Andrew Lunn <andrew@lunn.ch>,
 Florian Fainelli <f.fainelli@gmail.com>, Vladimir Oltean
 <olteanv@gmail.com>, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: Bartel Eerdekens <bartel.eerdekens@constell8.be>,
 mithat.guner@xeront.com, erkin.bozoglu@xeront.com, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
References: <20240414-b4-for-netnext-mt7530-phy-addr-from-dt-and-simplify-core-ops-v2-0-1a7649c4d3b6@arinc9.com>
 <20240414-b4-for-netnext-mt7530-phy-addr-from-dt-and-simplify-core-ops-v2-1-1a7649c4d3b6@arinc9.com>
Content-Language: en-US
From: =?UTF-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>
In-Reply-To: <20240414-b4-for-netnext-mt7530-phy-addr-from-dt-and-simplify-core-ops-v2-1-1a7649c4d3b6@arinc9.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-GND-Sasl: arinc.unal@arinc9.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240414_011813_222221_189DC5A4 
X-CRM114-Status: GOOD (  17.35  )
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

On 14.04.2024 09:07, Arınç ÜNAL via B4 Relay wrote:
> From: Arınç ÜNAL <arinc.unal@arinc9.com>
> 
> Read the PHY address the switch listens on from the reg property of the
> switch node on the device tree. This change brings support for MT7530
> switches on boards with such bootstrapping configuration where the switch
> listens on a different PHY address than the hardcoded PHY address on the
> driver, 31.
> 
> As described on the "MT7621 Programming Guide v0.4" document, the MT7530
> switch and its PHYs can be configured to listen on the range of 7-12,
> 15-20, 23-28, and 31 and 0-4 PHY addresses.
> 
> There are operations where the switch PHY registers are used. For the PHY
> address of the control PHY, transform the MT753X_CTRL_PHY_ADDR constant
> into a macro and use it. The PHY address for the control PHY is 0 when the
> switch listens on 31. In any other case, it is one greater than the PHY
> address the switch listens on.
> 
> Reviewed-by: Daniel Golle <daniel@makrotopia.org>
> Tested-by: Daniel Golle <daniel@makrotopia.org>
> Signed-off-by: Arınç ÜNAL <arinc.unal@arinc9.com>
> ---
>   drivers/net/dsa/mt7530-mdio.c | 28 ++++++++++++++--------------
>   drivers/net/dsa/mt7530.c      | 35 ++++++++++++++++++++++-------------
>   drivers/net/dsa/mt7530.h      |  4 +++-
>   3 files changed, 39 insertions(+), 28 deletions(-)
> 
> diff --git a/drivers/net/dsa/mt7530.h b/drivers/net/dsa/mt7530.h
> index 585db03c0548..dc48715f6534 100644
> --- a/drivers/net/dsa/mt7530.h
> +++ b/drivers/net/dsa/mt7530.h
> @@ -625,7 +625,7 @@ enum mt7531_clk_skew {
>   #define  MT7531_PHY_PLL_OFF		BIT(5)
>   #define  MT7531_PHY_PLL_BYPASS_MODE	BIT(4)
>   
> -#define MT753X_CTRL_PHY_ADDR		0
> +#define MT753X_CTRL_PHY_ADDR(phy_addr)	(phy_addr + 1 & 0x1f)

Whilst compiling, GCC suggests parentheses around ‘+’ in operand of ‘&’. I
will send another version in the upcoming days.

Arınç

