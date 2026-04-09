Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2637EA3C59
	for <linux-mediatek@archiver.kernel.org>; Thu,  9 Apr 2026 13:54:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=24hA1l9NAmNo3LU0r4Q8hfjssSJC6vwBl2Dt0Dwe1A4=; b=zpcJUZ4+sIYXEUAWCX071kkKxD
	/tWv+vewj2jXKYOSoaeqTZ3mMX+w9Yip6dISu3VLtNvFb7i/Gn7am+tZMapwr2+rmFiIbk22O4Ipv
	wS83xbmqJ0KVRl4mcAgiUDagNgAzAxEgO4ou02g1jQ+sfFozLzp1tI4a9oK+emU6lBDMpeFFOAWFT
	1FEbZ8J8sV7wyxscVna8pDcKF41P7cuxyEKNCky6vXGEZRaUkqZ640XfgRoIrW4Tfh8/x2zWa2BE0
	In5nVldd+on1gRxCBEZYOZxehvgJnr/hgqWHAVfd7ulXEHDAd2byfI2pc9VgbCeyy3XcLNFa3DImn
	kgYdch4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAppZ-0000000AbBA-0e7e;
	Thu, 09 Apr 2026 13:54:13 +0000
Received: from mail.netfilter.org ([217.70.190.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wApoY-0000000AaWx-0v5x;
	Thu, 09 Apr 2026 13:53:27 +0000
Received: from netfilter.org (mail-agni [217.70.190.124])
	by mail.netfilter.org (Postfix) with UTF8SMTPSA id 23EDC60179;
	Thu,  9 Apr 2026 15:52:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=netfilter.org;
	s=2025; t=1775742764;
	bh=24hA1l9NAmNo3LU0r4Q8hfjssSJC6vwBl2Dt0Dwe1A4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NdyAj/K3A2fPx/giXVVKQfyeH1WrYGjmd5lMbaoH1QqoyrngAHcQzJ3fRY/9OoY1A
	 NjZ6OQLJnbvbkIOfUfmcyapser63R/ikzngMBy2uW/5y45Zh3PNUUcVWIyhtNJdlIO
	 BDcFCa5yWR1P01MYbLfQgaBmyr49Ai8Iz9nPqwuuw5ARrwxQ6LhMv+FCWUtQX8zSrr
	 aSY7vcjWtGcJ/BCtwkDNumkVzR7KzNlcAyi9gPan7X+vn0zG4aXjXkcDin0MeXZe6+
	 ZCGJSK4iUmtZMnfkXlRBA1texNhTbl4s2z7GndweiSlFXJfrHzWsBco+zErMdXGCP+
	 RDDEAuVznrUMg==
Date: Thu, 9 Apr 2026 15:52:41 +0200
From: Pablo Neira Ayuso <pablo@netfilter.org>
To: Daniel Golle <daniel@makrotopia.org>
Cc: Felix Fietkau <nbd@nbd.name>, John Crispin <john@phrozen.org>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Simon Horman <horms@kernel.org>, Florian Westphal <fw@strlen.de>,
	Phil Sutter <phil@nwl.cc>, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, netfilter-devel@vger.kernel.org,
	coreteam@netfilter.org
Subject: Re: [PATCH RFC net-next 0/4] improve hw flow offload byte accounting
Message-ID: <adevKeasLkEB5zZ4@chamomile>
References: <cover.1775739840.git.daniel@makrotopia.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <cover.1775739840.git.daniel@makrotopia.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260409_065305_515764_60448F6E 
X-CRM114-Status: GOOD (  17.10  )
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

On Thu, Apr 09, 2026 at 02:07:22PM +0100, Daniel Golle wrote:
> Hardware flow counters report raw byte counts whose semantics
> vary by vendor -- some count ingress L2 frames, others egress
> L2, others L3. The nf_flow_table framework currently passes
> these bytes straight to conntrack without conversion, and
> sub-interfaces (VLAN, PPPoE) that are bypassed by hw offload
> never see any counter updates at all.

I see, but that is part of the feature itself? Why pretend that these
interface are really seeing traffic while they don't. This aspiration
of trying to do all hardware offload fully transparent (when it is not
the case, not mentioning semantic changes in how packet handling is
done compared to the software plane) does not sound convincing to me.

On top of this, this issue also exists in the software plane: Devices
that are bypasses do not get their counters bumped.

Maybe if this is really a requirement, then this should address the
issue for software too, but is it worth the effort to add
infrastructure for this purpose?

> This series lets drivers declare what their counters represent,
> so the framework can normalize to L3 for conntrack and
> propagate per-layer stats to encap sub-interfaces.
> 
> Questions:
>  - Sub-interface stats accesses vlan_dev_priv() directly --
>    should there be a generic netdev callback instead?
>  - Are there hw offload drivers whose counters do not fit the
>    ingress-L2 / egress-L2 / L3 model?
> 
> Daniel Golle (4):
>   net: flow_offload: let drivers report byte counter semantics
>   nf_flow_table: track sub-interface and bridge ifindex in flow tuple
>   nf_flow_table: convert hw byte counts and update sub-interface stats
>   net: ethernet: mtk_eth_soc: report INGRESS_L2 byte_type in flow stats
> 
>  .../net/ethernet/mediatek/mtk_ppe_offload.c   |   1 +
>  include/net/flow_offload.h                    |   7 +
>  include/net/netfilter/nf_flow_table.h         |   5 +
>  net/netfilter/nf_flow_table_core.c            |   2 +
>  net/netfilter/nf_flow_table_offload.c         | 174 +++++++++++++++++-
>  net/netfilter/nf_flow_table_path.c            |   8 +
>  6 files changed, 195 insertions(+), 2 deletions(-)
> 
> -- 
> 2.53.0

