Return-Path: <SRS0=gVFe=CX=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B6088C433E2
	for <linux-mediatek@archiver.kernel.org>; Mon, 14 Sep 2020 20:07:54 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6E679208DB
	for <linux-mediatek@archiver.kernel.org>; Mon, 14 Sep 2020 20:07:54 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="F2BNWV0E"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6E679208DB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=gNre8BwA1YTisoEBYzZ4l2yOVuOFzbGiqtzfu5ZaHpc=; b=F2BNWV0ETdkEbzwpn1zO/hmIc
	4pLrcs9wJTe6sntYj1nHUhYso5nJhOj8aGpnIGg1hWJwYRDDSkbiOcohCULMneaXzcNhp4PCRijoR
	caHa2qewgF/yIwGOq9F0vUpdpZZjV8Y200HLMWZI9udHo3nQ+bArI0fFSmrbk8hRFpM7gvnCAaGWF
	gooaxuA1oWwRf6ylMOAlCm9+4WuU8mwbGauzFUbmxNkWt2TfeE5vUe+wVL1H6AckCOasFOWiNx+0q
	pN87UnCHXMtQkJv3RkbNdMkVBgXbfDwBYpwr/WklN9E7soWgSivc8Q8G3l7uwqOrK9sSCytiDe8mB
	HyTg9EYKw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kHulH-0004nc-Qd; Mon, 14 Sep 2020 20:07:39 +0000
Received: from mail-io1-f66.google.com ([209.85.166.66])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kHulD-0004mR-K2; Mon, 14 Sep 2020 20:07:36 +0000
Received: by mail-io1-f66.google.com with SMTP id u6so1488643iow.9;
 Mon, 14 Sep 2020 13:07:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=cQywR9iIPsj0KlHQdnWKI/tnI0oK4QmIBDygSWB11Ss=;
 b=XTBvLsPjZRa+SoGFUdExM8xqcd46ybZHIpfSmO7XSTZMybcYwy0AeZA2LZdcKJqgOK
 pyz1ZK24hVNE3HMvOs1m+NRBN5J+K424QAA0VP9HLOvn74WhgjUjohX7mB2VEUDKigVj
 aCmADQyLI7VnbmlENwyBIw8xcQ5w0TZdhGch2mXngW451wMKSJblrHCr0578xzvim5px
 nNxVnBTyU50pOqzPyu/FgTrWH/SO4732b0tNhcp6tRgZRw63eX1J16rto4WXMb8qIllT
 McdL/4LBLL8JkA4RpWu5oYPEjvnzogAizY6RjzA6C4/rpRjH7uIkkbCxNogsSlS7/528
 yOyg==
X-Gm-Message-State: AOAM533VKwgiREAYnCAip6DTNVcvLQqbCn6POTIJKIzqn5awgZ94TwNc
 f7tJtluyDymjd+/8MerMwg==
X-Google-Smtp-Source: ABdhPJzRM3MEVMxc6A5vZ4yhuQDw2sZG6G+WSd8bJcKEDnFhmbLoAxkJNlAn5dxhAZMjgFtOtP7yVg==
X-Received: by 2002:a05:6602:15c5:: with SMTP id
 f5mr11611812iow.42.1600114052902; 
 Mon, 14 Sep 2020 13:07:32 -0700 (PDT)
Received: from xps15 ([64.188.179.253])
 by smtp.gmail.com with ESMTPSA id a20sm7557962ilq.57.2020.09.14.13.07.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Sep 2020 13:07:32 -0700 (PDT)
Received: (nullmailer pid 152738 invoked by uid 1000);
 Mon, 14 Sep 2020 20:07:29 -0000
Date: Mon, 14 Sep 2020 14:07:29 -0600
From: Rob Herring <robh@kernel.org>
To: Mark-PK Tsai <mark-pk.tsai@mediatek.com>
Subject: Re: [PATCH v3 2/2] dt-bindings: interrupt-controller: Add MStar
 interrupt controller
Message-ID: <20200914200729.GA152651@bogus>
References: <20200902063344.1852-1-mark-pk.tsai@mediatek.com>
 <20200902063344.1852-3-mark-pk.tsai@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200902063344.1852-3-mark-pk.tsai@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200914_160735_725046_D5AA467C 
X-CRM114-Status: GOOD (  10.20  )
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
Cc: devicetree@vger.kernel.org, alix.wu@mediatek.com, jason@lakedaemon.net,
 maz@kernel.org, yj.chiang@mediatek.com, daniel@0x0f.com,
 linux-kernel@vger.kernel.org, robh+dt@kernel.org,
 linux-mediatek@lists.infradead.org, matthias.bgg@gmail.com, tglx@linutronix.de,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Wed, 02 Sep 2020 14:33:44 +0800, Mark-PK Tsai wrote:
> Add binding for MStar interrupt controller.
> 
> Signed-off-by: Mark-PK Tsai <mark-pk.tsai@mediatek.com>
> ---
>  .../interrupt-controller/mstar,mst-intc.yaml  | 64 +++++++++++++++++++
>  1 file changed, 64 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/interrupt-controller/mstar,mst-intc.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
