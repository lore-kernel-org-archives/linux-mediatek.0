Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4AF35ECAAA1
	for <linux-mediatek@archiver.kernel.org>; Fri, 16 Sep 2022 01:28:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UkEDuL7RkJje1ybCpvMuHrhS0RikUQWzoLzozh6GvAM=; b=Pfvt+2oj6lFunDZptt+iTWqKUQ
	Sa2mMdIu9JUPyl9MX32VkM+wrN07Sh9Ch+qb/XFAZhDNLuN1sUi0UD7r3Mv2cLoByexg11mYcWDoT
	k6y1XzCgtDS+yELlqxVWsuvkZKXuLeOPGHinS+9LeZiyH2Rq7tB3RH/c6BNMEoPtZKopcQItuhI6A
	qnuTKtRo1WSCGqoF3q7mchBAd8ISxeoZkD4FW/jSebCVxIBFZBlG6/oQs7zTviLbura4nZAUyH6h4
	LfugS0U3mLcJ8vohEBhMO4s/K2KZeGsI73qUVHBssJzRLBBLQ1q46GLt8LgRqGi5YFb94qJZxBu99
	jijDBQAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oZ09x-004W7f-Tk; Fri, 16 Sep 2022 01:28:49 +0000
Received: from mail-oa1-f53.google.com ([209.85.160.53])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oZ09m-004W4b-TX; Fri, 16 Sep 2022 01:28:40 +0000
Received: by mail-oa1-f53.google.com with SMTP id 586e51a60fabf-1274ec87ad5so50132977fac.0;
        Thu, 15 Sep 2022 18:28:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=message-id:date:subject:references:in-reply-to:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date;
        bh=UkEDuL7RkJje1ybCpvMuHrhS0RikUQWzoLzozh6GvAM=;
        b=y3qt/rNjX6NCbWkUhydwzvwSAOmW06L7Z2J1xeyZjZGvj8qe4DlSyVVWuKIFrJQQqf
         pi8q8Rm3EL6GM9BnmGfQASJnrVJ8KEkb8KWlf7pTVMWIhXS+JkuQOPeBStYUMbPtlbCd
         UzBMW1ZsBF8DXi8Yb0DfZjL5MWRUIaDelH5HiK4i97/hk9CC92K2m1zu+lpE7XJQqWfd
         AazZxiPk//R6CUTpKXfhIj4xzEFNuEkTLXgxDHKxXEAbFBTZEn4gkRmqGnhwXSVrLPUZ
         g9voGQvdODXUw7QJlChFQVSw2t1hi2z59RaYx7wq9p+MueZYCqeKzt1hpfxXeFsnSxb3
         8Hgw==
X-Gm-Message-State: ACgBeo2AxH0TtXCYkd/vgjKLjVUEpfGpdn1QUfsBW3JSQyWP3y6UuuHN
	LhxDHR1OeUghgQEtgwuQHQ==
X-Google-Smtp-Source: AA6agR7iDIbG5iuuyYzEX3sYvdifMDH/GOPsdSZMCWjyv/+6aHZMgdVrdi2DHFpBMf9sIVl9KyXaFA==
X-Received: by 2002:a05:6870:c34e:b0:127:a3df:8ff with SMTP id e14-20020a056870c34e00b00127a3df08ffmr6921135oak.186.1663291717570;
        Thu, 15 Sep 2022 18:28:37 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id x30-20020a056870331e00b00127a91041a9sm2078500oae.38.2022.09.15.18.28.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Sep 2022 18:28:37 -0700 (PDT)
Received: (nullmailer pid 2725214 invoked by uid 1000);
	Fri, 16 Sep 2022 01:28:36 -0000
From: Rob Herring <robh@kernel.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: robh+dt@kernel.org, linux-arm-kernel@lists.infradead.org, houlong.wei@mediatek.com, linux-mediatek@lists.infradead.org, krzysztof.kozlowski+dt@linaro.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, jassisinghbrar@gmail.com, matthias.bgg@gmail.com
In-Reply-To: <20220915101716.70225-1-angelogioacchino.delregno@collabora.com>
References: <20220915101716.70225-1-angelogioacchino.delregno@collabora.com>
Subject: Re: [PATCH] dt-bindings: mailbox: Convert mtk-gce to DT schema
Date: Thu, 15 Sep 2022 20:28:36 -0500
Message-Id: <1663291716.321839.2725213.nullmailer@robh.at.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220915_182838_968998_BF39C2EF 
X-CRM114-Status: GOOD (  11.06  )
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

On Thu, 15 Sep 2022 12:17:16 +0200, AngeloGioacchino Del Regno wrote:
> Convert the mtk-gce mailbox binding to DT schema format.
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
>  .../mailbox/mediatek,gce-mailbox.yaml         | 104 ++++++++++++++++++
>  .../devicetree/bindings/mailbox/mtk-gce.txt   |  82 --------------
>  2 files changed, 104 insertions(+), 82 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/mailbox/mediatek,gce-mailbox.yaml
>  delete mode 100644 Documentation/devicetree/bindings/mailbox/mtk-gce.txt
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:


doc reference errors (make refcheckdocs):
Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.yaml: Documentation/devicetree/bindings/mailbox/mtk-gce.txt

See https://patchwork.ozlabs.org/patch/

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.


