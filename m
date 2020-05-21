Return-Path: <SRS0=x8tw=7D=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4A8F2C433DF
	for <linux-mediatek@archiver.kernel.org>; Thu, 21 May 2020 16:02:38 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1005C20748
	for <linux-mediatek@archiver.kernel.org>; Thu, 21 May 2020 16:02:37 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="OKwvT2Re";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="IGMUFSuZ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1005C20748
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=r5xIBZu/yRaJ4Kbt4CFXlTbpX11tNPJttn/THZIKfvg=; b=OKwvT2ReyyuSkf
	idGvbRGxTF0losHtl6Cn+sGItJwE+MkUHw/HcSAYuj1ImlUjqFcZ5k5MUU+05hU5wj2aULQ1i68Uh
	dzCLdzvFO6OfQRgSsnElTIa7pYT+MuuGrWx8PX0jFGvywLc4kHcTpjABtUXNBXD6ozEYsK8WQ9SYi
	GKJN76rVnF5Kc9+UZxuG7iJa32IWvRlmVJcVtQAWbNW5uD2iR2w/j2/kxjyUjUTsIPnAG2kJ+EO3C
	EFn6kWEoCBrQErIwW7kPaqrSjO2z8f0xEoee03sftwFzb3U4l45sDtY7VHJOcumhzPXdCkQJ+5woj
	oJdGveZd48K6nX/zt1Nw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jbneR-0006NZ-Bk; Thu, 21 May 2020 16:02:31 +0000
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jbneP-0006My-6f
 for linux-mediatek@lists.infradead.org; Thu, 21 May 2020 16:02:30 +0000
Received: by mail-wm1-x344.google.com with SMTP id u188so6915885wmu.1
 for <linux-mediatek@lists.infradead.org>; Thu, 21 May 2020 09:02:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=FFgD33+aNouNGQWGPAQ82q8pOVxArb54Ymtj9k6c/CI=;
 b=IGMUFSuZHglbq89dE4lbiHY6u0LsaqFDfzsLsjDKYGX4etHufoYeD8MS2j3VMbQ2PM
 QYQ2wFMBSsxWjwvI7O4lhXaSNIwjtur44RocetRNs9sxRMWwWs7HxhKmb6El1eqr43uc
 qj5WC8JdzADa1cvKlTb2t6+rKtlh1XdmkFwVg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=FFgD33+aNouNGQWGPAQ82q8pOVxArb54Ymtj9k6c/CI=;
 b=hNWY5KIY9FDy/elAVV6bgsfiKQH6KDJvbkgkuPavViBvZqlcGSsCMDKjC+K5UkT/RE
 rL7V3o8DF8O401biVe/WmPamG0DsRsVZujYUAEpwy1Ci5xgOWVbNE7kZrzBRHTv0Xg1F
 U77EjmC3BOtHvX0Edv9yXMNWShCWTZewk35VEiMTM/JaoeSJmdoFQ0VHy7MRmsqS6oSW
 1t6g5YI6eBFV1ZAwKt+K30oqHKTQw+RdMoD9PTkwD8JnZYYnKws9H3sMxmV3omb7EwjL
 hEJNgvCJD6pF3KPzg9owklIM2q7y/x+V/Da2UcD28g6UQvMLQDNJFFOS0koZ2fa/Bj8A
 x4HA==
X-Gm-Message-State: AOAM532+7U1dGRpglOlaVsejcX4ws23TzqxVa7ZbC1nZD/WkuqR7yKJq
 OpTRdWWBZJ2cFV3s2gQSE4xfVA==
X-Google-Smtp-Source: ABdhPJyvZZpk19V7dcx34aHKaL1bXMZY4n4ffWiVEXRuCg9hQzx9AwjLNVAy7P/eRQEZ4BCf3LkRUw==
X-Received: by 2002:a7b:c207:: with SMTP id x7mr9976002wmi.79.1590076948087;
 Thu, 21 May 2020 09:02:28 -0700 (PDT)
Received: from chromium.org (205.215.190.35.bc.googleusercontent.com.
 [35.190.215.205])
 by smtp.gmail.com with ESMTPSA id x10sm7147943wrn.54.2020.05.21.09.02.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 May 2020 09:02:27 -0700 (PDT)
Date: Thu, 21 May 2020 16:02:26 +0000
From: Tomasz Figa <tfiga@chromium.org>
To: Xia Jiang <xia.jiang@mediatek.com>
Subject: Re: [PATCH v8 13/14] media: platform: Rename jpeg dec file name
Message-ID: <20200521160226.GK209565@chromium.org>
References: <20200403094033.8288-1-xia.jiang@mediatek.com>
 <20200403094033.8288-14-xia.jiang@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200403094033.8288-14-xia.jiang@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200521_090229_249693_D42E2C54 
X-CRM114-Status: UNSURE (   9.96  )
X-CRM114-Notice: Please train this message.
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
Cc: drinkcat@chromium.org, devicetree@vger.kernel.org, mojahsu@chromium.org,
 srv_heupstream@mediatek.com, Rick Chang <rick.chang@mediatek.com>,
 senozhatsky@chromium.org, linux-kernel@vger.kernel.org,
 maoguang.meng@mediatek.com, Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
 sj.huang@mediatek.com, Rob Herring <robh+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>, linux-mediatek@lists.infradead.org,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi Xia,

On Fri, Apr 03, 2020 at 05:40:32PM +0800, Xia Jiang wrote:
> Rename the files which are for decode feature. This is preparing
> path since the jpeg enc patch will be added later.
> 
> Signed-off-by: Xia Jiang <xia.jiang@mediatek.com>
> ---
> v8: no changes
> 
> v7: no changes
> 
> v6: no changes
> 
> v5: no changes
> 
> v4: no changes
> 
> v3: no changes
> 
> v2: no changes
> ---
>  drivers/media/platform/mtk-jpeg/Makefile                      | 2 +-
>  drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c               | 4 ++--
>  .../platform/mtk-jpeg/{mtk_jpeg_hw.c => mtk_jpeg_dec_hw.c}    | 2 +-
>  .../platform/mtk-jpeg/{mtk_jpeg_hw.h => mtk_jpeg_dec_hw.h}    | 2 +-
>  .../mtk-jpeg/{mtk_jpeg_parse.c => mtk_jpeg_dec_parse.c}       | 2 +-
>  .../mtk-jpeg/{mtk_jpeg_parse.h => mtk_jpeg_dec_parse.h}       | 2 +-
>  .../platform/mtk-jpeg/{mtk_jpeg_reg.h => mtk_jpeg_dec_reg.h}  | 0
>  7 files changed, 7 insertions(+), 7 deletions(-)
>  rename drivers/media/platform/mtk-jpeg/{mtk_jpeg_hw.c => mtk_jpeg_dec_hw.c} (99%)
>  rename drivers/media/platform/mtk-jpeg/{mtk_jpeg_hw.h => mtk_jpeg_dec_hw.h} (98%)
>  rename drivers/media/platform/mtk-jpeg/{mtk_jpeg_parse.c => mtk_jpeg_dec_parse.c} (98%)
>  rename drivers/media/platform/mtk-jpeg/{mtk_jpeg_parse.h => mtk_jpeg_dec_parse.h} (92%)
>  rename drivers/media/platform/mtk-jpeg/{mtk_jpeg_reg.h => mtk_jpeg_dec_reg.h} (100%)
> 

Reviewed-by: Tomasz Figa <tfiga@chromium.org>

Best regards,
Tomasz

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
