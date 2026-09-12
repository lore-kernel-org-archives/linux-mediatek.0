Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5EE56C88E45
	for <linux-mediatek@archiver.kernel.org>; Sat, 12 Sep 2026 00:08:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6tnQj8PZOglxwDmgQi4YM2ygZw/9bEqnwd5bUGAk9Mo=; b=swcWIPSnMZP+W7w80BUw/D5STh
	lHqnj55p+vh2Fg/80lPRUEIn7DG9+HkaBZ49sHFeukNk1Wd4qDPtGrbLp3qVol3QMBlnZN2dQEAb0
	nLcctHVvYSV/MayvSNtaeq8yPAmRigyc9lKEDJXUy/Wb2GSr9B+ucjV7gHzmAdc7fPPasnUcFZrLe
	LzWwzo2BdVb4UVxETss86Be9WMpav3XRCNO7hnYvftUM7hxjZeJ9c05/IixEa8BNuedEetC9HDxII
	+rbfWqJB5fpeoQA7+6ZDy6PMVLTLXCsy18KmfM6EezM5qO/YAyYUYTaqetDRh27FR/kF8diE5lNFz
	DmLAJaNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5BHk-00000000QFC-0Gh4;
	Sat, 12 Sep 2026 00:08:00 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5BHi-00000000QEg-2a5i;
	Sat, 12 Sep 2026 00:07:58 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id CEC06601EF;
	Sat, 12 Sep 2026 00:07:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BC5231F000FF;
	Sat, 12 Sep 2026 00:07:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789171677;
	bh=6tnQj8PZOglxwDmgQi4YM2ygZw/9bEqnwd5bUGAk9Mo=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=ASUPZw2lQ6fj+djME4kKysv6SGDLGVG7Bk9KtfHYw+3gzlvVxvRFAOIxMGUZK0382
	 UXPg6Jrdq3eInUkCvGFBC9o0UrhRWUdhbzfKfLDSwwKmrz1PIoQug210lldokV7Mes
	 hqOIUmu/O/zMDTMyb/9g5czsOYNH3FmOGaYGPxOjMyw/wraBbDHjxPOGwmHoWtz0qr
	 Qj+SzfRxuHmKD7IALhE1isX9L5wkmytHaopdiPUFoVtI7JYTLFhSU7i9pMHa1uDmyf
	 sdyjLy3eKeQ/srbhXY0gfLggfw+ihWMqg+TDtIcbsrKwOgRKP8kZIygstARaQms6IQ
	 kBfFdaSP2ahww==
Date: Fri, 11 Sep 2026 17:07:56 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Caleb James DeLisle <cjd@cjdns.fr>
Cc: netdev@vger.kernel.org, andrew+netdev@lunn.ch, davem@davemloft.net,
 edumazet@google.com, pabeni@redhat.com, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, p.zabel@pengutronix.de,
 matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com,
 vadim.fedorenko@linux.dev, maxime.chevallier@bootlin.com,
 dong100@mucse.com, wangruikang@iscas.ac.cn, 25181214217@stu.xidian.edu.cn,
 hkallweit1@gmail.com, han.junyang@zte.com.cn, xuanzhuo@linux.alibaba.com,
 enelsonmoore@gmail.com, jes@trained-monkey.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, naseefkm@gmail.com, b.larsson@gmx.com
Subject: Re: [PATCH net-next 2/2] net: econet: add EcoNet EN751221 ethernet
 driver
Message-ID: <20260911170756.39f10138@kernel.org>
In-Reply-To: <20260909212146.3184077-3-cjd@cjdns.fr>
References: <20260909212146.3184077-1-cjd@cjdns.fr>
	<20260909212146.3184077-3-cjd@cjdns.fr>
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

On Wed,  9 Sep 2026 21:21:46 +0000 Caleb James DeLisle wrote:
> The EcoNet ethernet driver is somewhat similar to both the Airoha
> and the MediaTek drivers, but still unique enough that attempts at
> code reuse did not prove fruitful.

Please split this up into multiple patches.
Each patch has to build cleanly with W=1 path/to/your/driver/
Please also use ./scripts/kernel-doc -Wall to validate your kdoc 
is correct.

Please don't repost patches less than 24h after previous posting
Please don't repost patches in reply to previous posting, always
start a new thread.
-- 
pw-bot: cr

