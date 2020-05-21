Return-Path: <SRS0=x8tw=7D=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B3A90C433DF
	for <linux-mediatek@archiver.kernel.org>; Thu, 21 May 2020 13:45:49 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 73E2A20721
	for <linux-mediatek@archiver.kernel.org>; Thu, 21 May 2020 13:45:49 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="oEKZD26M";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="dGmoucgr"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 73E2A20721
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ycBEtMZnOeCV8QCqJxz4KR81sx+8EdvuAMae3GM+gJs=; b=oEKZD26MSAUZym
	67kKrTSEz71c1AeA9Hf9H9+hJaZuptFdTZrr+OqHO6bNfcHkuyagyLM+5zfLrhrzL5pE+DrgmK++P
	N3klVic+vCiUwioM703LpRQkI84co+cRqFvtb87xU98AKfO9Nb9grEXB9FtWVjIH6J6QfKy0SwUvv
	jEh0qHQMhhtnf5VsJMwJtJ6OEn2MnMs9Im2T+ovRM7fOQWW+zj3M2je4KelFDmF5oN/gdCWsfSczV
	ZiIlMEeP6yBDRAQOOgSREloHOC2dPUNTJiqsl7PtUP1Oq4VBMbJwKoGn2R2AhGQkhHvU5aBLKNuTK
	POm8MjVWdQXXBb5R3jIg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jblW2-0005Xo-Uv; Thu, 21 May 2020 13:45:42 +0000
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jblVs-0005Eo-SU
 for linux-mediatek@lists.infradead.org; Thu, 21 May 2020 13:45:34 +0000
Received: by mail-wm1-x341.google.com with SMTP id u12so1622743wmd.3
 for <linux-mediatek@lists.infradead.org>; Thu, 21 May 2020 06:45:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=MIZbow6oCp6jhBPcKsqdy9EnMAR8LQb1Wb+CIClZf0I=;
 b=dGmoucgrWl3fcaqDll9a/qRPLlA7s730yc2z/WBzNFxuL2a+M1qwz4OOCwGd++fhKy
 p8H1ZqTfH5xn8dw70XzKJISp6Vd7YqNQ/dPn7g8DE4Th7Ys7glQVxU1ajIvWn44+3/e0
 7gWzJKL3HsAPQXv9L62UgO6S71k5LFILN3dbQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=MIZbow6oCp6jhBPcKsqdy9EnMAR8LQb1Wb+CIClZf0I=;
 b=W6JCT6PpnfAxBtkYrMBnYiT4DJ/JT1znddNhRZLaBO73Nlfx79Zj4ZuENmXi0aboY7
 4csxt5bpWZ7VmTXgBdRhdB4DKVeQwU5VYNeDNl14f87Qtv0UlJAMldzaKWoybNnooryF
 hrCkjrwF7ibxhU3F6NhIwuzzhztMKfQR9+Z3GYs+FRT3CP1fnGDY24f3WQCHHeAhxb01
 e62U7wRFsYd14V1sJp2iybFUANnFsZQ13w0otVA9U+FIBvOv7lG0FHT/O7lkjHld1TuT
 HF5etTrqIHQrU5BxiMDv3PWL/e09/8VEheCEgyPsFxgyaB1Q7U3+qfUoHhXdyaniqW35
 2KqA==
X-Gm-Message-State: AOAM5302VNAMSPIimR+Wc+gpC1dL2YI3M86ANvtEyrTtWowcsdCayfps
 WPLNrTPMiZ/Qp4HUjAyjjQ8jYQ==
X-Google-Smtp-Source: ABdhPJzga0snvqqhabMrMb1GYaE9P70IQw0mFqh2Y8F+1nN0c5PVJEQNf6mkgxlQ/6SKai9ltVpOxA==
X-Received: by 2002:a7b:c4cc:: with SMTP id g12mr8844805wmk.168.1590068728336; 
 Thu, 21 May 2020 06:45:28 -0700 (PDT)
Received: from chromium.org (205.215.190.35.bc.googleusercontent.com.
 [35.190.215.205])
 by smtp.gmail.com with ESMTPSA id e29sm296309wra.7.2020.05.21.06.45.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 May 2020 06:45:27 -0700 (PDT)
Date: Thu, 21 May 2020 13:45:26 +0000
From: Tomasz Figa <tfiga@chromium.org>
To: Xia Jiang <xia.jiang@mediatek.com>
Subject: Re: [PATCH v8 01/14] media: platform: Improve subscribe event flow
 for bug fixing
Message-ID: <20200521134526.GA209565@chromium.org>
References: <20200403094033.8288-1-xia.jiang@mediatek.com>
 <20200403094033.8288-2-xia.jiang@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200403094033.8288-2-xia.jiang@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200521_064532_919889_9652E244 
X-CRM114-Status: UNSURE (   9.12  )
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

On Fri, Apr 03, 2020 at 05:40:20PM +0800, Xia Jiang wrote:
> Let v4l2_ctrl_subscribe_event() do the job for other types except
> V4L2_EVENT_SOURCE_CHANGE.
> 
> Signed-off-by: Xia Jiang <xia.jiang@mediatek.com>
> ---
> v8: no changes
> ---
>  drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 

Reviewed-by: Tomasz Figa <tfiga@chromium.org>

Best regards,
Tomasz

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
