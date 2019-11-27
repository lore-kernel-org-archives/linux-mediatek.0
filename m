Return-Path: <SRS0=L+xn=ZT=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 72FFBC432C0
	for <linux-mediatek@archiver.kernel.org>; Wed, 27 Nov 2019 18:10:54 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 491C82070B
	for <linux-mediatek@archiver.kernel.org>; Wed, 27 Nov 2019 18:10:54 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="OK0zC7hI";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=ffwll.ch header.i=@ffwll.ch header.b="EUqC/uYy"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 491C82070B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ffwll.ch
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+lL/90d90onJGjlx3npWRYw0nruAmpvEmGzmh4YqxBM=; b=OK0zC7hIEai9zE
	MCwyS8hdoMaoiYsGM0DoCBqe0FE4j3uOcdgs9qkiswkzK1gStk1W4Sd0T81vDcVfn72gP0fL7hIMp
	/DxjWBcrhJbHIe643hdx7URep+LmYzCHezk/ar4Di3n+OTUIJjrznHU0Cs0hH+B+ZVFk3gQfEMU48
	f87rucS/6ECVasTwxfuzG46yUl8KHVHNx/vARPQJhN9e44D6jaeZ8UB9AAuL4a/wrO5k7QLzQcK2+
	mrLd2WAvgRl00i31LM08Wqb44nIMnuV54PaGHQTN92YwTb6Klt7N4VpDQmm1odCRqWnJPzTCGJ0LI
	N4ajbQyrBXx+SQkxGRKg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ia1m6-0005D1-Bx; Wed, 27 Nov 2019 18:10:50 +0000
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ia1lu-00052s-4V
 for linux-mediatek@lists.infradead.org; Wed, 27 Nov 2019 18:10:39 +0000
Received: by mail-wm1-x343.google.com with SMTP id s14so1853600wmh.4
 for <linux-mediatek@lists.infradead.org>; Wed, 27 Nov 2019 10:10:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=cbv/8/r3sfhd+NMk4eKHS1W+CsksoJnBQ/vFeBDEews=;
 b=EUqC/uYyOQLRXEtsbXGbq5CLVRefhyQ+qJRAcGcsLyvHr6z7hJsxzKw6xqplaCJ7oW
 2vGwh6hRhxvmaeycEjkOAoLO6jgGGXS1+FEW2lE1eHsWd3mxTu694LM41fWeoIpBH7Vg
 YhUg+vlDlYJk9n5tYVNZtLLEKm/64IfgV4D5I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to:user-agent;
 bh=cbv/8/r3sfhd+NMk4eKHS1W+CsksoJnBQ/vFeBDEews=;
 b=j9mVxp4MJxsnIV0Kk+pqBXy961VBkpGa35K4lPtiY3A4I8ohouLpa+SxajcMrIcWXB
 K88MvQIsrBhdkPWMsUJu6i85XxJXkXo1bAXqxSez+enX5JEDsOmk0MPknlncc7bZEdTL
 PRI94k0E3GKUaO7X7aVTOc76wT27/ur2KoPgy/wI/o2r8PZxRBQEjNPurBM/Olck+LKo
 peLxwt51FTx/qz9jTkOKlezSjx6m3L/db1jg3k42MDQRUxGNw3axk4SZBtmwn8cQDb0V
 LzK2cu/osp7DVDCfDeqHQfGYRVD4dgoj7l6s3OCOqyKQwqIkYCD8QgJwCw0OsDd50xqR
 sHNg==
X-Gm-Message-State: APjAAAVRYCXz9NVeYWJFeVWx+Zukw4r2KO+uigtB12EbJTZbe8zAE9GN
 n64MJFrO9gIUeDeFIGx6qhXlaA==
X-Google-Smtp-Source: APXvYqzT8jaNqsYVNrsvu4LEeci1CDFvdEtIFSjKTmi0obdbFp5KUyHs9EfQvXEQTmYckN8AwBDGHw==
X-Received: by 2002:a05:600c:2257:: with SMTP id
 a23mr5940479wmm.143.1574878236283; 
 Wed, 27 Nov 2019 10:10:36 -0800 (PST)
Received: from phenom.ffwll.local (212-51-149-96.fiber7.init7.net.
 [212.51.149.96])
 by smtp.gmail.com with ESMTPSA id g11sm7742001wmh.27.2019.11.27.10.10.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Nov 2019 10:10:35 -0800 (PST)
Date: Wed, 27 Nov 2019 19:10:33 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Mihail Atanassov <Mihail.Atanassov@arm.com>
Subject: Re: [PATCH] drm/mediatek: Fix build break
Message-ID: <20191127181033.GF406127@phenom.ffwll.local>
Mail-Followup-To: Mihail Atanassov <Mihail.Atanassov@arm.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 nd <nd@arm.com>, CK Hu <ck.hu@mediatek.com>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 David Airlie <airlied@linux.ie>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <20191127170513.42251-1-mihail.atanassov@arm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191127170513.42251-1-mihail.atanassov@arm.com>
X-Operating-System: Linux phenom 5.3.0-2-amd64 
User-Agent: Mutt/1.12.2 (2019-09-21)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191127_101038_175118_E4AB2947 
X-CRM114-Status: GOOD (  12.59  )
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
Cc: Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, CK Hu <ck.hu@mediatek.com>,
 nd <nd@arm.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Wed, Nov 27, 2019 at 05:05:32PM +0000, Mihail Atanassov wrote:
> Caused by file removal without adjusting the Makefile.
> 
> Fixes: d268f42e6856 ("drm/mediatek: don't open-code drm_gem_fb_create")
> Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
> Cc: CK Hu <ck.hu@mediatek.com>
> Cc: Philipp Zabel <p.zabel@pengutronix.de>
> Cc: Matthias Brugger <matthias.bgg@gmail.com>
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-mediatek@lists.infradead.org
> Signed-off-by: Mihail Atanassov <mihail.atanassov@arm.com>

Drat, kbuild still sucks if you dont do a clean rebuild :-/

Thanks for the patch, I pushed it.
-Daniel
> ---
>  drivers/gpu/drm/mediatek/Makefile | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/mediatek/Makefile b/drivers/gpu/drm/mediatek/Makefile
> index 8067a4be8311..5044dfb8e3d6 100644
> --- a/drivers/gpu/drm/mediatek/Makefile
> +++ b/drivers/gpu/drm/mediatek/Makefile
> @@ -7,7 +7,6 @@ mediatek-drm-y := mtk_disp_color.o \
>  		  mtk_drm_ddp.o \
>  		  mtk_drm_ddp_comp.o \
>  		  mtk_drm_drv.o \
> -		  mtk_drm_fb.o \
>  		  mtk_drm_gem.o \
>  		  mtk_drm_plane.o \
>  		  mtk_dsi.o \
> -- 
> 2.23.0
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
