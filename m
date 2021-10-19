Return-Path: <SRS0=SpBb=PH=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 15120C433EF
	for <linux-mediatek@archiver.kernel.org>; Tue, 19 Oct 2021 03:05:30 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D15D9611BF
	for <linux-mediatek@archiver.kernel.org>; Tue, 19 Oct 2021 03:05:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D15D9611BF
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yF/GYXxxFZb3R1+hf0pGZXdifF9655Zh0gKaUyJWy9c=; b=mQcSjqQ6KoYoWz
	8Dkl2zCGDa6UdW63pjqYIxFgnSv/rY663cgQDiWDjpQSjSz8Xn3+H6ChPCH9w33ZQN3TArHgH2F/F
	jFf3LBx34jL/etvI5cyIiSG8CQeEj9LGNlrYmO3D39ljkLJqTqz6HRpZ1kHHv6wSI+MK5uEShp9Vj
	0GOHdKHZC5PXkX7Y53nnqy8U+fugsK3gHP0sjarVsk61DSS5aKhmLf0tM/0JMeDIMShtjHDzF/FFm
	tWUIv3M0yr64Wgewh5V5b9PJLW0Cg1BEJcGKZTD3xXOheenoko/+MpExDsI4OUV6IHfb5bJviN40M
	I4gBttl2d5DWbIPLV3tw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mcfRA-0001sz-2S; Tue, 19 Oct 2021 03:05:12 +0000
Received: from mail-lf1-x12f.google.com ([2a00:1450:4864:20::12f])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mcfR6-0001rE-Gu
 for linux-mediatek@lists.infradead.org; Tue, 19 Oct 2021 03:05:09 +0000
Received: by mail-lf1-x12f.google.com with SMTP id x27so4188631lfu.5
 for <linux-mediatek@lists.infradead.org>; Mon, 18 Oct 2021 20:05:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=2RwHxSx3TiJnEJ/9dbX2TWefdd9wWbyowa5HQ0W9C7Q=;
 b=mNGO7s6puZSQ2VapweLJ0fNTY5XwkSE3LnLZo/QEeCE630qcjlF/cihEYJZW/EVF/5
 CbZj0rMMLs7/50AMBAyFCryuVy8QXuRza6IR2f/QIphmxiEqQtGKaJHDsLXqHxFYyWda
 ymrNT2gwMDK3w6Dnxva0EYDnEa8VwkywyW93o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=2RwHxSx3TiJnEJ/9dbX2TWefdd9wWbyowa5HQ0W9C7Q=;
 b=34who3ejsDSTTwtvHkv0s3Ceao3XEjatlG0gK+POFGGIKomcG4UYBtOro7tLjKqtzs
 ygMXjxSsKQ4VdnnLCOqnkzk4lbqpNxhZp/iYem8uAuXdk4cXLe5xgfJ+7dZbQZm+cuQJ
 B7amIR/9764BeWmp/oOtmSkpsjNeP3aGMG+DCsgpI23nUPq8tr+I8PG7zGC7SBZKUoy7
 r/VNZa/M0F+k1M5ApaXyl9ksV3GydU0b3OIxY33jxbox8eCPR+LGNxwtCXXcV9W+WQL1
 j6Y75Tm5QL5n1D3NU+YcCgX6/kwOzRX/OeMm/a0I7RCufyL6WuE/8IdWxOvCxFgbQMtI
 b+jQ==
X-Gm-Message-State: AOAM531U0l5/bGjQFzl0B/8GsEUj3BqKFZWvh22Mh01ilmm6DaD8rPq+
 zUrxIaKOpSZze3ku+5QlEn5qkOY/u/qhWJij2HIl2A==
X-Google-Smtp-Source: ABdhPJwD3DifPQ8LZU5dqzif2r7i/5I93Q/94pY/t9RnGIA9JJT3zvS/eJXVikSsp2wvgoZh14V0Jm3BISb9j6i55vs=
X-Received: by 2002:ac2:58ec:: with SMTP id v12mr3496440lfo.371.1634612706009; 
 Mon, 18 Oct 2021 20:05:06 -0700 (PDT)
MIME-Version: 1.0
References: <20211019013759.970600-1-ran.jianping@zte.com.cn>
In-Reply-To: <20211019013759.970600-1-ran.jianping@zte.com.cn>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Tue, 19 Oct 2021 11:04:55 +0800
Message-ID: <CAGXv+5G5JAOgvPatqto45daQsxL+OqTHboLXZwCc-nPY9saT6w@mail.gmail.com>
Subject: Re: [PATCH clk:mediatek] clk:mediatek: remove duplicate include in
 clk-mt8195-imp_iic_wrap.c
To: cgel.zte@gmail.com
Cc: Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>,
 Chun-Jie Chen <chun-jie.chen@mediatek.com>, 
 ran.jianping@zte.com.cn, linux-clk <linux-clk@vger.kernel.org>, 
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>, 
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 LKML <linux-kernel@vger.kernel.org>, Zeal Robot <zealci@zte.com.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211018_200508_615081_D02A029E 
X-CRM114-Status: GOOD (  15.83  )
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

On Tue, Oct 19, 2021 at 9:38 AM <cgel.zte@gmail.com> wrote:
>
> From: Ran Jianping <ran.jianping@zte.com.cn>
>
> 'dt-bindings/clock/mt8195-clk.h' included in
> '/drivers/clk/mediatek/clk-mt8195-imp_iic_wrap.c' is duplicated.It is
> also included on the 13 line.
>
> Reported-by: Zeal Robot <zealci@zte.com.cn>
> Signed-off-by: Ran Jianping <ran.jianping@zte.com.cn>
> ---
>  drivers/clk/mediatek/clk-mt8195-imp_iic_wrap.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/clk/mediatek/clk-mt8195-imp_iic_wrap.c b/drivers/clk/mediatek/clk-mt8195-imp_iic_wrap.c
> index 0e2ac0a30aa0..1aa5afc05929 100644
> --- a/drivers/clk/mediatek/clk-mt8195-imp_iic_wrap.c
> +++ b/drivers/clk/mediatek/clk-mt8195-imp_iic_wrap.c
> @@ -10,7 +10,7 @@
>  #include <linux/clk-provider.h>
>  #include <linux/platform_device.h>
>
> -#include <dt-bindings/clock/mt8195-clk.h>
> +

Just drop the line. Don't need the extra empty line.

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
