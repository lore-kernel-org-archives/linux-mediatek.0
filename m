Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D009EB64DD
	for <linux-mediatek@archiver.kernel.org>; Tue, 25 Jul 2023 21:12:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Q2QDLzi9+YF0NoCFk8x0Z498RmWmOmi60z+45b3Pngo=; b=hAvoZDKr2TydUZK3bdg84/Jhwb
	Wk9XBiE9wz5XrRm6xfd4Fw8JsSywyEaYA9nJSuMUAuSS6p1ye6HzeLGaBSRd4E95g7NduMCjS5IUp
	xZ+p8zKMNCmbOqAa6qospT2ef88iRNuZFi5iNL6YYaa1HPTiCJkeOWL6tmgoUQeXLHimfYn0Elh9j
	VzCz7Kxq+mYDRp+RI26UYKr6U92zirZH2zIASljSMPDA0kpeJ45Gno9hqd/o2XPY6mQkvnsOPlGxm
	m6CY0QnVK6etse4bhNtKDsyVnEBvKmM9V3OL+nFLaX6dWW78PxYgSbrcQVpeCyR0UH8nRq9CbMmbB
	LKeObLMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qOPKY-008VzD-2I;
	Tue, 25 Jul 2023 21:12:30 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qOPKV-008VyJ-1h;
	Tue, 25 Jul 2023 21:12:28 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 0D81D6190B;
	Tue, 25 Jul 2023 21:12:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 48769C433C9;
	Tue, 25 Jul 2023 21:12:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1690319545;
	bh=+wjx3PSEq0K5+Aw7/+zFEoqif9hytq8mg416yZy/nHU=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=oDwGVunkHA4n7n03Gl8jk70U5ZjAYv48eGM6EMyCNpK27QgccD7LYKF9E3dH97YFT
	 cqvhh48Z9nPUtchSJ/KbUX3zg0yMj4pX5j5/0Xn/ZvzJ6HIn4FMUmu7H3wKLHN0PXK
	 zXoixoE1xRJinOW8sELWeoVoJKBphIpInvne8i+89HCy9OGrw636tFTmEixYbzEqkP
	 yLrrITncMcu6w3VjQYDrfxrpNKUJwxhHRYgfv6WcW5N3LhGttkAyegjJfYv0C61xul
	 pibX3ENru+yDIDv+zRTFwZbHQNBe0UH7lTDvydbQSgYvKj+dw/O78BZVL3tdK2a5aO
	 65imaNtu1zwLw==
Date: Tue, 25 Jul 2023 14:12:23 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Ilias Apalodimas <ilias.apalodimas@linaro.org>
Cc: Yunsheng Lin <linyunsheng@huawei.com>, davem@davemloft.net,
 pabeni@redhat.com, netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 Alexander Lobakin <aleksander.lobakin@intel.com>, Eric Dumazet
 <edumazet@google.com>, Wei Fang <wei.fang@nxp.com>, Shenwei Wang
 <shenwei.wang@nxp.com>, Clark Wang <xiaoning.wang@nxp.com>, NXP Linux Team
 <linux-imx@nxp.com>, Sunil Goutham <sgoutham@marvell.com>, Geetha sowjanya
 <gakula@marvell.com>, Subbaraya Sundeep <sbhatta@marvell.com>, hariprasad
 <hkelam@marvell.com>, Saeed Mahameed <saeedm@nvidia.com>, Leon Romanovsky
 <leon@kernel.org>, Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann
 <daniel@iogearbox.net>, Jesper Dangaard Brouer <hawk@kernel.org>, John
 Fastabend <john.fastabend@gmail.com>, Felix Fietkau <nbd@nbd.name>, Lorenzo
 Bianconi <lorenzo@kernel.org>, Ryder Lee <ryder.lee@mediatek.com>, Shayne
 Chen <shayne.chen@mediatek.com>, Sean Wang <sean.wang@mediatek.com>, Kalle
 Valo <kvalo@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 linux-rdma@vger.kernel.org, bpf@vger.kernel.org,
 linux-wireless@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
Subject: Re: [PATCH net-next v2] page_pool: split types and declarations
 from page_pool.h
Message-ID: <20230725141223.19c1c34c@kernel.org>
In-Reply-To: <ZL/fVF7WetuLgB0l@hera>
References: <20230725131258.31306-1-linyunsheng@huawei.com>
	<ZL/fVF7WetuLgB0l@hera>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230725_141227_629037_421971FE 
X-CRM114-Status: GOOD (  12.33  )
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

On Tue, 25 Jul 2023 17:42:28 +0300 Ilias Apalodimas wrote:
> Apologies for the very late replies, I was on long vacation with limited
> internet access.
> Yunsheng, since there's been a few mails and I lost track, this is instead of
> [0] right? If so, I prefer this approach.  It looks ok on a first quick pass,
> I'll have a closer look later.
> 
> [0] https://lore.kernel.org/netdev/20230714170853.866018-2-aleksander.lobakin@intel.com/


I prefer the more systematic approach of creating a separate types.h
file, so I don't have to keep chasing people or cleaning up the include
hell myself. I think it should be adopted more widely going forward,
it's not just about the page pool.

