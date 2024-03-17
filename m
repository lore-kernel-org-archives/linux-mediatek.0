Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8ECCCC54E60
	for <linux-mediatek@archiver.kernel.org>; Sun, 17 Mar 2024 18:57:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0w5c/rl7u6+Kv9CZKtI7gCTfLxHk7PtUgfjyQBASEgU=; b=RiByKNUKGLXbp47V9vrjnK7Pfh
	vbpH8q444GOsESbueLZgUX6sAmxrfbVXhKJcDKEQ1C8RnA4mzogK0LY0E/cO+d/NnewY83LS5z7o2
	2AQwslJhlIKeRVOCpi4KpVdj7XKify7Lens6zOdH4otQM11MPhvDIVn4/mi7xrJjz7szgDw95rc7t
	pJofMoKvQv0BKVfEODiPFXRkfgVnzZgzBxREY7jZEnSUl1AlWZ6V+O8rjt5D4wYl0PxtvXCp2iJim
	kVr0HJ+USQAe0VI4Whac2oAZw0wC0RvFJnU1DmUrEUGwRqA1itiLtonvcBUErajx4DMe1tGBbl0vK
	SYo/q5lg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rlvgp-000000066sO-3jKz;
	Sun, 17 Mar 2024 18:56:59 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rlvgm-000000066rb-3rmb;
	Sun, 17 Mar 2024 18:56:58 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 0AA18CE091B;
	Sun, 17 Mar 2024 18:56:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D5428C433F1;
	Sun, 17 Mar 2024 18:56:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1710701813;
	bh=C1Qhz7RVqLKa7aHBWi3LhaNuIEVA6aUWA51sPBVTAu0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=L5HhIvuvC0Xd2nB2Rr2eXkrHIHAgMhFoOvCNUMOpvinqWDDpj6mnggSOFGku9EPup
	 6Qtd95gN3+9SoABc4z+wH3nBE+2f1pj5yhyJMKydaia7qcbD4NHBy4EUxtc7y/0c6i
	 0NpEi5e6pE5aoPkv8dy5P+A5vb6wgplbits4tFi0ewLe5lj8H8E7w67Pxb7E3Ea1Z0
	 EpIWZ2XRY7BZ2knGzqNrTJ6TAzBGF4q9AqNKVyRHtrI4XYdO4RfRYxpDpOtgV8DQSf
	 p8vK/0GAAo6N/VHP2GKg3Lb0ro8nnEjixcx5Jbz4wqns5olFR/Ez4Nq1tKqDCo1TV7
	 hz7tPsdQFoHnA==
Date: Sun, 17 Mar 2024 12:56:50 -0600
From: Rob Herring <robh@kernel.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: zhourui@huaqin.corp-partner.google.com, amergnat@baylibre.com,
	allen-kh.cheng@mediatek.com, trevor.wu@mediatek.com,
	wenst@chromium.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, u.kleine-koenig@pengutronix.de,
	shane.chien@mediatek.com, claudiu.beznea@tuxon.dev,
	ckeepax@opensource.cirrus.com, arnd@arndb.de, dianders@chromium.org,
	maso.huang@mediatek.com, linux-kernel@vger.kernel.org,
	broonie@kernel.org, matthias.bgg@gmail.com,
	kuninori.morimoto.gx@renesas.com, perex@perex.cz, frank.li@vivo.com,
	nicolas.ferre@microchip.com, eugen.hristev@collabora.com,
	linux-sound@vger.kernel.org, kernel@collabora.com,
	jiaxin.yu@mediatek.com, alsa-devel@alsa-project.org,
	xiazhengqiao@huaqin.corp-partner.google.com, conor+dt@kernel.org,
	shraash@google.com, krzysztof.kozlowski+dt@linaro.org,
	jarkko.nikula@bitmer.com, tiwai@suse.com,
	devicetree@vger.kernel.org, nfraprado@collabora.com,
	lgirdwood@gmail.com, alpernebiyasak@gmail.com
Subject: Re: [PATCH v3 18/22] ASoC: dt-bindings: mt8195: Document
 audio-routing and dai-link subnode
Message-ID: <171070180968.2064436.13730344505165818889.robh@kernel.org>
References: <20240313110147.1267793-1-angelogioacchino.delregno@collabora.com>
 <20240313110147.1267793-19-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240313110147.1267793-19-angelogioacchino.delregno@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240317_115657_165890_49176342 
X-CRM114-Status: GOOD (  10.52  )
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


On Wed, 13 Mar 2024 12:01:43 +0100, AngeloGioacchino Del Regno wrote:
> Document the dai-link subnodes and the audio-routing property, allowing
> to describe machine specific audio hardware and links in device tree.
> 
> While at it, also deprecate the old properties which were previously
> used with driver hardcoded configuration.
> 
> Also, since describing machine specific audio hardware and links replaces
> the now deprecated old logic doing the same in a driver hardcoded fashion,
> it is not allowed to have both the old and new properties together.
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
>  .../bindings/sound/mt8195-mt6359.yaml         | 134 ++++++++++++++++++
>  1 file changed, 134 insertions(+)
> 

Reviewed-by: Rob Herring <robh@kernel.org>


