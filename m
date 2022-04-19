Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26C91C433F5
	for <linux-mediatek@archiver.kernel.org>; Tue, 19 Apr 2022 13:22:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FEcpXvr1li+88UB/raAWcrI2bZJ/xrgPqgzk2IePr1k=; b=jVStkb9D0xXmXR
	qBaXAwiwHXSyNS2J2IcYrc1ymDuUJa0zqGWXssW9CBhsaJl+6YsEyTKbl01mb1WT6xaYmuA0klC3r
	tf1EpTypJviVNtQ2d2idwTTronXfLzeFXQfhw9iMRCh4ps4aA93EZTEgUH3tyqMytOXaet7GcdDAM
	X882Z8NfMvqqQJn0UgD9239+W5RiCLyEXXs6rc3sRtpWUbzaLxW0tFPgzDACxItT98SKVxyPO9rsp
	ZzWw86x47Zw1/3QDL3qj5hxWcuTaLBGbeJBz8XaKMrtdXymMebxtwMzTI+XeOGYnlLwp8DpC4wSpJ
	8MYB0XrmhelqAcN7DEAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ngnoQ-003o5t-7Y; Tue, 19 Apr 2022 13:22:34 +0000
Received: from mail-oa1-f43.google.com ([209.85.160.43])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ngmjJ-003NpU-Ka; Tue, 19 Apr 2022 12:13:15 +0000
Received: by mail-oa1-f43.google.com with SMTP id
 586e51a60fabf-e2a00f2cc8so17217248fac.4; 
 Tue, 19 Apr 2022 05:12:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
 :message-id;
 bh=0569YfmtjdqJ+2hyukw09AFuvfwmKEbwEGbKGweOpvI=;
 b=juiFUtpA03aVDEOxZYNZ7loBBwFP0vce/2yM5vsGQQ+izk9zbGb3reobBhm7gruISV
 bJRBT2MTwqL/tNhjeoHp1Jo6Y5ZN0WTQqhzemdj5WsoVgwh51OWtIQwRC+uky5qJdTWp
 SthcmyAJAkOBebE+9vEDOHwUEKBQtpBWEtS8RuGgQf4GgCkD0uABKTpIAsJgYnN8xw2v
 H//WKsjC+tlV0OkgG9lR/yJBinLtJ3srdWUwaK+NUCRf0l66id7K7Wj/0+dndzZIxuMo
 MWBwRdfnkJG4slXntRTkF/OQ0fochOee5H5aX4yolvWUV9jbdzGEHAg19pfxC9rYAoWK
 ZUSA==
X-Gm-Message-State: AOAM530netVrRaefcI86iA9M7aOkG7/B/m15gJG80jd4NF7APDK9hGHe
 Mmo/ml3x2iCnr4F6MRd9qQ==
X-Google-Smtp-Source: ABdhPJx8LiBK0K4XkLwgCXtqriBYjWmQ7YGCbPJHV61zXAKBySQssJNDd/Khvosb+uQCNv6rnPT75g==
X-Received: by 2002:a05:6870:9611:b0:df:200f:a6dd with SMTP id
 d17-20020a056870961100b000df200fa6ddmr6047417oaq.299.1650370366071; 
 Tue, 19 Apr 2022 05:12:46 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 g25-20020a544f99000000b002da70c710b8sm5082428oiy.54.2022.04.19.05.12.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Apr 2022 05:12:45 -0700 (PDT)
Received: (nullmailer pid 1977866 invoked by uid 1000);
 Tue, 19 Apr 2022 12:12:43 -0000
From: Rob Herring <robh@kernel.org>
To: Rex-BC Chen <rex-bc.chen@mediatek.com>
Cc: krzysztof.kozlowski+dt@linaro.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com, nancy.lin@mediatek.com,
 angelogioacchino.delregno@collabora.com, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, airlied@linux.ie, devicetree@vger.kernel.org,
 dri-devel@lists.freedesktop.org, chunkuang.hu@kernel.org,
 p.zabel@pengutronix.de, jason-jh.lin@mediatek.com, matthias.bgg@gmail.com,
 linux-arm-kernel@lists.infradead.org, robh+dt@kernel.org
In-Reply-To: <20220419033237.23405-4-rex-bc.chen@mediatek.com>
References: <20220419033237.23405-1-rex-bc.chen@mediatek.com>
 <20220419033237.23405-4-rex-bc.chen@mediatek.com>
Subject: Re: [PATCH 3/5] dt-bindings: mediatek: add vdosys1 RDMA definition
 for mt8195
Date: Tue, 19 Apr 2022 07:12:43 -0500
Message-Id: <1650370363.539386.1977865.nullmailer@robh.at.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220419_051313_720922_DD3154BA 
X-CRM114-Status: GOOD (  12.41  )
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

On Tue, 19 Apr 2022 11:32:35 +0800, Rex-BC Chen wrote:
> From: "Nancy.Lin" <nancy.lin@mediatek.com>
> 
> Add vdosys1 RDMA definition.
> 
> Signed-off-by: Nancy.Lin <nancy.lin@mediatek.com>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
>  .../display/mediatek/mediatek,mdp-rdma.yaml   | 86 +++++++++++++++++++
>  1 file changed, 86 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/mediatek/mediatek,mdp-rdma.yaml
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
./Documentation/devicetree/bindings/display/mediatek/mediatek,mdp-rdma.yaml: $id: relative path/filename doesn't match actual path or filename
	expected: http://devicetree.org/schemas/display/mediatek/mediatek,mdp-rdma.yaml#
Documentation/devicetree/bindings/display/mediatek/mediatek,mdp-rdma.example.dts:27:18: fatal error: dt-bindings/memory/mt8195-memory-port.h: No such file or directory
   27 |         #include <dt-bindings/memory/mt8195-memory-port.h>
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
