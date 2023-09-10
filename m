Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0BFBEE57CD
	for <linux-mediatek@archiver.kernel.org>; Sun, 10 Sep 2023 14:47:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=upj9gRFNw/+gQMsDIcqrH0UsVrNE0TGcbGvOH8q4EKU=; b=zINORbmmboudGKXbOaCPq25TWV
	1n00jBGzS26CC2WouPiy5LM0TpCn0ynkq116sV5sN0cBabijhmanbd9Ab+p26hKRif9t7AEpGWMpM
	s8db/jwytL5+8B+jx/2GvQe9usNbmsVI5jwpgH9gWMVY9xzXHmH0fj0UneqBYHjtdXwlz2zzXh1vv
	Lfl4lAZ8b1tGCQqpKRkTqiMD8vZJrweKGktk2yxZ/Ba/pO4wjdqRpzlYBjmABqbzY8j1GzZ/fuxKK
	Q8ewrjyjEz55ivw86/mMca6zo/ncbV+iWXSAhwNQsiEwlQnNe4zfjd1xLVBOu62O2YrcW39nnQ0f/
	9poUl5iw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qfLix-00Gg5T-37;
	Sun, 10 Sep 2023 14:47:43 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qfLiu-00Gg4E-2P;
	Sun, 10 Sep 2023 14:47:42 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by sin.source.kernel.org (Postfix) with ESMTPS id B52EFCE0B68;
	Sun, 10 Sep 2023 14:47:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EDCBAC433C7;
	Sun, 10 Sep 2023 14:47:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1694357254;
	bh=NErVm+qMXZ/pqK2rnbYhPDdyFVVpqvEVZyCXf/EFVGY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ubxVCTCKav+V51WDKuTtO0EDuxSfsqy9sKFT5Af++H1Fh3Z9uIHtsZLcAFgogb2DW
	 kLN62joKoSscCalyAHAP1XhN7GoOyat3h480sycZQEab/1X+UtB3OMRPlouXDt99ZN
	 7MYBaeQpinURBCB7NUKIK7Wb3DjSxBSK+Sl0SxDkZUQeRxSJV3X9b17qZkqFP+xdn4
	 0KQrhvL8fzq6mcEPAGZCkT+dwy+F/FxAA2a3/FqpTQ1SU0P0JGO8gB7iXPKcJS0L6b
	 GYiMhnyyct6+GQ+oHPRMrxdM6YZ2kNDAtY4w6cPoFKpA2voqNJP7VcCSiBe8+Q0ISf
	 Fy3sv/BaB1Bug==
Date: Sun, 10 Sep 2023 16:47:28 +0200
From: Simon Horman <horms@kernel.org>
To: Hangyu Hua <hbh25y@gmail.com>
Cc: justin.chen@broadcom.com, florian.fainelli@broadcom.com,
	davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
	pabeni@redhat.com, mw@semihalf.com, linux@armlinux.org.uk,
	nbd@nbd.name, john@phrozen.org, sean.wang@mediatek.com,
	Mark-MC.Lee@mediatek.com, lorenzo@kernel.org,
	matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com,
	maxime.chevallier@bootlin.com, nelson.chang@mediatek.com,
	bcm-kernel-feedback-list@broadcom.com, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH v2 3/3] net: ethernet: mtk_eth_soc: fix possible NULL
 pointer dereference in mtk_hwlro_get_fdir_all()
Message-ID: <20230910144728.GF775887@kernel.org>
References: <20230908061950.20287-1-hbh25y@gmail.com>
 <20230908061950.20287-4-hbh25y@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230908061950.20287-4-hbh25y@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230910_074740_968923_C8B59EB6 
X-CRM114-Status: UNSURE (   8.93  )
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

On Fri, Sep 08, 2023 at 02:19:50PM +0800, Hangyu Hua wrote:
> rule_locs is allocated in ethtool_get_rxnfc and the size is determined by
> rule_cnt from user space. So rule_cnt needs to be check before using
> rule_locs to avoid NULL pointer dereference.
> 
> Fixes: 7aab747e5563 ("net: ethernet: mediatek: add ethtool functions to configure RX flows of HW LRO")
> Signed-off-by: Hangyu Hua <hbh25y@gmail.com>

Reviewed-by: Simon Horman <horms@kernel.org>


