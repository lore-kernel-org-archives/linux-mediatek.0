Return-Path: <SRS0=lxIO=2Y=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 91D8DC00523
	for <linux-mediatek@archiver.kernel.org>; Fri,  3 Jan 2020 22:27:11 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 648A0227BF
	for <linux-mediatek@archiver.kernel.org>; Fri,  3 Jan 2020 22:27:11 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="rfuohgLA"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 648A0227BF
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5z5C+fs/xayn30HDoQNvxGZoJcb7FZa+nxg4HHjFZHg=; b=rfuohgLAGOLsGZ
	HcB3DrKlKW1eIo4nMKSbzkX0uCWk7QdqiFSC16BHF5mUpjkdx/+tBSSs3kOwuG3d0AB/Yr0B+LWAz
	AZ+QK6snpniUMdfDNTrVLxegnT1kOxU11Nc6IJ74zZCg1P2ZX6lsGyJTWVdPWrSXTD5tGUdWsSS49
	bzetjVK7IYrZ0XRSIchcAUO9dCaBK9S2NvY4znFkHBSBtMjdGRFfArorw+NJpi7JJg3myzFGRdCki
	v0uIkyVS65/6PYqkQKNajnyiHaAKmcxvYR8jRHw4CiNs19JPztLs/vTH7lsttADH8PuWP7JEwiDpP
	VvnewE+6m01rHlMgnljQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1inVPH-0000j5-0o; Fri, 03 Jan 2020 22:26:59 +0000
Received: from mail-io1-f68.google.com ([209.85.166.68])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1inVP7-0000Zh-Vf
 for linux-mediatek@lists.infradead.org; Fri, 03 Jan 2020 22:26:52 +0000
Received: by mail-io1-f68.google.com with SMTP id i11so42868426ioi.12
 for <linux-mediatek@lists.infradead.org>; Fri, 03 Jan 2020 14:26:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=nH8EiEpsw3qEqxTu/vy8rZgCVIsth2Q4jMx+TyJClBo=;
 b=IpOHYw7FiNvfVGauO/pkLVvkFjk0IMThtOZOLKr7t4TAUFoyIDT2c/8K92IErgUrCp
 BK68SdjxSUl2FAffyzhzWK6u0mth0HJTPvnRUzq9Be4nPDzUNaaFkMCYpULwIl8pzgcg
 AJBAbMgnvHrmblVcUhVP1zochcSwmEImBSYuu81Ze+sr5SGHIwQ8ZpD97zKAbt7a4bp7
 nEKVoYT90fkH4KmSmy4e6iE2E6xu3YYgdCbKga07De/kfA5B2bX6cQOWLeqjt0cvYcum
 lttaIPy21fxLfLEuQt8w/8HA8P3nSjJWdOb6sWnnVSb7lP+3E1o6ePVN4O2FUdyhYpQe
 kNEA==
X-Gm-Message-State: APjAAAU2O3wpIVoGZKnXnfp02R9EHm6gyc4OddMoAioGl57Vw9y/5II6
 PhU2/L6HnQGxDV0aYtb3NcbJxR8=
X-Google-Smtp-Source: APXvYqz6dRzbEtHoZcDit5W7yp649b+rYmmON49ayGnKppqJ/SDu2B2WMVdFkTCZcaHYBhZUeFXhCw==
X-Received: by 2002:a5d:949a:: with SMTP id v26mr62903639ioj.13.1578090408921; 
 Fri, 03 Jan 2020 14:26:48 -0800 (PST)
Received: from rob-hp-laptop ([64.188.179.251])
 by smtp.gmail.com with ESMTPSA id i136sm19169595ild.23.2020.01.03.14.26.46
 for <linux-mediatek@lists.infradead.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Jan 2020 14:26:46 -0800 (PST)
Received: from rob (uid 1000) (envelope-from rob@rob-hp-laptop) id 2219a5
 by rob-hp-laptop (DragonFly Mail Agent v0.11);
 Fri, 03 Jan 2020 15:26:45 -0700
Date: Fri, 3 Jan 2020 15:26:45 -0700
From: Rob Herring <robh@kernel.org>
To: Yongqiang Niu <yongqiang.niu@mediatek.com>
Subject: Re: [RESEND PATCH v6 01/17] dt-bindings: mediatek: add
 rdma_fifo_size description for mt8183 display
Message-ID: <20200103222645.GA24430@bogus>
References: <1578021148-32413-1-git-send-email-yongqiang.niu@mediatek.com>
 <1578021148-32413-2-git-send-email-yongqiang.niu@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1578021148-32413-2-git-send-email-yongqiang.niu@mediatek.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200103_142650_017876_3645613C 
X-CRM114-Status: GOOD (  13.80  )
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

On Fri, Jan 03, 2020 at 11:12:12AM +0800, Yongqiang Niu wrote:
> Update device tree binding documention for rdma_fifo_size

Typo. And write complete sentences.

> 
> Signed-off-by: Yongqiang Niu <yongqiang.niu@mediatek.com>
> ---
>  .../devicetree/bindings/display/mediatek/mediatek,disp.txt  | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,disp.txt b/Documentation/devicetree/bindings/display/mediatek/mediatek,disp.txt
> index 681502e..34bef44 100644
> --- a/Documentation/devicetree/bindings/display/mediatek/mediatek,disp.txt
> +++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,disp.txt
> @@ -70,6 +70,10 @@ Required properties (DMA function blocks):
>    argument, see Documentation/devicetree/bindings/iommu/mediatek,iommu.txt
>    for details.
>  
> +Required properties (DMA function blocks):
> +- mediatek,rdma_fifo_size: rdma fifo size may be different even in same SOC, add this
> +  property to the corresponding rdma

s/_/-/

Valid values? Max value?

> +
>  Examples:
>  
>  mmsys: clock-controller@14000000 {
> @@ -211,3 +215,12 @@ od@14023000 {
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

A new property doesn't really warrant a whole new example.

> \ No newline at end of file

^^^

> -- 
> 1.8.1.1.dirty

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
