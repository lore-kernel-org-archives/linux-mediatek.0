Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9ADFCC61DC4
	for <linux-mediatek@archiver.kernel.org>; Fri, 28 Aug 2026 02:08:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OIEvq6sgp0NvuCsndYEh7XZfc5tM1x73kGtjwkzUi+E=; b=lNB+TNtWzzrLd2f5fpWlHDBlQG
	mhON9DggMLXj1Zdid9CskmhkCP2JExOwrifsvhk95RdxubwEzr0g09xco/Y2tPFIFOI4GTdwgjN9w
	5cA+bkGBqqMoN+aGbfcpO92V0nisZbMnab+ytH+TCGOywTNHRoanDhCJt5a30oSdXpMOq0BduSU5G
	yt/MMMEG+K4d660+/og93yTap/0v/f/fKLrntr/+CF3/7oxF1NtB5cVpc8CT/Q79odHlagvM6lf5c
	Z2XzUg5Iq0o+YDAKw7M4VneJiHEg3RbnzXl4tOCE7xCE+AA6LpKog964y8m/1UD/wQFRmIUfdBAfl
	o87osfPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzm1N-000000050qH-3PaW;
	Fri, 28 Aug 2026 02:08:45 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzm1L-000000050q2-3zjj;
	Fri, 28 Aug 2026 02:08:44 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 28A3E40611;
	Fri, 28 Aug 2026 02:08:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1BD0D1F000E9;
	Fri, 28 Aug 2026 02:08:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787882923;
	bh=OIEvq6sgp0NvuCsndYEh7XZfc5tM1x73kGtjwkzUi+E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=FdATG9Ma027jZn6aRZQMyq/DwxzIfyJzHm5fIYbr7t8uoHWmoog7jja/nwYu81mym
	 wuKXrLln3nC2+G24K7AVxljWUpvK89xmNHHAijUoP7e/IB5+N0L9WtYJbUBr4BSVFz
	 S2c4SvhR63rBC1S0RJ3knGd7ztJTKoCN58/vs62AmMe/sxv6uDqnbutWXxUIXLv62U
	 uDzmWDpXhsWfCM/8ZKGFd2ULRh7yB7ddHs4zI4sqOaXC750QdTIM9w/BOXQmkrovNx
	 NGo8AK3RtcPxFPVhhTbYr7R85B+jeUAaf9QWaF7ZHGratpV2n5qST/vSeUXRkBxQWv
	 SIol3NpQVoBGg==
Date: Fri, 28 Aug 2026 02:08:39 +0000
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: Guenter Roeck <linux@roeck-us.net>
Cc: Wanming Gao <wanming.gao@mediatek.com>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, wallace.yu@mediatek.com,
	Jarried.Lin@mediatek.com, vince-wl.liu@mediatek.com
Subject: Re: [PATCH v2] watchdog: mediatek: acknowledge pretimeout interrupt
Message-ID: <apDtp62h_4uZQ84H@google.com>
References: <20260827092616.2724197-1-wanming.gao@mediatek.com>
 <5e1793d5-6c78-4372-872a-069fcd99a07a@roeck-us.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5e1793d5-6c78-4372-872a-069fcd99a07a@roeck-us.net>
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

On Thu, Aug 27, 2026 at 06:54:03AM -0700, Guenter Roeck wrote:
> On Thu, Aug 27, 2026 at 05:26:12PM +0800, Wanming Gao wrote:
> > The MediaTek watchdog pretimeout interrupt is level-triggered and does
> > not have a separate acknowledge register. The interrupt is cleared by
> > changing WDT_MODE_IRQ_LEVEL_EN and then restoring it to its original
> > state. Without this transition, the interrupt may remain asserted and
> > cause an interrupt storm.
> > 
> > After changing WDT_MODE_IRQ_LEVEL_EN, wait 70 us before restoring it.
> > This is longer than two 32 kHz watchdog clock cycles, allowing the
> > level change to propagate across the clock domain.
> > 
> > WDT_MODE is also updated by the watchdog start, stop, and pretimeout
> > operations. Protect its read-modify-write sequences and the complete
> > IRQ acknowledge sequence with the watchdog spinlock so that concurrent
> > updates cannot overwrite the temporary IRQ level state.
> > 
> > Signed-off-by: Wanming Gao <wanming.gao@mediatek.com>
> 
> Applied.

Might be a bit late, but tested on a MT8196 board:
Tested-by: Tzung-Bi Shih <tzungbi@kernel.org>
Reviewed-by: Tzung-Bi Shih <tzungbi@kernel.org>

