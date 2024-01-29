Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79238C47422
	for <linux-mediatek@archiver.kernel.org>; Mon, 29 Jan 2024 14:18:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=e6qIV6loRIOEv3P7fF583oE4mQ6UsCs4t3QHOrZAQ0c=; b=Xs3DwGcxS1wNlCpRAEa7rHesAt
	VtBWPtpt65m9Y/ANtBtIrWgn5PYykqBStH76z6dHyavgjGkYVF3qWHgUampLZuoCe5H2oFfvor2tV
	Z5Ui+t+USomeinoTtkedv6H6MAN30Dkn5LvPpSXqFxhebKQ330MhmD0nndXgTlshldMOSvEMDIV/K
	jK5/9ad7Eu+WrSFW/qkIIAzJbI+S6zgJHgsqvi/dL91BpH1KBNGBVSuozBE/6YGyd0/IFwDOFPNtB
	993eVCgcyr7+1Kg0NgC5atffQqncWv1bI4fWx2aQz3TASNPJaHm94jg5JQC/IMcoLdGjuwtRR8ZgB
	tGtqCd5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rUSSi-0000000D287-09n6;
	Mon, 29 Jan 2024 14:18:12 +0000
Received: from madrid.collaboradmins.com ([46.235.227.194])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rUSSe-0000000D25v-2Pkg;
	Mon, 29 Jan 2024 14:18:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1706537883;
	bh=kWxjb4ml+ynyqsVlPQAgRdTWagFtJPgdg5NTdak0Vgk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Dx1cQo0eksjy1IF4R7mGyf6fjgGfyGo2p3LnfOahQwW0DsfFpcsODh8KjqtS8w4nu
	 YmOVBkU+2MXNXwiOEzr1soD+Tc0RKQ0+B+EgFuLGed80bHmwc5vaE6L/V4rBLa9e9m
	 m1GIgnKytF3TulAjvhBrEb7Om8HrCjYtyO5GuDd8BAzTgrwPF4RqAVVi3FjjyWrAyc
	 1rxtrTnUYdl5rjbKU6hLaGYpHLKklL3q/uymLgST4jyo9GSxE1eoO18bqIpbBGPU+7
	 NCH3tHg0huh0J5VEy7E0oUXchipPlfjqah6BKwx7wJReu52ieiFIn20WRLr0O2HOCn
	 wAjMIlGpttttg==
Received: from IcarusMOD.eternityproject.eu (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id C08DC3781492;
	Mon, 29 Jan 2024 14:18:02 +0000 (UTC)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: Matthias Brugger <matthias.bgg@gmail.com>,
	Chen-Yu Tsai <wenst@chromium.org>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Eugen Hristev <eugen.hristev@collabora.com>,
	devicetree@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 0/9] arm64: dts: mediatek: Add MT8186 Corsola Chromebooks
Date: Mon, 29 Jan 2024 15:17:46 +0100
Message-ID: <170653783721.1024557.10198191746987942354.b4-ty@collabora.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240126083802.2728610-1-wenst@chromium.org>
References: <20240126083802.2728610-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240129_061808_823572_847EA3AE 
X-CRM114-Status: UNSURE (   9.90  )
X-CRM114-Notice: Please train this message.
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


On Fri, 26 Jan 2024 16:37:49 +0800, Chen-Yu Tsai wrote:
> This is v5 of the MT8186 Chromebook device tree series. This series also
> depends on MT7921S Bluetooth [1] and IT6505 audio [2] bindings.
> 
> Changes since v4:
> - Rebase and fit in mt8188-evb in board DT binding
> - Change "touchpad" to "trackpad" in descriptions and commit logs
> - Drop #address-cells and #size-cells from it6505 and usb_host1 nodes
> - Drop "ports" nodes from type-c nodes
> - Fix pinmux node names
> - Split anx7625 reset and power-en pins into separate pinmux nodes
> 
> [...]

Applied to v6.8-next/dts64, thanks!

[1/9] dt-bindings: arm: mediatek: Sort entries by SoC then board compatibles
      commit: ab7e0bfc2ce6d9e81f096e4058e1ea5f9d3c11fe
[2/9] dt-bindings: arm: mediatek: Add MT8186 Tentacruel / Tentacool Chromebooks
      commit: 72d721234de52837d84f9a8ffe78e04a61bb9b37
[3/9] dt-bindings: arm: mediatek: Add MT8186 Steelix Chromebook
      commit: 0f20d2a2ff103ac9aa757357ddf1cb137f767d3e
[4/9] dt-bindings: arm: mediatek: Add MT8186 Rusty Chromebook
      commit: 66135c73d2dc43f7f0fab6e7fdf44fa8e42a9b97
[5/9] dt-bindings: arm: mediatek: Add MT8186 Magneton Chromebooks
      commit: a597b13dc92cee39547e894908f787210cbb1a99
[6/9] arm64: dts: mediatek: Add MT8186 Krabby platform based Tentacruel / Tentacool
      commit: 660324894cc56e60711a12de51d94398f4e794b6
[7/9] arm64: dts: mediatek: Introduce MT8186 Steelix
      commit: 5252fa5b5ecbd65fdab2dfec0c14b96d00ae4b97
[8/9] arm64: dts: mediatek: Add MT8186 Steelix platform based Rusty
      commit: 498a5b6f8b67f60e5859bdd3d582274ae3aa2bbb
[9/9] arm64: dts: mediatek: Add MT8186 Magneton Chromebooks
      commit: 71e147d069291d0c92e4df903a2895eb5587b559

Best regards,
-- 
AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

