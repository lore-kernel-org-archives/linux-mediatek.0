Return-Path: <SRS0=gwp9=N5=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4FFDDC433F5
	for <linux-mediatek@archiver.kernel.org>; Tue,  7 Sep 2021 14:52:18 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E2537610C8
	for <linux-mediatek@archiver.kernel.org>; Tue,  7 Sep 2021 14:52:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org E2537610C8
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=R2d8eErUv6ITJ94w7JpnznFLgTCuBucctSVT8L/U1VQ=; b=suqfDQGmgcWNLJ
	KuAnHuptrusNtLw5tmzUv0QpNJn2QAIbEtf0n15Q61IsKLFht5dAuDlnnluXFqgdWNnQMgTTnm56A
	r7qeBp28OTJEomLGfd95DKZ5RHHri3IkPCgTUx0F6pjdDMwSh1K+frfQQv6CQLY2y6038o3Y/zC3o
	HuWCMxGk1MsnnuVAU+X1GdRtthkp5TxKItfacTFJn8VaL4C5jpyX8GxVoSHmzaq0MBs7IwjDi9gMj
	OpDLRMSx0O+O7DrbjYPoBO1JfZdulakyLsZY6XJjsa4yILCfVRIR5pS5xXIE3MEfODRlQUGDIAkaS
	+W+0pwa4UXDH6hk1Vk+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mNcSC-003uyq-P2; Tue, 07 Sep 2021 14:52:04 +0000
Received: from mail-ot1-f45.google.com ([209.85.210.45])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mNcRx-003uud-05; Tue, 07 Sep 2021 14:51:51 +0000
Received: by mail-ot1-f45.google.com with SMTP id
 x10-20020a056830408a00b004f26cead745so13057787ott.10; 
 Tue, 07 Sep 2021 07:51:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
 :message-id;
 bh=QW31+DP9HY/r4V30E1vm8cM8DbDpfwbSGw1klAkv3Nw=;
 b=AKrWASO8ndkGr3DATZiTxtooXYNnnLYVNF4cH9s2FHyzFgUYBx4zNOGneDeDIDg1e+
 S2qDn/FPUzBpK2xboe6G7iIYvcqAIK3bh3nH4ui+UmvpzryeF7CrfPhk9DoBGF1XHkCX
 Gs5DjT5EQwZmPNmedLgCkIWFT+XhFiADTouSGtnLCKmy/LUl7268+3M7Dx7A7p16Rauy
 vK3lEj7Sn635zYCGETdLLnTOhXWqrqt1Qz44cPinSZvg7u7P94Pzrwnv/5Gkkj1wsnvj
 kxDYLK+b0nJP7aOWGrOGdsauNVd74lHMt1FCkcauLTMqbvYXWzHnDFAh6yBYtXph5W94
 2BGg==
X-Gm-Message-State: AOAM530mC4Pg53bk8GWSdqzaNZnARZBbD2w2dVOqlzhQiV1KM+y5BoxU
 1j3zYO4m+f4FzFqHgzqszWDdJK3CVA==
X-Google-Smtp-Source: ABdhPJxcJL15uqG84K1L/XuTKDz+hov96kbNg/syHqy4gPJoZiaGsdG4k+EvI1uo1F7llZ566VmPuw==
X-Received: by 2002:a05:6830:441f:: with SMTP id
 q31mr15527535otv.204.1631026306857; 
 Tue, 07 Sep 2021 07:51:46 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.gmail.com with ESMTPSA id f25sm2457741otp.2.2021.09.07.07.51.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Sep 2021 07:51:46 -0700 (PDT)
Received: (nullmailer pid 3958447 invoked by uid 1000);
 Tue, 07 Sep 2021 14:51:44 -0000
From: Rob Herring <robh@kernel.org>
To: Guillaume Ranquet <granquet@baylibre.com>
Cc: devicetree@vger.kernel.org, Jitao shi <jitao.shi@mediatek.com>,
 linux-phy@lists.infradead.org, Daniel Vetter <daniel@ffwll.ch>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, dri-devel@lists.freedesktop.org,
 Kishon Vijay Abraham I <kishon@ti.com>, Vinod Koul <vkoul@kernel.org>,
 CK Hu <ck.hu@mediatek.com>, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, David Airlie <airlied@linux.ie>,
 Chunfeng Yun <chunfeng.yun@mediatek.com>, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, Philipp Zabel <p.zabel@pengutronix.de>,
 Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <20210907083723.7725-4-granquet@baylibre.com>
References: <20210907083723.7725-1-granquet@baylibre.com>
 <20210907083723.7725-4-granquet@baylibre.com>
Subject: Re: [PATCH 3/4] dt-bindings: phy: Add binding for Mediatek MT8195
 HDMI PHY
Date: Tue, 07 Sep 2021 09:51:44 -0500
Message-Id: <1631026304.898566.3958446.nullmailer@robh.at.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210907_075149_079270_755A8613 
X-CRM114-Status: GOOD (  12.87  )
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

On Tue, 07 Sep 2021 10:37:20 +0200, Guillaume Ranquet wrote:
> Add bindings to describe Mediatek MT8195 HDMI PHY
> 
> Signed-off-by: Guillaume Ranquet <granquet@baylibre.com>
> ---
>  .../phy/mediatek,mtk8195-hdmi-phy.yaml        | 71 +++++++++++++++++++
>  1 file changed, 71 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/phy/mediatek,mtk8195-hdmi-phy.yaml
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/phy/mediatek,mtk8195-hdmi-phy.yaml: properties:compatible: [{'const': 'mediatek,mt8195-hdmi-phy'}] is not of type 'object', 'boolean'
	from schema $id: http://json-schema.org/draft-07/schema#
./Documentation/devicetree/bindings/phy/mediatek,mtk8195-hdmi-phy.yaml: $id: relative path/filename doesn't match actual path or filename
	expected: http://devicetree.org/schemas/phy/mediatek,mtk8195-hdmi-phy.yaml#
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/phy/mediatek,mtk8195-hdmi-phy.yaml: ignoring, error in schema: properties: compatible
warning: no schema found in file: ./Documentation/devicetree/bindings/phy/mediatek,mtk8195-hdmi-phy.yaml
Documentation/devicetree/bindings/phy/mediatek,mtk8195-hdmi-phy.example.dts:19:18: fatal error: dt-bindings/clock/mt8195-clk.h: No such file or directory
   19 |         #include <dt-bindings/clock/mt8195-clk.h>
      |                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
compilation terminated.
make[1]: *** [scripts/Makefile.lib:379: Documentation/devicetree/bindings/phy/mediatek,mtk8195-hdmi-phy.example.dt.yaml] Error 1
make[1]: *** Waiting for unfinished jobs....
make: *** [Makefile:1438: dt_binding_check] Error 2

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/patch/1525169

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
