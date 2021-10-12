Return-Path: <SRS0=GRN7=PA=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9F611C433FE
	for <linux-mediatek@archiver.kernel.org>; Tue, 12 Oct 2021 01:59:05 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 561EF60F43
	for <linux-mediatek@archiver.kernel.org>; Tue, 12 Oct 2021 01:59:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 561EF60F43
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BXnKqjoW/2uEdCpRS6jrgYhUtSuCchrq9aipRfz0QFM=; b=D/r6Jjkj0prxZc
	QA5b84MDeO++7SGq797/nxI7mH7KaoIW8Yv8Oc3TnT4woKLN76jQjeIbVOZMEchMHOv0W4vyc9mBL
	XvGanROgBpzE7d/KP4TjMbISXcDxB7LJzk4xbQhFwki9N08Tb4jpFumN/CADFpCkM1HFcIckLH2aS
	StMr0EY6DAn2M1OrQCsXNV7uWbjiBmsGMGLX3lNh265VaZScpI/8bkv9oycgfJhpE99/Y6kyFQ/KF
	0BzhJCPR9efao0CfGlcc6hy1I0UJ0eTA5vJydjurVfIjbKImY+MJTNuRxShEEiHuzGpzDI4llv7dk
	gQF/F+n77v63GY4LVKGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ma748-00BEda-NL; Tue, 12 Oct 2021 01:58:52 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ma745-00BEcr-FH; Tue, 12 Oct 2021 01:58:51 +0000
X-UUID: dbb6948833bc4e44b9a48c93aee9615b-20211011
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=uNQhKUvX6znaQDjpBxvpN1tm6No5kIlEywKVEAQ11v4=; 
 b=N2sDzpN4FSxItgFkjFiL8w+RVbG+Wc/tn8HhWOWcSsszJq/fzguDVtqfFgfGHx/UQUYUc2I2OROVm1sIZml8aUD0LbtkpIj2Ze4VeVHVJ7yD9Yg5LCfnJcs8ZOqvmsMBflb+TQ4tS9V0zAhzgzDUaRURDX5uJcuJLKcpbWezdo4=;
X-UUID: dbb6948833bc4e44b9a48c93aee9615b-20211011
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <chunfeng.yun@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1422900323; Mon, 11 Oct 2021 18:58:44 -0700
Received: from MTKMBS33N1.mediatek.inc (172.27.4.75) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 11 Oct 2021 18:52:57 -0700
Received: from MTKCAS36.mediatek.inc (172.27.4.186) by MTKMBS33N1.mediatek.inc
 (172.27.4.75) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Tue, 12 Oct 2021 09:52:49 +0800
Received: from mhfsdcap04 (10.17.3.154) by MTKCAS36.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 12 Oct 2021 09:52:49 +0800
Message-ID: <0f620925d20a14c8f5f198241e4a136f9d48e206.camel@mediatek.com>
Subject: Re: [PATCH v1 1/4] dt-bindings: phy: Add binding for Mediatek
 MT8195 HDMI PHY
From: Chunfeng Yun <chunfeng.yun@mediatek.com>
To: Guillaume Ranquet <granquet@baylibre.com>, <chunkuang.hu@kernel.org>,
 <p.zabel@pengutronix.de>, Kishon Vijay Abraham I <kishon@ti.com>, Vinod Koul
 <vkoul@kernel.org>, Rob Herring <robh+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>
CC: <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, <linux-phy@lists.infradead.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Date: Tue, 12 Oct 2021 09:52:52 +0800
In-Reply-To: <20210929094425.745-2-granquet@baylibre.com>
References: <20210929094425.745-1-granquet@baylibre.com>
 <20210929094425.745-2-granquet@baylibre.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: B45878DFBBAE411D00B78F558FF34CA1F8FC152D9CF13DAD6C17EDE2272C44542000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211011_185849_544535_BE85B98B 
X-CRM114-Status: GOOD (  16.69  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Wed, 2021-09-29 at 11:44 +0200, Guillaume Ranquet wrote:
> Add bindings to describe Mediatek MT8195 HDMI PHY
> 
> Signed-off-by: Guillaume Ranquet <granquet@baylibre.com>
> ---
>  .../phy/mediatek,mtk8195-hdmi-phy.yaml        | 70
> +++++++++++++++++++
>  1 file changed, 70 insertions(+)
>  create mode 100644
> Documentation/devicetree/bindings/phy/mediatek,mtk8195-hdmi-phy.yaml
> 
> diff --git a/Documentation/devicetree/bindings/phy/mediatek,mtk8195-
> hdmi-phy.yaml
> b/Documentation/devicetree/bindings/phy/mediatek,mtk8195-hdmi-
> phy.yaml
> new file mode 100644
> index 0000000000000..6b39bb8c9dfe7
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/phy/mediatek,mtk8195-hdmi-
> phy.yaml
> @@ -0,0 +1,70 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +# Copyright (c) 2020 MediaTek
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/phy/mediatek,hdmi-phy.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: MediaTek High Definition Multimedia Interface (HDMI) PHY
> binding for mt8195
> +
> +maintainers:
> +  - Chun-Kuang Hu <chunkuang.hu@kernel.org>
> +  - Philipp Zabel <p.zabel@pengutronix.de>
> +  - Chunfeng Yun <chunfeng.yun@mediatek.com>
> +
> +description: |
> +  The HDMI PHY serializes the HDMI encoder's three channel 10-bit
> parallel
> +  output and drives the HDMI pads.
> +
> +properties:
> +  $nodename:
> +    pattern: "^hdmi-phy@[0-9a-f]+$"
> +
> +  compatible:
> +    - const: mediatek,mt8195-hdmi-phy
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
> +      - const: hdmi_xtal_sel
No need prefix "hdmi_",
After you merge mt8195-hdmi-phy driver into phy-mtk-hdmi.c, this
binding will also be merged into mediatek,hdmi-phy.yaml as suggested by
Chun-Kuang.

Thanks a lot
 
> +
> +  clock-output-names:
> +    items:
> +      - const: hdmi_txpll
> +
> +  "#phy-cells":
> +    const: 0
> +
> +  "#clock-cells":
> +    const: 0
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
> +    hdmi_phy: hdmi-phy@11d5f000 {
> +        compatible = "mediatek,mt8195-hdmi-phy";
> +        reg = <0 0x11d5f000 0 0x100>;
> +        clocks = <&topckgen 77>;
> +        clock-names = "hdmi_xtal_sel";
> +        clock-output-names = "hdmi_txpll";
> +        #clock-cells = <0>;
> +        #phy-cells = <0>;
> +    };
> +
> +...
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
