Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45C87C678DC
	for <linux-mediatek@archiver.kernel.org>; Fri, 18 Aug 2023 12:12:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Wn9HxSSTI99LS97o3YV2y4ptzbe3QN/VsemY6P/FX34=; b=nrclvUZ0hwIMQDWUq9e05u5ein
	NlFhNt92v7aGspV3MYNdNd3uJciEIcNiQHBkJ+fOl/7CnwipWjqgZ8lWMnYPrE7wS8/NIMAOXHi2S
	mzOCnoS5Kxp2/c4YN80RkvXHEMle5s3ILwA51Kwu2ZPDMqvVWyMhpYayaX/yL6y9wCLZ4K2TzyaJo
	8y3yav3+urXg5PZNie/dTLSYQ8s0a++mvedjM+2wnQcaAbU2dUcuq/aGW3Lw2ymw9ZWbk330/p6fW
	GQYpNA9z1aXA9FUzuLWGcFd4nNAh1huPRA8J2yaRws1pTubWVYCgnzBJ8MBuOwmYcQ3Ynaif1f0NN
	1cXvgs9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qWyLH-0095wc-09;
	Fri, 18 Aug 2023 12:12:39 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qWyLD-0095uD-2z;
	Fri, 18 Aug 2023 12:12:37 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 57FE062352;
	Fri, 18 Aug 2023 12:12:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9E724C433C7;
	Fri, 18 Aug 2023 12:12:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1692360754;
	bh=NBGFt5eEWfHJ21aKAdl7v+uvCkOurbbahAK/Or24JXM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=edr1+ub/Irb20ndnP3vetXj19FArIYcRWluZgt20aX5H/TdrS4m8JMj8n5T5PDSqB
	 RAZhBhVLBT25GJE6C4vDq0Ml45ScJsjlm2wCmU4mcXw8SsYp0GJZqAyXouZ8vCU4iy
	 YPGfCQC0ENVp4QsOrsUQ2ZjDhLRWF0L9CLxQ7HeMXewKAVJwRMTh7qZ5dfoJ9Niaok
	 nETvJMSeJbiiVEy8l+J7Y1LEjme12lkHKVf7PBe5F6j9ltgA+46T7wRcPvaqqaXEvm
	 AtM1UznmoYACuEE56uQMpmAlG+fsW7NzKO2NLo+9Je2f2cnnGnpRSeqhwiZTC96t0u
	 uGIjLfYdh754g==
Date: Fri, 18 Aug 2023 14:12:29 +0200
From: Simon Horman <horms@kernel.org>
To: Daniel Golle <daniel@makrotopia.org>
Cc: Felix Fietkau <nbd@nbd.name>, John Crispin <john@phrozen.org>,
	Sean Wang <sean.wang@mediatek.com>,
	Mark Lee <Mark-MC.Lee@mediatek.com>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Sujuan Chen <sujuan.chen@mediatek.com>, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH net] net: ethernet: mtk_eth_soc: fix NULL pointer on hw
 reset
Message-ID: <ZN9gLcMOsB220R5F@vergenet.net>
References: <6863f378a2a077701c60cea6ae654212e919d624.1692273610.git.daniel@makrotopia.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6863f378a2a077701c60cea6ae654212e919d624.1692273610.git.daniel@makrotopia.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230818_051236_012604_B452B6B4 
X-CRM114-Status: GOOD (  12.19  )
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

On Thu, Aug 17, 2023 at 01:01:11PM +0100, Daniel Golle wrote:
> When a hardware reset is triggered on devices not initializing WED the
> calls to mtk_wed_fe_reset and mtk_wed_fe_reset_complete dereference a
> pointer on uninitialized stack memory.
> Initialize the hw_list will 0s and break out of both functions in case
> a hw_list entry is 0.
> 
> Fixes: 08a764a7c51b ("net: ethernet: mtk_wed: add reset/reset_complete callbacks")
> Signed-off-by: Daniel Golle <daniel@makrotopia.org>

Reviewed-by: Simon Horman <horms@kernel.org>


