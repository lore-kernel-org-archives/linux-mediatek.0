Return-Path: <SRS0=UXZI=AU=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D872BC433E0
	for <linux-mediatek@archiver.kernel.org>; Thu,  9 Jul 2020 17:01:53 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A5FE02078B
	for <linux-mediatek@archiver.kernel.org>; Thu,  9 Jul 2020 17:01:53 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="NE7ztxLP"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A5FE02078B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=8UtkbPKFf2APQllrpL1i1PkSw9PSjIoyo0TKwfNmHdI=; b=NE7ztxLPx95OPcq6rl7ZyRHuG
	TGgsdpOhz7TfiA71WGzKHHIjdoQpwoMC3UjYDyiwo1FWQa1ET8ugBvlFOYLCoCv6CJPSArLXyToS2
	aVtu4jGOkqcskzCMuQ+ln7w28x82n0lUsBJRO9vyXs867Htr4alYQW9gRBUaAbTMHjMnaSUttzVUw
	sNKYefUptLHNNMbHA0StvDrK3qPmLbrlDya5gUcZ25u7NVItbzeYNZ6tyubtZt+LFb29TOdGEflE3
	l+p1Uy7J0aAs47NZxnk3Xa98bQJc8v8Sztz90pzSa4PdEtGrht+oueqLDiUc0QCRLi4TB8JEyByRJ
	heHd0L7cw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jtZvb-0001Qz-2I; Thu, 09 Jul 2020 17:01:43 +0000
Received: from mail-io1-f67.google.com ([209.85.166.67])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jtZvZ-0001Pu-6V; Thu, 09 Jul 2020 17:01:42 +0000
Received: by mail-io1-f67.google.com with SMTP id o5so3047443iow.8;
 Thu, 09 Jul 2020 10:01:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=Er3giFzIWiCqOJU/xU45i9/BHu6SeSgH1xHICv5tCwU=;
 b=DEkqex0GNJf9zV/keKnXGLbmA0qRhA2rYaEJuv6XgvzVR7Vqgicdh9bsdYsVXGa7lf
 payrlPXFLzI/RvIgB4xpDBaCgqVJsvD6d0RI9z2jZF19UulDhz/t2D64U5vV1egGpojE
 JBl2ci8zY4pSFsqwZaKxvrARy9euExWsRFAljL77BisSwRX50qtndBjcdVgB78jYsm0Q
 bfjoUI3DHELnXPaiZDcD+am6Hq/4y5dq5RdxEo0FTPhxlePiWNuQ95t6o8c/g8NMM36b
 gTl13YCmsQB06XMkzyuNwrkfnSpbldV2yT+/OMPl/NAO/e64RFvDVdyinj1K1a3Rg0Cx
 FbGQ==
X-Gm-Message-State: AOAM533od9uKUG4GN50PopoIuJcOrbQJo9i27ZVBpKzm45GUem2DcR6Q
 vlKXBZ8r3W54zNIGMqmFVQ==
X-Google-Smtp-Source: ABdhPJxK2ErXCvsSoquRPWJojKNCsb574lsT1sbXYS2wzkcsb5QNVYolVx6d5J3+bn2mqZD8MIG2Cw==
X-Received: by 2002:a05:6638:22d2:: with SMTP id
 j18mr36358763jat.55.1594314100341; 
 Thu, 09 Jul 2020 10:01:40 -0700 (PDT)
Received: from xps15 ([64.188.179.254])
 by smtp.gmail.com with ESMTPSA id t12sm2122551ilo.80.2020.07.09.10.01.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Jul 2020 10:01:39 -0700 (PDT)
Received: (nullmailer pid 519812 invoked by uid 1000);
 Thu, 09 Jul 2020 17:01:38 -0000
Date: Thu, 9 Jul 2020 11:01:38 -0600
From: Rob Herring <robh@kernel.org>
To: Louis Kuo <louis.kuo@mediatek.com>
Subject: Re: [RFC PATCH V7 2/3] dt-bindings: mt8183: Add sensor interface
 dt-bindings
Message-ID: <20200709170138.GA519166@bogus>
References: <20200708104023.3225-1-louis.kuo@mediatek.com>
 <20200708104023.3225-3-louis.kuo@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200708104023.3225-3-louis.kuo@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200709_130141_397510_D308E494 
X-CRM114-Status: GOOD (  11.97  )
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
Cc: devicetree@vger.kernel.org, Sean.Cheng@mediatek.com, mchehab@kernel.org,
 srv_heupstream@mediatek.com, linux-mediatek@lists.infradead.org,
 Jerry-ch.Chen@mediatek.com, tfiga@chromium.org, keiichiw@chromium.org,
 jungo.lin@mediatek.com, sj.huang@mediatek.com, yuzhao@chromium.org,
 christie.yu@mediatek.com, zwisler@chromium.org, matthias.bgg@gmail.com,
 hans.verkuil@cisco.com, frederic.chen@mediatek.com,
 laurent.pinchart+renesas@ideasonboard.com,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Wed, 08 Jul 2020 18:40:22 +0800, Louis Kuo wrote:
> This patch adds the DT binding documentation for the sensor interface
> module in Mediatek SoCs.
> 
> Signed-off-by: Louis Kuo <louis.kuo@mediatek.com>
> ---
>  .../bindings/media/mediatek-seninf.yaml       | 223 ++++++++++++++++++
>  1 file changed, 223 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/media/mediatek-seninf.yaml
> 


My bot found errors running 'make dt_binding_check' on your patch:

Documentation/devicetree/bindings/media/mediatek-seninf.example.dts:23:18: fatal error: dt-bindings/power/mt8183-power.h: No such file or directory
         #include <dt-bindings/power/mt8183-power.h>
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
compilation terminated.
scripts/Makefile.lib:315: recipe for target 'Documentation/devicetree/bindings/media/mediatek-seninf.example.dt.yaml' failed
make[1]: *** [Documentation/devicetree/bindings/media/mediatek-seninf.example.dt.yaml] Error 1
make[1]: *** Waiting for unfinished jobs....
Makefile:1347: recipe for target 'dt_binding_check' failed
make: *** [dt_binding_check] Error 2


See https://patchwork.ozlabs.org/patch/1325155

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure dt-schema is up to date:

pip3 install git+https://github.com/devicetree-org/dt-schema.git@master --upgrade

Please check and re-submit.


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
