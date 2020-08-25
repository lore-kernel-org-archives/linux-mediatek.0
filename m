Return-Path: <SRS0=9GQg=CD=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2A2A9C433E1
	for <linux-mediatek@archiver.kernel.org>; Tue, 25 Aug 2020 17:42:32 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EBA992076C
	for <linux-mediatek@archiver.kernel.org>; Tue, 25 Aug 2020 17:42:31 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ha0lRco+"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EBA992076C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=ft08SN0PhT9ARYYjkxeFOHTjKqqXZwFtOlIRIwZyhlU=; b=ha0lRco+v8OkveC0iIkASV0Y4
	Rdc5ZLH2LueBjEqmk25yz3fTos4K+X3KMLhnNUMNYIXTinSWcD0gQ2mYwMDSvFe2Q8X5cqvy5DilJ
	6Zt033GfhjvPvlVF9iS/qga6AnOTeSxF3Vt142j3aTTrFzqm/fDDqjAmbHHlQz8v5/cF87OLrXwbY
	4q2dm1AFLwYJYUbASd71GlU+QjUV5ixiSndxbe0au91F2IKvdySc5OFIM4Ym9hJoMyrQrJpMHcQv+
	oasIUwETm+vMkAg0gFM4COwJYWmnsZuv+uAJfFh6CdCBc5i5OcXxSDd+DVfKnELM1XQiwQT9yLE1k
	oA4Lg25pQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kAcxj-000367-Ds; Tue, 25 Aug 2020 17:42:23 +0000
Received: from mail-il1-f196.google.com ([209.85.166.196])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kAcxh-00034s-2c; Tue, 25 Aug 2020 17:42:21 +0000
Received: by mail-il1-f196.google.com with SMTP id j9so11124478ilc.11;
 Tue, 25 Aug 2020 10:42:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=NTp9u+iFGhAjZbw/H+WbVNzQr+UMY6B6b4vLY7DE2lo=;
 b=hb82I5O/jaUz82FPPwef7eGntqufAjFM23LiJymoPc8yjDbJ5DzZoI550K8uMZ+1AM
 guHZiGeXVCAMzk8bnEO1nQ0EAf60PWR7ynk+abzZOQ/i1ew2+AElxzEMkWYqJAyypVWB
 SdG8Gl3Zi8+GC7wEFrT2i20vyp0thZDzMTGCchtCGTsfjzijkYHV6nPlJ9A4jT7x9Wf5
 HYvNDVhXYnpQTQDS1jdsaGAnL1FsHtwCcmTiqzBwCiEx7kRN3mFJeIqoJr5rnwX+6A8Q
 lUInOmbG80hES21odum/TYYnt9QorPlTGFX1KHtecpQCSsn1XFEF4tbK9hmb7mXnJH7W
 SSbw==
X-Gm-Message-State: AOAM5313/K2VT0Z2VJk4kPaLVA+cyr34fXNgzTdRIQQAtlXPaUYLdp9l
 +Vl8SyIFtE6BL6iCJtXR4A==
X-Google-Smtp-Source: ABdhPJzWee0fZTqZEQWL/ptQEMx+PfSomfPDeGF7gm1FmOf20zLrifz3/STLKJkgTmLuKgxEqET0/Q==
X-Received: by 2002:a05:6e02:670:: with SMTP id
 l16mr10253072ilt.52.1598377338930; 
 Tue, 25 Aug 2020 10:42:18 -0700 (PDT)
Received: from xps15 ([64.188.179.249])
 by smtp.gmail.com with ESMTPSA id v84sm9831589ilk.4.2020.08.25.10.42.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Aug 2020 10:42:17 -0700 (PDT)
Received: (nullmailer pid 1008933 invoked by uid 1000);
 Tue, 25 Aug 2020 17:42:15 -0000
Date: Tue, 25 Aug 2020 11:42:15 -0600
From: Rob Herring <robh@kernel.org>
To: Crystal Guo <crystal.guo@mediatek.com>
Subject: Re: [v4, 1/4] dt-binding: reset-controller: ti: add reset-duration-us
 property
Message-ID: <20200825174215.GA999117@bogus>
References: <20200817030324.5690-1-crystal.guo@mediatek.com>
 <20200817030324.5690-2-crystal.guo@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200817030324.5690-2-crystal.guo@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200825_134221_164942_39478104 
X-CRM114-Status: GOOD (  15.96  )
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
Cc: devicetree@vger.kernel.org, yong.liang@mediatek.com,
 stanley.chu@mediatek.com, srv_heupstream@mediatek.com, seiya.wang@mediatek.com,
 linux-kernel@vger.kernel.org, afd@ti.com, fan.chen@mediatek.com,
 linux-mediatek@lists.infradead.org, p.zabel@pengutronix.de,
 matthias.bgg@gmail.com, yingjoe.chen@mediatek.com, s-anna@ti.com,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Mon, Aug 17, 2020 at 11:03:21AM +0800, Crystal Guo wrote:
> introduce 'reset' method to allow device do serialized assert and
> deassert operations in a single step, which needs a minimum delay
> to be waited between assert and deassert.

Why is Mediatek adding to a TI binding?

> 
> Signed-off-by: Crystal Guo <crystal.guo@mediatek.com>
> ---
>  Documentation/devicetree/bindings/reset/ti-syscon-reset.txt | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/reset/ti-syscon-reset.txt b/Documentation/devicetree/bindings/reset/ti-syscon-reset.txt
> index 86945502ccb5..ab041032339b 100644
> --- a/Documentation/devicetree/bindings/reset/ti-syscon-reset.txt
> +++ b/Documentation/devicetree/bindings/reset/ti-syscon-reset.txt
> @@ -59,6 +59,11 @@ Required properties:
>  Please also refer to Documentation/devicetree/bindings/reset/reset.txt for
>  common reset controller usage by consumers.
>  
> +Optional properties:
> +- reset-duration-us: When do serialized assert and deassert operations, minimum delay in microseconds
> +is needed to be waited between an assert and a deassert to reset the device. This value can be 0, 0 means
> +that such a delay is not needed.

This goes in the reset controller node or each consumer? For the latter, 
it should be a cell in 'resets' if you need this. But really, I think 
the reset controller should enforce some minimum time that works for all 
consumers. Surely having a minimum time per reset isn't really needed.

Rob

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
