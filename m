Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 153DEC4332F
	for <linux-mediatek@archiver.kernel.org>; Wed,  2 Nov 2022 09:24:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CAWuHkpwgFfj7hhvFV4HxiLR1FE5OMLKHNPDDaCEASU=; b=I3rh2JHY2ZLW6du2fhaX4cVCrP
	zzPomFFslprMtP1up7PzXaMKRk3inWCOEyTkxZCF3WbKeyx4AOjX3HmsrUJywTeFE6lxxFV1G9l1h
	mb8gTc/AqoU6e8i91GV0GNZJzTdfpSH3DHV0e+A2Xoyb1gCmdQ2y6H27bfVTzQfh6tbSwZ6RV9yFt
	HhL9bXvj6I5qVISa3nnLJbPUuQLVBW5GvZX8WI4DKIUX1HXBaMlbGcnY6XvNvZa8A8o9oLT/0wHov
	8Y2nTWuEuhCRNQIzCpPb8Vu5tRDxzEnfCO1ewZHL2fZUr3itse7mhr0ultra8UAbPqyBeZPfVqcX5
	RlHesgVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oq9yf-00ACqe-Fm; Wed, 02 Nov 2022 09:24:05 +0000
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oq9xy-00AC9Y-E6
	for linux-mediatek@lists.infradead.org; Wed, 02 Nov 2022 09:23:26 +0000
Received: by mail-ej1-x62a.google.com with SMTP id ud5so43668068ejc.4
        for <linux-mediatek@lists.infradead.org>; Wed, 02 Nov 2022 02:23:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=CAWuHkpwgFfj7hhvFV4HxiLR1FE5OMLKHNPDDaCEASU=;
        b=Gtu0Ihij+nBxhtfx6L2SIRCXBbEoh6Ml8CRcad4tGqp0bDLotvBdDokciS4kkebKf+
         c7JGqzXn/KB9jct4cDwpgKInbF2y/Jn6Aw0Ja72vQd5X7jQv3zfHK/SMClip4QvPLh0u
         5CJOgas3x0pDyfEsA/TKs7cAQZyJ7Jmc0qUrE397kgEUCIpjMvyul5oaEQxcgqWJAR5R
         fvdFGUCLmKgH/eIVIVrnoBKLoXH4zPdimLuNhKZubyR7LGpEgBWJFvwz0Ay10zC/In0D
         usUXQ0kII5JY0q+QTiTylaJX7guINEk/3sElROzw+akl6ZVOM09N5IhXCxEtOHxRF6aj
         DmvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CAWuHkpwgFfj7hhvFV4HxiLR1FE5OMLKHNPDDaCEASU=;
        b=ELdO4kAMP2s7yGNmeg4z2Yp5fpzL+/U1Mxpsm2eYj8B4pEYSAHUBCF3qfZU399LZHn
         l2SQwMv7frbeK0vV5MvyWSr80k+ygHZy+1UPSc3fZdmE4olOiscFeyw0LgO0ND9JSCa4
         7kOK8BX8r/ztvGsldxTEp5wm6Zf+mHNIxHDk0ZLjOnpcfO59Z4Bm411LTzAKElm30t7/
         1giVQTJK4VkzNKEK2Zh3G9Oibtx1hqGhXm+9zZx8NajI+6dxRVrAUBWJeXhCWObM6nMA
         oPaa3rBGmVfk+zE4JqDzOQQ7OrA1TWuB0FMEXWuWRstI9dEHix1qI4aCo1Oxx7MhY3da
         Tz7g==
X-Gm-Message-State: ACrzQf1eJfeN6Mv0UJTHhXZh/EArGclBw9WcesOkCnxbfFhJ+pZ0oD3D
	Em+5Eh/Oa+bqNQ88rIQDPi120W39Jw4TkMDY9FoZ3g==
X-Google-Smtp-Source: AMsMyM4Z+d3FlUYFTaTzsaq4IqvJzKWCQTziKaxgs3wXWXAnaLeMiKS9TGWC3euoNd0VWQleMtvHS7le7gJSoYKCCR4=
X-Received: by 2002:a17:906:9b86:b0:73d:72cf:72af with SMTP id
 dd6-20020a1709069b8600b0073d72cf72afmr23201600ejc.440.1667380988923; Wed, 02
 Nov 2022 02:23:08 -0700 (PDT)
MIME-Version: 1.0
References: <20221021084708.1109986-1-bchihi@baylibre.com> <7h5yg02bh7.fsf@baylibre.com>
In-Reply-To: <7h5yg02bh7.fsf@baylibre.com>
From: Balsam CHIHI <bchihi@baylibre.com>
Date: Wed, 2 Nov 2022 10:22:33 +0100
Message-ID: <CAGuA+oqWXy-WV3-VFN+Mm8cHnAbr83a4HjE=PuyH2CVV9soZVg@mail.gmail.com>
Subject: Re: [v2, 0/2] Fix broken SET/CLR mode of a certain number of pins for
 MediaTek MT8385 SoC
To: Kevin Hilman <khilman@kernel.org>
Cc: sean.wang@kernel.org, linus.walleij@linaro.org, matthias.bgg@gmail.com, 
	linux-mediatek@lists.infradead.org, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221102_022322_764246_4787AEB4 
X-CRM114-Status: GOOD (  18.49  )
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

On Mon, Oct 31, 2022 at 5:40 PM Kevin Hilman <khilman@kernel.org> wrote:
>
> Hi Balsam,
>
>
> bchihi@baylibre.com writes:
>
> > From: Balsam CHIHI <bchihi@baylibre.com>
> >
> > On MT8365, the SET/CLR of the mode is broken and some pins won't set or clear the modes correctly.
> > To fix this issue, we add a specific callback mt8365_set_clr_mode() for this specific SoC.
> > This callback uses the main R/W register to read/update/write the modes instead of using the SET/CLR register.
> >
> > This is the original patch series proposed by Fabien Parent <fparent@baylibre.com>.
> > "https://lore.kernel.org/linux-arm-kernel/20220530123425.689459-1-fparent@baylibre.com/"
> >
> > Changelog:
> > Changes in v2 :
> >         - Rebase on top of 6.1.0-rc1-next-20221020
> >         - Delete MTK_PINCTRL_MODE_SET_CLR_BROKEN quirk
> >         - Add mt8365_set_clr_mode() callback
>
> nit: subject of cover letter should also include "pinctrl: mediatek:"
> prefix.  Also note that you're missing the word "PATCH" in all of the
> subjects.
>
> Tip: If you use `git format-patch`, you can just pass `-v2` on the
> cmdline and it will create the prefixes for you automatically.
>

Hi Kevin,

Well received.
I will fix these issues in the next version/resend.
Thank you so much for the review!

Balsam.

> Kevin

