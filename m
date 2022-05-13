Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56EB5C43217
	for <linux-mediatek@archiver.kernel.org>; Fri, 13 May 2022 12:33:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mDiXqq3oE/ickuwxapiGyw0s3UUCnP1MGVBeP9pBcO4=; b=sQNUcFsNlHWEGi
	q0h4kYgDiD/Amv8c5jTTdSjZ+hDN3rwRfwBQqKNkAh+4BE1AgLE2bQKLLKhaO+CtbiNYO51wz1TDk
	RNcH1rFGF5kMoWKD7wsLJicpWeuxGw659O7/ParLHRXnOWhzA2dmRlVM7TAyjK/EX3jHTGn9X4Ore
	jI2iqZ1Bqe+N6jxjGuuqc1Dnz3SCeSfgTy3Kg6IXVcEiYnIU2HNcjDoMuci2bWi2gk9ubkYNLqg/k
	fj4V1OuUHRhXMxDSDMvD1c9EAPW1gfsNyxe9Cc41EgBufwEfOxAJ9/qtu4tcpOAsBMBr4AQ51Q7Qu
	Uf0KyKo0/s0o5awMtUBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1npUUG-00G2G5-DI; Fri, 13 May 2022 12:33:40 +0000
Received: from mail-oi1-f172.google.com ([209.85.167.172])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1npUU1-00G26g-Nm; Fri, 13 May 2022 12:33:27 +0000
Received: by mail-oi1-f172.google.com with SMTP id r1so9947571oie.4;
 Fri, 13 May 2022 05:33:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
 :message-id;
 bh=buZCjK/zEXixkrBZxaDQw6YBg7oqOrxcHQhY9x47DBY=;
 b=ZMpc6I/a6SJnpY5iOSABty7AipHFl28jTyIDk9qM/GWMidMARAc1f4+2TzsS510+S8
 D/SGSPb62nnohQctvzgJUnQ+80+SouGkWIS1jPA0RYaK6M4KYURXzYdMTKwrhD8uDgUn
 ia2kJvzO7sst8Z3ESgnkFZCyUhxuAzEVot6mhCbbBQIClF+4/FB/iHHalZSVavWC5RhI
 YlPcWqShM14gyQ6CN4+nQKVvbfmWToBN09xHpz7dSfpTxxhpofrLl1QEUvABUp+sc45Q
 XibVXYr8gO9etjWM5vNdqEWrpP+C9D9GiGf9wZogPFb2QKION5hruPiGIDLxOsDEwrLR
 eR4g==
X-Gm-Message-State: AOAM531/eInj1vEHkjkqwmXSqegmn1N9fQMLGrmdg0QvuLYJtcgMKDsp
 //rpNensnOsQqE6k6bvyTw==
X-Google-Smtp-Source: ABdhPJw7upKKDoDgfZ+8DZ0CWGKjhxTuOLrapQu7ccyksWW8Kk1fXfQ/lZ4uAKurnleTew8Xzr+gOw==
X-Received: by 2002:a05:6808:1206:b0:2d7:65a8:65e with SMTP id
 a6-20020a056808120600b002d765a8065emr2225633oil.107.1652445202398; 
 Fri, 13 May 2022 05:33:22 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 c24-20020a9d6858000000b00606ad72bdcbsm880686oto.38.2022.05.13.05.33.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 May 2022 05:33:21 -0700 (PDT)
Received: (nullmailer pid 85827 invoked by uid 1000);
 Fri, 13 May 2022 12:33:21 -0000
From: Rob Herring <robh@kernel.org>
To: Rex-BC Chen <rex-bc.chen@mediatek.com>
Cc: linux-arm-kernel@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com, p.zabel@pengutronix.de,
 matthias.bgg@gmail.com, linux-mediatek@lists.infradead.org, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, angelogioacchino.delregno@collabora.com,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, airlied@linux.ie,
 nancy.lin@mediatek.com, dri-devel@lists.freedesktop.org,
 chunkuang.hu@kernel.org, jason-jh.lin@mediatek.com
In-Reply-To: <20220512080523.25082-2-rex-bc.chen@mediatek.com>
References: <20220512080523.25082-1-rex-bc.chen@mediatek.com>
 <20220512080523.25082-2-rex-bc.chen@mediatek.com>
Subject: Re: [PATCH v3 1/3] dt-bindings: mediatek: add vdosys1 RDMA definition
 for mt8195
Date: Fri, 13 May 2022 07:33:21 -0500
Message-Id: <1652445201.069924.85826.nullmailer@robh.at.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220513_053325_830463_884C5EF7 
X-CRM114-Status: GOOD (  12.01  )
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

On Thu, 12 May 2022 16:05:21 +0800, Rex-BC Chen wrote:
> From: "Nancy.Lin" <nancy.lin@mediatek.com>
> 
> Add vdosys1 RDMA definition.
> 
> Signed-off-by: Nancy.Lin <nancy.lin@mediatek.com>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
>  .../display/mediatek/mediatek,mdp-rdma.yaml   | 88 +++++++++++++++++++
>  1 file changed, 88 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/mediatek/mediatek,mdp-rdma.yaml
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/display/mediatek/mediatek,mdp-rdma.yaml: properties:compatible: [{'const': 'mediatek,mt8195-vdo1-rdma'}] is not of type 'object', 'boolean'
	from schema $id: http://json-schema.org/draft-07/schema#
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/display/mediatek/mediatek,mdp-rdma.yaml: ignoring, error in schema: properties: compatible
Documentation/devicetree/bindings/display/mediatek/mediatek,mdp-rdma.example.dts:25:18: fatal error: dt-bindings/memory/mt8195-memory-port.h: No such file or directory
   25 |         #include <dt-bindings/memory/mt8195-memory-port.h>
      |                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
compilation terminated.
make[1]: *** [scripts/Makefile.lib:364: Documentation/devicetree/bindings/display/mediatek/mediatek,mdp-rdma.example.dtb] Error 1
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
