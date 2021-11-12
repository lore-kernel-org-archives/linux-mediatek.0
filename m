Return-Path: <SRS0=l5E7=P7=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C6C78C433EF
	for <linux-mediatek@archiver.kernel.org>; Fri, 12 Nov 2021 15:21:45 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7F40061039
	for <linux-mediatek@archiver.kernel.org>; Fri, 12 Nov 2021 15:21:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 7F40061039
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iBKeuXF0yI7x3FtwYEJspSonqP8ucjYNwSZtVBWxamI=; b=OgsDbHaFwjSTbQ
	+WLtA3NYpCRu5Wm3a/6iAKD/OV4IeSl/ub+znN1ghSL9I6LQFHUAmppemE/S7SwCgazKPQsjQJ8jP
	rzuY04d0CAc0YDbFUjcDFhlbKiu2RG3rHDC92ox9ha7CFLuF6KbKN7TlQjjUK4MX5zIKg2io/Sbjh
	Cls3tl9CbURnlZhGlII4ItUq3/kJHgoYr7f1/IIDxI+60ol9CUOM+T0x01KPujAp39+M5qzVk5YSA
	KjlmDxjaz4vyJEMzN+4GWgxWNID8ABhnyBIX0BBNNh0GwBJAgpmMlZrOjKOBB9fJ41Ktj+bLOwq16
	76LIVXvj/Av1lH5sO8Ng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mlYMv-00B3DY-Jt; Fri, 12 Nov 2021 15:21:33 +0000
Received: from mail-oi1-f170.google.com ([209.85.167.170])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mlYL5-00B2jh-FI; Fri, 12 Nov 2021 15:19:42 +0000
Received: by mail-oi1-f170.google.com with SMTP id m6so18512321oim.2;
 Fri, 12 Nov 2021 07:19:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=4yel1hd+kqu0GBbGBGX3XHvXpWBPzRQA3xBOJv/VtNs=;
 b=GnJmyWlSV/UzeATiftpledQqq3UUmFLA1D5DrWfaM//sFFlP9arE3Grn1xVbuhL6wL
 7morQsA11E5iF+AOzUUfL+ZP+bGSid2JSY+/urEy0L+OCii2XTMShvRx4SUKsckkOCPa
 yU9i/FigioMxi547lXDPPhckooq+bIGDGYgIBMCnaaJq4BAjKcOj2s/624dMz0MOdutV
 lHPYRrT7UCICcyGiXuwPueesCuTLkPInARwnfm9sjzi1CU9kApwfMZ8BglqijSRszrOX
 E5adS+/zCy5MncTPssMVfelFb1HtoUmOkOrsYKrI5uAX67KAPfifMn3urit1uB3ofCk9
 FdnA==
X-Gm-Message-State: AOAM533Y0fZSbzrg+vakOe2JOU/84IGyyvyNDcBEQTJxVGRZy7vhojIJ
 0arUtwnJAk9OwrDY/wjU9g==
X-Google-Smtp-Source: ABdhPJxQ+VudnSViJNi+5YOF/wy3/DfPOdoi5jO3AL2BMG9xkI0fZG9NZYIjiv6etRC7ulNfdpKqsg==
X-Received: by 2002:a05:6808:180c:: with SMTP id
 bh12mr14006813oib.152.1636730378271; 
 Fri, 12 Nov 2021 07:19:38 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.gmail.com with ESMTPSA id g1sm1150075ooq.2.2021.11.12.07.19.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Nov 2021 07:19:37 -0800 (PST)
Received: (nullmailer pid 2870844 invoked by uid 1000);
 Fri, 12 Nov 2021 15:19:36 -0000
Date: Fri, 12 Nov 2021 09:19:36 -0600
From: Rob Herring <robh@kernel.org>
To: James Lo <james.lo@mediatek.com>
Cc: Stephen Boyd <sboyd@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Hsin-Hsiung Wang <hsin-hsiung.wang@mediatek.com>, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, srv_heupstream@mediatek.com,
 Project_Global_Chrome_Upstream_Group@mediatek.com
Subject: Re: [RESEND, v14 1/3] dt-bindings: spmi: modify the constraint of
 reg property
Message-ID: <YY6GCA9pu3p0p3fy@robh.at.kernel.org>
References: <20211112055410.21418-1-james.lo@mediatek.com>
 <20211112055410.21418-2-james.lo@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211112055410.21418-2-james.lo@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211112_071939_571262_3A8A1C91 
X-CRM114-Status: GOOD (  22.60  )
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

On Fri, Nov 12, 2021 at 01:54:08PM +0800, James Lo wrote:
> The constraint of reg may larger than 1, so we modify to
> 'minItem: 1' and 'maxItem: 2'.
> And adds documentation for the SPMI controller found on
> Mediatek SoCs.
> 
> Merge [RESEND,v13,2/4] into [RESEND,v13,1/4] for fix yaml
> error.
> [RESEND,v13,1/4] :
> dt-bindings: spmi: modify the constraint of reg property
> [RESEND,v13,2/4] :
> dt-bindings: spmi: document binding for the Mediatek SPMI
> controller

Combining is not the right thing to do.

> 
> Signed-off-by: James Lo <james.lo@mediatek.com>
> Signed-off-by: Hsin-Hsiung Wang <hsin-hsiung.wang@mediatek.com>
> ---
>  .../bindings/spmi/mtk,spmi-mtk-pmif.yaml      | 76 +++++++++++++++++++
>  .../devicetree/bindings/spmi/spmi.yaml        |  3 +-
>  2 files changed, 78 insertions(+), 1 deletion(-)
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
> diff --git a/Documentation/devicetree/bindings/spmi/spmi.yaml b/Documentation/devicetree/bindings/spmi/spmi.yaml
> index 1d243faef2f8..f29183a45adc 100644
> --- a/Documentation/devicetree/bindings/spmi/spmi.yaml
> +++ b/Documentation/devicetree/bindings/spmi/spmi.yaml
> @@ -25,7 +25,8 @@ properties:
>      pattern: "^spmi@.*"
>  
>    reg:
> -    maxItems: 1
> +    maxItems: 2
> +    minItems: 1

'reg' is controller specific so we shouldn't even be specifying it here. 
Just remove it.

>  
>    "#address-cells":
>      const: 2
> -- 
> 2.18.0
> 
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
