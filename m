Return-Path: <SRS0=eP1B=K4=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9428CC47083
	for <linux-mediatek@archiver.kernel.org>; Wed,  2 Jun 2021 17:18:40 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5139161CA2
	for <linux-mediatek@archiver.kernel.org>; Wed,  2 Jun 2021 17:18:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5139161CA2
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HSLzRF+QaTnQYvBjxkqpvUKUhlfxfe+NpfYDVGyUUHU=; b=DQVn2DSFhmyxUv
	v3vTqkSzopRByBWNFMGvjXcpexkPNXi7cxHotSvvVfoDffaKX5I0IE4S6QVbr9UMHp/dVXgk/RKNI
	lRoLaOjN49lG3hjdFmnRVGFL7I2SAAYTFdUfxjFXtSXXPgtpg7DDzCHCg8gIKYXErR08AoNECkz3/
	Z9YPn0ro84e5u6mq9wTs1PIYXO+/IKTuB++/yNnLXC94BYPzcCb9vj3oEtbQ4dZvFzYNeFCfp8Ej7
	NEJsjwNIApRSwT7OjpPMtrCHpCveMtVsGz058mEjxdzzpZ22kCyh03PI5LUtd4OVbNElgEf1IV/cn
	jRdFwLxvevtoIWV/E3RA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1loUVh-005TNU-D3; Wed, 02 Jun 2021 17:18:29 +0000
Received: from mail-ot1-f54.google.com ([209.85.210.54])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1loUUl-005Swl-MD; Wed, 02 Jun 2021 17:17:33 +0000
Received: by mail-ot1-f54.google.com with SMTP id
 v27-20020a056830091bb02903cd67d40070so18807ott.1; 
 Wed, 02 Jun 2021 10:17:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=YcaaWssKoIqKkfvvS+KCJUJhitjMpANZfFfLpXrQw08=;
 b=r2NmkCibZ4FcL/TMh/OLpvUnvf9fq2uAhxINp5NiP6Tpzgv4nialIbroih6qZ3rr7j
 CWUDhVeF8/adhG/Fbb3JvvBhLnlB8tLOgXAPwYliszDUpA+cL690tv9og/fbJTyt/RL/
 y5MUrnWWZsx+Bs5vwMvBHqTJtlTnIhLz0eimny1VnY2ILcz4R05PJK3DsS3x2RRe5ZyY
 yhibnxXClV5AfwS65jeORf+yPGXgsOIe8O6h/MJYv1TjP5xMZQNsCjgZugQKPFIywBNI
 N0JoP3kSMtAwNCQTndNjPJfyRtOe9gmyVgQlCJG882BCSAIBZ6B4ucxjT/yeiIcGS1g9
 qI6w==
X-Gm-Message-State: AOAM531a57LzSGRXL6DNTsQNzBLPcRNv/O7UTEbFdPAy1s/JlWw5xDIp
 7ob0VHrGVTgPX4A0NqGiBA==
X-Google-Smtp-Source: ABdhPJzPaZYjKf2UJsc0c5sCkVtrtsGyVKRWv/FpQZ6SO3sfQn22/lfVD9l6FGpu9FE2kok03pun4w==
X-Received: by 2002:a05:6830:1e70:: with SMTP id
 m16mr26745744otr.340.1622654250335; 
 Wed, 02 Jun 2021 10:17:30 -0700 (PDT)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id k16sm107568otp.19.2021.06.02.10.17.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Jun 2021 10:17:28 -0700 (PDT)
Received: (nullmailer pid 3599590 invoked by uid 1000);
 Wed, 02 Jun 2021 17:17:27 -0000
Date: Wed, 2 Jun 2021 12:17:27 -0500
From: Rob Herring <robh@kernel.org>
To: Chun-Jie Chen <chun-jie.chen@mediatek.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, Stephen Boyd <sboyd@kernel.org>,
 Nicolas Boichat <drinkcat@chromium.org>, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
 srv_heupstream@mediatek.com, Project_Global_Chrome_Upstream_Group@mediatek.com,
 Weiyi Lu <weiyi.lu@mediatek.com>
Subject: Re: [PATCH v9 03/22] dt-bindings: ARM: Mediatek: Add new document
 bindings of msdc controller
Message-ID: <20210602171727.GA3596715@robh.at.kernel.org>
References: <20210524122053.17155-1-chun-jie.chen@mediatek.com>
 <20210524122053.17155-4-chun-jie.chen@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210524122053.17155-4-chun-jie.chen@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210602_101731_774630_480C3060 
X-CRM114-Status: GOOD (  18.61  )
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

On Mon, May 24, 2021 at 08:20:34PM +0800, Chun-Jie Chen wrote:
> This patch adds the new binding documentation of msdc controller
> for Mediatek MT8192.

This is only additional compatibles. You can combine this with the 
schema in patch 2. (Unless some blocks are syscon and some aren't)

> 
> Signed-off-by: Weiyi Lu <weiyi.lu@mediatek.com>
> Signed-off-by: chun-jie.chen <chun-jie.chen@mediatek.com>
> ---
>  .../bindings/arm/mediatek/mediatek,msdc.yaml  | 48 +++++++++++++++++++
>  1 file changed, 48 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/arm/mediatek/mediatek,msdc.yaml
> 
> diff --git a/Documentation/devicetree/bindings/arm/mediatek/mediatek,msdc.yaml b/Documentation/devicetree/bindings/arm/mediatek/mediatek,msdc.yaml
> new file mode 100644
> index 000000000000..10eb43de2d2b
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/arm/mediatek/mediatek,msdc.yaml
> @@ -0,0 +1,48 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/arm/mediatek/mediatek,msdc.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: MediaTek MSDC Controller
> +
> +maintainers:
> +  - Chun-Jie Chen <chun-jie.chen@mediatek.com>
> +
> +description:
> +  The Mediatek msdc controller provides functional configurations and clocks to the system.
> +
> +properties:
> +  compatible:
> +    items:
> +      - enum:
> +          - mediatek,mt8192-msdc
> +          - mediatek,mt8192-msdc_top
> +      - const: syscon
> +
> +  reg:
> +    maxItems: 1
> +
> +  '#clock-cells':
> +    const: 1
> +
> +required:
> +  - compatible
> +  - reg
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    msdc: syscon@11f60000 {
> +        compatible = "mediatek,mt8192-msdc", "syscon";
> +        reg = <0x11f60000 0x1000>;
> +        #clock-cells = <1>;
> +    };
> +
> +  - |
> +    msdc_top: syscon@11f10000 {
> +        compatible = "mediatek,mt8192-msdc_top", "syscon";
> +        reg = <0x11f10000 0x1000>;
> +        #clock-cells = <1>;
> +    };
> -- 
> 2.18.0

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
