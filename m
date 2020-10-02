Return-Path: <SRS0=DbAw=DJ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 97846C4363D
	for <linux-mediatek@archiver.kernel.org>; Fri,  2 Oct 2020 20:30:11 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 43810206FA
	for <linux-mediatek@archiver.kernel.org>; Fri,  2 Oct 2020 20:30:11 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="CQJ7kkJa";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="X78OeGMY"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 43810206FA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=AKgOxuaFAinHVLEYLiamu6iBZfgoYaRonrf56Fakx6A=; b=CQJ7kkJajWhhx/3WBPHpWXY95
	xYM/F/prLdMt1hlgr8oPqO9CJdPeVj1zxIJ3h9dzvicm2egScv6aaMuIDfnKWK8sPqdff+rARsE1d
	jPgO30DxfhcBXfhRTgzlV1z4qS6BvPxWLzBVAoKF8vJjZ7ITSMgesc5KTiC5E5DKSBs0eKthVyBkU
	eQ26GzbZbLAEGMVxWhdc4F3YkXDyGXRYkemvFWTW92AxYivO47g5XFGUmbOLiU7GurbwL3IxY4rsh
	PdeygM2/qf/cE5V0Pu+90YdFptIidldsDZ9mzhOrvkvtWXezlFiPuYfuTCxFsSO6Bh3m9eNm1UV8L
	vKXxMxo6A==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kORgp-000760-B2; Fri, 02 Oct 2020 20:30:03 +0000
Received: from mail-il1-x144.google.com ([2607:f8b0:4864:20::144])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kORgm-00074z-P7; Fri, 02 Oct 2020 20:30:02 +0000
Received: by mail-il1-x144.google.com with SMTP id o18so2437737ilg.0;
 Fri, 02 Oct 2020 13:30:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=FhLp+gt/aFZ8a4cP9x5681ANW42efWsw5G3/zOdmKDI=;
 b=X78OeGMYE53vGxb6k7lJIAAX5siDmGTwGVBI6xwQZvoBjcxdsD1qiH0bw/CtXso8db
 sytPoZj/jAHfB/8NE2BxOWXSc1ng3oP2txcd2XZwNKGihs45h/Q9uyaCjkA+ccm6c6tW
 fCvNUS0esgkVhmbkvg9SsQM7Uz/a9QFmfLHjGTIe72ahexXK800zFFqN5SjRUk+GOaMw
 O40BUylaKSQELxQAWGDYbon4oJmYAG3lpVYHBAnyQxznaZqSXXqnuaEJSyj4mM0eiUXz
 U7T1pD8DbP1ex5ZsE2ach1NoMp0bdHz+A0tcfW14Su3sVI5lBy2+Lnku86PDQuNqD/Ik
 CBCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=FhLp+gt/aFZ8a4cP9x5681ANW42efWsw5G3/zOdmKDI=;
 b=lQIDV6ibQQoN1ACbwywM75GPrOELXvPVUcCAuAq09bKF0kjxCQGmtWVkwW0FTMLjS6
 XyqAygZJ9vd3UGakC0OHm2vAvCBOjwDnSYOED8w711liiojuIiuaDaXh2tC2I4f0ePyH
 iCB32dIoXxpaF9WKfQoiB6xsB3TEkOd7woD8CSjdwLOpF1M/IIxKfMSyDWMb4Xj5CwsQ
 Wp02UsEBvb+nYQmbJinfZRTf8DfhD0GlePRdC6i8uXI6A69fxe4Ku3+FZ+xAVaNh8CZQ
 fxdCHLUXj25ym0s64HomWBXpOOeO0C7KjVnfHwCrdUbdOng44nKX1oY++9JXOxejFAtO
 WtqQ==
X-Gm-Message-State: AOAM5300Z27f2bch3LfpPFBNqXiVIfmn5UDfT+2ZEwXDN1hWBE96NAr4
 in6DvyjqyQ/vHPon1vQEggqXEYgz5C4h6X1S5tE=
X-Google-Smtp-Source: ABdhPJyvzpaKKuH7o6oSQQFWKdaUonXVTmblHyAmich7fPwzQ1o1+ONhbgPkZQ2NRNj/1dCDzVqV+XIA1KkybHm6acQ=
X-Received: by 2002:a05:6e02:10ce:: with SMTP id
 s14mr3275546ilj.239.1601670598656; 
 Fri, 02 Oct 2020 13:29:58 -0700 (PDT)
MIME-Version: 1.0
References: <20200927230422.11610-1-chunkuang.hu@kernel.org>
In-Reply-To: <20200927230422.11610-1-chunkuang.hu@kernel.org>
From: Jassi Brar <jassisinghbrar@gmail.com>
Date: Fri, 2 Oct 2020 15:29:47 -0500
Message-ID: <CABb+yY1zq0+sqXuSzkkX9+dTaTZgg5HJyQLC3N-yZx35QLLvDQ@mail.gmail.com>
Subject: Re: [PATCH 0/4] Mediatek DRM driver detect CMDQ execution timeout by
 vblank IRQ
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201002_163000_999679_DEBB9D66 
X-CRM114-Status: GOOD (  15.68  )
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
Cc: Matthias Brugger <matthias.bgg@gmail.com>,
 linux-mediatek@lists.infradead.org,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel@lists.freedesktop.org,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Sun, Sep 27, 2020 at 6:04 PM Chun-Kuang Hu <chunkuang.hu@kernel.org> wrote:
>
> CMDQ helper provide timer to detect execution timeout, but DRM driver
> could have a better way to detect execution timeout by vblank IRQ.
> For DRM, CMDQ command should execute in vblank, so if it fail to
> execute in next 2 vblank, timeout happen. Even though we could
> calculate time between 2 vblank and use timer to delect, this would
> make things more complicated.
>
> This introduce a series refinement for CMDQ mailbox controller and CMDQ
> helper. Remove timer handler in helper function because different
> client have different way to detect timeout. Use standard mailbox
> callback instead of proprietary one to get the necessary data
> in callback function. Remove struct cmdq_client to access client
> instance data by struct mbox_client.
>
> Chun-Kuang Hu (4):
>   soc / drm: mediatek: cmdq: Remove timeout handler in helper function
>   mailbox / soc / drm: mediatek: Use mailbox rx_callback instead of
>     cmdq_task_cb
>   mailbox / soc / drm: mediatek: Remove struct cmdq_client
>   drm/mediatek: Detect CMDQ execution timeout
>
>  drivers/gpu/drm/mediatek/mtk_drm_crtc.c  |  54 ++++++---
>  drivers/mailbox/mtk-cmdq-mailbox.c       |  24 ++--
>  drivers/soc/mediatek/mtk-cmdq-helper.c   | 146 ++---------------------
>  include/linux/mailbox/mtk-cmdq-mailbox.h |  25 +---
>  include/linux/soc/mediatek/mtk-cmdq.h    |  54 +--------
>  5 files changed, 66 insertions(+), 237 deletions(-)
>
Please break this into two patchsets - one for mailbox and one for its users.
Also, CC original author and recent major contributors to mtk-cmdq-mailbox.c

Thanks.

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
