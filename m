Return-Path: <SRS0=564r=DU=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 262ABC433DF
	for <linux-mediatek@archiver.kernel.org>; Tue, 13 Oct 2020 12:50:02 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B625722510
	for <linux-mediatek@archiver.kernel.org>; Tue, 13 Oct 2020 12:50:01 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="C8sb10so"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B625722510
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=DVP76N3ob6CqahGPsd9WCS0nzhVzW+kIVVDtDGEc998=; b=C8sb10soiHFSyGVpcHNHNeX8E
	mitLMgeLldjXFXgl6VOdu4ATWd1F7TA+TdNXq9JS3eMYpInWmE1QPRWSH7IlGGg1se8gQ92uJ5Io8
	gwx3OAH9CtuM5goSOWEKI+3YnI0tu7esLbgg3rXxh6wP+OfKzuU9a2R1rMn8Ip3rek76J9+8OdrAY
	1izMADpGmuB8N8TkP+8KLlzwurr0KQePR7acl5TW00pbf6EPv6Rb+hT7UgAui4g+Xj+qWoXSb5qA/
	DBBq95hBWVIqF5oM8Hf5HHvitvR8Qa3qI05sorbhHkSdNO8v/izJYO+MWNpJSUW216D7oYi2DWJsw
	7TkOANJrA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kSJkX-0007qb-LL; Tue, 13 Oct 2020 12:49:53 +0000
Received: from mail-oi1-f194.google.com ([209.85.167.194])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kSJkT-0007pO-GB; Tue, 13 Oct 2020 12:49:50 +0000
Received: by mail-oi1-f194.google.com with SMTP id s81so9948839oie.13;
 Tue, 13 Oct 2020 05:49:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=h+4lx1NmWtXfOrC3rFHXIicegWjQFHB1Qz6MGdDJkro=;
 b=LYdhVmoHCLy2E4/6Dwe3aTnuSk/v1woAASXY6yOwa2USaj8X5OS/3puQ/En+hRDSmx
 rl9Lz8cygPIUFyLdzzuJb0aTwf4wj+PpTzCUiGCC8MFrpQi+BndCr3ce2igPyPIgx8lW
 FWv79bWctnYmJwrBlCmue9qpU0IJrkco6HIwGt8+2x70EL8XsuhL4LFmJFnwQEEJJ+Dh
 fSeCEXac5O+MWXmrkfQrgD7zwocmskREWtRHw3IQPTIkLINdAvcw1dt+ODekaF3Slk0u
 4Ezr9kOt/ex68xNNeLiqa+KebwongcFi2FDeGQ7GG3seXSMUf/Wn1ALFXoAJ3s6bIVcr
 V6Nw==
X-Gm-Message-State: AOAM531QX85oRVdpcFAW/3sKQUvzuofm2rhtmErW4buXDY5f3n1xO0Tm
 G+h66Wf4HFmC2wCQFa5HfA==
X-Google-Smtp-Source: ABdhPJzzBhpFlOx96qHNV3x8rQzmHhlP80ozoqo1sj8XLzaIjsAHsnPOnKQvXA/PKTfjxDJM1j/OZA==
X-Received: by 2002:a05:6808:f:: with SMTP id u15mr6766651oic.34.1602593388830; 
 Tue, 13 Oct 2020 05:49:48 -0700 (PDT)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id a192sm7632544ooc.12.2020.10.13.05.49.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Oct 2020 05:49:47 -0700 (PDT)
Received: (nullmailer pid 3322788 invoked by uid 1000);
 Tue, 13 Oct 2020 12:49:46 -0000
Date: Tue, 13 Oct 2020 07:49:46 -0500
From: Rob Herring <robh@kernel.org>
To: Chunfeng Yun <chunfeng.yun@mediatek.com>
Subject: Re: [PATCH v2 7/8] dt-bindings: usb: convert mediatek,mtu3.txt to
 YAML schema
Message-ID: <20201013124946.GA3322281@bogus>
References: <20201013085207.17749-1-chunfeng.yun@mediatek.com>
 <20201013085207.17749-7-chunfeng.yun@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201013085207.17749-7-chunfeng.yun@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201013_084949_554809_3811DD25 
X-CRM114-Status: GOOD (  13.30  )
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
Cc: devicetree@vger.kernel.org, Min Guo <min.guo@mediatek.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, David Airlie <airlied@linux.ie>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Kishon Vijay Abraham I <kishon@ti.com>,
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 Vinod Koul <vkoul@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 linux-mediatek@lists.infradead.org, Philipp Zabel <p.zabel@pengutronix.de>,
 CK Hu <ck.hu@mediatek.com>, Daniel Vetter <daniel@ffwll.ch>,
 Stanley Chu <stanley.chu@mediatek.com>,
 "David S . Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Tue, 13 Oct 2020 16:52:06 +0800, Chunfeng Yun wrote:
> Convert mediatek,mtu3.txt to YAML schema mediatek,mtu3.yaml
> 
> Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
> ---
> v2: new patch
> ---
>  .../devicetree/bindings/usb/mediatek,mtu3.txt | 108 ---------
>  .../bindings/usb/mediatek,mtu3.yaml           | 227 ++++++++++++++++++
>  2 files changed, 227 insertions(+), 108 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/usb/mediatek,mtu3.txt
>  create mode 100644 Documentation/devicetree/bindings/usb/mediatek,mtu3.yaml
> 


My bot found errors running 'make dt_binding_check' on your patch:

/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/phy/mediatek,tphy.example.dt.yaml: usb@11271000: compatible: ['mediatek,mt8173-mtu3'] is too short
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/usb/mediatek,mtu3.yaml
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/phy/mediatek,tphy.example.dt.yaml: usb@11271000: 'clocks' is a required property
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/usb/mediatek,mtu3.yaml
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/phy/mediatek,tphy.example.dt.yaml: usb@11271000: 'clock-names' is a required property
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/usb/mediatek,mtu3.yaml


See https://patchwork.ozlabs.org/patch/1381414

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure dt-schema is up to date:

pip3 install git+https://github.com/devicetree-org/dt-schema.git@master --upgrade

Please check and re-submit.


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
