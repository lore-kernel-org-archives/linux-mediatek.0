Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 939AAC41513
	for <linux-mediatek@archiver.kernel.org>; Tue,  7 May 2024 16:26:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eaU9lfNeGvzDk/FguUmNiX85th2MDtqaVJk9CUYYnuw=; b=Cdc6+OJtufCyDVdG+iXrh6nJTX
	Jm5UCHM/eorXROjSnmLUUpSVFpE/1g2A1dIwiCTfyp+wrz82ctaWs9F9G11rxwVzYflWgFKRe7EIb
	Kb5rxMZMz2dZ/6AoBPW+ZhxXn8KTisFX7h6iSo164X+moprv+VMD7zSj8poWfZOsNn5H0I9yEpF2c
	auhCWw1KeAtUl4A4rQ6JYZEo87SOSVr1F5TL/T5sZwvMpi6j6NU1SlQN7Wh7EhCXAbHn+jcgPtRhM
	4TSm1/SQBPg9vwDrhHhV533IBitLlyt1LZqw5RKaDK910u376eFmZQiHGMxgynRv2l0hUmSiUgaeq
	HsQ4/yWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s4Ne4-0000000BxGz-13tS;
	Tue, 07 May 2024 16:26:24 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s4Ndz-0000000BxFm-3iQi;
	Tue, 07 May 2024 16:26:21 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 381EB6177E;
	Tue,  7 May 2024 16:26:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 98957C2BBFC;
	Tue,  7 May 2024 16:26:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1715099178;
	bh=/5I1D7aRR2QRwr2mUkZwUa89+yp2b+yvvGuDrXWWovQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JpoiKtsCDRWS9H1oYa/F6JwX9mrEjG8l7IWfcqtNn8AuxO8/CG1gIbh+CBbJ+550C
	 WAlUqrQJbhClxSfpmosuhoTg6boD5NTMroeZI9Fd8abpXOQEC8Qfb61cMnMWTcqHGJ
	 qc19+ywvq3bGZfGibwZ9QJ4MV75vqbdvXJoiTpNqc8OSCaY5cI20S51TOvsiyXl93Y
	 WXEaFYRfmR3uzX2eY9TGF9k1Vmkq5xuO8R7wXsQ5ZIef9QFo0svLZwoTEIgMskSn5t
	 fH+QFguKVRjj0sdmB5nqvzlmr5EutpSOO6F74VMLulMZCWuqpPJLvVVXw/9HQauPP4
	 YN1cqa1a8rv2g==
Date: Tue, 7 May 2024 11:26:16 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: mripard@kernel.org, maarten.lankhorst@linux.intel.com,
	krzysztof.kozlowski+dt@linaro.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, conor+dt@kernel.org, ck.hu@mediatek.com,
	airlied@gmail.com, linux-mediatek@lists.infradead.org,
	wenst@chromium.org, chunkuang.hu@kernel.org, daniel@ffwll.ch,
	tzimmermann@suse.de, matthias.bgg@gmail.com, jitao.shi@mediatek.com,
	shawn.sung@mediatek.com, linux-arm-kernel@lists.infradead.org,
	p.zabel@pengutronix.de, dri-devel@lists.freedesktop.org,
	kernel@collabora.com, yu-chang.lee@mediatek.com
Subject: Re: [PATCH v3 1/3] dt-bindings: display: mediatek: Add OF graph
 support for board path
Message-ID: <171509917467.817282.9286531892598521217.robh@kernel.org>
References: <20240502115622.248456-1-angelogioacchino.delregno@collabora.com>
 <20240502115622.248456-2-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240502115622.248456-2-angelogioacchino.delregno@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240507_092620_139280_1404C795 
X-CRM114-Status: GOOD (  15.39  )
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


On Thu, 02 May 2024 13:56:20 +0200, AngeloGioacchino Del Regno wrote:
> The display IPs in MediaTek SoCs support being interconnected with
> different instances of DDP IPs (for example, merge0 or merge1) and/or
> with different DDP IPs (for example, rdma can be connected with either
> color, dpi, dsi, merge, etc), forming a full Display Data Path that
> ends with an actual display.
> 
> The final display pipeline is effectively board specific, as it does
> depend on the display that is attached to it, and eventually on the
> sensors supported by the board (for example, Adaptive Ambient Light
> would need an Ambient Light Sensor, otherwise it's pointless!), other
> than the output type.
> 
> Add support for OF graphs to most of the MediaTek DDP (display) bindings
> to add flexibility to build custom hardware paths, hence enabling board
> specific configuration of the display pipeline and allowing to finally
> migrate away from using hardcoded paths.
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
>  .../display/mediatek/mediatek,aal.yaml        | 40 +++++++++++++++++++
>  .../display/mediatek/mediatek,ccorr.yaml      | 21 ++++++++++
>  .../display/mediatek/mediatek,color.yaml      | 22 ++++++++++
>  .../display/mediatek/mediatek,dither.yaml     | 22 ++++++++++
>  .../display/mediatek/mediatek,dpi.yaml        | 25 +++++++++++-
>  .../display/mediatek/mediatek,dsc.yaml        | 24 +++++++++++
>  .../display/mediatek/mediatek,dsi.yaml        | 27 ++++++++++++-
>  .../display/mediatek/mediatek,ethdr.yaml      | 22 ++++++++++
>  .../display/mediatek/mediatek,gamma.yaml      | 19 +++++++++
>  .../display/mediatek/mediatek,merge.yaml      | 23 +++++++++++
>  .../display/mediatek/mediatek,od.yaml         | 22 ++++++++++
>  .../display/mediatek/mediatek,ovl-2l.yaml     | 22 ++++++++++
>  .../display/mediatek/mediatek,ovl.yaml        | 22 ++++++++++
>  .../display/mediatek/mediatek,postmask.yaml   | 21 ++++++++++
>  .../display/mediatek/mediatek,rdma.yaml       | 22 ++++++++++
>  .../display/mediatek/mediatek,ufoe.yaml       | 21 ++++++++++
>  16 files changed, 372 insertions(+), 3 deletions(-)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


