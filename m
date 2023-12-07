Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40D11C4167B
	for <linux-mediatek@archiver.kernel.org>; Thu,  7 Dec 2023 18:19:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=c9T9Dhk1u4UBA5bWyuf5C2EepRsZ1GhJrZKYEms2QYA=; b=4ywsoUBd4uM5u8onHxczcXAVwq
	d8kp+tZglkZ+YxdQpWpnEjGdXLyMUcBDNUSed2g6bRetEs0GLBxWUsFIJS5dip4X2co7QAJUOgz0C
	RlFbXw05u4YK1ODCYE8S6c5esr8n8JqTMvBpCqylLhx7v5hk3ih+Sro642IytYPVwEvCTKXagsz+5
	rqaop6SDeNd6Uzhbji92x79J7Gvz/dXSb6Qxzny4m58USMdnAcHZNZ3/Vn2SJPp8RdoTJm6PD7I+a
	mp0RYoZYG2YhycwRlfLceuc5ZrIacY44iVpJDNGz1sQIBsSVQPLlkYHP0PZCwD6n5NvOff8sioDDx
	0p3dwolw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rBIxn-00Dd8Q-33;
	Thu, 07 Dec 2023 18:19:07 +0000
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rBIxk-00Dd7t-3D;
	Thu, 07 Dec 2023 18:19:06 +0000
Received: by mail-ed1-x52f.google.com with SMTP id 4fb4d7f45d1cf-54d0ae6cf20so1911168a12.0;
        Thu, 07 Dec 2023 10:19:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701973142; x=1702577942; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=c9T9Dhk1u4UBA5bWyuf5C2EepRsZ1GhJrZKYEms2QYA=;
        b=CY/eu8cJ1S5L7Qshfyd1HZtcCz//5uKmVOdcyRahBNclYqUQoICwPYMsa5iJ0vPNxg
         lvIObxY6qv9+zErO/ncf+K2ATlviqNuhWkczlqfVHqDhYKt//BBZ5dYRTYORf28KQ+tX
         Fge0UouDgJ28uPuSZri40Gm8qfV/27AXEKNrSvU0IxLOReBsgfDWv5IjwgiORDAoSLNk
         oheNdNd52pO4zVnWKL+Ktjt+RThFNJXz55P3lRAl/bSoPAvh/TMPbadhHB3xlxMXvlwE
         Py+q5YCTAcjixjrcuvVMy8IvrjdI1FZ2dChSiDgSeQoDvwOx6nuwiqQbM1An2E0uYFuO
         XJIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701973142; x=1702577942;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=c9T9Dhk1u4UBA5bWyuf5C2EepRsZ1GhJrZKYEms2QYA=;
        b=dxL5HyEChJc20SNHfaOs7pRI5xOAZg8HwUxfKZUKbxW6I7gN7ogu12IzijcmdkiiO5
         2A4VkapVemYlzCNZZprA69CX4BV+mht3c8HJ7jqv76cTdiWoqtnkf4szO1ibpk68yA86
         8brYz6wy8B8rCqNpaG+aD86D46o2x2bDJE+mHKJ2u8Di3+4vyY0pks/mzmfbFrrP85HF
         iKy8p1RA93FZSjeqdblKzVFxG0IuRWuG1xoCb5r6FrW+qI75fwYpYXmZAkxmKU0V+gIY
         EGur4zl1rbExG0JjprCFN+qbYh4G0c+EIeADVyeCOhMVRwAR61rj+2rTn6Ls4jQ92rcX
         PKNw==
X-Gm-Message-State: AOJu0YyWSFEZsSKf71MsZWQiUnGwXQMMlOcvYh9FcXb+iTqyRgm3AhCy
	uQMo0QnbxuIUv65okjzmlIg=
X-Google-Smtp-Source: AGHT+IHhlsosLWTuwyhAeqO++aHUvDn0g4qZutyh2cC8TSPxd5604m2eGpGCPcSESnypX9SXpSmSgg==
X-Received: by 2002:a17:906:43:b0:a19:39d1:f958 with SMTP id 3-20020a170906004300b00a1939d1f958mr1762530ejg.41.1701973141888;
        Thu, 07 Dec 2023 10:19:01 -0800 (PST)
Received: from skbuf ([188.27.185.68])
        by smtp.gmail.com with ESMTPSA id ll9-20020a170907190900b00a1cbb289a7csm45995ejc.183.2023.12.07.10.19.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Dec 2023 10:19:01 -0800 (PST)
Date: Thu, 7 Dec 2023 20:18:58 +0200
From: Vladimir Oltean <olteanv@gmail.com>
To: =?utf-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>
Subject: Re: [PATCH net-next 06/15] net: dsa: mt7530: do not set
 priv->p5_interface on mt7530_setup_port5()
Message-ID: <20231207181858.ojbgt5pwyqq3tzjk@skbuf>
References: <20231118123205.266819-1-arinc.unal@arinc9.com>
 <20231118123205.266819-7-arinc.unal@arinc9.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20231118123205.266819-7-arinc.unal@arinc9.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231207_101905_041716_BF6A4752 
X-CRM114-Status: GOOD (  20.24  )
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
Cc: Andrew Lunn <andrew@lunn.ch>, Landen Chao <Landen.Chao@mediatek.com>, Florian Fainelli <f.fainelli@gmail.com>, erkin.bozoglu@xeront.com, netdev@vger.kernel.org, Sean Wang <sean.wang@mediatek.com>, Daniel Golle <daniel@makrotopia.org>, Russell King <linux@armlinux.org.uk>, DENG Qingfang <dqfext@gmail.com>, Eric Dumazet <edumazet@google.com>, linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, Bartel Eerdekens <bartel.eerdekens@constell8.be>, Matthias Brugger <matthias.bgg@gmail.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, mithat.guner@xeront.com, "David S. Miller" <davem@davemloft.net>, linux-kernel@vger.kernel.org, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Sat, Nov 18, 2023 at 03:31:56PM +0300, Arınç ÜNAL wrote:
> Do not set priv->p5_interface on mt7530_setup_port5(). There isn't a case
> where mt753x_phylink_mac_config() runs after mt7530_setup_port5() which
> setting priv->p5_interface would prevent mt7530_setup_port5() from running
> more than once.
> 
> Signed-off-by: Arınç ÜNAL <arinc.unal@arinc9.com>
> ---
>  drivers/net/dsa/mt7530.c | 2 --
>  1 file changed, 2 deletions(-)
> 
> diff --git a/drivers/net/dsa/mt7530.c b/drivers/net/dsa/mt7530.c
> index 069b3dfca6fa..fc87ec817672 100644
> --- a/drivers/net/dsa/mt7530.c
> +++ b/drivers/net/dsa/mt7530.c
> @@ -978,8 +978,6 @@ static void mt7530_setup_port5(struct dsa_switch *ds, phy_interface_t interface)
>  	dev_dbg(ds->dev, "Setup P5, HWTRAP=0x%x, intf_sel=%s, phy-mode=%s\n",
>  		val, p5_intf_modes(priv->p5_intf_sel), phy_modes(interface));
>  
> -	priv->p5_interface = interface;
> -
>  unlock_exit:
>  	mutex_unlock(&priv->reg_mutex);
>  }
> -- 
> 2.40.1
> 

Purely as a matter of theory, mt753x_phylink_mac_config() itself could
be called more than once, at any time there is a phylink_major_config() -
first during initial one, then upon any change of the phy_interface_t.
With the port being fixed and internal, maybe that is unlikely.

Destroying and re-creating the phylink instance could also make the
driver see more than 1 mt753x_phylink_mac_config() call. During periods
of -EPROBE_DEFER, maybe this could even happen.

I think what we need to see is a description of what the priv->p5_interface
test is really protecting against, because it certainly is uncommon in other
drivers to have this much logic to avoid mt753x_mac_config() being
called twice.

If there's nothing wrong with calling it twice and it's just an optimization,
I think that's enough of a justification for removing that extra protection.
At the same time, the optimization (and simplification) that we should
pursue is that we should remove the overlap between phylink and the
initial port setup made by the driver.

