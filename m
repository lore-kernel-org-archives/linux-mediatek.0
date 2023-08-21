Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB800EE4996
	for <linux-mediatek@archiver.kernel.org>; Mon, 21 Aug 2023 17:36:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WQBJjG1I8W2cia44MfslGehIOAkw/B1K6oiBTomgRsw=; b=z1vbHRh2yjTdtL6EQJDMlLbjSv
	OH2/4p6k/7pR5fzK7uMAQyTEkxP8k2dAi+eqSaQe8Upm4vogTJ7bMPahJW7WGq/D1eyVbEjlwofOr
	XF/NwQ9Ocf40ENCf5/yMypk3GPj7kNQwl9YgcUp8DJcWkcoOZeoKbSJgE+5PoGjrT8X8w8k8wh65r
	aEaRu93VwgRyrJwiBEbS+9GhAyrEyOBDm/F6+xLWg5r+HjB/ybtkwDSC+p7kux9d1/gT2t8c7lDaQ
	6oqGWLBjJkjc6abegyut4AYLEhtULzsEV/osBv2h5BL+TnNGDl5Fb1kgjW/4Qwa/UPNxZrlU2WcaN
	N+hsWAlg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qY8pJ-00ESHJ-2b;
	Mon, 21 Aug 2023 17:36:29 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qY8pF-00ESFY-35;
	Mon, 21 Aug 2023 17:36:27 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 933BD640DD;
	Mon, 21 Aug 2023 17:36:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 852E7C433C8;
	Mon, 21 Aug 2023 17:36:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1692639384;
	bh=rjcLVL+A8b2IRnn2q4Ppt+1bnxQCOxpZRgxU0x51JxE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CxH5xtiVJKLWV+GUpmyFZw6cLjRzIDkUr4IoWxS/cGYiqDq+kGuTUMbZCh99TAx6J
	 auzu7/j3Dm9LNL4zRvSfrotNMKqwsD2Bi6LPtX4y4iex1sbp3q0grIdz8km1RAnGcD
	 oh7xDjI71UwY3I7uwNWOPtHlmtc3Y5c5HIv9QxxoQtWvM9ZSpT02F2FQzJGirxhdum
	 85thMF0PNaHSKLA+WPecVPqhy+4Jv/nJzRCTmfzGH0Lv6GfEHC4g8NdcOGMCuYDR5F
	 NPImZzL4LNIq4tyKWZLavfag78cjQI9WsKEwaKdO5m+mM9KxEe3USI2awAfM7fxuIF
	 /AcicA5NmHoDg==
Received: (nullmailer pid 2008250 invoked by uid 1000);
	Mon, 21 Aug 2023 17:36:20 -0000
Date: Mon, 21 Aug 2023 12:36:20 -0500
From: Rob Herring <robh@kernel.org>
To: =?utf-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, Rob Herring <robh+dt@kernel.org>, erkin.bozoglu@xeront.com, Matthias Brugger <matthias.bgg@gmail.com>, netdev@vger.kernel.org, Alvin =?utf-8?Q?=C5=A0ipraga?= <alsi@bang-olufsen.dk>, "David S. Miller" <davem@davemloft.net>, Daniel Golle <daniel@makrotopia.org>, Sean Wang <sean.wang@mediatek.com>, linux-kernel@vger.kernel.org, Florian Fainelli <f.fainelli@gmail.com>, mithat.guner@xeront.com, Vladimir Oltean <olteanv@gmail.com>, Landen Chao <Landen.Chao@mediatek.com>, UNGLinuxDriver@microchip.com, devicetree@vger.kernel.org, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Andrew Lunn <andrew@lunn.ch>, Paolo Abeni <pabeni@redhat.com>, Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Woojung Huh <woojung.huh@microchip.com>, Jakub Kicinski <kuba@kernel.org>, Eric Dumazet <edumazet@google.com>, DENG Qingfang <dqfext@gmail.com>, Linus Walleij <linus.
 walleij@linaro.org>
Subject: Re: [PATCH 1/4] dt-bindings: net: dsa: microchip,lan937x: add
 missing ethernet on example
Message-ID: <169263937931.2008171.472959954352039259.robh@kernel.org>
References: <20230812091708.34665-1-arinc.unal@arinc9.com>
 <20230812091708.34665-2-arinc.unal@arinc9.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230812091708.34665-2-arinc.unal@arinc9.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230821_103626_463511_1805869A 
X-CRM114-Status: GOOD (  11.98  )
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


On Sat, 12 Aug 2023 12:17:05 +0300, Arınç ÜNAL wrote:
> The port@5 node on the example is missing the ethernet property. Add it.
> Remove the MAC bindings on the example as they cannot be validated.
> 
> Signed-off-by: Arınç ÜNAL <arinc.unal@arinc9.com>
> ---
>  .../bindings/net/dsa/microchip,lan937x.yaml           | 11 +----------
>  1 file changed, 1 insertion(+), 10 deletions(-)
> 

Acked-by: Rob Herring <robh@kernel.org>


