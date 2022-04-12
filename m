Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86A23C433F5
	for <linux-mediatek@archiver.kernel.org>; Tue, 12 Apr 2022 13:08:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gn1Pb8IMJUoARjKjMpesEFQKmUxgxS1MN+qA9C1rdsM=; b=i1b5++SX48YH71
	txmXgepxyDosdThdbDiuwoOoZMYFuPMRlxw/mmzTdXjPqmkPTQxQMPMlA4C69eiJMUXAe7g9hv1S/
	BZ0Yc4pKhKa6ifPHFfs1kcBQ/hZOldyCbLNuBA2lT67v+Rin3yvUcSjY4n9HPr2DbAJ01I/C2LNHC
	iAlU70JYSelVExk9zcjJGlhKwFGiOqCWrHWVn49PEwrpraTDAOuYwH+5cCHQSTpymabxslWRD1aOJ
	Z//Td/CgR0Ub6iMDbeJfmQAr3ERQSIsUlhLP7D6eGtdNnxnL5GbrPHXlTT5yiuZvAhZJm/6y0W9PS
	OP1ZLdyoGaqmM4NRUg1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1neGFr-00EQzC-FF; Tue, 12 Apr 2022 13:08:23 +0000
Received: from vps0.lunn.ch ([185.16.172.187])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1neGF9-00EQeO-Az; Tue, 12 Apr 2022 13:07:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
 s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
 Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
 bh=hpGCLbrOzXS09YNJzkrxH5woyVIGrdo/h+bTCZ2VPog=; b=A8Q15kXmugOYdyZuQhnZ7fYmpc
 jIA0/p9MCphVCHBxqqjjHVwPkEp2RiAZMcydJDZ34X/6/EC49NevaOkS6zcx+x8GGG4Y8geFneRBl
 1yRpOymkqZRNNwRKUH7X1uXsHdhLSzgd7BXzRAq+n+GTF9lQf4hgKnd4Kyxnfq5VgJM4=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
 (envelope-from <andrew@lunn.ch>)
 id 1neGEu-00FSH7-Ux; Tue, 12 Apr 2022 15:07:24 +0200
Date: Tue, 12 Apr 2022 15:07:24 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Felix Fietkau <nbd@nbd.name>
Cc: netdev@vger.kernel.org, John Crispin <john@phrozen.org>,
 Sean Wang <sean.wang@mediatek.com>, Mark Lee <Mark-MC.Lee@mediatek.com>,
 "David S. Miller" <davem@davemloft.net>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 Jiri Pirko <jiri@nvidia.com>, Ido Schimmel <idosch@nvidia.com>,
 Florian Fainelli <f.fainelli@gmail.com>,
 Vladimir Oltean <vladimir.oltean@nxp.com>
Subject: Re: [PATCH v2 14/14] net: ethernet: mtk_eth_soc: support creating
 mac address based offload entries
Message-ID: <YlV5jEzNZT1aKmNL@lunn.ch>
References: <20220405195755.10817-1-nbd@nbd.name>
 <20220405195755.10817-15-nbd@nbd.name> <Yk8pJRxnVCfdk8xi@lunn.ch>
 <f25a6278-1baf-cc27-702a-5d93eedda438@nbd.name>
 <YlQmf7qGAnq/3nW0@lunn.ch>
 <ece29b0d-bbbe-7c03-a6b4-60e44453ca31@nbd.name>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ece29b0d-bbbe-7c03-a6b4-60e44453ca31@nbd.name>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220412_060739_442383_959C7A21 
X-CRM114-Status: GOOD (  27.49  )
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

> > > > > I'm trying to understand the architecture here.
> > > > > We have an Ethernet interface and a Wireless interface. The slow
> > > path
> > > > is that frames ingress from one of these interfaces, Linux decides
> > > > what to do with them, either L2 or L3, and they then egress probably
> > > > out the other interface.
> > > > > The hardware will look at the frames and try to spot flows? It
> > > will
> > > > then report any it finds. You can then add an offload, telling it for
> > > > a flow it needs to perform L2 or L3 processing, and egress out a
> > > > specific port? Linux then no longer sees the frame, the hardware
> > > > handles it, until the flow times out?
> > > Yes, the hw handles it until either the flow times out, or the corresponding
> > > offload entry is removed.
> > > 
> > > For OpenWrt I also wrote a daemon that uses tc classifier BPF to accelerate
> > > the software bridge and create hardware offload entries as well via hardware
> > > TC flower rules: https://github.com/nbd168/bridger
> > > It works in combination with these changes.
> > 
> > What about the bridge? In Linux, it is the software bridge which
> > controls all this at L2, and it should be offloading the flows, via
> > switchdev. The egress port you derive here is from the software bridge
> > FDB?

> My code uses netlink to fetch and monitor the bridge configuration,
> including fdb, port state, vlans, etc. and it uses that for the offload path
> - no extra configuration needed.

So this is where we get into architecture issues. Do we really want
Linux to have two ways for setting up L2 networking? It was decided
that users should not need to know about how to use an accelerator,
they should not use additional tools, it should just look like
linux. The user should just add the WiFi netdev to the bridge and
switchdev will do the rest to offload L2 switching to the hardware.

You appear to be saying you need a daemon in userspace. That is not
how every other accelerate works in Linux networking.

We the Linux network community need to decided if we want this?

    Andrew

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
