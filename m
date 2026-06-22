Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85C62CD98F2
	for <linux-mediatek@archiver.kernel.org>; Mon, 22 Jun 2026 12:31:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YrvQZarvBaqo6562x1DTyzlBVnEuUX8qf3CFw17g3xc=; b=r58OjhZxub0D6iF7vlN2MrTjKN
	TLiW4eXYY+QS9DjX12MjiM1GEDp6uDttv0NNm8XoxaddVvalKiCQiEoixzJfcg+UhqoiP1uRnYEPb
	OOovrohotr1AotyhH5vL7nGtmEu70LSce/beWDvH3vlo9vCu92NCZRjJPk1BzOrDCYJTV8n71uQxF
	/QzeFVS4tZhkFLsEz+YnAOcj2ar1qRbCC0UEvUoRVLRVCt6YX29JjBNqWd0wBlRonthyayHboe/sf
	fjDVKzFKQ5HOf8NceD2FKlspJQdntgC+NZG+5D/0mH5YdR4jLj29tmKbgpeRX9P4B5U/OPfI13fOT
	3HgJdAxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbdoW-00000004xvS-1FYJ;
	Mon, 22 Jun 2026 12:31:44 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbdoV-00000004xvF-01Pd;
	Mon, 22 Jun 2026 12:31:43 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id DDC546008A;
	Mon, 22 Jun 2026 12:31:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A9F871F00A3A;
	Mon, 22 Jun 2026 12:31:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782131500;
	bh=YrvQZarvBaqo6562x1DTyzlBVnEuUX8qf3CFw17g3xc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=YrmOh2GVwMxg8umpXDDmyE1exfsL/3W5IXzdl9M4lKtjZdzGaOAw0FwiSGILT5ysv
	 SOMcqFdC/oIoVFOf0bF2VrLi7PvTouGdEhHEYVQ9emHRpj7fDCDYGYLuv+ugHVTX08
	 xoV42t0/CFp6+GvWx7Ro587G7hklkQxALmebqc+gL8W80fviKakDHkUOMWTOEzzass
	 fG5PSUmxQ4cyE/Cc40+WYN50pRn+1xyDYqn9Wk3GWM648r4Ut/6yOFsOlBZSo3ORR6
	 08iBrjgIW+POD43DEg1f4qgpdPCQnijF2aDR5hg67jeGKm84I+REbTuawJGsM6LoIN
	 JHJwKcwSbiO8Q==
Date: Mon, 22 Jun 2026 13:31:36 +0100
From: Simon Horman <horms@kernel.org>
To: Lorenzo Bianconi <lorenzo@kernel.org>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Wayen Yan <win847@gmail.com>, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, netdev@vger.kernel.org
Subject: Re: [PATCH net v2 2/2] net: airoha: fix netif_set_real_num_tx_queues
 for sparse QoS channels
Message-ID: <20260622123136.GC827683@horms.kernel.org>
References: <20260619-airoha-qos-fixes-v2-0-5c43485038f9@kernel.org>
 <20260619-airoha-qos-fixes-v2-2-5c43485038f9@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260619-airoha-qos-fixes-v2-2-5c43485038f9@kernel.org>
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

On Fri, Jun 19, 2026 at 01:37:14PM +0200, Lorenzo Bianconi wrote:
> airoha_tc_htb_alloc_leaf_queue() assigns queue IDs based on the channel
> index (opt->qid = AIROHA_NUM_TX_RING + channel), but updates
> real_num_tx_queues with a simple increment (num_tx_queues + 1). When QoS
> channels are allocated sparsely (e.g., channels 0 and 3 without 1 and
> 2), the returned qid can exceed real_num_tx_queues, causing out-of-bounds
> accesses in the networking stack.
> For example, allocating channel 0 then channel 3 results in
> real_num_tx_queues = 34 but qid = 35, which is out of range [0, 34).
> Fix this by computing real_num_tx_queues based on the highest active
> channel index rather than using a simple counter, in both the allocation
> and deletion paths.
> 
> Fixes: ef1ca9271313b ("net: airoha: Add sched HTB offload support")
> Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>

Thanks for the update since v1.

Reviewed-by: Simon Horman <horms@kernel.org>

FTR, there is an AI-generated review of this patch on sashiko.dev.
I do not think that should impede the progress of this patch but
you may want to consider it in the context of follow-up.

