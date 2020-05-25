Return-Path: <SRS0=WPHR=7H=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIMWL_WL_HIGH,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AD621C433E0
	for <linux-mediatek@archiver.kernel.org>; Mon, 25 May 2020 09:57:50 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4F79F207CB
	for <linux-mediatek@archiver.kernel.org>; Mon, 25 May 2020 09:57:50 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="XcqLiKJy";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=google.com header.i=@google.com header.b="qvMmSe1X"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4F79F207CB
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SlcT//5/yAnuAIHtfskT3a8l8zqJcVMdKdfdNtva/Ig=; b=XcqLiKJyMoVzoy
	yV1GRv88GxAcBRfRXsn9QcxtfRWNM7msI27DRJhpeDSsU/Qpy16iMC6X8iiTu8l21ZAI3FntqaUir
	CafwKJFwdzq3hXq909mmfrMrgixNGmz0vZXZWdbAHsP5iMvly549PepT5vqnENjF5EsV7IgCMT1Uk
	78YHoKz5S786SQSq+b8/SsnGB6Dt+d4bvTh7yP17OKr/WVYx/0Mi81ZndBjrgGji5YtL/ei1Lk3U+
	4KAByp3+Mm68/NXIVssQ5GyLLpvBKI1vSVjIWBgW+jCQe5dUeY6U3AvmGaZVxCmrALj0okJZorGoC
	JeGC5wye9s6m/CefbW2A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jd9ra-0004yR-4l; Mon, 25 May 2020 09:57:42 +0000
Received: from mail-qv1-xf44.google.com ([2607:f8b0:4864:20::f44])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jd9r0-0004Sn-FE
 for linux-mediatek@lists.infradead.org; Mon, 25 May 2020 09:57:11 +0000
Received: by mail-qv1-xf44.google.com with SMTP id ee19so7798161qvb.11
 for <linux-mediatek@lists.infradead.org>; Mon, 25 May 2020 02:57:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=lXJcON4uIxpNxBwaXZsOO47XJesOn1/BpUPO8EArG+w=;
 b=qvMmSe1XAwiiXDHUShXrjRlC8kHXfgYHjV+edzVEs9diOiTb51gVIu8DIFR7Kl1EEw
 5Y6sFR/4qt/etZj+zXMQpnJBCOEpUeTwjkyvlO8aenAuL6yYXWj5/o20G1wXUq4flko1
 0Adu+aOLsPFZhSXfJTg9dh9NB1pX3j29lBaIeuFGFuoJIBmUZdgqF8H4jTnEgquDqytC
 ME1ipTZN5l8O/AB/Fdssqx02XGyIdC7XSoDAlDbHzQ/3e7envCluBo7IUnF4+C/82B+t
 JcEk4VlBKK5Unrbf4qGqJeVpeleWSKtRNitNo1bP6Ul6mHjKPR/3XdUzUOIYp4Q/Az14
 0fTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=lXJcON4uIxpNxBwaXZsOO47XJesOn1/BpUPO8EArG+w=;
 b=S6jFnHoEOIifEu+FB9vtrL3OmYquCUM7E4vIrXDgAFSXPbFbAPaP9jOW6T5qWeeKnu
 S0rTOODdvi3q6p56L8k7ePr2NvOULwh6s/5iUXSSPk900eUiGHc58/5jOop7x3p53PvP
 s0mylqbByzE78Hm4LR67CBbWuKJ4wmgDc5WdlEzDIBUTy/wBn8TreHBhSZYAzwRbwaEh
 xtnCndHU+abL8JSYAzAOhUIdGMiOGYv9e1rJLXBxegHma7gXBVYV8csuclwonRve/QS6
 /mJxOQyE5Fwct5O/5ES+0q5CJjGggioUzQa66PgJiBqPkUAk5Jz1P4w/jRnHw0JnAym6
 w+Mw==
X-Gm-Message-State: AOAM530WnI8SP3S9yXyzKxtKeSHdRxcPI/9+lB912aWKp5o6S7NauKk9
 plB4mVgoUb5s6e5tycs1za7v4MNbSxrawvxsNS/xew==
X-Google-Smtp-Source: ABdhPJwu98seAlM8B/W6iEB7Cgc17dFjE0Ji2BN+7kajKF3ry3QeBw893G/4FHc1aJT4/bDywXnEMDItzUTJpwb33p8=
X-Received: by 2002:a05:6214:15ce:: with SMTP id
 p14mr15030956qvz.159.1590400624833; 
 Mon, 25 May 2020 02:57:04 -0700 (PDT)
MIME-Version: 1.0
References: <20200522020212.23460-1-walter-zh.wu@mediatek.com>
In-Reply-To: <20200522020212.23460-1-walter-zh.wu@mediatek.com>
From: Dmitry Vyukov <dvyukov@google.com>
Date: Mon, 25 May 2020 11:56:53 +0200
Message-ID: <CACT4Y+agmL5ZOWmNBJyLSTuhy7ekp4HTafABUsqqP+XFd7ErKw@mail.gmail.com>
Subject: Re: [PATCH v6 4/4] kasan: update documentation for generic kasan
To: Walter Wu <walter-zh.wu@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200525_025706_564045_541EA6CB 
X-CRM114-Status: GOOD (  17.55  )
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
Cc: wsd_upstream <wsd_upstream@mediatek.com>, Jonathan Corbet <corbet@lwn.net>,
 linux-mediatek@lists.infradead.org, LKML <linux-kernel@vger.kernel.org>,
 kasan-dev <kasan-dev@googlegroups.com>, Linux-MM <linux-mm@kvack.org>,
 Alexander Potapenko <glider@google.com>,
 Andrey Ryabinin <aryabinin@virtuozzo.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Fri, May 22, 2020 at 4:02 AM Walter Wu <walter-zh.wu@mediatek.com> wrote:
>
> Generic KASAN will support to record the last two call_rcu() call stacks
> and print them in KASAN report. So that need to update documentation.

Reviewed-and-tested-by: Dmitry Vyukov <dvyukov@google.com>

> Signed-off-by: Walter Wu <walter-zh.wu@mediatek.com>
> Cc: Andrey Ryabinin <aryabinin@virtuozzo.com>
> Cc: Dmitry Vyukov <dvyukov@google.com>
> Cc: Alexander Potapenko <glider@google.com>
> Cc: Jonathan Corbet <corbet@lwn.net>
> ---
>  Documentation/dev-tools/kasan.rst | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/Documentation/dev-tools/kasan.rst b/Documentation/dev-tools/kasan.rst
> index c652d740735d..fede42e6536b 100644
> --- a/Documentation/dev-tools/kasan.rst
> +++ b/Documentation/dev-tools/kasan.rst
> @@ -193,6 +193,9 @@ function calls GCC directly inserts the code to check the shadow memory.
>  This option significantly enlarges kernel but it gives x1.1-x2 performance
>  boost over outline instrumented kernel.
>
> +Generic KASAN prints up to 2 call_rcu() call stacks in reports, the last one
> +and the second to last.
> +
>  Software tag-based KASAN
>  ~~~~~~~~~~~~~~~~~~~~~~~~
>
> --
> 2.18.0
>
> --
> You received this message because you are subscribed to the Google Groups "kasan-dev" group.
> To unsubscribe from this group and stop receiving emails from it, send an email to kasan-dev+unsubscribe@googlegroups.com.
> To view this discussion on the web visit https://groups.google.com/d/msgid/kasan-dev/20200522020212.23460-1-walter-zh.wu%40mediatek.com.

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
