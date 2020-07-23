Return-Path: <SRS0=cyKo=BC=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 990D7C433E5
	for <linux-mediatek@archiver.kernel.org>; Thu, 23 Jul 2020 21:28:21 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 623FE20768
	for <linux-mediatek@archiver.kernel.org>; Thu, 23 Jul 2020 21:28:21 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="h1jGj3T9"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 623FE20768
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=EAa8nhg2dhhTxbM4vyVNK3b0sYBDC8onaSV3gmV2x9E=; b=h1jGj3T9aBgAr4RDXzA4Y1Fv+
	LaQw7OVwvrQ1YJXuSLB9ymoj/y9wqz/dDfQUbsZ4R3Fz4YyL4cCl4/ywqYKSK9Cw2jiYSkikiraiW
	myuSYDD8W0Ab62zo34htuRVnRc3KCJlmB0bnEFNsgX+SeVxgePhG+S6lEUUvWQyaGShPT3RKsCEVX
	TFVhpRzF0M3z66WhWifg/WU1YAClO2qEfZXi+/rVdbaFnjPOUBBXvM1NEckSWPV1plvPFKlplcnRw
	4ZThyuK9H5ns/RuxRANnmoH3FWpJvbk+JrycX2HDVOPJiMXTNV9b9a/XTBMXYWOdCLP+bvaqu5UfU
	wxuoEeG6A==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jyil5-0003rg-Ax; Thu, 23 Jul 2020 21:28:07 +0000
Received: from mail-il1-f196.google.com ([209.85.166.196])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jyil3-0003rD-BP; Thu, 23 Jul 2020 21:28:06 +0000
Received: by mail-il1-f196.google.com with SMTP id t18so5607443ilh.2;
 Thu, 23 Jul 2020 14:28:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=SGrdVeSEpiWCWaFeRxn1THIMaeD/i6V3qXeYtCopQ5M=;
 b=SFG/0tQi/1kaz8xpkERL8w8eweXtZANS6qB1/w6ejW2B5S848bmEcJmsIBCkJDKCd9
 saSY+VFX/itUa8TuigIvLbKI/u2WPGN2WI8mcBIL40YZ67L6zCgNtOTeBOfLO6PS8+GG
 S+rDY0tCZv32yj8i9e7LZhByzigR4fsAfgoVy3QqRl0q8jkLmngGNs9gtDPo3MQOarZ0
 pTIYou8nTvryyHaTVqrWrSb1fK5Ai2uEqTuiNG4nkaqgk9aGRvCHgGXVhn551hKQL8q1
 I75R7iqmcY6y5whZFiRmDnjv16ajlncbUz0Bl7ns5PqxehSOkJlS1jy53llXTabDc3SA
 XnUw==
X-Gm-Message-State: AOAM533UlGWwBABQKlk/j3xBWUrzpag93EAXS6Qc88tbzExkD69TGfRr
 7g+moj/qo84xW7lgf65XdA==
X-Google-Smtp-Source: ABdhPJz7NZ07oV2YI6+xdgYtE3bNTA7ewz+4xk+gmQaRX1u2WcAI2yQMS726ZBZHBEXxDhgzeLJPAA==
X-Received: by 2002:a92:9e5c:: with SMTP id q89mr317408ili.265.1595539684704; 
 Thu, 23 Jul 2020 14:28:04 -0700 (PDT)
Received: from xps15 ([64.188.179.252])
 by smtp.gmail.com with ESMTPSA id t21sm2086484ioc.0.2020.07.23.14.28.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Jul 2020 14:28:04 -0700 (PDT)
Received: (nullmailer pid 889370 invoked by uid 1000);
 Thu, 23 Jul 2020 21:28:03 -0000
Date: Thu, 23 Jul 2020 15:28:03 -0600
From: Rob Herring <robh@kernel.org>
To: Seiya Wang <seiya.wang@mediatek.com>
Subject: Re: [PATCH 2/4] dt-bindings: serial: Add compatible for Mediatek
 MT8192
Message-ID: <20200723212803.GA889323@bogus>
References: <20200723090731.4482-1-seiya.wang@mediatek.com>
 <20200723090731.4482-3-seiya.wang@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200723090731.4482-3-seiya.wang@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200723_172805_424053_72DEB164 
X-CRM114-Status: GOOD (  10.63  )
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
Cc: devicetree@vger.kernel.org, linux-watchdog@vger.kernel.org,
 srv_heupstream@mediatek.com, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 linux-mediatek@lists.infradead.org, Guenter Roeck <linux@roeck-us.net>,
 linux-serial@vger.kernel.org, Matthias Brugger <matthias.bgg@gmail.com>,
 Wim Van Sebroeck <wim@linux-watchdog.org>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Thu, 23 Jul 2020 17:07:29 +0800, Seiya Wang wrote:
> This commit adds dt-binding documentation of uart for Mediatek MT8192 SoC
> Platform.
> 
> Signed-off-by: Seiya Wang <seiya.wang@mediatek.com>
> ---
>  Documentation/devicetree/bindings/serial/mtk-uart.txt | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring <robh@kernel.org>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
