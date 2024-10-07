Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13370CFB453
	for <linux-mediatek@archiver.kernel.org>; Mon,  7 Oct 2024 18:46:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:Cc:To:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xbP3r3oKeh48qL+Riql2B7uGXsbdHMG0GRQ/FWGJD2k=; b=lKwoaJ+UnGWcf0P9m30DNK5OeU
	GlOrD6lWzvJ9SIDDPazmT3egBq1XxdlRoxBIqgzNc7MJCPdEPjAlNPYecJw3YhGAxKvqL1Wvfr1ab
	Cai8XfHGLbiwUOd94UMw8pCZLFvGy5OTdbXbAz0grnHzV4v2EuygEam2ECRdrkieWNAqok3eez/S9
	3gZ8+eYkl8rWcE4NOoCvVcuiphtcA7ojLW/k65MgUEvRhwVHP7t7YSHUPCH8+9lYoZfogv3b9RMXr
	Iv+Nl0zvY3vRvdeZHB8uCLbFMcU8gS8VANegPXfgbncfDVDIi6hExODwj/F5A663QLlSsTcaKgMj2
	4LSl51Ww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sxsk5-00000003WZs-0cTM;
	Mon, 07 Oct 2024 18:46:01 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sxsik-00000003WDv-3hJ3;
	Mon, 07 Oct 2024 18:44:40 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 5796D5C5DB4;
	Mon,  7 Oct 2024 18:44:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 49FB3C4CECF;
	Mon,  7 Oct 2024 18:44:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728326677;
	bh=TcLq86HfQp6OVk5c65NcK0ozHUSmDFRywdIQzX3Glvo=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
	b=FOzIYEZ8AGF0vIWApCeiMj3cfB0wCBt3iVN0F+H1/laJ/9zNhA4Q9mshN/IXmBcAR
	 CYyCAuOr0u2m26nwQCgwlHCDo6xHyPezUT3aK5RUNKCBUfvtgoYM6QgVkTTCThbms9
	 dntaINgQb1XHaYMEm49Kl/iQBiOSTph7SkXH/zC6WTho7UWaZevOfq7K/XM4d4w1Cn
	 3XiPn8qaNvWYlo2VP2y8/pvTQlt5gG2be1O7bybSBcFjjEhTkCv1mYUif8NsRyQ0/O
	 Ao+Kb8KU8hRUQYW9N410etNpefTDjR14UNjpfU/XL2hWwfPlJOzFJgxrmkUBQMtGnN
	 Lw9/3trvSSHDw==
Date: Mon, 07 Oct 2024 13:44:36 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Macpaul Lin <macpaul.lin@mediatek.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>, Sen Chu <sen.chu@mediatek.com>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Macpaul Lin <macpaul@gmail.com>, linux-arm-kernel@lists.infradead.org, 
 Pablo Sun <pablo.sun@mediatek.com>, 
 Chris-qj chen <chris-qj.chen@mediatek.com>, 
 Conor Dooley <conor+dt@kernel.org>, Bear Wang <bear.wang@mediatek.com>, 
 devicetree@vger.kernel.org, 
 MediaTek Chromebook Upstream <Project_Global_Chrome_Upstream_Group@mediatek.com>, 
 Alexandre Mergnat <amergnat@baylibre.com>, linux-kernel@vger.kernel.org, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 linux-mediatek@lists.infradead.org
In-Reply-To: <20241007090244.1731-1-macpaul.lin@mediatek.com>
References: <20241007090244.1731-1-macpaul.lin@mediatek.com>
Message-Id: <172832632818.2107048.871461442982598898.robh@kernel.org>
Subject: Re: [PATCH v2 1/2] arm64: dts: mediatek: mt8390-genio-700-evk:
 update regulator names
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241007_114438_987118_B36C628E 
X-CRM114-Status: GOOD (  13.76  )
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


On Mon, 07 Oct 2024 17:02:43 +0800, Macpaul Lin wrote:
> Update regulator names to match schematics, replacing generic terms.
> 1. Add system wide 'reg_vsys' node for 4.2V power rail.
> 2. Add 'reg_vsys' node as 'vin-supply' for the following nodes
>  - common_fixed_5v, edp_panel_fixed_3v3, gpio_fixed_3v3, sdio_fixed_3v3,
>    touch0_fixed_3v3, usb_hub_fixed_3v3, usb_p0_vbus, and usb_p1_vbus.
> 3. Update regulator names according to the stable output name on
>    schematics.
>  - vdd_5v, vedp_3v3, ext_3v3, vio18_conn, wifi_3v3, vio33_tp1, vhub_3v3,
>    vbus_p0, vbus_p1.
>  - vcn18_pmu, vcn33_2_pmu, dvdd_proc_l, dvdd_core, vpa_pmu, dvdd_adsp,
>    va12_abb2_pmu, vsim1_pmu, vufs18_pmu.
> 4. Remove usb_hub_reset_1v8. Use 'hub' node to probe USB HUB
>    in subsequent patches.
> 
> Suggested-by: Chen-Yu Tsai <wenst@chromium.org>
> Signed-off-by: Macpaul Lin <macpaul.lin@mediatek.com>
> ---
>  .../dts/mediatek/mt8390-genio-700-evk.dts     | 65 ++++++++++++-------
>  1 file changed, 42 insertions(+), 23 deletions(-)
> 
> Changes for v2:
>  - Add Suggested-by: tag.
>  - Rebase on mediatek/dts64 branch (v6.12-rc1)
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


New warnings running 'make CHECK_DTBS=y mediatek/mt8390-genio-700-evk.dtb' for 20241007090244.1731-1-macpaul.lin@mediatek.com:

arch/arm64/boot/dts/mediatek/mt8390-genio-700-evk.dtb: /soc/pwrap@10024000/pmic/keys: failed to match any schema with compatible: ['mediatek,mt6359-keys']






