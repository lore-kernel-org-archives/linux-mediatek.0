Return-Path: <SRS0=Vpwr=D2=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3D36DC433DF
	for <linux-mediatek@archiver.kernel.org>; Mon, 19 Oct 2020 19:55:11 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D3E67222B8
	for <linux-mediatek@archiver.kernel.org>; Mon, 19 Oct 2020 19:55:10 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="AQTGl0Vv"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D3E67222B8
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=PFRSRxcW9OVMmKfyIEFxpzh8fNhkMr7DRTr0Wbjudb8=; b=AQTGl0VvQpEVXE1K5Gu9QddHD
	daU6SU+KO9ThRcjNRHjebY1/7R3Sw81q1D/cORRXvZKNO3Np7Ls0Cbg6qndOVjfHs/jfOXhAPK3Si
	x6HnhQQHEdvmfCCIhSzvqQR8yfCQFiIJuXRsbPgU43ewtnQtPy3uDp3Udz9mrwp7dLnzCpK0aQauj
	C/AqcP0fg8Sd3498TSPm5U8ipiF3ZrngZdd1Yn7/H226WmQife/qviLJU8YueAw/VEKb+NYLq8yRv
	r5kHwhNYaqF4cI+sCMEfB1hBiyUX2T3Apqai5/X8Yv29FZ2xdELyH4HA+9XrES/ZYqcmwZfogMHWw
	/kB3DZJXw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kUbFF-0000kf-7b; Mon, 19 Oct 2020 19:55:01 +0000
Received: from mail-oi1-f194.google.com ([209.85.167.194])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kUbFB-0000jr-7U; Mon, 19 Oct 2020 19:54:58 +0000
Received: by mail-oi1-f194.google.com with SMTP id x62so1261862oix.11;
 Mon, 19 Oct 2020 12:54:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=e4J94wWgSsj19Lztka7Bia6MyVnqYmOwHNkLHwqtIG8=;
 b=PlVV6RI+RKA5hKcDy/BB87OtVZ7F/x2m+UbEubRHxwJ3GW6JmjzpguxzWlAh2MACMR
 tnDv8+7WWo6nZI/Ku4qUNFxwnFLuv+i6XHdGzxTWOCqaOv9qBFEzTRp6b5oXsk1K7a1p
 RjNWGLaMiqilDMkyKN3Zao6WSFxxEox62nBnEQeinB3GZf71KESzXVlEuQ6cnY2rZEIT
 0V0/n42iDiYDufQW6ydiA+6aVZ96WakkcKK9JYFJJ9rhKEeXyX95/n2nVHtHKrBawGJu
 2cw5SvYRQIwvBiZPmoMtRxMRarLgPz3aZeN2TlDLELhcLGvnhBrMhx1QOrNgsufe62Hq
 qpNg==
X-Gm-Message-State: AOAM532kQjRaYica5bejpgn/jmMu/FcKdSxYdyWq/YhTAsX+1HklSXIc
 XzbNx4sNIJZo+xAN082dlQ==
X-Google-Smtp-Source: ABdhPJyqf4zni8HaE2/CuaZPgjWxMZQQ9i9WueUEa7ps6qjeJ9ymfTc4au9dhynaocUyBeRq2Z2e7g==
X-Received: by 2002:aca:2111:: with SMTP id 17mr678135oiz.139.1603137296324;
 Mon, 19 Oct 2020 12:54:56 -0700 (PDT)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id t84sm203608oih.35.2020.10.19.12.54.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Oct 2020 12:54:55 -0700 (PDT)
Received: (nullmailer pid 3503981 invoked by uid 1000);
 Mon, 19 Oct 2020 19:54:54 -0000
Date: Mon, 19 Oct 2020 14:54:54 -0500
From: Rob Herring <robh@kernel.org>
To: Hsin-Hsiung Wang <hsin-hsiung.wang@mediatek.com>
Subject: Re: [PATCH v4 1/2] dt-bindings: spmi: document binding for the
 Mediatek SPMI controller
Message-ID: <20201019195454.GB3499610@bogus>
References: <1602864634-23489-1-git-send-email-hsin-hsiung.wang@mediatek.com>
 <1602864634-23489-2-git-send-email-hsin-hsiung.wang@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1602864634-23489-2-git-send-email-hsin-hsiung.wang@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201019_155457_311765_64B62976 
X-CRM114-Status: GOOD (  20.11  )
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

On Sat, Oct 17, 2020 at 12:10:33AM +0800, Hsin-Hsiung Wang wrote:
> This adds documentation for the SPMI controller found on Mediatek SoCs.
> 
> Signed-off-by: Hsin-Hsiung Wang <hsin-hsiung.wang@mediatek.com>
> ---

If you have a dependency such as the include, please note it here.

>  .../bindings/spmi/mtk,spmi-mtk-pmif.yaml      | 70 +++++++++++++++++++
>  1 file changed, 70 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/spmi/mtk,spmi-mtk-pmif.yaml
> 
> diff --git a/Documentation/devicetree/bindings/spmi/mtk,spmi-mtk-pmif.yaml b/Documentation/devicetree/bindings/spmi/mtk,spmi-mtk-pmif.yaml
> new file mode 100644
> index 000000000000..9945200a35b3
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/spmi/mtk,spmi-mtk-pmif.yaml
> @@ -0,0 +1,70 @@
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

Need a $ref to spmi.yaml.

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

Don't need quotes

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
> +  - clocks
> +  - clock-names

unevaluatedProperties: false

> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/mt8192-clk.h>
> +
> +    spmi: spmi@10027000 {
> +        compatible = "mediatek,mt6873-spmi";
> +        reg = <0 0x10027000 0 0x000e00>,
> +              <0 0x10029000 0 0x000100>;
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

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
