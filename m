Return-Path: <SRS0=9GQg=CD=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4A747C433E1
	for <linux-mediatek@archiver.kernel.org>; Tue, 25 Aug 2020 19:02:35 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 254CD2075E
	for <linux-mediatek@archiver.kernel.org>; Tue, 25 Aug 2020 19:02:35 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="DCYPaipJ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 254CD2075E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=bdA7I865AqqGsJffOnCw2xEGWEGcMv2ySOIyFrjzBKc=; b=DCYPaipJNYY6PsY+mxS3vywPe
	CWfpKuU7JMl7pil1t6h6UVyjpxezjlN4fwC2pCPTJ0+OXVgwtuxotbgDrppiWD2rh8+VoiAwnbQpB
	wS7tF4cjFUP7smqhoo9slNmZ7ZqU0PGQO2RYSEhTqIOHGpiGQOfNI5GM8PXhVjxfQfP6OrD+j634P
	adZqB8srScZK9fScBSuI+E01OK2r+etKAE/R5Pj9iGQskyGDTCqjJfizg1txpqsOmT5TpKL6JXCFm
	G/csVDyz7FsRekYyvdIngeQuFYT/agjWei7P0qdMaKMTKM+2zxQB4Q8rTH6qEEL3+2wBkSsGaBZpD
	5HsFyJarw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kAeDB-0002hQ-FI; Tue, 25 Aug 2020 19:02:25 +0000
Received: from mail-il1-f196.google.com ([209.85.166.196])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kAeD9-0002gW-4z; Tue, 25 Aug 2020 19:02:23 +0000
Received: by mail-il1-f196.google.com with SMTP id q14so11375683ilm.2;
 Tue, 25 Aug 2020 12:02:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=bCUdIkx3EH4ynR39zceLFnFiKqklMoIPLVpCbylMme0=;
 b=W9ztLd0kovSWrRFx5O2v22o2syd/D/HAztz2Xc25IiQuv3UyAXdGQprCRBj20L1Yq0
 0yWgBDf+a2IG6HB37MPIf0vuUrk7q/vaF8fPe+mHsVeG15N1vcEwHHBJ1ZrMr0gUYHEl
 49cUNdRZmk12bt/VMCSTA11utlMgaH4z20WrjJmHB+PaygZk6Fq6wf+O5kxGAyEBxusl
 cua3nxePMpWs7rGD+r7CX/cCRHypSsM2DPJ+NScmix2D2ad/GiB06VAQje5TCRK3Pdj2
 x+5WL1+jX0Lo0ytIdGycrI7Pj95864+nfp3Zqvq6JOKUUEbyScT+uKtf/YAGZ1tMpGII
 5xSQ==
X-Gm-Message-State: AOAM531Wze1E3tbMXaF/wttWxNaQPUzIFAnOjBJr441gZSkSGTbiaK3c
 rjSLkuDlN+ZEZApq3/zroQ==
X-Google-Smtp-Source: ABdhPJyp2RzYq4kUaObuB2FkwOWJE9pU5Wa539AYxfYQlLjDNUgMTHsNlNcZd+0aqG3qq9CfEGuYjw==
X-Received: by 2002:a92:8556:: with SMTP id f83mr10122295ilh.135.1598382141887; 
 Tue, 25 Aug 2020 12:02:21 -0700 (PDT)
Received: from xps15 ([64.188.179.249])
 by smtp.gmail.com with ESMTPSA id a11sm9505457ilh.74.2020.08.25.12.02.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Aug 2020 12:02:21 -0700 (PDT)
Received: (nullmailer pid 1133284 invoked by uid 1000);
 Tue, 25 Aug 2020 19:02:19 -0000
Date: Tue, 25 Aug 2020 13:02:19 -0600
From: Rob Herring <robh@kernel.org>
To: Crystal Guo <crystal.guo@mediatek.com>
Subject: Re: [v4,2/4] dt-binding: reset-controller: ti: add
 'mediatek,infra-reset' to compatible
Message-ID: <20200825190219.GA1125997@bogus>
References: <20200817030324.5690-1-crystal.guo@mediatek.com>
 <20200817030324.5690-3-crystal.guo@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200817030324.5690-3-crystal.guo@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200825_150223_217625_B821948C 
X-CRM114-Status: GOOD (  16.27  )
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

On Mon, Aug 17, 2020 at 11:03:22AM +0800, Crystal Guo wrote:
> The TI syscon reset controller provides a common reset management,
> and is suitable for MTK SoCs. Add compatible 'mediatek,infra-reset',
> which denotes to use ti reset-controller driver directly.
> 
> Signed-off-by: Crystal Guo <crystal.guo@mediatek.com>
> ---
>  Documentation/devicetree/bindings/reset/ti-syscon-reset.txt | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/reset/ti-syscon-reset.txt b/Documentation/devicetree/bindings/reset/ti-syscon-reset.txt
> index ab041032339b..5a0e9365b51b 100644
> --- a/Documentation/devicetree/bindings/reset/ti-syscon-reset.txt
> +++ b/Documentation/devicetree/bindings/reset/ti-syscon-reset.txt
> @@ -25,6 +25,7 @@ Required properties:
>  			    "ti,k2l-pscrst"
>  			    "ti,k2hk-pscrst"
>  			    "ti,syscon-reset"
> +			    "mediatek,infra-reset", "ti,syscon-reset"

You need your own binding doc. If you can use the same driver then fine, 
but that's a separate issue. There's also reset-simple driver if you 
have just array of 32-bit registers with a bit per reset.

Don't repeat 'ti,reset-bits' either.

>   - #reset-cells		: Should be 1. Please see the reset consumer node below
>  			  for usage details
>   - ti,reset-bits	: Contains the reset control register information
> -- 
> 2.18.0

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
