Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6202AC433F5
	for <linux-mediatek@archiver.kernel.org>; Tue,  3 May 2022 22:22:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Q2BYgrDUs4uLqE+xzyhlgzLyrxWoVpnDZrL3vS/MAYA=; b=x3XTk0tBaTUbt9
	cZHrZQtYO2kf7sbNOCyUQjl8itqUNiek9xz1TzRHiy1npmnEuNcQor8eFPo6f/dNMFaui/GlHK8DZ
	fmS3SSzZWWh87ZlPnpl1QjuGzVvCzshqg8moASwhfHoL86Ghscr86qHGrQ37P9XbR+M2Clzq2Fn/u
	5uSC1DRCXZVhv1KNIe3DZwpUaJlgxqpifKX8edLdXVJYY7oxQW16wGUcGq+ki9EEvdzCBk8RdUyf5
	PZAwCBvHV589rfzVRA38cuTir7t6t1FQ1H4Wv143DdQwRwJpHBhFeleEv6uzQ2yauvF4om49hHZ8J
	+QJc09hxEPDv7xnSmyCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nm0uP-007wcS-DQ; Tue, 03 May 2022 22:22:17 +0000
Received: from mail-oi1-f181.google.com ([209.85.167.181])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nm0u5-007wUq-6d; Tue, 03 May 2022 22:21:58 +0000
Received: by mail-oi1-f181.google.com with SMTP id l16so12390346oil.6;
 Tue, 03 May 2022 15:21:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
 :message-id;
 bh=AYzqDCKsTIUNQSFUA88IsjM5tVXZRYkNm2IzoI0SdEc=;
 b=V4+6Tglo7QZLzlBgO0dReoe2ggyzN8oiyz/g9XooY4LnS+wq0eNwBPiT5YE/Qkfove
 N35QxLGkPpjmBIqI+CM9G3wub1uF/CkYBff/dRVcwpn2Otjxc9ehGJtMg9PCbZkoCr5X
 EdTLe4cMxq5Km3k4Uc9LDW3KXMSz+76V1y9KLbJvyDJ8gXRyjt+jDVzlfFPnGKbLq+3F
 UupC8Q9/RqUAxCOzGshFhXOCyqHJj9+8w6u5QqRgElPwQW1NXdgGqEzXqfGBIB3Iw/BD
 rithiU6mL/Lc+bK8HQUkHoea5qWbhcXtBV42ScRZHNolzdS38o+6EUoqffSz/EwZgkjO
 HL9w==
X-Gm-Message-State: AOAM532Bcud16T9Mu9aiHbXTr8zHkxMAv3SqG3y3vaNUKOEhNiuQ/YRp
 4FPziEdDX8bBNXeOsVd61luoONrzig==
X-Google-Smtp-Source: ABdhPJzn/rfeIWO5DHbfNPeuF8m9ikdAA2XqhXdqzdxa0Z5LXZ/l9fkqrmw7YUHe4HECh0PvVs466Q==
X-Received: by 2002:a05:6808:d4c:b0:322:e7de:fffe with SMTP id
 w12-20020a0568080d4c00b00322e7defffemr2726225oik.107.1651616515316; 
 Tue, 03 May 2022 15:21:55 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 n7-20020a9d64c7000000b006060322125csm4564785otl.44.2022.05.03.15.21.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 May 2022 15:21:54 -0700 (PDT)
Received: (nullmailer pid 139788 invoked by uid 1000);
 Tue, 03 May 2022 22:21:51 -0000
From: Rob Herring <robh@kernel.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-arm-kernel@lists.infradead.org, robh+dt@kernel.org,
 kernel@collabora.com, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, sean.wang@kernel.org,
 linus.walleij@linaro.org, linux-gpio@vger.kernel.org, nfraprado@collabora.com,
 matthias.bgg@gmail.com, krzysztof.kozlowski+dt@linaro.org,
 devicetree@vger.kernel.org
In-Reply-To: <20220503142537.152499-2-angelogioacchino.delregno@collabora.com>
References: <20220503142537.152499-1-angelogioacchino.delregno@collabora.com>
 <20220503142537.152499-2-angelogioacchino.delregno@collabora.com>
Subject: Re: [PATCH v2 1/2] dt-bindings: pinctrl: Add MediaTek MT6795 pinctrl
 bindings
Date: Tue, 03 May 2022 17:21:51 -0500
Message-Id: <1651616511.157901.139787.nullmailer@robh.at.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220503_152157_288332_148A66EE 
X-CRM114-Status: GOOD (  10.21  )
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Tue, 03 May 2022 16:25:36 +0200, AngeloGioacchino Del Regno wrote:
> Add devicetree and pinfunc bindings for MediaTek Helio X10 MT6795.
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
>  .../pinctrl/mediatek,pinctrl-mt6795.yaml      | 224 +++++
>  include/dt-bindings/pinctrl/mt6795-pinfunc.h  | 908 ++++++++++++++++++
>  2 files changed, 1132 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/pinctrl/mediatek,pinctrl-mt6795.yaml
>  create mode 100644 include/dt-bindings/pinctrl/mt6795-pinfunc.h
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
./Documentation/devicetree/bindings/pinctrl/mediatek,pinctrl-mt6795.yaml: $id: relative path/filename doesn't match actual path or filename
	expected: http://devicetree.org/schemas/pinctrl/mediatek,pinctrl-mt6795.yaml#

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/patch/

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
