Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CECB9C54E67
	for <linux-mediatek@archiver.kernel.org>; Sun, 17 Mar 2024 19:00:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5huDgz64hKaBNk1Xw58S9x4PqoOa5Is3YXuClCLbiJM=; b=coMxkG8QRPxjBfs/WeaMmkW46m
	xyWAbJKmDZM5cLotV+Yljh09941GDmc9kbBjtyR5X+N0498a0aIs24CU+PLq5j8Znbg+qSEM9Okaq
	QK7YlfAST4BXuQ84UO/1kJ8yPtxpMn2ngkZCcm8hUiCsdqIcsye6YnC1JpxWNlfml4jwa3ZOaKzeV
	Md0cyRjUaqxqkBtFH7Gku/pLtHM4ZmCr7KgI87jQAOj7tMFIGBZcNsVVEglLe7dhjVDnVXbStZLFD
	IInhuSbTDxX0LTupllUSxzQCBnQeYyPfFYZUGZfz1iQdqkkpfxV7+QzWjXZlMp4rv5OSmbfznArpp
	GJZkQcyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rlvkG-000000067gp-1xix;
	Sun, 17 Mar 2024 19:00:32 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rlvkB-000000067eF-3jex;
	Sun, 17 Mar 2024 19:00:29 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 1014B60B8B;
	Sun, 17 Mar 2024 19:00:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 37FE5C43390;
	Sun, 17 Mar 2024 19:00:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1710702025;
	bh=/RZ6vS60NQ7l2KxzbBNyf5FX1EAhwhbDNKM40sUmExI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ih7u9U78GGrQuPaX/EAqYOT9tSSJaddG94KNscTMDdJo03OTevfT6uZn3C+QOgrS4
	 AqCsZxcPMGIDNXyNEBFS/VBSIDIkvBm1YZPZUVipttQxhNYIKHifZ8QrH6y/PH4hUY
	 fuwPgcvHgv/UNDZKcMyfqqSCKE1zSeZEVngPRrSYHyt/lQQnJP6rmrEl6tdN6iAhWf
	 H2zQi+DflwByVG/oUxlUTSh20x5Z1ncK+fOEUrJIVl49o6P67tjnP66YONe5qnNoBf
	 aaFLmcc8i5VoQgMCxmJZ+LcheVCcHxhBsUwlSmPmMQafUak80+G+vJj9yQrpsGMkX2
	 8Xvuu2viBgl2w==
Date: Sun, 17 Mar 2024 13:00:17 -0600
From: Rob Herring <robh@kernel.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: kuninori.morimoto.gx@renesas.com, linux-kernel@vger.kernel.org,
	matthias.bgg@gmail.com, shraash@google.com,
	linux-arm-kernel@lists.infradead.org, wenst@chromium.org,
	tiwai@suse.com, trevor.wu@mediatek.com, jiaxin.yu@mediatek.com,
	nicolas.ferre@microchip.com, ckeepax@opensource.cirrus.com,
	linux-sound@vger.kernel.org, amergnat@baylibre.com,
	linux-mediatek@lists.infradead.org, broonie@kernel.org,
	dianders@chromium.org, claudiu.beznea@tuxon.dev,
	nfraprado@collabora.com, conor+dt@kernel.org, kernel@collabora.com,
	alsa-devel@alsa-project.org,
	xiazhengqiao@huaqin.corp-partner.google.com,
	zhourui@huaqin.corp-partner.google.com, lgirdwood@gmail.com,
	alpernebiyasak@gmail.com, shane.chien@mediatek.com, perex@perex.cz,
	u.kleine-koenig@pengutronix.de, jarkko.nikula@bitmer.com,
	frank.li@vivo.com, krzysztof.kozlowski+dt@linaro.org,
	maso.huang@mediatek.com, arnd@arndb.de, devicetree@vger.kernel.org,
	allen-kh.cheng@mediatek.com, eugen.hristev@collabora.com
Subject: Re: [PATCH v3 20/22] ASoC: dt-bindings: mt8186: Document
 audio-routing and dai-link subnode
Message-ID: <171070201412.2068024.3707863657848316004.robh@kernel.org>
References: <20240313110147.1267793-1-angelogioacchino.delregno@collabora.com>
 <20240313110147.1267793-21-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240313110147.1267793-21-angelogioacchino.delregno@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240317_120028_053992_4880ED8D 
X-CRM114-Status: GOOD (  10.37  )
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


On Wed, 13 Mar 2024 12:01:45 +0100, AngeloGioacchino Del Regno wrote:
> Document the dai-link subnodes and the audio-routing property, allowing
> to describe machine specific audio hardware and links in device tree.
> 
> While at it, also deprecate the old properties which were previously
> used with the driver's partially hardcoded configuration.
> 
> Also, since describing machine specific audio hardware and links replaces
> the now deprecated old logic doing the same in a driver hardcoded fashion,
> it is not allowed to have both the old and new properties together.
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
>  .../sound/mt8186-mt6366-da7219-max98357.yaml  | 131 ++++++++++++++++--
>  .../sound/mt8186-mt6366-rt1019-rt5682s.yaml   | 120 ++++++++++++++--
>  2 files changed, 233 insertions(+), 18 deletions(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>


