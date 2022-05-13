Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77805C433EF
	for <linux-mediatek@archiver.kernel.org>; Fri, 13 May 2022 12:33:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=as0jjfXfnv/J04x37OD2Cs5cZ67nmrdDyX5GIEaKfl8=; b=YLXFIz9k37heCH
	wKgfBzC55gBNMzihWlSdXgUNnCEkaEzd1SZw4aXJg+M6j5jctajdfZdC09+MMlSzjxkGAl3boBuLi
	mWEKZb28Kqg3ZbMKqE4tIwDmORHQZeSTmykH2V1HeXKqwHY8kBAM1898OJ6X+9N3FEBinSh4HDyIc
	PXOc3McgYYlLP6G3sphLEF+20aj3yipGm6AZtXXfiEHc9KRnm9t3EcfvXWyOr4FvaS4XA/eG+eSX1
	Z9wkXI8oT3XMT03QfzdB3kiYBQ4hxLTFv31/eYU0t+OnBQ2ghf9mc11Zljp7g2bXm0Mtro8tuGitd
	7Qbtbquufr/e/oLRP5IA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1npUUQ-00G2Jd-7B; Fri, 13 May 2022 12:33:50 +0000
Received: from mail-oa1-f47.google.com ([209.85.160.47])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1npUU5-00G28c-B5; Fri, 13 May 2022 12:33:32 +0000
Received: by mail-oa1-f47.google.com with SMTP id
 586e51a60fabf-e656032735so10406233fac.0; 
 Fri, 13 May 2022 05:33:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
 :message-id;
 bh=Y6SXqHq4jVINYnWAPbjFMrHoSh+02pvk+f0QJ78bs+8=;
 b=VGiIYvq8XS+2r+rqJdmrTrB9ZjFCaB5IgOJaAvtDE8bCrx9xy/SiU4sLoZn5YeXqDu
 tgHdzcp1msfIt5AFcDerXTVu81XxwzHL3w0vMOdFEXNhm4MW74fPNhleitzhGjBFhBy5
 eksZ1VPBYfKuor6/R36qu1OoiTUt+H1axC5bXy/1nHmmZdzEkM3iJ1OQvl3KoPgN8em9
 eELvOH1/nqPoV6NU6irZr5dDG4k0j/Vt674lJkN9W+dng8xYSezIiIr8FIGwqZQQjerL
 Dsir9PwLCAI4Tr89k/AL3IyTyJ05Lnly5kB9f0zStu3gKf/yOP4ontOYf9oMhM3Vh0ic
 ia1Q==
X-Gm-Message-State: AOAM531O0adAS3h51sIMngPzqiZoI57om6lWrweokEJCFovpRs78OcPk
 FUI0zv3jV+5RRZKRpE+D3w==
X-Google-Smtp-Source: ABdhPJyPZn3Xgpi1f5vxZ52Fd5aXo/LxlG8R5JGXBiXK/g/Fud6q3u5VC0bItDo8dFuPlwtasN2xFg==
X-Received: by 2002:a05:6870:a1a0:b0:dd:e471:8baf with SMTP id
 a32-20020a056870a1a000b000dde4718bafmr8054392oaf.40.1652445206767; 
 Fri, 13 May 2022 05:33:26 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 v3-20020a05683011c300b0060603221278sm866823otq.72.2022.05.13.05.33.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 May 2022 05:33:26 -0700 (PDT)
Received: (nullmailer pid 85833 invoked by uid 1000);
 Fri, 13 May 2022 12:33:21 -0000
From: Rob Herring <robh@kernel.org>
To: Rex-BC Chen <rex-bc.chen@mediatek.com>
Cc: Project_Global_Chrome_Upstream_Group@mediatek.com,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 nancy.lin@mediatek.com, krzysztof.kozlowski+dt@linaro.org,
 devicetree@vger.kernel.org, airlied@linux.ie, robh+dt@kernel.org,
 p.zabel@pengutronix.de, matthias.bgg@gmail.com, chunkuang.hu@kernel.org,
 angelogioacchino.delregno@collabora.com, jason-jh.lin@mediatek.com,
 linux-mediatek@lists.infradead.org, dri-devel@lists.freedesktop.org
In-Reply-To: <20220512080523.25082-4-rex-bc.chen@mediatek.com>
References: <20220512080523.25082-1-rex-bc.chen@mediatek.com>
 <20220512080523.25082-4-rex-bc.chen@mediatek.com>
Subject: Re: [PATCH v3 3/3] dt-bindings: mediatek: add ethdr definition for
 mt8195
Date: Fri, 13 May 2022 07:33:21 -0500
Message-Id: <1652445201.080121.85831.nullmailer@robh.at.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220513_053329_428106_5A58341A 
X-CRM114-Status: GOOD (  11.73  )
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

On Thu, 12 May 2022 16:05:23 +0800, Rex-BC Chen wrote:
> From: "Nancy.Lin" <nancy.lin@mediatek.com>
> 
> Add vdosys1 ETHDR definition.
> 
> Signed-off-by: Nancy.Lin <nancy.lin@mediatek.com>
> Reviewed-by: Chun-Kuang Hu <chunkuang.hu@kernel.org>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
>  .../display/mediatek/mediatek,ethdr.yaml      | 188 ++++++++++++++++++
>  1 file changed, 188 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/mediatek/mediatek,ethdr.yaml
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/display/mediatek/mediatek,ethdr.yaml: properties:compatible: [{'const': 'mediatek,mt8195-disp-ethdr'}] is not of type 'object', 'boolean'
	from schema $id: http://json-schema.org/draft-07/schema#
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/display/mediatek/mediatek,ethdr.yaml: ignoring, error in schema: properties: compatible
Documentation/devicetree/bindings/display/mediatek/mediatek,ethdr.example.dts:24:18: fatal error: dt-bindings/memory/mt8195-memory-port.h: No such file or directory
   24 |         #include <dt-bindings/memory/mt8195-memory-port.h>
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
