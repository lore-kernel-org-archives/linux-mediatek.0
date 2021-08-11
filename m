Return-Path: <SRS0=F7c8=NC=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 84D5CC4338F
	for <linux-mediatek@archiver.kernel.org>; Wed, 11 Aug 2021 17:25:25 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3D63C61008
	for <linux-mediatek@archiver.kernel.org>; Wed, 11 Aug 2021 17:25:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 3D63C61008
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gly7wM7R7oJD2diJ37WSl5Yb9/JU/+b/14AsIzYGbEk=; b=Pv5ITBDI3fCqkW
	ppwpg6TEKFXpY253JSW6aAEUqdYoAay+oQ7EdK8EOEekG9/VbX2fSnFRRCy1puYB4HcEBbZ8YDeKc
	/mSNieGDyYWpgWVuOa+nHClO1rph0yub9u1Pp6z9TOOfCcE4KUXSrnDjlMeSe7R01Tps8eaxmTCim
	Jy9x1B6hsme2XbhmoXH12DRiA/gohnvgO8z1jkOi4KdWTIDI2cG/kCY6Qe273/nEh4KNGEdSJUGYl
	YONF9/iOHjxHpMIwiJyGLLWRhqTxbhfEFLM2Bh6bmDFfOLORvz5Pou8wBqY1gHLDnWJ2PYGtIk0wA
	UBfwXFjYT88DD/kKKvWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mDrya-007mGH-83; Wed, 11 Aug 2021 17:25:12 +0000
Received: from mail-pj1-f41.google.com ([209.85.216.41])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mDryU-007mEv-Lt; Wed, 11 Aug 2021 17:25:10 +0000
Received: by mail-pj1-f41.google.com with SMTP id
 gz13-20020a17090b0ecdb0290178c0e0ce8bso6500130pjb.1; 
 Wed, 11 Aug 2021 10:25:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
 :message-id;
 bh=zA+3b14ofbyiws8ymmMD/m7+Kf0mcNrODar9P3zeNdc=;
 b=l6UywQZtDsPfAPX5BGB1fAk1kArHOkJoZ5wS9CWSVFn9MHkmPRxdZmW01E2aC8zzGw
 BIa9d21xFgePO8hsXKbVM8//gfAaynqGkDF/37LMHxBvQLutD3LOLWhBF99A7MVecJMd
 +xw0FoAglcviBvKD5ASm4a77VGAhrFLyUl6D3UUPxkiXlJ+FtWOnj/QussrFMNIaIoBY
 28ruDM0KhFacibxm95RKozMcpn6sC+J1BEL6heWKAJZRCHITd33tkn0dC2UDBIXNJGC9
 V5SswtUlfEF/bLoJYVY0Tw7BZLByUwjmmKORKJYra4W7jQY6jVKNU+C8Gp5Da6JgXd1A
 07Vw==
X-Gm-Message-State: AOAM5320hh2z430hZ0PKFvoWiSEmVCYqj8DMb5+u1I14TxksMhWbn6TS
 clMHEu9IvUqqelj0wVo2lg==
X-Google-Smtp-Source: ABdhPJwKyhBu56kK4nHhyDFKA48JqamDhYuv7Yhdw715/G0+dgoeHXNeYpZU6Tjc7mq1N8YphlmUJw==
X-Received: by 2002:aa7:9415:0:b029:3ca:3205:b1f6 with SMTP id
 x21-20020aa794150000b02903ca3205b1f6mr20916038pfo.27.1628702704749; 
 Wed, 11 Aug 2021 10:25:04 -0700 (PDT)
Received: from robh.at.kernel.org ([208.184.162.215])
 by smtp.gmail.com with ESMTPSA id f6sm86234pfv.69.2021.08.11.10.25.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Aug 2021 10:25:04 -0700 (PDT)
Received: (nullmailer pid 3975942 invoked by uid 1000);
 Wed, 11 Aug 2021 17:24:53 -0000
From: Rob Herring <robh@kernel.org>
To: Yunfei Dong <yunfei.dong@mediatek.com>
Cc: linux-mediatek@lists.infradead.org,
 Alexandre Courbot <acourbot@chromium.org>, linux-kernel@vger.kernel.org,
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>, Tomasz Figa <tfiga@google.com>,
 srv_heupstream@mediatek.com, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Fritz Koenig <frkoenig@chromium.org>,
 Rob Herring <robh+dt@kernel.org>,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 Tzung-Bi Shih <tzungbi@chromium.org>, Tiffany Lin <tiffany.lin@mediatek.com>,
 Hsin-Yi Wang <hsinyi@chromium.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 George Sun <george.sun@mediatek.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>, Irui Wang <irui.wang@mediatek.com>,
 linux-media@vger.kernel.org
In-Reply-To: <20210811025801.21597-14-yunfei.dong@mediatek.com>
References: <20210811025801.21597-1-yunfei.dong@mediatek.com>
 <20210811025801.21597-14-yunfei.dong@mediatek.com>
Subject: Re: [PATCH v5,
 13/15] dt-bindings: media: mtk-vcodec: Adds decoder dt-bindings for
 mt8192
Date: Wed, 11 Aug 2021 11:24:53 -0600
Message-Id: <1628702693.304754.3975941.nullmailer@robh.at.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210811_102506_742736_FC443270 
X-CRM114-Status: GOOD (  16.15  )
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

On Wed, 11 Aug 2021 10:57:59 +0800, Yunfei Dong wrote:
> Adds decoder dt-bindings for mt8192.
> 
> Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>
> ---
> v5: no changes
> 
> This patch depends on "Mediatek MT8192 clock support"[1].
> 
> The definition of decoder clocks are in mt8192-clk.h, need to include them in case of build fail [1].
> 
> [1]https://patchwork.kernel.org/project/linux-mediatek/list/?series=511175
> ---
>  .../media/mediatek,vcodec-comp-decoder.yaml   | 172 ++++++++++++++++++
>  1 file changed, 172 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/media/mediatek,vcodec-comp-decoder.yaml
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
./Documentation/devicetree/bindings/media/mediatek,vcodec-comp-decoder.yaml: $id: relative path/filename doesn't match actual path or filename
	expected: http://devicetree.org/schemas/media/mediatek,vcodec-comp-decoder.yaml#
Documentation/devicetree/bindings/media/mediatek,vcodec-comp-decoder.example.dts:22:18: fatal error: dt-bindings/clock/mt8192-clk.h: No such file or directory
   22 |         #include <dt-bindings/clock/mt8192-clk.h>
      |                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
compilation terminated.
make[1]: *** [scripts/Makefile.lib:380: Documentation/devicetree/bindings/media/mediatek,vcodec-comp-decoder.example.dt.yaml] Error 1
make[1]: *** Waiting for unfinished jobs....
make: *** [Makefile:1419: dt_binding_check] Error 2

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/patch/1515556

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
