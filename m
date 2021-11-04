Return-Path: <SRS0=FoZt=PX=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 759AAC433F5
	for <linux-mediatek@archiver.kernel.org>; Thu,  4 Nov 2021 01:07:09 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 303966113B
	for <linux-mediatek@archiver.kernel.org>; Thu,  4 Nov 2021 01:07:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 303966113B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WH47mJba6sqW+fJWudTPN8/XbdjseblazInONiZsLlk=; b=SoqCk1FrCEYNS5
	njBZIA9PyiwKpji1GG1tskwRivhFXSIc1tF9a0MPcaG4hMCZX1RHrHycUiCWnz/Yo8HahOvvZiGAB
	wX7/yceJ/Q4skpAGte2Ird1cTnjU7cR34JubY9WTcAJGwT2DHCl+LKFwESyew8nG7yYktrTuYEggN
	6aok7q7KPj9vUVGQJJ6oa++GIiS6L3vSmOxTBCy9D8h40nu52jhaliOKGVNkJAEFXnZNaLlYM7WsZ
	IlX4aIyeq/WsEVYxwFT+eQcI6tM1OxDPYqWB6LsACOn+ZebfrTk4rseqahYJovd8cHQLh5HR9FkqK
	pfhOkgxMIVL/I3ujtiwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1miRDV-007SuW-QW; Thu, 04 Nov 2021 01:06:57 +0000
Received: from mail-oi1-f170.google.com ([209.85.167.170])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1miRD6-007Sly-6V; Thu, 04 Nov 2021 01:06:33 +0000
Received: by mail-oi1-f170.google.com with SMTP id bn12so6591659oib.2;
 Wed, 03 Nov 2021 18:06:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=YocbHtB0WKCVpaPIwIN4Bz/405kKtFB5GzeTgkMKUbU=;
 b=a2d55S4rslmGqgWGUSlSmRCuH6UhdSGHELqSwhmgY+NHf43DDyJe+WKlO4O0Ue4Ldd
 sPQVl4zRjO50S8nRIkV5cW1VNXAafG+Ms3sexD2+t2GSyakeZ+JzCW4bvTVu4fh3zDyM
 6/1JhBDJIhOVIJGQKCtWSoKI1C9c17yLUOjn5azrI/+5GsmGXbix6+QrgMxZClbdnKKa
 ClQgjpRI7/Tv5LO40n23bP6y/wgDiYXwFGj+V/KaO/nfujUrNopy4uYDzb6Y+8AmsBn9
 T0DJVO9iJc1Cnc9ZmzUVB/N3O7+VKqox4jbhXz3yE8n9yc1ihk3v6857SEzt8i3MVeQU
 uYPg==
X-Gm-Message-State: AOAM531P0Q9aX5GngeLjihomQNIm1yIve9ov46Cz+AtPisPz6bfoxX20
 gB+JO08u4QBzj0Iq2DaqOA==
X-Google-Smtp-Source: ABdhPJxGo+5iN/O5yvgisGFrxVAxyW+CSOOK9/Uinje5TIMZuC9rnFykfXySd0UhCxBTW5qolr+fcQ==
X-Received: by 2002:aca:280d:: with SMTP id 13mr11393821oix.116.1635987991262; 
 Wed, 03 Nov 2021 18:06:31 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.gmail.com with ESMTPSA id r24sm524554otc.12.2021.11.03.18.06.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Nov 2021 18:06:30 -0700 (PDT)
Received: (nullmailer pid 2116973 invoked by uid 1000);
 Thu, 04 Nov 2021 01:06:29 -0000
Date: Wed, 3 Nov 2021 20:06:29 -0500
From: Rob Herring <robh@kernel.org>
To: James Lo <james.lo@mediatek.com>
Cc: Stephen Boyd <sboyd@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Hsin-Hsiung Wang <hsin-hsiung.wang@mediatek.com>, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, srv_heupstream@mediatek.com,
 Project_Global_Chrome_Upstream_Group@mediatek.com
Subject: Re: [RESEND, v13 2/4] dt-bindings: spmi: document binding for the
 Mediatek SPMI controller
Message-ID: <YYMyFT94l56iuEbo@robh.at.kernel.org>
References: <20211103081021.9917-1-james.lo@mediatek.com>
 <20211103081021.9917-3-james.lo@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211103081021.9917-3-james.lo@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211103_180632_273613_33A1EB9B 
X-CRM114-Status: GOOD (  17.32  )
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

On Wed, Nov 03, 2021 at 04:10:19PM +0800, James Lo wrote:
> This adds documentation for the SPMI controller found on Mediatek SoCs.
> 
> Signed-off-by: Hsin-Hsiung Wang <hsin-hsiung.wang@mediatek.com>

Missing author S-o-b. checkpatch.pl will tell you this.

> ---
>  .../bindings/spmi/mtk,spmi-mtk-pmif.yaml      | 76 +++++++++++++++++++
>  1 file changed, 76 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/spmi/mtk,spmi-mtk-pmif.yaml
> 
> diff --git a/Documentation/devicetree/bindings/spmi/mtk,spmi-mtk-pmif.yaml b/Documentation/devicetree/bindings/spmi/mtk,spmi-mtk-pmif.yaml
> new file mode 100644
> index 000000000000..2445c5e0b0ef
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/spmi/mtk,spmi-mtk-pmif.yaml
> @@ -0,0 +1,76 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/spmi/mtk,spmi-mtk-pmif.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Mediatek SPMI Controller Device Tree Bindings
> +
> +maintainers:
> +  - Hsin-Hsiung Wang <hsin-hsiung.wang@mediatek.com>
> +
> +description: |+
> +  On MediaTek SoCs the PMIC is connected via SPMI and the controller allows
> +  for multiple SoCs to control a single SPMI master.
> +
> +allOf:
> +  - $ref: "spmi.yaml"
> +
> +properties:
> +  compatible:
> +    enum:
> +      - mediatek,mt6873-spmi
> +      - mediatek,mt8195-spmi
> +
> +  reg:
> +    maxItems: 2
> +
> +  reg-names:
> +    items:
> +      - const: pmif
> +      - const: spmimst
> +
> +  clocks:
> +    minItems: 3
> +    maxItems: 3
> +
> +  clock-names:
> +    items:
> +      - const: pmif_sys_ck
> +      - const: pmif_tmr_ck
> +      - const: spmimst_clk_mux
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
> +  - clocks
> +  - clock-names
> +
> +unevaluatedProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/mt8192-clk.h>
> +
> +    spmi: spmi@10027000 {
> +        compatible = "mediatek,mt6873-spmi";
> +        reg = <0x10027000 0xe00>,
> +              <0x10029000 0x100>;
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
> -- 
> 2.18.0
> 
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
