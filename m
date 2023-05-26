Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8110C77B73
	for <linux-mediatek@archiver.kernel.org>; Fri, 26 May 2023 13:20:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=l4MwRu+xy8iMy6y78CZiipQFPUpQ1fQNAnvOg9FBsTE=; b=rsyeMdstGzDFSNxkBLwP4UJr0N
	9xOEU9iVM/zIfM/9ag7u4TP0WNFEb4cruk/IVCOSLi/8hiag0eGsG2JSG1SrckXrGmMFpW7ljaec+
	7524FHdn7j8x2o7IBV/09kiGozCwG/stDuurCksxIH9lkDh/jllBaEudLc9tPm8Prrh2ZKubR2d2F
	qNK4rNHGn7TkUAbEbayTzFgQYBDXiQKDbE3byM1OAFOTSQLkdqVe8guOSdcZeEwuSyACNi0QkDu/f
	lCHPeBnJ9iQvOFzXQfK5kZPRiWua/16oXdcZjVym8MisaClcWD5dv5H2x6XBGcvUw+uAYhuHIMUa2
	Ev/PJTYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q2XMm-002cVA-1F;
	Fri, 26 May 2023 13:20:24 +0000
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q2XMj-002cTP-0D;
	Fri, 26 May 2023 13:20:22 +0000
Received: by mail-ed1-x532.google.com with SMTP id 4fb4d7f45d1cf-51144dddd4cso1027398a12.1;
        Fri, 26 May 2023 06:20:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685107217; x=1687699217;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=l4MwRu+xy8iMy6y78CZiipQFPUpQ1fQNAnvOg9FBsTE=;
        b=UEnJDMMAincGgk9uz3J9XzyuqVh8gU13UloLZk3DxqUfW1KsU/FwQHcKxVyVRQ/Hbt
         tSARZdD1vS8OdcvVZCJSFqkEKRjnQXvhQzQtQ/28Cfg59fycBD5hiXzDaW60T6B9Ft2B
         LG9uXrZbY7hX2He4PPhG6ZZbp1Q4QSTANq07Z4rtaTD1sF4OpjzbV0jbxrVdbWapt0GS
         mvnogCeNVXwDbi131yWn83mEBKMyT9cPOr/y5cpGvOkasiN0bR7XClreHg571Ca//Zan
         uebECgk+XYT7kMPf62Qt8115z5Aadfn8rTe+7/f+ul1D9GyhAWw0ju+lNcXQ7ao9ca4s
         Wz8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685107217; x=1687699217;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=l4MwRu+xy8iMy6y78CZiipQFPUpQ1fQNAnvOg9FBsTE=;
        b=a0HSmbJ5f+vTy621m61MB3yUCt7FmwdLgu535kI/wdbKAD98EqMFNDPuEnx6y1IwNn
         4pzXChW4PFYJicUPFiUKvLiuTa3WHpMRW2l4UN+nci7TCcdqAQrw549hlMY/i/RKPfq/
         XAMl/I0yO7zMOts/karwBQ+Tp0IzwY0pmYHQvVdr71k8vGbYnApQC1+ag8gDHIoZm1KM
         dWClpQVBclpAe40b0QkUP9fwaWP7k7ADugXmKoR00FGL+bfy4YjBgQmeI4xdWpcK4MpX
         Xqm3M4uCInQc1GES5Pt9wvzcl3dB9a7eBLB3AqzENtD1p/geIZFuW33h4QNMj6EH/e7c
         Bcbg==
X-Gm-Message-State: AC+VfDzgj/RLoRWADvzMoVSMUy7cSZz9nvv6+cjJUtnb85SwVMd3jAAu
	pXN5GQO3IPm9fh0K1EpYw2Q=
X-Google-Smtp-Source: ACHHUZ4ROYCRJ1eZ8pma/X20Mq4HcGhSL3Yh2wdZG+2/MlFdobcoKgHf+aai+j3QiY1AiU0L7R2RCg==
X-Received: by 2002:a17:907:6d1b:b0:96a:f688:db6e with SMTP id sa27-20020a1709076d1b00b0096af688db6emr2058486ejc.74.1685107216953;
        Fri, 26 May 2023 06:20:16 -0700 (PDT)
Received: from skbuf ([188.27.184.189])
        by smtp.gmail.com with ESMTPSA id lk15-20020a170906cb0f00b0096f5781205fsm2106665ejb.165.2023.05.26.06.20.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 May 2023 06:20:16 -0700 (PDT)
Date: Fri, 26 May 2023 16:20:13 +0300
From: Vladimir Oltean <olteanv@gmail.com>
To: arinc9.unal@gmail.com
Subject: Re: [PATCH net-next 17/30] net: dsa: mt7530: fix port capabilities
 for MT7988
Message-ID: <20230526132013.rnc7awhqsunnepxi@skbuf>
References: <20230522121532.86610-1-arinc.unal@arinc9.com>
 <20230522121532.86610-18-arinc.unal@arinc9.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230522121532.86610-18-arinc.unal@arinc9.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230526_062021_124668_97F2B58D 
X-CRM114-Status: GOOD (  22.09  )
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
Cc: Andrew Lunn <andrew@lunn.ch>, linux-kernel@vger.kernel.org, Eric Dumazet <edumazet@google.com>, mithat.guner@xeront.com, Florian Fainelli <f.fainelli@gmail.com>, erkin.bozoglu@xeront.com, Russell King <linux@armlinux.org.uk>, Richard van Schagen <richard@routerhints.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Landen Chao <Landen.Chao@mediatek.com>, Richard van Schagen <vschagen@cs.com>, Sean Wang <sean.wang@mediatek.com>, DENG Qingfang <dqfext@gmail.com>, linux-mediatek@lists.infradead.org, Bartel Eerdekens <bartel.eerdekens@constell8.be>, Matthias Brugger <matthias.bgg@gmail.com>, linux-arm-kernel@lists.infradead.org, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, =?utf-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>, netdev@vger.kernel.org, Daniel Golle <daniel@makrotopia.org>, "David S. Miller" <davem@davemloft.net>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Mon, May 22, 2023 at 03:15:19PM +0300, arinc9.unal@gmail.com wrote:
> From: Arınç ÜNAL <arinc.unal@arinc9.com>
> 
> On the switch on the MT7988 SoC, there are only 4 PHYs. That's port 0 to 3.
> Set the internal phy cases to '0 ... 3'.
> 
> There's no need to clear the config->supported_interfaces bitmap before
> reporting the supported interfaces as all bits in the bitmap will already
> be initialized to zero when the phylink_config structure is allocated.
> There's no code that would change the bitmap beforehand. Remove it.
> 
> Fixes: 110c18bfed41 ("net: dsa: mt7530: introduce driver for MT7988 built-in switch")
> Signed-off-by: Arınç ÜNAL <arinc.unal@arinc9.com>
> Acked-by: Daniel Golle <daniel@makrotopia.org>
> ---

Either there is a user visible bug and in that case the patch needs to
go to the 'net' tree, or you need to drop the 'Fixes' tag.

Also, 2 separate logical changes => 2 patches please. Thanks.

>  drivers/net/dsa/mt7530.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
> 
> diff --git a/drivers/net/dsa/mt7530.c b/drivers/net/dsa/mt7530.c
> index 514e82299537..f017cc028183 100644
> --- a/drivers/net/dsa/mt7530.c
> +++ b/drivers/net/dsa/mt7530.c
> @@ -2533,10 +2533,8 @@ static void mt7531_mac_port_get_caps(struct dsa_switch *ds, int port,
>  static void mt7988_mac_port_get_caps(struct dsa_switch *ds, int port,
>  				     struct phylink_config *config)
>  {
> -	phy_interface_zero(config->supported_interfaces);
> -
>  	switch (port) {
> -	case 0 ... 4: /* Internal phy */
> +	case 0 ... 3: /* Internal phy */
>  		__set_bit(PHY_INTERFACE_MODE_INTERNAL,
>  			  config->supported_interfaces);
>  		break;
> -- 
> 2.39.2
> 

