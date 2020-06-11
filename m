Return-Path: <SRS0=zMKO=7Y=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9C73EC433E0
	for <linux-mediatek@archiver.kernel.org>; Thu, 11 Jun 2020 16:49:26 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6F3F62053B
	for <linux-mediatek@archiver.kernel.org>; Thu, 11 Jun 2020 16:49:26 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Hb/Ej7Zh";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="HSWrP87U"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6F3F62053B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Yb1O3WSy08Ck7bpWH740cHG0e7osd9nRq56hKfmlu6I=; b=Hb/Ej7Zhy6rAT9
	yoVK39r24CFwcYZfywqq8NAsDVKsY5TBpMns+EK1xG8lH9xS7QPRQKF8nCtX8tjj/tptjexgmJ+cV
	jTukDD+PjyKohC13s8SiZ+FLy/21V9HEJe2vd3anLgOY7IImH37E8KjzvMLYoL7M6RlnJovtAwzPK
	LomrHs2eTYPc5VcB8HpcAGI5PL87d5dscDuSEAFCTIlDtcxF5JZ3vIuuSnR/cr29v6KthGwZBWGd1
	nFuqJJCbjC7goy4m/opNIDWilILEcSm4yF29z6ee2n5I3GdfxjIn7lgjvUizLqsBi5+g6kgOYBmsr
	sTOXigPKgSQgey1h5BOg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jjQOC-0006GW-KL; Thu, 11 Jun 2020 16:49:16 +0000
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jjQNy-00066M-Qo
 for linux-mediatek@lists.infradead.org; Thu, 11 Jun 2020 16:49:04 +0000
Received: by mail-wm1-x342.google.com with SMTP id u26so7346670wmn.1
 for <linux-mediatek@lists.infradead.org>; Thu, 11 Jun 2020 09:49:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=m9GN5WBKEYYIgIwqXSwTbOuQ7tSpufKewkY859VD9LM=;
 b=HSWrP87UGB+MThNp2ov2M6zIYZLHZyM9tjClOB6qyUS4MR3lFJvhcbxgMQPtlX4keX
 Guz1BkTJfTJJDseuVmY0mAHX/qTGcvJH8UBW43emcyHkEAcsZ5fyGYoIQG5zaCXbRwMp
 2x9t0TjTVlzuACBZ5Ey7aewg3gb+W2fxfZdLs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=m9GN5WBKEYYIgIwqXSwTbOuQ7tSpufKewkY859VD9LM=;
 b=WQQG6sLV2HHjSLjN2YaFaeXDVhYqIDK1hGJRicDu4xm6EUcn+sYd7cIUH2IS1drUy8
 mjESxKLggc72gdvwPL+1BQ4z5C1evZkwL0YbhYJ8hEHm0zzJJPJddYzgDDy4nuIcsH1k
 ST0qiO1Fqf/8qig9mKDez5sdCK27WBBNrs/diqAeQlFeqiDuhcYTZMKCMyUJDS+yMzjq
 g5aQheWxfxgdWg8TlltNccvoaf8A8jsNluqishHbri92hau4TOxQIJr+5v0s/GLWgoK2
 rJXlPCZpLwRnvBsYByj/pACEYaNS1fIHXSPlcpHkSICngxK9e+4C/P9zXvuuNkMVM6jn
 s6kA==
X-Gm-Message-State: AOAM5331bNDLCXioY5w3ejxOCkKcyaLiqdHUq+P4z4kY2Duc5HdJKgxI
 SpbxgWAO8tfOxsRnVpL8SLyXXw==
X-Google-Smtp-Source: ABdhPJxVAMW67/K46mT3Ow+twrNQzG3BwFWjaG3jRfjfJfAuUr3TOn/DQ9B52KybIBJfI0dVIFdeDA==
X-Received: by 2002:a1c:38c2:: with SMTP id f185mr9376689wma.79.1591894141050; 
 Thu, 11 Jun 2020 09:49:01 -0700 (PDT)
Received: from chromium.org (205.215.190.35.bc.googleusercontent.com.
 [35.190.215.205])
 by smtp.gmail.com with ESMTPSA id n23sm4666480wmc.21.2020.06.11.09.49.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Jun 2020 09:49:00 -0700 (PDT)
Date: Thu, 11 Jun 2020 16:48:59 +0000
From: Tomasz Figa <tfiga@chromium.org>
To: Xia Jiang <xia.jiang@mediatek.com>
Subject: Re: [PATCH RESEND v9 17/18] media: platform: Rename existing
 functions/defines/variables
Message-ID: <20200611164859.GA8694@chromium.org>
References: <20200604090553.10861-1-xia.jiang@mediatek.com>
 <20200604090553.10861-19-xia.jiang@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200604090553.10861-19-xia.jiang@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200611_094902_872167_FFCFAAC7 
X-CRM114-Status: UNSURE (   8.67  )
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

On Thu, Jun 04, 2020 at 05:05:52PM +0800, Xia Jiang wrote:
> Rename existing funcitons/defines/variables with a  _dec prefix and
> without dec_ prefix to prepare for the addition of the jpeg encoder
> feature.
> 
> Signed-off-by: Xia Jiang <xia.jiang@mediatek.com>
> ---
> v9: new patch
> ---
>  .../media/platform/mtk-jpeg/mtk_jpeg_core.c   | 200 +++++++++---------
>  .../media/platform/mtk-jpeg/mtk_jpeg_core.h   |   8 +-
>  .../media/platform/mtk-jpeg/mtk_jpeg_dec_hw.h |   7 +-
>  3 files changed, 109 insertions(+), 106 deletions(-)
> 

Reviewed-by: Tomasz Figa <tfiga@chromium.org>

Best regards,
Tomasz

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
