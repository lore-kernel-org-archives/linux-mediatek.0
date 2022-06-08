Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D5ABC43334
	for <linux-mediatek@archiver.kernel.org>; Wed,  8 Jun 2022 13:49:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LyH9Aq3ISp0FAWf+DYezYzStlUutU8m5NJuqnkUgF0Q=; b=Ox/HxQYyOiOrkN
	8VeW9vgdH50oEfYyFtPmLphmeletzJ6on++rhNaiO59zkfuUbFmqjiQICLS/+Sbe9q2qt4UgdP9Hx
	gGd/2RQfJuF/stoE3LZ5gGOgRgnt2VlakRKmCiz4qwoEmzMc0rY0DK11IcY90Np8e2b5jwlTe6v3E
	ZUOXJq4UAMu2T/F5/7Tp+C9Y2u3MeHI/Ua2hloq/PbTu7w9k3d6z8WS/YX3aWNYFCL4qkmlUWvbmi
	+26E/ZzZ7FHv9Z0MKAVWCfohbdaVEgOJFknmxMV4EXn+vYV6Hz8NrH9LU0NX6pRMoyD6fuOOj1X1s
	8PiRuvVpqZyKsDKDKDtA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nyw3T-00DJoG-BY; Wed, 08 Jun 2022 13:49:03 +0000
Received: from mail-io1-f43.google.com ([209.85.166.43])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nyvzt-00DI53-4f; Wed, 08 Jun 2022 13:45:22 +0000
Received: by mail-io1-f43.google.com with SMTP id 134so12574661iou.12;
        Wed, 08 Jun 2022 06:45:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
         :message-id;
        bh=W8KqLdaB/w/YGRDGH2n8sRCUDF1uSkNdTgkHzNsZwJc=;
        b=8JfJoTzW738qliFuK0wHpUlhdpABR/U5AAvux71ueCGBHq4u03/DThaq2NxZb/v1Py
         Tx36xBRzDT39bTUIIDK4PJTSgHY6orHhTh/nMHc6Tn/Cud1SQUt0EvfRc9PGFQnd0NjW
         vcell4Es9hjY6pLSNCbKpE7zauwiULhoA4Nm682WWAU0pHY/SQCmPRMiA1V/pk5gAt9n
         dxzUopIp8POO2XudRDCXd7Ddk1RQhFVeM13qarAcQ/K9CGEUoTVA4p+Dh7xuJpjVDC2L
         d1gMziPRWcX/hGZ8H3qDxqb7dNguuGOfIyjp8QsuG3aKGjy//NESRV8gPiKhd2B4oG9j
         rE3Q==
X-Gm-Message-State: AOAM533CQ4jiYKPWlsXfL9Qgi5gNeDX/V5I6hY+InEQg2DMJIDlxpim6
	rd/KPXTSSNf3p3gTd7AJBQ==
X-Google-Smtp-Source: ABdhPJx5s0ccjVbdJZaMMM/QC0HXDyokEKnHKgCKaaXwNUwaytQlXG9SpY/n8lgwAAdFIB6/yFyxcQ==
X-Received: by 2002:a02:8609:0:b0:330:e92c:2cc4 with SMTP id e9-20020a028609000000b00330e92c2cc4mr19375084jai.95.1654695917923;
        Wed, 08 Jun 2022 06:45:17 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.251])
        by smtp.gmail.com with ESMTPSA id cx4-20020a056638490400b0033126faae3asm8080774jab.116.2022.06.08.06.45.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jun 2022 06:45:17 -0700 (PDT)
Received: (nullmailer pid 1272086 invoked by uid 1000);
	Wed, 08 Jun 2022 13:45:07 -0000
From: Rob Herring <robh@kernel.org>
To: Bo-Chen Chen <rex-bc.chen@mediatek.com>
Cc: linux-kernel@vger.kernel.org, nancy.lin@mediatek.com, devicetree@vger.kernel.org, angelogioacchino.delregno@collabora.com, robh+dt@kernel.org, dri-devel@lists.freedesktop.org, pavel@ucw.cz, krzysztof.kozlowski+dt@linaro.org, matthias.bgg@gmail.com, airlied@linux.ie, Project_Global_Chrome_Upstream_Group@mediatek.com, linux-arm-kernel@lists.infradead.org, p.zabel@pengutronix.de, linux-mediatek@lists.infradead.org, chunkuang.hu@kernel.org, ck.hu@mediatek.com
In-Reply-To: <20220608043852.4980-4-rex-bc.chen@mediatek.com>
References: <20220608043852.4980-1-rex-bc.chen@mediatek.com> <20220608043852.4980-4-rex-bc.chen@mediatek.com>
Subject: Re: [RESEND v5 3/3] dt-bindings: mediatek: add ethdr definition for mt8195
Date: Wed, 08 Jun 2022 07:45:07 -0600
Message-Id: <1654695907.376302.1272085.nullmailer@robh.at.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220608_064521_312908_C08D71B5 
X-CRM114-Status: GOOD (  11.40  )
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

On Wed, 08 Jun 2022 12:38:52 +0800, Bo-Chen Chen wrote:
> From: "Nancy.Lin" <nancy.lin@mediatek.com>
> 
> Add vdosys1 ETHDR definition.
> 
> Signed-off-by: Nancy.Lin <nancy.lin@mediatek.com>
> Signed-off-by: Bo-Chen Chen <rex-bc.chen@mediatek.com>
> Reviewed-by: Chun-Kuang Hu <chunkuang.hu@kernel.org>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Tested-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
>  .../display/mediatek/mediatek,ethdr.yaml      | 188 ++++++++++++++++++
>  1 file changed, 188 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/mediatek/mediatek,ethdr.yaml
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
Error: Documentation/devicetree/bindings/display/mediatek/mediatek,ethdr.example.dts:71.40-41 syntax error
FATAL ERROR: Unable to parse input tree
make[1]: *** [scripts/Makefile.lib:383: Documentation/devicetree/bindings/display/mediatek/mediatek,ethdr.example.dtb] Error 1
make[1]: *** Waiting for unfinished jobs....
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


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
