Return-Path: <SRS0=VOwE=NP=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E78AEC4320A
	for <linux-mediatek@archiver.kernel.org>; Tue, 24 Aug 2021 16:58:17 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id ABED361368
	for <linux-mediatek@archiver.kernel.org>; Tue, 24 Aug 2021 16:58:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org ABED361368
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+FYoeI8pU2hKNeW1tjYSzqggqhIi0h3uozJgecUlg24=; b=w0m1lU3IYEcC3P
	WdkUvgMILzhy0A6RIMLZXS8PJtPNZ0riRueDqZIvcVR7DOkMUfqdB/jQgDGptdTwQTqsNL9rbFf9P
	FlDrnfdw8mV4qcQMZkFXG7o7inWyE1uK/6XoD+ztdIT4SWbT4I6UHACYQVEaOVKKVELL6Mf9Wr6uc
	ov/wcfCFrwU7kcrzBZ1mjgLv12CL+hSQqEloVIiK0zxOp77aqR+YMjtnWkP8r1OoswLtTeLLQWHoT
	cnaIrz78xsih1FV9zVeN8t7LLDB76OyG6h4c3rmbh8PElCJNFQvVwqMvOi14uH+SBjkHKgFZxdtHr
	DgKcQQIqcWnK6bZy9u4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mIZkT-0043Ud-N4; Tue, 24 Aug 2021 16:58:05 +0000
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mIZkA-0043Lj-I9; Tue, 24 Aug 2021 16:57:47 +0000
Received: by mail-ej1-x62e.google.com with SMTP id me10so17363204ejb.11;
 Tue, 24 Aug 2021 09:57:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=2CPHVf9LVvR1vrFypltnSkd8psChBds8RTv71kfke/g=;
 b=VAjjLhwy5EUDHkBFLS6IK/OURmv9p6XDFTIdDQrxNgXUrBpLHyjoRWx1AFS+Y9ZFZE
 mRbocH6GFcBOoMBfw7pBBf5/+E+jiKWVggYX8UAONU+90/q2JL6KG7NN1hm1VVp+arhk
 Gp1QFr/gXj2TMfaIL0cbP2rQdpetGkn7CRzK4TTvnG7ozydtXXZeFbqoG8PtqSTfiMhi
 OdNp4yn5RmtsHDIlJ6COOuyS95a0NexigEqGT9waGhePHJUaIlFKEZ+9pH1OtcVBUv8X
 QmM+/lk9ypH1T1kLaKyRfysicQVTli907NmoOIBhuMqo6bTgJyfSmfbaIM1wC5MrmZcW
 oFvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=2CPHVf9LVvR1vrFypltnSkd8psChBds8RTv71kfke/g=;
 b=fdWspFhzalOvvBOpV8bNQFlzdoPq8sOv39wd+5tOnt13PCQJua3gn8K2q/j9bKn1J+
 aA4nZceZV7FWhmwIq3/Ff1p6gWSWKc51ZmArGVTbVeDlC0GAM1bKumoV327jf2c0AhBK
 K9F73zmF3vFKaS1dUf9r0NWHk4zC3aylaEj6YyNOc3FBvfp/012/LihsCdpd3YNT/UJr
 /DPOiXBLS6tesL0r7BFQNa2G6gsLDmt070e61keqa7yk8o7j8uYBTqgkV9QibigG8whi
 TozqU2dJB0t+TwkdUz7WKi7gJJVA0f2oehCqg0Lq3UzB4gkqMt6wdykNu9m/OHSa3XR1
 hBOA==
X-Gm-Message-State: AOAM531e0SreNIRYIkLTJMsr1JGZvhLCfBf4bv0eGQZOy2hhRpkUf1bH
 1Z9nMyBZrYtjsDM6JuoxhUM=
X-Google-Smtp-Source: ABdhPJz35lI7gG+zU2usTviK/+6HHY2TQK8d1wdwtxQLUYeHHWpj4yZQVaxPxFC2dCOBTq1kpsr9lw==
X-Received: by 2002:a17:906:374e:: with SMTP id
 e14mr20474775ejc.161.1629824264492; 
 Tue, 24 Aug 2021 09:57:44 -0700 (PDT)
Received: from skbuf ([188.25.144.60])
 by smtp.gmail.com with ESMTPSA id c19sm6732518ejs.116.2021.08.24.09.57.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Aug 2021 09:57:44 -0700 (PDT)
Date: Tue, 24 Aug 2021 19:57:42 +0300
From: Vladimir Oltean <olteanv@gmail.com>
To: DENG Qingfang <dqfext@gmail.com>
Cc: Sean Wang <sean.wang@mediatek.com>, Landen Chao <Landen.Chao@mediatek.com>,
 Andrew Lunn <andrew@lunn.ch>, Vivien Didelot <vivien.didelot@gmail.com>,
 Florian Fainelli <f.fainelli@gmail.com>,
 "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Russell King <linux@armlinux.org.uk>,
 "open list:MEDIATEK SWITCH DRIVER" <netdev@vger.kernel.org>,
 "moderated list:ARM/Mediatek SoC support"
 <linux-arm-kernel@lists.infradead.org>, 
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH net-next] net: dsa: mt7530: manually set up VLAN ID 0
Message-ID: <20210824165742.xvkb3ke7boryfoj4@skbuf>
References: <20210824165253.1691315-1-dqfext@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210824165253.1691315-1-dqfext@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210824_095746_629081_7BA3CC67 
X-CRM114-Status: GOOD (  23.21  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Wed, Aug 25, 2021 at 12:52:52AM +0800, DENG Qingfang wrote:
> The driver was relying on dsa_slave_vlan_rx_add_vid to add VLAN ID 0. After
> the blamed commit, VLAN ID 0 won't be set up anymore, breaking software
> bridging fallback on VLAN-unaware bridges.
> 
> Manually set up VLAN ID 0 to fix this.
> 
> Fixes: 06cfb2df7eb0 ("net: dsa: don't advertise 'rx-vlan-filter' when not needed")
> Signed-off-by: DENG Qingfang <dqfext@gmail.com>
> ---

I understand that this is how you noticed the issue, but please remember
that one can always compile a kernel with CONFIG_VLAN_8021Q=n. So the
issue predates my patch by much longer. You might reconsider the Fixes:
tag in light of this, maybe the patch needs to be sent to stable.

>  drivers/net/dsa/mt7530.c | 25 +++++++++++++++++++++++++
>  drivers/net/dsa/mt7530.h |  2 ++
>  2 files changed, 27 insertions(+)
> 
> diff --git a/drivers/net/dsa/mt7530.c b/drivers/net/dsa/mt7530.c
> index d757d9dcba51..d0cba2d1cd68 100644
> --- a/drivers/net/dsa/mt7530.c
> +++ b/drivers/net/dsa/mt7530.c
> @@ -1599,6 +1599,21 @@ mt7530_hw_vlan_update(struct mt7530_priv *priv, u16 vid,
>  	mt7530_vlan_cmd(priv, MT7530_VTCR_WR_VID, vid);
>  }
>  
> +static int
> +mt7530_setup_vlan0(struct mt7530_priv *priv)
> +{
> +	u32 val;
> +
> +	/* Validate the entry with independent learning, keep the original
> +	 * ingress tag attribute.
> +	 */
> +	val = IVL_MAC | EG_CON | PORT_MEM(MT7530_ALL_MEMBERS) | FID(FID_BRIDGED) |

FID_BRIDGED?

> +	      VLAN_VALID;
> +	mt7530_write(priv, MT7530_VAWD1, val);
> +
> +	return mt7530_vlan_cmd(priv, MT7530_VTCR_WR_VID, 0);
> +}
> +
>  static int
>  mt7530_port_vlan_add(struct dsa_switch *ds, int port,
>  		     const struct switchdev_obj_port_vlan *vlan,
> @@ -2174,6 +2189,11 @@ mt7530_setup(struct dsa_switch *ds)
>  			   PVC_EG_TAG(MT7530_VLAN_EG_CONSISTENT));
>  	}
>  
> +	/* Setup VLAN ID 0 for VLAN-unaware bridges */
> +	ret = mt7530_setup_vlan0(priv);
> +	if (ret)
> +		return ret;
> +
>  	/* Setup port 5 */
>  	priv->p5_intf_sel = P5_DISABLED;
>  	interface = PHY_INTERFACE_MODE_NA;
> @@ -2346,6 +2366,11 @@ mt7531_setup(struct dsa_switch *ds)
>  			   PVC_EG_TAG(MT7530_VLAN_EG_CONSISTENT));
>  	}
>  
> +	/* Setup VLAN ID 0 for VLAN-unaware bridges */
> +	ret = mt7530_setup_vlan0(priv);
> +	if (ret)
> +		return ret;
> +
>  	ds->assisted_learning_on_cpu_port = true;
>  	ds->mtu_enforcement_ingress = true;
>  
> diff --git a/drivers/net/dsa/mt7530.h b/drivers/net/dsa/mt7530.h
> index fe4cd2ac26d0..91508e2feef9 100644
> --- a/drivers/net/dsa/mt7530.h
> +++ b/drivers/net/dsa/mt7530.h
> @@ -145,6 +145,8 @@ enum mt7530_vlan_cmd {
>  #define  PORT_STAG			BIT(31)
>  /* Independent VLAN Learning */
>  #define  IVL_MAC			BIT(30)
> +/* Egress Tag Consistent */
> +#define  EG_CON				BIT(29)
>  /* Per VLAN Egress Tag Control */
>  #define  VTAG_EN			BIT(28)
>  /* VLAN Member Control */
> -- 
> 2.25.1
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
