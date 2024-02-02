Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27EDAC4828F
	for <linux-mediatek@archiver.kernel.org>; Fri,  2 Feb 2024 21:25:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Jq6t3qRI00lt3hTXfiVqODPCc3GSzE2vctQAc1IfJmc=; b=J1qatP7fcUAJAe03y9qzGXe6M6
	ypcOAjNOyR6eR3UEVFZnscLM0FZUSqlo8fobRhA6THcQSbPERgkJ9ajkz4vQCmP8EbkMDPSIgNqOA
	sLMI1c+f2J1mWlOl2qAP3yiCvkNHtyPs8D4O/CBB4J8ogFiB0z8p77cb6Bseo0z2mcXY/56mqeR3U
	JiUGhNK+/Lsbd8KH9RcsdiJ5Qy54r64vMxoILG4++Garr3DnyiGYCxrLOONCyxv9H4xeDRETtAZB5
	mScaXbCFIjxMPE83jJA5PHhEy0bELKxE/3m+EmSrggTbihjZMfT38Nu4NgqRsHwt+Z2+IOrTsJ0/h
	L3oUHOYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rW12N-0000000DWow-176y;
	Fri, 02 Feb 2024 21:25:27 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rW11y-0000000DWbw-2Jyi;
	Fri, 02 Feb 2024 21:25:22 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 71700CE2D98;
	Fri,  2 Feb 2024 21:24:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 72D71C433C7;
	Fri,  2 Feb 2024 21:24:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1706909062;
	bh=UZ+yJRgsFPGKwSTDFBg0r03EZWgLZlspYa2WkFy5MiA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=teO9xkwHltv0T0lPtU2+7uxbSRQZXu6/REzvx0bSQvNw23ajHvQTtRrzcbKgqgcto
	 Qz5I/ZL8Yae+1FbTMmiWOORN+yWt+6zMVotV2Omv2qFLh02dsTev+gZjT+02Xoj1Pa
	 55RKD0O1gA/FcygEaO3shOHwz1wmfjact06vT2h7azz/dnW0UEq87+/ijVeqPz8sWU
	 J1hcDtKIs0hN1bamIt4it/ivIsZN6b5KRfDv4eSuL89IMxiDOg45sxDHcZP8OyQG7M
	 VB6q6WyV8NOavbjqr1LVh4oqfoz3W5hMd8t5KwIAtsdrnAhkvrW5+H4RC+e+uSeed+
	 jX/JQcBYko2Xg==
Date: Fri, 2 Feb 2024 15:24:20 -0600
From: Rob Herring <robh@kernel.org>
To: Daniel Golle <daniel@makrotopia.org>
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
Message-ID: <20240202212420.GA1561174-robh@kernel.org>
References: <702afb0c1246d95c90b22e57105304028bdd3083.1706823233.git.daniel@makrotopia.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <702afb0c1246d95c90b22e57105304028bdd3083.1706823233.git.daniel@makrotopia.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240202_132506_554281_CED7D862 
X-CRM114-Status: GOOD (  16.07  )
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

On Thu, Feb 01, 2024 at 09:52:20PM +0000, Daniel Golle wrote:
> Add bindings for the MediaTek XFI T-PHY Ethernet SerDes PHY found in the
> MediaTek MT7988 SoC which can operate at various interfaces modes:

This is v4 unless I'm confused[1]. Where's the revision history?

Rob

[1] https://lore.kernel.org/all/b875f693f6d4367a610a12ef324584f3bf3a1c1c.1702352117.git.daniel@makrotopia.org/

> 
> via USXGMII PCS:
>  * USXGMII
>  * 10GBase-R
>  * 5GBase-R
> 
> via LynxI SGMII PCS:
>  * 2500Base-X
>  * 1000Base-X
>  * Cisco SGMII (MAC side)
> 
> Signed-off-by: Daniel Golle <daniel@makrotopia.org>
> ---
>  .../bindings/phy/mediatek,xfi-tphy.yaml       | 80 +++++++++++++++++++
>  1 file changed, 80 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/phy/mediatek,xfi-tphy.yaml
> 
> diff --git a/Documentation/devicetree/bindings/phy/mediatek,xfi-tphy.yaml b/Documentation/devicetree/bindings/phy/mediatek,xfi-tphy.yaml
> new file mode 100644
> index 0000000000000..e897118dcf7e6
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/phy/mediatek,xfi-tphy.yaml
> @@ -0,0 +1,80 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/phy/mediatek,xfi-tphy.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: MediaTek XFI T-PHY
> +
> +maintainers:
> +  - Daniel Golle <daniel@makrotopia.org>
> +
> +description:
> +  The MediaTek XFI SerDes T-PHY provides the physical SerDes lanes
> +  used by the (10G/5G) USXGMII PCS and (1G/2.5G) LynxI PCS found in
> +  MediaTek's 10G-capabale SoCs.
> +
> +properties:
> +  $nodename:
> +    pattern: "^phy@[0-9a-f]+$"
> +
> +  compatible:
> +    const: mediatek,mt7988-xfi-tphy
> +
> +  reg:
> +    maxItems: 1
> +
> +  clocks:
> +    items:
> +      - description: XFI PHY clock
> +      - description: XFI register clock
> +
> +  clock-names:
> +    items:
> +      - const: xfipll
> +      - const: topxtal
> +
> +  resets:
> +    items:
> +      - description: PEXTP reset

What is PEXTP?

