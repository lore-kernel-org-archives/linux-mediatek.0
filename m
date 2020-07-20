Return-Path: <SRS0=A+tK=A7=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DB7FBC433E4
	for <linux-mediatek@archiver.kernel.org>; Mon, 20 Jul 2020 22:59:15 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A5EF8207FC
	for <linux-mediatek@archiver.kernel.org>; Mon, 20 Jul 2020 22:59:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="TDOfnuxK"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A5EF8207FC
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=mdrVYE6y4B9LPaxi+FFSeC3+OH6Lgd7+z/XRpFHnMFA=; b=TDOfnuxKvXkbITk7x013mWMxT
	vdgVqb9MloWStrLcafFCNvgd+grNenXl4pEuBfDC16lj/F71zHA5eMoV+VvZNx5Ad3bAmnDbMl8W4
	+1k4wCZsUxOOQfRSFdR0qLVAstXMpi9dyX4L8GuUic23kWC/pS0AuBRQUtnBtHrBW/A6IpCXo+SNZ
	nA8WscSGsV9p25E6lNqZ00rM/IsleWUystduKkhn+rAPA1KGmXIKerv0OYBtW+k3r9iunZc5O1gAO
	gs1N/7Vnne/i3yBjq5znPpfQAdsF++VsmanxwAYLVl7LkuSD96dMSpJELEqZ9Za/87jAYvXWnNswl
	mobSMSx1g==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jxekR-0006WS-Co; Mon, 20 Jul 2020 22:59:03 +0000
Received: from mail-io1-f67.google.com ([209.85.166.67])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jxekP-0006Vu-F6; Mon, 20 Jul 2020 22:59:02 +0000
Received: by mail-io1-f67.google.com with SMTP id d18so19398434ion.0;
 Mon, 20 Jul 2020 15:59:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=AqV3qpi0FGYhyxxFKRbye9k2fummzEc60BukPe/XJ8Y=;
 b=OD3ql4+hlPH7DyxTVsUaY7mqLQzYfqsTANpyFlD97XnsCl1KHD8b5fm4NRtbzqYgbp
 FmtvXZr/jxFP5B4uJtDEc8C5rAMkiS6/JJWhp1NCTtTXD0kuFnG8VptpxMuSOF7sm2lw
 tFo0CNnyXelYbNjbM9SHTRwxUvMEWGkDRiYYSG4X+Gw4yGTMOLDcB2+oTPXvEPvECHs7
 iEIhry42Ks33FhWOMXJlKHjC0j3Z8IbftbxGDJm176gaiKwjFAKSJlHQiYn1oZDf+Aj2
 17AxkyKE9WcOh1YgVPWedQH+mqdJNziTZ1XbZXCMsSAB5/DWyzj3BstuUgB+JRVJO5LV
 /ASg==
X-Gm-Message-State: AOAM5308kH3FLlWFdahJfLfk3hUXI+hLYcXXZyJ7EjiEJmMqf0JrPjnn
 kExFleHGvGLMoQd703gArOt5pxBPLA==
X-Google-Smtp-Source: ABdhPJyo2Hp5eLauB8HQjo3cnKWrGzjaOFfQckHGVee5U7GvWwSQW2q4MVMOF13cNUie2SuBdIrSfA==
X-Received: by 2002:a02:5b83:: with SMTP id g125mr28527695jab.91.1595285940732; 
 Mon, 20 Jul 2020 15:59:00 -0700 (PDT)
Received: from xps15 ([64.188.179.252])
 by smtp.gmail.com with ESMTPSA id f9sm9522979ilq.9.2020.07.20.15.58.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Jul 2020 15:58:59 -0700 (PDT)
Received: (nullmailer pid 3105685 invoked by uid 1000);
 Mon, 20 Jul 2020 22:58:56 -0000
Date: Mon, 20 Jul 2020 16:58:56 -0600
From: Rob Herring <robh@kernel.org>
To: Yong Wu <yong.wu@mediatek.com>
Subject: Re: [PATCH 01/21] dt-binding: memory: mediatek: Add a common
 larb-port header file
Message-ID: <20200720225856.GA3105636@bogus>
References: <20200711064846.16007-1-yong.wu@mediatek.com>
 <20200711064846.16007-2-yong.wu@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200711064846.16007-2-yong.wu@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200720_185901_519851_028605D1 
X-CRM114-Status: UNSURE (   9.77  )
X-CRM114-Notice: Please train this message.
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
Cc: anan.sun@mediatek.com, devicetree@vger.kernel.org,
 Nicolas Boichat <drinkcat@chromium.org>, cui.zhang@mediatek.com,
 srv_heupstream@mediatek.com, Tomasz Figa <tfiga@google.com>,
 Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>,
 youlin.pei@mediatek.com, linux-kernel@vger.kernel.org,
 Evan Green <evgreen@chromium.org>, chao.hao@mediatek.com,
 iommu@lists.linux-foundation.org, Rob Herring <robh+dt@kernel.org>,
 linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>,
 ming-fan.chen@mediatek.com, Will Deacon <will@kernel.org>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Sat, 11 Jul 2020 14:48:26 +0800, Yong Wu wrote:
> Put all the macros about smi larb/port togethers, this is a preparing
> patch for extending LARB_NR and adding new dom-id support.
> 
> Signed-off-by: Yong Wu <yong.wu@mediatek.com>
> ---
>  include/dt-bindings/memory/mt2712-larb-port.h  |  2 +-
>  include/dt-bindings/memory/mt6779-larb-port.h  |  2 +-
>  include/dt-bindings/memory/mt8173-larb-port.h  |  2 +-
>  include/dt-bindings/memory/mt8183-larb-port.h  |  2 +-
>  include/dt-bindings/memory/mtk-smi-larb-port.h | 15 +++++++++++++++
>  5 files changed, 19 insertions(+), 4 deletions(-)
>  create mode 100644 include/dt-bindings/memory/mtk-smi-larb-port.h
> 

Acked-by: Rob Herring <robh@kernel.org>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
