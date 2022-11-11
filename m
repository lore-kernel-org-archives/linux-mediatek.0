Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65B86C433FE
	for <linux-mediatek@archiver.kernel.org>; Fri, 11 Nov 2022 02:10:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pHJb6eAG+2CiHS4e1oYI92e5vroUitehSfx71dm2Ubk=; b=GrhHH+LPQnoELY5Ba7mUJJU+xy
	B8lXTva/bWh2lYepZkmg7qgHzaZaQP3Olhu/Fk81KJ2cnXL9YGgTdGILPYEFydqF04wNGgdwkNxF7
	00oY0MB7OCUCvN3tHVOqLskeZ9G00YIMzcd7kF3Tn0gCY71bl956jUBW0LWfuy5nFWzp07IEKY9CM
	GmJyrJDu2ekQicNVPDshRPbCwrvT5fgHN59GryugWs+0IoZA7I5JDUvs7L0QVUdsSTr24bxGVWY6W
	0dXUUJQDZ3/6giZsleZL9jSyIruBy5gz3ADEZwnnJADeYvgXPkAvI8gtQnOHKWzRLENDZoCKtV57J
	2ejyzJ3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1otJUV-00C47d-T8; Fri, 11 Nov 2022 02:09:59 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1otJUI-00C44j-RG; Fri, 11 Nov 2022 02:09:48 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id C7F0B6199B;
	Fri, 11 Nov 2022 02:09:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CC8E5C433D7;
	Fri, 11 Nov 2022 02:09:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1668132583;
	bh=qcXT7KsM5AB7BhN9n5UAOoecfPi2ohVfDNCAo8pmWak=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=BOWE3xASGTo5opUTU8n+qd6emXvNL4zBwG74lih/1WEmy+PNHIwvmzgCgVTU2IHSS
	 AAsn7ZLfk1l6dVi9t2VwT0/dOTi9/iZKnNoTnWC50RO3jhOvuSqfj6By3GNDoL0MHM
	 CjeAKkXKacSUAch/n80gUJK11yEn/qWRCg0My80tEHQe5i1GazAJM2T6tQU+v2jZ9X
	 RdB9Sv8BB9P6bM5MDhRKcV8mQYgTxOa3wcDxGtQkoJh+OTHFU1ONmGZc/KdjinFwj4
	 w3dvHijRNpqrO3ZDfSZvgWkm6QLdfApI3TSlyJqVGid9eIqUHsKOTlLkDIr3JEM1Oh
	 oTbAGcfhs8y+g==
Date: Thu, 10 Nov 2022 18:09:41 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: Felix Fietkau <nbd@nbd.name>
Cc: netdev@vger.kernel.org, John Crispin <john@phrozen.org>, Sean Wang
 <sean.wang@mediatek.com>, Mark Lee <Mark-MC.Lee@mediatek.com>, "David S.
 Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Paolo
 Abeni <pabeni@redhat.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 Vladimir Oltean <olteanv@gmail.com>, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH net-next v2 11/12] net: ethernet: mtk_eth_soc: set
 NETIF_F_ALL_TSO
Message-ID: <20221110180941.11eff62e@kernel.org>
In-Reply-To: <20221109163426.76164-12-nbd@nbd.name>
References: <20221109163426.76164-1-nbd@nbd.name>
	<20221109163426.76164-12-nbd@nbd.name>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221110_180946_979957_ED454D1E 
X-CRM114-Status: UNSURE (   8.30  )
X-CRM114-Notice: Please train this message.
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

On Wed,  9 Nov 2022 17:34:25 +0100 Felix Fietkau wrote:
> Significantly improves performance by avoiding unnecessary segmentation

NETIF_F_TSO_ECN is the bit that matters here, right?
It'd be reassuring if the commit message mentioned it and confirmed 
it works correctly :S

