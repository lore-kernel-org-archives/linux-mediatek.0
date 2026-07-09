Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43FA8C43458
	for <linux-mediatek@archiver.kernel.org>; Thu,  9 Jul 2026 16:14:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GdYKxyrukzOCUj5NQSUsx29G1+lE43S/PZWNMBMhcIM=; b=yTRi5cPsZgTIDhZf2gPBwtadHO
	QQg3abONC/VDmNrfk1R7WJC/sVZU7LRHGlUt6tYcqi+H+A/3nw17cJyVS+y70GttXk4nsWaUBFQck
	wlbj2MK2ix3HeE+MO9IrSlsMrNWnm0FoB1gDIneZ2jlH2l44GdeoPlPQGly9+F4r2ducRYStd243W
	VApctpxblxNpGR8oIf72W/FN0pzrBsL6opFb3rtHKns0mtVPpJSYECLpz3L6rrEnOpdxm+djWwxCz
	4TixZiTPN3cDp/9pV/YWXhMJu3vO3DAnKNFYl/OwyvMkb3NV92F2uLTvX5KFKg9WqJ0hm+Pyw28ru
	XB37oaHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whrOM-000000030S6-0dv3;
	Thu, 09 Jul 2026 16:14:26 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whrOK-000000030Rj-1sv0;
	Thu, 09 Jul 2026 16:14:24 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 8BA97600C3;
	Thu,  9 Jul 2026 16:14:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4E5C51F000E9;
	Thu,  9 Jul 2026 16:14:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783613663;
	bh=GdYKxyrukzOCUj5NQSUsx29G1+lE43S/PZWNMBMhcIM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=i/ncqXIgLcS0ZRhGdfko7ryWwaWdZmgd258KLZFRqbUFgkmQRIYJDSNZAb/HayKLo
	 9x7iSItpxeKmoRDy7khqeNEh+39ii/BGLkOPoqAxl5Z/wGP1ZlOrsHUkjqFZdLCIrT
	 4kq078RhGupfII20QpO28YAiri3d3tjx6zDkusit77oceuRrzD8/OdTXxpOdMWnGb4
	 b+x7d6gb67iZYQ3l8V8a+Y0tRaj/nN992aGSS2vFz5QbgE6rmDLj5KTk7j+0qCtcQ9
	 VAYfOfhC8VglQGMJua28zUCJeoMm8JnbnnczTAlIm8UEGLrO1/AdzVX4Uknx/DRYt2
	 m3BeAEx0a5TIA==
Date: Thu, 9 Jul 2026 17:14:18 +0100
From: Simon Horman <horms@kernel.org>
To: Lorenzo Bianconi <lorenzo@kernel.org>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Alexander Lobakin <aleksander.lobakin@intel.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, netdev@vger.kernel.org
Subject: Re: [PATCH net-next v8 1/3] net: airoha: rename airoha_priv_flags to
 airoha_dev_flags
Message-ID: <20260709161418.GQ1364329@horms.kernel.org>
References: <20260703-airoha-ethtool-priv_flags-v8-0-015ba5ac89ee@kernel.org>
 <20260703-airoha-ethtool-priv_flags-v8-1-015ba5ac89ee@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260703-airoha-ethtool-priv_flags-v8-1-015ba5ac89ee@kernel.org>
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

On Fri, Jul 03, 2026 at 11:19:25AM +0200, Lorenzo Bianconi wrote:
> Rename the airoha_priv_flags enum to airoha_dev_flags and the
> AIROHA_PRIV_F_WAN flag to AIROHA_DEV_F_WAN. The "priv_flags" naming
> dates back to an earlier design that used ethtool private flags; since
> this series switched to tc qdisc offload for LAN/WAN configuration,
> align the naming to reflect that these are per-device flags rather than
> ethtool private flags. No functional change.
> 
> Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>

Reviewed-by: Simon Horman <horms@kernel.org>


