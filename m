Return-Path: <SRS0=HZpZ=FM=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 14E47C4361B
	for <linux-mediatek@archiver.kernel.org>; Tue,  8 Dec 2020 20:56:42 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CC6B423AFB
	for <linux-mediatek@archiver.kernel.org>; Tue,  8 Dec 2020 20:56:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CC6B423AFB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=v/irtvKAPnNPsC9hrU2RakDtA2BgVIXA0baDmNmK5BY=; b=pvIfG5YWAnrju386h969WdReh
	ho3TYw3lnNfa2HelRoO8imdLQRep73TWLvPkxPOkK6HmCa7Huq66k5qdhy4n+5TUBCpt2Pxvwepiw
	BzisUuqQ0QPckRvh22wcqm91jMhohxHg8Bo/CelVakpMw/xbta5qfwpMMJ5aMlRaPhRKaXiw+UmsV
	wZM9WlrgRWaTN3HXmCraY2basvw/6v0fXO0uo+Xd0+lH0KF12iuvd0HMuDbZhnCmOFexga/k807J+
	cK0jqFlN5B32dkWt/CgfbeLUQi92Xb3gg4V2c72+jvpZ5rRQooDJDMMsAx+cmnNgOCFJohep3SUEw
	W4kAgckQQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kmk29-0005Pb-71; Tue, 08 Dec 2020 20:56:29 +0000
Received: from mail-ed1-x544.google.com ([2a00:1450:4864:20::544])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kmk26-0005PF-EY
 for linux-mediatek@lists.infradead.org; Tue, 08 Dec 2020 20:56:27 +0000
Received: by mail-ed1-x544.google.com with SMTP id r5so19003419eda.12
 for <linux-mediatek@lists.infradead.org>; Tue, 08 Dec 2020 12:56:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=6DdKBi1cgyoljGzBWCPffDWHeqJxmio3GBFfS+NIfpY=;
 b=Z3uH/CLDgd4c8a3xYlBrJg+iZwA7p/MEKgN6YvCW3b+0aUn2POp3Y7BT2rNa/HG9a0
 LtLgfUOutgciB9Tl1ovHmN8PDhy8YhHFvR4mmKcckckrifYyYTU88EaHbhMQzmZUgLt/
 5ka33ut76coqFuFP8Xo1AdY1YZsNlMVjz8CAMVFG8z42Yynmk3NtNh9cU4wqtVC0Xzhh
 9M7epuoYWSGEuCCdzehdfQGbDNsrHEKpsIIEe5fXPFhNcTDlCel2AvYSe/8qeP8KS3G6
 cwFyjF8yc+mLZEo6gGFr3kDn6amVQVIouA4ZAKMIN8CefaPFgod6VRAloIfsfSevkhcf
 8uOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=6DdKBi1cgyoljGzBWCPffDWHeqJxmio3GBFfS+NIfpY=;
 b=ih0OVxqY+Ur2gwKZmhcT41dHdnEc4AzGWajw7pnt2KIWQxIKx7GQ48AhULgoSqwCKI
 K5dV/j/SKAU+N3ZWg1LaXV8dL5vdOTTPOYmFsmnEacmJP2DWTuROeZxJ7mp8bJ54/GK8
 7+LAUru0eKyXEuGNtsyr2QyrHeXkvwHmRlAS3/I1IYm7vGGgKN1S2ib6amNDSnG2VSqh
 a27y9JS28QCe+VaHv7HzzVkLMMnqSxbXW+tlfKqcIPjofSM0wNicD07tU1XNzMM9XHMh
 3BTiqUzB4tfo74Gs1I3B/KUgmK0V92yI8QV1uZ4ayeS1/dEu/YTvXnlPGW8bzKUYZG1u
 P/pw==
X-Gm-Message-State: AOAM531R/brCfvdOx9x2YJZNXZF3n3PmPny5a/yWpO9tncjyGePTmKD4
 bFJcV8HTksy81dDk79+tNwM=
X-Google-Smtp-Source: ABdhPJxa21e6yip2uA76uaSWYELHefCaNi/orwRfb/Csqj7vcOGqrq4tdzivCuwG1N34Xep7QlME1A==
X-Received: by 2002:a05:6402:491:: with SMTP id
 k17mr26388321edv.370.1607460983588; 
 Tue, 08 Dec 2020 12:56:23 -0800 (PST)
Received: from skbuf ([188.25.2.120])
 by smtp.gmail.com with ESMTPSA id l1sm9130705eje.12.2020.12.08.12.56.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Dec 2020 12:56:23 -0800 (PST)
Date: Tue, 8 Dec 2020 22:56:21 +0200
From: Vladimir Oltean <olteanv@gmail.com>
To: DENG Qingfang <dqfext@gmail.com>
Subject: Re: [PATCH net-next] net: dsa: mt7530: support setting ageing time
Message-ID: <20201208205621.2xxscilegk4k4t4g@skbuf>
References: <20201208070028.3177-1-dqfext@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201208070028.3177-1-dqfext@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201208_155626_540035_ECA56D82 
X-CRM114-Status: GOOD (  27.07  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: Andrew Lunn <andrew@lunn.ch>, Landen Chao <Landen.Chao@mediatek.com>,
 Florian Fainelli <f.fainelli@gmail.com>,
 Frank Wunderlich <frank-w@public-files.de>, netdev@vger.kernel.org,
 Sean Wang <sean.wang@mediatek.com>, Russell King <linux@armlinux.org.uk>,
 "David S . Miller" <davem@davemloft.net>, linux-mediatek@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Vivien Didelot <vivien.didelot@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Tue, Dec 08, 2020 at 03:00:28PM +0800, DENG Qingfang wrote:
> MT7530 has a global address age control register, so use it to set
> ageing time.
> 
> The applied timer is (AGE_CNT + 1) * (AGE_UNIT + 1) seconds
> 
> Signed-off-by: DENG Qingfang <dqfext@gmail.com>
> ---
>  drivers/net/dsa/mt7530.c | 41 ++++++++++++++++++++++++++++++++++++++++
>  drivers/net/dsa/mt7530.h | 13 +++++++++++++
>  2 files changed, 54 insertions(+)
> 
> diff --git a/drivers/net/dsa/mt7530.c b/drivers/net/dsa/mt7530.c
> index 6408402a44f5..99bf8fed6536 100644
> --- a/drivers/net/dsa/mt7530.c
> +++ b/drivers/net/dsa/mt7530.c
> @@ -870,6 +870,46 @@ mt7530_get_sset_count(struct dsa_switch *ds, int port, int sset)
>  	return ARRAY_SIZE(mt7530_mib);
>  }
>  
> +static int
> +mt7530_set_ageing_time(struct dsa_switch *ds, unsigned int msecs)
> +{
> +	struct mt7530_priv *priv = ds->priv;
> +	unsigned int secs = msecs / 1000;
> +	unsigned int tmp_age_count;
> +	unsigned int error = -1;
> +	unsigned int age_count;
> +	unsigned int age_unit;
> +
> +	/* Applied timer is (AGE_CNT + 1) * (AGE_UNIT + 1) seconds */
> +	if (secs < 1 || secs > (AGE_CNT_MAX + 1) * (AGE_UNIT_MAX + 1))
> +		return -ERANGE;
> +
> +	/* iterate through all possible age_count to find the closest pair */
> +	for (tmp_age_count = 0; tmp_age_count <= AGE_CNT_MAX; ++tmp_age_count) {
> +		unsigned int tmp_age_unit = secs / (tmp_age_count + 1) - 1;
> +
> +		if (tmp_age_unit <= AGE_UNIT_MAX) {
> +			unsigned int tmp_error = secs -
> +				(tmp_age_count + 1) * (tmp_age_unit + 1);
> +
> +			/* found a closer pair */
> +			if (error > tmp_error) {
> +				error = tmp_error;
> +				age_count = tmp_age_count;
> +				age_unit = tmp_age_unit;
> +			}

I feel that the error calculation is just snake oil. This would be enough:

		if (tmp_age_unit <= AGE_UNIT_MAX)
			break;

Explanation:

You are given a number X, and must find A and B such that the error
E = |(A x B) - X| should be minimum, with
1 <= A <= A_max
1 <= B <= B_max

It is logical to try with A=1 first. If X / A <= B_max, then of course,
B = X / 1, and the error E is 0.

If that doesn't work out, and B > B_max, then you go to A=2. That gives
you another B = X / 2, and the error E is 1. You check again if B <=
B_max. If it is, that's your answer. B = X / 2, with an error E of 1.

You get my point. Iterating ascendingly through A, and calculating B as
X / A, already gives you the smallest error as soon as it satisfies the
B <= B_max requirement.

> +
> +			/* found the exact match, so break the loop */
> +			if (!error)
> +				break;
> +		}
> +	}
> +
> +	mt7530_write(priv, MT7530_AAC, AGE_CNT(age_count) | AGE_UNIT(age_unit));
> +
> +	return 0;
> +}
> +
>  static void mt7530_setup_port5(struct dsa_switch *ds, phy_interface_t interface)
>  {
>  	struct mt7530_priv *priv = ds->priv;
> @@ -2564,6 +2604,7 @@ static const struct dsa_switch_ops mt7530_switch_ops = {
>  	.phy_write		= mt753x_phy_write,
>  	.get_ethtool_stats	= mt7530_get_ethtool_stats,
>  	.get_sset_count		= mt7530_get_sset_count,
> +	.set_ageing_time	= mt7530_set_ageing_time,
>  	.port_enable		= mt7530_port_enable,
>  	.port_disable		= mt7530_port_disable,
>  	.port_change_mtu	= mt7530_port_change_mtu,
> diff --git a/drivers/net/dsa/mt7530.h b/drivers/net/dsa/mt7530.h
> index ee3523a7537e..32d8969b3ace 100644
> --- a/drivers/net/dsa/mt7530.h
> +++ b/drivers/net/dsa/mt7530.h
> @@ -161,6 +161,19 @@ enum mt7530_vlan_egress_attr {
>  	MT7530_VLAN_EGRESS_STACK = 3,
>  };
>  
> +/* Register for address age control */
> +#define MT7530_AAC			0xa0
> +/* Disable ageing */
> +#define  AGE_DIS			BIT(20)
> +/* Age count */
> +#define  AGE_CNT_MASK			GENMASK(19, 12)
> +#define  AGE_CNT_MAX			0xff
> +#define  AGE_CNT(x)			(AGE_CNT_MASK & ((x) << 12))
> +/* Age unit */
> +#define  AGE_UNIT_MASK			GENMASK(11, 0)
> +#define  AGE_UNIT_MAX			0xfff
> +#define  AGE_UNIT(x)			(AGE_UNIT_MASK & (x))
> +
>  /* Register for port STP state control */
>  #define MT7530_SSP_P(x)			(0x2000 + ((x) * 0x100))
>  #define  FID_PST(x)			((x) & 0x3)
> -- 
> 2.25.1
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
