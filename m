Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DCB7BC43334
	for <linux-mediatek@archiver.kernel.org>; Fri, 17 Jun 2022 11:12:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oEwaem/xAtfULgaR3mIiQRybksdoP4gsjfxUSl3M7Wg=; b=ks/Xm5G9oaFy+1A01CruEK/xQH
	6GVDcRN0rKkwDxIJVJPQFxMu2L3S0xdST1scQRsDkTxVW24cRxZmuImTnKRhXF1xne3qQ7eB+rilT
	2dI3LvjoYygSlwWMmVa4ZWWPsxJSlK7wiPYGJmg83dzBRcpfuLq9rD2L/JN7AB4fKRH3pHxEIpgSx
	gdj9mUAYPyxQxjIEog7l2eBf1mIg1Tf6a9AjRqM7MLfvY8Zn4f/qgt5AK6g6A0RChTeTCgZuiOOw5
	ZmtdseZYj4NaFnnolwi6BihJYQcE67BolUgTLqmCzCEg4mNDXQeMl4aH3y1YfEHVA+u280b0PDoOp
	T+LmroIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o29uC-007Ekn-C1; Fri, 17 Jun 2022 11:12:48 +0000
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o29pS-007CiJ-BP
	for linux-mediatek@lists.infradead.org; Fri, 17 Jun 2022 11:07:56 +0000
Received: by mail-ed1-x531.google.com with SMTP id o10so5737029edi.1
        for <linux-mediatek@lists.infradead.org>; Fri, 17 Jun 2022 04:07:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=oEwaem/xAtfULgaR3mIiQRybksdoP4gsjfxUSl3M7Wg=;
        b=IRA3BGiTIVjH8IMjsPrY2AaWkXWzLbXVe3yTtmFYtKgF42jKNMXXn1TkJwxJOmK6mi
         ql0r/Q/gFkBMxAeRmRDqF0sSl17OK6fLQ44mpQ5acpuXVp2zVQgs5aWUAxlrRiF76yf4
         0U9yJ0sJKYFs+O97pzF0ofgOSq9xCM6RwyRCE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=oEwaem/xAtfULgaR3mIiQRybksdoP4gsjfxUSl3M7Wg=;
        b=BpN8gO+Tf2RrBOysQ06fs3CMJhymlkd+NjgncDClFSksTtgl5l+H/5P+iULawefctT
         E8HRrHnSN9/JbAt37TUIJObDA5lAHBesr5S8V7rhMz2sDKyGCy1rzBb9bXziAjaWiZRn
         Jws0z0whE1XP2EEZz/5OcGOM51E3iQXE3NRJzAHmce5ObPGV/cmxos/PVaEYv9aOk4or
         /Q6GEP8+1HKBoGguYl7Occb54v/jC8r2UYizemy2cAAL7KjOVBDaNUP+XfF7oG7ssoEQ
         kc2kKMZnfiaTEtLNKUaD0wmB6rcgXFqWcRfq50ewb73EwTVKJTnJyaFThPQJ9T3GruFk
         Cu8A==
X-Gm-Message-State: AJIora+fTCqhaZJnpUbb1y8OVe8bTaAbUqiOAavMUe3KGJ0UTJaL92zw
	Uos4fR1jD1Qh+/7+wZwqSPbNKH8xFn/E9Q==
X-Google-Smtp-Source: AGRyM1u3krcoJYT67oCh4WKpx4w1aCCA21RLoqio+9sYPNZW1mF+rA5ZxdrSR9m4uAP9c0Fs2rWp6g==
X-Received: by 2002:a05:6402:84a:b0:426:262d:967e with SMTP id b10-20020a056402084a00b00426262d967emr11958197edz.286.1655464068769;
        Fri, 17 Jun 2022 04:07:48 -0700 (PDT)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com. [209.85.128.53])
        by smtp.gmail.com with ESMTPSA id o26-20020a1709061b1a00b0070c4abe4706sm1995756ejg.158.2022.06.17.04.07.47
        for <linux-mediatek@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 17 Jun 2022 04:07:48 -0700 (PDT)
Received: by mail-wm1-f53.google.com with SMTP id l126-20020a1c2584000000b0039c1a10507fso2222763wml.1
        for <linux-mediatek@lists.infradead.org>; Fri, 17 Jun 2022 04:07:47 -0700 (PDT)
X-Received: by 2002:a05:600c:2215:b0:39c:55a0:9531 with SMTP id
 z21-20020a05600c221500b0039c55a09531mr9687808wml.29.1655464066586; Fri, 17
 Jun 2022 04:07:46 -0700 (PDT)
MIME-Version: 1.0
References: <20220617100632.1447811-1-fshao@chromium.org> <YqxauLOp2sWOU/uc@sirena.org.uk>
In-Reply-To: <YqxauLOp2sWOU/uc@sirena.org.uk>
From: Fei Shao <fshao@chromium.org>
Date: Fri, 17 Jun 2022 19:07:09 +0800
X-Gmail-Original-Message-ID: <CAC=S1nhVSMfebqv9Kr-bkHdF9HcDMQVU-sTUzRch1d6bZO54Ug@mail.gmail.com>
Message-ID: <CAC=S1nhVSMfebqv9Kr-bkHdF9HcDMQVU-sTUzRch1d6bZO54Ug@mail.gmail.com>
Subject: Re: [PATCH] ASoC: mediatek: mt8186: Fix mutex double unlock in GPIO request
To: Mark Brown <broonie@kernel.org>
Cc: Jiaxin Yu <jiaxin.yu@mediatek.com>, alsa-devel@alsa-project.org, 
	Linux ARM <linux-arm-kernel@lists.infradead.org>, 
	linux-kernel <linux-kernel@vger.kernel.org>, 
	"moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220617_040754_450046_120F3042 
X-CRM114-Status: GOOD (  11.17  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Fri, Jun 17, 2022 at 6:43 PM Mark Brown <broonie@kernel.org> wrote:
>
> On Fri, Jun 17, 2022 at 06:06:33PM +0800, Fei Shao wrote:
> > The lockdep mechanism reveals an unbalanced unlocking on MT8186:
> >
> >   [    2.993966] WARNING: bad unlock balance detected!
> >   [    2.993971] 5.15.46-421fef3b44d7-lockdep #16 Not tainted
> >   [    2.993978] -------------------------------------
> >   [    2.993983] kworker/u16:1/10 is trying to release lock (gpio_request_mutex) at:
> >   [    2.993994] [<ffffffdcd9adebf8>] mt8186_afe_gpio_request+0xf8/0x210
> >   [    2.994012] but there are no more locks to release!
> >   [    2.994017]
> >   [    2.994017] other info that might help us debug this:
>
> Please think hard before including complete backtraces in upstream
> reports, they are very large and contain almost no useful information
> relative to their size so often obscure the relevant content in your
> message. If part of the backtrace is usefully illustrative (it often is
> for search engines if nothing else) then it's usually better to pull out
> the relevant sections.

Agreed, I'll resend the patch. Thank you for the feedback.

Regards,
Fei

