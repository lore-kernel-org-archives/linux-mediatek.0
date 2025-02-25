Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 811CBC021B2
	for <linux-mediatek@archiver.kernel.org>; Tue, 25 Feb 2025 09:32:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nTlnmlFlNu5CnS17yyvC/3m48ywlBgAE4klLG/7W5vs=; b=0GwvKmk0MpGK6AT1Y/b4Lh91qE
	pmuhjgOri6LGdIc2Edlr+HAs+8NRWQm7ZpNrDP+fVVrV8GMm/B4fYs2nRzHLnnd3ekjMU2vJbAVUt
	hcNHCuz4wXMI2L4bu/1eWwoeQB11Byi/Xb4TafPoNdky4w/s0wZyjdbBLxJRG8C6hJWDSyT3cbEBq
	ELMWXO2osPD+H1RSZ+iq+mCrlebRAPGGjUxNO6hHjKP+6zaHkxH0xFd3w42ZSR8D26eYSkMadY7zk
	kaA5VbtHdt6GWxv63paLZvAEJnW7SxtMFuw30pRV3TSCVjG7mZw+5GPHjK7j57qlKSBAXJv/B88Hy
	mNRup6Zg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmrJ7-0000000GbN2-2rY2;
	Tue, 25 Feb 2025 09:32:53 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tmqpp-0000000GUxT-3FmG;
	Tue, 25 Feb 2025 09:02:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1740474156;
	bh=RwD9Gz02QH5eAwhS1aHv2+U1ENtiqeTZVSrKrGfP2dU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=mad34g9i/Acnl3b3bjkV/XIYDG+h63kRAtLqDy1H60vvcFWoD0JAwFNTrA3WoOT48
	 k05gGSpJrlxAACdz+Iet2xyV97LFujkaEAbyNZybRU3UO9hRCXxQzHBiMdhi82/vUm
	 VhwQ4kVPYQvmucasQVX6QukQBRWH9tK8JI7FNvPXtllmZnsfF73eyi/LC9reiNRmR0
	 AUe4EqsmFyy+ThuTuis9sjrVa9uXvRYzC9ZagCGw8C6S0KeiAuMiVYhO8zLJkZ1VRv
	 1/Irl+it6iJOE0n9RbfpSpeI4lxCevSpRSKp8KIBpcfhNa8XpKxn0MJxJMUskp8OWF
	 jmoUznt7wHSNg==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id BED1517E1016;
	Tue, 25 Feb 2025 10:02:35 +0100 (CET)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: linux-mediatek@lists.infradead.org, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
 matthias.bgg@gmail.com, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 kernel@collabora.com, pablo.sun@mediatek.com
In-Reply-To: <20250220110948.45596-1-angelogioacchino.delregno@collabora.com>
References: <20250220110948.45596-1-angelogioacchino.delregno@collabora.com>
Subject: Re: [PATCH v1 0/4] MediaTek MT8188 Display Graph:
 Chromebooks+Genio
Message-Id: <174047415570.19243.8135103122459285284.b4-ty@collabora.com>
Date: Tue, 25 Feb 2025 10:02:35 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250225_010237_964686_282FC6B9 
X-CRM114-Status: UNSURE (   8.04  )
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

On Thu, 20 Feb 2025 12:09:44 +0100, AngeloGioacchino Del Regno wrote:
> Like already done for MT8195 in a parallel series, this one adds a
> base display controller graph for the MT8188 SoC, migrates the Geralt
> Chromebooks to use it, and adds support for the DSI display found on
> the Genio 510 and Genio 700 boards.
> 
> While at it, this also adds pinmux configuration for switching on/off
> the fixed power supply of the touchscreen IC found in Genio 510 and 700
> IoT boards to stop relying on the bootloader preconfiguring it as GPIO
> before booting the kernel.
> 
> [...]

Applied to v6.14-next/dts64, thanks!

[1/4] arm64: dts: mediatek: mt8188: Add base display controller graph
      commit: affbd1197886bf0e05a0a71d3fdeb0a1abd9703d
[2/4] arm64: dts: mediatek: mt8390-genio-common: Add Display on DSI0
      commit: e9596d5c78d08936e57af15ee9e59ecbfa51a85e
[3/4] arm64: dts: mediatek: mt8188-geralt: Add graph for DSI and DP displays
      commit: 67bd5834f6a72f9971fea6c07830d0c336d3fbee
[4/4] arm64: dts: mediatek: mt8390-genio-common: Configure touch vreg pins
      commit: 39371656c1592262205fa75bbd25bbda5592446f

Cheers,
Angelo



