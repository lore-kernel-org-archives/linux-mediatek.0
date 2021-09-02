Return-Path: <SRS0=hgkd=NY=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 60E1EC432BE
	for <linux-mediatek@archiver.kernel.org>; Thu,  2 Sep 2021 12:04:37 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1DA91610D0
	for <linux-mediatek@archiver.kernel.org>; Thu,  2 Sep 2021 12:04:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 1DA91610D0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GWm75UqNsGDib8oQRl7taX+kKUqI/pd0hCVwaQkpWk8=; b=zq3a4g+MBYchvN
	N7xzewAsVDYnESQbGGYDE8lVcpGBc9JBvUchcD4Z4k+FchI399erNaPGPOdMTJmh7uSivjpcanles
	/8fB4wn44pVuk25CudCTXVnr1l4byj1DP8Eb/u/ohyHeQ/3Gq8iMrpG4X9XdoJHK4/I8t3NCt7r6i
	ypnPWknbQ7jSu4Dk4e5HCBo+Ay1YD9F+YtjRRPWEo+qWBpyHWucrMmr/2Rx117eEVunmXCvLB/D6h
	+9rv+aTcbrk97RD9Gmq5cv/bj5Tg1tZybnABodEfHnqQFXtgP40YPYDyOU6SjLljW7MlXbehJWlxA
	+fEIDIduhYFsPptdZknw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mLlS7-009UxB-97; Thu, 02 Sep 2021 12:04:19 +0000
Received: from mail-oi1-f173.google.com ([209.85.167.173])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mLlRq-009UrU-ON; Thu, 02 Sep 2021 12:04:07 +0000
Received: by mail-oi1-f173.google.com with SMTP id w144so1655952oie.13;
 Thu, 02 Sep 2021 05:04:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
 :message-id;
 bh=DqbDBOn9LbPv6mE+TZV/se5KZ66whWGBwMTUDdN1R0w=;
 b=gbaR3B/6Q/tQqatViSgi2Ablmi9bDJW4wAURqJhBSZyaX5nn8P7kXXLYHpopax98Wq
 4BSihBj/PwVdc3moQL/EYlC9kuTf2Yl0CrPv3ufpnFag5Qwu68Rw+tv7sJlE+KOxrJWK
 yV1ma89ZQZpIaTTr7o0dQh4aQUdhbGl3UQkzNJZn066eBEL3f3q8hwfGej34ti7RNubb
 CwGYYFQgQyHWlFShvRjIt7tt+ntsuaBAg4O9AvoAXSX0Pg2zFRx4mGPXinB6SOao82Wt
 0CXtwLId6VYOW+TvWbP/taOYHUeOorX0A2u85CGoMk5ExvlfI2VbWFBP4QW/OWODw885
 cuIw==
X-Gm-Message-State: AOAM532XKPjJ85L+WpgI1PmSuEvrdaeSB8QwNQdkpFR+tyHRx0WbZ4xJ
 HwPvQdeB72tCGglo3SSSXA==
X-Google-Smtp-Source: ABdhPJy5zHgT3CYbVHjqBlaKAIqyikhF9TQAXsaSbQ2sq9Ke9YuXUA+5Iro8Kv4/IbpBmwXXV+8GSg==
X-Received: by 2002:a05:6808:d53:: with SMTP id
 w19mr1890899oik.135.1630584240956; 
 Thu, 02 Sep 2021 05:04:00 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.gmail.com with ESMTPSA id c10sm305218ots.48.2021.09.02.05.03.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Sep 2021 05:04:00 -0700 (PDT)
Received: (nullmailer pid 685596 invoked by uid 1000);
 Thu, 02 Sep 2021 12:03:59 -0000
From: Rob Herring <robh@kernel.org>
To: Yunfei Dong <yunfei.dong@mediatek.com>
Cc: Tzung-Bi Shih <tzungbi@chromium.org>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>, linux-media@vger.kernel.org,
 Tiffany Lin <tiffany.lin@mediatek.com>, linux-kernel@vger.kernel.org,
 srv_heupstream@mediatek.com, linux-arm-kernel@lists.infradead.org,
 Rob Herring <robh+dt@kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 Alexandre Courbot <acourbot@chromium.org>,
 Fritz Koenig <frkoenig@chromium.org>, Irui Wang <irui.wang@mediatek.com>,
 Daniel Vetter <daniel@ffwll.ch>, Matthias Brugger <matthias.bgg@gmail.com>,
 devicetree@vger.kernel.org, Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
 Hsin-Yi Wang <hsinyi@chromium.org>, linux-mediatek@lists.infradead.org,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Tomasz Figa <tfiga@google.com>, dri-devel <dri-devel@lists.freedesktop.org>
In-Reply-To: <20210901083215.25984-14-yunfei.dong@mediatek.com>
References: <20210901083215.25984-1-yunfei.dong@mediatek.com>
 <20210901083215.25984-14-yunfei.dong@mediatek.com>
Subject: Re: [PATCH v6,
 13/15] dt-bindings: media: mtk-vcodec: Adds decoder dt-bindings for
 mt8192
Date: Thu, 02 Sep 2021 07:03:59 -0500
Message-Id: <1630584239.076177.685595.nullmailer@robh.at.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210902_050402_822735_66F4EB82 
X-CRM114-Status: GOOD (  16.89  )
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

On Wed, 01 Sep 2021 16:32:13 +0800, Yunfei Dong wrote:
> Adds decoder dt-bindings for mt8192.
> 
> Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>
> ---
> v6: add decoder block diagram for Laurent's comments.
> 
> This patch depends on "Mediatek MT8192 clock support"[1].
> 
> The definition of decoder clocks are in mt8192-clk.h, and this patch already in clk tree[1].
> 
> [1]https://git.kernel.org/pub/scm/linux/kernel/git/clk/linux.git/commit/?h=clk-next&id=f35f1a23e0e12e3173e9e9dedbc150d139027189
> ---
>  .../media/mediatek,vcodec-comp-decoder.yaml   | 192 ++++++++++++++++++
>  1 file changed, 192 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/media/mediatek,vcodec-comp-decoder.yaml
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/media/mediatek,vcodec-comp-decoder.yaml: properties:compatible: [{'enum': ['mediatek,mt8192-vcodec-dec', 'mediatek,mtk-vcodec-lat', 'mediatek,mtk-vcodec-core']}] is not of type 'object', 'boolean'
	from schema $id: http://json-schema.org/draft-07/schema#
./Documentation/devicetree/bindings/media/mediatek,vcodec-comp-decoder.yaml: $id: relative path/filename doesn't match actual path or filename
	expected: http://devicetree.org/schemas/media/mediatek,vcodec-comp-decoder.yaml#
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/media/mediatek,vcodec-comp-decoder.yaml: ignoring, error in schema: properties: compatible
warning: no schema found in file: ./Documentation/devicetree/bindings/media/mediatek,vcodec-comp-decoder.yaml
Documentation/devicetree/bindings/media/mediatek,vcodec-comp-decoder.example.dts:22:18: fatal error: dt-bindings/clock/mt8192-clk.h: No such file or directory
   22 |         #include <dt-bindings/clock/mt8192-clk.h>
      |                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
compilation terminated.
make[1]: *** [scripts/Makefile.lib:380: Documentation/devicetree/bindings/media/mediatek,vcodec-comp-decoder.example.dt.yaml] Error 1
make[1]: *** Waiting for unfinished jobs....
make: *** [Makefile:1419: dt_binding_check] Error 2

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/patch/1522931

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
