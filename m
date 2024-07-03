Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D301BC2BD09
	for <linux-mediatek@archiver.kernel.org>; Wed,  3 Jul 2024 23:48:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yLllhCchoOYYFOs3o1AMSqnWSEzPVdqQsQux8UVA6qQ=; b=T3usRfBFyGu9NxxBg0e7iGT/Ta
	FGTqv/vfwoWIjKFTSdmEHFWWrj9kLKzQSEH19xLSF3XEPbs/h7EQer1GIudi2XrAdhJoeE553Qwff
	nXnn3T5CGPB7L5yaXqL+ebjKwYoFamP7BefOSIb4jzL5WlG5YN1U9bIQgR/uWVdGbAkAxPek9Kdal
	lf483Uf9TGocjP2oUicJcu+YTdMx3+rlxifW/Ol/oaL3E5opePItRuMqXn7OZRoPZCVa6hmr7yvu1
	Nqb84O6OPNzsf6eGYpKB+Ftan/QXbOYRR/qfI5BIJcY0gY68XMxkWYUM0mfeQ1gzQXni5z8v0rApd
	QahqLLuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sP9iH-0000000Bl8l-1IiX;
	Wed, 03 Jul 2024 23:48:37 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sP9i3-0000000Bl65-1Qm0;
	Wed, 03 Jul 2024 23:48:24 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 8995ACE1693;
	Wed,  3 Jul 2024 23:48:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6678AC2BD10;
	Wed,  3 Jul 2024 23:48:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720050499;
	bh=3EAKouPpI6FP3niYbt2D0U7O15uPOgW9c4Vzms3YCG8=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=hvBGQEPyXQxi5gzRvHcmoT3Ohm634kdj2IMUgLn9Th5jV4RnjPvxLmaqYllM8IIKt
	 ZambVVFgH3Vld0yFsjRo5T5Pxy+v7BItlvVytW4gH49/vOmu0N3lqOVCrAVnleDnZE
	 uHSFkfdECysIUt5395FkoMS3Aksf9Lbn/mls0bQDYPmYgMDT1PfKEwa8lWD8BB6qPF
	 vPpNB7x/xA63Bv6f/8b/rq6hq916mtKbkZgPwV/ih+5Dds1Ic6KHi5QAl40kQiYtgW
	 UDUjtXFoRaRAHrftiAliGdVSWp/knD1ANy57cFOzfeMBcfIJBmpId8VFH1QkKFwExg
	 BL8mBSyHq5K3w==
Date: Wed, 3 Jul 2024 16:48:18 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Shengyu Qu <wiagn233@outlook.com>
Cc: nbd@nbd.name, sean.wang@mediatek.com, Mark-MC.Lee@mediatek.com,
 lorenzo@kernel.org, davem@davemloft.net, edumazet@google.com,
 pabeni@redhat.com, matthias.bgg@gmail.com,
 angelogioacchino.delregno@collabora.com, pablo@netfilter.org,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 stable@vger.kernel.org, Elad Yifee <eladwf@gmail.com>
Subject: Re: [PATCH v2] net: ethernet: mtk_ppe: Change PPE entries number to
 16K
Message-ID: <20240703164818.13e1d33c@kernel.org>
In-Reply-To: <TY3P286MB26119C0A14621AD8D411466A98DD2@TY3P286MB2611.JPNP286.PROD.OUTLOOK.COM>
References: <TY3P286MB2611AD036755E0BC411847FC98D52@TY3P286MB2611.JPNP286.PROD.OUTLOOK.COM>
	<20240702110224.74abfcea@kernel.org>
	<TY3P286MB26119C0A14621AD8D411466A98DD2@TY3P286MB2611.JPNP286.PROD.OUTLOOK.COM>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240703_164823_588678_D5910D24 
X-CRM114-Status: UNSURE (   8.31  )
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

On Thu, 4 Jul 2024 01:38:50 +0800 Shengyu Qu wrote:
> BT download and PCDN would create tons of connections, and might be
> easily to reach the 8192 limit, one of my friend sees 50000+ links when
> hosting PCDN.

I don't know what PCDN is, but what we care about in Linux is whether
the change under Fixes introduced a regression. Optimizations, and 
improvements no matter how trivial in terms of code are not fixes.
So did ba37b7caf1ed ("net: ethernet: mtk_eth_soc: add support for
initializing the PPE") make things worse. And if you're saying there
are 50k "links" in real world why is 16k a major win? it's 1/3rd of
the total.

