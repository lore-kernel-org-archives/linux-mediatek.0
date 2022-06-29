Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B093C43334
	for <linux-mediatek@archiver.kernel.org>; Wed, 29 Jun 2022 23:31:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NamENXyKFYhttZ611JbyTiKFRbhAlY00qV/4NxbBTwQ=; b=eGgEtN/nIptziRGY7MGC3nInWT
	wsEdOuZzHijqUA0BXV7PBWnS+5uoytNqr2KnokQwdrvz87YIDFa+l22jqPlwA4Tspjkd0NmlAIDEr
	rURHcnzkZKlIOgxFZVlUV1xvLMLk/UTkYYhVlnhPmbwDYcjD6/6bFnwVzujqAJuA5X5Ov1IbnjNBh
	UviRZOTOqBjsN9aEnp/IQWqg6gUW6NU6hdvsvpz39awmfYkGkD3BoUf4k6VuHTRK2iGJR3grfzHFn
	lufOkK+L70Ua90SgAXL3yc1xra6v5o8PMKWE6Nyp7Dnoo+G71utGOttjl0bnAS+8UlbwPUtgTwLVA
	RaRuVrRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o6hA1-00EPaX-2b; Wed, 29 Jun 2022 23:31:53 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o6h9p-00EPYC-CO; Wed, 29 Jun 2022 23:31:43 +0000
Received: from notapiano (pool-98-113-53-228.nycmny.fios.verizon.net [98.113.53.228])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nfraprado)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 64A426601907;
	Thu, 30 Jun 2022 00:31:38 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1656545499;
	bh=X82AnTeS9ql4xEMo8Ss/zWO0HusDJV9VvepmEeYZ+J0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FZFVdXWUBZB399V8KEwYh6tIku1a4jBEO9WHmqe/hDQheX/9GYKCYeSIuvT9hMLve
	 Ie6JZ9z84WYFMRr+zJAmMA1jnBObYh9u3cy/0woI52gx455Bj1VYt+Al5R1ipAmSiV
	 bTiP//qTup/B2Z2p+WVuWHfrjYzAgJ8I8NyX8QxPXlyV64wXu5EzmrbvGGCpTInrOV
	 jHqgtW1FFWKCIGwkrcM3FQeO078a4e7/rbW89inh6DFIePPZUIl7EKvus9cSxKxiZ2
	 XWzHj3azdm/cea5pvTYt8fayc0UHP/STwO1vk1BFo7sJl7Fep5f9d5n1a/E5OJAR+f
	 H/YjOE0oqJOTw==
Date: Wed, 29 Jun 2022 19:31:34 -0400
From: =?utf-8?B?TsOtY29sYXMgRi4gUi4gQS4=?= Prado <nfraprado@collabora.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Allen-KH Cheng <allen-kh.cheng@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
	Project_Global_Chrome_Upstream_Group@mediatek.com,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
	Chen-Yu Tsai <wenst@chromium.org>
Subject: Re: [PATCH 4/5] arm64: dts: mt8192: Add dsi node
Message-ID: <20220629233134.zt5ua4v5itycjmlt@notapiano>
References: <20220629121358.19458-1-allen-kh.cheng@mediatek.com>
 <20220629121358.19458-5-allen-kh.cheng@mediatek.com>
 <730f334e-c10d-8f8b-94e6-b66a56e03320@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <730f334e-c10d-8f8b-94e6-b66a56e03320@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220629_163141_614723_13D545EF 
X-CRM114-Status: GOOD (  14.92  )
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

On Wed, Jun 29, 2022 at 03:42:42PM +0200, AngeloGioacchino Del Regno wrote:
> Il 29/06/22 14:13, Allen-KH Cheng ha scritto:
> > Add dsi ndoe for mt8192 SoC.

Typo: s/ndoe/node.

> > 
> > Signed-off-by: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
> > ---
> >   arch/arm64/boot/dts/mediatek/mt8192.dtsi | 18 ++++++++++++++++++
> >   1 file changed, 18 insertions(+)
> > 
> > diff --git a/arch/arm64/boot/dts/mediatek/mt8192.dtsi b/arch/arm64/boot/dts/mediatek/mt8192.dtsi
> > index 26d01544b4ea..72af328126de 100644
> > --- a/arch/arm64/boot/dts/mediatek/mt8192.dtsi
> > +++ b/arch/arm64/boot/dts/mediatek/mt8192.dtsi
> > @@ -1334,6 +1334,24 @@
> >   			mediatek,gce-client-reg = <&gce SUBSYS_1400XXXX 0xe000 0x1000>;
> >   		};
> > +		dsi0: dsi@14010000 {
> > +			compatible = "mediatek,mt8183-dsi";
> > +			reg = <0 0x14010000 0 0x1000>;
> > +			interrupts = <GIC_SPI 265 IRQ_TYPE_LEVEL_HIGH 0>;
> > +			mediatek,syscon-dsi = <&mmsys 0x140>;

Also drop this syscon-dsi property.

> > +			clocks = <&mmsys CLK_MM_DSI0>,
> > +				 <&mmsys CLK_MM_DSI_DSI0>,
> > +				 <&mipi_tx0>;
> > +			clock-names = "engine", "digital", "hs";
> > +			phys = <&mipi_tx0>;
> > +			phy-names = "dphy";

It's also missing power-domains.

> 
> resets = <&mmsys MT8192_MMSYS_SW0_RST_B_DISP_DSI0>;
> 
> ^^^ This is missing, please add it and resend :-)

Also, when this is added you'll need

#include <dt-bindings/reset/mt8192-resets.h>

With those addressed,

Reviewed-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>

Thanks,
Nícolas

> 
> > +			status = "disabled";
> > +
> > +			port {
> > +				dsi_out: endpoint { };
> > +			};
> > +		};
> > +
> >   		ovl_2l2: ovl@14014000 {
> >   			compatible = "mediatek,mt8192-disp-ovl-2l";
> >   			reg = <0 0x14014000 0 0x1000>;
> 
> 
> 

