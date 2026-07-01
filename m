Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C3B2C43327
	for <linux-mediatek@archiver.kernel.org>; Wed,  1 Jul 2026 06:38:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2LwB1NkOwDwoZvgqDuV2zTe52TJOeOo2nEEjVYmEQD0=; b=bu5xc+pVZMxLOyyhUN2DaBPcs+
	DY1tgAucEC0OYaRT4U5RwiZW6aLXf+6BfOXCN9kGufNTtIzRefR8tPnBXLgYD5kiULYXnNE+mGtEO
	moaXPXKUcqneFjIQGmvtFWXlUp4gJP5ZS4ff9NESK/vzvvcJBk9jNwqH7BlbLd+VBc9g88CJV+xA+
	Wye4CUHvKLv39ofUvuoOqL78oZyG+CW6mBiWpI7ig9gE+Nv5gnOWj6mR8Lh/2xdvOigu/EV47NXi9
	zNgFBmCks/d0nDpjz+PGx3tUl7S6PoC7lKt4pvLAjISYwOWWhZmzglUgrA13bKeNBK/Yp3X/izGCq
	BYG6dbsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weoag-00000000oP8-2uQs;
	Wed, 01 Jul 2026 06:38:34 +0000
Received: from mail-dy1-x1329.google.com ([2607:f8b0:4864:20::1329])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weoae-00000000oOC-44R1
	for linux-mediatek@lists.infradead.org;
	Wed, 01 Jul 2026 06:38:34 +0000
Received: by mail-dy1-x1329.google.com with SMTP id 5a478bee46e88-30bf8b2bd20so585889eec.0
        for <linux-mediatek@lists.infradead.org>; Tue, 30 Jun 2026 23:38:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782887912; x=1783492712; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2LwB1NkOwDwoZvgqDuV2zTe52TJOeOo2nEEjVYmEQD0=;
        b=T/K23VUy5OZobyBCeC7ev+dwBd0Ld6VNdY+oyK/rmmOIpMUTb9nJKmAHlyxuB5Q7ym
         B33XfOnva3eGwPkgL2Wj69eEECed8nIEu8DRS6XFjuG6IDM7EAYhwtV7WbRLoCZ0/51Q
         TKTQBLICJJxlMTf+dt5ISPgUtnLp+lOJAWq+n0V1KMTCf9jB+5JYeuiJyRzjqiCX57xg
         ywPdXC+8MlVNeVBUCT6tdCbGabPq0lBqYCrmoV1LAUTOuYL/MyCT9Xs6zOyGSxOcc4V/
         0JJMa9xmooVtSvZj+EOpIXASjB98xMIZEsiI+j6xupOZ51N5UnhXLmIYnqpLlaQTqUz/
         GuJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782887912; x=1783492712;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=2LwB1NkOwDwoZvgqDuV2zTe52TJOeOo2nEEjVYmEQD0=;
        b=mvw8Nh9bLCB7IHogdTklMMsLK2pSKA6b+RtuCjOEBWjm4tPcJst3Elkyhercb17Mxk
         U1f0N0IL8PaeM3TNfzV6bSzOvnvBwLWzQrJ1Nhs6Mi77S4YiIroUHUFo0BB1Lc7mncZN
         bjC954JuNSX7YLEhPZRrdrkvUOGMuc/ucvpPRLOBCoTMOYVv2F0WzOrRZhTwmZb9TBfe
         GhNN8oXcQuT3Yf3okxJXX7aqIij27tW0PM9WMpGgLnPnF0cfBwLkKzp/x06t99eHYPhi
         139U/tdi11a2P6xuw/xNpnaRv2O9VqYvK+ARJFR0d6qio5FZWfO8bhh8K6tTMigsjt+3
         vN1g==
X-Forwarded-Encrypted: i=1; AHgh+Rrz0ykKT7X20kCKb7Zhd7c+IowEGUYq87cNCFdMxdKcG0XUCzUKK2/xK6IQwPRhPo0k3NtyJgLwxVWDz74/2Q==@lists.infradead.org
X-Gm-Message-State: AOJu0YwN2tG8hAIZjOkV9f3tA3MqlGXWO1pmmvJy1dc6gqPWISHMMB1h
	ZNTXmG7jMsANOWhv+d59c3NDiAMNLX7yLSYxmMVXiA+x6aVY14NDRJM7
X-Gm-Gg: AfdE7cknMwuAqKbG5D20FamFFhVl5XE/cHgks4Df2tgwPYtEiwc03WSiH7TMIxlQC3M
	6NXTWIbQ/vPuitbZQk0Y0bgdcYR+Uo/hFwzv+7rXefJxYQfjhDPhI9PKvJvGE3zsv1G55dfo1xI
	7ufwZAtX4iEHSnCWQqD6VyeC2cbxpoIVEtMxuN3d2NdOVibxt1Dbm7YOp6jpCjDdyemLQAVOCcF
	t8YhxcRCjI0oc35UPGstO4c28LoKZCzEv9DyvzAbT7cZzi9lwmNFHFcGV92OuPvyIUlUb/jSyVK
	FMluFwH+wGxgrIXly3Ux+joL+zm1Hq3fs6ud/UGnyF16FOtKLWQe+THUBQvX1ZH6GkDZ7CKe5oJ
	SjiTtXK7dxQN4484RFyScKxsFWSUEV8pX8yU49lasH6j4bAWqzJ6wgnkwWInZLiUSHtB7qgbQrV
	djwuCBVhrmB3vQ3cvoPx1ezOQ=
X-Received: by 2002:a05:7300:d50b:b0:30c:1865:d9e0 with SMTP id 5a478bee46e88-30eff07d7fdmr475848eec.16.1782887911791;
        Tue, 30 Jun 2026 23:38:31 -0700 (PDT)
Received: from nbai25050028.. ([2403:8600:2090:6f:c5d7:7505:b0e9:be5e])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30ef2688b6esm7159725eec.30.2026.06.30.23.38.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jun 2026 23:38:31 -0700 (PDT)
From: Aniket Negi <aniket.negi03@gmail.com>
To: Lorenzo Bianconi <lorenzo@kernel.org>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	aniket.negi@airoha.com
Subject: Re: [PATCH] net: airoha: fix MIB stats collection to be lossless
Date: Wed,  1 Jul 2026 12:08:23 +0530
Message-ID: <20260701063823.239783-1-aniket.negi03@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <akPQ7P1Dqb00oWa3@lore-desk>
References: <akPQ7P1Dqb00oWa3@lore-desk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260630_233833_012545_A106326B 
X-CRM114-Status: GOOD (  19.04  )
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

Hi Lorenzo,

Thank you for the detailed review and suggestions!

> > +	/* TX - 64-bit H+L registers: hw accumulates the total, read directly. =
> */
> >  	val = airoha_fe_rr(eth, REG_FE_GDM_TX_OK_PKT_CNT_H(port->id));
> > -	dev->stats.tx_ok_pkts += ((u64)val << 32);
> > -	val = airoha_fe_rr(eth, REG_FE_GDM_TX_OK_PKT_CNT_L(port->id));
> > -	dev->stats.tx_ok_pkts += val;
> > +	dev->stats.tx_ok_pkts = (u64)val << 32;
> 
> I guess it is more readable to store REG_FE_GDM_TX_OK_PKT_CNT_L() read in v=
> al
> here. Something like:
> 
> 	val = airoha_fe_rr(eth, REG_FE_GDM_TX_OK_PKT_CNT_L(port->id));
> 	dev->stats.tx_ok_pkts += val;
> 
> This apply even to occurrence below
Agreed. I'll store CNT_L read in val first to improve readability.

> > +	dev->stats.tx_ok_pkts += airoha_fe_rr(eth, REG_FE_GDM_TX_OK_PKT_CNT_L=
> (port->id));
> > =20
> >  	val = airoha_fe_rr(eth, REG_FE_GDM_TX_OK_BYTE_CNT_H(port->id));
> > -	dev->stats.tx_ok_bytes += ((u64)val << 32);
> > -	val = airoha_fe_rr(eth, REG_FE_GDM_TX_OK_BYTE_CNT_L(port->id));
> > -	dev->stats.tx_ok_bytes += val;
> > +	dev->stats.tx_ok_bytes = (u64)val << 32;
> > +	dev->stats.tx_ok_bytes += airoha_fe_rr(eth, REG_FE_GDM_TX_OK_BYTE_CNT=
> _L(port->id));
> > =20
> > +	/* TX - 32-bit registers: accumulate delta to handle wrap-around. */
> >  	val = airoha_fe_rr(eth, REG_FE_GDM_TX_ETH_DROP_CNT(port->id));
> > -	dev->stats.tx_drops += val;
> > +	dev->stats.tx_drops += (u32)(val - dev->stats.hw_prev_stats.tx_drops);
> > +	dev->stats.hw_prev_stats.tx_drops = val;
> > =20
> >  	val = airoha_fe_rr(eth, REG_FE_GDM_TX_ETH_BC_CNT(port->id));
> > -	dev->stats.tx_broadcast += val;
> > +	dev->stats.tx_broadcast += (u32)(val - dev->stats.hw_prev_stats.tx_br=
> oadcast);
> > +	dev->stats.hw_prev_stats.tx_broadcast = val;
> > =20
> >  	val = airoha_fe_rr(eth, REG_FE_GDM_TX_ETH_MC_CNT(port->id));
> > -	dev->stats.tx_multicast += val;
> > +	dev->stats.tx_multicast += (u32)(val - dev->stats.hw_prev_stats.tx_mu=
> lticast);
> > +	dev->stats.hw_prev_stats.tx_multicast = val;
> > =20
> >  	val = airoha_fe_rr(eth, REG_FE_GDM_TX_ETH_RUNT_CNT(port->id));
> > -	dev->stats.tx_len[i] += val;
> > +	dev->stats.tx_len[i] += (u32)(val - dev->stats.hw_prev_stats.tx_len[i=
> ]);
> > +	dev->stats.hw_prev_stats.tx_len[i] = val;
> > =20
> >  	val = airoha_fe_rr(eth, REG_FE_GDM_TX_ETH_E64_CNT_H(port->id));
> > -	dev->stats.tx_len[i] += ((u64)val << 32);
> > -	val = airoha_fe_rr(eth, REG_FE_GDM_TX_ETH_E64_CNT_L(port->id));
> > -	dev->stats.tx_len[i++] += val;
> > +	dev->stats.tx_len[i] += (u64)val << 32;
>  
> Since now we do not reset MIB counters, this is wrong, you can't use "+="

You are absolutely right, since MIB counters are no longer cleared, using "+=" for E64 counter would cause double counting each iteration. This was missed in the patch, specifically for the case where runt count(32 bit) and E64 counter (64 bit) need to be combined in the same counter. 

I'll fix this by using separate accumulator fields to "tx_runt_accum/rx_runt_accum" to track the runt deltas, then compute tx_len[i] as tx_len[i]= tx_runt_accum + E64_CNT (H+L).

> >  	val = airoha_fe_rr(eth, REG_FE_GDM_RX_ETH_RUNT_CNT(port->id));
> > -	dev->stats.rx_len[i] += val;
> > +	dev->stats.rx_len[i] += (u32)(val - dev->stats.hw_prev_stats.rx_len[i=
> ]);
> > +	dev->stats.hw_prev_stats.rx_len[i] = val;
> > =20
> >  	val = airoha_fe_rr(eth, REG_FE_GDM_RX_ETH_E64_CNT_H(port->id));
> > -	dev->stats.rx_len[i] += ((u64)val << 32);
> > -	val = airoha_fe_rr(eth, REG_FE_GDM_RX_ETH_E64_CNT_L(port->id));
> > -	dev->stats.rx_len[i++] += val;
> > +	dev->stats.rx_len[i] += (u64)val << 32;
> 
> same here.

Acked. The same approach above will be applied to rx_len[i]. 

> > +
> > +	struct {
> > +	/* Previous HW register values for 32-bit counter delta tracking.
> > +	 * Storing the last seen value and accumulating (u32)(curr - prev)
> > +	 * in 64-bit software counter & handles wrap-around transparently
> > +	 * via unsigned arithmetic. These fields are never reported to
> > +	 * userspace.
> > +	 */
> 
> can you please align the comment here?

Will fix the comment alignment.

> 
> > +		u32 tx_drops;
> > +		u32 tx_broadcast;
> > +		u32 tx_multicast;
> > +		u32 tx_len[7];
> > +		u32 rx_drops;
> > +		u32 rx_broadcast;
> > +		u32 rx_multicast;
> > +		u32 rx_errors;
> > +		u32 rx_crc_error;
> > +		u32 rx_over_errors;
> > +		u32 rx_fragment;
> > +		u32 rx_jabber;
> > +		u32 rx_len[7];
> > +	} hw_prev_stats;
> 
> Maybe something like "prev_val32" ?
> 
> Will update the name of struct to hold prev counter from hw_pre_stats to prev_val32.

Good suggestion. However, since the struct hw_prev_stats now contains both u32 (previous register value) and u64 (runt accumulators) fields. I'll rename it to "prev_mib_state" to better reflect its dual purpose of storing previous register values for delta calculation and accumulators for combined counters. 
  
Regards,
Aniket Negi


