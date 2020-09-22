Return-Path: <SRS0=fRkw=C7=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 00492C4363D
	for <linux-mediatek@archiver.kernel.org>; Tue, 22 Sep 2020 16:05:16 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 98C7F208A9
	for <linux-mediatek@archiver.kernel.org>; Tue, 22 Sep 2020 16:05:16 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="S0Druhn8"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 98C7F208A9
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=b3ItY1ZhDqjuS9D+wLnpE7DU6luelMlACFOMF5GSR0A=; b=S0Druhn89bWkxBuGN/x/nO+Vu
	9PixFUgupzNIqc+zy4ZttoyApx2HVxMNA024vJXqVMDwWvaUkzLqx542gtBnhCQVj0eIDJaA8JhV7
	N/YMkwWRLiBL06g3hzYfj9VO5aG8o5Mc/YA+4E4pfdyYUvOsfADBEXHEKaREIgPLrdxoBRI/yiaO9
	GDana32Ep0rRl2AXqwv/tsQUXUKUZ14Yq2wqkmkrUlpDac3C+PQ3bCbSsRtem2rGhkdS3ftoVYWtQ
	SBf7F82dOtohKP0QtoYqLwpJ4AQ1QqMEXo1Ac6nF4D+bxV1Pee2e+Ypneua7pG67eLkGOp+EMcY3y
	+bmO1uBow==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kKkmx-0000O4-Do; Tue, 22 Sep 2020 16:05:07 +0000
Received: from mail-il1-f195.google.com ([209.85.166.195])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kKkml-0000L3-GG; Tue, 22 Sep 2020 16:04:56 +0000
Received: by mail-il1-f195.google.com with SMTP id a19so17812376ilq.10;
 Tue, 22 Sep 2020 09:04:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=CKfLdUexUfPdpjwTDlKQ3XKMxqzDUbFupt+mG72mDMc=;
 b=dfGmUYTUCGDHj4MOosRnZutlbzTZawH3fwKkGT1n151tAkmXtyM3oFzxSH7ivnB+Qe
 ha/nUK9swFMfQbdwz98dak16J3c60NITMCO46M0pm5T5xInjNg5fNVir0uQskbxIGIz6
 ln3rimj0WYodjEAAmXfiRf7OqPFybc9Kmw0KSM5ul8gmU+d//KXHXC+4fiGJeBJ/CUoi
 EXQwxPIohXzCaY1sZ10cM75HHlBoM29oypNAwtJi4I/FcKMid5eT4oY/un7s1iQ/fS6e
 lKDAOeO7RfUBUcLiAmGTlP4N6WXx2Zo+xaA4ST8ZPDcoJOaZj3P3kDSVh4n71BD3ZQ7X
 NiJw==
X-Gm-Message-State: AOAM532LNR3W/uWIo/lE7qvIev8bZQFga4chH15Sm8WXoM3J4o1pPIy3
 fAld2xXoTdEwrgHDB/1CuQ==
X-Google-Smtp-Source: ABdhPJyGE4qpjft/53rjEnM1nes6ybplFwv2lRkqN4ajfiISqxLZHyh9XWi1DNlUUSO+vOKKTAg4Fw==
X-Received: by 2002:a92:730b:: with SMTP id o11mr4773209ilc.91.1600790694176; 
 Tue, 22 Sep 2020 09:04:54 -0700 (PDT)
Received: from xps15 ([64.188.179.253])
 by smtp.gmail.com with ESMTPSA id k2sm7557712ioj.2.2020.09.22.09.04.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Sep 2020 09:04:53 -0700 (PDT)
Received: (nullmailer pid 2769164 invoked by uid 1000);
 Tue, 22 Sep 2020 16:04:52 -0000
Date: Tue, 22 Sep 2020 10:04:52 -0600
From: Rob Herring <robh@kernel.org>
To: Chunfeng Yun <chunfeng.yun@mediatek.com>
Subject: Re: [PATCH 2/4] dt-bindings: phy: convert phy-mtk-tphy.txt to YAML
 schema
Message-ID: <20200922160452.GA2768616@bogus>
References: <5af7c097d1c71a180d8ed1f1a44055859b42f1a0.1600760719.git.chunfeng.yun@mediatek.com>
 <33b4c569db10d983c7a9485a8bd6ec4efc0a1242.1600760719.git.chunfeng.yun@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <33b4c569db10d983c7a9485a8bd6ec4efc0a1242.1600760719.git.chunfeng.yun@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200922_120455_611191_22E0A4B3 
X-CRM114-Status: GOOD (  11.60  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Daniel Vetter <daniel@ffwll.ch>,
 devicetree@vger.kernel.org, David Airlie <airlied@linux.ie>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Kishon Vijay Abraham I <kishon@ti.com>, CK Hu <ck.hu@mediatek.com>,
 Vinod Koul <vkoul@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 linux-mediatek@lists.infradead.org, Philipp Zabel <p.zabel@pengutronix.de>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Stanley Chu <stanley.chu@mediatek.com>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Tue, 22 Sep 2020 15:55:06 +0800, Chunfeng Yun wrote:
> Convert phy-mtk-tphy.txt to YAML schema mediatek,tphy.yaml
> 
> Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
> ---
>  .../bindings/phy/mediatek,tphy.yaml           | 260 ++++++++++++++++++
>  .../devicetree/bindings/phy/phy-mtk-tphy.txt  | 162 -----------
>  2 files changed, 260 insertions(+), 162 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/phy/mediatek,tphy.yaml
>  delete mode 100644 Documentation/devicetree/bindings/phy/phy-mtk-tphy.txt
> 


My bot found errors running 'make dt_binding_check' on your patch:

/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/phy/mediatek,tphy.example.dt.yaml: t-phy@11290000: usb-phy@11290800:clocks: [[4294967295, 15]] is too short
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/phy/mediatek,tphy.yaml
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/phy/mediatek,tphy.example.dt.yaml: t-phy@11290000: usb-phy@11290800:clock-names: ['ref'] is too short
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/phy/mediatek,tphy.yaml
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/phy/mediatek,tphy.example.dt.yaml: t-phy@11290000: usb-phy@11290900:clocks: [[4294967295]] is too short
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/phy/mediatek,tphy.yaml
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/phy/mediatek,tphy.example.dt.yaml: t-phy@11290000: usb-phy@11290900:clock-names: ['ref'] is too short
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/phy/mediatek,tphy.yaml
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/phy/mediatek,tphy.example.dt.yaml: t-phy@11290000: usb-phy@11291000:clocks: [[4294967295, 15]] is too short
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/phy/mediatek,tphy.yaml
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/phy/mediatek,tphy.example.dt.yaml: t-phy@11290000: usb-phy@11291000:clock-names: ['ref'] is too short
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/phy/mediatek,tphy.yaml


See https://patchwork.ozlabs.org/patch/1368817

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure dt-schema is up to date:

pip3 install git+https://github.com/devicetree-org/dt-schema.git@master --upgrade

Please check and re-submit.


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
