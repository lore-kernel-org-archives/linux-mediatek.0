Return-Path: <SRS0=uRRy=DF=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 70024C2D0A8
	for <linux-mediatek@archiver.kernel.org>; Mon, 28 Sep 2020 18:13:09 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0EF6420739
	for <linux-mediatek@archiver.kernel.org>; Mon, 28 Sep 2020 18:13:09 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="njouKqAH"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0EF6420739
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=eWT4Ysq5zJdgo3DrgYUDEgOGG0bOozlTxpd8LSQ8SL4=; b=njouKqAHkd3jHY5vEHPuVeN1S
	qDX7PbHL4FKtnreNoR1ca1Ch06PBf1pxWkUWzDHXfJAUHPD1WzyoulfG8ww5zTO1TWSYJYnoFa+OT
	kd2g/VAHKmNBYtvOc6VkZce9rljSohp3/NyYT6bJCT1RUlXSoIavzV5W9+tejpMU5cYE2ARJgNJmn
	/fGQiLz97fqX8H+Dxq064RVbhIMvLDUv9+07zZnuFS80pEJXAuFLkuFSGPBbbwqBtzs6wjAdW9MSc
	s9sGos1ku7julnGA8zdrWMR8qwf7TE7VmIk2TbJ8J6ijoHk8eNXa89rN91MgBWyA5xbf4U13qX0vX
	DBmn0aI9Q==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kMxdx-0004vb-1Z; Mon, 28 Sep 2020 18:12:57 +0000
Received: from mail-ot1-f67.google.com ([209.85.210.67])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kMxds-0004uD-HO; Mon, 28 Sep 2020 18:12:53 +0000
Received: by mail-ot1-f67.google.com with SMTP id q21so1856752ota.8;
 Mon, 28 Sep 2020 11:12:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=/PtsW+8x2QZLtcNsrjnLIk2PYfpyw6cjz6HIC4oDjYI=;
 b=gD9rSj+ejfjsQKYW76biiqD1BF8D+RJHY4H+oLe4aFHFD2WN3cl1NEFvDnfsLTj8Yw
 M0dn41ayE19v4h+Pd24RDtZT/1nNhxc1gnYn4qUEnycfvUByX7lX2nuGzzlF33A6uJry
 qmj9JQpOSKm+3Ex0Y6s2Isa4vMioTQP+IbxinLVJMGo9R0fMMpsArEJTyliwWeeAYwvA
 j1SjpV++6tYcSSrBtzOamaSl1p6Ij7PTOsOA5Kw+LSjvFKo46LkFKZU+j3M3PVGPkRKp
 AkyJwrFqtCjTl6PAsfaNGPPww17OMgZ3aQhuhYW3UI8PV+sZeAhEW4+rUkvZkub+Iryc
 G2JQ==
X-Gm-Message-State: AOAM532unYn6wgAmt6+ExeBEeY43zY2QVSnVPcsaKc+oTLtGMhPv5J2h
 cjj8DhrlXqzLeX6y8SHELQ==
X-Google-Smtp-Source: ABdhPJwEPb10fj9w9+iuDh14GzpFtGbcUbBT9YQT7EfkJduKMoyN4IcMJ50ib2BBgXy5CWOTTsFcig==
X-Received: by 2002:a9d:6e91:: with SMTP id a17mr166967otr.284.1601316768301; 
 Mon, 28 Sep 2020 11:12:48 -0700 (PDT)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id e22sm397977oib.18.2020.09.28.11.12.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Sep 2020 11:12:47 -0700 (PDT)
Received: (nullmailer pid 3011832 invoked by uid 1000);
 Mon, 28 Sep 2020 18:12:47 -0000
Date: Mon, 28 Sep 2020 13:12:47 -0500
From: Rob Herring <robh@kernel.org>
To: Chunfeng Yun <chunfeng.yun@mediatek.com>
Subject: Re: [PATCH] dt-bindings: usb: add properties for hard wired devices
Message-ID: <20200928181247.GA3008733@bogus>
References: <20200928063950.64722-1-chunfeng.yun@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200928063950.64722-1-chunfeng.yun@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200928_141252_582601_93E7DAFE 
X-CRM114-Status: GOOD (  17.11  )
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
Cc: devicetree@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Mon, Sep 28, 2020 at 02:39:50PM +0800, Chunfeng Yun wrote:
> Add some optional properties which are needed for hard wired devices
> 
> Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
> ---
>  Documentation/devicetree/bindings/usb/usb-hcd.yaml | 11 +++++++++++
>  1 file changed, 11 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/usb/usb-hcd.yaml b/Documentation/devicetree/bindings/usb/usb-hcd.yaml
> index 7263b7f2b510..1194a82887e7 100644
> --- a/Documentation/devicetree/bindings/usb/usb-hcd.yaml
> +++ b/Documentation/devicetree/bindings/usb/usb-hcd.yaml
> @@ -22,6 +22,17 @@ properties:
>      description:
>        Name specifier for the USB PHY
>  
> +  "#address-cells":
> +    const: 1
> +
> +  "#size-cells":
> +    const: 0
> +
> +patternProperties:
> +  "^hub|device@[0-9a-f]+$":

Could be any class of device, so '@[0-9a-f]+$'

> +    type: object
> +    description: The hard wired USB devices. See usb/usb-device.txt

Ideally, we'd convert usb-device.txt to schema and reference it here.

> +
>  examples:
>    - |
>      usb {
> -- 
> 2.18.0

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
