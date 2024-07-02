Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CF5EC30658
	for <linux-mediatek@archiver.kernel.org>; Tue,  2 Jul 2024 18:02:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=G5upO02cB9cpzKJNuRkNn/q9Z6Kn141LSenlrl70tw0=; b=h79lyIVEjDCpRxF4P/mazL2xbO
	N00Ab/bUu/Y88cjk5ijYW6lPhv9FnZTqz5EIidKZnzPITeK6HCBbHtFGvS1e5DAW2ZTJgeIvOE4T7
	wry2N6Ysai17abM+FJUz95bXuJcYxOcgGPiw/hltL0kiBiMLF9seBILiJRUQzhZcoaDct4sgATyu8
	EqBAZF2Jv1CbK/73OYNt2HppcSqyqWrehXVrtJamVKJYkOQe03J5rihQWqyF8dvXCdJn2F7T9n8N3
	tTUCWE4+dLXNfA1xYuDQNxfFehoikbUfl+LFZvGv9JK032X0V9mIk7a9DCTnZCbjM9o4w+5VAWUr3
	8y7DxjOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sOhpz-00000007ZxW-0XpJ;
	Tue, 02 Jul 2024 18:02:43 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sOhpl-00000007ZuS-0cxH;
	Tue, 02 Jul 2024 18:02:30 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id D01B4CE2003;
	Tue,  2 Jul 2024 18:02:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4DB84C116B1;
	Tue,  2 Jul 2024 18:02:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719943346;
	bh=3I5R4eg4Zq3QWN7/2sDahE3dHxNDQxWwiNfojeOQsmE=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=nmpIGeUYd/+hJ0mr7LFvX8LNQn8dl+k16XwQFFarHYJ8LK5kIJRXebXIr249xaYcK
	 RVe2pJv9bRhYS0WZKozDfqdDeARpqyrralgv8TaudMzfVVpR/Ixz8YYx1w+yJI6iDD
	 5Y9LQr7aa1nnlqcKpTnI71eQUAi/a6yfRqqoYhbWRZi501b/ZAsdFs7bwxcZY5EIHj
	 sjyWH4k08Z6eVBNcKhAicr4vzPdybyzNV6/1t8XYaoYnSuxSOaGZ9EyEg23TL11Hsu
	 KInmuLOh54VRhIZLBQPCxS3usuqewJs4ped4MvEOruZC2Yv12K1uDxrzwoloKL/L7R
	 zh8thhtmxEnfQ==
Date: Tue, 2 Jul 2024 11:02:24 -0700
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
Message-ID: <20240702110224.74abfcea@kernel.org>
In-Reply-To: <TY3P286MB2611AD036755E0BC411847FC98D52@TY3P286MB2611.JPNP286.PROD.OUTLOOK.COM>
References: <TY3P286MB2611AD036755E0BC411847FC98D52@TY3P286MB2611.JPNP286.PROD.OUTLOOK.COM>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240702_110229_399702_496FA6F1 
X-CRM114-Status: UNSURE (   8.84  )
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

On Tue, 25 Jun 2024 19:16:54 +0800 Shengyu Qu wrote:
> MT7981,7986 and 7988 all supports 32768 PPE entries, and MT7621/MT7620
> supports 16384 PPE entries, but only set to 8192 entries in driver. So
> incrase max entries to 16384 instead.
> 
> Cc: stable@vger.kernel.org
> Signed-off-by: Elad Yifee <eladwf@gmail.com>
> Signed-off-by: Shengyu Qu <wiagn233@outlook.com>
> Fixes: ba37b7caf1ed ("net: ethernet: mtk_eth_soc: add support for initializing the PPE")

nit: Fixes tag usually goes before the sign-offs

This doesn't strike me as a bug fix, tho. What's the user-visible
impact? We can't utilize HW to its full abilities?
-- 
pw-bot: cr

