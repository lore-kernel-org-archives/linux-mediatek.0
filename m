Return-Path: <SRS0=qi5H=EL=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 23220C00A89
	for <linux-mediatek@archiver.kernel.org>; Thu,  5 Nov 2020 05:02:55 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7849C20936
	for <linux-mediatek@archiver.kernel.org>; Thu,  5 Nov 2020 05:02:54 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="F+JxC6Yc";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="Y+ZFHZCz"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7849C20936
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=CYGZ+ZTxg+4GXtjmo7qUbmfJd5GBJwDDZnyh/DzcyX4=; b=F+JxC6YcFPGnrXPt/D2/VFNOQ
	UOX4s1EkacI70AFn6z4/46SCywYBGaWLsRIj/0Dk6+VOE7+8ALlFwuYjee45E0+6la/74m6mGbGii
	kUF0qzsL8FFK9+ljYmO30Y+z0md9N8snYVqioNipKPLMbommak9irgccc7IwTknJaiF45VFOIcRv/
	bsGYDoU67E155wKrmyHMNfuJVL1+aHJ4YMFzct6eDiZIIvNnE582LsHDJ2dKkUanDH3P8K6FDMxth
	/OGHG9x8CeHUS2y3gnEFKeBnNpUup2zSQbhGfUQEF6fLVMt/Ybc6fpSxG+sbtKGyQ3TWL3ozS29ga
	jOgO2v07A==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kaXQ0-0003Yc-Aa; Thu, 05 Nov 2020 05:02:40 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kaW6r-000145-AT; Thu, 05 Nov 2020 03:38:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=RoHmyvawdfHUv1CllgHUwLfDLAfJEk1MgJAjHKAD5jA=; b=Y+ZFHZCzYG8m6oa18Sh5Cy5Acc
 ap8C30R+5nRbW0eA79bdpWFGB58RSN1YkRoEI3hzvKvMBG48JVpbWWoAK0Olyqs9EZeegKBkUnsZJ
 s52WdIDz7bXjdWMKSHOk6U6owPNZpb2ejhvPmrlxGlt9SKEFlgwW6hiGXuUje9A1ksJcsw7SZuGSL
 IZ5foNo5nQSLQG60/Gs6oK5sEY1ojLtpjboCUYyK+24ccNG/4pP0g3GC7awl4ietp+NUCeCq63C/7
 0yfDN2tKRrd9sBoTUrbV7PUd2mZmhvU6Kf/jD58nCcAYrqiX+ArJrOZK4NzxXoyFWgYJn7mn+D65U
 pxIjP7Iw==;
Received: from mail-oi1-f194.google.com ([209.85.167.194])
 by casper.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kaQt3-00055x-B4; Wed, 04 Nov 2020 22:04:15 +0000
Received: by mail-oi1-f194.google.com with SMTP id j7so23814906oie.12;
 Wed, 04 Nov 2020 14:04:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=RoHmyvawdfHUv1CllgHUwLfDLAfJEk1MgJAjHKAD5jA=;
 b=g7/VSgvHw7AUits26JhPUW03pI8I648B93CWsp6oWXF8RZ1rRYeEi/1vT7P8ykSkHj
 xtxdF9ND/Eb2vm6zvUfcWaXrEe/mXoMH3awu/uphXEDPAhyrmTsUZ/Qwt9np6K7R+x5S
 h0dpfrKp9DIEVK0uSIU8lCwLpGW+x255NqityOH/jhW8wK33evihCUEYaAaryqcBtAZ8
 v4rkLmfIk5lpc1nACIbpQrOm97XCCvHygHp3fyVrPNTlzOc1t55A9X4besnMLnRjvUb/
 68oAmyuX8o9TnCJzcmy+fii2IKZAVF1bn7LtMONifOJZxi0inbB1GTHdzCTOkgSYUt9s
 QMPA==
X-Gm-Message-State: AOAM532Lo1cZL37CK0a7EeZdFIRh08rJUBtphu2IRTq2vQ/7Fo2sSSGK
 mEw7wRfyIquqC/Ysre8G+Q==
X-Google-Smtp-Source: ABdhPJzGaxwmDh+Yc5KevScWJsbFrWd7wFC9hqALT0pF0pIQ2haITx+cA93FaOeVFC4wgMEYwWoNoA==
X-Received: by 2002:aca:2405:: with SMTP id n5mr4037469oic.9.1604527449714;
 Wed, 04 Nov 2020 14:04:09 -0800 (PST)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id m10sm831660oon.27.2020.11.04.14.04.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Nov 2020 14:04:09 -0800 (PST)
Received: (nullmailer pid 8016 invoked by uid 1000);
 Wed, 04 Nov 2020 22:04:08 -0000
Date: Wed, 4 Nov 2020 16:04:08 -0600
From: Rob Herring <robh@kernel.org>
To: Enric Balletbo i Serra <enric.balletbo@collabora.com>
Subject: Re: [PATCH v4 14/16] dt-bindings: power: Add MT8192 power domains
Message-ID: <20201104220408.GA7986@bogus>
References: <20201030113622.201188-1-enric.balletbo@collabora.com>
 <20201030113622.201188-15-enric.balletbo@collabora.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201030113622.201188-15-enric.balletbo@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201104_220413_699506_E02C70B6 
X-CRM114-Status: GOOD (  10.58  )
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
Cc: devicetree@vger.kernel.org, drinkcat@chromium.org, weiyi.lu@mediatek.com,
 linux-kernel@vger.kernel.org, fparent@baylibre.com,
 Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org,
 hsinyi@chromium.org, matthias.bgg@gmail.com,
 Collabora Kernel ML <kernel@collabora.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Fri, 30 Oct 2020 12:36:20 +0100, Enric Balletbo i Serra wrote:
> From: Weiyi Lu <weiyi.lu@mediatek.com>
> 
> Add power domains dt-bindings for MT8192.
> 
> Signed-off-by: Weiyi Lu <weiyi.lu@mediatek.com>
> Signed-off-by: Enric Balletbo i Serra <enric.balletbo@collabora.com>
> ---
> 
> Changes in v4: None
> Changes in v3: None
> Changes in v2: None
> 
>  .../power/mediatek,power-controller.yaml      |  2 ++
>  include/dt-bindings/power/mt8192-power.h      | 32 +++++++++++++++++++
>  2 files changed, 34 insertions(+)
>  create mode 100644 include/dt-bindings/power/mt8192-power.h
> 

Acked-by: Rob Herring <robh@kernel.org>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
