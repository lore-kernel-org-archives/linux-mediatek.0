Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A538C7113C
	for <linux-mediatek@archiver.kernel.org>; Fri, 18 Aug 2023 12:03:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CL/2RGvA7Wl/wD4LaXcTO2mHAnzsVs/RRUMLt3a46Yc=; b=jYEDLh289C0OdCFGWe0cuXPBSG
	SROHTWuWtry7fkK/JmnDiAOeDw/4HcMh3GkPIyJY8gVPAVKpqpYRWydMCBdikgUVJsqBTLkXgc5/J
	z581DaHYfL3tf/tEbDVf0Gx3pgmOtYTJlZV9fHC/tKl2MM4zahIYVMPm/P4llI7cET3KzmcDK3srr
	s5g11LFvb/l4qKq5wq6oaUosOuByv/GhRJRu4bdX3aBuD9w5KUXQTxzmTJ3PNQkBRrLPGDc2CKaRi
	Jjm7XUC9bDa8Q3qs7pFwp5WuJ3sknJKF8lqZEKZ0pxWKq2l8dndOYTe3FxHS7EOShU+b2s2LrR6z1
	6eBc+72Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qWyCE-0090o3-2v;
	Fri, 18 Aug 2023 12:03:18 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qWyCC-0090lW-0A;
	Fri, 18 Aug 2023 12:03:17 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 5849863632;
	Fri, 18 Aug 2023 12:03:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D420EC433C8;
	Fri, 18 Aug 2023 12:03:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1692360194;
	bh=bu1MVi82BPmDSIibUNjdlS56ovX7Eg24gQiaTb8MNGM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MYAy39Q6HEsRP02wSaJvQ7vZSs96nP09/6QVlf2+Njfv0ga6Ya9haZ+z7a3Slj5tv
	 0e/MX5yuFQzZ52xapMwUFxqO9uc4JRut7+UXlfhmH2Ee6JVLP9jwuku/vFCJKlPxi7
	 JKbT09UPf6c9CfQUnqDwoVipYuZIhLUbLIAVzwSGX7Y9CJTQ6b8VxwrhlH7i4IfllQ
	 mcgOT7T0FF2pgEUClMMs8Q/JL+C7ICqzf2R3/hIfaA6Db52TkP7SnDl4FiGpXvKxeb
	 9XDGF07RzKLZapkbQZS8MDrrq5OLL5j6sj4lB+yvCPsD0f+CzJY1/GtkgVKOXS5K7N
	 K8ZDma6jqhAcA==
Date: Fri, 18 Aug 2023 14:03:09 +0200
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
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH net-next] net: ethernet: mtk_eth_soc: fix register
 definitions for MT7988
Message-ID: <ZN9d/RJ8qX4xbMml@vergenet.net>
References: <0c0547381d3dc2374e219c97645ab7e1fdfbc385.1692273294.git.daniel@makrotopia.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0c0547381d3dc2374e219c97645ab7e1fdfbc385.1692273294.git.daniel@makrotopia.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230818_050316_135555_4086461E 
X-CRM114-Status: GOOD (  11.56  )
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

On Thu, Aug 17, 2023 at 12:58:29PM +0100, Daniel Golle wrote:
> More register macros need to be adjusted for the 3rd GMAC on MT7988.
> Account for added bit in SYSCFG0_SGMII_MASK and adjust macros
> MTK_GDMA_MAC_ADRx to return correct registers for the 3rd GMAC.
> 
> Fixes: 445eb6448ed3 ("net: ethernet: mtk_eth_soc: add basic support for MT7988 SoC")
> Signed-off-by: Daniel Golle <daniel@makrotopia.org>

Reviewed-by: Simon Horman <horms@kernel.org>


