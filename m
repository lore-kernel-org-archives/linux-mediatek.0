Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C296FF887E
	for <linux-mediatek@archiver.kernel.org>; Thu, 30 Apr 2026 00:11:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OQOpcjVWCwnuu8YuIIvHXAnxIp0W8LJSBR7cGh6tU+c=; b=T8CIjaKT9se/nf+a2c88hWtSlL
	AKSL3HBdCm07VP2zJt5APc/7wFxlPHPQSAqOTYYaNYsM21HtXj/NZL0e/IfJf2tVYB5KvC1H+8cGM
	9HC6Fy4zVtX+DQifvocSiWcefvQJPSPQjOLgjs4JI5PelplMqbV/ehClxb8DqpnzH5OPONe7IIGAd
	aWkuYs0DoB3KL16vsjqo9SgBdez3WcYbrlammeSsx0m0gBAljaa0tvyMtiYZpJq1neO+7MsdXsRCs
	vRacJAbHSUXm4hNpmJR1mI3dPcSreDnkR60GfmpiNDLszAN/OgWr4DQDGt+89nJKKFk4deKYsDKo8
	MPweLDnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIF05-00000004KVX-1raf;
	Thu, 30 Apr 2026 00:11:29 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIF03-00000004KUj-07oF;
	Thu, 30 Apr 2026 00:11:28 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 153B96024D;
	Thu, 30 Apr 2026 00:11:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2D787C19425;
	Thu, 30 Apr 2026 00:11:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777507885;
	bh=dikwfBZQLqVyHWFgcP3YIUb72CSXierGUN7ylhD4tqQ=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=i5eYj4O119jYEsy0klfzCIF1GB1FqS6Ouh8OxOOtvCMEMUC1rqkMMP8dZHD6ibO6c
	 vkI7Ugl1oHOkQ9p0V/YKTm/f2rNTE/IOz/WGu6K+KKh2rKOGVTFzNlOoC5rNNLFtty
	 FDkCE74GzLMLZzuMN1nDq2khMsX1kCbXN5AAE1uuL8egfSbTpWeQoPmO5BxOzJeRvj
	 pHNQOOyO3FtpwEObXy6k37MjIWj36yjk0nhzaWYV+5/OOoR/Fuq34EzbuOTPu6GGEk
	 2+8Nnea0Uf9SCoN1Ji2p4M8Vu1/5t2OtrHmiQGw51/EzmyjvMdW7ycUYgmVHQWGLjc
	 jrTgEa4muZF6Q==
Date: Wed, 29 Apr 2026 17:11:24 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Daniel Golle <daniel@makrotopia.org>
Cc: chester.a.unal@arinc9.com, andrew@lunn.ch, olteanv@gmail.com,
 davem@davemloft.net, edumazet@google.com, pabeni@redhat.com,
 matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com,
 linux@armlinux.org.uk, ansuelsmth@gmail.com, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
Subject: Re: [PATCH net v4] net: dsa: mt7530: fix .get_stats64 sleeping in
 atomic context
Message-ID: <20260429171124.07787599@kernel.org>
In-Reply-To: <afKaVQ27GUQiWZTb@makrotopia.org>
References: <16efd278e4f17776ccfbf8491e5be71a4689c137.1777385305.git.daniel@makrotopia.org>
	<20260429234612.2240476-2-kuba@kernel.org>
	<afKaVQ27GUQiWZTb@makrotopia.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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

On Thu, 30 Apr 2026 00:55:01 +0100 Daniel Golle wrote:
> > > @@ -3409,6 +3476,9 @@ mt7530_remove_common(struct mt7530_priv *priv)
> > >  
> > >  	dsa_unregister_switch(priv->ds);
> > >  
> > > +	if (priv->bus)
> > > +		cancel_delayed_work_sync(&priv->stats_work);  
> > 
> > Could this call cancel_delayed_work_sync() on an uninitialized work struct
> > if the driver is unbound before the DSA switch tree completes?
> > 
> > The priv->bus pointer is initialized during probe. However,
> > INIT_DELAYED_WORK() is only called in mt753x_setup(), which might never
> > execute if the DSA tree remains incomplete.
> > 
> > If the driver is unbound in this state, mt7530_remove_common() will evaluate
> > priv->bus as true and pass a zero-initialized work struct to
> > cancel_delayed_work_sync(). This usually triggers lockdep ("trying to
> > register non-static key") and debugobjects ("assert_init not available")
> > warnings.
> > 
> > Would it be better to move the INIT_DELAYED_WORK() call into the probe
> > path or track whether the setup function was actually completed?  
> 
> Not sure if this is real. The fix could be simply
> 
> 	if (priv->bus && priv->ds->setup)
> 		cancel_delayed_work_sync(&priv->stats_work);
> 
> Anyone?

Not sure how much of the D in DSA is actually implemented but in terms
of fix why not do what the bot suggests?

