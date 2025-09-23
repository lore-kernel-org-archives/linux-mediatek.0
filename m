Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29A5BCAC5AC
	for <linux-mediatek@archiver.kernel.org>; Tue, 23 Sep 2025 18:55:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=drxIXaPXBtsRIpVJDSPkYHIfwNfXAAYlvGH6lrGGt3A=; b=qJmronlJtgqOIkAu5q/tgoYyHF
	d5UrZWDnlguzgcqdRIgwrInOzVSTq1+4u0LAD7ooCGkICjgxM6GQKHCmRVMFYq2O3C+a/FxruYa7/
	GJEnFx9Tv0bF/1zUk5+e8r8Dyy+2sg7WOw3AbCqrxPTLZ/aHtqZom5yD9J0xOquodoCavxa3f3+Zj
	2pg4n7xykNdV8yc+YLzCQAreGMI0sn95cbF0G3eLsavcPeslJB9lpHq/OiUBJ4PPaTsjopNA17siD
	YipO9i6j/18Xps9S8FiHE//FLLlvcvRTWpZZkrmLD5+gW0aX5EtqMu+fwmnnj2sNuT6OxsvUIVHN2
	jXE2TjQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v18Am-0000000EaF3-1gqE;
	Tue, 23 Sep 2025 18:55:32 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v18Ak-0000000EaEU-3EX3;
	Tue, 23 Sep 2025 18:55:30 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id DD9F560278;
	Tue, 23 Sep 2025 18:55:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 41D3BC4CEF5;
	Tue, 23 Sep 2025 18:55:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758653729;
	bh=BHKsQeIexba7Xof1BMU4XKauM0mWGjlNxi5TOlT8IiI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fNt2qT4ASoSn3+NiZDbXtGZIyMzCkhROyTOK7aPLJKZg5pmSSLQ3zYhq4OisLnVWc
	 +NPK8xV1rZsvVJarvIGR7iGDyezz0hBYRVMsFJdbV3N6dTvuFA3CpwaG5iGi9UYwNI
	 xI+NR5fSPKRsepAmX1xU/IlBYwYHHOgjmNvSZWxRZSbAmKRBnaxVhqYDD+4V5Wfotu
	 ixhH0QFA5W+EwO2d1kRn/a4nzGFzAek/XpOanANT+NzoVAn2BATZNAkq8mFlVf6zIZ
	 ncr5Bmgml7RLhxtoxJvLUQi+E5o6FKgjME9gzMy5pcwB8/t3g9+qa0SwacaPOL15xk
	 9n8bVe4wbx3CQ==
Date: Tue, 23 Sep 2025 19:55:25 +0100
From: Simon Horman <horms@kernel.org>
To: "Gustavo A. R. Silva" <gustavoars@kernel.org>
Cc: Lorenzo Bianconi <lorenzo@kernel.org>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org
Subject: Re: [PATCH][next] net: airoha: Avoid -Wflex-array-member-not-at-end
 warning
Message-ID: <20250923185525.GL836419@horms.kernel.org>
References: <aNFYVYLXQDqm4yxb@kspp>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aNFYVYLXQDqm4yxb@kspp>
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

On Mon, Sep 22, 2025 at 04:08:21PM +0200, Gustavo A. R. Silva wrote:
> -Wflex-array-member-not-at-end was introduced in GCC-14, and we are
> getting ready to enable it, globally.
> 
> Move the conflicting declaration to the end of the corresponding
> structure. Notice that `struct airoha_foe_entry` is a flexible
> structure, this is a structure that contains a flexible-array
> member.
> 
> Fix the following warning:
> 
> drivers/net/ethernet/airoha/airoha_eth.h:474:33: warning: structure containing a flexible array member is not at the end of another structure [-Wflex-array-member-not-at-end]

FWIIW, I was able to reproduce this locally.
And it goes away with this patch applied.

> 
> Signed-off-by: Gustavo A. R. Silva <gustavoars@kernel.org>
> ---
>  drivers/net/ethernet/airoha/airoha_eth.h | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)

Reviewed-by: Simon Horman <horms@kernel.org>

...

