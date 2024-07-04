Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03359C30653
	for <linux-mediatek@archiver.kernel.org>; Thu,  4 Jul 2024 22:52:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TL6e61dd2JbmtXVpAvU9Qh/JqUwRQ3aS6WzoyPYN1vY=; b=fYwF4Ih6jxFbiAmbK29QnLtTfg
	hii4jyJI+AZMIxXQWsQeJkLSCdrsNlOlBwvmHlpagqdQZZoY4vrrfGnPNkYuC7oMR5NpCrzWATKPm
	pbu3QLgqDLAnn+hi8Xm+vrYtdhUHimBF45Kj/ts6IUhFXgnPZ1g1DgGIN+LJ+hO4kQR5rsmBDiSUm
	lZwd0hXytHTAOF/eIL6593nJbNhRpZNHaKsSX572qM5OafRjByECkaNxIjHC4hpbT1xhm4KcUSLAh
	wO/rRdsb2q2OPjAs29qkJA1hJBnO0Hmo+fUF/g7CpeW+kZjI0a1FJ1JPtaQELdXqoiWdkR7KySY0B
	+ZwLsXfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sPVJf-0000000EW9J-113T;
	Thu, 04 Jul 2024 22:52:39 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sPVJQ-0000000EW7s-1RYG;
	Thu, 04 Jul 2024 22:52:25 +0000
Received: from pendragon.ideasonboard.com (117.145-247-81.adsl-dyn.isp.belgacom.be [81.247.145.117])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 788523A2;
	Fri,  5 Jul 2024 00:51:50 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1720133510;
	bh=y3h2gKXI0vV9i7SOSp4xI9613pwuCp10bAPcjXEBKHs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hGc9T6VSPX4WRegWdrNNtNWqQE+iZY08IrUyP8rV9BuMI6rEilOJtMGOx5cBffN7+
	 3pZ8jmpXINXRxUixiMHS+/iQI3BG/BnxDxGPP2aL4Ck3ej88ZndpQ9A2WELPIV0bhv
	 xCXipUmTeO7jPssSQjx785zWKbHGvgCcskJRzVWk=
Date: Fri, 5 Jul 2024 01:51:56 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Conor Dooley <conor@kernel.org>
Cc: Julien Stephan <jstephan@baylibre.com>,
	Andy Hsieh <andy.hsieh@mediatek.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-media@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Phi-bang Nguyen <pnguyen@baylibre.com>
Subject: Re: [PATCH v5 2/5] dt-bindings: media: add mediatek ISP3.0 camsv
Message-ID: <20240704225156.GE10099@pendragon.ideasonboard.com>
References: <20240704-add-mtk-isp-3-0-support-v5-0-bfccccc5ec21@baylibre.com>
 <20240704-add-mtk-isp-3-0-support-v5-2-bfccccc5ec21@baylibre.com>
 <20240704-unpopular-afraid-95f2cc570f14@spud>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240704-unpopular-afraid-95f2cc570f14@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240704_155224_555141_C33E27B5 
X-CRM114-Status: GOOD (  18.11  )
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

On Thu, Jul 04, 2024 at 05:29:59PM +0100, Conor Dooley wrote:
> On Thu, Jul 04, 2024 at 03:36:41PM +0200, Julien Stephan wrote:
> > From: Phi-bang Nguyen <pnguyen@baylibre.com>
> > 
> > This adds the bindings, for the ISP3.0 camsv module embedded in
> > some Mediatek SoC, such as the mt8365
> > 
> > Signed-off-by: Phi-bang Nguyen <pnguyen@baylibre.com>
> > Link: https://lore.kernel.org/r/20230807094940.329165-4-jstephan@baylibre.com
> 
> Another confusing link tag, why is it here?
> 
> > +examples:
> > +  - |
> > +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> > +    #include <dt-bindings/interrupt-controller/irq.h>
> > +    #include <dt-bindings/clock/mediatek,mt8365-clk.h>
> > +    #include <dt-bindings/memory/mediatek,mt8365-larb-port.h>
> > +    #include <dt-bindings/power/mediatek,mt8365-power.h>
> > +
> > +    soc {
> > +        #address-cells = <2>;
> > +        #size-cells = <2>;
> > +
> > +        camsv1: camsv@15050000 {
> 
> Didn't Krzysztof already comment about the node name here?
> Additionally, the "camsv1" label doest appear to be used, so should be
> dropped.

You're right about the label, it should be dropped. Regarding the name,
as far as I understand, Krzysztof was fine with specific names when no
generic alternative can be easily found, which I think is the case here.
If my understanding is incorrect, could someone help finding a better
name ?

> > +            compatible = "mediatek,mt8365-camsv";
> > +            reg = <0 0x15050000 0 0x0040>,
> > +                  <0 0x15050208 0 0x0020>,
> > +                  <0 0x15050400 0 0x0100>;
> > +            interrupts = <GIC_SPI 186 IRQ_TYPE_LEVEL_LOW>;
> > +            clocks = <&camsys CLK_CAM>,
> > +                     <&camsys CLK_CAMTG>,
> > +                     <&camsys CLK_CAMSV0>;
> > +            clock-names = "cam", "camtg", "camsv";
> > +            iommus = <&iommu M4U_PORT_CAM_IMGO>;
> > +            power-domains = <&spm MT8365_POWER_DOMAIN_CAM>;
> > +
> > +            ports {
> > +                #address-cells = <1>;
> > +                #size-cells = <0>;
> > +                port@0 {
> > +                    reg = <0>;
> > +                    camsv1_endpoint: endpoint {
> > +                        remote-endpoint = <&seninf_camsv1_endpoint>;
> > +                    };
> > +                };
> > +            };
> > +        };
> > +    };
> > +...
> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index 6bd7df1c3e08..9ac8c08ba692 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -14163,6 +14163,7 @@ M:	Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> >  M:	Julien Stephan <jstephan@baylibre.com>
> >  M:	Andy Hsieh <andy.hsieh@mediatek.com>
> >  S:	Supported
> > +F:	Documentation/devicetree/bindings/media/mediatek,mt8365-camsv.yaml
> >  F:	Documentation/devicetree/bindings/media/mediatek,mt8365-seninf.yaml
> >  
> >  MEDIATEK SMI DRIVER


-- 
Regards,

Laurent Pinchart

