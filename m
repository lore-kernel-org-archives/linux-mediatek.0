Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86EA2D216AD
	for <linux-mediatek@archiver.kernel.org>; Tue, 15 Oct 2024 14:26:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:Cc:To:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FiHe6e3AFwblX7GlGI1M3psvCDtCwffLLetd2q1nO5s=; b=Is0hSGJae+ZOXAOZs8rVgTybxY
	WUtlDcfF8TQBI/XMn8kELEZXvys/CrATwSPh+HA9/nqMFm0kgB7gL5+a3acyGMSiRLiwGBxpPUsQT
	Hvyou40Wc8+9rVX2CntAu8zAiX0y5NjCw5GG90ZUnsAqQ9laZSy4dsehn4hd1AEVeiiVpEn8rHrih
	GGTMEi27gWz+JtZxgvrpMBD+NoB4kWEUvSo8JVcqpYOfV0plHXTGSdrSrVLSBkRgrrq3NFFJ0MJK7
	nuCCNRZXpmKScx1DC4kqiW6xf3JV5NKj9JNgTTNwSIpuo2GE/qEUYdxFwm/EmjQ4UvXcpX1P1/yON
	o8Ee1aLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t0iUv-00000008VmF-1yRu;
	Tue, 15 Oct 2024 14:26:05 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t0iMw-00000008UTU-0LFw;
	Tue, 15 Oct 2024 14:17:52 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id B11095C5D8F;
	Tue, 15 Oct 2024 14:17:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9C4C0C4CEC6;
	Tue, 15 Oct 2024 14:17:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729001868;
	bh=iZqNn7g9OXXe6WGfli4O7RtbH/+szUKN4vMHdvXmN+g=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
	b=kP1MDclPUrNREYEAwxiyR80xbeOTPqkTkG/X952td+u/RHZ7rHSNdXzC3EFOeEeph
	 fYvaVdAxWxBofYTsqm3KQ3hBZfY4PozFgds6U89KcImxmX6E9wVASRJARLOPAKQnQp
	 n5cjs26QM5B+49JeTL/ksTRb0ZWg2xCpoVPu6cinHhX6/UbjdY9QVf0JYwZVB1aayc
	 G+U4DDbzzy1aLlaYljoe4fezguILi+m90W/vw8HNDD/fIXFgcY0GWV7U2mtzLQ/lK1
	 JK27TqLOnX1csuMRwVzINFCLfPeKTh25J+fKcSCfQ0V/8sXeVGhiDpD79+AVuaAXec
	 LnUNJDDqL+MyQ==
Date: Tue, 15 Oct 2024 09:17:46 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Macpaul Lin <macpaul.lin@mediatek.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 linux-mediatek@lists.infradead.org, 
 Chunfeng Yun <chunfeng.yun@mediatek.com>, devicetree@vger.kernel.org, 
 Matthias Brugger <matthias.bgg@gmail.com>, linux-kernel@vger.kernel.org, 
 ChiYuan Huang <cy_huang@richtek.com>, Bear Wang <bear.wang@mediatek.com>, 
 Macpaul Lin <macpaul@gmail.com>, 
 Project_Global_Chrome_Upstream_Group@mediatek.com, 
 Conor Dooley <conor+dt@kernel.org>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 linux-arm-kernel@lists.infradead.org, linux-usb@vger.kernel.org, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Pablo Sun <pablo.sun@mediatek.com>, 
 Chris-qj chen <chris-qj.chen@mediatek.com>
In-Reply-To: <20241015103337.20479-1-macpaul.lin@mediatek.com>
References: <20241015103337.20479-1-macpaul.lin@mediatek.com>
Message-Id: <172900161055.732877.16548202853893861395.robh@kernel.org>
Subject: Re: [PATCH 1/2] dt-bindings: usb: mediatek,mt6360-tcpc: add ports
 properties
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241015_071750_195723_CB8CBEDB 
X-CRM114-Status: GOOD (  11.13  )
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


On Tue, 15 Oct 2024 18:33:36 +0800, Macpaul Lin wrote:
> Add 'ports' and sub node 'port' properties to specify connectors on the
> High-Speed/Super-Speed data bus, or Sideband Use (SBU) AUX lines
> endpoints of the USB controller.
> 
> Signed-off-by: Macpaul Lin <macpaul.lin@mediatek.com>
> ---
>  .../bindings/usb/mediatek,mt6360-tcpc.yaml    | 21 +++++++++++++++++++
>  1 file changed, 21 insertions(+)
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


New warnings running 'make CHECK_DTBS=y mediatek/mt8395-genio-1200-evk.dtb' for 20241015103337.20479-1-macpaul.lin@mediatek.com:

arch/arm64/boot/dts/mediatek/mt8395-genio-1200-evk.dtb: usb@11201000: 'mediatek,usb3-drd' does not match any of the regexes: '^usb@[0-9a-f]+$', 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/usb/mediatek,mtu3.yaml#






