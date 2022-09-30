Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97355C433FE
	for <linux-mediatek@archiver.kernel.org>; Fri, 30 Sep 2022 22:05:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Subject:Message-Id:
	References:In-Reply-To:Cc:To:From:Reply-To:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OCha88PaYgifgFcd4uvVIztgcK5zt4FhzTG/3Ul1xes=; b=YvOcklBULo1puZepV+3FFIu5Oi
	3k9zAOSt8CEAlRAhwJmjvZtLL0gzkFsjVx1d0irGNsLRW4bcl59ZsGtqFy0eYlso/L+uwrX+2MQ31
	FjtSOuDDOOFPyuSEkD7mUUZNgdgSwt//Gav+LW0M7OASUsJRgZ5buCwsBhdqb4YPpR2uWaUUUc43l
	RH+OiqQjp0WsINYeAVElR3U4Bno02IRVNkOCalv6B2+QgreQD0D0Z6xV1BOFC8nl346nOjYNqFq8G
	RJ4xK8fqGi1gIkY3ZUhOd6WkHWkf7uOlJbk88GMTc4j8xdnZgz0WYs+i0E58gtYT1WzegLm68qKLj
	AY8X2CsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oeO8k-00BnXf-6E; Fri, 30 Sep 2022 22:05:50 +0000
Received: from mail-oa1-f48.google.com ([209.85.160.48])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oeO8h-00BnWx-4M; Fri, 30 Sep 2022 22:05:48 +0000
Received: by mail-oa1-f48.google.com with SMTP id 586e51a60fabf-13221a3fea3so517374fac.5;
        Fri, 30 Sep 2022 15:05:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=date:subject:message-id:references:in-reply-to:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date;
        bh=OCha88PaYgifgFcd4uvVIztgcK5zt4FhzTG/3Ul1xes=;
        b=tf3xwCvP0y7/uExQzEOYj7P/RO3f0O1a2ULpAQMifUCv9FKZRc3WSQqmXFN+Yr/nxr
         6SZYNWYZfAsQR7uVA+6mv8iDDWFXZaCVaGJtO2SC0o4lW9XBT7GDCa46sbAlKS0umXEl
         Tu3aE6XQh0mbOTA1zeK9K+Ju9Y3y3+RdFlxOcuxeHBCApsdLfvlP0YzQbRqrox0flTEB
         PQvhCOhTC40ajW4vPTBhEj6WvVMXJbBmGN3wiUuontOFbHQ99E9Pb2Vgw9mZ6xqbh1+o
         JCBrQUogeEEWjZqWmyaF/6ZXewHgfWW+jGWeqwz48yx1A3J5ZmIGwDxrlOlSofuEHe7Y
         jAyw==
X-Gm-Message-State: ACrzQf3cof1ByhZ1t7NybtMWP6guBYeMG9cmgK0c94653LmsT2tzW2ue
	VJrmw4UVoqSdLfAzRxiedw==
X-Google-Smtp-Source: AMsMyM6wQkdkeuoMwiXngdbVWbO8gt78XK6h82limIVmKAdjhVl1fZtjFwbcpx8NGI3tyLKuDBDMyQ==
X-Received: by 2002:a05:6870:523:b0:131:2d50:e09c with SMTP id j35-20020a056870052300b001312d50e09cmr144209oao.129.1664575545273;
        Fri, 30 Sep 2022 15:05:45 -0700 (PDT)
Received: from macbook.herring.priv (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id n22-20020a056870241600b001317413344esm992413oap.47.2022.09.30.15.05.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Sep 2022 15:05:44 -0700 (PDT)
Received: (nullmailer pid 1129749 invoked by uid 1000);
	Fri, 30 Sep 2022 22:05:43 -0000
From: Rob Herring <robh@kernel.org>
To: Trevor Wu <trevor.wu@mediatek.com>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, p.zabel@pengutronix.de, linux-mediatek@lists.infradead.org, matthias.bgg@gmail.com, alsa-devel@alsa-project.org, robh+dt@kernel.org, tiwai@suse.com, broonie@kernel.org, linux-arm-kernel@lists.infradead.org
In-Reply-To: <20220930145701.18790-11-trevor.wu@mediatek.com>
References: <20220930145701.18790-1-trevor.wu@mediatek.com> <20220930145701.18790-11-trevor.wu@mediatek.com>
Message-Id: <166457526101.1112313.13428811477972046652.robh@kernel.org>
Subject: Re: [PATCH 10/12] dt-bindings: mediatek: mt8188: add audio afe document
Date: Fri, 30 Sep 2022 17:05:43 -0500
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220930_150547_184900_B9078D02 
X-CRM114-Status: GOOD (  10.84  )
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

On Fri, 30 Sep 2022 22:56:59 +0800, Trevor Wu wrote:
> Add mt8188 audio afe document.
> 
> Signed-off-by: Trevor Wu <trevor.wu@mediatek.com>
> ---
>  .../bindings/sound/mt8188-afe-pcm.yaml        | 202 ++++++++++++++++++
>  1 file changed, 202 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/sound/mt8188-afe-pcm.yaml
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/sound/mt8188-afe-pcm.example.dtb: afe@10b10000: clock-names:17: 'adsp_audio26m' was expected
	From schema: /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/sound/mt8188-afe-pcm.yaml

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/patch/

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.


