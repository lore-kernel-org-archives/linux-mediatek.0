Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7736BC6FA8E
	for <linux-mediatek@archiver.kernel.org>; Fri, 24 Feb 2023 21:06:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dvSuiGSu1GkO4ghHm5O4huEsvqt0XEJOLenULrIzZls=; b=lrBNgPE3QYCBDwpXuVzKhTZ6tw
	eFwrWDqmKKXKf7thKxtcYzT3dNTsDxAu8dSKox/SZYebYu8P07GR3RbIQNYJXUFmleGD3qMvkWpjU
	OYGtiYS51Y7MZjYNFWBh0vdh03Eiog9PcVLAz8lEFYGL4yB0mvGnwefpU6gK+/zsP2J80ObSVgGB3
	SCWpXCjHGR6teNxxw9nJxPpcShTjx8qv5Upg8s38zBBjQYaG24oe73May6DPSDsW3UHyURuhyyYK0
	z4pvA4KE6Y0P04eLD/AGbuorCL7TWomoCaQU32+DF5nXtOs1DhXwquEddKM4lQHvoDILzH3XIVvWK
	ufzjvoUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pVfH2-003t3f-2K; Fri, 24 Feb 2023 21:06:36 +0000
Received: from fudo.makrotopia.org ([2a07:2ec0:3002::71])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pVfGy-003t2D-Se; Fri, 24 Feb 2023 21:06:34 +0000
Received: from local
	by fudo.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
	 (Exim 4.96)
	(envelope-from <daniel@makrotopia.org>)
	id 1pVfGp-0002JD-34;
	Fri, 24 Feb 2023 22:06:24 +0100
Date: Fri, 24 Feb 2023 21:06:17 +0000
From: Daniel Golle <daniel@makrotopia.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: linux-clk@vger.kernel.org, linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Chen-Yu Tsai <wenst@chromium.org>,
	Edward-JW Yang <edward-jw.yang@mediatek.com>,
	Johnson Wang <johnson.wang@mediatek.com>,
	Chun-Jie Chen <chun-jie.chen@mediatek.com>,
	Miles Chen <miles.chen@mediatek.com>,
	Sam Shih <sam.shih@mediatek.com>
Subject: Re: [PATCH RFC 1/4] dt-bindings: clock: rename mt7986-clk.h to
 mediatek,mt7986-clk.h
Message-ID: <Y/kmj36e4jSfLdVN@makrotopia.org>
References: <cover.1677089171.git.daniel@makrotopia.org>
 <15d718a2d696d29b48668b9ab5531369c537a1e6.1677089171.git.daniel@makrotopia.org>
 <ace28a97-b43e-4b24-52d0-93bc21263aff@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ace28a97-b43e-4b24-52d0-93bc21263aff@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230224_130632_949053_875E2889 
X-CRM114-Status: GOOD (  13.23  )
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

On Thu, Feb 23, 2023 at 11:18:37AM +0100, Krzysztof Kozlowski wrote:
> On 22/02/2023 19:09, Daniel Golle wrote:
> > Rename dt-bindings header file mt7986-clk.h to mediatek,mt7986-clk.h,
> > propagate this change also to mt7986a.dtsi which is the only user.
> > 
> > Signed-off-by: Daniel Golle <daniel@makrotopia.org>
> > ---
> >  arch/arm64/boot/dts/mediatek/mt7986a.dtsi                       | 2 +-
> >  drivers/clk/mediatek/clk-mt7986-infracfg.c                      | 2 +-
> >  drivers/clk/mediatek/clk-mt7986-topckgen.c                      | 2 +-
> >  .../dt-bindings/clock/{mt7986-clk.h => mediatek,mt7986-clk.h}   | 0
> 
> You cannot have bindings and DTS and drivers mixed together. Which
> points to fact - you cannot make such change... Also your commit msg
> does not justify "why" you are doing it.

The reason is simply consistency with most other SoCs.

So to make such a change possible, I should do it in three steps, right?
Step 1: dt-bindings: copy mt7986-clk.h to mediatek,mt7986-clk.h
Step 2: changes in drivers
Step 3: dt-bindings: remove mt7986-clk.h

Would this change be acceptable if carried out in 3 commits?
And using the same strategy also the other changes suggested in the
series?

Thank you!

Best regards

Daniel

