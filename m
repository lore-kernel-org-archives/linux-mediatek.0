Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62102C433EF
	for <linux-mediatek@archiver.kernel.org>; Mon, 23 May 2022 08:16:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HeIgkbSv41V6m830oIi7eGEZa3OkD5FGKlWT1GTpkaU=; b=vISAnqtlBOi9I1
	zE+FV3Vnw+nLuaAhoRLHReCduMsAA+I1JrIDRmjpj0MjZO4bsoFwnO5kt7zQ6qXmECs/DCumOGa1b
	OrNOCO+L+CK/7prX2h7aQNCksG3tddSg4eSDnvAXIYoYvWXN4bYeP39Le8Q5Xrq2Bj6BR4S61ql43
	HLhZglvUXZuMrxLBINMLelvtgp2xzc7cjRAXUWeca0FOHETrVviF+6R89BuliSfXgEHYlpMxzxyS6
	KnhUmUqxQhg0du2YzNiKu5m8taqgedpUqss4aP9c7f59W8xw+gtapviP5uZ5Qk4fZ2s9i5UH0fFVu
	4NZf/vbWPy9GEuUSxNzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nt3EZ-002MHe-2a; Mon, 23 May 2022 08:16:11 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nt2sX-002CKb-Iu; Mon, 23 May 2022 07:53:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
 :Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID:
 Sender:Reply-To:Content-ID:Content-Description;
 bh=ciEKPl+sEFNkbw1QKYV4PYclGtIdKyDvBrsg+zrjIlA=; b=VCF5JmsegCbeweuq8IDkNRrJcb
 TsDiOQhLg2nrJyBnisECp7Aru8iNbs1KL7JWSR/0UU4YeJp4vkT/skWuP95AXZSAIL1vVlencgX1a
 1KVNQYZfeYhbKDDHiISA47ITTyUt40cKWgugEL/cFA3LwDHCY1xrraJ4pcNnUO+QkfJJNSDBVixG1
 xQpTxjRuhGwiXTVewDKF4VeyNl83YrA9T4sgPVsyHvM0qQ3ql+ixvBgMhVnRjxNDUU9Xbgh4WiuBU
 /f8wDpIGYOTgAdypEJae3fyDu6CFnq/qPQIeeBa+rAYylFymPrxdWUUOm5seCRsmke8urOCk8zWQe
 Or0at8fA==;
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by desiato.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nsxrc-000lUe-BV; Mon, 23 May 2022 02:32:13 +0000
X-UUID: 101bf071e59d4f31afecaa4680317dff-20220522
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=ciEKPl+sEFNkbw1QKYV4PYclGtIdKyDvBrsg+zrjIlA=; 
 b=YxSi/CLnEwii82qUiLrJxnBsIN8HCzTljc2Stv8Tj2lTBIgTHuCBmGdBrY9wloDUxcNBV/fpq+QAb6EKPhN1PHH7RRaNTbM5O7Nt8EZCaOI2wJpTRSw2WtAT+qybxeakv/CuDBtcIATyrsynrMArE8AJfxtcKpVIgaL0lPK3Gew=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.5, REQID:fd7063f2-b819-42f4-bafd-ee4ef03e4452, OB:0,
 LO
 B:0,IP:0,URL:25,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACT
 ION:release,TS:25
X-CID-META: VersionHash:2a19b09, CLOUDID:d2f0357a-5ef6-470b-96c9-bdb8ced32786,
 C
 OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:1,File:nil
 ,QS:0,BEC:nil
X-UUID: 101bf071e59d4f31afecaa4680317dff-20220522
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <chunfeng.yun@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1903260016; Sun, 22 May 2022 19:31:36 -0700
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sun, 22 May 2022 19:23:37 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 23 May 2022 10:23:36 +0800
Received: from mhfsdcap04 (10.17.3.154) by mtkmbs11n2.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.3 via Frontend
 Transport; Mon, 23 May 2022 10:23:32 +0800
Message-ID: <79706876349c3670f8831e75f70722f0bca200cb.camel@mediatek.com>
Subject: Re: [PATCH v9 1/2] dt-bindings: phy: mediatek: Add YAML schema for
 PCIe PHY
From: Chunfeng Yun <chunfeng.yun@mediatek.com>
To: Jianjun Wang <jianjun.wang@mediatek.com>, Kishon Vijay Abraham I
 <kishon@ti.com>, Vinod Koul <vkoul@kernel.org>, Rob Herring
 <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, "Chen-Yu
 Tsai" <wenst@chromium.org>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>, Krzysztof Kozlowski
 <krzk@kernel.org>
CC: Wei-Shun Chang <weishunc@google.com>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>, 
 <linux-phy@lists.infradead.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <rex-bc.chen@mediatek.com>,
 <randy.wu@mediatek.com>, <jieyy.yang@mediatek.com>,
 <chuanjia.liu@mediatek.com>, <qizhong.cheng@mediatek.com>,
 <jian.yang@mediatek.com>
Date: Mon, 23 May 2022 10:23:31 +0800
In-Reply-To: <20220520064920.27313-2-jianjun.wang@mediatek.com>
References: <20220520064920.27313-1-jianjun.wang@mediatek.com>
 <20220520064920.27313-2-jianjun.wang@mediatek.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220523_033209_582892_0364D4CB 
X-CRM114-Status: GOOD (  15.34  )
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

On Fri, 2022-05-20 at 14:49 +0800, Jianjun Wang wrote:
> Add YAML schema documentation for PCIe PHY on MediaTek chipsets.
> 
> Signed-off-by: Jianjun Wang <jianjun.wang@mediatek.com>
> Reviewed-by: Krzysztof Kozlowski <krzk@kernel.org>
> Reviewed-by: AngeloGioacchino Del Regno <
> angelogioacchino.delregno@collabora.com>
> ---
>  .../bindings/phy/mediatek,pcie-phy.yaml       | 75
> +++++++++++++++++++
>  1 file changed, 75 insertions(+)
>  create mode 100644
> Documentation/devicetree/bindings/phy/mediatek,pcie-phy.yaml
> 
> diff --git a/Documentation/devicetree/bindings/phy/mediatek,pcie-
> phy.yaml b/Documentation/devicetree/bindings/phy/mediatek,pcie-
> phy.yaml
> new file mode 100644
> index 000000000000..422750cc4121
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/phy/mediatek,pcie-phy.yaml
> @@ -0,0 +1,75 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/phy/mediatek,pcie-phy.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: MediaTek PCIe PHY
> +
> +maintainers:
> +  - Jianjun Wang <jianjun.wang@mediatek.com>
> +
> +description: |
> +  The PCIe PHY supports physical layer functionality for PCIe Gen3
> port.
> +
> +properties:
> +  compatible:
> +    const: mediatek,mt8195-pcie-phy
> +
> +  reg:
> +    maxItems: 1
> +
> +  reg-names:
> +    items:
> +      - const: sif
> +
> +  "#phy-cells":
> +    const: 0
> +
> +  nvmem-cells:
> +    maxItems: 7
Seems no need 'maxItems', we can get it from items of 'nvmem-cell-
names'

> +    description:
> +      Phandles to nvmem cell that contains the efuse data, if
> unspecified,
> +      default value is used.
> +
> +  nvmem-cell-names:
> +    items:
> +      - const: glb_intr
> +      - const: tx_ln0_pmos
> +      - const: tx_ln0_nmos
> +      - const: rx_ln0
> +      - const: tx_ln1_pmos
> +      - const: tx_ln1_nmos
> +      - const: rx_ln1
> +
> +  power-domains:
> +    maxItems: 1
> +
> +required:
> +  - compatible
> +  - reg
> +  - reg-names
> +  - "#phy-cells"
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    phy@11e80000 {
> +        compatible = "mediatek,mt8195-pcie-phy";
> +        #phy-cells = <0>;
> +        reg = <0x11e80000 0x10000>;
> +        reg-names = "sif";
> +        nvmem-cells = <&pciephy_glb_intr>,
> +                      <&pciephy_tx_ln0_pmos>,
> +                      <&pciephy_tx_ln0_nmos>,
> +                      <&pciephy_rx_ln0>,
> +                      <&pciephy_tx_ln1_pmos>,
> +                      <&pciephy_tx_ln1_nmos>,
> +                      <&pciephy_rx_ln1>;
> +        nvmem-cell-names = "glb_intr", "tx_ln0_pmos",
> +                           "tx_ln0_nmos", "rx_ln0",
> +                           "tx_ln1_pmos", "tx_ln1_nmos",
> +                           "rx_ln1";
> +        power-domains = <&spm 2>;
> +    };
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
