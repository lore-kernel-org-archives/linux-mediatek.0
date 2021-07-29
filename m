Return-Path: <SRS0=Fikf=MV=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EF086C4338F
	for <linux-mediatek@archiver.kernel.org>; Thu, 29 Jul 2021 06:48:00 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B45A160249
	for <linux-mediatek@archiver.kernel.org>; Thu, 29 Jul 2021 06:48:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org B45A160249
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bvrCwtPfz6n7mrrlkUhys4J64JXiqVfE+4Db6G2L03k=; b=zaCiTcn3Hy7j2z
	dwmCCfkcxVsPeIdGYk2KnDNdEDVuq5YTtkCuvb6yij7VNGy+qYbfjazRpXJMLkM+6NQ4ccvJeID/G
	sEiMSIrCCF1B4BC+Q0z3DpTjpla3neDp3Y8lCFgF/ASqlxyuHTxLGJMQKcH8uQxwcC7jF6xFlR3Os
	N3O9z49Xxb5gdeA45BX758ZpDxyANjF7BGlJi6ng3T6Z68LJDScr8fKsOUL+0FJWaspYX+0/quS6B
	1wz9tugcose1d1VwdeELyaHp9t3S19tCS7Pd7K4GMLDmaWjj9yz+fPdVpFqVRp/7ZgU0j01lAQt/W
	TWhUMS81Gx4l6PNR/umg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m8zpd-003HQe-Nm; Thu, 29 Jul 2021 06:47:49 +0000
Received: from mail-io1-xd35.google.com ([2607:f8b0:4864:20::d35])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m8zpb-003HPe-9o
 for linux-mediatek@lists.infradead.org; Thu, 29 Jul 2021 06:47:48 +0000
Received: by mail-io1-xd35.google.com with SMTP id z7so4851869iog.13
 for <linux-mediatek@lists.infradead.org>; Wed, 28 Jul 2021 23:47:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Z6s9EpghVG5yNilrzApeR2nfAN8bOtTXA63wcdEO850=;
 b=kiGq+5UGU2deXW3vRAKevmyylHfrtWnO+7+Sp7ynaKCzyk1wAtHDzzTSwqCFQIzhkK
 YF3tG+3+NLsQmqIY8E+9qulWBep6l6ZUPfsw75jG4gQvBx0ad5GvPNLUSqu49JUiXheP
 hQ5rYPrbK8iqrdPksGIlNVxeXs1uKgLYVTSf4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Z6s9EpghVG5yNilrzApeR2nfAN8bOtTXA63wcdEO850=;
 b=gyV5jcKnvFxPiNcTOsZHkwNNobpPzLxqeGt6yQlsYsvwBp9s010PeXzx0i0+HmY5jC
 +RJKdJUp6kNrYgBPGrew1I4MeYm8uyQNLiWJM9J6nO7BhN5gkt6xmatbnDJkw6blGEMJ
 xi1dlr1fvpio0AexUfr2NUAupVsg1fc6t97mkmOaWTjyPt5QlJVZ7AnRglkAo9GG0MLl
 10mDGYgjvBpKlwfQVpGf1xWMCEBVe3DDpCepzkBs+D38zuiMwrPt3++caEdOxJpV3V9K
 Dxj/K4UJArb29g0XcWiXtDKK2SSjk/cgQm02Ftrre6R9yZNrQVLI4Zf5xLkknbRCAZWi
 ug7g==
X-Gm-Message-State: AOAM533EPnJ0h5qny5cjRoQzZ35ozcackFakAIPvKI9FSEYPI4EkhZT/
 S8HHDle52+s2hjAlej45DLNTz34i57eajzhdDIp7OQ==
X-Google-Smtp-Source: ABdhPJzKzTRbqyo6jDgNh8D1SJeVmJ3fBGEpEycmPtYpz5QAyEju6aZXMpvg7LTUDAKQcGZlkxzvqFbTKNhp452opNY=
X-Received: by 2002:a02:6946:: with SMTP id e67mr3202611jac.4.1627541265887;
 Wed, 28 Jul 2021 23:47:45 -0700 (PDT)
MIME-Version: 1.0
References: <20210727174025.10552-1-linux@fw-web.de>
 <CAJMQK-g8g5QJbBkU-A6th1VSWafxVv2fGtym+enQa_hDVaVoBw@mail.gmail.com>
 <97C4FA94-B28A-4F0E-9CD3-4E33B01BA353@fw-web.de>
 <CAJMQK-gQeMidjBZ1E=ReMmffC5G8oiFawB4Ey1PNb2ZWXw_1Bg@mail.gmail.com>
 <6BFE13A3-6A42-455E-BDF7-CD285CC6C66D@fw-web.de>
 <CAJMQK-iHfJWnGQRq299pZ9B9ABMsXPEkptyCrGtQqkEyc=HNFg@mail.gmail.com>
 <85C44C40-9238-49A2-B878-DEB189671324@fw-web.de>
In-Reply-To: <85C44C40-9238-49A2-B878-DEB189671324@fw-web.de>
From: Hsin-Yi Wang <hsinyi@chromium.org>
Date: Thu, 29 Jul 2021 14:47:20 +0800
Message-ID: <CAJMQK-gmO=Q=vxTyc7i-QXPHSuoHmNK1BWnPiqjWGGUovX7sRA@mail.gmail.com>
Subject: Re: [PATCH] soc: mmsys: mediatek: add mask to mmsys routes
To: Frank Wunderlich <linux@fw-web.de>
Cc: "moderated list:ARM/Mediatek SoC support"
 <linux-mediatek@lists.infradead.org>, CK Hu <ck.hu@mediatek.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 Enric Balletbo i Serra <enric.balletbo@collabora.com>, 
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>, lkml <linux-kernel@vger.kernel.org>, 
 stable@vger.kernel.org, Frank Wunderlich <frank-w@public-files.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210728_234747_401430_51D163BA 
X-CRM114-Status: GOOD (  11.80  )
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

On Thu, Jul 29, 2021 at 2:45 PM Frank Wunderlich <linux@fw-web.de> wrote:
>
> Am 29. Juli 2021 07:58:17 MESZ schrieb Hsin-Yi Wang <hsinyi@chromium.org>:
>
> >Should I create another patch based on this or can you help update the
> >mt8183 table in this patch?
>
> I prepared a patch for mt8183 and it is
> reported as working. I send out v2 with
> the patch squashed ok? It adds only val
> again to each element so i take the
> review-tag,ok?
>
You can also add by review tag:

Reviewed-by: Hsin-Yi Wang <hsinyi@chromium.org>

Thanks

> regards Frank

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
