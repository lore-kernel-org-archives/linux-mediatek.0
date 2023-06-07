Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96B9FC77B7A
	for <linux-mediatek@archiver.kernel.org>; Wed,  7 Jun 2023 07:16:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Subject:Message-Id:
	References:In-Reply-To:Cc:To:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WN0LwwbnyJgDu1njwGhpTrm7cgIrH6XMSJ7383SAvpU=; b=cJYPzJilK0RfCebvETrHcJhuWJ
	YJgDrxzQQt14RS0K0sD4HHI2+tRiwIk9uQv1kJHIaWrYu4Mr0ii6Cnj0wMpQ6syS2OIwYOWaBqNTa
	rncuL4dQ1yyLSXk3EamdYDO4jiyyz6nJCQSD/NZWhGpcl5ZO+xDloMCp19L9h/rNKRgnCQFEQbsDu
	rikmgg9gwcuYrxF6t+qd+85CHGVWlM+mm3hglk9VYMYXP9v/fgQ07Ulu9cNDS1SrtAbdDpd32vZyY
	grAMOHL+2giyjey8Ufc8PUwAOsNlyLVCoypkJ4ri3oWnP9msKnoSbRHuVoTDuk1fVVhWEfY/68O7h
	JRyqaolQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q6nOn-004ghw-1R;
	Wed, 07 Jun 2023 07:16:05 +0000
Received: from mail-io1-f50.google.com ([209.85.166.50])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q6nOj-004ggG-0N;
	Wed, 07 Jun 2023 07:16:02 +0000
Received: by mail-io1-f50.google.com with SMTP id ca18e2360f4ac-777a9d7efabso136102039f.0;
        Wed, 07 Jun 2023 00:15:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686122159; x=1688714159;
        h=date:subject:message-id:references:in-reply-to:cc:to:from
         :mime-version:content-transfer-encoding:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=WN0LwwbnyJgDu1njwGhpTrm7cgIrH6XMSJ7383SAvpU=;
        b=aQZCimJZ9gfZb1Hhw/HjEJtf7A33vxBr6FFQjmgw+Q0BbjD/wO8mZhvt+EWS0RZion
         SMtq/CsKLzXPLwjr9iemME03/YFqkDK85/VMDxbadCoii+h5ayPq4O8rAKhDsXd2zCZZ
         spK+EPOVehYY35JoQX5DRxwyU33MbAOUclKMR0hxVWG9WOLnh5ejw0c4QY7a59AnGIZh
         aI5/JxUHPCiOH9QpfLA7UNB4IfFHXm5CZv+WImmT5Ko+0RwY9qLRPUaurw+LFhqL1tdg
         /YFI4Jf6YBFybxThdKGx9uqKUFWtYYYsumSQJDUEr/XAl4vpk/xafn3DXyILTlgxTZe/
         I7vQ==
X-Gm-Message-State: AC+VfDwdkXL5Fq2/TES3+xRAhzUwImH8cKUgPrLlvgaB0dAMg46SmSjg
	XQDTHBSS8AABMp1hBhgXaA==
X-Google-Smtp-Source: ACHHUZ6xKL81YYTu7AlmFDegrMRVLuXp0zLtAjHhlTwkvAEuS0iMElMEV0IQYbqqBXZAFPHbCYkqrg==
X-Received: by 2002:a6b:e31a:0:b0:777:b409:fb67 with SMTP id u26-20020a6be31a000000b00777b409fb67mr5369669ioc.4.1686122158656;
        Wed, 07 Jun 2023 00:15:58 -0700 (PDT)
Received: from robh_at_kernel.org ([64.188.179.250])
        by smtp.gmail.com with ESMTPSA id el11-20020a0566384d8b00b0040bb600eb81sm3411663jab.149.2023.06.07.00.15.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Jun 2023 00:15:58 -0700 (PDT)
Received: (nullmailer pid 2033408 invoked by uid 1000);
	Wed, 07 Jun 2023 07:15:55 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
From: Rob Herring <robh@kernel.org>
To: Hsiao Chien Sung <shawn.sung@mediatek.com>
Cc: linux-kernel@vger.kernel.org, Singo Chang <singo.chang@mediatek.com>, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Rob Herring <robh+dt@kernel.org>, Chun-Kuang Hu <chunkuang.hu@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, Project_Global_Chrome_Upstream_Group@mediatek.com, Nancy Lin <nancy.lin@mediatek.com>, Philipp Zabel <p.zabel@pengutronix.de>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, linux-mediatek@lists.infradead.org, Fei Shao <fshao@google.com>, Jason-JH Lin <jason-jh.lin@mediatek.com>
In-Reply-To: <20230607061121.6732-2-shawn.sung@mediatek.com>
References: <20230607061121.6732-1-shawn.sung@mediatek.com>
 <20230607061121.6732-2-shawn.sung@mediatek.com>
Message-Id: <168612215587.2033253.1998545929244911622.robh@kernel.org>
Subject: Re: [PATCH v1 1/6] dt-bindings: display/mediatek: mt8188: Add
 documentations for VDOSYS1
Date: Wed, 07 Jun 2023 01:15:55 -0600
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230607_001601_150976_9CDA1B1F 
X-CRM114-Status: GOOD (  14.09  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org


On Wed, 07 Jun 2023 14:11:16 +0800, Hsiao Chien Sung wrote:
> Add device tree documentations for MT8188 VDOSYS1.
> 
> Signed-off-by: Hsiao Chien Sung <shawn.sung@mediatek.com>
> ---
>  .../bindings/arm/mediatek/mediatek,mmsys.yaml |  1 +
>  .../display/mediatek/mediatek,ethdr.yaml      |  5 +-
>  .../display/mediatek/mediatek,mdp-rdma.yaml   |  5 +-
>  .../display/mediatek/mediatek,merge.yaml      |  1 +
>  .../display/mediatek/mediatek,padding.yaml    | 80 +++++++++++++++++++
>  5 files changed, 90 insertions(+), 2 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/display/mediatek/mediatek,padding.yaml
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:
./Documentation/devicetree/bindings/display/mediatek/mediatek,ethdr.yaml:28:9: [warning] wrong indentation: expected 10 but found 8 (indentation)
./Documentation/devicetree/bindings/display/mediatek/mediatek,mdp-rdma.yaml:26:9: [warning] wrong indentation: expected 10 but found 8 (indentation)

dtschema/dtc warnings/errors:
Documentation/devicetree/bindings/display/mediatek/mediatek,padding.example.dts:19:18: fatal error: dt-bindings/clock/mt8188-clk.h: No such file or directory
   19 |         #include <dt-bindings/clock/mt8188-clk.h>
      |                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
compilation terminated.
make[1]: *** [scripts/Makefile.lib:419: Documentation/devicetree/bindings/display/mediatek/mediatek,padding.example.dtb] Error 1
make[1]: *** Waiting for unfinished jobs....
make: *** [Makefile:1512: dt_binding_check] Error 2

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20230607061121.6732-2-shawn.sung@mediatek.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


