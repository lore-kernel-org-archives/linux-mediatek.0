Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 753E0CF3941
	for <linux-mediatek@archiver.kernel.org>; Thu, 19 Sep 2024 13:55:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=v5JzKRqFaPOEb4Gzm+JhyGuBGDDhLvBoijaHqdUNzjI=; b=ycfXHnc7p+VtXTIj/I2+LxKVK1
	CgZ3PpmjZGa1zSM2+m5jufO7RQklopdHuh5P9R3Qd5ZD+9YGa8X/FHH64alvWLhiNK0Z8SFKDz6t9
	5rMXGfsn9nakc0sccTqubCC77W2y7nYCGub56okwKBLjq5blrC+1IchYgB1td6zYTEZdUhn8Wjmtz
	Cp+5V5UZ56k8PQIyE6ChE3YBnk7fIU6VHPgmuqWZRjyez+KjtOsyzvtJb5IwaHV7N2uwrv2+D+jCT
	9vXZAOJr0+JxyqQAgRgxgKkO6gVADpGZOj8swL06YvSouQrokNhh16hkyeF8vFo0cm1T+I7iDiK0v
	FIoREnYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1srHdU-0000000AOGF-0VI5;
	Thu, 19 Sep 2024 13:55:56 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1srHa9-0000000ANkE-1yOK;
	Thu, 19 Sep 2024 13:52:30 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 790015C308B;
	Thu, 19 Sep 2024 13:52:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F0C5DC4CEC4;
	Thu, 19 Sep 2024 13:52:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726753947;
	bh=gP3LMpD1WBhkOoq19t4rJZisO7I+afdMCW4t9vEvs8w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=W3XjLe0DEBS2HPrqWy5Mjnqhu1yn31qz7AFiKDyvc4ERag2NTwERrtcWq8+AC+DH5
	 eNy1OiSIK9ROxY4UlGdm8dpshHvR/DLpT/PnQ7j9D3jEMTnXbWf1S+c9S542D9+E3o
	 dHZ7a6mEceYIPS18M00IEZMpDOW60bgatoJOSs4K7FUKgTsTemUY6w8OcK0ou8MWNQ
	 z3m37YI+r063wKP5BYrfaPFIZXH7Gn89zUdhWDftlg1d6B9Uw9OlFV2ihaIovoj/iq
	 T7SvvdlTnVG7RNKfi2c8w5Ia0wfornwZHYNTrotTXKuDKy5Z3tYqhOMYwDzsS0v1+4
	 yglWWSzSYh1Dg==
Date: Thu, 19 Sep 2024 14:52:22 +0100
From: Simon Horman <horms@kernel.org>
To: Lorenzo Bianconi <lorenzo@kernel.org>
Cc: Felix Fietkau <nbd@nbd.name>, Sean Wang <sean.wang@mediatek.com>,
	Mark Lee <Mark-MC.Lee@mediatek.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, netdev@vger.kernel.org,
	upstream@airoha.com, Sayantan Nandy <sayantan.nandy@airoha.com>
Subject: Re: [PATCH net] net: airoha: fix PSE memory configuration in
 airoha_fe_pse_ports_init()
Message-ID: <20240919135222.GC1571683@kernel.org>
References: <20240918-airoha-eth-pse-fix-v1-1-7b61f26cd2fd@kernel.org>
 <20240919074210.GE1044577@kernel.org>
 <Zuwf57d09WBYKtSS@lore-desk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Zuwf57d09WBYKtSS@lore-desk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240919_065229_581912_C000054B 
X-CRM114-Status: GOOD (  24.29  )
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

On Thu, Sep 19, 2024 at 02:58:15PM +0200, Lorenzo Bianconi wrote:
> > On Wed, Sep 18, 2024 at 04:37:30PM +0200, Lorenzo Bianconi wrote:
> > > Align PSE memory configuration to vendor SDK. In particular, increase
> > > initial value of PSE reserved memory in airoha_fe_pse_ports_init()
> > > routine by the value used for the second Packet Processor Engine (PPE2)
> > > and do not overwrite the default value.
> > > Moreover, store the initial value for PSE reserved memory in orig_val
> > > before running airoha_fe_set_pse_queue_rsv_pages() in
> > > airoha_fe_set_pse_oq_rsv routine.
> > 
> > Hi Lorenzo,
> 
> Hi Simon,

Hi Lorenzo,

> > 
> > This patch seems to be addressing two issues, perhaps it would be best
> > to split it into two patches?
> 
> ack, I will do.

Thanks.

> > And as a fix (or fixes) I think it would be best to describe the
> > problem, typically a user-visible bug, that is being addressed.
> 
> This is not a user-visible bug, do you think it is better to post it to
> net-next (when it is open)?

Yes, I think that would be best.

If you do so please don't included any Fixes tags.
Instead, if you want to refer to a patch, use the
following syntax within the patch description.
AFAIK, unlike Fixes tags, it may be line wrapped as appropriate.

commit 23020f049327 ("net: airoha: Introduce ethernet support for EN7581 SoC")

> 
> Regards,
> Lorenzo
> 
> > 
> > > Fixes: 23020f049327 ("net: airoha: Introduce ethernet support for EN7581 SoC")
> > > Tested-by: Sayantan Nandy <sayantan.nandy@airoha.com>
> > > Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
> > 
> > ...



