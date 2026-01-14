Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD30BD3CC86
	for <linux-mediatek@archiver.kernel.org>; Wed, 14 Jan 2026 22:17:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3QsmNE/dBOKmZVY75i8Uf1eQVIlPFgA+6+ZN6q48cI0=; b=Fvl4uqypbyBl+68QEPa4YONKiD
	vs2wBZ00r+nblzBnYLTRTgb1QBYXLxGG7PeKv8Dggl1eaEhG0ZPfUN1/NMpF9rUcFwbyuN5S1TWsN
	Z1p9Cpu7eV3e95hWg++CQ4bwc5t54oiMJ1L/c8f5O+iuNl7/E9Og0kFJRO1usCLkaPJaKAINx3ghL
	6LiLK1rPcjgcZAMAYtycE10gLtxAZ662UDx/UWqDZ7FBiS0W2qSKZhN8AaGRoqi32Wn4M3Kl+V9YA
	/C7CRciU4OnXt7NpcPAKJsSWBZSu2qcKrEBOUhujkrbAxaUwhFYE0GyaFGKo1AXNt0T8GwgapwZHY
	eiYgR3ag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vg9BY-0000000AtId-49G2;
	Wed, 14 Jan 2026 22:17:52 +0000
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vg9BV-0000000AtHG-3pAI
	for linux-mediatek@lists.infradead.org;
	Wed, 14 Jan 2026 22:17:51 +0000
Received: by mail-ed1-x529.google.com with SMTP id 4fb4d7f45d1cf-64b5b22f723so37891a12.2
        for <linux-mediatek@lists.infradead.org>; Wed, 14 Jan 2026 14:17:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768429068; x=1769033868; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=3QsmNE/dBOKmZVY75i8Uf1eQVIlPFgA+6+ZN6q48cI0=;
        b=VCqoyAzV0eiZ5wgoI2Z/RIcUKQgX2WsA0MLzZs7z/KeCzVCL1fCrd5JHzhCRpB86xk
         p5ZY7JpvLvm+Gzq33HLFV3OuBp93qByq8ZxdB7nzEF2DIe9Orhain+O5d1Ot6vTMvmmb
         pPsWCQRydv+krzUm5oMg7TgqPRqxoj63aoyz0fTexjC2nl62NevHoE/tv9e5YIRe40NH
         9J0VNedUFPRvOcLeG4VdzKqy+22YM0xmumUMfQIatGQXCE+UxZR1B6/xrw5w5c2+q4ZP
         Er5eoPnYlyAGkgy0jsv7ZtnHB2k4pYnloNsaufkiBrqDrmqlb+GyYkzsVPgjoynGFF8N
         fCXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768429068; x=1769033868;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3QsmNE/dBOKmZVY75i8Uf1eQVIlPFgA+6+ZN6q48cI0=;
        b=TcQ75UH0R4A4QMWSYz4Sw6Limlivso6+WpzzdthIGN7qHLeYtzZ7I9SnjZKMSGBU1E
         jdGOX/NEgr3i4i8Z2futRfVvCd/0tsYZgAMa8L7z5XTQcXpDbqfVaH1fVknRyWpPbGAO
         DvG4cqpBLLNC2hpALawZrqAQlyK8JwK4n18RQ7ZtwTNs3etsc9Lo5irzl9Lv2JnRoL1T
         Ph0asmxuvKeoWB9eJXD899f1nomAzNTU4oQQIgWk1n77Ul5N/Exwdz+h7Bn+sV4crADy
         W29rsGRFbtPQPsmI9dQqCWQyQCb80SbJcnk51rM1dni1jWp43tKS6DCs4uP54OP1m8HX
         HKBw==
X-Forwarded-Encrypted: i=1; AJvYcCXVncmYrdTm64KpFdpmYTVgBMLi13xAUzuhjg/HBDYmoHub9SvvGMWknaAihbswmlUHf90uQ6iSlFKroK2izw==@lists.infradead.org
X-Gm-Message-State: AOJu0YyU3YRCdvtC3h8T/rhLUgZ9SwLb+//Y75mH5bzPEE+Kr+843xeZ
	x5Hlz3j3r8Grs+0KYf37P71Ej37Jh0M+XMZS7jTqIGzHmtOWOvPd7DOw
X-Gm-Gg: AY/fxX6bZamxOb+sfzD/QtulDsrCElUQJT0FUVjpOttnpTfdzJtE0msn9VZDe3dIoMt
	ONNgaxfNNl7Uakf62U/LeTHlCvxnpnMj82ayyRVTL0KdZ3/wXHwxRcuQ9nIxuVzVytcIxz/Bm92
	Hz87XKCw8azG+1uZrGOxtS8goMzbk20WG1xpZEwNlm4jenJk0qiUVuV0XgROVddUKggScFTSTez
	V2GORrvN3V9cveBSOocfxobSA3AJkZtwpryC3X2b204qJm7oMsTYvpX5ibM9OujjfSZzf38Gtiw
	lsZ23ITpEueWu8e5Jr+cL7rY0kkcdgSR61xOvHlkOvpntBdyPSP6pm7YjGeeePB4Xaw1wmfC+ae
	AnCbId08BXEDP16VA3HsvoPwTtq75zKh16QbFR5ZLiKdzE8cYC09/TI485NZpYQ4i/rFofIVhaT
	S5vw==
X-Received: by 2002:a05:6402:5186:b0:64b:a1e6:8013 with SMTP id 4fb4d7f45d1cf-653ec46689fmr1892486a12.6.1768429067635;
        Wed, 14 Jan 2026 14:17:47 -0800 (PST)
Received: from skbuf ([2a02:2f04:d703:5400:d5b0:b41:b5b3:8c4d])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-65412084155sm650905a12.29.2026.01.14.14.17.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jan 2026 14:17:47 -0800 (PST)
Date: Thu, 15 Jan 2026 00:17:43 +0200
From: Vladimir Oltean <olteanv@gmail.com>
To: Andrew Lunn <andrew@lunn.ch>
Cc: Daniel Golle <daniel@makrotopia.org>, Felix Fietkau <nbd@nbd.name>,
	John Crispin <john@phrozen.org>, Sean Wang <sean.wang@mediatek.com>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Bc-bocun Chen <bc-bocun.chen@mediatek.com>,
	Rex Lu <rex.lu@mediatek.com>,
	Mason-cw Chang <Mason-cw.Chang@mediatek.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH net-next RFC] net: ethernet: mtk_eth_soc: support using
 non-MediaTek DSA switches
Message-ID: <20260114221743.tb56lxfi6eqoh2rw@skbuf>
References: <34647edacab660b4cabed9733d2d3ef22bc041ac.1768273593.git.daniel@makrotopia.org>
 <252d6877-d966-4d19-a38c-cc83ba908494@lunn.ch>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <252d6877-d966-4d19-a38c-cc83ba908494@lunn.ch>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260114_141749_970966_F1B2FDC9 
X-CRM114-Status: GOOD (  22.68  )
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

On Tue, Jan 13, 2026 at 03:00:18PM +0100, Andrew Lunn wrote:
> On Tue, Jan 13, 2026 at 03:11:54AM +0000, Daniel Golle wrote:
> > MediaTek's Ethernet Frame Engine is tailored for use with their
> > switches. This broke checksum and VLAN offloading when attaching a
> > DSA switch which does not use MediaTek special tag format.
> 
> This has been seen before. The Freescale FEC has similar problems when
> combined with a Marvell switch, it cannot find the IP header, and so
> checksum offloading does not work.
> 
> I thought we solved this be modifying the ndev->feature of the conduit
> interface to disable such offloads. But i don't see such code. So i
> must be remembering wrongly.
> 
> This is assuming the frame engine respects these flags:
> 
> /usr/sbin/ethtool -k enp2s0
> Features for enp2s0:
> rx-checksumming: on
> tx-checksumming: on
> 	tx-checksum-ipv4: on
> 	tx-checksum-ip-generic: off [fixed]
> 	tx-checksum-ipv6: on
> 	tx-checksum-fcoe-crc: off [fixed]
> 	tx-checksum-sctp: off [fixed]
> 
> When you combine a Marvell Ethernet interface with a Marvell switch
> offloading works of course. So it probably does require some logic in
> the MAC driver to determine if the switch is of the same vendor or
> not.

I don't know about FEC, but we did end up documenting this:

If the DSA conduit driver still uses the legacy NETIF_F_IP_CSUM
or NETIF_F_IPV6_CSUM in vlan_features, the offload might only work if the
offload hardware already expects that specific tag (perhaps due to matching
vendors). DSA user ports inherit those flags from the conduit, and it is up to
the driver to correctly fall back to software checksum when the IP header is not
where the hardware expects.

I would suggest searching for skb_checksum_help() in xmit() implementations.
For example c2945c435c99 ("net: stmmac: Prevent DSA tags from breaking COE").

This is just at a first glance having read the commit message and the
discussion, not necessarily the code.

