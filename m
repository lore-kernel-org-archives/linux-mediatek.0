Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D3EEC25B77
	for <linux-mediatek@archiver.kernel.org>; Mon, 20 May 2024 21:08:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XIPzsDxufq/6qv417OEGAyVct/krB1Fsa3KxivyH120=; b=YU60VyUAVuSHUqLzMCBFmmH484
	Vdh+GlHCCuJb15piM9waienTeq7vsiLBi+/s0tzLBZSizCi/aAhgsYar+BN7bRXgzF9pl/fwiqRgS
	RdNFO4L+LaulWjOOfDpRqhXsEgu71bPJGX6HSuZfhDoFN4p6+HQiSvYQ0qL/MVoK1wUuFnAh/uxxx
	b8jUWciIQnNSWZUDJLqdVjupZsWaW/QuofcwxZpsx07RszlgwJu2XLIY6VBnajhrSzRPDMIo23XQ+
	1w8XlZKImycyIVwfSpAYF7k9fAenPEeAH6Vv3hbbHXylWh/8Y0c04VuM8xwckvY8ND4xm6Ngb2yF3
	d/A58I5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s9AFc-0000000FYkO-4AHd;
	Mon, 20 May 2024 21:08:56 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s9AFZ-0000000FYjV-2Cdc;
	Mon, 20 May 2024 21:08:55 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id F0BDCCE0B2F;
	Mon, 20 May 2024 21:08:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 10D29C2BD10;
	Mon, 20 May 2024 21:08:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1716239330;
	bh=KXsctDjiPvmFDLCwn2rtvgL33Mj9ioJK9ltO3XPn0mI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=vOkwLKD1HIFpF9QNIzg2+NQCdduRTnqataQ6SZfpBXX6/qoY8CFjKY0uaY5xz+Cjg
	 lMqfdGVaAXZvb71HnMqwCvzJM3AOTzn6ko1H2A0intxz30sWVtAkTRAz0dTbRvjGCT
	 3kMZ0lldfDEeyZwaJ5534aPg3t09thcvQcsWrN0yBblftQjRqc4qI1hkAKLc330lxK
	 Vv+PsQ+2ehYFjZPFt/vCtoQKaJf4TrNJI95+0vWkY5pMtpr89cFFsPi66WxDTLd9D+
	 Swrb84DuONnqM43uHE48GsCmur+ywprWxhuxrSIo7TsaLpSI/3H6jcvtHKCV6yg9is
	 l0LV+oxYBB3Tg==
Date: Mon, 20 May 2024 16:08:49 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>, Nishanth Menon <nm@ti.com>,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	Daniel Machon <daniel.machon@microchip.com>,
	UNGLinuxDriver@microchip.com, Lee Jones <lee@kernel.org>,
	Lars Povlsen <lars.povlsen@microchip.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org,
	Conor Dooley <conor+dt@kernel.org>,
	Steen Hegelund <Steen.Hegelund@microchip.com>
Subject: Re: [PATCH 5/8] dt-bindings: soc: ti: am654-serdes-ctrl: Move to
 dedicated schema
Message-ID: <171623932593.1530457.11631541498637142639.robh@kernel.org>
References: <20240519-dt-bindings-mfd-syscon-split-v1-0-aaf996e2313a@linaro.org>
 <20240519-dt-bindings-mfd-syscon-split-v1-5-aaf996e2313a@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240519-dt-bindings-mfd-syscon-split-v1-5-aaf996e2313a@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240520_140853_795597_A66413EC 
X-CRM114-Status: GOOD (  12.03  )
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


On Sun, 19 May 2024 20:42:20 +0200, Krzysztof Kozlowski wrote:
> ti,am654-serdes-ctrl is not a simple syscon device - it has children -
> thus it should be fully documented in its own binding.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 
> ---
> 
> Context might depend on
> https://lore.kernel.org/r/20240510123018.3902184-1-robh@kernel.org
> and also further patches here depend on this one.
> ---
>  Documentation/devicetree/bindings/mfd/syscon.yaml  |  1 -
>  .../bindings/soc/ti/ti,am654-serdes-ctrl.yaml      | 42 ++++++++++++++++++++++
>  2 files changed, 42 insertions(+), 1 deletion(-)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


