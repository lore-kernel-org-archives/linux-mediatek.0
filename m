Return-Path: <SRS0=x8tw=7D=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BB0C5C433E0
	for <linux-mediatek@archiver.kernel.org>; Thu, 21 May 2020 13:47:46 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 867BE20721
	for <linux-mediatek@archiver.kernel.org>; Thu, 21 May 2020 13:47:46 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="W92va3nu";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="jyfLBevZ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 867BE20721
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NkbjYgHZMh2wZQ7AefPnuDfr7PJtwv5de8w3z6s7zIQ=; b=W92va3nuVQc1n7
	NH9DCjNfKcXEPK/DW+XdNIZAjsl8FON1gSQaHUZobb0tlxuszhdUUPmPRrv1EnlGshg/CrT9Pe8sT
	eigvJk/J9tm0ggBWgbyUbaUefBVy7cvozmf4MZEwYhwNv0VcCyLinB083Nh93fV0HYxnPT1RsPxKq
	Ke/LqkeAgOdx1ATwy6KTMjPsrswmhGhkCg0+I+ZKtplH+WG+Vp7JL7RiCwlqTVEpHhQvuFqJfBEgQ
	5KVcE/W5uJjJL3U6pIchfcCBcWP8iilSunToDs5EODw7uzthyYAG+B57OadF3fZjbwtYUXPXCViPB
	eiyn55Kl6GF34PR1STYQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jblXu-0006Z1-SO; Thu, 21 May 2020 13:47:38 +0000
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jblXr-0006XK-UI
 for linux-mediatek@lists.infradead.org; Thu, 21 May 2020 13:47:37 +0000
Received: by mail-wm1-x344.google.com with SMTP id n5so6437071wmd.0
 for <linux-mediatek@lists.infradead.org>; Thu, 21 May 2020 06:47:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=WigAm6R3JnrkS0bWmUO3ZB1tWo9KDMYSlwhtkqHAIps=;
 b=jyfLBevZAiI3qkkBfstEElorOWNvUcbZe8+NYJX9vsFk4WpXks+gPfEuN04Ws3MixW
 1mt8vxFWFKxT/FwXh70xQ7l9mzqNXQq5l4CvApuE0h0xAxvzt9GxF+lHFlAYvUYwaNDC
 XcFDRdRO+IS0Xt+i8dnhvNyGG05gut8vNkPUk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=WigAm6R3JnrkS0bWmUO3ZB1tWo9KDMYSlwhtkqHAIps=;
 b=cOoBathX0nq/hhC9FEx397Z63hCsKV1G1puNko8PUQCSI9UoY8iANZmwPJcL4sfvzv
 RmXphL0FyVWqsPrTydw8pIq3uIQF9d4gu00PH3vgCODjGUN890fJy5m+o+/Z+vyMUhW4
 h7Yfimx+j5SA7cuZ2hH/OTSbg5sEwAtgSAzjfFqKT+1wFz9DeXyZZeNH0g08Gvpn0fIu
 0cWweQRlMP5wAQKPoadkaeOcqGolpruUlrYkhCTjpUTvMvPjbdDb/q8JQ1rwq51iZ+gL
 GdDm5nqVLq/ltWOgu7nB+KHb1KhntDtJjgekSAUdwULOyvovr6pviESkTZ8BD4hhtWes
 Y2dw==
X-Gm-Message-State: AOAM531QhLo6PeZnu4dbd0GYM50vpL9zlLw5WNvbEA4uTVxWZyTUuB0I
 nZXLw/n0HEzEC4XIbT3AC5oEQA==
X-Google-Smtp-Source: ABdhPJycudi/4ZFEocfK7FGUn/bFSMM2TZDaR2Ql4yDG5QBmvorZtq7f/VZXArUqQ7+SPm0CNXRP+w==
X-Received: by 2002:a1c:2e46:: with SMTP id u67mr8770259wmu.156.1590068853633; 
 Thu, 21 May 2020 06:47:33 -0700 (PDT)
Received: from chromium.org (205.215.190.35.bc.googleusercontent.com.
 [35.190.215.205])
 by smtp.gmail.com with ESMTPSA id q4sm6733605wma.9.2020.05.21.06.47.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 May 2020 06:47:32 -0700 (PDT)
Date: Thu, 21 May 2020 13:47:31 +0000
From: Tomasz Figa <tfiga@chromium.org>
To: Xia Jiang <xia.jiang@mediatek.com>
Subject: Re: [PATCH v8 03/14] media: platform: Improve getting and requesting
 irq flow for bug fixing
Message-ID: <20200521134731.GC209565@chromium.org>
References: <20200403094033.8288-1-xia.jiang@mediatek.com>
 <20200403094033.8288-4-xia.jiang@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200403094033.8288-4-xia.jiang@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200521_064735_975382_D5749802 
X-CRM114-Status: UNSURE (   9.08  )
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

On Fri, Apr 03, 2020 at 05:40:22PM +0800, Xia Jiang wrote:
> Delete platform_get_resource operation for irq.
> Return actual value rather than EINVAL when fail to get and request
> irq.
> 
> Signed-off-by: Xia Jiang <xia.jiang@mediatek.com>
> ---
>  drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c | 7 ++-----
>  1 file changed, 2 insertions(+), 5 deletions(-)
> 

Reviewed-by: Tomasz Figa <tfiga@chromium.org>

Best regards,
Tomasz

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
