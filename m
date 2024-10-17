Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9053CD3C526
	for <linux-mediatek@archiver.kernel.org>; Thu, 17 Oct 2024 18:11:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Type:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To
	:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=F/+dTkevYtGeJKnZxzVjh4pNY2eAOXtV1BlP8S+6SkQ=; b=a0zsa7jTOhdQl1O21CoR4qSNvb
	73TCmTvHFBKG5yL+7fuEgoh3ElHvOyV0T15mYKVu/5+gXrmHbx17oqfw+PEE1XsZyJFV/rTmLcGUA
	5Nzmf/cpcxGGqTga6gIyFEAd4xXxTPbR+JKOUPKz04QNWd0vADYq6gx6hjyLGbIkiDPL68T7xrl3F
	zHtWglTvLoul9W9WNPgMIzPxvJhifAyvRsOgazjaUbdVSQTXNH0SJj9KvH2PiWVmlT5XzxIc6GssW
	up2hTvS4feU6Hw3Rr7qHtsDBhU1aZwj6e/a4Je37QfTbQiboeUWNp3nLUbKL3bInqVMSHVXiK/62I
	uK+/l4Ug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t1UyK-0000000Fpho-29JC;
	Thu, 17 Oct 2024 18:11:40 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t1Uws-0000000FpTo-0vPv;
	Thu, 17 Oct 2024 18:10:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=F/+dTkevYtGeJKnZxzVjh4pNY2eAOXtV1BlP8S+6SkQ=; b=m2KV1LqPvdt3czSxWMcFELKTD0
	jK5WYYxeufvhSKXA+8auA7aqhu743W6T0uci64lV18DZJSe/nxrhS/Mn2bKdlPUpilEVk2aYpePvO
	x5HttHU4vNJsh6Fuk3hKSgr17ntk2rvNsD68na+ukX9sQxr1nGIWbWC6xYlshZOF90PGTl6JGMqXN
	1XzKLvsbF7xoYchjSiuu5ySJZimQWGXM0iBR/owBzEcKHk7TfuENYyZXaT7Y9rqiOfqQSWtexYtDV
	tP8Wcwn618NJL2ZUlCs4yzLXUojvkpyQf0Gf1U4LqZCKwXV9wJWw+1KR0dzgG3307iG89jmX+ISi5
	TCT6A81Q==;
Received: from ganesha.gnumonks.org ([2001:780:45:1d:225:90ff:fe52:c662])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t1Uwp-00000007BUR-1DiP;
	Thu, 17 Oct 2024 18:10:09 +0000
Received: from [78.30.37.63] (port=44420 helo=gnumonks.org)
	by ganesha.gnumonks.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <pablo@gnumonks.org>)
	id 1t1UwZ-00FcEm-9a; Thu, 17 Oct 2024 20:09:53 +0200
Date: Thu, 17 Oct 2024 20:09:49 +0200
From: Pablo Neira Ayuso <pablo@netfilter.org>
To: Felix Fietkau <nbd@nbd.name>
Subject: Re: [PATCH RFC v1 net-next 00/12] bridge-fastpath and related
 improvements
Message-ID: <ZxFS7XBgFXsqUlkO@calendula>
References: <20241013185509.4430-1-ericwouds@gmail.com>
 <9f9f3cf0-7a78-40f1-b8d5-f06a2d428210@blackwall.org>
 <a07cadd3-a8ff-4d1c-9dca-27a5dba907c3@gmail.com>
 <0b0a92f2-2e80-429c-8fcd-d4dc162e6e1f@nbd.name>
 <137aa23a-db21-43c2-8fb0-608cfe221356@gmail.com>
 <a7ab80d5-ff49-4277-ba73-db46547a8a8e@nbd.name>
 <d7d48102-4c52-4161-a21c-4d5b42539fbb@gmail.com>
 <b5739f78-9cd5-4fd0-ae63-d80a5a37aaf0@nbd.name>
 <ZxEFdX1uoBYSFhBF@calendula>
 <eb9006ae-4ded-4249-ad0e-cf5b3d97a4cb@nbd.name>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <eb9006ae-4ded-4249-ad0e-cf5b3d97a4cb@nbd.name>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241017_191007_435584_9A78AEAE 
X-CRM114-Status: GOOD (  28.78  )
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
Cc: Nikolay Aleksandrov <razor@blackwall.org>, Daniel Golle <daniel@makrotopia.org>, Eric Dumazet <edumazet@google.com>, Jozsef Kadlecsik <kadlec@netfilter.org>, coreteam@netfilter.org, Roopa Prabhu <roopa@nvidia.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Lorenzo Bianconi <lorenzo@kernel.org>, Sebastian Andrzej Siewior <bigeasy@linutronix.de>, Jiri Pirko <jiri@resnulli.us>, bridge@lists.linux.dev, linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>, linux-arm-kernel@lists.infradead.org, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, netfilter-devel@vger.kernel.org, Eric Woudstra <ericwouds@gmail.com>, "David S. Miller" <davem@davemloft.net>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Thu, Oct 17, 2024 at 07:06:51PM +0200, Felix Fietkau wrote:
> On 17.10.24 14:39, Pablo Neira Ayuso wrote:
> > On Thu, Oct 17, 2024 at 11:17:09AM +0200, Felix Fietkau wrote:
> > [...]
> > > By the way, based on some reports that I received, I do believe that the
> > > existing forwarding fastpath also doesn't handle roaming properly.
> > > I just didn't have the time to properly look into that yet.
> > 
> > I think it should work for the existing forwarding fastpath.
> > 
> > - If computer roams from different port, packets follow classic path,
> >    then new flow entry is created. The flow old entry expires after 30
> >    seconds.
> > - If route is stale, flow entry is also removed.
> > 
> > Maybe I am missing another possible scenario?
> 
> I'm mainly talking about the scenario where a computer moves to a different
> switch port on L2 only, so all routes remain the same.
> 
> I haven't fully analyzed the issue, but I did find a few potential issues
> with what you're describing.
> 
> 1. Since one direction remains the same when a computer roams, a new flow
> entry would probably fail to be added because of an existing entry in the
> flow hash table.

I don't think so, hash includes iifidx.

> 2. Even with that out of the way, the MTK hardware offload currently does
> not support matching the incoming switch/ethernet port.
> So even if we manage to add an updated entry, the old entry could still be
> kept alive by the hardware.

OK, that means probably driver needs to address the lack of iifidx in
the matching by dealling with more than one single flow entry to point
to one single hardware entry (refcounting?).

> The issues I found probably wouldn't cause connection hangs in pure L3
> software flow offload, since it will use the bridge device for xmit instead
> of its members. But since hardware offload needs to redirect traffic to
> individual bridge ports, it could cause connection hangs with stale flow
> entries.

I would not expect a hang, packets will just flow over classic path
for a little while for the computer that is roaming until the new flow
entry is added.

> There might be other issues as well, but this is what I could come up with
> on short notice. I think in order to properly address this, we should
> probably monitor for FDB / neigh entry changes somehow and clear affected
> flows.
>
> Routes do not become stale in my scenario, so something else is needed to
> trigger flow entry removal.

Yes. In case letting expire stale flow entries with old iifidx is not enough
some other mechanism could be required.

