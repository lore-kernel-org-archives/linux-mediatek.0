Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A8B5C433EF
	for <linux-mediatek@archiver.kernel.org>; Tue, 26 Apr 2022 03:18:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HBIh5af9J3D+wc7kTVqNTxSkuFM6BjZmjoKmDKwhyC8=; b=TfGGnN/jcVD7x/
	oAW5V4DE17MNrnJCu/WeS2qprV3GNKRCNDWxPxCRQgtObqSONYvv0IGxCfZ3z/G+NuaTzLsPfGFWC
	7sk0q7ywr//tnffc7PAJZjnR33Un2JZDfogL747kv/4YGzyXkcplJenu4yRj+95/5WLqXwc0mjJ3n
	jveopYGvgpE4R9ZaELKt9mGJVsv/uapZQsyc4HqZCk1MHyEdnzpHASxENS6WKgP+fCc58aU8cMFgC
	nKQ1lLzz6JvlZNtdSuWPBeswZ5ogdsmif1FVTgCPpaJ6SUJy9NcZYvBeIera0EUqPr6q9Q5md04iI
	GMLtR8ojkZM3zSYR5W9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1njBik-00CHqI-5H; Tue, 26 Apr 2022 03:18:34 +0000
Received: from mail-yb1-xb2d.google.com ([2607:f8b0:4864:20::b2d])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1njBiX-00CHmd-Or
 for linux-mediatek@lists.infradead.org; Tue, 26 Apr 2022 03:18:23 +0000
Received: by mail-yb1-xb2d.google.com with SMTP id w187so21203822ybe.2
 for <linux-mediatek@lists.infradead.org>; Mon, 25 Apr 2022 20:18:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ymvQGhwLD6LrQR70e/w6ZPsiExN1hAhcmAPj4jy8dAs=;
 b=hl9cabfzvJuk6NdpihUW2V6JgM6pg6VorWRkIKdEdXpq9fhgiWK1MzSd5HZrlZyDu5
 y9jb2HFJ4/ItQpenFhNgKyZCt9bfvcDzFEb6/J/2Mhi6v4gBi67b/bpNwZpHbDJcmNjE
 yxZ8PbmBCRO+dNafHrM8EWAipoRe7jmCdoCeg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ymvQGhwLD6LrQR70e/w6ZPsiExN1hAhcmAPj4jy8dAs=;
 b=RWPTC6cWvPgnI0Gpee/4oSa+wqk4hHpFFG4D/qcJQEo3pBseMoZi67nMdq3PVIzTyg
 7nZ58ebnG1rWgSHiXzloud6sozQp92721gG94jv8ZO90cTfdaJLgNoQtBK4BCN6OnJTa
 O/iYT8FzNXJ8s8tyznxtZCVFJ7coOIA+miLUtrguxqt6STqFpm3ZVMUB5vN7Gj8Gukrm
 zgiQEyT3HXod8ejJbeYcbfY+ZRvxstCL+7G2xrtPafhmgUrDD4oUIZP9W9MNb5gIcVjB
 +JQBgsNboi7+aFzvx28VrL1z6KhLAESfgt+PlrKsAeMl88httTz6w5ghCnFCzkUYNJt0
 5eIw==
X-Gm-Message-State: AOAM532Hkbliajg1+lwbjBMMkvKW1oSb8CLkbHFbZ9R4tMss/sM52LF/
 xnkr51d8oWcMOrSygN6WzqlvbIpKZc1Lgs4lsnPj2w==
X-Google-Smtp-Source: ABdhPJyhHmusCSOHXNUImfAEEzGb8B8HQK3f3IeirnXiVrdZPW5jq5AEGz0c4s9rGNFdKqdnfg94FcKxSxPYMEgzAMs=
X-Received: by 2002:a5b:34a:0:b0:645:4966:b5d3 with SMTP id
 q10-20020a5b034a000000b006454966b5d3mr18130893ybp.461.1650943097894; Mon, 25
 Apr 2022 20:18:17 -0700 (PDT)
MIME-Version: 1.0
References: <20220425125546.4129-1-johnson.wang@mediatek.com>
 <20220425125546.4129-2-johnson.wang@mediatek.com>
In-Reply-To: <20220425125546.4129-2-johnson.wang@mediatek.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Tue, 26 Apr 2022 11:18:06 +0800
Message-ID: <CAGXv+5HgyN+kp86M2GgFtbruXSAMSLxsh9vf8zVE5TxRMyTyaA@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] dt-bindings: interconnect: Add MediaTek CCI
 dt-bindings
To: Johnson Wang <johnson.wang@mediatek.com>, krzk+dt@kernel.org
Cc: cw00.choi@samsung.com, robh+dt@kernel.org, kyungmin.park@samsung.com, 
 khilman@kernel.org, linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, jia-wei.chang@mediatek.com, 
 Project_Global_Chrome_Upstream_Group@mediatek.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220425_201821_873767_845AD3B3 
X-CRM114-Status: GOOD (  23.52  )
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

On Mon, Apr 25, 2022 at 8:56 PM Johnson Wang <johnson.wang@mediatek.com> wrote:
>
> Add devicetree binding of MediaTek CCI on MT8183 and MT8186.
>
> Signed-off-by: Johnson Wang <johnson.wang@mediatek.com>
> Signed-off-by: Jia-Wei Chang <jia-wei.chang@mediatek.com>
> ---
>  .../bindings/interconnect/mediatek,cci.yaml   | 139 ++++++++++++++++++
>  1 file changed, 139 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/interconnect/mediatek,cci.yaml
>
> diff --git a/Documentation/devicetree/bindings/interconnect/mediatek,cci.yaml b/Documentation/devicetree/bindings/interconnect/mediatek,cci.yaml
> new file mode 100644
> index 000000000000..e5221e17d11b
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/interconnect/mediatek,cci.yaml
> @@ -0,0 +1,139 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/interconnect/mediatek,cci.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: MediaTek Cache Coherent Interconnect (CCI) frequency and voltage scaling
> +
> +maintainers:
> +  - Jia-Wei Chang <jia-wei.chang@mediatek.com>
> +
> +description: |
> +  MediaTek Cache Coherent Interconnect (CCI) is a hardware engine used by
> +  MT8183 and MT8186 SoCs to scale the frequency and adjust the voltage in
> +  hardware. It can also optimize the voltage to reduce the power consumption.
> +
> +properties:
> +  compatible:
> +    enum:
> +      - mediatek,mt8183-cci
> +      - mediatek,mt8186-cci
> +
> +  clocks:
> +    items:
> +      - description:
> +          The multiplexer for clock input of CPU cluster.

of the bus, not CPU cluster.

> +      - description:
> +          A parent of "cpu" clock which is used as an intermediate clock source
> +          when the original CPU is under transition and not stable yet.

This really should be handled in the clk controller, and not by every device
that happens to take a clock from a mux with upstream PLLs that can change
in clock rate. The end device hardware only takes one clock input. That's it.

> +
> +  clock-names:
> +    items:
> +      - const: cci
> +      - const: intermediate
> +
> +  operating-points-v2: true
> +  opp-table: true
> +
> +  proc-supply:
> +    description:
> +      Phandle of the regulator for CCI that provides the supply voltage.
> +
> +  sram-supply:
> +    description:
> +      Phandle of the regulator for sram of CCI that provides the supply
> +      voltage. When it presents, the cci devfreq driver needs to do

When it is present, the implementation needs to ...

ChenYu

> +      "voltage tracking" to step by step scale up/down Vproc and Vsram to fit
> +      SoC specific needs. When absent, the voltage scaling flow is handled by
> +      hardware, hence no software "voltage tracking" is needed.
> +
> +required:
> +  - compatible
> +  - clocks
> +  - clock-names
> +  - operating-points-v2
> +  - proc-supply
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/mt8183-clk.h>
> +    cci: cci {
> +        compatible = "mediatek,mt8183-cci";
> +        clocks = <&mcucfg CLK_MCU_BUS_SEL>,
> +                 <&topckgen CLK_TOP_ARMPLL_DIV_PLL1>;
> +        clock-names = "cci", "intermediate";
> +        operating-points-v2 = <&cci_opp>;
> +        proc-supply = <&mt6358_vproc12_reg>;
> +    };
> +
> +    cci_opp: opp-table-cci {
> +        compatible = "operating-points-v2";
> +        opp-shared;
> +        opp2_00: opp-273000000 {
> +            opp-hz = /bits/ 64 <273000000>;
> +            opp-microvolt = <650000>;
> +        };
> +        opp2_01: opp-338000000 {
> +            opp-hz = /bits/ 64 <338000000>;
> +            opp-microvolt = <687500>;
> +        };
> +        opp2_02: opp-403000000 {
> +            opp-hz = /bits/ 64 <403000000>;
> +            opp-microvolt = <718750>;
> +        };
> +        opp2_03: opp-463000000 {
> +            opp-hz = /bits/ 64 <463000000>;
> +            opp-microvolt = <756250>;
> +        };
> +        opp2_04: opp-546000000 {
> +            opp-hz = /bits/ 64 <546000000>;
> +            opp-microvolt = <800000>;
> +        };
> +        opp2_05: opp-624000000 {
> +            opp-hz = /bits/ 64 <624000000>;
> +            opp-microvolt = <818750>;
> +        };
> +        opp2_06: opp-689000000 {
> +            opp-hz = /bits/ 64 <689000000>;
> +            opp-microvolt = <850000>;
> +        };
> +        opp2_07: opp-767000000 {
> +            opp-hz = /bits/ 64 <767000000>;
> +            opp-microvolt = <868750>;
> +        };
> +        opp2_08: opp-845000000 {
> +            opp-hz = /bits/ 64 <845000000>;
> +            opp-microvolt = <893750>;
> +        };
> +        opp2_09: opp-871000000 {
> +            opp-hz = /bits/ 64 <871000000>;
> +            opp-microvolt = <906250>;
> +        };
> +        opp2_10: opp-923000000 {
> +            opp-hz = /bits/ 64 <923000000>;
> +            opp-microvolt = <931250>;
> +        };
> +        opp2_11: opp-962000000 {
> +            opp-hz = /bits/ 64 <962000000>;
> +            opp-microvolt = <943750>;
> +        };
> +        opp2_12: opp-1027000000 {
> +            opp-hz = /bits/ 64 <1027000000>;
> +            opp-microvolt = <975000>;
> +        };
> +        opp2_13: opp-1092000000 {
> +            opp-hz = /bits/ 64 <1092000000>;
> +            opp-microvolt = <1000000>;
> +        };
> +        opp2_14: opp-1144000000 {
> +            opp-hz = /bits/ 64 <1144000000>;
> +            opp-microvolt = <1025000>;
> +        };
> +        opp2_15: opp-1196000000 {
> +            opp-hz = /bits/ 64 <1196000000>;
> +            opp-microvolt = <1050000>;
> +        };
> +    };
> --
> 2.18.0
>
>
> _______________________________________________
> Linux-mediatek mailing list
> Linux-mediatek@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-mediatek

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
