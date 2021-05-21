Return-Path: <SRS0=Gsgc=KQ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0D861C433B4
	for <linux-mediatek@archiver.kernel.org>; Fri, 21 May 2021 02:10:53 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BECAE61363
	for <linux-mediatek@archiver.kernel.org>; Fri, 21 May 2021 02:10:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BECAE61363
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9Od/33k5SAsl9Z+BurXA5XVFpBZkBTxhf73MyL1yFOI=; b=cVp2F+kl3H/S4c6N0PB5RQ3LBL
	1akHKJbZMJPgXt860Z+wgxrYJ75ezxIDDbLa0hDBX/piotq7ga8ZIzGqQUil3WuwogWR6rvS2uQ95
	wh5v4zwdl4aZBBgwMU4bz/SdPtE9rYbxml9G6XOeM6N1u4gs0b98v1Squ7p3WdIFiqYb4BsKQBdzg
	PoOI21S4VHqvQn7orw/pRzyYp9ncN2XZZPvXZvQheyV6H3wHdx9AhtN372xGOK1BKHMQ9PBUfTHJa
	L0qg6Ud/zD1VXBEdn8gWAOWDq2gnbVg1pe2Bu9XVyiKoMwd3gGB2+nyhdf/bsbGlIxfji9qx5yrXw
	H6GcG2MQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ljucQ-003Rsk-AM; Fri, 21 May 2021 02:10:30 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ljuWH-003QUp-7o; Fri, 21 May 2021 02:04:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=9fdH0SN9VUeMUbSb8aDt83HzmkEYcJr78YUXp4lCmeA=; b=dck240jIIh/yzZL0gEIubfT93X
 gkmGOEPVd6eCl3S8QzdxDLDif7p7kXrpke0bkPmr2D8LQkQ/aClO6f7daNaKTPLC5Rw3WSH8tyMIX
 y4sJ/HRJTvCfAtfQepy+jBPmQay7+0lFxUQOs+vAIm9ofExpzimpmIOXiUbiKu52miXt55N9Hk14e
 PihcKc4UVuNz8TzFnxbb8flO0iQ3eetK6hjbw04yWUcuf7YKPukJaLoQVt3nMJ9DaNhedGaxh3ehG
 EXJ2c6kJvknKf07Hb5r5K3HcyrdiO4Fus5agFV86bi1uDEQ1nzPcxlweZU7dFCQV8foAiNB8xs5/r
 dmXkpQ1Q==;
Received: from mail-oi1-f174.google.com ([209.85.167.174])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1ljuWE-00GlNn-NT; Fri, 21 May 2021 02:04:07 +0000
Received: by mail-oi1-f174.google.com with SMTP id c196so10095045oib.9;
 Thu, 20 May 2021 19:04:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=9fdH0SN9VUeMUbSb8aDt83HzmkEYcJr78YUXp4lCmeA=;
 b=DjPkvqL3Gtd4HWVgy6lXYDeMwYzyMy2NhhdE/2dzxB8mlTs7aKONtPmLQL00KgOf+w
 Yw02xYPWRVSDFncJBPqLE1nuiQ2KsVuEnNBwlEqu2pTU7HN34pc/cRJXzrJ3yQtCmsip
 w73tztbkXYaR+3vZ8MlMGnuonwYQ0nGP6GtEHnFuoClBI2zo9m1ROOLCuNrx1dXJQogt
 Y3JMnYlvc0tJo6GaaO6JWwb/QydIDO21mKsFWyh/8RTfejCavtAnaVwmRc3V84Xy0oKp
 3llqq+ZQy+diVXt4Cm0HLlq5MQmVYhhamFgSwAP2fisIHNNXJ5azYVbggIAqTFDuj0od
 MPaw==
X-Gm-Message-State: AOAM531I8GkNPTNg98aflm0HuCBBUYzvFR8n74gGKTUIThgXfqbELxTd
 GZNzA4REqDGedioRG5iULg==
X-Google-Smtp-Source: ABdhPJz5I+8jM3jJcv60seXotXjXJjLle5BdrNuMwFhPVT8jv3yjwueMfTmo+aLKNGdUJ1++iFKrwg==
X-Received: by 2002:a05:6808:309:: with SMTP id i9mr356643oie.14.1621562646140; 
 Thu, 20 May 2021 19:04:06 -0700 (PDT)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id l20sm922057oop.3.2021.05.20.19.04.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 May 2021 19:04:05 -0700 (PDT)
Received: (nullmailer pid 2507147 invoked by uid 1000);
 Fri, 21 May 2021 02:04:04 -0000
Date: Thu, 20 May 2021 21:04:04 -0500
From: Rob Herring <robh@kernel.org>
To: Fabien Parent <fparent@baylibre.com>
Cc: Herbert Xu <herbert@gondor.apana.org.au>, linux-kernel@vger.kernel.org,
 mkorpershoek@baylibre.com, linux-mediatek@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>, Sean Wang <sean.wang@mediatek.com>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Rob Herring <robh+dt@kernel.org>, linux-crypto@vger.kernel.org,
 Matt Mackall <mpm@selenic.com>
Subject: Re: [PATCH v2 1/2] dt-bindings: rng: mediatek: convert to yaml schema
Message-ID: <20210521020404.GA2507117@robh.at.kernel.org>
References: <20210520111656.66017-1-fparent@baylibre.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210520111656.66017-1-fparent@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210520_190406_782473_C27549E0 
X-CRM114-Status: GOOD (  11.28  )
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

On Thu, 20 May 2021 13:16:55 +0200, Fabien Parent wrote:
> Convert the RNG binding for MediaTek to use YAML schema.
> 
> Signed-off-by: Fabien Parent <fparent@baylibre.com>
> ---
> 
> v2: Write the compatibles in a more compact way
> 
>  .../devicetree/bindings/rng/mtk-rng.txt       | 22 --------
>  .../devicetree/bindings/rng/mtk-rng.yaml      | 53 +++++++++++++++++++
>  2 files changed, 53 insertions(+), 22 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/rng/mtk-rng.txt
>  create mode 100644 Documentation/devicetree/bindings/rng/mtk-rng.yaml
> 

Applied, thanks!

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
