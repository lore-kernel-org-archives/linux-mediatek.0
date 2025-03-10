Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2032C282DE
	for <linux-mediatek@archiver.kernel.org>; Mon, 10 Mar 2025 21:16:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZEEMbUjM4POZsklR6mZrs2pkYdWtKHLN/lbKjnEWRTI=; b=QOEM9rAerY2XTkAMBSUB12U0A0
	5ELzwSOpm4VfFWzLBcPYLbajGZV3qsEDH4VdNxLPE8Bfo7Nrh/y1SNbIDX0UPHEJ+Zg3I8O+tf3r4
	CwMggk742FyBakbkJDkeBzuQ/MpdMfQjFaeCBgpgCW7lv40e8lzz7WYyu3WmXlgZZoemoozjXqTG0
	skR0zfNI7UfhbSFyZIZshv80mNrmy5y7aMFkbzdHY8NfBasI24dUyVVu63z3lGHbTk5VWDKbKA1nH
	Dsvq0/OpsFfwo1nStSpTW2ITzU9oezI+raJRcYG3KEjo8efAFCm1mcXcSQnnphsDAnLvxTqf8Fw1o
	RZXE8qvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1trkUN-00000003zjL-0twY;
	Mon, 10 Mar 2025 21:16:43 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1trkUG-00000003zfK-3DTi;
	Mon, 10 Mar 2025 21:16:38 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id D3C1D5C03E4;
	Mon, 10 Mar 2025 21:14:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 19C95C4CEE5;
	Mon, 10 Mar 2025 21:16:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741641395;
	bh=xhhTO52C/8fG7MDjEfxhWhAUsEKxrB+SaqXmnB/oZGQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KB1ErfGMXqL3eUvY/h60CuKtdRdDzpKgAEjSXuOVZQgYXaX7PjmtRr+7t+hvS6tGy
	 ytMrx41oPxfH3/0bph5XHgZy28tQ6Iyar2WI4JMjngSuQq9nge7too/D5Lq3Nezlm0
	 Ev2cu/gKGiY2ajzu5pUo2A/BRY0gQIWXwKyphw6qT7z7sSreM3Suncat5jtP4rMt+a
	 8Zhi1XgPM3G/xx5GvP1PkwRGVoj8YRnX972OzIo+R+3PskdAyDEgUJqqcOBrRdx7la
	 7no62gUzvph6vkxPCn7Ai5G55Ys2afIwQ35/d85v/cKcR4Vdd40oLznc/OHhu45KPE
	 1Tw6Rt5PmnBPQ==
Date: Mon, 10 Mar 2025 16:16:33 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: linux-rockchip@lists.infradead.org,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Fabio Estevam <festevam@gmail.com>,
	linux-mediatek@lists.infradead.org,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Paolo Abeni <pabeni@redhat.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Eric Dumazet <edumazet@google.com>, linux-kernel@vger.kernel.org,
	"G. Jaya Kumaran" <vineetha.g.jaya.kumaran@intel.com>,
	netdev@vger.kernel.org, Shawn Guo <shawnguo@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Clark Wang <xiaoning.wang@nxp.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Linux Team <linux-imx@nxp.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Christophe Roullier <christophe.roullier@foss.st.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>,
	David Wu <david.wu@rock-chips.com>,
	linux-stm32@st-md-mailman.stormreply.com,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Kevin Hilman <khilman@baylibre.com>,
	linux-amlogic@lists.infradead.org,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Biao Huang <biao.huang@mediatek.com>, devicetree@vger.kernel.org,
	"David S. Miller" <davem@davemloft.net>, imx@lists.linux.dev
Subject: Re: [PATCH net-next] dt-bindings: net: Define interrupt constraints
 for DWMAC vendor bindings
Message-ID: <174164139310.903652.6069254912704107254.robh@kernel.org>
References: <20250309003301.1152228-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250309003301.1152228-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250310_141636_915893_D479B5D4 
X-CRM114-Status: GOOD (  16.19  )
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


On Sun, 09 Mar 2025 00:33:01 +0000, Prabhakar wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> 
> The `snps,dwmac.yaml` binding currently sets `maxItems: 3` for the
> `interrupts` and `interrupt-names` properties, but vendor bindings
> selecting `snps,dwmac.yaml` do not impose these limits.
> 
> Define constraints for `interrupts` and `interrupt-names` properties in
> various DWMAC vendor bindings to ensure proper validation and consistency.
> 
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> ---
> Hi All,
> 
> Based on recent patch [0] which increases the interrupts to 11
> and adds `additionalItems: true` its good to have constraints
> to validate the schema. Ive made the changes based on the DT
> binding doc and the users. Ive ran dt binding checks to ensure
> the constraints are valid. Please let me know if you'd like me
> to split this patch or if any of the constraints are incorrect,
> as I don't have documentation for all of these platforms.
> 
> https://lore.kernel.org/all/20250308200921.1089980-2-prabhakar.mahadev-lad.rj@bp.renesas.com/
> 
> Cheers, Prabhakar
> ---
>  .../devicetree/bindings/net/amlogic,meson-dwmac.yaml   |  6 ++++++
>  .../devicetree/bindings/net/intel,dwmac-plat.yaml      |  6 ++++++
>  .../devicetree/bindings/net/mediatek-dwmac.yaml        |  6 ++++++
>  .../devicetree/bindings/net/nxp,dwmac-imx.yaml         |  8 ++++++++
>  .../devicetree/bindings/net/rockchip-dwmac.yaml        | 10 ++++++++++
>  Documentation/devicetree/bindings/net/stm32-dwmac.yaml | 10 ++++++++++
>  .../bindings/net/toshiba,visconti-dwmac.yaml           |  6 ++++++
>  7 files changed, 52 insertions(+)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


