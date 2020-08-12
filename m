Return-Path: <SRS0=Jt7l=BW=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E5AE9C433E0
	for <linux-mediatek@archiver.kernel.org>; Wed, 12 Aug 2020 16:55:30 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B2EC7206C3
	for <linux-mediatek@archiver.kernel.org>; Wed, 12 Aug 2020 16:55:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="W39yJOfU"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B2EC7206C3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=t2NjmYL2WNlcbrZXq91FADAuGhzkk2XMZFHi5kQ965w=; b=W39yJOfUYX6GT1r6N+tNPtNFC
	S2Y9tLfZiODnsqe4j71LcGQ/Dhu7bl3i/2wF70wo8RF58DeK9KD1u3zFFhkMih4nnGMXVd261fSCI
	fug0GE7O1yqpVIkRDiT9KylTpfT0KeV1I8RaoPIVE365beh+DYHsH9CddjLesdJw5OhPfupYcEClr
	Cn33h4Kh5Ky+XRtDcbtCm26gwJmHzEBYI6m6TGJnP+v1NQA+9SfeATG10tAmFgMjKP12T3MjSRV1b
	0KnXoUdan7oJNEVEDBuaFBEkQdJXyYMrLrp85mb0TnCfbuMwlOwoHBvGe/PWAGpzzdl/rlyKgY5nb
	NvW3XO9vg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k5u25-0004G2-Ll; Wed, 12 Aug 2020 16:55:21 +0000
Received: from mail-io1-f66.google.com ([209.85.166.66])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k5u1t-00049B-Bx; Wed, 12 Aug 2020 16:55:10 +0000
Received: by mail-io1-f66.google.com with SMTP id j8so3516276ioe.9;
 Wed, 12 Aug 2020 09:55:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=OnKPv+qr/0SKiO3J0pJxrPNLJqM+U78LQKFRagi2BS8=;
 b=oKE+8pzwEPZd8g7naXW8MZpGgaL55brPV2w2tjBhsvT2uipNXwuJkEIUbDM3Oq/QyU
 KunaqKDVpy6Rkhi2UNUi7MxdRM8e5koEAyX4HwXoLjbdWvFfFDgIpaLgQDryTw4rN4Qh
 t7olrs1nHZIF7PAE9R6GgSlvo2w4UF9ltNRp3gTH2W9JKyWl3kariILzaiVki0iAXbL/
 H7bNqE48C0KvWH9k2kKr6YOpYW+kOeonTKVCmEaBrmhHRGz4/0HT1GTJfE6cgEqKYAGM
 wbZIQMgW/J1xLS7mhydxp+jzhpNCeiYR4xwQ194MY///1GcZoklRfBflpw5t7JsmwG02
 LPlA==
X-Gm-Message-State: AOAM531KlvP/OC8nJYSXaaHFL/Q5o9NRW8/S7T1NNlv+TfsrnFWdG5t4
 /D0MV5Hsxfm0HY3uHYbamw==
X-Google-Smtp-Source: ABdhPJwYwyFOnVugtnOVfg8AgmEVYg3C6rf+Hwcjg8rs7FalCUYOI3v0RNnferAdv8WDFYik34UcAQ==
X-Received: by 2002:a6b:7e41:: with SMTP id k1mr718192ioq.130.1597251308230;
 Wed, 12 Aug 2020 09:55:08 -0700 (PDT)
Received: from xps15 ([64.188.179.248])
 by smtp.gmail.com with ESMTPSA id a9sm1236374iol.9.2020.08.12.09.55.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 Aug 2020 09:55:07 -0700 (PDT)
Received: (nullmailer pid 2363799 invoked by uid 1000);
 Wed, 12 Aug 2020 16:55:04 -0000
Date: Wed, 12 Aug 2020 10:55:04 -0600
From: Rob Herring <robh@kernel.org>
To: Yongqiang Niu <yongqiang.niu@mediatek.com>
Subject: Re: [RESEND v7, PATCH 1/7] dt-bindings: mediatek: add rdma_fifo_size
 description for mt8183 display
Message-ID: <20200812165504.GA2361465@bogus>
References: <1596855231-5782-1-git-send-email-yongqiang.niu@mediatek.com>
 <1596855231-5782-2-git-send-email-yongqiang.niu@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1596855231-5782-2-git-send-email-yongqiang.niu@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200812_125509_793574_DAE82EFE 
X-CRM114-Status: GOOD (  17.40  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@linux.ie>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Matthias Brugger <matthias.bgg@gmail.com>, linux-mediatek@lists.infradead.org,
 Daniel Vetter <daniel@ffwll.ch>, CK Hu <ck.hu@mediatek.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Sat, Aug 08, 2020 at 10:53:45AM +0800, Yongqiang Niu wrote:
> rdma fifo size may be different even in same SOC, add this
> property to the corresponding rdma
> 
> Change-Id: I67635ec7f3f59cf4cbc7737285e5e28ff0ab71c9
> Signed-off-by: Yongqiang Niu <yongqiang.niu@mediatek.com>
> ---
>  .../devicetree/bindings/display/mediatek/mediatek,disp.txt | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,disp.txt b/Documentation/devicetree/bindings/display/mediatek/mediatek,disp.txt
> index b91e709..e6bbe32 100644
> --- a/Documentation/devicetree/bindings/display/mediatek/mediatek,disp.txt
> +++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,disp.txt
> @@ -66,6 +66,11 @@ Required properties (DMA function blocks):
>    argument, see Documentation/devicetree/bindings/iommu/mediatek,iommu.txt
>    for details.
>  
> +Optional properties (RDMA function blocks):
> +- mediatek,rdma_fifo_size: rdma fifo size may be different even in same SOC, add this

mediatek,rdma-fifo-size

What's the range/set of valid values?

> +  property to the corresponding rdma
> +  the value is the Max value which defined in hardware data sheet.
> +
>  Examples:
>  
>  mmsys: clock-controller@14000000 {
> @@ -207,3 +212,12 @@ od@14023000 {
>  	power-domains = <&scpsys MT8173_POWER_DOMAIN_MM>;
>  	clocks = <&mmsys CLK_MM_DISP_OD>;
>  };
> +
> +rdma1: rdma@1400c000 {

Does a new property really need a whole new example?

> +	compatible = "mediatek,mt8183-disp-rdma";
> +	reg = <0 0x1400c000 0 0x1000>;
> +	interrupts = <GIC_SPI 229 IRQ_TYPE_LEVEL_LOW>;
> +	power-domains = <&scpsys MT8183_POWER_DOMAIN_DISP>;
> +	clocks = <&mmsys CLK_MM_DISP_RDMA1>;
> +	mediatek,rdma_fifo_size = <2048>;
> +};
> -- 
> 1.8.1.1.dirty

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
