Return-Path: <SRS0=gkfg=6L=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4CF1FC4CECD
	for <linux-mediatek@archiver.kernel.org>; Mon, 27 Apr 2020 21:33:13 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 21A922070B
	for <linux-mediatek@archiver.kernel.org>; Mon, 27 Apr 2020 21:33:13 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Mqp8LgDz"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 21A922070B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iFPXMzly5Ko9lKLWDK3ERDD82FgQZzUnNUTL6GCxdjg=; b=Mqp8LgDzHlyaEQ
	Nbd7my8RLRVEX8PBhR7M/ECjWBIDg2zbW7mGTLena0j52OPRyrXejaconZd0U7kC4rc4Nf4m3z+Xj
	WGcnevnTiqEgpx3ziXhCn5APBDdsh7+C5hk3Ix2OZHXsHZ89rRxKR8sIi4szZS55Bf5cd+1XVNQV0
	RHAaT0Rxhw/ajqlXRp8PQmlCITfhtMUF1QKTeBtML+TeGCsDYIdheL1m6cTAy45twKf9hLzDWKc5w
	SWW5x4JQfSrIo8vdqjmbIobBuYGpPNByDDgj2ObuDYp2t4umS2Z7tZe6VOHDjLiIO6UKftRhnvFBS
	xFUFakJ1e1dJepnJlSjw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jTBN7-00006Y-Gx; Mon, 27 Apr 2020 21:33:01 +0000
Received: from mail-ot1-f67.google.com ([209.85.210.67])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jTBMs-0008Ko-HJ; Mon, 27 Apr 2020 21:32:47 +0000
Received: by mail-ot1-f67.google.com with SMTP id j4so29013298otr.11;
 Mon, 27 Apr 2020 14:32:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=VhX0m7XiVUavIDrF8Px+dNHE5Y+gy8GzoSAbvu2Xn34=;
 b=iBnP0ebLIeKHLx8q06MM0FJOLR1bsWI8GlZa+zfcfFouLDeJHC5vx1srZMazcOSYHf
 jfSPnUJ8fboF7L5bKPJpdo7toS2tUIDfI/V7rVeGlYiWDJRIheqi+kmYuBLuf1w4wCJx
 ArI5HapWQE0axt6DfGqQ0f629NK2L4dXxSVSsBnqMjUhf4FvwxPqwSCixcTqmGliShse
 S5zQDBPb1JaHFf+UYW3OpaB2/OMW678pmhhNrDi4NqevqyfEcVGqUTrOxPzNArR3Lr66
 xf+mUOfHPH1+wyJHTGAtGUVcne4NgZHZ/gGbCZFyNBk0/nSFrdoIEoALMFVNYix0Ou6F
 8nNg==
X-Gm-Message-State: AGi0PuZVVrlDEWKHbzyoPzJ2N9fRxYMXGzXqCKPdCqesNhFmQ/ZoG+3s
 zM/ghZDC7lag1zMcC/EQ+eZHo44=
X-Google-Smtp-Source: APiQypKaNxXTFDM9s/8lHp/0DfHRTlPNydLnDnh9/hUQgcEGUw3vp0iDQdHVuaMxyOuo5fm7o/BuuA==
X-Received: by 2002:aca:4f09:: with SMTP id d9mr631326oib.172.1588023164944;
 Mon, 27 Apr 2020 14:32:44 -0700 (PDT)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id j70sm90813oib.53.2020.04.27.14.32.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Apr 2020 14:32:44 -0700 (PDT)
Received: (nullmailer pid 32460 invoked by uid 1000);
 Mon, 27 Apr 2020 21:32:42 -0000
Date: Mon, 27 Apr 2020 16:32:42 -0500
From: Rob Herring <robh@kernel.org>
To: EastL <EastL.Lee@mediatek.com>
Subject: Re: [PATCH v3 1/2] dt-bindings: dmaengine: Add MediaTek
 Command-Queue DMA controller bindings
Message-ID: <20200427213242.GA32009@bogus>
References: <1587955977-17207-1-git-send-email-EastL.Lee@mediatek.com>
 <1587955977-17207-2-git-send-email-EastL.Lee@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1587955977-17207-2-git-send-email-EastL.Lee@mediatek.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200427_143246_576028_0E2D6C77 
X-CRM114-Status: UNSURE (   8.44  )
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
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, wsd_upstream@mediatek.com,
 Sean Wang <sean.wang@mediatek.com>, linux-kernel@vger.kernel.org,
 EastL <EastL.Lee@mediatek.com>, dmaengine@vger.kernel.org, vkoul@kernel.org,
 robh+dt@kernel.org, linux-mediatek@lists.infradead.org, matthias.bgg@gmail.com,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Mon, 27 Apr 2020 10:52:56 +0800, EastL wrote:
> Document the devicetree bindings for MediaTek Command-Queue DMA controller
> which could be found on MT6779 SoC or other similar Mediatek SoCs.
> 
> Signed-off-by: EastL <EastL.Lee@mediatek.com>
> ---
>  .../devicetree/bindings/dma/mtk-cqdma.yaml         | 98 ++++++++++++++++++++++
>  1 file changed, 98 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/dma/mtk-cqdma.yaml
> 

My bot found errors running 'make dt_binding_check' on your patch:

/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/dma/mtk-cqdma.example.dt.yaml: dma-controller@10212000: interrupts: [[0, 139, 8], [0, 140, 8], [0, 141, 8]] is too short
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/dma/mtk-cqdma.example.dt.yaml: dma-controller@10212000: reg: [[0, 270606336, 0, 128], [0, 270606464, 0, 128], [0, 270606592, 0, 128]] is too short

See https://patchwork.ozlabs.org/patch/1277292

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure dt-schema is up to date:

pip3 install git+https://github.com/devicetree-org/dt-schema.git@master --upgrade

Please check and re-submit.

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
