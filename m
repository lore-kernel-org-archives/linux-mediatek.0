Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E642CCA479
	for <linux-mediatek@archiver.kernel.org>; Mon,  4 Jul 2022 08:47:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nlJuyLf43CC8Bxl3Wa76uPDDhymV3XIB8AUvk/tGtvg=; b=hErxL9RyspOxdEcCu/IkGkE/v2
	sk78GQaDiuCXY4lbW3ARMf9hOfH6frG+LxZ0AYf8NkGz4jkgc77dvJD3sHDjgR71jY13xutKJOXIH
	dXC/lR9CwOa3IjuVpC5VdCWKw5NozEbptWWtrkowtH8rBA9cnvH3qeKCG/p7ixCo60Jpf/qa7iSKX
	xTfdzsiNQBbF1M/cZN2g0awjqc86mhqYtuvF4ANhGyco62KzL3fLFe8+StxDCpul+GOgigteRswHC
	ZaBU4WR4ZbylVt2YZAu2rg3wYJ0yR5Nc12KnL6dQXhVC1TRt06KhQxQAYy30zWdEatFetAhTaty2t
	rTHNsILg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o8HjK-00694p-H7; Mon, 04 Jul 2022 08:46:54 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o8Hj9-00690e-Km; Mon, 04 Jul 2022 08:46:45 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 3C6506601638;
	Mon,  4 Jul 2022 09:46:39 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1656924399;
	bh=R+jPQDQz31uGzbA+I3t13TC7Pm3CHBJfMIbtLFynbJc=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=ZwEVDT7bh3ClwE4hCtFrRK6QldluIZRtMf28iTUXRQRKSFkhv2a3BrK+CGYZ6GhU5
	 opneRPXrHGdo+Plj26UwH1nvGlFARPU+d5A75BgZj+nGBMSnzvvxJ95MTlY9Nmk200
	 gg68cKKkLBxdNLu9iuCIm63B5NdWYVyRRnKiOB4nC384Pq3SnNXE2pEdTk/CKMIb+7
	 1+/P7cjuttfiqgRk2F0cXhYwX6Zz3F72VuhPnMvXBWTzuEGC5IWoVCmUlhw0uV/AW5
	 7GvDY1VexZ7o5pZ19J0m65UcYjC6oTRH+YT5A4YKzpow0GDJeRvsAthjYM+lipUwtq
	 RDYQuzwe8h/3g==
Message-ID: <e18333d0-e69b-4ab9-68ca-31b69ef043f5@collabora.com>
Date: Mon, 4 Jul 2022 10:46:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH 0/3] clk: mediatek: mt8183: Simplify with
 mtk_clk_simple_*()
Content-Language: en-US
To: Chen-Yu Tsai <wenst@chromium.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>
Cc: Matthias Brugger <matthias.bgg@gmail.com>,
 Rex-BC Chen <rex-bc.chen@mediatek.com>,
 Chun-Jie Chen <chun-jie.chen@mediatek.com>, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20220701145133.1152387-1-wenst@chromium.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220701145133.1152387-1-wenst@chromium.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220704_014643_865434_ED3BEC2B 
X-CRM114-Status: GOOD (  16.42  )
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

Il 01/07/22 16:51, Chen-Yu Tsai ha scritto:
> As part of clk driver support for MT8192, a pair of "simple"
> probe/remove functions was introduced that provided boilerplate
> driver functions for clk drivers that fit a simple model: they only
> needed to register clock gates. Using them reduces the redundant
> boilerplate code needed for each driver. Instead, only a data structure
> pointing to the clock gate array and the number of clocks is needed.
> 
> This series converts all the MT8183 clock drivers that only contain
> clock gates over to these wrapper functions. For instances where the
> clk driver not only registers clock gates, the extra action is properly
> sequenced with the wrapper functions instead of outright replacing
> the probe functions. The converted drivers also get removal support.
> This also reduces the overall size by nearly 600 bytes.
> 
> Patch 1 converts the MT8183 clk drivers that only do clock gate
> registration.
> 
> Patch 2 converts the audio clk driver, which also populates sub-devices.
> 
> Patch 3 converts the mfgcfg (GPU wrapper) clk driver, which also needs
> to enable runtime PM, as it is tied to a power domain.
> 
> Please have a look, and merge if possible.

Hello Chen-Yu,
great cleanup there!

...I *particularly like* the mfgcfg commit :-) :-)

For the entire series:

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

