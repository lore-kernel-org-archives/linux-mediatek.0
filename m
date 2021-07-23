Return-Path: <SRS0=Y38d=MP=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 88440C4338F
	for <linux-mediatek@archiver.kernel.org>; Fri, 23 Jul 2021 15:45:24 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4848C60EB5
	for <linux-mediatek@archiver.kernel.org>; Fri, 23 Jul 2021 15:45:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 4848C60EB5
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vdGcU1tuC4mzXgHqyqK9ouReTwXwaz61XONZTyXWM+0=; b=QqG7FuM02qOfxn
	/E/U/IxR1crimMzLTCapCXYvamA+CpUH/mj9w+XzfCy3aTgBTyeE9NEcXs6nyQproB01Gm1NijajK
	L1TIeiW4a68ox/Mv4d0AiZ4CTf3zxkZVKupfQtGreXUwsO/dfpZ2I/WmL/9iA1LBZTb5cKJw1Jj1m
	iU0rwqvtc7oIYvL5DWjNIUTellh/9bAW1BZrI2PfVuXoSTw+ErregoOi8PpTpEMzcf4BfjoP1jVJT
	NFreOzUl7aUN8wDDB2u39VrNAa6mpm00E7GCrZFMylKeWKLy9vVVY/AvB8xw3UNRtLPaWeZwDnWC1
	P41QVOSFWCVF/2Ju0i/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m6xMQ-005Cu6-K2; Fri, 23 Jul 2021 15:45:14 +0000
Received: from mail-lj1-x22e.google.com ([2a00:1450:4864:20::22e])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m6xKF-005Bnw-Pk
 for linux-mediatek@lists.infradead.org; Fri, 23 Jul 2021 15:43:01 +0000
Received: by mail-lj1-x22e.google.com with SMTP id h11so2171973ljo.12
 for <linux-mediatek@lists.infradead.org>; Fri, 23 Jul 2021 08:42:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=O/f1g+Bd2m3qWx8HKI2UdTdvCSkFMuvtajEPkZseSXo=;
 b=P9WIEootakX6Goscgqro+lI7BeHd2NnvAGsPf77p8dHmtnMv5PdY+XquMleRjOo0en
 N8dQ9HMTolWKMbRpxmESYskXGStw0BdpZAQsqoXuhmojOIhJ53Sf6uQcQjQ9tG2RLPTZ
 DK4DQ5uJCDdpcyd+LAgvJ7+wh7S2b3FoMzV0i+2QMBVGLRM+mOsqIeADs/3lkS4+z1+A
 99y88jczDL0H+qZ3diqcU528DJKCL2eP/9ale4Sv7vMfvEd7WnL0y/xqtS6t8elZqsEY
 MN5cWFh21q1qmIBNQNsH8VgYf4mbUd/8wEympPPSlUh8I046ULUvC167RulQd0mVko7O
 jnTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=O/f1g+Bd2m3qWx8HKI2UdTdvCSkFMuvtajEPkZseSXo=;
 b=qXM6oHJeIagbGjeOHxF2k/xI5tsXnG0zArUP8Id8O4C7rzRxKpBrx6T2pBOheyg7Jj
 E+MdU1/2f3xIj0pdPRWduOFeAgQaBFIKfTC9+QDY17raDErJkzjNdT4vSHHlhbLP1O+g
 vdQ0mlk1SKHqg/Cp9NIGLZFQnkXdVNyVuYmisHK2NDw3JWcu6pbM+ZATF2r1GGt57T3x
 nrlQyosUU2F/j6J3qJ5/JX87EVK+WWDpw8sAe/MuWUl0napGbIg86GeWzTs+z0usWShX
 dFhGq9xpm2frxHgxoLf4gghyjxE9eM7IPsYsf6IAyTqvyydg/w/q5Pf6TvsMcNrKqhwx
 HQOw==
X-Gm-Message-State: AOAM530rgsmY02/5FgRAf8DDX462r+YaWHw5gJEIFO+7jwFyapFuGSjq
 F0yBCp3eyFcpqoe6cmlstWmF1CtTBW+7KIj7oDeG2A==
X-Google-Smtp-Source: ABdhPJy1g6Lo0FVctRSfD7xM4QliObCTb5e2mkP+drcrUUsa0a8KNePvOCiQfbXrF4S6/RGLWayNHJSo1qU6BxwNWB0=
X-Received: by 2002:a05:651c:169a:: with SMTP id
 bd26mr3717379ljb.368.1627054976984; 
 Fri, 23 Jul 2021 08:42:56 -0700 (PDT)
MIME-Version: 1.0
References: <20210701080955.2660294-1-hsinyi@chromium.org>
In-Reply-To: <20210701080955.2660294-1-hsinyi@chromium.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 23 Jul 2021 17:42:46 +0200
Message-ID: <CACRpkdbaeXTum_tpfyoHnaNtS8Kz1JiXtardc8UsRcGRLHO8Mw@mail.gmail.com>
Subject: Re: [PATCH v2] pinctrl: mediatek: Fix fallback behavior for
 bias_set_combo
To: Hsin-Yi Wang <hsinyi@chromium.org>
Cc: Sean Wang <sean.wang@kernel.org>, Zhiyong Tao <zhiyong.tao@mediatek.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, 
 Linux ARM <linux-arm-kernel@lists.infradead.org>, 
 linux-kernel <linux-kernel@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210723_084259_882046_258D3E6C 
X-CRM114-Status: GOOD (  10.99  )
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

Hi Hsin-Yi,

On Thu, Jul 1, 2021 at 10:10 AM Hsin-Yi Wang <hsinyi@chromium.org> wrote:
>
> Some pin doesn't support PUPD register, if it fails and fallbacks with
> bias_set_combo case, it will call mtk_pinconf_bias_set_pupd_r1_r0() to
> modify the PUPD pin again.
>
> Since the general bias set are either PU/PD or PULLSEL/PULLEN, try
> bias_set or bias_set_rev1 for the other fallback case. If the pin
> doesn't support neither PU/PD nor PULLSEL/PULLEN, it will return
> -ENOTSUPP.
>
> Fixes: 81bd1579b43e ("pinctrl: mediatek: Fix fallback call path")
> Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
> ---
> v2: fix v1 comments

Thanks for fixing this up so nicely, great work.
Patch applied for fixes!

Yours,
Linus Walleij

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
