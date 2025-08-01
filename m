Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C3F7C87FCB
	for <linux-mediatek@archiver.kernel.org>; Fri,  1 Aug 2025 17:50:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9whACskZgHLQLQu2NJZzziT5mx2wkb33IyawZ2ggjHI=; b=pgse71rq/ag9wp1++6olQm4y4n
	pjSuEygoFHICrcskKCwZmC08TqMjYdfL/im3FB2LZtIZ+3QV0xbTNXtM270VKIVG5JhEH3ezENITK
	omv7SFs4RE9/voHmvniirdwdslq34wTbkS0w7YbhDdKZWd+zgapwuUMnbP/pQna/bVYzrGvJ0vtl4
	noIOB0h/deRZ2tuq60oZoKJxJ6eDimq2TH6fEis7oKEFauJOW6xsOvnhb9i6p1dVWKUlDYy8faxL9
	aD/VRwgVtfoj1Nwv5t0mdtfPf9MPmaVJCTJt3WUQ4PHPn8dyO1upKl7kT2Cej8ZJfcebTwMAqdhlS
	JrmvQOYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhttv-00000006aMo-2oXs;
	Fri, 01 Aug 2025 17:50:39 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhtaF-00000006Y8y-3Lby;
	Fri, 01 Aug 2025 17:30:20 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 1F21BA558F2;
	Fri,  1 Aug 2025 17:30:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A1A6BC4CEE7;
	Fri,  1 Aug 2025 17:30:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754069418;
	bh=lPzXpIa795/UAYucbxhQ/lqbSXcKmzSge/LIrsTQc54=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ezHZJ7ucJnfPB4oUWD7FF4veHqBSUYQO2rfX/4jx70xPeYunQKDZVqndyemghEcFp
	 wH72RD4J/7gVUSywdQYJcrYLSkwp/ssF096SBbwlDhv6WYZacp3jkTl8KTJFIkFfz6
	 7rmu4tRICpaEqH2QyycjnjQY/mbfeQ8rZn6JbsOtlY9n4AYXAkTmGWRNgtTd2qtd0S
	 XLHwEBbWmDbQzJtWu1Gcqv++nwwKSyOSpenznLrG4iN3Fgf7axEOl+0HOLsLftmQw9
	 /Px4kVZLiq4qV57VJDVMFwLtznFe7mVTOktcyyiM5owy9f3YZMhX4sSW6CF24ufleb
	 2bvuniSyGEjCg==
Date: Fri, 1 Aug 2025 12:30:18 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Julien Massot <julien.massot@collabora.com>
Cc: kernel@collabora.com, Linus Walleij <linus.walleij@linaro.org>,
	linux-arm-kernel@lists.infradead.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Enric Balletbo i Serra <eballetbo@kernel.org>,
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	linux-mediatek@lists.infradead.org,
	Weiyi Lu <weiyi.lu@mediatek.com>, Chen-Yu Tsai <wenst@chromium.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Julien Massot <jmassot@collabora.com>, devicetree@vger.kernel.org,
	linux-sound@vger.kernel.org, Sean Wang <sean.wang@kernel.org>,
	Ikjoon Jang <ikjn@chromium.org>, linux-clk@vger.kernel.org,
	Eugen Hristev <eugen.hristev@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: Re: [PATCH 7/9] dt-bindings: pinctrl: mediatek: mt8183: Allow
 gpio-line-names
Message-ID: <175406941584.3116245.5714988449223130745.robh@kernel.org>
References: <20250801-mtk-dtb-warnings-v1-0-6ba4e432427b@collabora.com>
 <20250801-mtk-dtb-warnings-v1-7-6ba4e432427b@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250801-mtk-dtb-warnings-v1-7-6ba4e432427b@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250801_103019_916531_C5B239A9 
X-CRM114-Status: GOOD (  11.31  )
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


On Fri, 01 Aug 2025 13:18:09 +0200, Julien Massot wrote:
> Add support for the 'gpio-line-names' property in the MT8183 pinctrl
> binding.
> This allows naming the GPIOs, which is already done in several
> device trees (e.g. mt8183-kukui-jacuzzi.dtsi, mt8183-kukui-kakadu.dtsi,
> mt8183-kukui-krane.dtsi), but was previously generating DT schema
> warnings.
> 
> Signed-off-by: Julien Massot <julien.massot@collabora.com>
> ---
>  Documentation/devicetree/bindings/pinctrl/mediatek,mt8183-pinctrl.yaml | 2 ++
>  1 file changed, 2 insertions(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


