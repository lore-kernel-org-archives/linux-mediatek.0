Return-Path: <SRS0=cyKo=BC=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 34F97C433E1
	for <linux-mediatek@archiver.kernel.org>; Thu, 23 Jul 2020 17:15:44 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 01B7C2071A
	for <linux-mediatek@archiver.kernel.org>; Thu, 23 Jul 2020 17:15:43 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="SwhHOyno";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="D2kL3VW7"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 01B7C2071A
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=broadcom.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=0aDSW/Rfger/SAtupsb+26MGv75AK0Nj/Cpk0kO07Uc=; b=SwhHOynojXB0QOaXtayjNkLLc
	7+a+dfpM+hoj2f8l+nSeFHhX3dOu/mzFeiDssDXbYzbogZLli8WQotkiPVsqf2Gi69Xae1zFXS0C+
	FuCqi4Z2MQv2ZiuPRY2OrThaNwa4pCQxQRjmnYESd3z/HYuBgEB4fekHcph8PuNd18hoT9HWNPDBi
	4mQ7pBiPSlCU/1o0Zuj1dPuiDBiiSnEzxOlQK8r7xsMKosAjfU7iG9gJAbvv93g5Ze5r2H2SOY4pC
	XLoo2WgGmFqi30xP0tE/A+2lW4GVGX+KwUP1JVoSk0XNOELlQunubWz2/cHZRQ05r+t1pP3kakR0w
	aKRb5Yygw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jyeof-0004J5-Ta; Thu, 23 Jul 2020 17:15:33 +0000
Received: from mail-qv1-xf44.google.com ([2607:f8b0:4864:20::f44])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jyeoa-0004Gw-55
 for linux-mediatek@lists.infradead.org; Thu, 23 Jul 2020 17:15:29 +0000
Received: by mail-qv1-xf44.google.com with SMTP id di5so2882483qvb.11
 for <linux-mediatek@lists.infradead.org>; Thu, 23 Jul 2020 10:15:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=broadcom.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=uxqgbT1xGWBNU5YbnWHoLn+2QzI4IjiCwjdiIwlOoYI=;
 b=D2kL3VW7zX669rdE7uTbTlP31fK7ZlJNSMl59TCCOG9B0rGjYvWYAiRRN5pQLhUbNj
 tH2ym7dLLWpp+iGDXG1Itn/y3VP6eMYC892FZkWwkvWFBoqoXh3IrzCcyqEXVl4yQ2ZW
 sVsPsE3lC5B9mY1OnExahBLRt5lbo3SXAbi4k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=uxqgbT1xGWBNU5YbnWHoLn+2QzI4IjiCwjdiIwlOoYI=;
 b=VD4eiDNTotBKC22oQbZoQ8w17VEIQ1bgcmhR35YoY0o5G8WmLUZYuMOVVpyt6nZ1A1
 AjRJSmWIVm2dGHcIEkRlSOdahMgKaa08kVa+Bf8omVjXyNcZN5F5vGVXahV4e4/uix+o
 mlNuSRKv4hT7CIBeEvNnfgmI8Xr//QGttHFT3W+XfNRjhzPXZLlaGsC2P4pR/b2DwEhq
 ikCejqrl1AykaJ8MvdHLWEWz9TYOBZlS9xngcNumVV3Kg2oXZFXsMgn3j2SdTPrR3nV2
 kU7X4ezeO2/fa0R9xKaCgVNrTOW9pK72offGiwt2dKuTBBdlI3qwm/wWWAY5BGLcIzlq
 lqwg==
X-Gm-Message-State: AOAM532q24Cq99AsbRHxoUIEbdZfKdNxVpJkrNS4VtonUd4hmBWRe2Tw
 BNUZ9t0FPNcr/1XeLR8ZqyKtPnpiYWzI76Qiks0/fw==
X-Google-Smtp-Source: ABdhPJwLdD2kuuxmaYBIRerlmw2LPR4pPFv4tVkeSMizVI3cJusdEuI0jtB1kimBr9K4sbHmJZt3PpUJDk7hMkWdX3w=
X-Received: by 2002:a05:6214:851:: with SMTP id
 dg17mr5838866qvb.235.1595524524901; 
 Thu, 23 Jul 2020 10:15:24 -0700 (PDT)
MIME-Version: 1.0
References: <20200723073744.13400-1-krzk@kernel.org>
 <20200723073744.13400-18-krzk@kernel.org>
 <e65d4ed3-3c01-acb7-f324-be99201815df@gmail.com>
In-Reply-To: <e65d4ed3-3c01-acb7-f324-be99201815df@gmail.com>
From: Markus Mayer <mmayer@broadcom.com>
Date: Thu, 23 Jul 2020 10:15:14 -0700
Message-ID: <CAGt4E5uRzPtgy54VvRMpoWMbFfY6evBSjmd4dfHO+=__fR+3kQ@mail.gmail.com>
Subject: Re: [PATCH 17/23] memory: brcmstb_dpfe: Remove unneeded braces
To: Florian Fainelli <f.fainelli@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200723_131528_303925_2BE288E9 
X-CRM114-Status: UNSURE (   9.79  )
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
List-Id: <soc.lore.kernel.org>
Cc: linux-omap@vger.kernel.org, linux-tegra@vger.kernel.org,
 Arnd Bergmann <arnd@arndb.de>, Tony Lindgren <tony@atomide.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-mediatek@lists.infradead.org,
 Linux Kernel <linux-kernel@vger.kernel.org>,
 Krzysztof Kozlowski <krzk@kernel.org>, Vladimir Zapolskiy <vz@mleia.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, soc@kernel.org, arm@kernel.org,
 BCM Kernel Feedback <bcm-kernel-feedback-list@broadcom.com>,
 Santosh Shilimkar <ssantosh@kernel.org>, Olof Johansson <olof@lixom.net>,
 Thierry Reding <thierry.reding@gmail.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Linux ARM Kernel <linux-arm-kernel@lists.infradead.org>,
 Roger Quadros <rogerq@ti.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Thu, 23 Jul 2020 at 10:11, Florian Fainelli <f.fainelli@gmail.com> wrote:
>
> On 7/23/20 12:37 AM, Krzysztof Kozlowski wrote:
> > Single statement blocks don't need braces.  Fixes checkpatch warning:
> >
> >     WARNING: braces {} are not necessary for single statement blocks
> >
> > Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
>
> Acked-by: Florian Fainelli <f.fainelli@gmail.com>

Acked-by: Markus Mayer <mmayer@broadcom.com>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
