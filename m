Return-Path: <SRS0=cyKo=BC=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EE0FBC433E3
	for <linux-mediatek@archiver.kernel.org>; Thu, 23 Jul 2020 17:00:09 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BAA2F20792
	for <linux-mediatek@archiver.kernel.org>; Thu, 23 Jul 2020 17:00:09 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="W6MFIaBR"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BAA2F20792
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=+TRJUhiEmzQBs+fzds+YFWCwrNSWHFHZ3UpTLbUh61U=; b=W6MFIaBR1wY0FZhO6pUW+LviO
	ReHCG0ctu2YnlUI8B5GT/huvT9s5ntPDPsoHmTiG9i8ntAQP21sGDF+qgHlST4ipas5VoBzTPdFZb
	u6gCNmNkNXjQ+eTSpIJevqHZyXRO/dYBhezXgo5w9S7HWx5Rym6tCpK92ZK8jlpEHJQEenMReIChU
	CXuRcH8cBAHcFZybajCTL8yho1MCcSFPzIBk1xmJ4q5/oquoQB9dm3/axPHdydMae87vH7HXpO6jW
	+rwE0bVHpiQKlqpR/7/GTpeWUD/EcKpJkpAEWG0PutoT5rn1+dLa1q7XyFUj9yDCodXjp6rTMGp+C
	E9G0wh9Bw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jyeZZ-0001Ho-Mr; Thu, 23 Jul 2020 16:59:57 +0000
Received: from mail-il1-f193.google.com ([209.85.166.193])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jyeZU-0001Fz-Ax; Thu, 23 Jul 2020 16:59:53 +0000
Received: by mail-il1-f193.google.com with SMTP id r12so4914242ilh.4;
 Thu, 23 Jul 2020 09:59:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=a9J1QalhPnPlUfL8dEkhcJXOcummbHS6rnTdET71bMs=;
 b=m7P4TxGdCkEG4FNuOH0yzH1+/pwv0mqKGoGBl71ZnHeAUjf54vUWXdM4Mw4pNeHhps
 d52yoS96hNxPkGgSATwxljv+JpaWWsz9QAbsAkpP6hxXJNK8U9rFhG8wP1kR1BajtGPC
 Uyzgq3a5dLRrUX7ea+59pChikBcmKfTDQYL5DX0UTCSOGONJXnH+d0mNajjHsRwdGOBX
 Xx1BZECiqcjTqWbgd1KhR3zReA/WoKrVyVOU34S/o3SBu/sN55xsaj4QXxeUoqtgm0t4
 RyWSlc1F83nVLkccaymnEXMxDSv1gK/crVP4TrH4rWP0/8A8bl4yx37MJm1VIlc1jElw
 SSKQ==
X-Gm-Message-State: AOAM531Hco+yDnz9oRc22XvJYMaem4EZxIsXv8Y3Aj9nMfmogN2xCFBm
 eOR5PPTMO3ICpEn1kx2eBghPFLZfNw==
X-Google-Smtp-Source: ABdhPJyuR1S22aBp3Or2PleYDBAuKLxt9dS8HqZMwzT1XYskFKMphzrrK4Z7oxsJJzEUbVcdkKz2pw==
X-Received: by 2002:a05:6e02:1253:: with SMTP id
 j19mr5960074ilq.145.1595523591815; 
 Thu, 23 Jul 2020 09:59:51 -0700 (PDT)
Received: from xps15 ([64.188.179.252])
 by smtp.gmail.com with ESMTPSA id 5sm1721954ion.7.2020.07.23.09.59.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Jul 2020 09:59:51 -0700 (PDT)
Received: (nullmailer pid 531537 invoked by uid 1000);
 Thu, 23 Jul 2020 16:59:50 -0000
Date: Thu, 23 Jul 2020 10:59:50 -0600
From: Rob Herring <robh@kernel.org>
To: Yongqiang Niu <yongqiang.niu@mediatek.com>
Subject: Re: [v7, PATCH 4/7] dt-bindings: mediatek: add rdma_fifo_size
 description for mt8183 display
Message-ID: <20200723165950.GA529262@bogus>
References: <1595469798-3824-1-git-send-email-yongqiang.niu@mediatek.com>
 <1595469798-3824-5-git-send-email-yongqiang.niu@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1595469798-3824-5-git-send-email-yongqiang.niu@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200723_125952_519008_DC32B985 
X-CRM114-Status: GOOD (  15.02  )
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

On Thu, Jul 23, 2020 at 10:03:15AM +0800, Yongqiang Niu wrote:
> Update device tree binding document for rdma_fifo_size
> 
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

s/_/-/

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
