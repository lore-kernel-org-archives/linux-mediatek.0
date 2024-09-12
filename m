Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7BFEEED615
	for <linux-mediatek@archiver.kernel.org>; Thu, 12 Sep 2024 15:41:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:Cc:To:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zHMOYyxo9RyFXN2hNj0t91141qpZ9grlVLp9qzNqPxA=; b=bk1h26XEyhC6QWYs04Y+8uzu5i
	KFRHompnMfoCT45UWytwZGMuPgpgOMUCMM8oJcnQEpAznTveaw3Jfste3PAXOEwSzfpJDoYqBSpSo
	c3WYZw+88FeQJYbOfPp4H1m9IHeVfciW0koNLF74nXWd2US01gqEvLq8fg3cK3KvZjhxbVGxFVW6N
	aQr7LzHAwcptyfHH+7+yPL70CURkvTOkSVlDJpEs3iKBcKoRZ0bW0IQDMjxsfS6zqYnCKNGfqJPbN
	pt6ENGJ/sZwo9SJRr6qrmNWtkp8dbseKtaddHUeZRE//madjm/ny3dJdbkZ3We92mwOLOmwGOwUua
	lnrXjwIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1solwt-0000000Db7g-1K6K;
	Thu, 12 Sep 2024 15:41:35 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1solvO-0000000DauB-0fFf;
	Thu, 12 Sep 2024 15:40:03 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 5A1CD5C5B9A;
	Thu, 12 Sep 2024 15:39:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7AFADC4CEC3;
	Thu, 12 Sep 2024 15:40:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726155600;
	bh=mZFVRlNHijivCkrfmW31od9zGNtDa8jo6+f4COQFw5U=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
	b=aGD0ozUWzEEsplId8Ux8ykTBbfqxSNyvAzg9nACU84pClQ4t1ooD5SR2ku5L5hX2J
	 2LAdN/mI28mz5Hc5X9mRv6g/tk2WwSGaxjNSpuQD7sh1lBrKc8ZQaD2eaLVIRA1Qoc
	 Ohd4ftCgwTpcp1LyWvWZGYQ62b4Ib/rPbyTc4JeX3BoK2s4iJtMpFHoXRYIKdRam0R
	 5+PJeTSCCA4FUimA+TgE1niC2n0y1HmOShHwbczg1MUmta6mMhVvLkFk0oJfSH11V6
	 OlaTHG717OnOuLzHI8IDFGreF9d+TZpEJopjsMxUHc0SXzY2uyo8IRNYa6cBuVIpjt
	 csC02+WsQC7MA==
Date: Thu, 12 Sep 2024 10:39:59 -0500
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Pablo Sun <pablo.sun@mediatek.com>
Cc: linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 Conor Dooley <conor+dt@kernel.org>
In-Reply-To: <20240912070624.25540-1-pablo.sun@mediatek.com>
References: <20240912070624.25540-1-pablo.sun@mediatek.com>
Message-Id: <172615543357.3778398.2957632897168854309.robh@kernel.org>
Subject: Re: [PATCH v2] arm64: dts: mediatek: mt8395-genio-1200-evk: Enable
 GPU
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240912_084002_443246_384D120D 
X-CRM114-Status: GOOD (  15.76  )
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


On Thu, 12 Sep 2024 15:06:24 +0800, Pablo Sun wrote:
> Enable the Mali Valhall GPU on Genio 1200 EVK by providing regulator
> supply settingsi to gpu and mfg1, and enable the GPU node.
> 
> In addition, set the GPU related regulator voltage range:
> 
> 1. Set the recommended input voltage range of DVDD_GPU to (0.546V-0.787V),
>    based on Table 5-3 of MT8395 Application Processor Datasheet.
>    The regulator mt6315_7_vbuck1("Vgpu") connects to the DVDD_GPU input.
>    Note that the minimum voltage in SoC eFuse data, which is read by
>    MTK-SVS to adjust the regulator voltage, does not go below
>    the recommended operating voltage in the datasheet.
> 
> 2. Set the input voltage of DVDD_SRAM_GPU, supplied by
>    mt6359_vsram_others_ldo_reg, to 0.75V, the recommended typical
>    operating voltage in MT8395 Application Processor Datasheet.
> 
> This patch is tested by enabling CONFIG_DRM_PANFROST and
> on Genio 1200 EVK it probed with following dmesg:
> 
> ```
> panfrost 13000000.gpu: clock rate = 700000092
> panfrost 13000000.gpu: mali-g57 id 0x9093 major 0x0 minor 0x1 status 0x0
> panfrost 13000000.gpu: features: 00000000,000019f7,
> 					   issues: 00000001,80000400
> panfrost 13000000.gpu: Features: L2:0x07120206 Shader:0x00000000
> 					   Tiler:0x00000809 Mem:0x301
> 					   MMU:0x00002830 AS:0xff JS:0x7
> panfrost 13000000.gpu: shader_present=0x50045 l2_present=0x1
> [drm] Initialized panfrost 1.2.0 for 13000000.gpu on minor 0
> ```
> 
> Signed-off-by: Pablo Sun <pablo.sun@mediatek.com>
> ---
>  .../dts/mediatek/mt8395-genio-1200-evk.dts    | 19 +++++++++++++++++--
>  1 file changed, 17 insertions(+), 2 deletions(-)
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


New warnings running 'make CHECK_DTBS=y mediatek/mt8395-genio-1200-evk.dtb' for 20240912070624.25540-1-pablo.sun@mediatek.com:

arch/arm64/boot/dts/mediatek/mt8395-genio-1200-evk.dtb: display@14f06000: clocks: [[32, 14], [32, 43], [32, 44]] is too long
	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,split.yaml#
arch/arm64/boot/dts/mediatek/mt8395-genio-1200-evk.dtb: dp-intf@1c113000: power-domains: False schema does not allow [[45, 18]]
	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,dpi.yaml#






