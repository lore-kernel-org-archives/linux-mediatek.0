Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DB4BCAC593
	for <linux-mediatek@archiver.kernel.org>; Fri, 12 Sep 2025 06:19:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aD7ttNZXZvg/h7Is0Pm7SDu3tc8C6P/Ssb1aJIg+2tw=; b=GtDdZ1h5CSvTk8wQ7Qye4CJgCR
	oGwk6FGVMUGRsV15BELMu/CkzAdJ6hXRlaLSCdaIrumcUvpmjeLPgu1BbnZ4ewkO5+WpmgcshFJUL
	pY7r1+GxR/eW7DVt6SUQZXrNrMuCp1sXllA2uLnLCpIU8Of+cv1CQ/W0sOzf6V4ucjA7YvmKtrmAN
	vpIkJIcGAdiLimHMHtIi0w3k61b52yTvNTISMJgyl/LGO0R/SMVpQiIHrHrQbtwZC8f8vom9EkHDe
	qhrdOBy4/V+h6Kj+jm/sIymIaXB1ulUCB2JtfHDx1T9l+KNhwhZnrcnyXa2muvbESCcb/41WT0Fal
	3YOyY62Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwx8D-00000007MG0-0mP3;
	Fri, 12 Sep 2025 06:19:37 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwx8B-00000007MFS-2sIR;
	Fri, 12 Sep 2025 06:19:35 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id D99B0601AE;
	Fri, 12 Sep 2025 06:19:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F1432C4CEF4;
	Fri, 12 Sep 2025 06:19:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757657974;
	bh=o8hk3zQNATXcYNezfLWUb6kcglAXSeb1kRjCzbDhJIw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=TAfBsjASg0j47G0aj71WpPiHwEzVjLh8frxE9MTlUre9o4kgdD0AT9C2l8NxGKnp8
	 7IFEcYbPKl8ue4IGOaLDKbEJWbquIJXUUac3GR9E8dEo3Jh7cz5KyP8qh3mPDlVArz
	 meCJadPxluLfi2gaQmclFasUpdycrQpAxtv6mRtBuVlbMKoWoMt6LIpZ7jlivjF0dg
	 SBAPM4eomEn87Qqye6+Q6x4eBzcUHZ4H1iHg9AmOB6gpsAuvBFvm28piizL42FE7pD
	 /GR042vD8YIz4ZS/9nvYqbhp9jXT7LOUgXCQDvL0U4FZWriZxiFMJkIGihya5dMtB1
	 KwwnUs4bBEHfQ==
Date: Fri, 12 Sep 2025 08:19:32 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Ariel D'Alessandro <ariel.dalessandro@collabora.com>
Cc: airlied@gmail.com, amergnat@baylibre.com, andrew+netdev@lunn.ch, 
	andrew-ct.chen@mediatek.com, angelogioacchino.delregno@collabora.com, broonie@kernel.org, 
	chunkuang.hu@kernel.org, conor+dt@kernel.org, davem@davemloft.net, 
	dmitry.torokhov@gmail.com, edumazet@google.com, flora.fu@mediatek.com, heiko@sntech.de, 
	houlong.wei@mediatek.com, jeesw@melfas.com, kernel@collabora.com, krzk+dt@kernel.org, 
	kuba@kernel.org, lgirdwood@gmail.com, linus.walleij@linaro.org, 
	louisalexis.eyraud@collabora.com, luiz.dentz@gmail.com, maarten.lankhorst@linux.intel.com, 
	marcel@holtmann.org, matthias.bgg@gmail.com, mchehab@kernel.org, 
	minghsiu.tsai@mediatek.com, mripard@kernel.org, p.zabel@pengutronix.de, pabeni@redhat.com, 
	robh@kernel.org, sean.wang@kernel.org, simona@ffwll.ch, 
	support.opensource@diasemi.com, tiffany.lin@mediatek.com, tzimmermann@suse.de, 
	yunfei.dong@mediatek.com, devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	linux-arm-kernel@lists.infradead.org, linux-bluetooth@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, linux-rockchip@lists.infradead.org, linux-sound@vger.kernel.org, 
	netdev@vger.kernel.org
Subject: Re: [PATCH v2 06/12] dt-bindings: display: mediatek,ufoe: Add
 mediatek,gce-client-reg property
Message-ID: <20250912-innocent-polite-cricket-05dbd8@kuoka>
References: <20250911151001.108744-1-ariel.dalessandro@collabora.com>
 <20250911151001.108744-7-ariel.dalessandro@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250911151001.108744-7-ariel.dalessandro@collabora.com>
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

On Thu, Sep 11, 2025 at 12:09:55PM -0300, Ariel D'Alessandro wrote:
> Currently, users of Mediatek UFOe (Unified Frame Optimization engine) DT
> bindings set mediatek,gce-client-reg node property, which is missing from
> the DT schema.
> 
> For example, device tree arch/arm64/boot/dts/mediatek/mt8173.dtsi is
> causing the following dtb check error:
> 
> ```
> $ make CHECK_DTBS=y mediatek/mt8173-elm.dtb
>    SCHEMA  Documentation/devicetree/bindings/processed-schema.json
>    DTC [C] arch/arm64/boot/dts/mediatek/mt8173-elm.dtb
> [...]

You can drop above 4 lines, they are obvious. Your "dtbs_check error"
message already defined that.

> arch/arm64/boot/dts/mediatek/mt8173-elm.dtb: ufoe@1401a000
> (mediatek,mt8173-disp-ufoe): 'mediatek,gce-client-reg' does not match
> any of the regexes: '^pinctrl-[0-9]+$'

The warning message should not be wrapped, so this should be two lines.
Maybe entire warning should be in one line, at least that's what I would
do, after dropping "arch/arm64/boot/dts/".

Anyway, no need to resend just for these. Thanks for the update.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


