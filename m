Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D58EC282EC
	for <linux-mediatek@archiver.kernel.org>; Fri, 14 Mar 2025 12:40:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Type:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To
	:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rPmJhpBheVqSUhPhE5IrqXg0aOCdmG4JQWmir+xGcw0=; b=S7MO2hGu7r+dl/zJiKdSubxzB2
	pr3BjC5/GppPd4xMqnoj+aOuAuWbl6+gziZmtq2xc4Y65NHXwLuKDGzzOoGixQUDvikN1ayHLf1iS
	WJqnwQ3D1Fj2yqA91qRN1s8ESU6qXV271x/70UAtvkEEtL09EoYpzOYttoaH/ps62DZKKASllsV2O
	rDCt/2/7qlEr4XllQFmG1eNgH8QUA20vT51dftkovd6EK7ZtZYJuU4eP6lQZrTFHBFEPkX/jdfedw
	vHYEocVI0hWGXtsZDgm5YIIn6o73piPo1xQCtKYG3faKDPshMB4wyuv0k8zSoP9tJ7Jnlsmozb8xn
	UTHQ1QOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tt4LN-0000000ECOH-2vfX;
	Fri, 14 Mar 2025 12:40:53 +0000
Received: from mail.netfilter.org ([217.70.190.124])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tt4IV-0000000EBng-2I4f;
	Fri, 14 Mar 2025 12:37:57 +0000
Received: by mail.netfilter.org (Postfix, from userid 109)
	id 762A0603CA; Fri, 14 Mar 2025 13:37:50 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=netfilter.org;
	s=2025; t=1741955870;
	bh=rPmJhpBheVqSUhPhE5IrqXg0aOCdmG4JQWmir+xGcw0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PBHMHtujaSgPuonQ9Nfap6d49Jr1/lX6UPgjBSh7qs06s3WhvdUzR2jz9jCdYDoVX
	 Wbu6w/o09Ra0lB9/wX4MfRNOD1s8qZK+QhG3NIyEldhrn5+yF/FZ5+J8dh15Z1QPKg
	 emuXeW2nqpnKt8wPDK5ohvjhwegbbvSeOW+cSH11oc6eLGYcHkFN9991BBocw6S9ns
	 jXCo1+4oA/3EXqnKbFwcGoLlp6i8djv9Whj0u28PfJM+cMjca3C6RnGNE7cgDJyoov
	 dDTmbiu0WjfPH3Kp0CQbhZyG8nAx4ciXVQhIqwwd1avczjHzGKG+oE6u9J9ivnjb4B
	 CwuXiOS07JhIA==
Received: from netfilter.org (mail-agni [217.70.190.124])
	by mail.netfilter.org (Postfix) with ESMTPSA id 94C35603BE;
	Fri, 14 Mar 2025 13:37:46 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=netfilter.org;
	s=2025; t=1741955866;
	bh=rPmJhpBheVqSUhPhE5IrqXg0aOCdmG4JQWmir+xGcw0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GSRWPm72uFyqXTyUIJzzcpsMAUkh40VOnAyEcDD7VyG9eADghYPABLGJQdrSQUmwp
	 ADzLKsqM/OgNyItHC69MGJkQMY9vFkOIUWclF/hPBeKglTj3RXqIqewOnLmq+PRo5T
	 wjdPi1wutXLVs+jy6NHGkOQEk4SHS/ftJBZporkZBy527X5e0XMXYM6LO/tD+9fKvu
	 F8vQ+5giSRhYXullElHg/Tqy98titObJDDwX9UcKwlJBqw8xzb4xomAVpVz7rskQ7K
	 C+YlaTlzzdrM+cysMJNyirwtjrLw3dDIGKi0pAraMhKV0pHJ70SUuYzFCESM0rIWNj
	 MBwY2wueKzqNQ==
Date: Fri, 14 Mar 2025 13:37:43 +0100
From: Pablo Neira Ayuso <pablo@netfilter.org>
To: Eric Woudstra <ericwouds@gmail.com>
Subject: Re: [PATCH v9 nf 00/15] bridge-fastpath and related improvements
Message-ID: <Z9QjF5LhavodVA4Y@calendula>
References: <20250305102949.16370-1-ericwouds@gmail.com>
 <897ade0e-a4d0-47d0-8bf7-e5888ef45a61@gmail.com>
 <Z9DKxOnxr1fSv0On@calendula>
 <58cbe875-80e7-4a44-950b-b836b97f3259@gmail.com>
 <Z9IUrL0IHTKQMUvC@calendula>
 <02b97708-1214-4fa4-a011-70388cff8f79@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <02b97708-1214-4fa4-a011-70388cff8f79@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250314_053756_022190_94AF1EAD 
X-CRM114-Status: GOOD (  19.09  )
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
Cc: Kees Cook <kees@kernel.org>, Sebastian Andrzej Siewior <bigeasy@linutronix.de>, Ahmed Zaki <ahmed.zaki@intel.com>, "Gustavo A. R. Silva" <gustavoars@kernel.org>, Eric Dumazet <edumazet@google.com>, linux-hardening@vger.kernel.org, Ivan Vecera <ivecera@redhat.com>, Alexander Lobakin <aleksander.lobakin@intel.com>, Jozsef Kadlecsik <kadlec@netfilter.org>, coreteam@netfilter.org, Roopa Prabhu <roopa@nvidia.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Nikolay Aleksandrov <razor@blackwall.org>, Jiri Pirko <jiri@resnulli.us>, bridge@lists.linux.dev, Kuniyuki Iwashima <kuniyu@amazon.com>, linux-mediatek@lists.infradead.org, Daniel Golle <daniel@makrotopia.org>, Matthias Brugger <matthias.bgg@gmail.com>, linux-arm-kernel@lists.infradead.org, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, Andrew Lunn <andrew+netdev@lunn.ch>, netfilter-devel@vger.kernel.org, Simon Horman <horms@kernel.org>, Vladimir Oltean <olteanv@gmail.com>, "David S. Miller" <davem@davemloft.net>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Thu, Mar 13, 2025 at 07:01:38PM +0100, Eric Woudstra wrote:
> 
> 
> On 3/13/25 12:11 AM, Pablo Neira Ayuso wrote:
> 
> >> What do you suggest?
> > 
> > Probably I can collect 4/15 and 5/15 from this series to be included
> > in the next pull request, let me take a look. But it would be good to
> > have tests for these two patches.
> > 
> 
> These are not most important to bridge-fastpath, but it gives extra
> possibilities. How about concentrating first on patch 2/15 (with 1/15
> removing a warning and 3/15 cleaning up), adding nf_flow_encap_push()
> for xmit direct? It is a vital patch for the bridge-fastpath.

I see cleanup patch 3/15 is a consequence of 2/15, let me take a look.

> Anyway, I will look into writing selftests for conntrack-bridge setup,
> including various vlan setups. This will take me some time, which I
> do not have in abundance, so for that I do not know if I get it done
> before the merge window.

There is tools/testing/selftests/net/netfilter/nft_flowtable.sh that
can possibly be extended to improve coverage.

Thanks.

