Return-Path: <SRS0=oVGr=EB=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 99876C2D0A3
	for <linux-mediatek@archiver.kernel.org>; Mon, 26 Oct 2020 13:30:39 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4088922281
	for <linux-mediatek@archiver.kernel.org>; Mon, 26 Oct 2020 13:30:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="k5OFAOAE"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4088922281
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=qMn+9veXgAd0jgBsOAm9x+Gont+oO4pYKlcupvpZRFU=; b=k5OFAOAE+cLtLfw+dipUq7h2o
	3yTiAYzqyo4IAtgnSUIqiXLxWTRAkULzk9AlYpAMKBixQGPVMSRoamya5NcHQIIX/6YVQ5fOv8Q48
	penxep2ATWt/f6LMjwR4GhsE0sy78zTjyuoYpsEWc/HOA4FVibM/3tni+VwcWuPfO4PDC5z2L18lU
	t/j/dA0i6Qk9vJNfbZ90MIFrXhYLHQf49SUhA95pEIyqGaPYFDhTXhRPgjlTI9Jedp+C99nD7NmSg
	nX+Fw846T5Re4C+wG68HJvaC4IDtoFF7/T8LKrvb73X+LYMqSo5SqsR89twjCdOB/ocvJFMUx+RZE
	oaNk6t2iQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kX2Zy-0005sL-3r; Mon, 26 Oct 2020 13:30:30 +0000
Received: from mail-ot1-f67.google.com ([209.85.210.67])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kX2Zu-0005qQ-Of; Mon, 26 Oct 2020 13:30:29 +0000
Received: by mail-ot1-f67.google.com with SMTP id x7so3747416ota.0;
 Mon, 26 Oct 2020 06:30:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=cPBCTWshldNb+DyrWEllGuNdGSidH3ORsb+qdtp0qFc=;
 b=bhdLD0hQkK8KmN71FTpudnw1sQqwB0GhYnqRQwQEMCtKRcns3nlrd5at663TDtjdO5
 BRIIkOTU8uumhiyJYDOeYPocWJGIH/9gw0EzUgXmj2NEZMHt3ALohH4Xs369YrSpRvHK
 6Xp1VZZ5r+hMIC1A2fKpv25swu7Z2I7uqsNPjXKPMe5wb9Fi1Bn1yozmNAh7uWx07rG+
 ShGYKqueKZF+1LPIjxV8qXMl+kxpndF2vsTC5/Q4qNLS6LHg3hfuolDrHFZFRHriQ6lI
 pAU3a/jbuxcM2EoqNDZpmtpa6jwq4HNmanorZdIRYFoJiOg9bQiCUvoEfFlEqkdW+LKZ
 uSMg==
X-Gm-Message-State: AOAM530gFMKSpua8Q941PPf+xVq/iUX3PoDhP2u5+CsfcjhlT5qE4Ms0
 dJqHH08Oup74vW6YxcrLNg==
X-Google-Smtp-Source: ABdhPJzw6SoFVouAT7FkD/EIAwqrhDs04Eu79z3EyjHzdSZ38W/xzJ6Hl2NKvxsG0Ebl93ht3jFp6Q==
X-Received: by 2002:a05:6830:17d8:: with SMTP id
 p24mr13901537ota.111.1603719025655; 
 Mon, 26 Oct 2020 06:30:25 -0700 (PDT)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id u1sm3884802ooj.28.2020.10.26.06.30.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Oct 2020 06:30:25 -0700 (PDT)
Received: (nullmailer pid 33081 invoked by uid 1000);
 Mon, 26 Oct 2020 13:30:24 -0000
Date: Mon, 26 Oct 2020 08:30:24 -0500
From: Rob Herring <robh@kernel.org>
To: Fabien Parent <fparent@baylibre.com>
Subject: Re: [PATCH 1/2] dt-bindings: timer: mtk-timer: add optional 13m and
 bus clock
Message-ID: <20201026133024.GA33031@bogus>
References: <20201017153857.2494845-1-fparent@baylibre.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201017153857.2494845-1-fparent@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201026_093027_125607_E1A82469 
X-CRM114-Status: GOOD (  11.87  )
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
Cc: devicetree@vger.kernel.org, daniel.lezcano@linaro.org,
 linux-kernel@vger.kernel.org, robh+dt@kernel.org,
 linux-mediatek@lists.infradead.org, matthias.bgg@gmail.com, tglx@linutronix.de,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Sat, 17 Oct 2020 17:38:56 +0200, Fabien Parent wrote:
> The timer IP on MT8516 requires two clocks to be enabled. Add both
> clocks.
> 
> Signed-off-by: Fabien Parent <fparent@baylibre.com>
> ---
>  .../devicetree/bindings/timer/mediatek,mtk-timer.txt         | 5 +++++
>  1 file changed, 5 insertions(+)
> 

Acked-by: Rob Herring <robh@kernel.org>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
