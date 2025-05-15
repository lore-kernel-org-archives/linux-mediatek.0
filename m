Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 064D9C3ABD8
	for <linux-mediatek@archiver.kernel.org>; Thu, 15 May 2025 02:11:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=opUuODg6Tb9tSSBZq48EzT4DKVXF6IVRUKtiiI894NY=; b=OZoMOGm/mI7FGRq/3D88DlBjo7
	GXwofbmYM2FQxn4CYDGSyxYLt4jiz9SyTRfuOm+8lLnJFnhjsQ8Gf1l+PE5skfKzba/7U5ftuWQsC
	PMv82ECWlnsIxs6vpSV0eAI1GsrSeodxe2FZSkQWkBCJi5GsoqNNSp+6+F1iob1TDNcGYGXpPYWZm
	8zEnniPYZFzK5RZFvHDOJbS4sX1BTwUJzWLSKlyeXM6dIyPPbIAKeTXfGLTg8vSp2Ye1PypbJ1mKV
	SDn8TgoJk5PhwvTv7gHZvDiUY6teHLNOsxbvA5u1dqlZM97wy1UYYTvI0HmCYBpc9+Dldsb+6v8Bd
	BcIc746Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFO4L-0000000Gouk-22WK;
	Thu, 15 May 2025 02:11:33 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFO2C-0000000Gobj-1FOT;
	Thu, 15 May 2025 02:09:21 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id C6FBC5C4221;
	Thu, 15 May 2025 02:07:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3B9F7C4CEE3;
	Thu, 15 May 2025 02:09:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747274958;
	bh=9JLt0pzyhfvU1pbbM+JOpnBKps/nmijZ8yFfJ1YHDWs=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=cuoUFVv2xlfrKtpuWX9A+DndNJWuO5Hfhrzhf9UvU/kUdxx+zhDuSZXHNYyGwloQa
	 uEnz1djkPQnldoc1YbxIveuqyB9Qj53FgTTQX/MX3jL1ffuYX7JOROQPgcA/I2nWtC
	 KSIwuHpyRPV7BWbW9c+bdvwUKBjp3mzEwD45/OT6zMf4puv2D2wHShyqU/4vUPIAVZ
	 puKwkdryhfHaKu1mRH6/5LhUJ5jCDJoXbvzgepf7RfxcXNrbIeEJ0sB09IgLju3u/6
	 yNY8tL8Ovps/7NAqZOXSh718ckMfUaV1AxqeZJ2XldLBcq5Xw9DpvdRzZvz0s5L1w/
	 QLy/LuzJWovvQ==
Date: Wed, 14 May 2025 19:09:17 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Lorenzo Bianconi <lorenzo@kernel.org>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Paolo Abeni
 <pabeni@redhat.com>, Simon Horman <horms@kernel.org>,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 netdev@vger.kernel.org
Subject: Re: [PATCH net] net: airoha: Fix page recycling in
 airoha_qdma_rx_process()
Message-ID: <20250514190917.4b0ff404@kernel.org>
In-Reply-To: <20250513-airoha-fix-rx-process-error-condition-v1-1-e5d70cd7c066@kernel.org>
References: <20250513-airoha-fix-rx-process-error-condition-v1-1-e5d70cd7c066@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250514_190920_387001_27B8F433 
X-CRM114-Status: UNSURE (   8.95  )
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

On Tue, 13 May 2025 18:34:44 +0200 Lorenzo Bianconi wrote:
> Do not recycle the page twice in airoha_qdma_rx_process routine in case
> of error. Just run dev_kfree_skb() if the skb has been allocated and marked
> for recycling. Run page_pool_put_full_page() directly if the skb has not
> been allocated yet.
> Moreover, rely on DMA address from queue entry element instead of reading
> it from the DMA descriptor for DMA syncing in airoha_qdma_rx_process().
> 
> Fixes: e12182ddb6e71 ("net: airoha: Enable Rx Scatter-Gather")

Missed your sign-off.
-- 
pw-bot: cr

