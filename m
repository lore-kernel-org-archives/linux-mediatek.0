Return-Path: <SRS0=iyt4=M5=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4DABFC4338F
	for <linux-mediatek@archiver.kernel.org>; Fri,  6 Aug 2021 00:18:08 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 064B360F70
	for <linux-mediatek@archiver.kernel.org>; Fri,  6 Aug 2021 00:18:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 064B360F70
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rzS36kcn0R0zIG9gWecrPHQBu/hCU/nBU+suDKoSJFs=; b=3yL2C960db4YoZ
	nnZ4bNBXBVdQXEP/l2Pw6xOK7ukJcviNwDeQARDRAKVhjGvFokZVLj9Yf2rSIgALprFsCm1+v7EMt
	Y8fszio6m6ANi1PWbxoeVXTdKOIsKDi66MII0R4zI78yldWfBCXFd8juAdSY3kymmM2IDy3yuMYe5
	lCk5fugXG8heBcJiy9G2dHJDtzBaT2MH6Ifbh3HkbOx9uQFo9gZQ/g9IauO9bvrDVwOoU1PG0s+2b
	xyLwz9ufuq/kNf2AY2n6qW5p2XpzRAQDarM4K99xQSV2J5QCj9Zed0R1QWc8Mf4ONTIOFziHB0rE8
	gNx6/su6eALR5qO/UF3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mBnYi-00B76Y-K8; Fri, 06 Aug 2021 00:17:56 +0000
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mBnYW-00B75b-J8; Fri, 06 Aug 2021 00:17:45 +0000
Received: by mail-ed1-x52c.google.com with SMTP id f13so10748879edq.13;
 Thu, 05 Aug 2021 17:17:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=Zw/0qEnKJrmNekra6VcoVeV33INMsYbzX2fsWAAHgGc=;
 b=KlKFIEbLFH7X8P9jgl3li1QFlvN3OTz+loXJhEfDS6OcXaR/faZOvCa7SdV2lWai5s
 jhWXxY2rv0HYfDUihsP+IzOJ6DYjelhcZ8wB2gK3lJBRU4noIp8VHDD2O6BlB+G9s3v4
 qxTBT98CzPXXtf4if/wI+bG4n18DPDbnvPjgdA04H/M6HXsxiyeKKu5kmg4S7vxwfe4p
 XByfaD3VeBu1Wss2TShZv/A43XPnDtToTLtZM+PW7JJXJGFk3d2dyFSheLzYZhRbeFSY
 wZJEN1Tl0t9b3+1ujBUWCMNtlCYpeCFBwzeRQRW2TqLW6vn+OIH0MqhumcggjaYukjHi
 a8+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=Zw/0qEnKJrmNekra6VcoVeV33INMsYbzX2fsWAAHgGc=;
 b=oiuEHHDr6S+e9edpOu6c4FKCRer6wByHEYmtqt9r/DT8gJTtQUrM34ZgeKzBf/xuLo
 kvfpt3VAmACbPFwoia4pMqayFHoZKnkzCxw8L+A8XJb6StWEolBerBFSx7HQyjMeg6a8
 9HjJDhC1AwY0KWfjsYGO91FMxtYqQLhWe1EFtUAA/XBhsfUe99aT06GXr9s4lbR7jWoo
 jpx1ZP3CjA1IjVAPj30K53g09FiqDr2dQkOQDqs98MvYBmnQWYfNWYebduERWmoBrAxT
 etUn8KRnl9GhiOCPnTKie2SqEYBCGAN3hMUIWa2vEyOnGSDufn8NbTDcHNC57B3dmedY
 Lvhw==
X-Gm-Message-State: AOAM530MZvAxiJmRQMXMyWv/nRDa7exI7zmRJ/YK8LSc8iZe2Ir6jWHO
 Mxx5mqR3/S3DdfHtlhgLlgY=
X-Google-Smtp-Source: ABdhPJzenKyokR+gZ0WU8XytpuArPL0RxMpzWsLhxPo7r/W/yBlFxbQrxQG+FLxFcI+fG5hbhHWSqA==
X-Received: by 2002:aa7:d899:: with SMTP id u25mr9821469edq.151.1628209062424; 
 Thu, 05 Aug 2021 17:17:42 -0700 (PDT)
Received: from skbuf ([188.25.144.60])
 by smtp.gmail.com with ESMTPSA id o25sm2186250ejh.109.2021.08.05.17.17.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Aug 2021 17:17:41 -0700 (PDT)
Date: Fri, 6 Aug 2021 03:17:40 +0300
From: Vladimir Oltean <olteanv@gmail.com>
To: DENG Qingfang <dqfext@gmail.com>
Cc: Sean Wang <sean.wang@mediatek.com>, Landen Chao <Landen.Chao@mediatek.com>,
 Andrew Lunn <andrew@lunn.ch>, Vivien Didelot <vivien.didelot@gmail.com>,
 Florian Fainelli <f.fainelli@gmail.com>,
 "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, netdev@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH net-next] net: dsa: mt7530: drop untagged frames on
 VLAN-aware ports without PVID
Message-ID: <20210806001740.cayorz3vlfrvk75l@skbuf>
References: <20210805172315.362165-1-dqfext@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210805172315.362165-1-dqfext@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210805_171744_695601_AF21F415 
X-CRM114-Status: GOOD (  14.79  )
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

On Fri, Aug 06, 2021 at 01:23:14AM +0800, DENG Qingfang wrote:
> @@ -1624,11 +1631,26 @@ mt7530_port_vlan_add(struct dsa_switch *ds, int port,
>  	if (pvid) {
>  		priv->ports[port].pvid = vlan->vid;
>  
> +		/* Accept all frames if PVID is set */
> +		mt7530_rmw(priv, MT7530_PVC_P(port), ACC_FRM_MASK,
> +			   MT7530_VLAN_ACC_ALL);
> +
>  		/* Only configure PVID if VLAN filtering is enabled */
>  		if (dsa_port_is_vlan_filtering(dsa_to_port(ds, port)))
>  			mt7530_rmw(priv, MT7530_PPBV1_P(port),
>  				   G0_PORT_VID_MASK,
>  				   G0_PORT_VID(vlan->vid));
> +	} else if (priv->ports[port].pvid == vlan->vid) {
> +		/* This VLAN is overwritten without PVID, so unset it */
> +		priv->ports[port].pvid = G0_PORT_VID_DEF;
> +
> +		/* Only accept tagged frames if the port is VLAN-aware */
> +		if (dsa_port_is_vlan_filtering(dsa_to_port(ds, port)))
> +			mt7530_rmw(priv, MT7530_PVC_P(port), ACC_FRM_MASK,
> +				   MT7530_VLAN_ACC_TAGGED);
> +
> +		mt7530_rmw(priv, MT7530_PPBV1_P(port), G0_PORT_VID_MASK,
> +			   G0_PORT_VID_DEF);
>  	}
>  
>  	mutex_unlock(&priv->reg_mutex);

Good catch with this condition, sja1105 and ocelot are buggy in this
regard, it seems, probably others too. Need to fix them. Although
honestly I would probably rather spend the time patching the bridge
already to not accept duplicate VLAN entries from user space, just with
different flags, it's just too complex to handle the overwrites everywhere...
Plus, bridge accepting duplicate VLANs means we cannot refcount them on
DSA and CPU ports at the cross-chip level, which in turn means we can
never delete them from those ports.

Anyhow, enough rambling.

Reviewed-by: Vladimir Oltean <olteanv@gmail.com>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
