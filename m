Return-Path: <SRS0=cvih=CU=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 96268C43461
	for <linux-mediatek@archiver.kernel.org>; Fri, 11 Sep 2020 22:51:36 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 49377221EB
	for <linux-mediatek@archiver.kernel.org>; Fri, 11 Sep 2020 22:51:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="AZ4kuOkS"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 49377221EB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=ld92C8bovf1ZFzNdFtscv71AcjRJayd9JbA2iO7ToJk=; b=AZ4kuOkSph6oKMsg2MtKwSaWO
	0bOoOjbMwXP7H5sVjWDKmVef4Db799cIo1HqcQY1JcNDgW9v8iErlY9WLUGtJtceFUg+op4bh9zMp
	DbO9A6yrSdwfUhhU4wiiKurqTcio6rBBOHuDYWjeJxJPszD9QdUoUsMfNRQjw3tbjXzhJVLaqlQCM
	/+SeHJ4Hacrtug03RjNPxDVd56+DW/PyAQA4GE6/0F9YFXxIuxCLUNjwlOpfeuL+fE7M1oIC1EOzq
	HpDUdRmjSkb7CmEwfRJMAXorqmu3GbO8ezkEhgeZbmZpqUt0IGCQ9/qVDic+tJCgM25xanE8UoiT9
	rsEZ4ocBA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kGrt9-00033c-Qo; Fri, 11 Sep 2020 22:51:27 +0000
Received: from mail-io1-f68.google.com ([209.85.166.68])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kGrt7-00032g-Hi; Fri, 11 Sep 2020 22:51:26 +0000
Received: by mail-io1-f68.google.com with SMTP id u126so12720409iod.12;
 Fri, 11 Sep 2020 15:51:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=9Ng98r0s3IYBx30DbWemt+5szNOjQi0PNbtlqmUkOt4=;
 b=L0qphDb0r2vtXU2kVHAkHVv0Dfpmqa1sglUYMjz3833iHifJ/yH6WDCQnhhOp2niAG
 iw6i1BQHIY8a8r2LgpXG7IFSKsk56mR3HT0l53QxU5sWH46M6JpS18wwvb5AZ8+5GI4H
 fQDjXLFE3E5lx5Fm3DNWt+zYNgIwlIzv4ioMGvHsw1E4nYMS5mIR+L6NB1WczPajF27P
 M+NL6mSIE8xUFp0FhPMzTyVJtIgkXyRMLrumUjIYNuZkwD66U3Qp/laGlHlxH5j+BauI
 MHZiW3eQmR2lGvyvz916n17DQ1KhDN+WA02MAI8xJgYIqEzQ6FxHiC2tkZJ7EM7PRkdm
 B3/Q==
X-Gm-Message-State: AOAM531CNIqwGdvCj6uTeA6ILvoippsGbGyUYZ7AsahvbO0XyvWw7FLg
 qbGuBHvFEpBT1wf28EjjVw==
X-Google-Smtp-Source: ABdhPJw43vAdQMw25cb0xfy5r2u6fEhFJWSnw9/2LWINeJsHOzMJS4pUAJ3cfIPeKCFu06Urykv/nQ==
X-Received: by 2002:a05:6602:2d55:: with SMTP id
 d21mr3515735iow.134.1599864684937; 
 Fri, 11 Sep 2020 15:51:24 -0700 (PDT)
Received: from xps15 ([64.188.179.251])
 by smtp.gmail.com with ESMTPSA id r11sm1989416ilt.76.2020.09.11.15.51.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Sep 2020 15:51:24 -0700 (PDT)
Received: (nullmailer pid 2967511 invoked by uid 1000);
 Fri, 11 Sep 2020 22:51:23 -0000
Date: Fri, 11 Sep 2020 16:51:23 -0600
From: Rob Herring <robh@kernel.org>
To: Alexandre Bailon <abailon@baylibre.com>
Subject: Re: [PATCH v2 1/4] dt bindings: remoteproc: Add bindings for MT8183
 APU
Message-ID: <20200911225123.GA2966686@bogus>
References: <20200910130148.8734-1-abailon@baylibre.com>
 <20200910130148.8734-2-abailon@baylibre.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200910130148.8734-2-abailon@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200911_185125_588496_6D9622C2 
X-CRM114-Status: GOOD (  13.25  )
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
Cc: ohad@wizery.com, devicetree@vger.kernel.org,
 stephane.leprovost@mediatek.com, mathieu.poirier@linaro.org,
 linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
 bjorn.andersson@linaro.org, gpain@baylibre.com, robh+dt@kernel.org,
 linux-mediatek@lists.infradead.org, matthias.bgg@gmail.com,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Thu, 10 Sep 2020 15:01:45 +0200, Alexandre Bailon wrote:
> This adds dt bindings for the APU present in the MT8183.
> 
> Signed-off-by: Alexandre Bailon <abailon@baylibre.com>
> ---
>  .../bindings/remoteproc/mtk,apu.yaml          | 107 ++++++++++++++++++
>  1 file changed, 107 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/remoteproc/mtk,apu.yaml
> 


My bot found errors running 'make dt_binding_check' on your patch:

Documentation/devicetree/bindings/remoteproc/mtk,apu.example.dts:22:18: fatal error: dt-bindings/power/mt8183-power.h: No such file or directory
   22 |         #include <dt-bindings/power/mt8183-power.h>
      |                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
compilation terminated.
make[1]: *** [scripts/Makefile.lib:342: Documentation/devicetree/bindings/remoteproc/mtk,apu.example.dt.yaml] Error 1
make[1]: *** Waiting for unfinished jobs....
make: *** [Makefile:1366: dt_binding_check] Error 2


See https://patchwork.ozlabs.org/patch/1362090

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure dt-schema is up to date:

pip3 install git+https://github.com/devicetree-org/dt-schema.git@master --upgrade

Please check and re-submit.


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
