Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EEFA0C433F5
	for <linux-mediatek@archiver.kernel.org>; Fri, 22 Apr 2022 08:03:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ALpjBJvRvI8e2Ij/galX1IG0j7Rc0oXRiolOMh2IHC0=; b=PVuzZ2s8esp/ch
	+LHh1s6qZdfFmMJPGsQi5tN1sC3weG5PrS6nayWLkPgTawfGlbNp8h6MsCvxYFA9iP5pNqesxxKKM
	dZ/1xpyBNkNzTzckFp6k0c4jQrfK7XVHPTF0lzyh+D0R2EPJCFBAeufBwNa2bWsGrqFr0ha7BqleL
	cPMOfaq+BmlewewqVhtQAHDCFohO04tFuaWONAEhK8RNipcKcrPrgxea72IVvGyu26nPicDzdA9jj
	lextTLQQoNZK9Z2Yjdn+99oSnkM1sKMwcinQ9WTurPrXQdg+lHpZYfqkC422Pn1VwgLUrmwsK+yac
	uGG5wK9q4UeoFpSelqXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nhoG7-00H5SZ-08; Fri, 22 Apr 2022 08:03:19 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nhoCP-00H3Vk-FW; Fri, 22 Apr 2022 07:59:31 +0000
X-UUID: c899cbe4d6ca471d9fe63cefa1455ba2-20220422
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.4, REQID:21066ad7-cb6e-4334-b227-69ba9b68a99f, OB:0,
 LO
 B:0,IP:0,URL:25,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACT
 ION:release,TS:25
X-CID-META: VersionHash:faefae9, CLOUDID:7e91c1ef-06b0-4305-bfbf-554bfc9d151a,
 C
 OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,File:nil,QS:0,BEC:nil
X-UUID: c899cbe4d6ca471d9fe63cefa1455ba2-20220422
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <rex-bc.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 864823792; Fri, 22 Apr 2022 00:59:25 -0700
Received: from mtkexhb02.mediatek.inc (172.21.101.103) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 22 Apr 2022 00:59:24 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by mtkexhb02.mediatek.inc
 (172.21.101.103) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Fri, 22 Apr 2022 15:59:16 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 22 Apr 2022 15:59:16 +0800
Message-ID: <177a0be5289045602fdbde295b1bd076bee9e854.camel@mediatek.com>
Subject: Re: [PATCH v1] dt-bindings: dsp: mediatek: add mt8186 dsp document
From: Rex-BC Chen <rex-bc.chen@mediatek.com>
To: Tinghan Shen <tinghan.shen@mediatek.com>, Rob Herring
 <robh+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, "Matthias
 Brugger" <matthias.bgg@gmail.com>
CC: <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>
Date: Fri, 22 Apr 2022 15:59:15 +0800
In-Reply-To: <20220422071534.15653-1-tinghan.shen@mediatek.com>
References: <20220422071534.15653-1-tinghan.shen@mediatek.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220422_005929_563211_4EAEA555 
X-CRM114-Status: GOOD (  18.89  )
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

On Fri, 2022-04-22 at 15:15 +0800, Tinghan Shen wrote:
> This patch adds mt8186 dsp document. The dsp is used for Sound Open
> Firmware driver node. It includes registers, clocks, memory regions,
> and mailbox for dsp.
> 
> Signed-off-by: Tinghan Shen <tinghan.shen@mediatek.com>
> ---
> 
> This patch depends on MT8186 clock bindings.
> 
https://lore.kernel.org/all/20220409132251.31725-2-chun-jie.chen@mediatek.com/
> 
> ---
>  .../bindings/dsp/mediatek,mt8186-dsp.yaml     | 93
> +++++++++++++++++++
>  1 file changed, 93 insertions(+)
>  create mode 100644
> Documentation/devicetree/bindings/dsp/mediatek,mt8186-dsp.yaml
> 
> diff --git a/Documentation/devicetree/bindings/dsp/mediatek,mt8186-
> dsp.yaml b/Documentation/devicetree/bindings/dsp/mediatek,mt8186-
> dsp.yaml
> new file mode 100644
> index 000000000000..00a79e880895
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/dsp/mediatek,mt8186-dsp.yaml
> @@ -0,0 +1,93 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/dsp/mediatek,mt8186-dsp.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Mediatek mt8186 DSP core

Hello Tinghan,

Please use MediaTek.
Thanks.

BRs,
Rex

> +
> +maintainers:
> +  - Tinghan Shen <tinghan.shen@mediatek.com>
> +
> +description: |
> +  MediaTek mt8186 SoC contains a DSP core used for
> +  advanced pre- and post- audio processing.
> +
> +properties:
> +  compatible:
> +    const: mediatek,mt8186-dsp
> +
> +  reg:
> +    items:
> +      - description: Address and size of the DSP config registers
> +      - description: Address and size of the DSP SRAM
> +      - description: Address and size of the DSP secure registers
> +      - description: Address and size of the DSP bus registers
> +
> +  reg-names:
> +    items:
> +      - const: cfg
> +      - const: sram
> +      - const: sec
> +      - const: bus
> +
> +  clocks:
> +    items:
> +      - description: mux for audio dsp clock
> +      - description: mux for audio dsp local bus
> +
> +  clock-names:
> +    items:
> +      - const: audiodsp_sel
> +      - const: adsp_bus_sel
> +
> +  power-domains:
> +    maxItems: 1
> +
> +  mboxes:
> +    items:
> +      - description: ipc reply between host and audio DSP.
> +      - description: ipc request between host and audio DSP.
> +
> +  mbox-names:
> +    items:
> +      - const: mbox0
> +      - const: mbox1
> +
> +  memory-region:
> +    items:
> +      - description: dma buffer between host and DSP.
> +      - description: DSP system memory.
> +
> +required:
> +  - compatible
> +  - reg
> +  - reg-names
> +  - clocks
> +  - clock-names
> +  - power-domains
> +  - mbox-names
> +  - mboxes
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    #include <dt-bindings/interrupt-controller/irq.h>
> +    #include <dt-bindings/clock/mt8186-clk.h>
> +    dsp@10680000 {
> +        compatible = "mediatek,mt8186-dsp";
> +        reg = <0x10680000 0x2000>,
> +              <0x10800000 0x100000>,
> +              <0x1068b000 0x100>,
> +              <0x1068f000 0x1000>;
> +        reg-names = "cfg", "sram", "sec", "bus";
> +        clocks = <&topckgen CLK_TOP_AUDIODSP>,
> +                 <&topckgen CLK_TOP_ADSP_BUS>;
> +        clock-names = "audiodsp_sel",
> +                      "adsp_bus_sel";
> +        power-domains = <&spm 6>;
> +        mbox-names = "mbox0", "mbox1";
> +        mboxes = <&adsp_mailbox0>, <&adsp_mailbox1>;
> +    };


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
