Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01B96CFB43F
	for <linux-mediatek@archiver.kernel.org>; Mon,  7 Oct 2024 11:37:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Type:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To
	:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8K1ZnJOubHolS67WqKspNAGR3oLXg45z13ijZr9Uxdg=; b=E1G0eusMz/sfCsDAKZxf0ZuiqT
	JfZ1CohX+rga3iRgP/CIBn6LfJuNMkIcVwEcQqt1tcVGGi/E4Q6nuZf9MPXUK7OmmiTU5E8WHVASd
	q8B0DFYyhLKLp/6+lsdZzPgb9+31TsWWYw23LVMqkGVKHY8sGWHD9ngaoTNDurvMu9FcihmVbxwnQ
	eBC2wAZTZj1wIrgz8h5ErdMbc6JL1g1dAXNBsBrzMcbZrsvSw8rftoZ8wlVldn1zklDImmnOfLKDM
	CEfP9Jeor2iVEG0CY1j7fkhLcwzoJAIUF9EhCRQsfRWC5E8fs4hOPWWCpjrOp7VDIH6Lwd13KQVyW
	FuiPEd2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sxm3X-00000002CLH-3XbS;
	Mon, 07 Oct 2024 11:37:39 +0000
Received: from pidgin.makrotopia.org ([2a07:2ec0:3002::65])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sxm2E-00000002C6T-1eO8;
	Mon, 07 Oct 2024 11:36:19 +0000
Received: from local
	by pidgin.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
	 (Exim 4.98)
	(envelope-from <daniel@makrotopia.org>)
	id 1sxm26-000000002Mf-2WkX;
	Mon, 07 Oct 2024 11:36:10 +0000
Date: Mon, 7 Oct 2024 12:36:07 +0100
From: Daniel Golle <daniel@makrotopia.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: Re: [PATCH v2 1/2] dt-bindings: mmc: mtk-sd: Add mt7988 SoC
Message-ID: <ZwPHp9l3Fx7f2lI4@makrotopia.org>
References: <20241006153447.41377-1-linux@fw-web.de>
 <20241006153447.41377-2-linux@fw-web.de>
 <b41c51c4-775c-49ca-84fd-1137b61f42d5@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b41c51c4-775c-49ca-84fd-1137b61f42d5@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241007_043618_451270_456D0A8D 
X-CRM114-Status: GOOD (  14.85  )
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
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Wenbin Mei <wenbin.mei@mediatek.com>, linux-mmc@vger.kernel.org, Ulf Hansson <ulf.hansson@linaro.org>, linux-kernel@vger.kernel.org, eladwf@gmail.com, devicetree@vger.kernel.org, ansuelsmth@gmail.com, linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, john@phrozen.org, Matthias Brugger <matthias.bgg@gmail.com>, Frank Wunderlich <linux@fw-web.de>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Chaotian Jing <chaotian.jing@mediatek.com>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Mon, Oct 07, 2024 at 10:00:49AM +0200, AngeloGioacchino Del Regno wrote:
> Il 06/10/24 17:34, Frank Wunderlich ha scritto:
> > From: Frank Wunderlich <frank-w@public-files.de>
> > 
> > Add binding definitions for mmc on MT7988 SoC.
> > 
> > Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
> > ---
> > v2:
> > - fixed minItems to 4
> > ---
> >   .../devicetree/bindings/mmc/mtk-sd.yaml       | 24 +++++++++++++++++++
> >   1 file changed, 24 insertions(+)
> > 
> > diff --git a/Documentation/devicetree/bindings/mmc/mtk-sd.yaml b/Documentation/devicetree/bindings/mmc/mtk-sd.yaml
> > index c532ec92d2d9..7380f72ea189 100644
> > --- a/Documentation/devicetree/bindings/mmc/mtk-sd.yaml
> > +++ b/Documentation/devicetree/bindings/mmc/mtk-sd.yaml
> > @@ -21,6 +21,7 @@ properties:
> >             - mediatek,mt7620-mmc
> >             - mediatek,mt7622-mmc
> >             - mediatek,mt7986-mmc
> > +          - mediatek,mt7988-mmc
> >             - mediatek,mt8135-mmc
> >             - mediatek,mt8173-mmc
> >             - mediatek,mt8183-mmc
> > @@ -263,6 +264,29 @@ allOf:
> >               - const: bus_clk
> >               - const: sys_cg
> > +  - if:
> > +      properties:
> > +        compatible:
> > +          contains:
> > +            enum:
> > +              - mediatek,mt7988-mmc
> 
> Are you really sure that you can't reuse the MT7986 compatible?

In OpenWrt we are doing exactly that. The MMC controller of
MT7988 (and MT7981) seems 100% the same as in MT7986 and hence
works just fine with the mediatek,mt7986-mmc compatible.

