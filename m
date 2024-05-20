Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49924C25B77
	for <linux-mediatek@archiver.kernel.org>; Mon, 20 May 2024 21:08:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BB4/H3DHo/IXnp+vmYhMNI+r0MbR2MG7q6a2QYVhNSE=; b=MWC1elIwgLIO/XRP4s+FLubEkh
	A5fcfOUy6Ezh1Vq13rk7rHUO2p/mQPNmUgJ0vzbFmSh219qa5uBlECD/o05C0fKBXC372JO1aHiyc
	T9eVdgLNCBF6YhYjytgba8dRjx0wWh/HmwxsQMLQd3u/1dYuEOCIcKOhCgg7iFB2HdYymRNrhPc4U
	6DxlZ95loIbODlGEQ9s8LGNDNYZP5xSsbPzzj8V5fZGpl1hVhU58YBDi02bKWkp9eG+QyVAJeCKKY
	2dDSE1TaPko/O0gh4xdKnUzSOdsvHcI6BshAOiPO06xGIE5ozHgm2Z1jcqkokSE2jW2/4gEBAhb6o
	ntD4iHdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s9AF7-0000000FYcv-3uDh;
	Mon, 20 May 2024 21:08:25 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s9AF4-0000000FYc0-2AU6;
	Mon, 20 May 2024 21:08:23 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 03F2061ED9;
	Mon, 20 May 2024 21:08:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 80B35C2BD10;
	Mon, 20 May 2024 21:08:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1716239301;
	bh=XdvSekiHzDgJlBrerJZoQRBoaKO5FPl+a2h4OopvYLE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Ij5EYZFGTBA7BJSVz7ErkPMIRsocyNH/PgnxEFQBTMJX7RWsdMCIGu/r2hU7yB/an
	 pxS1stbrBh7YtMJQ04A4Nh66T9CknlpTEDP/yR2/fhIdVZ3wPWwHWH210zl6bDax3b
	 epnP2SDwOs/dEbDvypvdSMsnTmiWxL17NXjMa8TSucLyGi+3Bxlo/urmzCd3x5u7yU
	 ndnzeW8ny2fxUmSu+0lj3g0hv/CFbL708Nv7kINz1KL9jmj56tUruHT2xEbUrE1y7p
	 /GIGGE4yrT5ge1Ql2IKQ+5zbXRRDjncOp/AKgNDNmYZ6l/OT6WZ/5BpObWMjzbe+hf
	 wGc9pi/oxUmAA==
Date: Mon, 20 May 2024 16:08:20 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Lars Povlsen <lars.povlsen@microchip.com>, Lee Jones <lee@kernel.org>,
	linux-mediatek@lists.infradead.org, UNGLinuxDriver@microchip.com,
	Daniel Machon <daniel.machon@microchip.com>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	Steen Hegelund <Steen.Hegelund@microchip.com>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Nishanth Menon <nm@ti.com>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>
Subject: Re: [PATCH 4/8] dt-bindings: soc: microchip: sparx5-cpu-syscon: Move
 to dedicated schema
Message-ID: <171623929821.1525513.17330365725365080199.robh@kernel.org>
References: <20240519-dt-bindings-mfd-syscon-split-v1-0-aaf996e2313a@linaro.org>
 <20240519-dt-bindings-mfd-syscon-split-v1-4-aaf996e2313a@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240519-dt-bindings-mfd-syscon-split-v1-4-aaf996e2313a@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240520_140822_624276_BB81C237 
X-CRM114-Status: GOOD (  12.60  )
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


On Sun, 19 May 2024 20:42:19 +0200, Krzysztof Kozlowski wrote:
> microchip,sparx5-cpu-syscon is not a simple syscon device - it has
> children and implements simple-mfd compatible - thus it should be fully
> documented in its own binding.
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
>  .../soc/microchip/microchip,sparx5-cpu-syscon.yaml | 49 ++++++++++++++++++++++
>  2 files changed, 49 insertions(+), 1 deletion(-)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


