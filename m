Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A845C27C5E
	for <linux-mediatek@archiver.kernel.org>; Mon, 10 Jun 2024 12:53:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PfeZsCMtfQiKhSzToakmuJ25vDmcL05OSM58D+I0pio=; b=EbP47uuCz9Fi3ud/ApsQrTtIZe
	CSNeRaajv/jD7k518j0xOL82m8TaeFTBCi1mzKSFPRwx9RbDNQ3G0XbMXHyNpn17QIRthDRnipKoi
	NnO0xaSPAco87rOV7PgBDropIvfQlQuhClfo59EBkVGK+Otbs9OYpqQ3w328+FgosEdA/i2CH09Xn
	2SBuDM6zQvXaLjIixJwwMeuVI5n/7w2wmBNpmo+l03hI4EpZY+8DTxkA3RURiArMBRjUB5YwxO/cO
	e8vUMp/K7YO7TtKaejVwZZ44hSoq19/z4qw6Harbse0YV16rz0MbyUkZVGU7paYwlEIUrynVE1Rj7
	yARSihCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sGeWe-000000054oi-1dfy;
	Mon, 10 Jun 2024 12:53:28 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sGeWS-000000054iy-400n;
	Mon, 10 Jun 2024 12:53:18 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 9F5F2CE1050;
	Mon, 10 Jun 2024 12:53:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C5905C2BBFC;
	Mon, 10 Jun 2024 12:53:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718023993;
	bh=5T5umR+EX/ptN9iQJvLK1D/jl6cODlTCfcGAFbufGD4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=KBtghAgzRaFLKG9esobbXEG9J0zxxCzcRZ0W7LtrZYx4ElErgKSkaotQYNNLYDTo7
	 1DzP4Msau4VUWY0thAhXFlPQufDXq90H28f/+eX182/eYTCboegEN9Umh5cqlE0Cc3
	 VKL5sSWaKZdqxDSHoblfrc5hxHsAoHxbQA8EkGNHvjAlaXySr5qTbc2eUSvvk78b1V
	 aBWEIlAv0hkP/2t1WUXcX3H1oBOPZnPfQAFp4EjKxgH13ffYDZoXv3hajb6o2mIEAK
	 VGSr6sD6pkjYj7BljjGVW+yCokFZvIvmgLgEpTx3sLANrQIfeMR56QWQlJvAlaBqHe
	 lsnYeRW/lBGFQ==
From: Robert Foss <rfoss@kernel.org>
To: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>,
 Neil Armstrong <neil.armstrong@linaro.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Sam Ravnborg <sam@ravnborg.org>, dri-devel@lists.freedesktop.org
Cc: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, linux-arm-kernel@lists.infradead.org, Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Dafna Hirschfeld <dafna.hirschfeld@collabora.com>, David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 linux-mediatek@lists.infradead.org, Daniel Vetter <daniel@ffwll.ch>, Thomas Zimmermann <tzimmermann@suse.de>,
 Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <20240531-bridge_chain_mode-v1-0-8b49e36c5dd3@ravnborg.org>
References: <20240531-bridge_chain_mode-v1-0-8b49e36c5dd3@ravnborg.org>
Subject: Re: [PATCH 0/2] drm bridge: drop drm_bridge_chain_mode_fixup.
Message-Id: <171802398950.436486.1468849081814066761.b4-ty@kernel.org>
Date: Mon, 10 Jun 2024 14:53:09 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.10.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240610_055317_217989_CA4D2D7B 
X-CRM114-Status: UNSURE (   8.20  )
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

On Fri, 31 May 2024 22:37:44 +0200, Sam Ravnborg wrote:
> I had a few bridge related patches in an old branch.
> 
> They were last posted here almost one year ago:
> https://lore.kernel.org/dri-devel/20220717174454.46616-1-sam@ravnborg.org/
> 
> The following two patches gets rid of drm_bridge_chain_mode_fixup.
> The patches was already rb / ab - but due to the age a repost is
> due before applying the patches.
> 
> [...]

Applied, thanks!

[1/2] drm/mediatek: Drop chain_mode_fixup call in mode_valid()
      https://cgit.freedesktop.org/drm/drm-misc/commit/?id=ac4be1e50165
[2/2] drm/bridge: Drop drm_bridge_chain_mode_fixup
      https://cgit.freedesktop.org/drm/drm-misc/commit/?id=1f0204954583



Rob


