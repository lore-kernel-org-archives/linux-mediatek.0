Return-Path: <SRS0=MDtk=CY=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AE534C433E2
	for <linux-mediatek@archiver.kernel.org>; Tue, 15 Sep 2020 15:57:01 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 44CCC206B7
	for <linux-mediatek@archiver.kernel.org>; Tue, 15 Sep 2020 15:57:01 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="VhpWHG8j"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 44CCC206B7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=9B4wcx8LaZ+0jvKlNiiHUcijUldDWmzAEb5mBeN0bAw=; b=VhpWHG8jEkbSZNpcvJJ9NLXKl
	bDvgQMvyEhmYOt55Hd+UuvTR8CJlCn1IHBT+XYsngBqbftPCFro/wQQk8G9DuYvmMoyOZVFzDnmQO
	D5BAfk3j54sj9kTnoKgqkALJPXr9aemOeScvUVEhxNQbko/ISOvC0zufxkCask4Z/4Bw4X/KoCbIE
	sTcbk7XrjGBC+fTCHIo/wn0bWjJim6NQ/Zo4fns0fOEeJqucq20SL1WVMuqZYLqVRw1f963Ppfkkt
	vbwdHZ2rflxKJqu/3fLvdTdFxe+zovd8LCCLCWa6oXuson5yXouvThQH8TaxXwhnroVGR+HGM4ELI
	jzJ6AAb4A==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kIDK6-0007cO-6d; Tue, 15 Sep 2020 15:56:50 +0000
Received: from mail-io1-f66.google.com ([209.85.166.66])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kIDK2-0007an-Om; Tue, 15 Sep 2020 15:56:47 +0000
Received: by mail-io1-f66.google.com with SMTP id g7so4577007iov.13;
 Tue, 15 Sep 2020 08:56:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=Qq/umR2+igR2EbykY/qBvvF56Ie8JdULF4COjV3FUEE=;
 b=b0lrAPnP7GZ1qdMQ26T/Y9+YZCFFmPSQ515rU08vkN7SRfPq11E+9+he5DiBUF2rw7
 1ubozWuZyVGIEQFKsbdyybLUj4UCS5zCSXalXI/bj2I9bMTUPiwfCCt4RHKr0dfaKIEn
 9LmlGxRo2os0f9+4sj8jDFv3eAKiOI9dqM0ZvUIi5D10y3sCJYa4zr9qgCuuYbdqSiFc
 YX528ZA/leLiMdIRvgjIbbWUkL7hU9eKp3rw5saJ3Bt0pOMKeel7lRLuWdeDUocVBZRD
 SgAhRhiF/Eg9GhnA+1xfbbH1L3yYW6saEUT5vWMiITDSukUIO4AB7ntrKYJcXYr98kcn
 pLfA==
X-Gm-Message-State: AOAM531WxQDjTl6mVsi1mA9LsLvY9zx1Av4U9LYpVeQZMmJGfgNPAWay
 qP/Ko78mvA35YmDiNaLErA==
X-Google-Smtp-Source: ABdhPJwM8FrqARUef6Insy0Hs85VhiHCgHuUtmKvLN32AAutZdzyMDMACDHa7+pa7wHE4mHOR7TOLg==
X-Received: by 2002:a6b:8b52:: with SMTP id n79mr15470287iod.122.1600185406059; 
 Tue, 15 Sep 2020 08:56:46 -0700 (PDT)
Received: from xps15 ([64.188.179.253])
 by smtp.gmail.com with ESMTPSA id l16sm9157487ilc.3.2020.09.15.08.56.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Sep 2020 08:56:45 -0700 (PDT)
Received: (nullmailer pid 2022676 invoked by uid 1000);
 Tue, 15 Sep 2020 15:56:41 -0000
Date: Tue, 15 Sep 2020 09:56:41 -0600
From: Rob Herring <robh@kernel.org>
To: Fabien Parent <fparent@baylibre.com>
Subject: Re: [PATCH 1/2] dt-bindings: clock: mediatek: add bindings for
 MT8167 clocks
Message-ID: <20200915155641.GA2022646@bogus>
References: <20200907125646.1946282-1-fparent@baylibre.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200907125646.1946282-1-fparent@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200915_115646_821128_F84CD4FB 
X-CRM114-Status: GOOD (  11.28  )
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
Cc: devicetree@vger.kernel.org, sboyd@kernel.org, masahiroy@kernel.org,
 linux-kernel@vger.kernel.org, krzk@kernel.org, ck.hu@mediatek.com,
 enric.balletbo@collabora.com, robh+dt@kernel.org, mars.cheng@mediatek.com,
 macpaul.lin@mediatek.com, wendell.lin@mediatek.com, matthias.bgg@gmail.com,
 linux-mediatek@lists.infradead.org, owen.chen@mediatek.com,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Mon, 07 Sep 2020 14:56:45 +0200, Fabien Parent wrote:
> Add binding documentation for topckgen, apmixedsys, infracfg, audsys,
> imgsys, mfgcfg, mmsys, vdecsys on MT8167 SoC.
> 
> Signed-off-by: Fabien Parent <fparent@baylibre.com>
> ---
>  .../arm/mediatek/mediatek,apmixedsys.txt      |   1 +
>  .../bindings/arm/mediatek/mediatek,audsys.txt |   1 +
>  .../bindings/arm/mediatek/mediatek,imgsys.txt |   1 +
>  .../arm/mediatek/mediatek,infracfg.txt        |   1 +
>  .../bindings/arm/mediatek/mediatek,mfgcfg.txt |   1 +
>  .../arm/mediatek/mediatek,topckgen.txt        |   1 +
>  .../arm/mediatek/mediatek,vdecsys.txt         |   1 +
>  include/dt-bindings/clock/mt8167-clk.h        | 131 ++++++++++++++++++
>  8 files changed, 138 insertions(+)
>  create mode 100644 include/dt-bindings/clock/mt8167-clk.h
> 

Reviewed-by: Rob Herring <robh@kernel.org>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
