Return-Path: <SRS0=SroS=L6=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4875FC11FE4
	for <linux-mediatek@archiver.kernel.org>; Tue,  6 Jul 2021 11:40:20 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 12F2C61E81
	for <linux-mediatek@archiver.kernel.org>; Tue,  6 Jul 2021 11:40:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 12F2C61E81
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ffwll.ch
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CxvEy5z7pDCy7zDQJWOfaw+PHBDTKxX6iQOHQmqoQhk=; b=oTCwarfDotxcLE
	yk6BnpftQw/C3m+mbq68Owi9QOIvbtKk4Jfn1IqwR7+YAYdak/3ZDUz4U8jvdLIJdY5Vx87SHNvO3
	MxM6pGIZi7SBWLzKrdv+ORSKwk7ryPScsomvc8CLv56Lrn7m+1AAKJznwEkiuO6VhGfjqmh8VdZbw
	AO8lUi6ZsDVpY5Ug+ixK76j/iCJZsfPIx6UtT4lqI3OVyT0E8jGzI9Vzy/QOwSbp005T+SHz1zp9a
	g3MTxIewbqfrxO9baTirbhlQSbDYt7LLT+HmXkLWJbwVW+5pSEtDOjt07FP2lAPQFZfA97XhgOk68
	mCtCLJcaMe5jMZ+oXVNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m0jQp-00BSt0-QA; Tue, 06 Jul 2021 11:40:03 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m0j8J-00BGyN-FL
 for linux-mediatek@lists.infradead.org; Tue, 06 Jul 2021 11:20:57 +0000
Received: by mail-wm1-x335.google.com with SMTP id
 q18-20020a1ce9120000b02901f259f3a250so1989808wmc.2
 for <linux-mediatek@lists.infradead.org>; Tue, 06 Jul 2021 04:20:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:in-reply-to;
 bh=jy7B1eNocEomHYb8Q2ONw/tio4h/NyFzZ4ujY4LjXSg=;
 b=Q54tcSgwVwzQfNcMewf3KLLck3MfQ5g9qHYgEqOW7xKjh3VZLSssHbR3i/nwnA6iwA
 ti6CIAD02mte+bGvVkh5FPnyoaSu+9EexjAQCDvgcmmLY6SJFqvAA9AFdY91AbKflcPO
 g1Dr4k8lKrw3SIPKnDeZvopgkM4moOlfVv1pk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to;
 bh=jy7B1eNocEomHYb8Q2ONw/tio4h/NyFzZ4ujY4LjXSg=;
 b=LqwDcBiPJRC3xj+KMyG3/B67R+MtJ6gqh87IM7pdMZ6rdLMy7xUj2qHiTvCcqKP/Q8
 tOXa6iwI9tLUny2SZTuHmY9yJHj8aYnmVPDiKU8NR8oNWiGo/k1Blf0QCQeEe5pvvGxj
 fEPOhRX0lYAAuG66lvYh4ggmePxDApKQSSKlLL3PHWzW0ag0SJydb9skY3sNFecTFOYc
 7tjKQRt6IBQ9GTVSCsWnz2OdTpZzTycHUAxADNp8sslQVoPlr6RX3rQRpDXKv4epK2R1
 KIfHw2rqmMVN7SnRyPBRcF9hEU2IpAD8SNEtYWSUf4BWDXH3N2rCn5iYT5nvYRmQubPq
 QP5w==
X-Gm-Message-State: AOAM532grV8x+cxDoPcxvECV4Xl/7ahjpathNFVz8Nojf/pLOCV2KdW8
 9u51pt3IvC/lwawYtJsC6euPyA==
X-Google-Smtp-Source: ABdhPJwIUmMewDo0npWJUD3aDGWq7wQ1eq3cuVj7WQOGwB2f1W0doPqcB/ahrPnxocjCEhqZnlaKvQ==
X-Received: by 2002:a7b:c0c1:: with SMTP id s1mr17752031wmh.70.1625570453124; 
 Tue, 06 Jul 2021 04:20:53 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id r18sm18222326wmh.23.2021.07.06.04.20.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Jul 2021 04:20:52 -0700 (PDT)
Date: Tue, 6 Jul 2021 13:20:50 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Frank Wunderlich <frank-w@public-files.de>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, linux-mediatek@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>
Subject: Re: BUG: MTK DRM/HDMI broken on 5.13 (mt7623/bpi-r2)
Message-ID: <YOQ8ktv1MypezrEy@phenom.ffwll.local>
Mail-Followup-To: Frank Wunderlich <frank-w@public-files.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 linux-mediatek@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>
References: <trinity-cc8f5927-9aaf-43ae-a107-6a6229f1b481-1625565279264@3c-app-gmx-bs60>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <trinity-cc8f5927-9aaf-43ae-a107-6a6229f1b481-1625565279264@3c-app-gmx-bs60>
X-Operating-System: Linux phenom 5.10.0-7-amd64 
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210706_042055_596320_192E1A9A 
X-CRM114-Status: GOOD (  24.87  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Tue, Jul 06, 2021 at 11:54:39AM +0200, Frank Wunderlich wrote:
> Hi,
> 
> i've noticed that HDMI is broken at least on my board (Bananapi-r2,mt7623) on 5.13.
> 
> after some research i noticed that it is working till
> 
> commit 2e477391522354e763aa62ee3e281c1ad9e8eb1b
> Author: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
> Date:   Tue Mar 30 13:09:02 2021 +0200
> 
>     drm/mediatek: Don't support hdmi connector creation
> 
> 
> which is the last of mtk-drm-next-5.13 [1] so i guess a problem with core-patches
> 
> dmesg shows the following:
> 
> [    7.071342] mediatek-drm mediatek-drm.1.auto: bound 14007000.ovl (ops mtk_dis
> p_ovl_component_ops)
> [    7.080330] mediatek-drm mediatek-drm.1.auto: bound 14008000.rdma (ops mtk_di
> sp_rdma_component_ops)
> [    7.089429] mediatek-drm mediatek-drm.1.auto: bound 1400b000.color (ops mtk_d
> isp_color_component_ops)
> [    7.098689] mediatek-drm mediatek-drm.1.auto: bound 14012000.rdma (ops mtk_di
> sp_rdma_component_ops)
> [    7.107814] mediatek-drm mediatek-drm.1.auto: bound 14014000.dpi (ops mtk_dpi
> _component_ops)
> [    7.116338] mediatek-drm mediatek-drm.1.auto: Not creating crtc 1 because com
> ponent 9 is disabled or missing
> ....
> [   38.403957] Console: switching to colour frame buffer device 160x64
> [   48.516398] [drm:drm_crtc_commit_wait] *ERROR* flip_done timed out
> [   48.516422] [drm:drm_atomic_helper_wait_for_dependencies] *ERROR* [CRTC:41:cr
> tc-0] commit wait timed out
> [   58.756384] [drm:drm_crtc_commit_wait] *ERROR* flip_done timed out
> [   58.756399] [drm:drm_atomic_helper_wait_for_dependencies] *ERROR* [CONNECTOR:
> 32:HDMI-A-1] commit wait timed out
> [   68.996384] [drm:drm_crtc_commit_wait] *ERROR* flip_done timed out
> [   68.996399] [drm:drm_atomic_helper_wait_for_dependencies] *ERROR* [PLANE:33:p
> lane-0] commit wait timed out
> [   68.996423] [drm:mtk_drm_crtc_atomic_begin] *ERROR* new event while there is
> still a pending event
> [   69.106385] ------------[ cut here ]------------
> [   69.106392] WARNING: CPU: 2 PID: 7 at drivers/gpu/drm/drm_atomic_helper.c:151
> 1 drm_atomic_helper_wait_for_vblanks.part.0+0x2a0/0x2a8
> [   69.106414] [CRTC:41:crtc-0] vblank wait timed out
> 
> so i guess the breaking commit may be this:
> 
> $ git logone -S"drm_crtc_commit_wait" -- drivers/gpu/drm/
> b99c2c95412c 2021-01-11 drm: Introduce a drm_crtc_commit_wait helper
> 
> in drivers/gpu/drm/drm_atomic{,_helper}.c
> 
> but i cannot confirm it because my git bisect does strange things (after
> defining 5.13 as bad and the 2e4773915223 as good, second step is before
> the good commit till the end, last steps are 5.11...). sorry, i'm still
> new to bisect.

drm history runs in parallel with the main tree, so occasionally the
version that's reported as baseline is confusing and older than what you
might expect. Just trust git bisect, it's doing the right thing, and make
sure you test exactly the kernel you're supposed to test. Compiling with
CONFIG_LOCALVERSION_AUTO helps a lot to make sure you're really booting
into the right sha1.

> the fix is targeting to 5.12-rc2, is guess because CK Hu's tree is based
> on this...but the fix was not included in 5.12-rc2 (only after
> 5.12.0...got it by merging 5.12.14)

Yeah that can also happen because of all the non-linear trees involved in
linux development.

> maybe you can help me?

So now I'm confused, you're talking about a fix, or is it still broken in
latest upstream?
-Daniel

> 
> regards Frank
> 
> [1] https://git.kernel.org/pub/scm/linux/kernel/git/chunkuang.hu/linux.git/log/?h=mediatek-drm-next-5.13

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
