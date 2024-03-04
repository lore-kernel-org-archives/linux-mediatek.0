Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99545C48BF6
	for <linux-mediatek@archiver.kernel.org>; Mon,  4 Mar 2024 14:24:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TfQCxQnuSVhXFUOb6IquAlBs+DdE7lRUaYpEwQ4e4hA=; b=zfoNmCshfnsSQcXbzMgiDqPYpf
	PhrhU0q5UuTVM/dJNeixCbGe3y0Xg8fHR+Elm2coUSdOjW81SSOy/qF/ZjL1uad1tBjOD4gMfQ5z2
	QMvC9Zo67F4XAAOV1G919C6ZyhaVqEnY3cXBPMtSmyJbqhfVws3xld9jP5ERqZ1a/4nXOA4WMGriI
	ukNE58Z0TicHc1DP4tpZrFi9icdZ5eDyv2kFjpQcGxWzl4wNHq0NQGFtJWNrAVf8hN/t39dC7w30Y
	8M2rSBxdZTir3kei8suT0cBO+mcMxf7olOT+WAAhKJvoRi0bZ0stgmnFizipQbouY5woPvL0bP6zT
	0dwa58hQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rh9FQ-00000009MKj-3vob;
	Mon, 04 Mar 2024 14:24:56 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rh9FM-00000009MJ2-1Zzh;
	Mon, 04 Mar 2024 14:24:54 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 81C81CE1390;
	Mon,  4 Mar 2024 14:24:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E9ABEC433C7;
	Mon,  4 Mar 2024 14:24:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1709562289;
	bh=6gCiVFXmpuEznUgKdT1gpn2oh/lHn5kfV0SnIxnZcus=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LLlpWI/pBrzJtatXQW11HUwzKuXsVyGKKfBiSSowA2WXESzIhQfnBkrEpzBl7V0Nv
	 q2pxS5bCEpGYLg32QR2Tm5c0LnIDmwpdSp+RMa19knG97b3bvgw3njuCgv/oyJ/o7b
	 DrZg9BfvRaYfzndcxmrDqH9vjbU4TLg/WRLaaCjZdJbBFqHPbXZugIwDd9vBvMjvbU
	 P9KOQfg3KdqyBgxq71VObOK7ZS3L1VvR8/nnIefqsB6aO+fOJclNQ6Z92TMMaa8rkx
	 YDNZFqvAZ3wTH/Osq8uQvrg8WsfBXGn/PynwJKAjuPrNr+HL1SVCJiZniXKAZHOhPS
	 LA1aR6hX2oBww==
Date: Mon, 4 Mar 2024 08:24:46 -0600
From: Rob Herring <robh@kernel.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: broonie@kernel.org, wenst@chromium.org, lgirdwood@gmail.com,
	krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
	matthias.bgg@gmail.com, perex@perex.cz, tiwai@suse.com,
	trevor.wu@mediatek.com, maso.huang@mediatek.com,
	xiazhengqiao@huaqin.corp-partner.google.com, arnd@arndb.de,
	kuninori.morimoto.gx@renesas.com, shraash@google.com,
	amergnat@baylibre.com, nicolas.ferre@microchip.com,
	u.kleine-koenig@pengutronix.de, dianders@chromium.org,
	frank.li@vivo.com, allen-kh.cheng@mediatek.com,
	eugen.hristev@collabora.com, claudiu.beznea@tuxon.dev,
	jarkko.nikula@bitmer.com, jiaxin.yu@mediatek.com,
	alpernebiyasak@gmail.com, ckeepax@opensource.cirrus.com,
	zhourui@huaqin.corp-partner.google.com, nfraprado@collabora.com,
	alsa-devel@alsa-project.org, shane.chien@mediatek.com,
	linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, kernel@collabora.com
Subject: Re: [PATCH 20/22] ASoC: dt-bindings: mt8186: Document audio-routing
 and dai-link subnode
Message-ID: <20240304142446.GA171936-robh@kernel.org>
References: <20240227120939.290143-1-angelogioacchino.delregno@collabora.com>
 <20240227120939.290143-21-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240227120939.290143-21-angelogioacchino.delregno@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240304_062452_835090_29939445 
X-CRM114-Status: UNSURE (   9.95  )
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

On Tue, Feb 27, 2024 at 01:09:37PM +0100, AngeloGioacchino Del Regno wrote:
> Document the dai-link subnodes and the audio-routing property, allowing
> to describe machine specific audio hardware and links in device tree.
> 
> While at it, also deprecate the old properties which were previously
> used with the driver's partially hardcoded configuration.

This can be combined with patch 19. Same comments apply.

> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
>  .../sound/mt8186-mt6366-da7219-max98357.yaml  | 112 ++++++++++++++++--
>  .../sound/mt8186-mt6366-rt1019-rt5682s.yaml   | 112 ++++++++++++++++--
>  2 files changed, 210 insertions(+), 14 deletions(-)

