Return-Path: <SRS0=YCpt=D3=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 49C61C433E7
	for <linux-mediatek@archiver.kernel.org>; Tue, 20 Oct 2020 04:07:06 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9863E222C8
	for <linux-mediatek@archiver.kernel.org>; Tue, 20 Oct 2020 04:07:05 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="zw3Qmmny";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="M9/QArr/"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9863E222C8
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=RBqNKZ46Qj9oB523b0DIGQUukoZ8l3tYVpiSOtfi8FE=; b=zw3QmmnyhfR3MjcUSC3HGybR3
	+av/0jqZnQKf0InJ+pBlcAJLxM/rIj8HJjkoisaOGrcM/+Ks7ka1vQsZL7RXZKoCpIYcyTVfgT5Yv
	AKHTqedZcUwORLGkwun8LU+z+ruUr4/rtYNgQVyq6HmBXsVCq9j/2yzHUYkS24ulPaW4OH74tWaNo
	JTOpFSDjKJnRfuXqr9X7p/BSQRdzEpUoqx2jvd08UW1qO8d/Wjs57BNLzTKIywYrJnG6z5uDJRHRc
	I+uRhl0tQSHPIIQqMPzBJhmjn7PoaNT8fkiSmJ6KMqLDM4NjE7+egMO+tEXZIs8eN/Z0YnsKJv8Dg
	RuwMkyGlA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kUivH-0003in-8J; Tue, 20 Oct 2020 04:06:55 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kUivA-0003hP-SC; Tue, 20 Oct 2020 04:06:51 +0000
X-UUID: 5bb0370e4aad46ff81674d1ee6ee9a30-20201019
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=xdhsTKWvOT25dyntXEsCjiRj2p554GKQn1cVdp+H27Y=; 
 b=M9/QArr/Qy4voORa+X5T2jcMczENP1nHNVcuqRkfPQ06BzNvRnCSDesjnGFNVqUYeL0At9+SAba58B5cF1NDJ2C90xUGMISUGiComMZjQJVjtDN4DyHQDCuuDYb8T92mzOC9yA+4rfZEnr3Ytz8Dq19N0S1XNidVvXw5G1BTK0o=;
X-UUID: 5bb0370e4aad46ff81674d1ee6ee9a30-20201019
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <hsin-hsiung.wang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 857240052; Mon, 19 Oct 2020 20:06:44 -0800
Received: from MTKMBS07N2.mediatek.inc (172.21.101.141) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 19 Oct 2020 21:04:33 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 20 Oct 2020 12:04:26 +0800
Received: from [172.21.77.4] (172.21.77.4) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 20 Oct 2020 12:04:26 +0800
Message-ID: <1603166666.31677.1.camel@mtksdaap41>
Subject: Re: [PATCH v4 1/2] dt-bindings: spmi: document binding for the
 Mediatek SPMI controller
From: Hsin-Hsiung Wang <hsin-hsiung.wang@mediatek.com>
To: Rob Herring <robh@kernel.org>
Date: Tue, 20 Oct 2020 12:04:26 +0800
In-Reply-To: <20201019195454.GB3499610@bogus>
References: <1602864634-23489-1-git-send-email-hsin-hsiung.wang@mediatek.com>
 <1602864634-23489-2-git-send-email-hsin-hsiung.wang@mediatek.com>
 <20201019195454.GB3499610@bogus>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201020_000649_107053_9C2DC046 
X-CRM114-Status: GOOD (  22.89  )
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
Cc: devicetree@vger.kernel.org, srv_heupstream@mediatek.com,
 Stephen Boyd <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi,

On Mon, 2020-10-19 at 14:54 -0500, Rob Herring wrote:
> On Sat, Oct 17, 2020 at 12:10:33AM +0800, Hsin-Hsiung Wang wrote:
> > This adds documentation for the SPMI controller found on Mediatek SoCs.
> > 
> > Signed-off-by: Hsin-Hsiung Wang <hsin-hsiung.wang@mediatek.com>
> > ---
> 
> If you have a dependency such as the include, please note it here.
> 
Sorry, I don't add the necessary patchset[1] into the commit message.
I will update it in the next patch.

[1]
https://patchwork.kernel.org/project/linux-mediatek/list/?series=342593

> >  .../bindings/spmi/mtk,spmi-mtk-pmif.yaml      | 70 +++++++++++++++++++
> >  1 file changed, 70 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/spmi/mtk,spmi-mtk-pmif.yaml
> > 
> > diff --git a/Documentation/devicetree/bindings/spmi/mtk,spmi-mtk-pmif.yaml b/Documentation/devicetree/bindings/spmi/mtk,spmi-mtk-pmif.yaml
> > new file mode 100644
> > index 000000000000..9945200a35b3
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/spmi/mtk,spmi-mtk-pmif.yaml
> > @@ -0,0 +1,70 @@
> > +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/spmi/mtk,spmi-mtk-pmif.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Mediatek SPMI Controller Device Tree Bindings
> > +
> > +maintainers:
> > +  - Hsin-Hsiung Wang <hsin-hsiung.wang@mediatek.com>
> > +
> > +description: |+
> > +  On MediaTek SoCs the PMIC is connected via SPMI and the controller allows
> > +  for multiple SoCs to control a single SPMI master.
> 
> Need a $ref to spmi.yaml.
> 
Thanks, I will update it in the next patch.
> > +
> > +properties:
> > +  compatible:
> > +    const: mediatek,mt6873-spmi
> > +
> > +  reg:
> > +    minItems: 2
> > +    maxItems: 2
> > +
> > +  reg-names:
> > +    items:
> > +      - const: "pmif"
> > +      - const: "spmimst"
> 
> Don't need quotes
> 
Thanks, I will update it in the next patch.
> > +
> > +  clocks:
> > +    minItems: 3
> > +    maxItems: 3
> > +
> > +  clock-names:
> > +    items:
> > +      - const: "pmif_sys_ck"
> > +      - const: "pmif_tmr_ck"
> > +      - const: "spmimst_clk_mux"
> > +
> > +  assigned-clocks:
> > +    maxItems: 1
> > +
> > +  assigned-clock-parents:
> > +    maxItems: 1
> > +
> > +required:
> > +  - compatible
> > +  - reg
> > +  - reg-names
> > +  - clocks
> > +  - clock-names
> 
> unevaluatedProperties: false
> 
Thanks, I will update it in the next patch.
> > +
> > +examples:
> > +  - |
> > +    #include <dt-bindings/clock/mt8192-clk.h>
> > +
> > +    spmi: spmi@10027000 {
> > +        compatible = "mediatek,mt6873-spmi";
> > +        reg = <0 0x10027000 0 0x000e00>,
> > +              <0 0x10029000 0 0x000100>;
> > +        reg-names = "pmif", "spmimst";
> > +        clocks = <&infracfg CLK_INFRA_PMIC_AP>,
> > +                 <&infracfg CLK_INFRA_PMIC_TMR>,
> > +                 <&topckgen CLK_TOP_SPMI_MST_SEL>;
> > +        clock-names = "pmif_sys_ck",
> > +                      "pmif_tmr_ck",
> > +                      "spmimst_clk_mux";
> > +        assigned-clocks = <&topckgen CLK_TOP_PWRAP_ULPOSC_SEL>;
> > +        assigned-clock-parents = <&topckgen CLK_TOP_OSC_D10>;
> > +    };
> > +...
> > -- 
> > 2.18.0

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
