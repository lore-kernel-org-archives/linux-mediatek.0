Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5DE34C4828F
	for <linux-mediatek@archiver.kernel.org>; Fri,  2 Feb 2024 21:37:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=q9TIH3eCrl9OhL0FDAw2It3VMG9pgBa01Xgc+pEnWCw=; b=ZBK+nBFD7eSJGIXXoTKYV5UX7w
	VBOCAo0d15L81+yVtCAUA0tA2JQPI0qR0x0j78vfcTc5czcFDL2ioSUpUmn0OOHA8Hg9CxQvR3+s8
	vRPzybeGt+QDGjh4W5XnuksHLSSVxIX5XN8R2P5WMVv+9XAiuC0nwWwu3sG1UVD1OlP6UEMmlqcQT
	SejvQnkKVhC5ZC4V9Y5cxkaJe2bls1Zzvn5uShUmseKBZKYhoCyAsHAOooB0bsk6DRGsIxNCfE/ZH
	DqQIt40Z2ZtbP/HoJbQl7vEDfukB+9R4yVe/ddgua4lQPA9geyt7NNfYdXwbI+b3EPcv6rTAlMNaE
	9zKn0MWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rW1EK-0000000DYhe-2uvE;
	Fri, 02 Feb 2024 21:37:49 +0000
Received: from pidgin.makrotopia.org ([185.142.180.65])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rW1DR-0000000DYX4-0zy2;
	Fri, 02 Feb 2024 21:36:55 +0000
Received: from local
	by pidgin.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
	 (Exim 4.96.2)
	(envelope-from <daniel@makrotopia.org>)
	id 1rW1DG-0003VB-38;
	Fri, 02 Feb 2024 21:36:43 +0000
Date: Fri, 2 Feb 2024 21:36:39 +0000
From: Daniel Golle <daniel@makrotopia.org>
To: Rob Herring <robh@kernel.org>
Cc: Bc-bocun Chen <bc-bocun.chen@mediatek.com>,
	Steven Liu <steven.liu@mediatek.com>,
	John Crispin <john@phrozen.org>,
	Chunfeng Yun <chunfeng.yun@mediatek.com>,
	Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Qingfang Deng <dqfext@gmail.com>,
	SkyLake Huang <SkyLake.Huang@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: phy: mediatek,xfi-tphy: add new bindings
Message-ID: <Zb1gZ7BjJlGCw13Z@makrotopia.org>
References: <702afb0c1246d95c90b22e57105304028bdd3083.1706823233.git.daniel@makrotopia.org>
 <20240202212420.GA1561174-robh@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240202212420.GA1561174-robh@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240202_133653_397652_8D41F7DB 
X-CRM114-Status: GOOD (  20.46  )
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

On Fri, Feb 02, 2024 at 03:24:20PM -0600, Rob Herring wrote:
> On Thu, Feb 01, 2024 at 09:52:20PM +0000, Daniel Golle wrote:
> > Add bindings for the MediaTek XFI T-PHY Ethernet SerDes PHY found in the
> > MediaTek MT7988 SoC which can operate at various interfaces modes:
> 
> This is v4 unless I'm confused[1]. Where's the revision history?

It's a new series only covering the XFI T-PHY driver.
However, I should have written a cover letter referencing the previous
series to netdev. Sorry for that and thank you for pointing it out.

> 
> Rob
> 
> [1] https://lore.kernel.org/all/b875f693f6d4367a610a12ef324584f3bf3a1c1c.1702352117.git.daniel@makrotopia.org/
> 
> > 
> > via USXGMII PCS:
> >  * USXGMII
> >  * 10GBase-R
> >  * 5GBase-R
> > 
> > via LynxI SGMII PCS:
> >  * 2500Base-X
> >  * 1000Base-X
> >  * Cisco SGMII (MAC side)
> > 
> > Signed-off-by: Daniel Golle <daniel@makrotopia.org>
> > ---
> >  .../bindings/phy/mediatek,xfi-tphy.yaml       | 80 +++++++++++++++++++
> >  1 file changed, 80 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/phy/mediatek,xfi-tphy.yaml
> > 
> > diff --git a/Documentation/devicetree/bindings/phy/mediatek,xfi-tphy.yaml b/Documentation/devicetree/bindings/phy/mediatek,xfi-tphy.yaml
> > new file mode 100644
> > index 0000000000000..e897118dcf7e6
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/phy/mediatek,xfi-tphy.yaml
> > @@ -0,0 +1,80 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/phy/mediatek,xfi-tphy.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: MediaTek XFI T-PHY
> > +
> > +maintainers:
> > +  - Daniel Golle <daniel@makrotopia.org>
> > +
> > +description:
> > +  The MediaTek XFI SerDes T-PHY provides the physical SerDes lanes
> > +  used by the (10G/5G) USXGMII PCS and (1G/2.5G) LynxI PCS found in
> > +  MediaTek's 10G-capabale SoCs.
> > +
> > +properties:
> > +  $nodename:
> > +    pattern: "^phy@[0-9a-f]+$"
> > +
> > +  compatible:
> > +    const: mediatek,mt7988-xfi-tphy
> > +
> > +  reg:
> > +    maxItems: 1
> > +
> > +  clocks:
> > +    items:
> > +      - description: XFI PHY clock
> > +      - description: XFI register clock
> > +
> > +  clock-names:
> > +    items:
> > +      - const: xfipll
> > +      - const: topxtal
> > +
> > +  resets:
> > +    items:
> > +      - description: PEXTP reset
> 
> What is PEXTP?
> 

