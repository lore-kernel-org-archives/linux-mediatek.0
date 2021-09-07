Return-Path: <SRS0=gwp9=N5=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86289C433EF
	for <linux-mediatek@archiver.kernel.org>; Tue,  7 Sep 2021 14:52:17 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 48229610C8
	for <linux-mediatek@archiver.kernel.org>; Tue,  7 Sep 2021 14:52:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 48229610C8
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uyK7OWyYwZQQkUYjrZvQ00GUKd3bc/p0VdgXSzlwyiM=; b=m2Vcxdl1gSdCNm
	cRLJjrLSQMvtpbPtKIf1KDtaMzlAlT2yCRJzSAfMYsVcaeLK4Ulsxnw50s0UdEEx/jbDzvpT1Gr5p
	1gE1nzu2ncO4h0qMoKuAdQ/WqHYR6TVpLsYRBEDezMbBwFLe+C5Veo7rKNaiTTP2+wSuAksPGaXPj
	8CH3i2ICW7zQTPBRbuhF7HBFvb/dP+hnw31KB4cX8x8OmLSAP+qUX0oVrhCyqUStfraVJnPikxgQ6
	lNrjOigept9N1r1hJvd+hie2kLtsrhYV2BCWQkIlH4hx9GjSuNga552lwikNtQZ4nmLWhnBQqukjo
	FsRTaDWpDfPd3XccBTPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mNcSB-003uyO-Te; Tue, 07 Sep 2021 14:52:03 +0000
Received: from mail-ot1-f43.google.com ([209.85.210.43])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mNcRy-003uvE-6Z; Tue, 07 Sep 2021 14:51:51 +0000
Received: by mail-ot1-f43.google.com with SMTP id
 o16-20020a9d2210000000b0051b1e56c98fso13081454ota.8; 
 Tue, 07 Sep 2021 07:51:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
 :message-id;
 bh=K9C/kpdJSeTdk8CqRsAWClMUWdhDIHFpApAyFUpF2cQ=;
 b=JQQoy8RfWrfjCVc3wu8SUlhaXht0n/uMqB5wL8BlXeLwTla/HxTTlA7/WBCPneQLMj
 68iVrrJ2a6EBhrMRNkzygGcwxcUIK8GCKdcw3KeMZqhWo+pUm9PnHhQ+UmqVs4zQlQLb
 9DFx6mDaMoHsSLKcOaVEC6VLxGSgD9agNnGPga7E6HzbG/RG0cAqwvgmFI2Csr9roreu
 ke0kiWxoqWcjpLaZ2FKT6TwD3Csja+QwTfPsP2cF9XOqth/QmPWs2IxMhPcUsjyoiJ/I
 9rfiFSUEHMm/py6hXYxOlAibmqDO3Nj8iSWSRt74Vg93Qi3Pm0644OSZ/YfAjFXMF5lV
 mT8A==
X-Gm-Message-State: AOAM533vRsO2RBjClR27+rr605txO98n38MA6iUmUWhNS1ap9r79bXtw
 ZMcn0/IVPuvagm4MARZ+7q4u7kXVhQ==
X-Google-Smtp-Source: ABdhPJy/y9KHvC7bV7t4BanxnDIknT6RYDMbRM9hh+0+KhTh72koKcnANQlNWDO/8dqBciBXZJaQGw==
X-Received: by 2002:a05:6830:3144:: with SMTP id
 c4mr14826951ots.153.1631026308866; 
 Tue, 07 Sep 2021 07:51:48 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.gmail.com with ESMTPSA id s17sm2436686otr.51.2021.09.07.07.51.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Sep 2021 07:51:48 -0700 (PDT)
Received: (nullmailer pid 3958450 invoked by uid 1000);
 Tue, 07 Sep 2021 14:51:44 -0000
From: Rob Herring <robh@kernel.org>
To: Guillaume Ranquet <granquet@baylibre.com>
Cc: David Airlie <airlied@linux.ie>, Matthias Brugger <matthias.bgg@gmail.com>,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 Kishon Vijay Abraham I <kishon@ti.com>, linux-arm-kernel@lists.infradead.org,
 CK Hu <ck.hu@mediatek.com>, linux-kernel@vger.kernel.org,
 Vinod Koul <vkoul@kernel.org>, linux-mediatek@lists.infradead.org,
 Chunfeng Yun <chunfeng.yun@mediatek.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, Daniel Vetter <daniel@ffwll.ch>,
 Jitao shi <jitao.shi@mediatek.com>, linux-phy@lists.infradead.org,
 Rob Herring <robh+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>
In-Reply-To: <20210907083723.7725-5-granquet@baylibre.com>
References: <20210907083723.7725-1-granquet@baylibre.com>
 <20210907083723.7725-5-granquet@baylibre.com>
Subject: Re: [PATCH 4/4] dt-bindings: display: mediatek: add MT8195 hdmi
 bindings
Date: Tue, 07 Sep 2021 09:51:44 -0500
Message-Id: <1631026304.913177.3958449.nullmailer@robh.at.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210907_075150_289004_EED6C690 
X-CRM114-Status: GOOD (  12.53  )
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

On Tue, 07 Sep 2021 10:37:21 +0200, Guillaume Ranquet wrote:
> Add Mediatek HDMI and HDMI-DDC bindings for MT8195 SoC.
> 
> Signed-off-by: Guillaume Ranquet <granquet@baylibre.com>
> ---
>  .../mediatek/mediatek,mt8195-hdmi-ddc.yaml    | 46 +++++++++
>  .../mediatek/mediatek,mt8195-hdmi.yaml        | 99 +++++++++++++++++++
>  2 files changed, 145 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/mediatek/mediatek,mt8195-hdmi-ddc.yaml
>  create mode 100644 Documentation/devicetree/bindings/display/mediatek/mediatek,mt8195-hdmi.yaml
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
Documentation/devicetree/bindings/display/mediatek/mediatek,mt8195-hdmi.example.dts:19:18: fatal error: dt-bindings/clock/mt8195-clk.h: No such file or directory
   19 |         #include <dt-bindings/clock/mt8195-clk.h>
      |                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
compilation terminated.
make[1]: *** [scripts/Makefile.lib:379: Documentation/devicetree/bindings/display/mediatek/mediatek,mt8195-hdmi.example.dt.yaml] Error 1
make[1]: *** Waiting for unfinished jobs....
make: *** [Makefile:1438: dt_binding_check] Error 2

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/patch/1525170

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
