Return-Path: <SRS0=iyt4=M5=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9C082C4338F
	for <linux-mediatek@archiver.kernel.org>; Fri,  6 Aug 2021 21:39:20 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4A3B461186
	for <linux-mediatek@archiver.kernel.org>; Fri,  6 Aug 2021 21:39:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 4A3B461186
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EtJcOoJmullqqo1wnCZTj1DKJxdu2InCqb94oupNRqw=; b=M3cJ2UPRAhrENW
	1FZ3e+5ThJ5B53YkPgPE+amK9G5wbDcC1uCwkfP94byjFH/po8JCRkPWz+YZn2mjkb2BSh/OzLTiY
	YYRzMRFx9VKFXJQ8xKyakwIk7A1W/Hl/Jy4HJT6tla3FW7uEClSAMn4rmIVw8nkGQomrSaZC1qgXe
	t9xlL8Yh0fnb4FPxZFx3Ct1VEnO2Ibfh51VszZNKy4dfeXmx6DK3uBynQfu8mV6x2WmGMC7gpHOFx
	XAwKQ/JGXnbHvPg3qjeuL4w8T51pTmrQof5A1lUJqio/awcLkSihY9xRsdDvT33TT16roj9LG9IDu
	YI2NMxVU+BpGwgXSAZAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mC7YZ-00DeQZ-DR; Fri, 06 Aug 2021 21:39:07 +0000
Received: from mail-io1-f51.google.com ([209.85.166.51])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mC7YX-00DePp-5D; Fri, 06 Aug 2021 21:39:06 +0000
Received: by mail-io1-f51.google.com with SMTP id m13so14154617iol.7;
 Fri, 06 Aug 2021 14:39:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=7de5tolBWZq18Zw+L/U81d1pEQY7EMCoZVERp/FRCDI=;
 b=MJkK5fQcv/mNq809qmujPmWsEycqVR0VtcUx+8/WTzwkGt/Cz71QBkyeqPdgvF7SaN
 LadMaKNXBvlreV5EKcOFCbpUxbUXyGzszC/RAJhl/AJyFIJv6mJLou0CDSyk6SVrPbZh
 SS4vbOlAVbhXsNAA373AimMEeFxV+jBuHI5BcpJKX/ljFVLp31HLqKFAb4En+zHPCf1g
 YLYHDGC0JaP0zYjNAqmSbVrvDBTcsKT+9hMjscILmHdmbIDjtrS0eJnfNuysEZQfoPRR
 9/HPrOPUbShdfSmQY5tWOkP1Cp5h6HPC+G79YFzmG8WGSEMeh29isruho2YdRxHFnp64
 KcBw==
X-Gm-Message-State: AOAM530Ydg40SxTdE18pizNpJ15zZEsh+SCgntURff8reQsKNY3pIjcc
 HGsUx6EkFYekQqKLHsbT3g==
X-Google-Smtp-Source: ABdhPJxTLbGslSUzO7Jkq47TbQYUHxhicw/Ad6Gy5IXySA7I7XS1Ra9f5bmquX4igCtvfeuiJxghCw==
X-Received: by 2002:a02:9082:: with SMTP id x2mr8076067jaf.44.1628285944257;
 Fri, 06 Aug 2021 14:39:04 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
 by smtp.gmail.com with ESMTPSA id k13sm4911260ilv.18.2021.08.06.14.39.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Aug 2021 14:39:03 -0700 (PDT)
Received: (nullmailer pid 1848297 invoked by uid 1000);
 Fri, 06 Aug 2021 21:39:01 -0000
Date: Fri, 6 Aug 2021 15:39:01 -0600
From: Rob Herring <robh@kernel.org>
To: Jitao Shi <jitao.shi@mediatek.com>
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Matthias Brugger <matthias.bgg@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, ck.hu@mediatek.com, stonea168@163.com,
 huijuan.xie@mediatek.com, rex-bc.chen@mediatek.com, shuijing.li@mediatek.com,
 devicetree@vger.kernel.org
Subject: Re: [PATCH v5 1/2] dt-bindings: drm/bridge: anx7625: add
 force_dsi_end_without_null
Message-ID: <YQ2r9ZJHLdiN5/BZ@robh.at.kernel.org>
References: <20210802010711.169080-1-jitao.shi@mediatek.com>
 <20210802010711.169080-2-jitao.shi@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210802010711.169080-2-jitao.shi@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210806_143905_266475_1AA07D7C 
X-CRM114-Status: GOOD (  15.98  )
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

On Mon, Aug 02, 2021 at 09:07:10AM +0800, Jitao Shi wrote:
> The force_dsi_end_without_null requires the dsi host ent at
> the same time in line.
> 
> Signed-off-by: Jitao Shi <jitao.shi@mediatek.com>
> ---
>  .../bindings/display/bridge/analogix,anx7625.yaml           | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/display/bridge/analogix,anx7625.yaml b/Documentation/devicetree/bindings/display/bridge/analogix,anx7625.yaml
> index ab48ab2f4240..8b868a6a3d60 100644
> --- a/Documentation/devicetree/bindings/display/bridge/analogix,anx7625.yaml
> +++ b/Documentation/devicetree/bindings/display/bridge/analogix,anx7625.yaml
> @@ -43,6 +43,11 @@ properties:
>    vdd33-supply:
>      description: Regulator that provides the supply 3.3V power.
>  
> +  force_dsi_end_without_null:
> +    description: |
> +      Requires the dsi host send the dsi packets on all lanes aligned
> +      at the end.

Can't this be implied from the compatible string if it is a property of 
this chip? 


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
