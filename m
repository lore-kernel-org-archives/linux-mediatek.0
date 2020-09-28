Return-Path: <SRS0=uRRy=DF=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CEDFFC4741F
	for <linux-mediatek@archiver.kernel.org>; Mon, 28 Sep 2020 18:13:36 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 65D7E2074F
	for <linux-mediatek@archiver.kernel.org>; Mon, 28 Sep 2020 18:13:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="yDKFKow0"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 65D7E2074F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=oOXj80wN/urNSoX4qAYhY+pQtMVb+u0XVrvQ2HxhjKc=; b=yDKFKow06fEhDKE8A3jqs+VYi
	6uizEOOxARRGW7Xc03HvzSvhTumdOIv1F7aU1o9oxjlcz7SEFz5UGhiH7pfcLQhuic1gbS/q47LoS
	Fk7H0a4rJEoLlQABXTdPJrW7LSpynrv2ud1aoKApqDBGHBeqZPIHoCAJAq/3x9lfaPNfhsBXW7dxl
	ajnjm8IlxhROUvBKvpfUWk9YywIXb5lLAsiRaX4LrRhcCCczhUa3BC8J8RzX39wDZsFY8aq9o97cj
	oGpAQhmi00NC3TdAW6CUaRwL+jMxRXQzt8wj79MIosRd2xvx6F4qQB8Xx90Z6c00tSw7Fs4VekLpF
	5imVeDUiA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kMxeR-00050H-KP; Mon, 28 Sep 2020 18:13:27 +0000
Received: from mail-oi1-f193.google.com ([209.85.167.193])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kMxeO-0004z6-Vn; Mon, 28 Sep 2020 18:13:25 +0000
Received: by mail-oi1-f193.google.com with SMTP id v20so2376952oiv.3;
 Mon, 28 Sep 2020 11:13:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=j+LFT48gOou1aJ5G0tYx1NAUVZxA2ojMKFiWctiBnaU=;
 b=TGg8Pi9//O34tNJos0oJjXMvZu8+291ClJJzeZGdbnhMBAm7xiV14QV7bnTxMTbHcW
 aR2SaaU7Hr4U6t2XHxcVDtKrV+ymTcTgepRTQlRabuVNp2Y/GU/DAbr6zNe6PvWUnFtb
 My1YJT+rmDsPxRKgYyS6c0oOfOA7QMX3lXh6+PhhLHU+BjSoCC0/6ZdbK/NJm3xeXgih
 QXEDKg7GI4Hs2kqkywq4xPbylE/o1OKg6slHzmKuEdUhuejPaqkhPqVRIgJa+VY4J/2s
 WJ5gIU+UjrLeQn6On5jfXrwcCycI0J6AJEtXtlFLKiU4VAce1StoU/v/exkaUUe+rh9S
 pfng==
X-Gm-Message-State: AOAM5312IDfWapCQT+E8y8XkMAGBQ6QhzmpVkm86CYnSvGECxt2eGeQc
 B5gWGC7STodAuIV1Zjl4Uw==
X-Google-Smtp-Source: ABdhPJwmgv/JxdRzTCDQS3v+z01Q7Pike00GyRAyHYYYWnAo2d7N+bIui+ITe3SOcZhZeqE+D+tIEQ==
X-Received: by 2002:a05:6808:ab5:: with SMTP id r21mr86166oij.25.1601316804232; 
 Mon, 28 Sep 2020 11:13:24 -0700 (PDT)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id i7sm394881oto.62.2020.09.28.11.13.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Sep 2020 11:13:23 -0700 (PDT)
Received: (nullmailer pid 3012736 invoked by uid 1000);
 Mon, 28 Sep 2020 18:13:23 -0000
Date: Mon, 28 Sep 2020 13:13:23 -0500
From: Rob Herring <robh@kernel.org>
To: Chunfeng Yun <chunfeng.yun@mediatek.com>
Subject: Re: [PATCH] dt-bindings: usb: add properties for hard wired devices
Message-ID: <20200928181323.GA3012372@bogus>
References: <20200928063950.64722-1-chunfeng.yun@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200928063950.64722-1-chunfeng.yun@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200928_141325_049680_7DE17062 
X-CRM114-Status: GOOD (  11.95  )
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
Cc: devicetree@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Mon, 28 Sep 2020 14:39:50 +0800, Chunfeng Yun wrote:
> Add some optional properties which are needed for hard wired devices
> 
> Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
> ---
>  Documentation/devicetree/bindings/usb/usb-hcd.yaml | 11 +++++++++++
>  1 file changed, 11 insertions(+)
> 


My bot found errors running 'make dt_binding_check' on your patch:

/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/usb/qcom,dwc3.example.dt.yaml: usb@a6f8800: #address-cells:0:0: 1 was expected
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/usb/usb-hcd.yaml
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/usb/qcom,dwc3.example.dt.yaml: usb@a6f8800: #size-cells:0:0: 0 was expected
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/usb/usb-hcd.yaml
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/usb/amlogic,meson-g12a-usb-ctrl.example.dt.yaml: usb@ffe09000: #size-cells:0:0: 0 was expected
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/usb/usb-hcd.yaml
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/phy/socionext,uniphier-usb3ss-phy.example.dt.yaml: usb-glue@65b00000: #size-cells:0:0: 0 was expected
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/usb/usb-hcd.yaml
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/phy/socionext,uniphier-usb3hs-phy.example.dt.yaml: usb-glue@65b00000: #size-cells:0:0: 0 was expected
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/usb/usb-hcd.yaml


See https://patchwork.ozlabs.org/patch/1372394

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure dt-schema is up to date:

pip3 install git+https://github.com/devicetree-org/dt-schema.git@master --upgrade

Please check and re-submit.


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
