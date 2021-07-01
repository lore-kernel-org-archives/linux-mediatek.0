Return-Path: <SRS0=jcdg=LZ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7D5C0C11F64
	for <linux-mediatek@archiver.kernel.org>; Thu,  1 Jul 2021 08:41:27 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2CA77613F1
	for <linux-mediatek@archiver.kernel.org>; Thu,  1 Jul 2021 08:41:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2CA77613F1
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8zhlSmL3z18yI7QjIbzSYjmbUglcE2tN7wUdmDgf2U4=; b=NxDmR/INqhVwRk
	wVDy73rd/NfQHTEScMHhJCamXCA6hBiEjogNkYVqx8vdiF/Zr7DlByWN28+ym4wag0EICnT7zxJZ9
	1lr03i2KWIZUZfnmF2ZQykdg9QCAGFNb0eFWWtNNz0gFafcuWcN7vP3YCpEI27/C17vmSKiUtXvgm
	E3vY/Ni9Pm/3uJ9hezRT20bSOAHvIxIv55qZDk3CR0TKKX3ja0WmpT83KBRXdK8H0gZZt3C63e8S3
	o3dsElDhLClbuxzzl9Z8dRn4vWQONypDi3+BzubCcNZIzH/jZa00cF3ICrEuq1pEL+qQlHy+sE0eK
	vv7QX+9j2fo8yO6PP/mg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lysG5-00GXbg-M5; Thu, 01 Jul 2021 08:41:17 +0000
Received: from mail-lj1-x234.google.com ([2a00:1450:4864:20::234])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lysG2-00GXae-PW
 for linux-mediatek@lists.infradead.org; Thu, 01 Jul 2021 08:41:16 +0000
Received: by mail-lj1-x234.google.com with SMTP id x20so7350766ljc.5
 for <linux-mediatek@lists.infradead.org>; Thu, 01 Jul 2021 01:41:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=94oP0rsAT+ayytaK2fzZltuXE6U/Q4mr4HlOcI5ZZUc=;
 b=IYfWYr+Ll1UHRSBEQLgPnx0M/OFTM1LsCjadsw0+P1P68+KYnrpVzB9D0/zTj9eTDY
 n1sST4eb5nWLIAUz/KUoAO7T9Rz22Xb4TEvo8pHlUXDZhtrw9kF4ndiBAHSvYuo3qjyi
 qeoha0gJyPVepVX2k8QfzsjvcJFw0paxkGH4g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=94oP0rsAT+ayytaK2fzZltuXE6U/Q4mr4HlOcI5ZZUc=;
 b=cNlBxyix/6lzGB8DqLgI9UTVc9pVEsB+KSEkmBjpe+zWvfQOYi/9k3pGoGGNjvZ6Uq
 S+x7j7zve/+WNMAnXvCKNcdo+CspPJZzM3QTwgIe5PiUeOU34wGWol766LiOHE1DhwfQ
 to5O8scatgukLa6dxSO1tujS5kJ0QuLClVXds1DCmDpTY6+uMW+OwRBFDSHTFeJ+dpYd
 KsyIMhjeYpQSxSAekIPivAFIVxq+v/9Q4mXbO3DJMMph2Yq91Rm3gKoSHP87JmTEcp4F
 EWb0GawbipgPkXZR/+USly+aM6tn8DpruQoUkhxDnsIW3Y4kGzr3aURAn8zfbfPnIXMK
 0xRQ==
X-Gm-Message-State: AOAM530hRk376Oe9884T9p3e/NF3I6hckq84uXHSA/rmkCDBKJEsmqWM
 AnjJ67b5QvismSwsbBWtdOxyes6A1RguCM9Gq37rUw==
X-Google-Smtp-Source: ABdhPJwIdOfvGf0L+sdqDn+8ax6dglU62QnDYlxOrENc/AZUpEnZMm4CzLSj2dG+W2SfU2waOpppkNuVrFn+raLvkGw=
X-Received: by 2002:a05:651c:32e:: with SMTP id
 b14mr11049376ljp.251.1625128871805; 
 Thu, 01 Jul 2021 01:41:11 -0700 (PDT)
MIME-Version: 1.0
References: <20210701080955.2660294-1-hsinyi@chromium.org>
In-Reply-To: <20210701080955.2660294-1-hsinyi@chromium.org>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Thu, 1 Jul 2021 16:41:01 +0800
Message-ID: <CAGXv+5Ecbttkw1AAG5KofoR1oDW-ot68BL1OR=Jpiii8v8DTyw@mail.gmail.com>
Subject: Re: [PATCH v2] pinctrl: mediatek: Fix fallback behavior for
 bias_set_combo
To: Hsin-Yi Wang <hsinyi@chromium.org>
Cc: Sean Wang <sean.wang@kernel.org>, Linus Walleij <linus.walleij@linaro.org>,
 zhiyong.tao@mediatek.com, Matthias Brugger <matthias.bgg@gmail.com>, 
 linux-mediatek@lists.infradead.org, linux-gpio@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210701_014114_912105_0D5510CE 
X-CRM114-Status: GOOD (  11.19  )
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

On Thu, Jul 1, 2021 at 4:10 PM Hsin-Yi Wang <hsinyi@chromium.org> wrote:
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

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
