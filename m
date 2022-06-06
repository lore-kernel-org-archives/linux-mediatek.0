Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90E0AC43334
	for <linux-mediatek@archiver.kernel.org>; Mon,  6 Jun 2022 12:54:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VyIr2bstKpiUOHAbpB8dPWW/cZ6fHSJeAd5jGEDPyLg=; b=K3Mi25dSIeF4GJ
	7RW5MfHfCfFoFnn2PzWLct5gx3IdVBlxsNvzA4ZvrBhV9PJVwVcBIYLhxmrZQjXyiJiakHCXCHvrM
	IYujVnECaSZhhwstVYvHqpJTjVw8vRqy4ozwxtWifpVfvKALVJL+c95tlyi/toJs/r9YLGvilYMJh
	C04tIBbYzHmgCMqdozP9toiY5uofUf5joqEVg5kTf9n1+R2r1+diwHdP6YDv04H1JbUAIQZQl97y4
	/JBVnY6m+9hWtZ5M2/OGCcN9KO6yXSqbaI0AfUdqyaWJKwfsl45tnbJ631I3q/PdX5d4xlKCSiG0d
	NAtAKhncx7j6ppqD1n0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nyCFT-001Exl-Ra; Mon, 06 Jun 2022 12:54:23 +0000
Received: from mail-il1-f178.google.com ([209.85.166.178])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nyCF8-001ElE-At; Mon, 06 Jun 2022 12:54:04 +0000
Received: by mail-il1-f178.google.com with SMTP id f12so11870895ilj.1;
        Mon, 06 Jun 2022 05:54:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
         :message-id;
        bh=RgW4935QCsAGMmkhuRJMk7RJh1JHfN66O7hxz5zZQuI=;
        b=5EDMDcuhgS7kZsYLv4qQ01e07vDJF0pjef7JeB9V+aeDepsSkH8g5kmm6ZH2xemCcX
         dLpuiehfN/HryZTPsg/eSmOZ3blVsWpG5yxUCjK/2oTMEbJ8r30tQgFjOkFOJWjuMTQF
         /PmJnhrUT5USN4iQ3a7WiSK+5qcxJ/BiS7kBS42hEHdlCX0Db9aLo/CPSzXZhRsb6J39
         nU2Gu11e/LorIrXzgqn/snLXVtVADI0khJnDxvPJxut3KmIh/ehmS/qDTefu7IGI9yQa
         V5RDFOf/GtTHg9OR+3qL5aMXPjiLRqLlGNrIcjc8KeEGLofLleFj7IR8Fh7E+feEtexj
         9GnA==
X-Gm-Message-State: AOAM5317C1ayUToa0Gxkpc8YE64eQLQvZFy01CQUl2OhgAEMuiDTFDMA
	whllipVUBS/kFZGaP5HXvA==
X-Google-Smtp-Source: ABdhPJx8Ddb/0qM1ktVNbazk8LwdBo/5aLQiFZIdEU/GvqAx//WMhBNcB+l9qZAtxabGJJtIVk9sHQ==
X-Received: by 2002:a05:6e02:1d91:b0:2d3:bef3:a073 with SMTP id h17-20020a056e021d9100b002d3bef3a073mr14231575ila.60.1654520040280;
        Mon, 06 Jun 2022 05:54:00 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.251])
        by smtp.gmail.com with ESMTPSA id y15-20020a92950f000000b002d3adf71893sm6194943ilh.20.2022.06.06.05.53.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jun 2022 05:53:59 -0700 (PDT)
Received: (nullmailer pid 534473 invoked by uid 1000);
	Mon, 06 Jun 2022 12:53:53 -0000
From: Rob Herring <robh@kernel.org>
To: Bo-Chen Chen <rex-bc.chen@mediatek.com>
Cc: Project_Global_Chrome_Upstream_Group@mediatek.com, airlied@linux.ie, linux-arm-kernel@lists.infradead.org, robh+dt@kernel.org, pavel@ucw.cz, nancy.lin@mediatek.com, devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org, krzysztof.kozlowski+dt@linaro.org, chunkuang.hu@kernel.org, ck.hu@mediatek.com, matthias.bgg@gmail.com, linux-kernel@vger.kernel.org, angelogioacchino.delregno@collabora.com, linux-mediatek@lists.infradead.org, p.zabel@pengutronix.de
In-Reply-To: <20220606051131.14182-2-rex-bc.chen@mediatek.com>
References: <20220606051131.14182-1-rex-bc.chen@mediatek.com> <20220606051131.14182-2-rex-bc.chen@mediatek.com>
Subject: Re: [RESEND v4 1/3] dt-bindings: mediatek: add vdosys1 RDMA definition for mt8195
Date: Mon, 06 Jun 2022 07:53:53 -0500
Message-Id: <1654520033.524963.534472.nullmailer@robh.at.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220606_055402_409580_962BC432 
X-CRM114-Status: GOOD (  11.00  )
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

On Mon, 06 Jun 2022 13:11:29 +0800, Bo-Chen Chen wrote:
> From: "Nancy.Lin" <nancy.lin@mediatek.com>
> 
> Add vdosys1 RDMA definition.
> 
> Signed-off-by: Nancy.Lin <nancy.lin@mediatek.com>
> Signed-off-by: Bo-Chen Chen <rex-bc.chen@mediatek.com>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Tested-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
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
Documentation/devicetree/bindings/display/mediatek/mediatek,mdp-rdma.example.dtb:0:0: /example-0/soc/rdma@1c104000: failed to match any schema with compatible: ['mediatek,mt8195-vdo1-rdma']

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
