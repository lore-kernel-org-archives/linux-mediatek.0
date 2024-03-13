Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B408AC54E68
	for <linux-mediatek@archiver.kernel.org>; Wed, 13 Mar 2024 08:59:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KllXQ52SSC7jQLSK+2YhVf2cI0gP4JWuXEq89gqM2Wo=; b=EvCDC3xo9wT3XW9Ak+xcUr47nN
	WjT/GYyXiAed23syz5uxD/eXLNGV2hFR25r8X2IFQBhMIyhMS5IM6ZMQJm2Spo9BOAjhOiborX3LM
	h7iu/Da3wN+rO+XpGed0+oU96V+vO85EvRNsH51XQwEz4GjnG7hashZjHfpsVfP+1oJd4P9yvvHDQ
	fxlLVLAVMIGpcBFZy/rw2dxpxe/F3DhipkPSstuMtz/Zyb64eRF9UtJT5u/idwmT3roNN5vSa/r8K
	QGJ3QvmuBG6L/JURftsYaPVlNeMaxlVPhNM8AZti/GrGR1fE/LGFJA3bXUcAx148e8a5v7KH7+B9W
	BpwYKLJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rkKSm-00000009PES-0bwW;
	Wed, 13 Mar 2024 08:59:52 +0000
Received: from relay5-d.mail.gandi.net ([217.70.183.197])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rkKSh-00000009PDH-2x1c;
	Wed, 13 Mar 2024 08:59:49 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id B8E521C0002;
	Wed, 13 Mar 2024 08:59:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arinc9.com; s=gm1;
	t=1710320383;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=KllXQ52SSC7jQLSK+2YhVf2cI0gP4JWuXEq89gqM2Wo=;
	b=S4yrSkfFJw35bZjc2WGscyANqHuBgISTUw7npMyVKjH2otM+w+OInxoMSWPlQxIruG7MuT
	4FpGDS6gXSOQ08QMa9poehcXYz7/sV3mpU2PGydaq0OsY0GUByyba3K694tbm8ZGlbqWzZ
	ldAa6D6e0r+/2rofqW2kivJbPBaiXiM/x/2u1BwOh4A/g9pZ2RzQ6lyFyJBdkyInNBIHbm
	TqOODbYkaYE7XHcHaDsRLH3rwmgDgfCdyCByCAioJUJmwuZg6nYoxoayhmmNsS+a7Wr1Xc
	1a59unBX8ICRrtyRu5Huefe0UlVmPebH517fKQtenEOYiOoVexViB9hrmpfyNw==
Message-ID: <bf0ed70f-e106-4a7f-a98c-de34658feb4d@arinc9.com>
Date: Wed, 13 Mar 2024 11:59:23 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] net: dsa: mt7530: increase reset hold time
To: Justin Swartz <justin.swartz@risingedge.co.za>,
 Daniel Golle <daniel@makrotopia.org>, DENG Qingfang <dqfext@gmail.com>,
 Sean Wang <sean.wang@mediatek.com>, Andrew Lunn <andrew@lunn.ch>,
 Florian Fainelli <f.fainelli@gmail.com>, Vladimir Oltean
 <olteanv@gmail.com>, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <f594a72a91d12f1d027a06962caa9750@risingedge.co.za>
 <20240312192117.7789-1-justin.swartz@risingedge.co.za>
Content-Language: en-US
From: =?UTF-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>
In-Reply-To: <20240312192117.7789-1-justin.swartz@risingedge.co.za>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-GND-Spam-Score: 400
X-GND-Status: SPAM
X-GND-Sasl: arinc.unal@arinc9.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240313_015947_907951_191108F9 
X-CRM114-Status: GOOD (  14.85  )
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

On 12.03.2024 22:21, Justin Swartz wrote:
> Increase the MT7530 reset hold period from 1000-1100 usec
> to 5000-5100 usec.
> 
> This should reduce the likelihood of an incorrect external
> crystal frequency selection which may occur when reset is
> deasserted too early under certain link conditions.
> 
> Signed-off-by: Justin Swartz <justin.swartz@risingedge.co.za>
> ---
>   drivers/net/dsa/mt7530.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/net/dsa/mt7530.c b/drivers/net/dsa/mt7530.c
> index 3c1f65759..5e9e1381a 100644
> --- a/drivers/net/dsa/mt7530.c
> +++ b/drivers/net/dsa/mt7530.c
> @@ -2243,11 +2243,11 @@ mt7530_setup(struct dsa_switch *ds)
>   	 */
>   	if (priv->mcm) {
>   		reset_control_assert(priv->rstc);
> -		usleep_range(1000, 1100);
> +		usleep_range(5000, 5100);
>   		reset_control_deassert(priv->rstc);
>   	} else {
>   		gpiod_set_value_cansleep(priv->reset, 0);
> -		usleep_range(1000, 1100);
> +		usleep_range(5000, 5100);
>   		gpiod_set_value_cansleep(priv->reset, 1);
>   	}
>   

Again, the patch subject is missing the indication of a tree. Read the
networking subsystem (netdev) development page [1].

This ship has sailed anyway. Now the changes the first patch did must be
reverted too. I will deal with this from now on, you can stop sending
patches regarding this.

[1] https://www.kernel.org/doc/html/latest/process/maintainer-netdev.html

Arınç

