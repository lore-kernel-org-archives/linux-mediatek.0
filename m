Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9D80C433EF
	for <linux-mediatek@archiver.kernel.org>; Tue,  7 Jun 2022 17:12:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VtA8ImdDgZE2rr5skk7WLopLiEEZMKIXf8MyAJdRS8M=; b=D4EYAJavr28kWB
	yaG2uzYv4kGcqI1YH9Hoh1fvbDTBIir/XdQmoRlQs4/xVD8X4eZn0dHuamk5rKTuhnvfNzkQSWEZW
	EA41i79r6mqH24TqpmokpTthnlmtQ0Wvt8s08U5U549SOS/cGUu7odVyNWCO+R9zQp+Jr84SZ8RcB
	KhhR4oumO/UeJUfKXznNQSxLFnPNXtP1RmWJXCr14s/vLB680YddfpNUaP7/2PH5aN1ruOe7V7p0q
	aXQa+VjKZaqj13cUKO7JNCeFzUU4n2voGOGv8KsnbEoDDe4lMwZrKPA3iXX8glggB9jRmqr+5xpXS
	IB3OgeKDiV8pSVPK9+xw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nycke-008YSO-VM; Tue, 07 Jun 2022 17:12:21 +0000
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nyckT-008YMS-1J
	for linux-mediatek@lists.infradead.org; Tue, 07 Jun 2022 17:12:10 +0000
Received: by mail-ed1-x529.google.com with SMTP id v25so23869530eda.6
        for <linux-mediatek@lists.infradead.org>; Tue, 07 Jun 2022 10:12:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=516c1ECeAdlTDYUv5SFW9WeHPEyFi2CPyVtGYdPkmAE=;
        b=dMWz8Fu3pnpw7EgoHQ8AoC3kGZ93ymrLgYNbUyChqTuJIaSdzlRMJYc2hThjfcvEwT
         xisRuno3peKuEKyqG+5tPELfFRBU2Y3AYcY56udOuCNl/HXC1GmQ44uxO5QgK53f83Ad
         jGFl9UVWsMqBujvYjmJ+ZL9zUiF2uoWE69PYXzH3dFDPvPYQtjKC21JkJLLCjPF9fcmP
         rJGzJo1Rh85V9h7gtjh0eSNaxu74ud8uzRJHGaIkkpDV2Q5u2UvTWGQKFUOHlQ9jGig4
         Z90ZJ6sS0msIRaYbPtWA/3DmV8Wg9rL3ldvq7sKcFIkCI4Y10GyX446hKN+OpDc4ETQP
         PP4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=516c1ECeAdlTDYUv5SFW9WeHPEyFi2CPyVtGYdPkmAE=;
        b=pJx7EZOq7jIEZpy4i+4UzGhlBIwFIPDGzDjNvX8v5C1e1atHKUpdVCDhJUr2yRxiuI
         y9UTV4r4seTS1dq9MZx9TzBXEjpPI0yeER9b0iWbx4D24Eoq6v3dOeQiBsWthxQEAEEv
         dDnHUciYqy8DH9CUKBd/0wp3awoIpX/LzbuGw0EALiAvE9um+CXTLiVwTk979UUwYegv
         w2sfQp/aK2eqhKbGr//4/nfH8WFyBgny3DTvgWVkE2IxtSritGMaen6VZ+Lp9+aMTLNs
         Xdp3GA5zbUQeBInzFGxfmoSpvaZtGvupCL/UVD680B6072VRfF57Av1n/Cfjdmh0ekw6
         heiw==
X-Gm-Message-State: AOAM5301XNzMuErg0r9ViPOzkekKqFO+BAfR7F/Go7tcEIOHwJ1Wt2a8
	9lt2T/IfGBNt6JoVnLkIP5OIAQ==
X-Google-Smtp-Source: ABdhPJzvpSk0Qjg661liVIKltScH0Q9G3bh+JG3VX3DkiOZwIcBf4+cWHgZ6prLeIuDfqneiTvvBwg==
X-Received: by 2002:a05:6402:35c9:b0:431:3b5f:ecc1 with SMTP id z9-20020a05640235c900b004313b5fecc1mr18641630edc.349.1654621924477;
        Tue, 07 Jun 2022 10:12:04 -0700 (PDT)
Received: from [192.168.0.186] (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id d19-20020a056402145300b0043151e18630sm4521204edx.21.2022.06.07.10.12.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Jun 2022 10:12:03 -0700 (PDT)
Message-ID: <cd9b1212-0950-9fd8-7481-e3ef14de2131@linaro.org>
Date: Tue, 7 Jun 2022 19:12:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v4 1/3] dt-bindings: mediatek: add vdosys1 RDMA definition
 for mt8195
Content-Language: en-US
To: Bo-Chen Chen <rex-bc.chen@mediatek.com>, chunkuang.hu@kernel.org,
 p.zabel@pengutronix.de, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org
Cc: matthias.bgg@gmail.com, airlied@linux.ie,
 angelogioacchino.delregno@collabora.com, pavel@ucw.cz,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 "Nancy.Lin" <nancy.lin@mediatek.com>
References: <20220606031818.13646-1-rex-bc.chen@mediatek.com>
 <20220606031818.13646-2-rex-bc.chen@mediatek.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220606031818.13646-2-rex-bc.chen@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220607_101209_108731_3FA94AB9 
X-CRM114-Status: GOOD (  16.89  )
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

On 06/06/2022 05:18, Bo-Chen Chen wrote:
> From: "Nancy.Lin" <nancy.lin@mediatek.com>
> 
> Add vdosys1 RDMA definition.
> 
> Signed-off-by: Nancy.Lin <nancy.lin@mediatek.com>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Tested-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> Signed-off-by: Bo-Chen Chen <rex-bc.chen@mediatek.com>
> ---
>  .../display/mediatek/mediatek,mdp-rdma.yaml   | 88 +++++++++++++++++++
>  1 file changed, 88 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/mediatek/mediatek,mdp-rdma.yaml
> 
> diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,mdp-rdma.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,mdp-rdma.yaml
> new file mode 100644
> index 000000000000..678abb321cc2
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,mdp-rdma.yaml
> @@ -0,0 +1,88 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/mediatek/mediatek,mdp-rdma.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: MediaTek MDP RDMA
> +
> +maintainers:
> +  - Chun-Kuang Hu <chunkuang.hu@kernel.org>
> +  - Philipp Zabel <p.zabel@pengutronix.de>
> +
> +description:
> +  The MediaTek MDP RDMA stands for Read Direct Memory Access.
> +  It provides real time data to the back-end panel driver, such as DSI,
> +  DPI and DP_INTF.
> +  It contains one line buffer to store the sufficient pixel data.
> +  RDMA device node must be siblings to the central MMSYS_CONFIG node.
> +  For a description of the MMSYS_CONFIG binding, see
> +  Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.yaml for details.
> +
> +properties:
> +  compatible:
> +    - const: mediatek,mt8195-vdo1-rdma

During my review I missed that part. But your testing should not miss it
- please always run `make dt_bindings_check` and do not send code which
fails.

Best regards,
Krzysztof

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
