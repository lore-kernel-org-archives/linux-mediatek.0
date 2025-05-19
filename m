Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3CF76C2D0CD
	for <linux-mediatek@archiver.kernel.org>; Mon, 19 May 2025 12:14:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TNIgm8N6rMsasi+vRuU5dR8Rk9ITCZojrP1ljnTFsBY=; b=SIOhdC0ENTZrppA5UioBFIKVqy
	acRZvBgKI6182YBHYhYCN3s6mlTlksTrS7iib44d3Blo8OGTkRMS8A68ScSikjl2I+UguWBVQuvIq
	gVb2JNA3PaD3NG5XT+YXiw/J4cgKpNNEOOiowLjKDNNd4We87azB1F5q6jGqa2tjHpsZ7Tb+bEoaA
	RAehUOPOhSyM/uiWRo6w+wTGyvSXPiUzhPGgLtVKzoiU5Bhb3FygAmiya9ISfbetHIP+Gdnfk/bPQ
	nMUqfpAVZPDtkJ6JsGivkw9AawV94qXakxAR8DssJ9W7hJj0lyLPIQYMH3N6NDQYcwBQzKCGlpVxQ
	4U+xeYxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uGzOM-000000096oh-02wr;
	Mon, 19 May 2025 12:14:50 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uGzKI-000000096NY-0zBL;
	Mon, 19 May 2025 12:10:39 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id E145A5C3F5D;
	Mon, 19 May 2025 12:08:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0CB21C4CEE4;
	Mon, 19 May 2025 12:10:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747656636;
	bh=iSx71zZiXEdCfJvPVC/dxwl7y6YEpL4pKp+tSRhGjSc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XFa7YAI26weKMKIVPZgB4z0Th8+zwWeqaPOyA/K7FN+uOmLdhEQUZ8pkFOlsm9MVV
	 740cgXLshUxXiFbL2JWQiyFXyIQeqmt6yny3LQS01eAuJwVZvWTfNU2xbQFADt1v4D
	 Huf3B+4giSIg2BK2JptSLNEVZ3MZZoyux34cffHGs9qvCcLzyIGK2KcyZr/l+CoLDs
	 u8ycl/0DK7FVk1hxSdJyyY2WPG3Oj59hZvaTPsg3Gz7cW6zioAUkak4Giyr31IxIb5
	 kR07cjNyttKz32d/e0ibtubexqBdfoNdnOQTfeId/5eTwkA6Eucz2BsBxXHExgzR/5
	 jAx8yrYZDPvFw==
Date: Mon, 19 May 2025 13:10:32 +0100
From: Simon Horman <horms@kernel.org>
To: Lorenzo Bianconi <lorenzo@kernel.org>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, netdev@vger.kernel.org
Subject: Re: [PATCH net-next v2 2/3] net: airoha: Add FLOW_CLS_STATS callback
 support
Message-ID: <20250519121032.GF365796@horms.kernel.org>
References: <20250516-airoha-en7581-flowstats-v2-0-06d5fbf28984@kernel.org>
 <20250516-airoha-en7581-flowstats-v2-2-06d5fbf28984@kernel.org>
 <20250519094637.GE365796@horms.kernel.org>
 <aCsAItPcz_9CuxaP@lore-desk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aCsAItPcz_9CuxaP@lore-desk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250519_051038_327526_F5AE34B1 
X-CRM114-Status: GOOD (  15.10  )
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

On Mon, May 19, 2025 at 11:55:46AM +0200, Lorenzo Bianconi wrote:
> On May 19, Simon Horman wrote:
> > On Fri, May 16, 2025 at 10:00:00AM +0200, Lorenzo Bianconi wrote:
> > 
> > ...
> > 
> > > @@ -1027,6 +1255,15 @@ int airoha_ppe_init(struct airoha_eth *eth)
> > >  	if (!ppe->foe_flow)
> > >  		return -ENOMEM;
> > >  
> > > +	foe_size = PPE_STATS_NUM_ENTRIES * sizeof(*ppe->foe_stats);
> > > +	if (foe_size) {
> > 
> > Hi Lorenzo,
> > 
> > It's unclear to me how foe_size can be zero.
> 
> Hi Simon,
> 
> foe_size will be 0 if you disable CONFIG_NET_AIROHA_FLOW_STATS since in this
> case PPE_STATS_NUM_ENTRIES will be 0.

Thanks,

I see that now but for some reason it escaped me earlier.

With that cleared up this patch looks good to me.

Reviewed-by: Simon Horman <horms@kernel.org>



