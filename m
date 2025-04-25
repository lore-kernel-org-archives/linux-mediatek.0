Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DA9EC369D5
	for <linux-mediatek@archiver.kernel.org>; Fri, 25 Apr 2025 11:59:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JgXBBnWi0uIkNeEB5o6NTaG1+2XeK+GQm7cn+WLAW74=; b=p1E0kphHa5obeSSTIvTJsc7xwS
	nLzsLwY1dhatg/axjyK/JPBpB2CC2Vvu510GYDfsYh5td5+Iv8iwLUfUIiy0pvUT/4+4B3p6FacX3
	c85Sdw4xYi3adp6dEWLz6fwl7vPYa7RCi4F3/RZb/Gq/DSMCl52YxOaXwBmwzyL+aPgjJyCFZ1c+I
	q+KXraalH2THiOSCBS8xX7cuxOwcIlVxyY1thb7Ef1xEWBi5sebiQbgWZefZQgV4f4JBsGqAZs5ZZ
	cF69HIQSe/dM7ur/aIbbSQob/TJIkv3Nd7Ggw8HsgFdLQd+MdkQZReiluCk8TjY8DsuJxI6ZZfyHz
	LlpwzYWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8HiZ-0000000H2pr-2Sw1;
	Fri, 25 Apr 2025 11:59:43 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8GB1-0000000Gi71-1EOO;
	Fri, 25 Apr 2025 10:20:59 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 63F6860007;
	Fri, 25 Apr 2025 10:20:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D8471C4CEEB;
	Fri, 25 Apr 2025 10:20:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745576454;
	bh=jcAtdlYTfa1RC2cu9dSkGODwfuS/DqnkQIJyB/0DwRY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NdlX7sD02k7fzLbQiCInydO04W7vNrrsSFK46wdHTBwTPZqMbEB24s9kLeSGsLHmI
	 m2ALbZgzluFz8vkpMwt1JsUjPJCkkDzWfFnmE3QoazXWQALiM8lMu8iPbnmPR2bte0
	 0hilI4WmcaAphIiYWf4Ilnj32DR9ln6y53qULzVIz3J4rCkimtfGXhZfb3NMnxy2HI
	 cqDbc7MJKHXc7jIPAQ1k8eK7ImF7jevVYdOYqnCMJdIxsV/HXWDR5MAGtUR8c6TDPS
	 7agCVTMwigx5V92d4pFvMyu8mfk9IXs6PCqLKQjeUcLz7g6DO2kfL4kQ7QKF+deZ1J
	 xKQ6HeRgQxMpQ==
Date: Fri, 25 Apr 2025 11:20:50 +0100
From: Simon Horman <horms@kernel.org>
To: Johannes Berg <johannes@sipsolutions.net>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Johannes Berg <johannes.berg@intel.com>
Subject: Re: [PATCH net-next] net: ethernet: mtk_wed: annotate RCU release in
 attach()
Message-ID: <20250425102050.GO3042781@horms.kernel.org>
References: <20250423150811.456205-2-johannes@sipsolutions.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250423150811.456205-2-johannes@sipsolutions.net>
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

On Wed, Apr 23, 2025 at 05:08:08PM +0200, Johannes Berg wrote:
> From: Johannes Berg <johannes.berg@intel.com>
> 
> There are some sparse warnings in wifi, and it seems that
> it's actually possible to annotate a function pointer with
> __releases(), making the sparse warnings go away. In a way
> that also serves as documentation that rcu_read_unlock()
> must be called in the attach method, so add that annotation.
> 
> Signed-off-by: Johannes Berg <johannes.berg@intel.com>

Reviewed-by: Simon Horman <horms@kernel.org>

Thinking out loud:

* Without this patch I see the following, but with this patch I do not.

  .../mt7915/mmio.c:636:5: warning: context imbalance in 'mt7915_mmio_wed_init' - wrong count at exit
  .../mt7996/mmio.c:302:5: warning: context imbalance in 'mt7996_mmio_wed_init' - wrong count at exit

* The only implementation of this callback I found is mtk_wed_attach
  which is already annotated as __releases(RCU);

* The only caller of this callback I could find is mtk_wed_device_attach()
  which takes rcu_read_unlock(). And the the callback needs to release it
  to avoid imbalance.

