Return-Path: <SRS0=Kazo=DH=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 79BDDC4727C
	for <linux-mediatek@archiver.kernel.org>; Wed, 30 Sep 2020 03:02:53 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C769C2074B
	for <linux-mediatek@archiver.kernel.org>; Wed, 30 Sep 2020 03:02:52 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Qh6zZJ1z";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="Smuamo/e"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C769C2074B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=sXLyHzsj/VwECPL65vzeKkePvoRazCZMGDZecmgO6M0=; b=Qh6zZJ1zll/K2XLBy9B2s/rT+
	nLL6hirZHtj3TTBl/4NOsuLKEWgYDOayMyyAU5iwNI8SaoNo7dBd/NIqq7hGbAcu/Pvg7TSbTJxQh
	RG/dHgP4+gOsWMFCGtkGxswCX3FpLlco/L5zDyu6q3OJah89TVi5XW0aaXkVygjsuVwDMNrvnDorc
	lK7zX4AwuoY1HdYDRklz6ng+LYMiIPA1FLIGE8eBgR3X38Zp/2kakVOdx6rvt9qJylmGUTRnGr5xK
	QgmQkp1AprG8Boqr+mHZsM6Q7k6xdY7aVnJK8DenogIgW/ErDvzhIp24kYenNW2W4mjOqjLiVDAxO
	yfUtFZ7Fg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kNSOB-000350-JX; Wed, 30 Sep 2020 03:02:43 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kNSO6-00034C-L8; Wed, 30 Sep 2020 03:02:40 +0000
X-UUID: a0e8dbf482954674a33d9c976f634538-20200929
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=r6D23t2kKeZfahrk09DXea8q73XExsy/Y4j3R6PaCYg=; 
 b=Smuamo/e55iGy5soxvjgh/l5DKT3Ltb1Ub6334COCoPKZI94nTw9QT/WzUWRbaXEBjMLzsdHEaJilQ9vKHKrw8bRWbBGkwaPY2p9x8QfhoaM46ZN3WB7EzRNbolYV8awCfSSQtrPonKUw6G352D/5AMI+vMZV5ELcCm9ZVQkeLU=;
X-UUID: a0e8dbf482954674a33d9c976f634538-20200929
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <wenbin.mei@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 291597877; Tue, 29 Sep 2020 19:02:30 -0800
Received: from MTKMBS31N1.mediatek.inc (172.27.4.69) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 29 Sep 2020 19:55:04 -0700
Received: from MTKCAS36.mediatek.inc (172.27.4.186) by MTKMBS31N1.mediatek.inc
 (172.27.4.69) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Wed, 30 Sep 2020 10:55:01 +0800
Received: from [10.17.3.153] (10.17.3.153) by MTKCAS36.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 30 Sep 2020 10:55:00 +0800
Message-ID: <1601434501.3226.2.camel@mhfsdcap03>
Subject: Re: [PATCH v2 1/4] dt-bindings: mmc: Convert mtk-sd to json-schema
From: Wenbin Mei <wenbin.mei@mediatek.com>
To: Rob Herring <robh@kernel.org>
Date: Wed, 30 Sep 2020 10:55:01 +0800
In-Reply-To: <20200929200540.GA1051185@bogus>
References: <20200928130918.32326-1-wenbin.mei@mediatek.com>
 <20200928130918.32326-2-wenbin.mei@mediatek.com>
 <20200929200540.GA1051185@bogus>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: 778E435C9DC8413E23989109D0D2332ED0DAC1269C3F4610514279F083402CAC2000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200929_230239_207251_ADDEDCFB 
X-CRM114-Status: GOOD (  27.87  )
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
Cc: devicetree@vger.kernel.org, Ulf Hansson <ulf.hansson@linaro.org>,
 srv_heupstream@mediatek.com, linux-mmc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 Chaotian Jing <chaotian.jing@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Thanks for your reply!
I will change the following problems in the next version.

On Tue, 2020-09-29 at 15:05 -0500, Rob Herring wrote:
> On Mon, Sep 28, 2020 at 09:09:15PM +0800, Wenbin Mei wrote:
> > Convert the mtk-sd binding to DT schema format using json-schema.
> > 
> > Signed-off-by: Wenbin Mei <wenbin.mei@mediatek.com>
> > Reviewed-by: Ulf Hansson <ulf.hansson@linaro.org>
> > ---
> >  .../devicetree/bindings/mmc/mtk-sd.txt        |  75 --------
> >  .../devicetree/bindings/mmc/mtk-sd.yaml       | 165 ++++++++++++++++++
> >  2 files changed, 165 insertions(+), 75 deletions(-)
> >  delete mode 100644 Documentation/devicetree/bindings/mmc/mtk-sd.txt
> >  create mode 100644 Documentation/devicetree/bindings/mmc/mtk-sd.yaml
> 
> 
> > diff --git a/Documentation/devicetree/bindings/mmc/mtk-sd.yaml b/Documentation/devicetree/bindings/mmc/mtk-sd.yaml
> > new file mode 100644
> > index 000000000000..2d5ab1411cd5
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/mmc/mtk-sd.yaml
> > @@ -0,0 +1,165 @@
> > +# MTK-License-Identifier: GPL-2.0
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/mmc/mtk-sd.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: MTK MSDC Storage Host Controller Binding
> > +
> > +maintainers:
> > +  - Ulf Hansson <ulf.hansson@linaro.org>
> 
> Usually this is the h/w block owner, not a subsystem maintainer.
> 
> > +
> > +allOf:
> > +  - $ref: mmc-controller.yaml#
> > +
> > +properties:
> > +  compatible:
> > +    oneOf:
> > +      - const: mediatek,mt8135-mmc
> > +      - const: mediatek,mt8173-mmc
> > +      - const: mediatek,mt8183-mmc
> > +      - const: mediatek,mt8516-mmc
> > +      - const: mediatek,mt6779-mmc
> > +      - const: mediatek,mt2701-mmc
> > +      - const: mediatek,mt2712-mmc
> > +      - const: mediatek,mt7622-mmc
> 
> All these can be an enum. And sort please.
> 
> > +      - items:
> > +        - const: mediatek,mt7623-mmc
> > +        - const: mediatek,mt2701-mmc
> > +      - const: mediatek,mt7620-mmc
> > +
> > +  reg:
> > +    description:
> > +      physical base address of the controller and length.
> 
> Drop this.
> 
> > +    minItems: 1
> > +    maxItems: 2
> 
> If more than 1, need to say what each entry is:
> 
> items:
>   - description: ...
>   - description: ...
> 
> > +
> > +  interrupts:
> > +    description:
> > +      Should contain MSDC interrupt number.
> 
> Drop.
> 
> > +    maxItems: 1
> > +
> > +  clocks:
> > +    description:
> > +      Should contain phandle for the clock feeding the MMC controller.
> > +    minItems: 2
> > +    maxItems: 4
> > +    items:
> > +      - description: source clock (required).
> > +      - description: HCLK which used for host (required).
> > +      - description: independent source clock gate (required for MT2712).
> > +      - description: bus clock used for internal register access (required for MT2712 MSDC0/3).
> > +
> > +  clock-names:
> > +    minItems: 2
> > +    maxItems: 4
> > +    items:
> > +      - const: source
> > +      - const: hclk
> > +      - const: source_cg
> > +      - const: bus_clk
> > +
> > +  pinctrl-names:
> > +    items:
> > +      - const: default
> > +      - const: state_uhs
> > +
> > +  pinctrl-0:
> > +    description:
> > +      should contain default/high speed pin ctrl.
> > +    maxItems: 1
> > +
> > +  pinctrl-1:
> > +    description:
> > +      should contain uhs mode pin ctrl.
> > +    maxItems: 1
> > +
> > +  vmmc-supply:
> > +    description:
> > +      power to the Core.
> > +
> > +  vqmmc-supply:
> > +    description:
> > +      power to the IO.
> > +
> > +  assigned-clocks:
> > +    description:
> > +      PLL of the source clock.
> 
> How many (maxItems)?
> 
> > +
> > +  assigned-clock-parents:
> > +    description:
> > +      parent of source clock, used for HS400 mode to get 400Mhz source clock.
> > +
> > +  hs400-ds-delay:
> > +    $ref: /schemas/types.yaml#/definitions/uint32
> > +    description:
> > +      HS400 DS delay setting.
> > +
> > +  mediatek,hs200-cmd-int-delay:
> > +    $ref: /schemas/types.yaml#/definitions/uint32
> > +    description:
> > +      HS200 command internal delay setting.
> > +      This field has total 32 stages.
> > +      The value is an integer from 0 to 31.
> 
> minimum: 0
> maximum: 31
> 
> Add any constraints on other properties too.
> 
> > +
> > +  mediatek,hs400-cmd-int-delay:
> > +    $ref: /schemas/types.yaml#/definitions/uint32
> > +    description:
> > +      HS400 command internal delay setting.
> > +      This field has total 32 stages.
> > +      The value is an integer from 0 to 31.
> > +
> > +  mediatek,hs400-cmd-resp-sel-rising:
> > +    $ref: /schemas/types.yaml#/definitions/flag
> > +    description:
> > +      HS400 command response sample selection.
> > +      If present, HS400 command responses are sampled on rising edges.
> > +      If not present, HS400 command responses are sampled on falling edges.
> > +
> > +  mediatek,latch-ck:
> > +    $ref: /schemas/types.yaml#/definitions/uint32
> > +    description:
> > +      Some SoCs do not support enhance_rx, need set correct latch-ck to avoid
> > +      data crc error caused by stop clock(fifo full) Valid range = [0:0x7].
> > +      if not present, default value is 0.
> > +      applied to compatible "mediatek,mt2701-mmc".
> > +
> > +  resets:
> > +    maxItems: 1
> > +
> > +  reset-names:
> > +    const: hrst
> > +
> > +required:
> > +  - compatible
> > +  - reg
> > +  - interrupts
> > +  - clocks
> > +  - clock-names
> > +
> > +examples:
> > +  - |
> > +    #include <dt-bindings/interrupt-controller/irq.h>
> > +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> > +    #include <dt-bindings/clock/mt8173-clk.h>
> > +    mmc0: mmc@11230000 {
> > +        compatible = "mediatek,mt8173-mmc";
> > +        reg = <0x11230000 0x1000>;
> > +        interrupts = <GIC_SPI 39 IRQ_TYPE_LEVEL_LOW>;
> > +        vmmc-supply = <&mt6397_vemc_3v3_reg>;
> > +        vqmmc-supply = <&mt6397_vio18_reg>;
> > +        clocks = <&pericfg CLK_PERI_MSDC30_0>,
> > +                 <&topckgen CLK_TOP_MSDC50_0_H_SEL>;
> > +        clock-names = "source", "hclk";
> > +        pinctrl-names = "default", "state_uhs";
> > +        pinctrl-0 = <&mmc0_pins_default>;
> > +        pinctrl-1 = <&mmc0_pins_uhs>;
> > +        assigned-clocks = <&topckgen CLK_TOP_MSDC50_0_SEL>;
> > +        assigned-clock-parents = <&topckgen CLK_TOP_MSDCPLL_D2>;
> > +        hs400-ds-delay = <0x14015>;
> > +        mediatek,hs200-cmd-int-delay = <26>;
> > +        mediatek,hs400-cmd-int-delay = <14>;
> > +        mediatek,hs400-cmd-resp-sel-rising;
> > +    };
> > +
> > +...
> > -- 
> > 2.18.0

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
