Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1AB5BC54E90
	for <linux-mediatek@archiver.kernel.org>; Sun, 25 May 2025 06:01:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:From:Cc:To:MIME-Version:Date:Message-ID:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=v2X8+X30CM3V5/wETHdMF5hqQKdIu2T1PjWXAKtau/8=; b=KyOtzHRJHdzrw0WjllTFMTDOYH
	BjJE2ekfirHa2N9ZbWXdnxHyRdvUurem/6mNM7zXq5mPg6DHa1rcPn81X06b35XDtT9ZolAaOVXCa
	Ftrlf1aCkntjE6FtdC+6HeUlX/xmRxbtaDWoljKdBDfOli8fce4Q5cvGbokgufuxrt0uEpk6JbVTV
	Q7MHUXoizaGJdN7fkW0xJM3EXO6LNqekTBG18dpzh1qhwv7wRdLzW4tzZ9reAPxlmu1j5+w+f499u
	mkAE6T4I8FFF98DNcM71vtK4oT/W36Hlxpf3h3Vpcegkz4Ml7roekzLusBDX8kqjQMbt5if5tf+KT
	sWaHIk2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJ4Qb-00000006bve-27sD;
	Sun, 25 May 2025 06:01:45 +0000
Received: from mx3.molgen.mpg.de ([141.14.17.11])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJ4QX-00000006buu-3tLC
	for linux-mediatek@lists.infradead.org;
	Sun, 25 May 2025 06:01:43 +0000
Received: from [192.168.2.107] (p5b13a30a.dip0.t-ipconnect.de [91.19.163.10])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: pmenzel)
	by mx.molgen.mpg.de (Postfix) with ESMTPSA id 685D661E64783;
	Sun, 25 May 2025 08:01:05 +0200 (CEST)
Message-ID: <c8a64686-f1a2-44f1-9d13-fd5b4f923e0f@molgen.mpg.de>
Date: Sun, 25 May 2025 08:01:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 LKML <linux-kernel@vger.kernel.org>
From: Paul Menzel <pmenzel@molgen.mpg.de>
Subject: MT8183: Only maximum resolution 1280x720?
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250524_230142_119576_93E316D4 
X-CRM114-Status: UNSURE (   8.82  )
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

Dear Linux folks,


On the older MT8183 device Lenovo IdeaPad Duet Chromebook, running 
ChromeOS with their Linux 5.10.x, connecting a 1920x1080 Dell monitor to 
a USB-C adapter using HDMI, only the resolution of 1280x720 is 
configured, although the adapter also support 1920x1080. It happens with 
all adapters, for example, LMP USB-C mini Dock [1].

I reported it to the Chromium OS issue tracker [1], and the last comment is:

> It seems the display pipeline for the internal display (DSI) has
> higher clock rate. Also, the resolution support depends on the
> refresh rate as well, so the claimed 2400x1080 might only work on
> lower refresh rate.
> 
> For the external display, the display modes are mostly rejected by
> the pre-defined max_clock_khz in mtk_dpi.c:
> https://elixir.bootlin.com/linux/v6.11.4/source/drivers/gpu/drm/mediatek/mtk_dpi.c#L940

Can you confirm this? The font rendering seems not so good in the lower 
resolution, and strangely, playing movies these seem to be rendered in 
higher resolution (or the monitor or hardware does a good job in 
up-scaling).


Kind regards,

Paul


[1]: https://lmp-adapter.com/product/lmp-usb-c-mini-dock/
[2]: https://issuetracker.google.com/issues/295666708

