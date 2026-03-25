Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D350FEA82F
	for <linux-mediatek@archiver.kernel.org>; Wed, 25 Mar 2026 08:17:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9GX0hpeyW7QECqsfFUYguX/FdaXxvvjhwb0RVlhO21w=; b=ySQrcksPo/jAdYIPE2B6kRIR5K
	WLbh+kILHm558mcN4EOTGX3REJZpt/XB+TTwKM4TT/exJAp0Gvg1QQxuwd8IzWM/r0CGA38ptnbNX
	CkTZQHGMgjrZLZgdt20y6vkMfLHaABj0FujVjSVhjJUyIUcJUMY/Ru34Wb/mpaY6sSZ4kciGQqEY3
	J2O+dWutUykb74eTrAl8rDeED0+oZCUOhZasbmkzi0JsqLPSFiY1s9OsQNaysJ9ypG0aR++HqluBZ
	aGzjzPh05fl7VKOk+NM6ohmaByHtrY2BQ1rdLRGoSjl9BbPggCuxfwGMObB29pre/1I6Ea6Kx9rtP
	tWBsHKCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5JQc-00000002vm3-1lRv;
	Wed, 25 Mar 2026 08:17:26 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5JQb-00000002vlj-0l0s;
	Wed, 25 Mar 2026 08:17:25 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 34A57600AC;
	Wed, 25 Mar 2026 08:17:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 582C7C4CEF7;
	Wed, 25 Mar 2026 08:17:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774426643;
	bh=nYFxOoFBdJDJAtHSqZjQoKIJ0Nr8zwnTAqqylX7FTBw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=A1hYdX/W978ySG20Jup77ph5rBseGqjxnja0LRKYMjW8AwyFzxsD/EViH/I0aoIkD
	 WYsfqRRYc88AwzIPadliQ4jGJWyjL78fjWlrhiObbFuropE04BiCVkhn/OJKOhwagv
	 V/ayRoaGKpe1VTR9ndtXJ7wQ2BEBCusld3HEjJWKXd0uYVTeomWT2pyWjyQCoJfvJU
	 Hmt6wvNfd0zNmbWqphegQemZFUV09EZw+4EfLZRmu7ydCELdYRvfRGBL/hIDm/WOhE
	 sG9hW0ETnUKX75jeCesFfMRdDQ9OfOiThMa+u2KYNkXvuWSkwmw6CNDV9PyX9p9VAK
	 Hlef7DuLYym7g==
Date: Wed, 25 Mar 2026 09:17:21 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Jay Liu <jay.liu@mediatek.com>
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, dri-devel@lists.freedesktop.org, 
	linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v4 0/6] porting pq compnent for MT8196
Message-ID: <20260325-hissing-jasmine-crayfish-caef70@quoll>
References: <20260324125315.4715-1-jay.liu@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260324125315.4715-1-jay.liu@mediatek.com>
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

On Tue, Mar 24, 2026 at 08:51:57PM +0800, Jay Liu wrote:
> Change in v4:
> - Address coding style comments for disp-tdshp binding. 

Coding style? Why so vague? So does that mean you ignored all important
changes but did the "style" things?

> - Rebase ccorr driver patch on top of latest linux-next to fix conficts.

Where is the rest of the changeglog?

Why aren't you using b4 to provide also lore links and solve above
problem?

Best regards,
Krzysztof


