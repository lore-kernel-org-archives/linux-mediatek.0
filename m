Return-Path: <SRS0=9UGu=ET=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9D62DC388F7
	for <linux-mediatek@archiver.kernel.org>; Fri, 13 Nov 2020 08:26:03 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2282020B80
	for <linux-mediatek@archiver.kernel.org>; Fri, 13 Nov 2020 08:26:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="x43YsXkU";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="eFqRPUkH"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2282020B80
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:Date:To:From:Subject:References:
	In-Reply-To:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=XO+2PfhTLIfDeUQDqOTl2mWXuTkm+3rl6tU7rhjBJJ0=; b=x43YsXkUS6ESg2W1ONs7LhAcn
	zOf9Yn1xxFauvU08LK8Q8o/vVhqNXhcXIXN9eE1bEhD1vvfCeeUdyMyUNmUInTBAqbI5dtTRPdz4Z
	z3kFE6bCwGgLKpoas4TvpNOSu4bOgLOx5c7B8NvQaOraW+vZHarOmeYWd0DCbPO4SbA4R4ovRAPM4
	Z20pm+vsTesZXhgsDrSvaTTAqtiQX9ZOV1O3G80G1eiyK8WON3nXIUmEyigfMQ5DpKNUgaYHBhpbq
	0JU3VD5ypcLHkw7i8sVPvL1Yz3Uzh1soqM3jIyw6nLdbC8NQWZ01xr9kb9xo/pHMI+DYcSpN5ktZZ
	MM2uo3iBw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kdUP5-0002Sj-Ay; Fri, 13 Nov 2020 08:25:55 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kdUP0-0002Rk-Df; Fri, 13 Nov 2020 08:25:51 +0000
Received: from kernel.org (unknown [104.132.1.79])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id EDD9120B80;
 Fri, 13 Nov 2020 08:25:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1605255949;
 bh=5Yk3gV0oJDAUAzplpg16TibsmWQlxH5hgiS1jHN+tSw=;
 h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
 b=eFqRPUkHpnmi0XrChjGgg/NKWF/0Y5xqD6Kfb19H/UCilMhwQf8Y6CwQY3vZC6w4E
 TOt3Ouvx6YRWHKocdHoVHaW++UDwK0i3PqGIkTpHl3b0NMgeq4GHgmDfuXRLONklJA
 FDnZzpAOR/lY96soNIXqxs7hyqijOaSM1KGLvsvk=
MIME-Version: 1.0
In-Reply-To: <1602766748-25490-2-git-send-email-hsin-hsiung.wang@mediatek.com>
References: <1602766748-25490-1-git-send-email-hsin-hsiung.wang@mediatek.com>
 <1602766748-25490-2-git-send-email-hsin-hsiung.wang@mediatek.com>
Subject: Re: [PATCH v3 1/2] dt-bindings: spmi: document binding for the
 Mediatek SPMI controller
From: Stephen Boyd <sboyd@kernel.org>
To: Hsin-Hsiung Wang <hsin-hsiung.wang@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>
Date: Fri, 13 Nov 2020 00:25:47 -0800
Message-ID: <160525594725.3428466.12052263156487418623@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201113_032550_741556_5D058679 
X-CRM114-Status: GOOD (  16.68  )
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
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org,
 Hsin-Hsiung Wang <hsin-hsiung.wang@mediatek.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Quoting Hsin-Hsiung Wang (2020-10-15 05:59:07)
> This adds documentation for the SPMI controller found on Mediatek SoCs.
> 
> Signed-off-by: Hsin-Hsiung Wang <hsin-hsiung.wang@mediatek.com>

I don't know what's going on but my MUA sees a bunch of CRLF line
endings in these patches.

> diff --git a/Documentation/devicetree/bindings/spmi/spmi-mtk-pmif.yaml b/Documentation/devicetree/bindings/spmi/spmi-mtk-pmif.yaml
> new file mode 100644
> index 000000000000..39459ca2e0da
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/spmi/spmi-mtk-pmif.yaml
> @@ -0,0 +1,71 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/spmi/spmi-mtk-pmif.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Mediatek SPMI Controller Device Tree Bindings
> +
> +maintainers:
> +  - Stephen Boyd <sboyd@kernel.org>
> +  - Matthias Brugger <matthias.bgg@gmail.com>

Is there someone at mediatek who can be the maintainer of this binding?

> +
> +description: |+

What's up with the plus?

> +  On MediaTek SoCs the PMIC is connected via SPMI and the controller allows
> +  for multiple SoCs to control a single SPMI master.
> +
> +properties:
> +  compatible:
> +    const: mediatek,mt6873-spmi
> +
> +  reg:
> +    minItems: 2
> +    maxItems: 2
> +
> +  reg-names:
> +    items:
> +      - const: "pmif"
> +      - const: "spmimst"
> +
> +  clocks:
> +    minItems: 3
> +    maxItems: 3
> +
> +  clock-names:
> +    items:
> +      - const: "pmif_sys_ck"
> +      - const: "pmif_tmr_ck"
> +      - const: "spmimst_clk_mux"
> +
> +  assigned-clocks:
> +    maxItems: 1
> +
> +  assigned-clock-parents:
> +    maxItems: 1
> +
> +required:
> +  - compatible
> +  - reg
> +  - reg-names

Is reg-names really required?

> +  - clocks
> +  - clock-names

I think we need additionalProperties: False here

> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/mt8192-clk.h>
> +
> +    spmi: spmi@10027000 {
> +        compatible = "mediatek,mt6873-spmi";
> +        reg = <0 0x10027000 0 0x000e00>,
> +              <0 0x10029000 0 0x000100>;

I think we can drop the two cells and just have one cell binding here?

> +        reg-names = "pmif", "spmimst";
> +        clocks = <&infracfg CLK_INFRA_PMIC_AP>,
> +                 <&infracfg CLK_INFRA_PMIC_TMR>,
> +                 <&topckgen CLK_TOP_SPMI_MST_SEL>;
> +        clock-names = "pmif_sys_ck",
> +                      "pmif_tmr_ck",
> +                      "spmimst_clk_mux";
> +        assigned-clocks = <&topckgen CLK_TOP_PWRAP_ULPOSC_SEL>;
> +        assigned-clock-parents = <&topckgen CLK_TOP_OSC_D10>;
> +    };
> +...

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
