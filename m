Return-Path: <SRS0=gwp9=N5=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1FA88C433F5
	for <linux-mediatek@archiver.kernel.org>; Tue,  7 Sep 2021 16:48:33 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DC26A60E77
	for <linux-mediatek@archiver.kernel.org>; Tue,  7 Sep 2021 16:48:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org DC26A60E77
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8YRs3Y9Fp+Ry41dTT4CB1NKB8JM1Ycuv1cPJYrFz3dc=; b=LdgindIb7t1F5n
	CJ7qYL9Pp3OYS4Ln4FSQEpG8hNVa8/AV7tmqFYi71OM3OIwUcQRtrpfH6JxT3iE7GpgztGNGj7kU+
	mkuiRoV2FxLVgFw4jQjOqkLollKuL26AhfKgTNKSaLBIuy48qB77BXXM4YZh9qJZE3GXrWj4XRsO8
	SdSF9PobKPtnTqmVZc6VpzV7mF5LuhDp4S2MKJmpih/ctXV1qVfvUX0O318DaxYNGp15bNGkkJ9bN
	AhKDRzZWx2RQ+EAx+0df69pI1ekxSGgfMYhoF7xAM7rFDJCe8sZA9dBUET7cL/cXph/ha79O/zRlz
	R3Httww1N/C2pm4DXW+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mNeGj-004GA4-4E; Tue, 07 Sep 2021 16:48:21 +0000
Received: from mail-oo1-f49.google.com ([209.85.161.49])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mNeGL-004Fxm-1h; Tue, 07 Sep 2021 16:47:58 +0000
Received: by mail-oo1-f49.google.com with SMTP id
 e206-20020a4a55d7000000b00291379cb2baso3101757oob.9; 
 Tue, 07 Sep 2021 09:47:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=MHz/eO25vUr8S8mSE9bsSa7gCQmBbjrMFcMGbCUHb6o=;
 b=APKVkB3WdE5+VXLQ8JLUPPqwJETyzdHIF4JMIQ5OXhA1i/U6LMka3CElfhyBHTjKpd
 t+8/ss/4GyCKDiWvwJShjkuYATO5tOOIBnEQeNZeuxxvwiTWtAfvnv221tlQsWWLPDjh
 hKfqO5CbptiQg+/F66rg9gfLZ8Qs0EqfA6TczHvpDBsAtqUDLDAtPhJWz0Hwaz177FXt
 5X1FDRRx9WJLeyhwihco9ADogwzVTNEgKLXsA1ILJma89FuSpeL2G8oJ9OdxOOGxFZLZ
 JJEvv6H9fmHuTOKgYhh7IYr93qqnK4o7WStzZYYu9t3PoGrmdzi6iiFA45lB7FZBn5f8
 FuTQ==
X-Gm-Message-State: AOAM533p7WQ+CbrSQ4ldsAz0TNvs8xjRwq833rxM6RUazAH8JLt/edZ2
 ghjRua/qHp9oXNuPTVvnCA==
X-Google-Smtp-Source: ABdhPJzZ4nyNi1E0Szx6UheqtQBDEqBMRmGhaKeXZHBzgMHg0LqsypWDXSEu8Z0dH05M0/talFPCXA==
X-Received: by 2002:a4a:e923:: with SMTP id a3mr641201ooe.45.1631033275700;
 Tue, 07 Sep 2021 09:47:55 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.gmail.com with ESMTPSA id z18sm2234069oib.27.2021.09.07.09.47.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Sep 2021 09:47:54 -0700 (PDT)
Received: (nullmailer pid 4137367 invoked by uid 1000);
 Tue, 07 Sep 2021 16:47:53 -0000
Date: Tue, 7 Sep 2021 11:47:53 -0500
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
 Philipp Zabel <p.zabel@pengutronix.de>
Subject: Re: [PATCH 4/4] dt-bindings: display: mediatek: add MT8195 hdmi
 bindings
Message-ID: <YTeXuVdyh+VMGdl7@robh.at.kernel.org>
References: <20210907083723.7725-1-granquet@baylibre.com>
 <20210907083723.7725-5-granquet@baylibre.com>
 <1631026304.913177.3958449.nullmailer@robh.at.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1631026304.913177.3958449.nullmailer@robh.at.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210907_094757_149456_A30DA042 
X-CRM114-Status: GOOD (  15.07  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Tue, Sep 07, 2021 at 09:51:44AM -0500, Rob Herring wrote:
> On Tue, 07 Sep 2021 10:37:21 +0200, Guillaume Ranquet wrote:
> > Add Mediatek HDMI and HDMI-DDC bindings for MT8195 SoC.
> > 
> > Signed-off-by: Guillaume Ranquet <granquet@baylibre.com>
> > ---
> >  .../mediatek/mediatek,mt8195-hdmi-ddc.yaml    | 46 +++++++++
> >  .../mediatek/mediatek,mt8195-hdmi.yaml        | 99 +++++++++++++++++++
> >  2 files changed, 145 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/display/mediatek/mediatek,mt8195-hdmi-ddc.yaml
> >  create mode 100644 Documentation/devicetree/bindings/display/mediatek/mediatek,mt8195-hdmi.yaml
> > 
> 
> My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
> on your patch (DT_CHECKER_FLAGS is new in v5.13):
> 
> yamllint warnings/errors:
> 
> dtschema/dtc warnings/errors:
> Documentation/devicetree/bindings/display/mediatek/mediatek,mt8195-hdmi.example.dts:19:18: fatal error: dt-bindings/clock/mt8195-clk.h: No such file or directory
>    19 |         #include <dt-bindings/clock/mt8195-clk.h>
>       |                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> compilation terminated.
> make[1]: *** [scripts/Makefile.lib:379: Documentation/devicetree/bindings/display/mediatek/mediatek,mt8195-hdmi.example.dt.yaml] Error 1
> make[1]: *** Waiting for unfinished jobs....
> make: *** [Makefile:1438: dt_binding_check] Error 2

Last I checked this is still not upstream. I'd suggest you adjust the 
example to not need this header.

Rob

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
