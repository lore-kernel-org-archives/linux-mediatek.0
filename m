Return-Path: <SRS0=JxBa=DV=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4CDD9C433E7
	for <linux-mediatek@archiver.kernel.org>; Wed, 14 Oct 2020 04:45:59 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C0CA4221FE
	for <linux-mediatek@archiver.kernel.org>; Wed, 14 Oct 2020 04:45:58 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="S8ZGJICw";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="fYLpPUbq"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C0CA4221FE
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=BpZMj4ZkurSWzPw9UxcMb4ZSTeMRCSffK6hanv+6mtw=; b=S8ZGJICwIX28I0bMRwBwJ3krZ
	YIOjfqTHMu5Ns2HWr+SYyKt74R0InQk7zvqUOFW0ve4SmxW+mieA0iFTTI5CX5h4Z7NhzcnxZR8y9
	NBftmnE6S8U7BCZlsgJso0MtGtmQTYTSgU9cSkQqGq0DUDRh9MaXcgK7dMk9RNpRmwAfUWLGZvhRF
	B+GvE+CFX8TvYPDlLjBjLQGQ5wEd4uMc3DIW37V+C5oLNz1WhLspTMyMfn9DYsYmQXxxY4Jt3TXU+
	luVmJ7zHd/HFTfWGjTjd5IxIZzYjElyRb0NMHe1nwl8QpKFLqF+grYm7H7M0XqqgEGR270wseqqkq
	7RS38h7UQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kSYfc-0005jl-Bd; Wed, 14 Oct 2020 04:45:48 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kSYfX-0005j9-7D; Wed, 14 Oct 2020 04:45:44 +0000
X-UUID: c1dbd68ff4084078abc2f50809baeab7-20201013
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=x91QPLRNfibON85F9Jml+ohJ1lXenPHGO335BQtB9sE=; 
 b=fYLpPUbqX6fheVlKvJrA5ttqWegKRbMLWtcRagH5i60DHx4RPUsdPJGe7ClTykneI4q2SVTzX1xEr0Sfqnbeb1MFkOjyu+w2SBvCYn8ihabEK1wRAZv8fxZV3IDaSxbbD+Vu3u7KyIB358rZHuZZfVcDKM4zK+NMXNSRyCyvte8=;
X-UUID: c1dbd68ff4084078abc2f50809baeab7-20201013
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw02.mediatek.com
 (envelope-from <ck.hu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 119566697; Tue, 13 Oct 2020 20:44:34 -0800
Received: from mtkmbs05n1.mediatek.inc (172.21.101.15) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 13 Oct 2020 21:44:31 -0700
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs05n1.mediatek.inc (172.21.101.15) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 14 Oct 2020 12:44:30 +0800
Received: from [172.21.77.4] (172.21.77.4) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 14 Oct 2020 12:44:30 +0800
Message-ID: <1602650671.27998.2.camel@mtksdaap41>
Subject: Re: [PATCH v2 4/8] dt-bindings: phy: convert HDMI PHY binding to
 YAML schema
From: CK Hu <ck.hu@mediatek.com>
To: Chunfeng Yun <chunfeng.yun@mediatek.com>
Date: Wed, 14 Oct 2020 12:44:31 +0800
In-Reply-To: <20201013085207.17749-4-chunfeng.yun@mediatek.com>
References: <20201013085207.17749-1-chunfeng.yun@mediatek.com>
 <20201013085207.17749-4-chunfeng.yun@mediatek.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201014_004543_388841_7023FBA8 
X-CRM114-Status: GOOD (  21.81  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Min Guo <min.guo@mediatek.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, devicetree@vger.kernel.org,
 David Airlie <airlied@linux.ie>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Kishon Vijay Abraham I <kishon@ti.com>,
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 Vinod Koul <vkoul@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 linux-mediatek@lists.infradead.org, Daniel Vetter <daniel@ffwll.ch>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Stanley Chu <stanley.chu@mediatek.com>,
 "David S . Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi, Chunfeng:

On Tue, 2020-10-13 at 16:52 +0800, Chunfeng Yun wrote:
> Convert HDMI PHY binding to YAML schema mediatek,ufs-phy.yaml
> 
> Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
> ---
> v2: fix binding check warning of reg in example
> ---
>  .../display/mediatek/mediatek,hdmi.txt        | 17 +---
>  .../bindings/phy/mediatek,hdmi-phy.yaml       | 90 +++++++++++++++++++
>  2 files changed, 91 insertions(+), 16 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/phy/mediatek,hdmi-phy.yaml
> 
> diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,hdmi.txt b/Documentation/devicetree/bindings/display/mediatek/mediatek,hdmi.txt
> index 7b124242b0c5..edac18951a75 100644
> --- a/Documentation/devicetree/bindings/display/mediatek/mediatek,hdmi.txt
> +++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,hdmi.txt
> @@ -50,22 +50,7 @@ Required properties:
>  
>  HDMI PHY
>  ========
> -
> -The HDMI PHY serializes the HDMI encoder's three channel 10-bit parallel
> -output and drives the HDMI pads.
> -
> -Required properties:
> -- compatible: "mediatek,<chip>-hdmi-phy"
> -- reg: Physical base address and length of the module's registers
> -- clocks: PLL reference clock
> -- clock-names: must contain "pll_ref"
> -- clock-output-names: must be "hdmitx_dig_cts" on mt8173
> -- #phy-cells: must be <0>
> -- #clock-cells: must be <0>
> -
> -Optional properties:
> -- mediatek,ibias: TX DRV bias current for <1.65Gbps, defaults to 0xa
> -- mediatek,ibias_up: TX DRV bias current for >1.65Gbps, defaults to 0x1c
> +See phy/mediatek,hdmi-phy.yaml
>  
>  Example:
>  
> diff --git a/Documentation/devicetree/bindings/phy/mediatek,hdmi-phy.yaml b/Documentation/devicetree/bindings/phy/mediatek,hdmi-phy.yaml
> new file mode 100644
> index 000000000000..77df50204606
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/phy/mediatek,hdmi-phy.yaml
> @@ -0,0 +1,90 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +# Copyright (c) 2020 MediaTek
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/phy/mediatek,hdmi-phy.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: MediaTek High Definition Multimedia Interface (HDMI) PHY binding
> +
> +maintainers:
> +  - CK Hu <ck.hu@mediatek.com>

I think you should remove "CK Hu <ck.hu@mediatek.com>" and add latest
mediatek drm maintainer:

DRM DRIVERS FOR MEDIATEK
M:	Chun-Kuang Hu <chunkuang.hu@kernel.org>
M:	Philipp Zabel <p.zabel@pengutronix.de>
L:	dri-devel@lists.freedesktop.org
S:	Supported
F:	Documentation/devicetree/bindings/display/mediatek/
F:	drivers/gpu/drm/mediatek/

Regards,
CK

> +  - Chunfeng Yun <chunfeng.yun@mediatek.com>
> +
> +description: |
> +  The HDMI PHY serializes the HDMI encoder's three channel 10-bit parallel
> +  output and drives the HDMI pads.
> +
> +properties:
> +  $nodename:
> +    pattern: "^hdmi-phy@[0-9a-f]+$"
> +
> +  compatible:
> +    enum:
> +      - mediatek,mt2701-hdmi-phy
> +      - mediatek,mt8173-hdmi-phy
> +
> +  reg:
> +    maxItems: 1
> +
> +  clocks:
> +    items:
> +      - description: PLL reference clock
> +
> +  clock-names:
> +    items:
> +      - const: pll_ref
> +
> +  clock-output-names:
> +    items:
> +      - const: hdmitx_dig_cts
> +
> +  "#phy-cells":
> +    const: 0
> +
> +  "#clock-cells":
> +    const: 0
> +
> +  mediatek,ibias:
> +    description:
> +      TX DRV bias current for < 1.65Gbps
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    minimum: 0
> +    maximum: 63
> +    default: 0xa
> +
> +  mediatek,ibias_up:
> +    description:
> +      TX DRV bias current for >= 1.65Gbps
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    minimum: 0
> +    maximum: 63
> +    default: 0x1c
> +
> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +  - clock-names
> +  - clock-output-names
> +  - "#phy-cells"
> +  - "#clock-cells"
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/mt8173-clk.h>
> +    hdmi_phy: hdmi-phy@10209100 {
> +        compatible = "mediatek,mt8173-hdmi-phy";
> +        reg = <0x10209100 0x24>;
> +        clocks = <&apmixedsys CLK_APMIXED_HDMI_REF>;
> +        clock-names = "pll_ref";
> +        clock-output-names = "hdmitx_dig_cts";
> +        mediatek,ibias = <0xa>;
> +        mediatek,ibias_up = <0x1c>;
> +        #clock-cells = <0>;
> +        #phy-cells = <0>;
> +    };
> +
> +...

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
