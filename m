Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0AA82C83013
	for <linux-mediatek@archiver.kernel.org>; Wed,  2 Jul 2025 06:57:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9vXwC7TmnSByyss6OYDQpxWuOZH00pqiV823Vv5KjDs=; b=c3t90/oKIR5pRdULemzB6mS2Q5
	P5zpH+sumC47QZs17NXYK+LsGVDgKzu1Vpb5ci1FbTkok53s3DUEYiPduRO+4GqmXqAx4Oal6NTlt
	MhP/6kXon1fEVFm5mVwG3zzlkOLfejZNcyTxL8N8nQmp+Je4HwpDCEld4iw+tjOxNF40NWNJctVNq
	+K8drKyd1j+KFjEhQmpcwyGDngwyBYUwE9L1/5OlIfzvosDVrcW+u2P9+W5xK9jBMrqG8ts+mXW46
	DLYDGovAm0pL90J4gZV1jmM7Kad3mEAKCJ1BdeL2CXUJwjaD8FEc5OWCEUPGuxXoj1ySwhjC3fAGW
	XWh6EREQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWrP3-00000007SBU-1xJy;
	Wed, 02 Jul 2025 06:57:09 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWrIj-00000007RcY-08qm;
	Wed, 02 Jul 2025 06:50:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=9vXwC7TmnSByyss6OYDQpxWuOZH00pqiV823Vv5KjDs=; b=YyPY0Tut0i3UTr3lDDO+2ME9Ot
	GcsBd4y6/TFHC7zvPwGuZLaGU3N3A7vytcb2oAyJC59P5843lEINYFs/xikbW7OXDCNDk3zj4FUML
	9tjLaX5bYHSVCy/JdxFWi2m7VCJkyPUkS4DZU9NVp58VQPnlSoDzGtGIOzLi/7Lyik+rgGO8C5nGm
	hyFCV/66ahjYW+qS1Aac4ey4FgfgygeWxinU7fCEnDYW0RDHMjaDmCe5e1Oeh6VUHN5bxskVK2Pov
	u7PucZDNJlUou9esMl5E0MSvGS3QrFyAKKdntiIS1ZycZe2/lZXTrnGj2huQNRwIi3G/UpjyuAS9e
	y5vuAhmw==;
Received: from dfw.source.kernel.org ([139.178.84.217])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWrIf-00000007Hlc-1cqU;
	Wed, 02 Jul 2025 06:50:35 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id C46145C58B7;
	Wed,  2 Jul 2025 06:50:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DDD4DC4CEEE;
	Wed,  2 Jul 2025 06:50:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751439031;
	bh=f5xtgW85Pmdkf7NAY39l9hBBBHkw6klVthxbcAS/Ie4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=sipMSGhkq0VFiX5ymwlHzS/MjVKHUxSc88FYG16G//+tL5CwjMpqo6nNNc9snQj/b
	 +aSjM5thzzVDm1yZqRiqMepTU/vLbHrUfW7dXcuhqEC/RQ47wHd3K+459C3VOqIpAB
	 QN6CcOlzsQOefhEAy4biMovrYq4dWOXQGGqnSBu2CkQ5c+0a/LvKr/qQKePDEDH7w+
	 dsZDwGfkVIz8YmMGCVwXzx+yVc6NxmwktV2/VTwR7ObkylMx3zxrxoavuDXSLWRefq
	 vDL7xxF9dXWflHtbn18QLotOSMyOXX+Yactxsg+0tlBfCW3rlPxYaAuL3q9pVQiw1R
	 4Q/D2LMrJ1cKg==
Date: Wed, 2 Jul 2025 08:50:28 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: robh@kernel.org, conor+dt@kernel.org, matthias.bgg@gmail.com, 
	ulf.hansson@linaro.org, arnd@arndb.de, m.wilczynski@samsung.com, nm@ti.com, 
	khilman@baylibre.com, kabel@kernel.org, quic_hyiwei@quicinc.com, pjp@fedoraproject.org, 
	tudor.ambarus@linaro.org, drew@pdp7.com, u.kleine-koenig@baylibre.com, 
	gregkh@linuxfoundation.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, laura.nao@collabora.com, 
	kernel@collabora.com
Subject: Re: [RFC PATCH 2/3] dt-bindings: firmware: Document the MediaTek
 Hardware Voter (HWV)
Message-ID: <20250702-debonair-lynx-of-serenity-ee7138@krzk-bin>
References: <20250701151149.136365-1-angelogioacchino.delregno@collabora.com>
 <20250701151149.136365-3-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250701151149.136365-3-angelogioacchino.delregno@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250702_075034_118209_305CB570 
X-CRM114-Status: GOOD (  19.97  )
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

On Tue, Jul 01, 2025 at 05:11:48PM +0200, AngeloGioacchino Del Regno wrote:
> Add documentation for the new MediaTek Hardware Voter, found in
> MediaTek SoCs like the MT8196 Kompanio Ultra for Chromebooks and
> the MT6991 Dimensity 9400 for Smartphones.
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
>  .../mediatek,mt6991-hardware-voter.yaml       | 70 +++++++++++++++++++
>  1 file changed, 70 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/firmware/mediatek,mt6991-hardware-voter.yaml
> 
> diff --git a/Documentation/devicetree/bindings/firmware/mediatek,mt6991-hardware-voter.yaml b/Documentation/devicetree/bindings/firmware/mediatek,mt6991-hardware-voter.yaml
> new file mode 100644
> index 000000000000..173b74c23a91
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/firmware/mediatek,mt6991-hardware-voter.yaml
> @@ -0,0 +1,70 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +# Copyright 2025 Collabora Ltd
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/firmware/mediatek,mt6991-hardware-voter.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: MediaTek Hardware Voter (HWV)
> +
> +maintainers:
> +  - AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> +
> +description:
> +  The MediaTek Hardware Voter (HWV) is a SoC-internal fixed-function MCU
> +  used to collect votes from both the Application Processor and from the
> +  various other remote processors present in the SoC, and transparently
> +  turn on or off various hardware resources (for example, power domains
> +  or system clocks) based on aggregation of votes done in the HWV MCU's
> +  internal state machine, therefore guaranteeing synchronization of the
> +  hardware resource requests between all components of the SoC and hence
> +  avoiding, for example, unclocked or unpowered access to the hardware.
> +
> +properties:
> +  $nodename:
> +    pattern: "^system-controller@[0-9a-f]+$"
> +
> +  compatible:
> +    const: mediatek,mt6991-hardware-voter
> +
> +  reg:
> +    items:
> +      - description: Address and size of the Hardware Voter MMIO
> +

No resources here, so this should go to power controller

> +  power-controller:
> +    $ref: /schemas/power/mediatek,power-controller.yaml
> +
> +required:
> +  - compatible
> +  - reg
> +
> +additionalProperties: true
> +
> +examples:
> + - |
> +   scp_hwv: system-controller@14500000 {
> +     compatible = "mediatek,mt6991-hardware-voter";
> +     reg = <0 0x14500000 0 0x3000>;
> +
> +     power-controller {
> +       compatible = "mediatek,mt8196-hwv-scp-power-controller";

mt8196 in mt6991 is very confusing.

Anyway, this does not address my comment at all. You again create some
sort of syscon for voting, so no. You are supposed to use generic API
for voting: clocks, power domains, interconnects - whatever is there
applicable or necessary.

Best regards,
Krzysztof


