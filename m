Return-Path: <SRS0=iyt4=M5=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3CF1EC4338F
	for <linux-mediatek@archiver.kernel.org>; Fri,  6 Aug 2021 20:43:48 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E7B1E61181
	for <linux-mediatek@archiver.kernel.org>; Fri,  6 Aug 2021 20:43:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org E7B1E61181
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ke4mS9HLBbuzKZgwpynxeW7zcA23JMVMs9qHNODXEhI=; b=l/ejcqR6MPfA85
	u3L5Cuv8gobwVnpGCuMMEHviy3lBMk//LgU2fholjeaGyLzONPsL1CU7bOA58IiEwHsWkFaRBA+Ig
	wRd+HQZ7VeLaNpUNdvH6ZXyb7ySFnXPGmdtlanGd1T8MQ1clv9H1ViV5OiDiFlxcoSnysH/5uC8X5
	vSWcYqbma0i+Sprpif0AqsLhEeK1o5KvVfOTGIInmbUY/8wb0bHFHLPc3OdvO/bXpMDwgsEQ7pa+0
	ZUS9kohIy/44HNZx8wcMYui/pjzdAHS23VxT2GPc5wSPdOYwni7SgKhAq3hCMMBJwQelm2b0jAcy+
	k7kAZsYUScFzZUZ05YYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mC6gq-00DWQh-L1; Fri, 06 Aug 2021 20:43:36 +0000
Received: from mail-io1-f44.google.com ([209.85.166.44])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mC6gd-00DWOf-Mv; Fri, 06 Aug 2021 20:43:25 +0000
Received: by mail-io1-f44.google.com with SMTP id x10so3022878iop.13;
 Fri, 06 Aug 2021 13:43:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=85KYKrivONUxgMBoJUEhliU3kHWvhvn/JV7RSsVVnI4=;
 b=fDT/9pDAH2AnD/A0Zo83ExYAxGjPuFawK2oEJpg83WKdncdwIqhlXHJwtxH7LweIGR
 nGsEm6NVQ2Ml/DXTUU0eQ+FB6+LUiTBVSMmvV2sFGFer7cDh+qC2rII3jFLRLAtoSfBi
 iXxGka3Y/jVR8GZL3jnFdUtdax0y5SVd9GIvL3GElsUXQdWQ6DzWgwewH64OVgaFLQiP
 BzA3JlnahfGCMWCRVFTvDSyr4AvjVFvgKBeVOXJfjoXCFcJu3d9KGiOhHQPUskyBgIyR
 YqSZSQEP6PUUObYAbGpLi9ltA99vJaMk1H4g3MNvD+Vhlo5b1QwGVM0ZgDgE9OfU5eBA
 t/0g==
X-Gm-Message-State: AOAM531e8fCwXjmrq8zTjGZhu4o9sHtOtZX+Q1jgSBFwpAzv+lOvGKVN
 dZGY+A1sv7rU6dYSRM8pww==
X-Google-Smtp-Source: ABdhPJxjS2d6CDMmPdtPpkPsLbJ7cOc+rjjAk8K5YHLGu0WjzWd9rNma7ebUcLrn4Jb8r09ZzkTN4w==
X-Received: by 2002:a92:de09:: with SMTP id x9mr130637ilm.284.1628282602559;
 Fri, 06 Aug 2021 13:43:22 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
 by smtp.gmail.com with ESMTPSA id f16sm5253453ilc.53.2021.08.06.13.43.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Aug 2021 13:43:22 -0700 (PDT)
Received: (nullmailer pid 1762401 invoked by uid 1000);
 Fri, 06 Aug 2021 20:43:20 -0000
Date: Fri, 6 Aug 2021 14:43:20 -0600
From: Rob Herring <robh@kernel.org>
To: Chunfeng Yun <chunfeng.yun@mediatek.com>
Cc: Mathias Nyman <mathias.nyman@intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, linux-usb@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Eddie Hung <eddie.hung@mediatek.com>
Subject: Re: [PATCH 03/11] dt-bindings: usb: mtk-xhci: add compatible for
 mt8195
Message-ID: <YQ2e6AGFi7beqp6Q@robh.at.kernel.org>
References: <1627635002-24521-1-git-send-email-chunfeng.yun@mediatek.com>
 <1627635002-24521-3-git-send-email-chunfeng.yun@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1627635002-24521-3-git-send-email-chunfeng.yun@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210806_134323_795222_757F5D1E 
X-CRM114-Status: GOOD (  18.03  )
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

On Fri, Jul 30, 2021 at 04:49:54PM +0800, Chunfeng Yun wrote:
> There are 4 USB controllers on MT8195, the controllers (IP1~IP3,
> exclude IP0) have a wrong default SOF/ITP interval which is
> calculated from the frame counter clock 24Mhz by default, but
> in fact, the frame counter clock is 48Mhz, so we should set
> the accurate interval according to 48Mhz. Here add a new compatible
> for MT8195, it's also supported in driver. But the first controller
> (IP0) has no such issue, we prefer to use generic compatible,
> e.g. mt8192's compatible.

That only works until you find some 8195 bug common to all instances. 
Can't you read the clock frequency?

> 
> Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
> ---
>  Documentation/devicetree/bindings/usb/mediatek,mtk-xhci.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/usb/mediatek,mtk-xhci.yaml b/Documentation/devicetree/bindings/usb/mediatek,mtk-xhci.yaml
> index 61a0e550b5d6..753e043e5327 100644
> --- a/Documentation/devicetree/bindings/usb/mediatek,mtk-xhci.yaml
> +++ b/Documentation/devicetree/bindings/usb/mediatek,mtk-xhci.yaml
> @@ -31,6 +31,7 @@ properties:
>            - mediatek,mt8173-xhci
>            - mediatek,mt8183-xhci
>            - mediatek,mt8192-xhci
> +          - mediatek,mt8195-xhci
>        - const: mediatek,mtk-xhci
>  
>    reg:
> -- 
> 2.18.0
> 
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
