Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCB4CC76195
	for <linux-mediatek@archiver.kernel.org>; Mon, 27 Mar 2023 19:13:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HYVINSPcX570meD+tbiju4gbaHHy2aZVdws7rdRLV/U=; b=b/pr4bKtnsXlzc9gYcPaNN/kZy
	ybWdUvin5pJpESfe6eohLJ9uTnoaZ3m97OeUy4s/PfrmABvCXlc13HLp6rO6xiACjyzUbF709vUwJ
	36sBGi6uMRrBw9ud73Sac7q7BXHh7MClT3BfOkK4HJrvPLv9PZSEJfXpmm3qSHc9Cit0T4s/9JmyT
	ZnzEP/t+96zhUtdPPcuSgwZpvlen44JeNK7M1oQpq4YpAPTfmQEvDKgLdSpYHTY57Gyix2biSiAdb
	WQNgu19cEDOqc39Jy1+i0KaT+RA+OvT8QhvR3GGlvWsOnzmT5eKtU9Bg0wTHBR7vUp1Ns4UaRdIZX
	xwzgMDVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pgsH0-00CAjs-1k;
	Mon, 27 Mar 2023 19:12:54 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pgsGx-00CAho-0K;
	Mon, 27 Mar 2023 19:12:52 +0000
Received: by mail-wr1-x42e.google.com with SMTP id m2so9873865wrh.6;
        Mon, 27 Mar 2023 12:12:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679944365;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=HYVINSPcX570meD+tbiju4gbaHHy2aZVdws7rdRLV/U=;
        b=KK68TZUyb+HjYZ0CT1XzfVmxm49E3yfbXe3orrjtJTlDrkwsoLOl0N/qqEXfKQdiug
         9ObLgEKV80TmHgjR3TkTRtmyu0L2wdEYHfTCPt3ppDJDlmPpWI2zoArUty3g6GYcCcaA
         ve+hm8dWOolIdC/kqciF2FqMVRnImO1jO7UMqw3epBVc9vSJQncDg25FDtX3EokW8Ybs
         zYIpH3hyjBPw6L+lLPp7VZ55p9QsX910cv+BSoDT/Sn7ZpG3O7mCZ5iUoeZIHNTQDwnV
         gFwLhQp6tVnPpsCP1wPUznIJz+EyX5Qs6Iq/jYI/c1nRBxU8B6AZ4Z4Ph7CJt5mCu0r5
         uRiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679944365;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HYVINSPcX570meD+tbiju4gbaHHy2aZVdws7rdRLV/U=;
        b=hpYgpN9i9G8cXGLkQ5eiFMdiRiuwXzoM4YuA5OCClYSmxq439Lw093yFPW1BfS7B4R
         qAPibpJk5IQOkYS3vXbkcxu9E2WyWc8yqnIbKfaaqP90Rnp/A6WQo88rIQBxy/Q2Ae/w
         9rSnawxrF/jhzOqKbOj2TSji4SJZknqhC97WV4eNGFMwbUmATTZV3uJsMu3RZ7PMkJvy
         e+4u/6ciRVdhs5hGH6u8tn3bc9hF3jzouFAbB4zoddjzql5AqZ7BUfhYWIKSXWWCXqCE
         iUZHEzgLPKUV/93cIgxFlJhe4iMVgI6IRdVilagLCcW1dv7Cn1sb8N0J8aLPHT6IQ4yB
         FZng==
X-Gm-Message-State: AAQBX9fkk23fExnG9i8GDojYq2nNCZEDr1Lc0gq3sM6JRuNOcTsUhqVd
	T0fZayaec23GEnsVDKIIE+w=
X-Google-Smtp-Source: AKy350Y47ZUzytcAg65n77+zDkosW+9AMGn5S4UlJ/7NcuCee8SP+Hdo0fbynRibnYV+tUN/IEK8bw==
X-Received: by 2002:a5d:526a:0:b0:2d0:58f9:a6a with SMTP id l10-20020a5d526a000000b002d058f90a6amr10553468wrc.57.1679944365660;
        Mon, 27 Mar 2023 12:12:45 -0700 (PDT)
Received: from skbuf ([188.27.184.189])
        by smtp.gmail.com with ESMTPSA id f6-20020a05600c154600b003ef7058ea02sm3295888wmg.29.2023.03.27.12.12.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Mar 2023 12:12:45 -0700 (PDT)
Date: Mon, 27 Mar 2023 22:12:42 +0300
From: Vladimir Oltean <olteanv@gmail.com>
To: arinc9.unal@gmail.com
Subject: Re: [PATCH net 4/7] net: dsa: mt7530: set both CPU port interfaces
 to PHY_INTERFACE_MODE_NA
Message-ID: <20230327191242.4qabzrn3vtx3l2a7@skbuf>
References: <20230326140818.246575-1-arinc.unal@arinc9.com>
 <20230326140818.246575-5-arinc.unal@arinc9.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230326140818.246575-5-arinc.unal@arinc9.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230327_121251_177872_3352D2DE 
X-CRM114-Status: GOOD (  26.01  )
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
Cc: Andrew Lunn <andrew@lunn.ch>, Ilya Lipnitskiy <ilya.lipnitskiy@gmail.com>, =?utf-8?B?UmVuw6k=?= van Dorst <opensource@vdorst.com>, Eric Dumazet <edumazet@google.com>, erkin.bozoglu@xeront.com, Florian Fainelli <f.fainelli@gmail.com>, Russell King <linux@armlinux.org.uk>, Richard van Schagen <richard@routerhints.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Landen Chao <Landen.Chao@mediatek.com>, Richard van Schagen <vschagen@cs.com>, Sean Wang <sean.wang@mediatek.com>, DENG Qingfang <dqfext@gmail.com>, Russell King <rmk+kernel@armlinux.org.uk>, linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>, linux-arm-kernel@lists.infradead.org, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, =?utf-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, "David S. Miller" <davem@davemloft.net>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Sun, Mar 26, 2023 at 05:08:15PM +0300, arinc9.unal@gmail.com wrote:
> From: Arınç ÜNAL <arinc.unal@arinc9.com>
> 
> Set interfaces of both CPU ports to PHY_INTERFACE_MODE_NA. Either phylink
> or mt7530_setup_port5() on mt7530_setup() will handle the rest.
> 
> This is already being done for port 6, do it for port 5 as well.
> 
> Fixes: 38f790a80560 ("net: dsa: mt7530: Add support for port 5")

This is getting comical.. I think I'm putting too much energy in
trying to understand the hidden meaning of this patch set.

In include/linux/phy.h we have:

typedef enum {
	PHY_INTERFACE_MODE_NA,

In lack of other initializer, the first element of an enum gets the
value 0 in C.

Then, "priv" is allocated by this driver with devm_kzalloc(), which
means that its entire memory is zero-filled. So priv->p5_interface and
priv->p6_interface are already set to 0, or PHY_INTERFACE_MODE_NA.

There is no code path between the devm_kzalloc() and the position in
mt7530_setup() that would change the value of priv->p5_interface or
priv->p6_interface from their value of 0 (PHY_INTERFACE_MODE_NA).
For example, mt753x_phylink_mac_config() can only be called from
phylink, after dsa_port_phylink_create() was called. But
dsa_port_phylink_create() comes later than ds->ops->setup() - one comes
from dsa_tree_setup_ports(), and the other from dsa_tree_setup_switches().

The movement of the priv->p6_interface assignment with a few lines
earlier does not change anything relative to the other call sites which
assign different values to priv->p6_interface, so there isn't any
functional change there, either.

So this patch is putting 0 into a variable containing 0, and claiming,
through the presence of the Fixes: tag and the submission to the "net"
tree, that it is a bug fix which should be backported to "stable".

Can it be that you are abusing the meaning of a "bug fix", and that I'm
trying too hard to take this patch set seriously?

> Tested-by: Arınç ÜNAL <arinc.unal@arinc9.com>
> Signed-off-by: Arınç ÜNAL <arinc.unal@arinc9.com>
> ---
>  drivers/net/dsa/mt7530.c | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/net/dsa/mt7530.c b/drivers/net/dsa/mt7530.c
> index 6d33c1050458..3deebdcfeedf 100644
> --- a/drivers/net/dsa/mt7530.c
> +++ b/drivers/net/dsa/mt7530.c
> @@ -2203,14 +2203,18 @@ mt7530_setup(struct dsa_switch *ds)
>  		mt7530_rmw(priv, MT7530_TRGMII_RD(i),
>  			   RD_TAP_MASK, RD_TAP(16));
>  
> +	/* Let phylink decide the interface later. If port 5 is used for phy
> +	 * muxing, its interface will be handled without involving phylink.
> +	 */
> +	priv->p5_interface = PHY_INTERFACE_MODE_NA;
> +	priv->p6_interface = PHY_INTERFACE_MODE_NA;
> +
>  	/* Enable port 6 */
>  	val = mt7530_read(priv, MT7530_MHWTRAP);
>  	val &= ~MHWTRAP_P6_DIS & ~MHWTRAP_PHY_ACCESS;
>  	val |= MHWTRAP_MANUAL;
>  	mt7530_write(priv, MT7530_MHWTRAP, val);
>  
> -	priv->p6_interface = PHY_INTERFACE_MODE_NA;
> -
>  	/* Enable and reset MIB counters */
>  	mt7530_mib_reset(ds);
>  
> -- 
> 2.37.2
> 

