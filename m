Return-Path: <SRS0=MDtk=CY=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4B104C43461
	for <linux-mediatek@archiver.kernel.org>; Tue, 15 Sep 2020 15:53:21 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D76AC208E4
	for <linux-mediatek@archiver.kernel.org>; Tue, 15 Sep 2020 15:53:20 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="DauE8hmP"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D76AC208E4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=qnx3G80RwNsRYQISq2xhEdo2iqLmk+hVtgbmpyPrASQ=; b=DauE8hmPEyg7BW6KC9V2I5Voe
	MXfHtgzwH6e31LoMdcruByYKy/l/M50cSOraMtj6RXGTHnWYFLG0HqPINe979R/nUJG+5ffL0HuAh
	aJu41riVYJUU8ptycXM2gAOlwWTXZyFqvK4fpmovm9WYdJjAH4HqCjE7mQsRzS97K56fi2RC9Hj33
	qCnUklyfGPZk2ZRUUU863hvf94/uGa9Tx/M3koCvo0X40SrLSTlE2R4p4EebZW5sqyN1tm0Vv9hyc
	8g0eaKmAHqWq5nMNphAEwJ9LgD6AV6fxPmlQyMFyiW0eyeeRc7bqDf6hAE79A016fLHEPvpXM9KTb
	DIkWUB9eg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kIDGX-0006VM-V9; Tue, 15 Sep 2020 15:53:10 +0000
Received: from mail-io1-f68.google.com ([209.85.166.68])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kIDGS-0006TR-Bt; Tue, 15 Sep 2020 15:53:05 +0000
Received: by mail-io1-f68.google.com with SMTP id m17so4651105ioo.1;
 Tue, 15 Sep 2020 08:53:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=Ffvw1RavwEYs31p6FTUFrJH4oyQnQP2TfpPxRHIwLSQ=;
 b=N4HtcrpcfAdH9iqcZF4bm2nHCZiIHfAreLF4RT8G0g5kAL7ADHfmapt3FXddx5Vq1V
 YzGSAscMhKsVrMfx9OoldrICkH1VgPMzzBOSLErIByrNTBvWRftSFZ75Vq5j84ww5sOE
 EFvi2po1YF1cJ+n4U8OtvCjPjgCVvANY+aVRdU0caMJB5t22twkYA+HKMiksqKop9L24
 nMkvz3eARxOnac+tP95ktE52OQIUWtWuQfpQYDp1uL9eP7oCD4S2VYP9sQQzR2M7z247
 6aNf7jd1/KmmhJ4VER+Ao7mB33rObt/cOk5DQqz86ii0vKSdoc6lN8Iqx3LuwvrgtIjI
 ZjYw==
X-Gm-Message-State: AOAM533YDZOjGEIZ6dfH+f4Qb6hSPGg4fbheI+2y68+QJdFyePH8Wh9E
 YIYm/cv/30C5KvVTe9RHxw==
X-Google-Smtp-Source: ABdhPJy+51PIhDeMmQSSuCP2lG9WkD/Av/9uK/A9S1hx/hdiU50eltj4EBryIZvU08/axCmKJ4xtmQ==
X-Received: by 2002:a05:6638:134b:: with SMTP id
 u11mr18497798jad.18.1600185183409; 
 Tue, 15 Sep 2020 08:53:03 -0700 (PDT)
Received: from xps15 ([64.188.179.253])
 by smtp.gmail.com with ESMTPSA id s13sm8834631ilq.16.2020.09.15.08.53.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Sep 2020 08:53:02 -0700 (PDT)
Received: (nullmailer pid 2017061 invoked by uid 1000);
 Tue, 15 Sep 2020 15:53:01 -0000
Date: Tue, 15 Sep 2020 09:53:01 -0600
From: Rob Herring <robh@kernel.org>
To: Fabien Parent <fparent@baylibre.com>
Subject: Re: [PATCH 1/2] pinctrl: mt65xx: add OF bindings for MT8167
Message-ID: <20200915155301.GA2017005@bogus>
References: <20200907110221.1691168-1-fparent@baylibre.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200907110221.1691168-1-fparent@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200915_115304_447626_C93F878E 
X-CRM114-Status: GOOD (  10.98  )
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
Cc: devicetree@vger.kernel.org, linus.walleij@linaro.org, sean.wang@kernel.org,
 linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, robh+dt@kernel.org,
 linux-mediatek@lists.infradead.org, matthias.bgg@gmail.com,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Mon, 07 Sep 2020 13:02:20 +0200, Fabien Parent wrote:
> Add binding documentation of pinctrl-mt65xx for MT8167 SoC.
> 
> Signed-off-by: Fabien Parent <fparent@baylibre.com>
> ---
>  Documentation/devicetree/bindings/pinctrl/pinctrl-mt65xx.txt | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring <robh@kernel.org>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
