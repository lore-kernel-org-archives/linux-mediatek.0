Return-Path: <SRS0=Q+Xe=MZ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6E9A7C4338F
	for <linux-mediatek@archiver.kernel.org>; Mon,  2 Aug 2021 03:40:52 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2E68061050
	for <linux-mediatek@archiver.kernel.org>; Mon,  2 Aug 2021 03:40:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 2E68061050
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=S3JB3FB2436hdUERn82HiRdi1h2ryrmkR77lOndKDik=; b=I7zv1V20k5MqOo
	cpTx1OOCMlQr2ya6JvZwCsjIFFd4L9pgfJzCIvq/3W9/B3+M5mKgtZxFImjDJgE6E3YO419Vr9MKo
	WQ7FJ7DVWmqPbfPL/gR7XP71bzRGsbC/9W9OR/ScYdPYRgBisdhHbgIA+ystskrdm+F8gWbmeGplh
	rPJvpNZzEPgdeXyABOwlq4LyixaP4aTnw03H0lMyuOoraDg5elp+52z4O3/iXyeWcgjkeOn/tYltc
	lr0eqO3oJlIVZNk8lMOyNZUhsmNChl34WratFfi+NEspNJNXVpI+67fGELMjmBtayDx1m8qL1BS8m
	gPqE5PwAvwrFawdUN3rQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mAOoj-00Er0a-1t; Mon, 02 Aug 2021 03:40:41 +0000
Received: from mail-io1-xd2e.google.com ([2607:f8b0:4864:20::d2e])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mAOog-00Eqzd-AQ
 for linux-mediatek@lists.infradead.org; Mon, 02 Aug 2021 03:40:39 +0000
Received: by mail-io1-xd2e.google.com with SMTP id r18so18803052iot.4
 for <linux-mediatek@lists.infradead.org>; Sun, 01 Aug 2021 20:40:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Xr7X3INp68/aHb+fLfHEXT7brOPsJnQpWqh+BxS2toY=;
 b=LiuyPDjOiqxtQJsSBVLxKaDvy1dlayZ3PKlzxW9wtrimEOAXzoDfElSfvrSXHhPTkz
 hYJObO8siTOJ4u0JjoUfq0HR0pJvLUhQK2UyghUCg8sLfzZTF+FZRQ8eSVvZ6ZoWmxhB
 zyeBD5scfDVbWAiJ89ygyqR2eRNcbf1DRaLJs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Xr7X3INp68/aHb+fLfHEXT7brOPsJnQpWqh+BxS2toY=;
 b=CJGLG58ek9x1otJ7NtjDnATLuaRc1sBVPxbJvnhieUc7z0mj59IIIeGx1oSfB9huXU
 Q6AUpjNMrblCrLI5nGZy0k7SoUCjE9re2oOkK9cJeTcvmY++tLbVh3x632ApE1zQITf4
 xPBA3i5Qr+ZGwmrgZsHkHd6UseTDEPOIIh0KD+qsDJc25OwNbsNL3N2Z5d+KsYAKhGSJ
 BQ8Oov5AMSEfZM/6wxmMVJDMzF7sIa6bwdEkZwx76pb4Wu3tO/YTkp/FabtvHMfA5ZdD
 ZwdE3yZ3xCaUNWQxaql62u+kHu+5SRo4cXrGAOOXVR8h0nqvdMC1GgFj2gXAkGXRR3Rh
 AuzQ==
X-Gm-Message-State: AOAM532IWOfl01apyPjzU8Jvne687PS3EG6d0SJDUirW92BvU8/UeW77
 ytvASG+muZOlpV7CRzZHoYCH+InIQ20kE64lRbsmaA==
X-Google-Smtp-Source: ABdhPJwItvPct0QYddbjn/ZBRIlrhozZ9+0sIdd0TxqCVOowtY1O3c/Tt8Q3jSQWg6Ujnb4bjYO9KHe4YuO8OMslZZw=
X-Received: by 2002:a02:aa8b:: with SMTP id u11mr12823631jai.43.1627875636594; 
 Sun, 01 Aug 2021 20:40:36 -0700 (PDT)
MIME-Version: 1.0
References: <20210802030023.1748777-1-linux@roeck-us.net>
 <YQdmCaySpW4Dpz0t@google.com>
In-Reply-To: <YQdmCaySpW4Dpz0t@google.com>
From: Hsin-Yi Wang <hsinyi@chromium.org>
Date: Mon, 2 Aug 2021 11:40:10 +0800
Message-ID: <CAJMQK-jxYAUjT4g08Ctt0=NTdFoKMnHBqE9-Kgj94ymc8XOrCw@mail.gmail.com>
Subject: Re: [PATCH] spi: mediatek: Fix fifo transfer
To: Tzung-Bi Shih <tzungbi@google.com>
Cc: Guenter Roeck <linux@roeck-us.net>, Mark Brown <broonie@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, linux-spi@vger.kernel.org, 
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>, 
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 lkml <linux-kernel@vger.kernel.org>, 
 Peter Hess <peter.hess@ph-home.de>, Frank Wunderlich <frank-w@public-files.de>,
 Hsin-Yi Wang <hsinyi@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210801_204038_431202_87CFC326 
X-CRM114-Status: GOOD (  10.71  )
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

On Mon, Aug 2, 2021 at 11:27 AM Tzung-Bi Shih <tzungbi@google.com> wrote:
>
> On Sun, Aug 01, 2021 at 08:00:23PM -0700, Guenter Roeck wrote:
> > Fixes: 3a70dd2d0503 ("spi: mediatek: fix fifo rx mode")
> > Cc: Peter Hess <peter.hess@ph-home.de>
> > Cc: Frank Wunderlich <frank-w@public-files.de>
> > Cc: Tzung-Bi Shih <tzungbi@google.com>
> > Cc: Hsin-Yi Wang <hsinyi@google.com>
> > Signed-off-by: Guenter Roeck <linux@roeck-us.net>
>
> Tested-by: Tzung-Bi Shih <tzungbi@google.com>
Tested-by: Hsin-Yi Wang <hsinyi@google.com>

tested on a mt8183 device.
>
> _______________________________________________
> Linux-mediatek mailing list
> Linux-mediatek@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-mediatek

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
