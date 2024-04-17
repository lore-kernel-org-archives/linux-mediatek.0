Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81DAAC4345F
	for <linux-mediatek@archiver.kernel.org>; Wed, 17 Apr 2024 19:14:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=A7onPiT2Ige5cnZEAwGtJ1JLpZgpxPQg3QBjw0VZMco=; b=gQK92zNEV9Zc6ZeEDMbYTyzn1z
	eZ3S5iEk7nm+0edoJ4TBS/mJQseTSiTIPU75PJuKSktTtJntZg0QUYNhG+eTaBOq5YRCwS4rYg//J
	v69rlxiTDorrTTjPHCQWXqYjqWqvZTAMa/FwjbRSF/Y8Py2Qagz71cTpRsguWTrrs6j0umj25zHP8
	8Z5WG8XaU0Zc6rguhkkqB6tZLB9Wb4l/XEd95ejsh4Zq7yCH2MHfJSC1q2q9OAAABV0ndbPybzVBa
	IWpCwiu/H3WEcy8hwsoY54kH7+AQAeATnA1/fNb7jViAOmGOitHl49DSSvJJiEFcSmfqPSqwf7Iu/
	7siE/wxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rxAk9-0000000HKPg-1Sro;
	Wed, 17 Apr 2024 19:14:53 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rxAk5-0000000HKNt-2tyE;
	Wed, 17 Apr 2024 19:14:51 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id ACA2BCE1673;
	Wed, 17 Apr 2024 19:14:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 14948C072AA;
	Wed, 17 Apr 2024 19:14:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1713381287;
	bh=a/flBp7hYPf0Kun3Ragy74rejtcqB40x2SVCVKa4trY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=N2CJEN5G5R5VAfeGdC+EDkUa4TYHpR24KnWWRGW+FFjvGYB9MU/zKdhXpQ+vbBRdl
	 nrGYFWA6qWS0wxkzGyxcLDi7BG86Qf4yhrYpVzobvGKrL6CChXUr62i+nKEZ7itVJr
	 xC3eSlZF47jp6VgvaGGpk5TIJrS5ps2M+31qb83XZmCSv+ozdUCMKAxBJJNFu+VYXU
	 Pic75JU77c/EnWnxYp246/xeWh/Heqc7dpcW+DG8pNT2bbQiifPJu1PET4Q1+FHcZi
	 yOOrKfxsINGG+tiAQ7KyJvHIHCIC3IUYobsslx1DY2WNVVILO7Sm+XF++37BWarfl4
	 sgEZilsJx+bQQ==
Date: Wed, 17 Apr 2024 14:14:45 -0500
From: Rob Herring <robh@kernel.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: djakov@kernel.org, krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org, matthias.bgg@gmail.com, lgirdwood@gmail.com,
	broonie@kernel.org, keescook@chromium.org, gustavoars@kernel.org,
	henryc.chen@mediatek.com, linux-pm@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, kernel@collabora.com,
	wenst@chromium.org, amergnat@baylibre.com
Subject: Re: [PATCH v2 2/7] dt-bindings: interconnect: Add MediaTek EMI
 Interconnect bindings
Message-ID: <20240417191445.GB3101736-robh@kernel.org>
References: <20240417091442.170505-1-angelogioacchino.delregno@collabora.com>
 <20240417091442.170505-3-angelogioacchino.delregno@collabora.com>
 <20240417145402.GA2355631-robh@kernel.org>
 <207eb8d7-1a40-4114-a84b-26616dc39fcc@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <207eb8d7-1a40-4114-a84b-26616dc39fcc@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240417_121450_126625_E1680FB0 
X-CRM114-Status: GOOD (  26.23  )
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

On Wed, Apr 17, 2024 at 05:32:54PM +0200, AngeloGioacchino Del Regno wrote:
> Il 17/04/24 16:54, Rob Herring ha scritto:
> > On Wed, Apr 17, 2024 at 11:14:37AM +0200, AngeloGioacchino Del Regno wrote:
> > > Add bindings for the MediaTek External Memory Interface Interconnect,
> > > which providers support system bandwidth requirements through Dynamic
> > > Voltage Frequency Scaling Resource Collector (DVFSRC) hardware.
> > > 
> > > This adds bindings for MediaTek MT8183 and MT8195 SoCs.
> > > 
> > > Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> > > ---
> > >   .../interconnect/mediatek,mt8183-emi.yaml     | 76 +++++++++++++++++++
> > >   .../interconnect/mediatek,mt8183.h            | 23 ++++++
> > >   .../interconnect/mediatek,mt8195.h            | 44 +++++++++++
> > >   3 files changed, 143 insertions(+)
> > >   create mode 100644 Documentation/devicetree/bindings/interconnect/mediatek,mt8183-emi.yaml
> > >   create mode 100644 include/dt-bindings/interconnect/mediatek,mt8183.h
> > >   create mode 100644 include/dt-bindings/interconnect/mediatek,mt8195.h
> > > 
> > > diff --git a/Documentation/devicetree/bindings/interconnect/mediatek,mt8183-emi.yaml b/Documentation/devicetree/bindings/interconnect/mediatek,mt8183-emi.yaml
> > > new file mode 100644
> > > index 000000000000..3ad60fd21f83
> > > --- /dev/null
> > > +++ b/Documentation/devicetree/bindings/interconnect/mediatek,mt8183-emi.yaml
> > > @@ -0,0 +1,76 @@
> > > +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> > > +%YAML 1.2
> > > +---
> > > +$id: http://devicetree.org/schemas/interconnect/mediatek,mt8183-emi.yaml#
> > > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > > +
> > > +title: MediaTek External Memory Interface (EMI) Interconnect
> > > +
> > > +maintainers:
> > > +  - AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> > > +
> > > +description: |
> > > +  EMI interconnect providers support system bandwidth requirements through
> > > +  Dynamic Voltage Frequency Scaling Resource Collector (DVFSRC) hardware.
> > > +  The provider is able to communicate with the DVFSRC through Secure Monitor
> > > +  Call (SMC).
> > > +
> > > +             ICC provider         ICC Nodes
> > > +                              ----          ----
> > > +             _________       |CPU |   |--- |VPU |
> > > +    _____   |         |-----  ----    |     ----
> > > +   |     |->|  DRAM   |       ----    |     ----
> > > +   |DRAM |->|scheduler|----- |GPU |   |--- |DISP|
> > > +   |     |->|  (EMI)  |       ----    |     ----
> > > +   |_____|->|_________|---.   -----   |     ----
> > > +               /|\         `-|MMSYS|--|--- |VDEC|
> > > +                |             -----   |     ----
> > > +                |                     |     ----
> > > +                | change DRAM freq    |--- |VENC|
> > > +             --------                 |     ----
> > > +    SMC --> | DVFSRC |                |     ----
> > > +             --------                 |--- |IMG |
> > > +                                      |     ----
> > > +                                      |     ----
> > > +                                      |--- |CAM |
> > > +                                            ----
> > > +
> > > +properties:
> > > +  compatible:
> > > +    enum:
> > > +      - mediatek,mt8183-emi
> > > +      - mediatek,mt8195-emi
> > > +
> > > +  reg:
> > > +    maxItems: 1
> > > +
> > > +  '#interconnect-cells':
> > > +    const: 1
> > > +
> > > +required:
> > > +  - compatible
> > > +  - '#interconnect-cells'
> > > +
> > > +unevaluatedProperties: false
> > > +
> > > +examples:
> > > +  - |
> > > +    #include <dt-bindings/interconnect/mediatek,mt8195.h>
> > > +
> > > +    soc {
> > > +        #address-cells = <2>;
> > > +        #size-cells = <2>;
> > > +
> > > +        system-controller@10012000 {
> > > +            compatible = "mediatek,mt8195-dvfsrc";
> > > +            reg = <0 0x10012000 0 0x1000>;
> > > +            #address-cells = <1>;
> > > +            #size-cells = <0>;
> > > +
> > > +            emi_icc: interconnect@1 {
> > > +                compatible = "mediatek,mt8195-emi";
> > > +                reg = <1>;
> > > +                #interconnect-cells = <1>;
> > 
> > 
> > There's not really any need for this node. Just put #interconnect-cells
> > in the parent.
> > 
> 
> Actually, I modeled it to be a subnode of the DVFSRC for multiple reasons:
> 
> 1. Some SoCs have more than one interconnect on the DVFSRC (two different kinds
>    of EMI interconnect, and then also a SMI interconnect); and
> 
> 2. Some boards will want to not enable the interconnect driver because some of
>    those are not battery powered (so they just keep the knobs at full thrust
>    from the bootloader and never care scaling busses); and
> 
> 3. Some DVFSRC interconnect features may depend on firmware (but I'm not
>    sure which ones and which SoCs, as there are lots of SMI/EMI ICC things that
>    are not implemented yet with this series).
> 
> The alternative would've been to add a property to enable, or disable, the SMI ICC
> (not present in this series), and/or one, or the other kind of EMI ICC (this series
> implements only the simpler EMI ICC, and I keep saying "the other" because I
> currently don't remember the name).... which is really ugly.
> 
> Ideas? :-)

Just provide that reasoning in the commit msg.

Rob

