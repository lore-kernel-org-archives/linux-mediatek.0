Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F97BCCA480
	for <linux-mediatek@archiver.kernel.org>; Mon, 18 Jul 2022 01:43:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oj3Zm/SQRO5MOitoOMIklr7G150Ky3mACmzWauG0RBA=; b=1QIahsiH6pRkLOJCv3IlSVls39
	BnUdc4+SUwqvNRXLCRUFuQHLYAxYctK8nraDppNATYv6NdJ7k6SgnegF19ABo9q2cgpPCjVTD9BHD
	yjczJSnpvTilDfXinSCYiRqTBimpsUfRW+gvZEpio17c+T0yb1HCe3R+JvnsgtZ0BMpIGjyI8nsAk
	0vgOtOkOn6qxHW3GvfAJQn768FylotoiEXsL2K9Yjg3FgGwyr4ysapZV/X79G3fbutj1uFs/M1SNh
	Oe5v0ggsCO+lJShPcHdWwVUvejY8kqsaWnV6mzFexSdwQwzTgcLg4khPWNRBy9t0NXq37cUuwgltj
	kCdzNe6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oDFnP-009t8q-F0; Mon, 18 Jul 2022 01:43:39 +0000
Received: from mail-io1-f50.google.com ([209.85.166.50])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oDFnD-009t35-30; Mon, 18 Jul 2022 01:43:28 +0000
Received: by mail-io1-f50.google.com with SMTP id z132so8276603iof.0;
        Sun, 17 Jul 2022 18:43:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
         :message-id;
        bh=oj3Zm/SQRO5MOitoOMIklr7G150Ky3mACmzWauG0RBA=;
        b=AA7weCXEbeFrVqi5vBDdZVyw87/bDqrKyPwhbtJMAyYt9imFK/fVQvuasepVaLVnOV
         4uIz47yrtJ30rqyG8jtZ9phkB8307+YzVu3ezFI+KZ9r7C9BvMQ1JNQOEKAbJ+Ob+ZjA
         fPbq1ROPxlWK/sv9vEXzkbhsreWWCkuyT5AEATj3dSmZOUBU1I5Z/3RwEi/U53TPhzMR
         BlvAwKKxhdK/aGahJ3j86YejaFT9xzkKbGNMzk444t/p8NMCj1Q5dtNk/0HX7aEn7N+O
         BXqCPxV62JaxFyNX3SuAIRi5e+7Ug3eSCWzo+Z99dbRkvcSduuxFeInZsbhhznMipLKr
         vQiw==
X-Gm-Message-State: AJIora+Hg3enH3P+YKLkzO8W1Iharw77MWPdmGQcv/5aQ2QsZ65rZBmo
	fyWW6gV5VXGHHLs5ZT+ZvA==
X-Google-Smtp-Source: AGRyM1uiqFrYjUOelbjO2ccWrnnbbv01J29IHfmPZakQn9i+h9JEq0jlLLxuslHjF/ef6ILjcvo7fw==
X-Received: by 2002:a6b:cd8c:0:b0:67b:90c4:43c3 with SMTP id d134-20020a6bcd8c000000b0067b90c443c3mr11863916iog.28.1658108604204;
        Sun, 17 Jul 2022 18:43:24 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
        by smtp.gmail.com with ESMTPSA id r20-20020a02aa14000000b0033202bb9829sm4854226jam.49.2022.07.17.18.43.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 Jul 2022 18:43:23 -0700 (PDT)
Received: (nullmailer pid 1667782 invoked by uid 1000);
	Mon, 18 Jul 2022 01:43:21 -0000
From: Rob Herring <robh@kernel.org>
To: Irui Wang <irui.wang@mediatek.com>
Cc: wenst@chromium.org, angelogioacchino.delregno@collabora.com, Tomasz Figa <tfiga@chromium.org>, devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org, xia.jiang@mediatek.com, Project_Global_Chrome_Upstream_Group@mediatek.com, nicolas.dufresne@collabora.com, Tzung-Bi Shih <tzungbi@chromium.org>, linux-kernel@vger.kernel.org, maoguang.meng@mediatek.com, linux-arm-kernel@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>, kyrie wu <kyrie.wu@mediatek.com>, Hans Verkuil <hverkuil-cisco@xs4all.nl>, srv_heupstream@mediatek.com, linux-mediatek@lists.infradead.org
In-Reply-To: <20220716093408.29734-2-irui.wang@mediatek.com>
References: <20220716093408.29734-1-irui.wang@mediatek.com> <20220716093408.29734-2-irui.wang@mediatek.com>
Subject: Re: [V5,1/8] dt-bindings: mediatek: Add mediatek,mt8195-jpgdec compatible
Date: Sun, 17 Jul 2022 19:43:21 -0600
Message-Id: <1658108601.891612.1667781.nullmailer@robh.at.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220717_184327_148246_68A45C42 
X-CRM114-Status: GOOD (  12.38  )
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

On Sat, 16 Jul 2022 17:34:01 +0800, Irui Wang wrote:
> From: kyrie wu <kyrie.wu@mediatek.com>
> 
> Add mediatek,mt8195-jpgdec compatible to binding document.
> 
> Signed-off-by: kyrie wu <kyrie.wu@mediatek.com>
> Signed-off-by: irui wang <irui.wang@mediatek.com>
> 
> ---
>  .../media/mediatek,mt8195-jpegdec.yaml        | 160 ++++++++++++++++++
>  1 file changed, 160 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/media/mediatek,mt8195-jpegdec.yaml
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:
./Documentation/devicetree/bindings/media/mediatek,mt8195-jpegdec.yaml:98:5: [warning] wrong indentation: expected 2 but found 4 (indentation)
./Documentation/devicetree/bindings/media/mediatek,mt8195-jpegdec.yaml:102:9: [error] syntax error: expected <block end>, but found '<scalar>' (syntax)
./Documentation/devicetree/bindings/media/mediatek,mt8195-jpegdec.yaml:113:17: [warning] wrong indentation: expected 0 but found 16 (indentation)

dtschema/dtc warnings/errors:
make[1]: *** Deleting file 'Documentation/devicetree/bindings/media/mediatek,mt8195-jpegdec.example.dts'
Documentation/devicetree/bindings/media/mediatek,mt8195-jpegdec.yaml:102:9: did not find expected key
make[1]: *** [Documentation/devicetree/bindings/Makefile:26: Documentation/devicetree/bindings/media/mediatek,mt8195-jpegdec.example.dts] Error 1
make[1]: *** Waiting for unfinished jobs....
./Documentation/devicetree/bindings/media/mediatek,mt8195-jpegdec.yaml:102:9: did not find expected key
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/media/mediatek,mt8195-jpegdec.yaml: ignoring, error parsing file
make: *** [Makefile:1404: dt_binding_check] Error 2

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/patch/

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.


