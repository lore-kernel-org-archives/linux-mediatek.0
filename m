Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3716C4345F
	for <linux-mediatek@archiver.kernel.org>; Mon, 22 Apr 2024 13:30:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TA+g75WqhLdbJFHqUwAZmYr+6ECypyk3nPShy1nu+/I=; b=eogmOjANMV8vJm4o3dwTKw0fI2
	v/XtHqkG1nxX8EXZlCIHuldKkjMu91F0+Dzilue5p0p6PgeDDC2DH79xUgwSNjgsv79hHMF/5BVUn
	Ij240+3QSCbhdMbqNWsfQYe+fgwvTovn42yPRq0pp1KuA0YrOLLN2IYecwJOpYR/VuatF94t2GbE2
	vCewgnquxoCQNaCcSx2dGzgeRxSS551TXPvx8UZUYN0BOoS0qcKbumph2ES0PIm8UEZeR5pUc3RmV
	KVBeakDtJwd341pfgT1Ks8g5MiK2Fr+DaJC5YUkgJulYyr3ZTKAVoo7HwrB3XgqYOT+cL5Hrvknsx
	IK+2sVSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rytkf-0000000DkAY-2HMh;
	Mon, 22 Apr 2024 13:30:33 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rytkb-0000000Dk7j-0q5Q;
	Mon, 22 Apr 2024 13:30:31 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 60173CE0A1D;
	Mon, 22 Apr 2024 13:30:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3312DC113CC;
	Mon, 22 Apr 2024 13:30:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1713792626;
	bh=A2znyBsHTWmdbkt6A3QZvg0H6BjA3WnoxBIAsNlWmr8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZKy/HXQuZdRus/ZPGAEDOtrOlqc+Hs7/f/xiTmlo0N3iCWVivfqNuQjxVrxTF24tg
	 i+hjF/JSWveIzHlYciFCzaqJsY2hUk3OO92e/Mp10Y2vS3XqKWfPKTXzbJP6/cvF7n
	 JYf4Hh7AdTL0RYV6+TlsYMILIam5fbV+TGJYMMaLWck5+N+ACGMmkDc7Ld8h9gb82w
	 yKcD1OlijU8U/YvYHo7DsF4CwVYn/VPL+43TKsy4jxWNqPIaZVrf58CBf4bidkUnnB
	 cqso4X5b5S8uiF8HXcQz6SBF75OHrkntagMdyA3aQWScS8uO5obNQj35jb0g+0g1zW
	 Ub32FZQJJi9/g==
Date: Mon, 22 Apr 2024 08:30:24 -0500
From: Rob Herring <robh@kernel.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: conor+dt@kernel.org, matthias.bgg@gmail.com, gustavoars@kernel.org,
	henryc.chen@mediatek.com, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, broonie@kernel.org,
	linux-mediatek@lists.infradead.org,
	krzysztof.kozlowski+dt@linaro.org, kernel@collabora.com,
	keescook@chromium.org, wenst@chromium.org, djakov@kernel.org,
	amergnat@baylibre.com, lgirdwood@gmail.com,
	devicetree@vger.kernel.org, linux-pm@vger.kernel.org
Subject: Re: [PATCH v4 2/7] dt-bindings: interconnect: Add MediaTek EMI
 Interconnect bindings
Message-ID: <171379262174.1121504.1745329422512464486.robh@kernel.org>
References: <20240418094134.203330-1-angelogioacchino.delregno@collabora.com>
 <20240418094134.203330-3-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240418094134.203330-3-angelogioacchino.delregno@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240422_063029_855796_0DF9FAB3 
X-CRM114-Status: GOOD (  14.19  )
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


On Thu, 18 Apr 2024 11:41:29 +0200, AngeloGioacchino Del Regno wrote:
> Add bindings for the MediaTek External Memory Interface Interconnect,
> which providers support system bandwidth requirements through Dynamic
> Voltage Frequency Scaling Resource Collector (DVFSRC) hardware.
> 
> This adds bindings for MediaTek MT8183 and MT8195 SoCs.
> 
> Note that this is modeled as a subnode of DVFSRC for multiple reasons:
>  - Some SoCs have more than one interconnect on the DVFSRC (and two
>    different kinds of EMI interconnect, and also a SMI interconnect);
> 
>  - Some boards will want to not enable the interconnect driver because
>    some of those are not battery powered (so they just keep the knobs
>    at full thrust from the bootloader and never care scaling busses);
> 
>  - Some DVFSRC interconnect features may depend on firmware.
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
>  .../interconnect/mediatek,mt8183-emi.yaml     | 51 +++++++++++++++++++
>  .../interconnect/mediatek,mt8183.h            | 23 +++++++++
>  .../interconnect/mediatek,mt8195.h            | 44 ++++++++++++++++
>  3 files changed, 118 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/interconnect/mediatek,mt8183-emi.yaml
>  create mode 100644 include/dt-bindings/interconnect/mediatek,mt8183.h
>  create mode 100644 include/dt-bindings/interconnect/mediatek,mt8195.h
> 

Reviewed-by: Rob Herring <robh@kernel.org>


