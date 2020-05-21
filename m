Return-Path: <SRS0=x8tw=7D=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A68B4C433E1
	for <linux-mediatek@archiver.kernel.org>; Thu, 21 May 2020 15:45:16 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 78CFA20829
	for <linux-mediatek@archiver.kernel.org>; Thu, 21 May 2020 15:45:16 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ETL8Sq85";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Rgc33QsB"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 78CFA20829
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wl/5ZkWiqqGvxKqrrSmyyU/TSAVNSgshssCmTTECf6Q=; b=ETL8Sq85BEgSx3
	mEYGWMLNvd2+5/NoMAKlIao8iasUcBhFNe4cbNdFQwwiOM3NvHDP+dBJzRJt8lzgAkDFvX4pKkxrU
	5MDdA3Rbc0WVDHD5RnK8SfDXf0Kq6x//yFGUr3Uc/SHt5aybb5HjJxah5tlQmRKKzcmu8dIA8T292
	bwILXsAO59K8qNsc7M6bHm5rNJvTpu8jWBQHywQAnWx94hYkqQd8C5vvwa0ILuIfl62vl/deAIY9N
	881bqRnfunwSNc06vB0l83Nvq8jNhtCsayDu2ISd0deSflUqWRNvELnFkmyT6rJBJ6x2EPymEWyN1
	a+e9Ov4herkvHZQU9n5g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jbnNZ-0001se-BN; Thu, 21 May 2020 15:45:05 +0000
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jbnNW-0001NV-CA
 for linux-mediatek@lists.infradead.org; Thu, 21 May 2020 15:45:04 +0000
Received: by mail-wm1-x344.google.com with SMTP id h4so5940975wmb.4
 for <linux-mediatek@lists.infradead.org>; Thu, 21 May 2020 08:45:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=c5TekS/gqJoaBFfkjHpLDvrf7L/QxWIjFGYMdytg2QU=;
 b=Rgc33QsBa95gR1OJets/mqYh/8ScIm9Z5t7vXdmjSSxh5PLS1/t+6pIlBZO77OLD5J
 4/SThAZcFF4kRhjq9dnNJoF3MwPPSoaoUQRLMIzRbZ8uhGX2GCoKmgjKxF0R0USd1ST2
 Hxveu0oCMX2gddjgHaxcRfTayVTyvqoXZapjM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=c5TekS/gqJoaBFfkjHpLDvrf7L/QxWIjFGYMdytg2QU=;
 b=o0vhANydtHKT2WmqWLT4J54yIQjGQTMz1avpVh57FnwOuaC36+HkuIvUr78+8Jzh33
 SKjXomNttPoNUZGaCTlIXP6sWShZit6NmhnAcdW5IIznZhNQa5Dks7SwlxjO8UwuVwsj
 4+OiwX4XcNlavvfUFcSyN9SIJElWFD5MZXHk1O+ob734aUHpN9WiBrDZxpMoHIZicKoF
 8ncQ0b6VYzcGBWqjlbfWZSfaebx991uGxxHLJZElhjgzONgSIjaQHx5z6gep1k9XWXLt
 qNWsvHpDHpFctt5VpWP7xh1xOgzmi60DyyvvlDwlJwooLjlWqv2/sNF/FlOXRGpc29c2
 BbIA==
X-Gm-Message-State: AOAM531NWfiIZrleNtrj7wBtuiFHxKCRZ//8y8TJ+JT/AUHw0dLAril8
 W5rRFuNrha/LZzCsQIEyzJ3yqA==
X-Google-Smtp-Source: ABdhPJwAVu5t0ZqfWJtIhj/nNKgxybzQqBLtV6Ok88bjUrcykbcSSAFQiIz/IgQV0Ib4W3Spc6IFAg==
X-Received: by 2002:a1c:ed0b:: with SMTP id l11mr10060544wmh.31.1590075900750; 
 Thu, 21 May 2020 08:45:00 -0700 (PDT)
Received: from chromium.org (205.215.190.35.bc.googleusercontent.com.
 [35.190.215.205])
 by smtp.gmail.com with ESMTPSA id l11sm7201650wmf.28.2020.05.21.08.45.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 May 2020 08:45:00 -0700 (PDT)
Date: Thu, 21 May 2020 15:44:58 +0000
From: Tomasz Figa <tfiga@chromium.org>
To: Xia Jiang <xia.jiang@mediatek.com>
Subject: Re: [PATCH v8 09/14] media: platform: Change MTK_JPEG_COMP_MAX macro
 definition location
Message-ID: <20200521154458.GH209565@chromium.org>
References: <20200403094033.8288-1-xia.jiang@mediatek.com>
 <20200403094033.8288-10-xia.jiang@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200403094033.8288-10-xia.jiang@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200521_084502_445705_7071DC44 
X-CRM114-Status: UNSURE (   9.32  )
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

On Fri, Apr 03, 2020 at 05:40:28PM +0800, Xia Jiang wrote:
> Move MTK_JPEG_COMP_MAX definition to mtk_jpeg_core.h file, because it
> is used by mtk_jpeg_core.c file.
> 
> Signed-off-by: Xia Jiang <xia.jiang@mediatek.com>
> ---
> v8: no changes
> ---
>  drivers/media/platform/mtk-jpeg/mtk_jpeg_core.h | 2 ++
>  drivers/media/platform/mtk-jpeg/mtk_jpeg_reg.h  | 1 -
>  2 files changed, 2 insertions(+), 1 deletion(-)
> 

Reviewed-by: Tomasz Figa <tfiga@chromium.org>

Best regards,
Tomasz

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
