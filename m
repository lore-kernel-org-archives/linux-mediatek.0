Return-Path: <SRS0=puoQ=LF=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C3182C48BE0
	for <linux-mediatek@archiver.kernel.org>; Fri, 11 Jun 2021 17:55:57 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 899A4613D2
	for <linux-mediatek@archiver.kernel.org>; Fri, 11 Jun 2021 17:55:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 899A4613D2
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QofhhXLZveV9jE0dmynMOChT0BfgZbDs2ugCxVKB2TM=; b=iLr5xs2DC4JvKE
	4g7cQrNqhpSmteUCjEebPd0uzwQHB6PnM+KUsKOyU/d0FTr0JkDENIsF70/HJluhfmhmhspymZOOO
	aGjiMrJw0cMl3saUurwT3XCVOaoEIIf7th50R1PMkqP6d4eVzZfR5t4oZG3VmkfhGxnvZHvn2G5H1
	nfYPkw4P7CKD1feVJXkAhM0mTkiXo7jlfdd6cHwPP3opGST26tQkpFEujaIM8ts5JvpWIxloTH37w
	LEzKkMj5kg7OcWcG5YLa/tsQoEhTN8VPgUGPtYr5edqGYnuaeXuZkRBxlm/NZepXh17fa5yloHUI3
	5IanvKm0PLz1dhuFD1KQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lrlNg-006NYz-IA; Fri, 11 Jun 2021 17:55:44 +0000
Received: from mail-io1-f44.google.com ([209.85.166.44])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lrlNd-006NXE-V9; Fri, 11 Jun 2021 17:55:43 +0000
Received: by mail-io1-f44.google.com with SMTP id 5so32060777ioe.1;
 Fri, 11 Jun 2021 10:55:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
 :message-id;
 bh=GhKdnmG1yoizS3pbpaYv+va/QoVsK+02BeSi6TEeUTM=;
 b=rI/yYcynrN+H21nz7NDsE+fna8G26fpEgV9tyO9fCxq1FfeMlKPnpJsNP0o72D8utD
 Mez9xF85UWRhELXaVNuMCCCRuAVNmKcUAFS5nN/n/lEifXhjhY4OufbL99OJUBYTL18m
 1g7ytC+YnsHxaSGLMGektPMFEaj9vU8kPG3pDnd8SSnITfVLUIU/MCtPbCIzbD84B4OQ
 DvhiEn5FS+lUILXyClEQRrvxh/KTmoBVmVRj06HIlDWLHjzFHTyR2j8BvgDmB3fk5cNn
 fs/0q2BtmRYnayr019f3wxFnnKBG6RLuyuCjhIdGcuOhSTcMn5g310uky2jHp4S/LtY7
 O/sw==
X-Gm-Message-State: AOAM532fUZNfR1iChWq0aIAeqXJxB2tmcSnk+nYTL6ZqC3qXTop7gBmw
 +9WNQzuckbGKB8/vGeV1tg==
X-Google-Smtp-Source: ABdhPJxEbCBQmiSq6AHrgssN4FV0oH72srYnZQkN+Cl5siXxMrk0oag94/p2zTbOs2Ggbqg9LxkD6A==
X-Received: by 2002:a02:a318:: with SMTP id q24mr4962093jai.100.1623434138203; 
 Fri, 11 Jun 2021 10:55:38 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.252])
 by smtp.gmail.com with ESMTPSA id j12sm4251068ils.42.2021.06.11.10.55.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Jun 2021 10:55:37 -0700 (PDT)
Received: (nullmailer pid 1208940 invoked by uid 1000);
 Fri, 11 Jun 2021 17:55:33 -0000
From: Rob Herring <robh@kernel.org>
To: Hsin-Yi Wang <hsinyi@chromium.org>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, maoguang.meng@mediatek.com,
 linux-mediatek@lists.infradead.org, Rob Herring <robh+dt@kernel.org>,
 devicetree@vger.kernel.org, yong.wu@mediatek.com, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
In-Reply-To: <20210611112009.2955944-1-hsinyi@chromium.org>
References: <20210611112009.2955944-1-hsinyi@chromium.org>
Subject: Re: [PATCH v4 1/3] dt-bindings: mediatek: convert mtk jpeg
 decoder/encoder to yaml
Date: Fri, 11 Jun 2021 11:55:33 -0600
Message-Id: <1623434133.955843.1208939.nullmailer@robh.at.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210611_105542_033686_0CD23732 
X-CRM114-Status: GOOD (  12.14  )
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

On Fri, 11 Jun 2021 19:20:07 +0800, Hsin-Yi Wang wrote:
> Convert mediatek jpeg decoder and encoder bindings to yaml.
> 
> Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
> ---
> v3->v4: split adding mt8183 into another patch
> ---
>  .../bindings/media/mediatek-jpeg-decoder.txt  | 38 ---------
>  .../bindings/media/mediatek-jpeg-decoder.yaml | 85 +++++++++++++++++++
>  .../bindings/media/mediatek-jpeg-encoder.txt  | 35 --------
>  .../bindings/media/mediatek-jpeg-encoder.yaml | 76 +++++++++++++++++
>  4 files changed, 161 insertions(+), 73 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/media/mediatek-jpeg-decoder.txt
>  create mode 100644 Documentation/devicetree/bindings/media/mediatek-jpeg-decoder.yaml
>  delete mode 100644 Documentation/devicetree/bindings/media/mediatek-jpeg-encoder.txt
>  create mode 100644 Documentation/devicetree/bindings/media/mediatek-jpeg-encoder.yaml
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:

\ndoc reference errors (make refcheckdocs):
Warning: Documentation/devicetree/bindings/media/mediatek-jpeg-decoder.yaml references a file that doesn't exist: Documentation/devicetree/bindings/memory-controllers/mediatek,smi-larb.txt
Warning: Documentation/devicetree/bindings/media/mediatek-jpeg-encoder.yaml references a file that doesn't exist: Documentation/devicetree/bindings/memory-controllers/mediatek,smi-larb.txt
Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/media/mediatek-jpeg-decoder.txt
Documentation/devicetree/bindings/media/mediatek-jpeg-decoder.yaml: Documentation/devicetree/bindings/memory-controllers/mediatek,smi-larb.txt
Documentation/devicetree/bindings/media/mediatek-jpeg-encoder.yaml: Documentation/devicetree/bindings/memory-controllers/mediatek,smi-larb.txt
MAINTAINERS: Documentation/devicetree/bindings/media/mediatek-jpeg-decoder.txt

See https://patchwork.ozlabs.org/patch/1490913

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
