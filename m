Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 454C9C433F5
	for <linux-mediatek@archiver.kernel.org>; Mon,  9 May 2022 12:21:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3v6l+ilvLu+wkIeZ6QgVjcq81HQRgCwXO3eR9MahuaQ=; b=l+3j5GqIwbhH/0
	3UP9dtbDamCm8G2d3a7WjEs0Q2qfOnOM5ld9Dn7b0fnIO8A1aHLl32xaU9nYQVcCe9wnFt67OG8L3
	/6Zb4u9UGlEcWRPe5XgnTWEE0HvTzdgBE6uy8P643+0lvOT+SveUdr3gAohIlAC0Q1S1UZuZNoj0n
	77SUgH6K95hQjoTSYY+MTjRyDa5WUQmovw1h60nIVoPXq4gKaqMmVypee8eR7jQu8UanOOO/+fXBO
	djiKJrK/OP/TjAO2Ltrv2s31FOFmrOU0loCLqPRtHo8mEDGyKd3g6S5l0owsL5gVcyynmoAurI/z/
	Uj/YVKQHCYHcw3jkSOKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1no2OG-00EKIO-Qs; Mon, 09 May 2022 12:21:28 +0000
Received: from mail-ot1-f43.google.com ([209.85.210.43])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1no2Ns-00EK4E-LZ; Mon, 09 May 2022 12:21:06 +0000
Received: by mail-ot1-f43.google.com with SMTP id
 i25-20020a9d6259000000b00605df9afea7so9979379otk.1; 
 Mon, 09 May 2022 05:21:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
 :message-id;
 bh=CL6w1tqa1qD4GwVR1BmE4sf7WG++85dECQ4XHoV82pM=;
 b=eYm47vRdBtuHB3xz1Rz3wL+5qN7rUvbHeAJWfXXA2tWgfpFpBPaCqC0DtNVNrAwqEx
 XSYB+DHF5gdf3jczk58Z76va34HQprBeH5bAMzBHT7XkXIsq9Hsjrix/NkeVRr+iUXGQ
 EfFqFiwD0+EO7VZvgF6C4GC4CQcVMSeJaY/W5GwihYJ9MOhIQvFtwFCCCR4qceNmuX24
 fxPHkIh3pzo8D2xO6SB51nqwdw7UCdPvUZ8jvMfrEHNigpvfrTwq+pYW3LoXQZerXyaE
 wmFdgcq3BYsFvOmBACxavc/IsAsdd4MA6rh0VZh+whLhqqULMi9gz3+h24ovmv7q1e0l
 1ehQ==
X-Gm-Message-State: AOAM531UWO+fOvqnwfJ9bLYmTOzx7002lQkbNkImXE6nrRx/Sl5X1Sh9
 cerpxBTU/nI4FjIgNsP9iKPcPnDjCg==
X-Google-Smtp-Source: ABdhPJyYPUCuWnXkqMUn8CSgjlvGDITLJOGE1wCgwYZLeOPJP8mkqU5EfVup2MiR05RSXjZrKUscsQ==
X-Received: by 2002:a9d:f22:0:b0:5c9:5da1:3752 with SMTP id
 31-20020a9d0f22000000b005c95da13752mr3718194ott.354.1652098861730; 
 Mon, 09 May 2022 05:21:01 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 52-20020a9d0eb7000000b0060603221241sm4571606otj.17.2022.05.09.05.21.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 May 2022 05:21:01 -0700 (PDT)
Received: (nullmailer pid 3576231 invoked by uid 1000);
 Mon, 09 May 2022 12:20:58 -0000
From: Rob Herring <robh@kernel.org>
To: Rex-BC Chen <rex-bc.chen@mediatek.com>
Cc: airlied@linux.ie, chunkuang.hu@kernel.org, nancy.lin@mediatek.com,
 krzysztof.kozlowski+dt@linaro.org, linux-arm-kernel@lists.infradead.org,
 robh+dt@kernel.org, p.zabel@pengutronix.de, jason-jh.lin@mediatek.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 angelogioacchino.delregno@collabora.com, linux-mediatek@lists.infradead.org,
 matthias.bgg@gmail.com, devicetree@vger.kernel.org
In-Reply-To: <20220509044302.27878-4-rex-bc.chen@mediatek.com>
References: <20220509044302.27878-1-rex-bc.chen@mediatek.com>
 <20220509044302.27878-4-rex-bc.chen@mediatek.com>
Subject: Re: [PATCH v2 3/3] dt-bindings: mediatek: add ethdr definition for
 mt8195
Date: Mon, 09 May 2022 07:20:58 -0500
Message-Id: <1652098858.568339.3576230.nullmailer@robh.at.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220509_052104_763348_0B2CD6B7 
X-CRM114-Status: GOOD (  12.71  )
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

On Mon, 09 May 2022 12:43:02 +0800, Rex-BC Chen wrote:
> From: "Nancy.Lin" <nancy.lin@mediatek.com>
> 
> Add vdosys1 ETHDR definition.
> 
> Signed-off-by: Nancy.Lin <nancy.lin@mediatek.com>
> Reviewed-by: Chun-Kuang Hu <chunkuang.hu@kernel.org>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
>  .../display/mediatek/mediatek,ethdr.yaml      | 191 ++++++++++++++++++
>  1 file changed, 191 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/mediatek/mediatek,ethdr.yaml
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
Documentation/devicetree/bindings/display/mediatek/mediatek,ethdr.example.dts:26:18: fatal error: dt-bindings/memory/mt8195-memory-port.h: No such file or directory
   26 |         #include <dt-bindings/memory/mt8195-memory-port.h>
      |                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
compilation terminated.
make[1]: *** [scripts/Makefile.lib:364: Documentation/devicetree/bindings/display/mediatek/mediatek,ethdr.example.dtb] Error 1
make[1]: *** Waiting for unfinished jobs....
make: *** [Makefile:1401: dt_binding_check] Error 2

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
