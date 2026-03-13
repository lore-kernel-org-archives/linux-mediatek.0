Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB157105F7AF
	for <linux-mediatek@archiver.kernel.org>; Fri, 13 Mar 2026 14:31:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=C+eA7efjGJYjTYnY0MH0Uqs9uJP4yAsRPi8k20Uaquc=; b=XWvm/sGjmARPsuwneSG37tst9t
	V8100vEW/g0AUoBegpTqfoW1WZB4hVd0koYAHjO+DET+zr9Y1KL5Xf0mDYaHYMtCHKLtAG+IDwyYv
	8k2YmZU+eefh4tjMybzYZ+w3TAL4LPalstWz/xdlPFwh3RAO2Ld2tNsSuXqKvWDeosEosSZ3SLzgv
	UYaQcq9MKgUis70VRF12ID7pQ/CNg8/XiT+n30H+gIfsH3TfHQRihRo24j2uCaa13rmFFWVw8U3+k
	xMjTBZiIJXhHfMl9h5TEX1/x3YhokWbiAOxYr9GB1ynKjZHBXpdgXkgPkSa1lBm6LmLFvm19ibSAr
	cTVzXgFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w13YP-00000000Oh9-3SxW;
	Fri, 13 Mar 2026 14:31:53 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w13YO-00000000OgN-01y8;
	Fri, 13 Mar 2026 14:31:52 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 300E86012B;
	Fri, 13 Mar 2026 14:31:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1517AC19421;
	Fri, 13 Mar 2026 14:31:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773412310;
	bh=sxCpbTctA+RZNdC597cmoMASeWWFt3FxcZxm5LfrmZY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=vAypwmcy7+uC/mkkjD9zZ7DERx2WdIGWr8DmzfMV9N/WE+TqdxkV1l1QHvW77tR9Z
	 RGAh0XSObqRoomk32pz3RCTz4KyYv3jNyTDND5HI9Itlet9VNHcZJhHd+oGcAFU9dt
	 2oHHN0SkgDHy76DPA5nl3rSKN10TciiIb/wGwDFSR2lwk3AOxmLM+J6ePZOTIbOvaQ
	 9ZD+3Rt+6s4CIFZZJX8njW81mntAqhPgCkMgM0w8MG1FgWdRI5qxG/VKQni2Fop+WJ
	 RXbeX0HnnMbuLvRH8fi6RAuSIsClxs5gery43kaTTKl3nB10M27k5F00fi3e2l55Xf
	 YTq4OPWLxsPRg==
Date: Fri, 13 Mar 2026 14:31:46 +0000
From: Simon Horman <horms@kernel.org>
To: Lorenzo Bianconi <lorenzo@kernel.org>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, netdev@vger.kernel.org
Subject: Re: [PATCH net v2] net: airoha: Remove airoha_dev_stop() in
 airoha_remove()
Message-ID: <20260313143146.GE461701@kernel.org>
References: <20260313-airoha-remove-ndo_stop-remove-net-v2-1-67542c3ceeca@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260313-airoha-remove-ndo_stop-remove-net-v2-1-67542c3ceeca@kernel.org>
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

On Fri, Mar 13, 2026 at 12:27:00PM +0100, Lorenzo Bianconi wrote:
> Do not run airoha_dev_stop routine explicitly in airoha_remove()
> since ndo_stop() callback is already executed by unregister_netdev() in
> __dev_close_many routine if necessary and, doing so, we will end up causing
> an underflow in the qdma users atomic counters. Rely on networking subsystem
> to stop the device removing the airoha_eth module.
> 
> Fixes: 23020f0493270 ("net: airoha: Introduce ethernet support for EN7581 SoC")
> Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
> ---
> Changes in v2:
> - Target net tree instead of net-next
> - Add missing Fixes tag and improve commit log.
> - Link to v1: https://lore.kernel.org/netdev/20260311-airoha-remove-ndo_stop-remove-v1-1-596fe853b2e1@kernel.org/

Thanks Lorenzo,

This seems much clearer.

Reviewed-by: Simon Horman <horms@kernel.org>


