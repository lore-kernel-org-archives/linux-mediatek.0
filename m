Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69A8BC48BF6
	for <linux-mediatek@archiver.kernel.org>; Thu,  7 Mar 2024 13:39:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:Cc:To:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UGz/5go1VG24AIf2ufTcxw+GamD7+DEsi9cqdUO5ozE=; b=zs8XctfKNRK6JBqHLKAdKMRTUA
	gAP7L5OANPb1ttrVMx//70bJd3MWJH2EneA6paNz9MmPY5q+VfOeXH9dFoAr/jXB+KQaIo2HHWdA7
	IyaMZ/2mxAx4u+/B0Ud5WRIloofhryrURHNvl1PU/XdEgqXwNAfsRKSx4yavpxAnuHzWbCbyvmiDa
	/+nftbZBZvRLYe3awpPIfyu18ArTa/6VHnfKLOi+Ytz84gKVq5HHySLo0RY4bbrz1NGh4QGAIgA1G
	54rbBhV4Shn2SOgIg+ivr0lX0d4e8mC/MGMFv+6ixnMdFsgQF0tB+xHa9r20fa6sRd9fKXyShCk6C
	CnQY5SNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1riDxj-00000004mZb-3s64;
	Thu, 07 Mar 2024 13:39:07 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1riDxZ-00000004mT7-1Fnj;
	Thu, 07 Mar 2024 13:39:01 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id BA7FD617E0;
	Thu,  7 Mar 2024 13:38:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 51378C433F1;
	Thu,  7 Mar 2024 13:38:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1709818735;
	bh=QOIq153Hh97YArqMO6ndMKTIDS/Bu4Z0Gow+bUdmicI=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
	b=QYe5b9I6O512SuBx+pMc36xCatZ7plD9jkJUTPdM4VE2w1M5NU5HSNzEqZaTjYzNz
	 e77JAePu4bGHeX3o00+lpqMwKsETLSKjothuTlX8EYemEkd4s+Pi7OTGwUU43XxaBv
	 I4PYhg2Ppz++WdTcqIofwVVpk0SU4aH32+ogjWV9suVuXfpHnCxGhoufySCTk2asG8
	 3cQFB7M06hoBzi/85bLoyh+TkHQPbfWIj9m2ZN/ESAZ9VRBF7JagoNwr+JKst21m5H
	 CrTr/cJtN3qzS9hMsWEF7hLz4ovLJM3lxu6bn/uE2oZBffBRy/wPBwy3W8JyxubY6r
	 QMsif1rAmhqgQ==
Date: Thu, 07 Mar 2024 07:38:54 -0600
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: Rob Herring <robh@kernel.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: matthias.bgg@gmail.com, eugen.hristev@collabora.com, 
 devicetree@vger.kernel.org, nfraprado@collabora.com, 
 claudiu.beznea@tuxon.dev, zhourui@huaqin.corp-partner.google.com, 
 broonie@kernel.org, wenst@chromium.org, dianders@chromium.org, 
 shane.chien@mediatek.com, linux-kernel@vger.kernel.org, lgirdwood@gmail.com, 
 allen-kh.cheng@mediatek.com, shraash@google.com, frank.li@vivo.com, 
 maso.huang@mediatek.com, perex@perex.cz, jiaxin.yu@mediatek.com, 
 linux-mediatek@lists.infradead.org, u.kleine-koenig@pengutronix.de, 
 alsa-devel@alsa-project.org, trevor.wu@mediatek.com, 
 nicolas.ferre@microchip.com, linux-sound@vger.kernel.org, 
 amergnat@baylibre.com, kernel@collabora.com, tiwai@suse.com, 
 jarkko.nikula@bitmer.com, linux-arm-kernel@lists.infradead.org, 
 kuninori.morimoto.gx@renesas.com, 
 xiazhengqiao@huaqin.corp-partner.google.com, ckeepax@opensource.cirrus.com, 
 alpernebiyasak@gmail.com, arnd@arndb.de, krzysztof.kozlowski+dt@linaro.org, 
 conor+dt@kernel.org
In-Reply-To: <20240307114445.196981-21-angelogioacchino.delregno@collabora.com>
References: <20240307114445.196981-1-angelogioacchino.delregno@collabora.com>
 <20240307114445.196981-21-angelogioacchino.delregno@collabora.com>
Message-Id: <170981873072.2495513.10220063572625307394.robh@kernel.org>
Subject: Re: [PATCH v2 20/22] ASoC: dt-bindings: mt8186: Document
 audio-routing and dai-link subnode
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240307_053857_724339_306E75DC 
X-CRM114-Status: GOOD (  11.60  )
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


On Thu, 07 Mar 2024 12:44:43 +0100, AngeloGioacchino Del Regno wrote:
> Document the dai-link subnodes and the audio-routing property, allowing
> to describe machine specific audio hardware and links in device tree.
> 
> While at it, also deprecate the old properties which were previously
> used with the driver's partially hardcoded configuration.
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
>  .../sound/mt8186-mt6366-da7219-max98357.yaml  | 112 ++++++++++++++++--
>  .../sound/mt8186-mt6366-rt1019-rt5682s.yaml   | 102 ++++++++++++++--
>  2 files changed, 199 insertions(+), 15 deletions(-)
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/sound/mt8186-mt6366-rt1019-rt5682s.example.dtb: mt8186-sound: 'model' does not match any of the regexes: '.*-dai-link$', 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/sound/mt8186-mt6366-rt1019-rt5682s.yaml#

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20240307114445.196981-21-angelogioacchino.delregno@collabora.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


