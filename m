Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93554C04FFE
	for <linux-mediatek@archiver.kernel.org>; Fri, 17 May 2024 13:17:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:To:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NkG79Hu6VLzIJ2JBVgU9eobqAMYi9cYLM3psFPN5Tw8=; b=V1Z/kMc+MPiSwLk2YYISu40tnv
	QlpRmceOnYYOqoPdSyZIQfz29+SPjjGjS9J2NwBveaNyDFs+KlrMF32Ul99OHgBjF/iY89xpjxC2f
	yzU7gdSRw26C8spBazbbejiisEz2QzHmEVFXAIS70XkvSBhJbUlp/wto0X2aglOe5Czjle9s74qe4
	hzZ8GvjkvGqkN5WvL4FOrjob3N5YQC2bT6xQ6woUkzrdZpClq714XKx2ID6LFhr1Y87V43XUwP7UX
	io9bsBdL5iKB9k897prLstJB9BYzXQti5xTPy91oXqEvTBogbVTNojNvCI8d0OciXQ9BnWARYQqbB
	MLNKgBWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s7xSn-00000007v6u-18r7;
	Fri, 17 May 2024 13:17:33 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s7xSj-00000007v5z-2eKH;
	Fri, 17 May 2024 13:17:31 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 8E60C61A6C;
	Fri, 17 May 2024 13:17:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 386E1C4AF0A;
	Fri, 17 May 2024 13:17:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1715951846;
	bh=1J/lhvIiO6mwtuULpiIS2YMdfysBQ3rnQujL/6UQ5kI=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
	b=o66cIpoUZQCRuv/oIPcPs1sa27U7rtqcrO0zBQa2fIoRbmfrAQ+RCxerlknIhTrDC
	 k2QOumLsaxeFbp/6HLo+9pz7QrglPqhFM59Sy2+b/dThfWkfW8O7kTmIe5NSzpb0vb
	 t6V9t7xBwsIgVUkV0XdikGnmiD5g2MBjldtly8uVs7LB0F1aDJkmHhCdzAJW/abUqT
	 uq3vCi7RCnLEuPzi993MfKSMgG+QrcMLln01zBTSGyM+zPtSVsQS40BhJRjdItOnEe
	 ps0p9ijecCVZn5BvU5o0VLQIJb4iqqmp6oTMOIzP48LHHK0flrYEh0jZ1OWhmm+JYL
	 ZQbk0ot6WlnSw==
Date: Fri, 17 May 2024 08:17:25 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Frank Wunderlich <linux@fw-web.de>
In-Reply-To: <20240516204847.171029-1-linux@fw-web.de>
References: <20240516204847.171029-1-linux@fw-web.de>
Message-Id: <171595174039.1651187.6331361441696662180.robh@kernel.org>
Subject: Re: [PATCH] arm64: dts: mt7622: fix switch probe on bananapi-r64
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240517_061729_736648_53CFD6E2 
X-CRM114-Status: GOOD (  13.27  )
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
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, =?utf-8?q?Ar=C4=B1n=C3=A7_=C3=9CNAL?= <arinc.unal@arinc9.com>, Daniel Golle <daniel@makrotopia.org>, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-arm-kernel@lists.infradead.org, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org


On Thu, 16 May 2024 22:48:47 +0200, Frank Wunderlich wrote:
> From: Frank Wunderlich <frank-w@public-files.de>
> 
> After commit 868ff5f4944a
> ("net: dsa: mt7530-mdio: read PHY address of switch from device tree")
> the mt7531 switch on Bananapi-R64 was not detected.
> 
> mt7530-mdio mdio-bus:00: reset timeout
> mt7530-mdio mdio-bus:00: probe with driver mt7530-mdio failed with error -110
> 
> Fix this by adding phy address in devicetree.
> 
> Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
> ---
>  arch/arm64/boot/dts/mediatek/mt7622-bananapi-bpi-r64.dts | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 


My bot found new DTB warnings on the .dts files added or changed in this
series.

Some warnings may be from an existing SoC .dtsi. Or perhaps the warnings
are fixed by another series. Ultimately, it is up to the platform
maintainer whether these warnings are acceptable or not. No need to reply
unless the platform maintainer has comments.

If you already ran DT checks and didn't see these error(s), then
make sure dt-schema is up to date:

  pip3 install dtschema --upgrade


New warnings running 'make CHECK_DTBS=y mediatek/mt7622-bananapi-bpi-r64.dtb' for 20240516204847.171029-1-linux@fw-web.de:

arch/arm64/boot/dts/mediatek/mt7622-bananapi-bpi-r64.dtb: switch@1f: 'interrupts' is a dependency of 'interrupt-controller'
	from schema $id: http://devicetree.org/schemas/net/dsa/mediatek,mt7530.yaml#






