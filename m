Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2A81C28B30
	for <linux-mediatek@archiver.kernel.org>; Thu, 20 Mar 2025 17:35:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UY7Ms7lEBSkCG5mErulGDCKla38uoYZ4/MW/jdzan2I=; b=Lt/vm4TXYTIGmEwQryFLZMU+O/
	ZYe94EXMYueiEXQYE8qDNT8R5N4GVTQCmf9HxsLaekzGIBKflI7OgLYed/wOnfFgSM91LUgPFdMAO
	PpLWzZh3SXvAlriE4AedYM0kzNwUdFvMkt5zMBUWQeeLCzp0dJSARRhxq586p1frHs/UsSJZWCISB
	41l0Hqi550J9O5wlIhsMA0s9h/7ZGG0JFsY/9TrAIri1+bywd7JztANVlNCTDUqE073u8ieGJick6
	Ay11xGyrPESr6smBA+LCFquj6D1bpH2zHe9ZGmmrzcuVY4w09wFQFjNQq5XxslfvzXztHEmkuIZHx
	r0q3w6qQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tvJnm-0000000CpIc-43oL;
	Thu, 20 Mar 2025 17:35:30 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tvJl6-0000000CotI-1dM9;
	Thu, 20 Mar 2025 17:32:45 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 41CD5A495A3;
	Thu, 20 Mar 2025 17:27:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 24AAEC4CEE7;
	Thu, 20 Mar 2025 17:32:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742491963;
	bh=wG7BsaeKNGbyCw5L43qSPMAOuphQk4aDqrVD5NjljnQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Je3cn27I8cR31QVl3tlbPWi186cbHPZMuc8Svbsv6BdtwW3e/UrXvSow5KsXd4C35
	 fljScj/5DZu4xwqS3RYGO4D3+QsD3ttmMosL++OxZ5lp2MDM1Gf1mAyTxLQPWKcTHK
	 KeHDgJZhwS2tWE7ZTMHeMl56fhBA6AspbDTRdN/wgQV0HvrKR7I0LL8cELIPGORUmt
	 63tpbJqLCXkZQ5RpCg8rkqsDffg0wHp8ZuNfNa8sY1D5Jws6dKiESsuYO5tcmYfubM
	 N9y1fbEcdPCX86QEackOjokrCnCO3G2efarEhkjlz3x0+PJ6aAmuWiidlEt9rwiNsw
	 FDSat4Utb1z7w==
Date: Thu, 20 Mar 2025 17:32:37 +0000
From: Simon Horman <horms@kernel.org>
To: Christian Marangi <ansuelsmth@gmail.com>
Cc: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Vladimir Oltean <olteanv@gmail.com>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, netdev@vger.kernel.org,
	upstream@airoha.com
Subject: Re: [net-next PATCH v12 03/13] dt-bindings: net: dsa: Document
 support for Airoha AN8855 DSA Switch
Message-ID: <20250320173237.GF892515@horms.kernel.org>
References: <20250309172717.9067-1-ansuelsmth@gmail.com>
 <20250309172717.9067-4-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250309172717.9067-4-ansuelsmth@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250320_103244_489865_3CF775BE 
X-CRM114-Status: GOOD (  16.85  )
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

On Sun, Mar 09, 2025 at 06:26:48PM +0100, Christian Marangi wrote:
> Document support for Airoha AN8855 5-port Gigabit Switch.
> 
> It does expose the 5 Internal PHYs on the MDIO bus and each port
> can access the Switch register space by configurting the PHY page.

nit: configuring

> 
> Each internal PHY might require calibration with the fused EFUSE on
> the switch exposed by the Airoha AN8855 SoC NVMEM.
> 
> Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
> ---
>  .../net/dsa/airoha,an8855-switch.yaml         | 105 ++++++++++++++++++
>  MAINTAINERS                                   |   1 +
>  2 files changed, 106 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/net/dsa/airoha,an8855-switch.yaml
> 
> diff --git a/Documentation/devicetree/bindings/net/dsa/airoha,an8855-switch.yaml b/Documentation/devicetree/bindings/net/dsa/airoha,an8855-switch.yaml
> new file mode 100644
> index 000000000000..63bcbebd6a29
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/net/dsa/airoha,an8855-switch.yaml
> @@ -0,0 +1,105 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/net/dsa/airoha,an8855-switch.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Airoha AN8855 Gigabit Switch
> +
> +maintainers:
> +  - Christian Marangi <ansuelsmth@gmail.com>
> +
> +description: >
> +  Airoha AN8855 is a 5-port Gigabit Switch.
> +
> +  It does expose the 5 Internal PHYs on the MDIO bus and each port
> +  can access the Switch register space by configurting the PHY page.

Ditto.

> +
> +  Each internal PHY might require calibration with the fused EFUSE on
> +  the switch exposed by the Airoha AN8855 SoC NVMEM.

...

