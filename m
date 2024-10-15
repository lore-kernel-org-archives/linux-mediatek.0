Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4498FD216B0
	for <linux-mediatek@archiver.kernel.org>; Tue, 15 Oct 2024 14:34:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qiIdI+oKKf7EnhVJ9UTp2/T9X1iGlVqfTw1ubb8h0MU=; b=LtPTbKXOZ95am+E6DzKs9oz4P5
	M6UqGIWm/t5y/fgkFEMwTWN39HudiolO53d5aYVsTZEBFylWlN7zyqSvGrpVtrSFwFsOvynBlLQwB
	mCYQKTwsQKwrCehJlMRwTHuEcaNtSNc86ulbc6afnW/WO9XD7fwjioc7FRzguFqK0UZNpaVKfIICF
	PV/jvYphn6btb8lVpzLiLqp8y68qVmB+Tg21+2zIr+waXBS3A3cXTWM5ERzd51KD8niG/E/kPHg9N
	S+f3RSh3P8TKrX9xM+E9GEuRjcdh3ZDk5NxzfHzzPy3JxH8fzjWR6ys8k2Fa7sf7zlUPROicrSiX1
	KBCoNGuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t0id3-00000008WuN-42wY;
	Tue, 15 Oct 2024 14:34:29 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t0iba-00000008WcQ-0tuV;
	Tue, 15 Oct 2024 14:32:59 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 52C5BA418F4;
	Tue, 15 Oct 2024 14:32:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 67D66C4CECF;
	Tue, 15 Oct 2024 14:32:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729002777;
	bh=qiIdI+oKKf7EnhVJ9UTp2/T9X1iGlVqfTw1ubb8h0MU=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=hc9G1Z1Efr+MQFhbIYFxZW5fRw3i2SaqqyRekw29bIHD7b+7ONrDfVlLdehPrNOs6
	 LRjuZVWnllcBrtbv6+fjnSKjEFqTUkC6Nc39en0PDl6pQF9GXeWeObklF8XqfzHfNE
	 G0JwdeHgWNJfFK6OuU/U3ySXaDCuXopuT/m/kzKrchWHQrPX8bJZ7Xt4X1ot6YIt2y
	 mlfR3eNeu4AO9/ptLwLYNaUnJinhOE//kzQl8A59WMR6EXNamg+/xBAuMOJYuPVoyN
	 bHcEkSaTq5g+K06G7XHolHUW+8am0ZQ2I8JSqg2mRy48rtVANI3bLI43+GgGnMjxFt
	 rarUoOMJnU5Xw==
Date: Tue, 15 Oct 2024 07:32:55 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Lorenzo Bianconi <lorenzo@kernel.org>
Cc: Felix Fietkau <nbd@nbd.name>, Sean Wang <sean.wang@mediatek.com>, Mark
 Lee <Mark-MC.Lee@mediatek.com>, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 netdev@vger.kernel.org, upstream@airoha.com
Subject: Re: [PATCH net-next v2] net: airoha: Implement BQL support
Message-ID: <20241015073255.74070172@kernel.org>
In-Reply-To: <20241012-en7581-bql-v2-1-4deb4efdb60b@kernel.org>
References: <20241012-en7581-bql-v2-1-4deb4efdb60b@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241015_073258_348819_9EE941CE 
X-CRM114-Status: UNSURE (   9.86  )
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

On Sat, 12 Oct 2024 11:01:11 +0200 Lorenzo Bianconi wrote:
> Introduce BQL support in the airoha_eth driver reporting to the kernel
> info about tx hw DMA queues in order to avoid bufferbloat and keep the
> latency small.

TBH I haven't looked at the code again, but when I looked at v1 I was
surprised you don't have a reset in airoha_qdma_cleanup_tx_queue().
Are you sure it's okay? It's a common bug not to reset the BQL state
when queue is purged while stopping the interface.

