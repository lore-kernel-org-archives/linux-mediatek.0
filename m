Return-Path: <SRS0=CkUm=G7=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5D92BC433E0
	for <linux-mediatek@archiver.kernel.org>; Thu, 28 Jan 2021 11:13:16 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 09F0C64DA1
	for <linux-mediatek@archiver.kernel.org>; Thu, 28 Jan 2021 11:13:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 09F0C64DA1
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Ej33Iep7YEp07VB14fw1vmNeg9UvJ2CqD1iCg4PzCYc=; b=q8f6MVXooBR3fOz6ricmZy2bl
	j8wjv1fjSXs0eDyCVWlt5m2yXZpS+ay5G+s/0ymvdnEM4914Dha0GTrzjTrnCRdUSaAIeMflaOR06
	zHJSxj3Vz+i5ynisjpsEKh3iYffBopc83HE/B0DjrqNqXSkPlIPLEQNCZisE3uvd6w4nzfbpE3lV5
	rO77C2wHGjLUlVRpFqdXCXInpyVGjxjTZ2YOwFtYvIORwDDPZG0Nbf4fhETQ7iMDKCTZkNp0/RdhJ
	T5ToEcJtqBaCybomG4S3GCpiPp8sZ9IcpEYy42NNlhIryMUZF2zEpH2B2jzVhZfzHxb6FwAFulHjv
	nBdY4a1Zw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l55EY-0007XE-Vj; Thu, 28 Jan 2021 11:13:07 +0000
Received: from mail-il1-x134.google.com ([2607:f8b0:4864:20::134])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l55EW-0007UE-MG
 for linux-mediatek@lists.infradead.org; Thu, 28 Jan 2021 11:13:05 +0000
Received: by mail-il1-x134.google.com with SMTP id d6so4848108ilo.6
 for <linux-mediatek@lists.infradead.org>; Thu, 28 Jan 2021 03:12:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=/WJw1aJ983EEKpRj5gZ4zFlUrwFHoMadbviHbndDVT8=;
 b=dfDCHTrz8XskJkazSFR/d269ImWmkT6WKjpQ1j4AVPkVQ0H4j5zdogEiMZAuBs2Nuq
 PLm6Pn+zV760awkBSwTDMSe/TivqPc3s/134zz9sRbBQABFJfAnM4SjROF9bDhhkPFXx
 dFFpptCksPnvkPoUioIRniNKaaMkEX+xcGyNg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=/WJw1aJ983EEKpRj5gZ4zFlUrwFHoMadbviHbndDVT8=;
 b=l7UCKRg+2878ZtvpkaQuLW2zGFP8PXBrHCqAlpDTjBMg+H8dR9wt5KIdL1oW4Mk09q
 StSGMihf22Ydux4Hi8+UIwo98YOneLcG5ocAlN2uFz4zwor1C8fmCV00l19Yc82lxuH+
 WfVpxZxGyUs44bB4Z47/P4iibQKo2oEdJfpTTkkURVQmFk+dX4AXho5ZYtUIvl3t3N1H
 YN1rwxKctl/L/2Jzd5vZuW4i4MGq2ISISWZFUGBySIPaCs1P0FY0YIT2E25GKXx0Iooe
 qqrZ2EOUIVTJFcPj5oUbhb+G53E9QkNIWEdbjn6PFTwzbj6mhweGtx0EOZ39mWaRPRsb
 0hCg==
X-Gm-Message-State: AOAM531ep3qi3bZskfa5dRnpL77tq/QOiJKHAeJktey02bcrTVTnadmR
 ncxn24Et8u/r//LIyEwkoVR/V7bGwjFdtL5aPjomLw==
X-Google-Smtp-Source: ABdhPJxpvtqvyRoNVw2J32fCidzTHWv4s/97L1l2P7XY3BFLhw9LEXqsuGOgsssZ07Bdcb7TGzMR023+FxP+UJYso4w=
X-Received: by 2002:a05:6e02:509:: with SMTP id
 d9mr12671592ils.150.1611832366253; 
 Thu, 28 Jan 2021 03:12:46 -0800 (PST)
MIME-Version: 1.0
References: <20210128072802.830971-1-hsinyi@chromium.org>
 <20210128072802.830971-4-hsinyi@chromium.org>
 <1611820251.16091.7.camel@mtksdaap41>
In-Reply-To: <1611820251.16091.7.camel@mtksdaap41>
From: Hsin-Yi Wang <hsinyi@chromium.org>
Date: Thu, 28 Jan 2021 19:12:20 +0800
Message-ID: <CAJMQK-igcZXrnTb6pA3S6X_uTF6aGhKFLAHtdet62od9vVx4rg@mail.gmail.com>
Subject: Re: [PATCH v11 3/9] drm/mediatek: add RDMA fifo size error handle
To: CK Hu <ck.hu@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210128_061305_022710_78F8AFD1 
X-CRM114-Status: GOOD (  21.21  )
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
Cc: Mark Rutland <mark.rutland@arm.com>,
 Devicetree List <devicetree@vger.kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@linux.ie>,
 lkml <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Yongqiang Niu <yongqiang.niu@mediatek.com>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Daniel Vetter <daniel@ffwll.ch>, Matthias Brugger <matthias.bgg@gmail.com>,
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Thu, Jan 28, 2021 at 3:52 PM CK Hu <ck.hu@mediatek.com> wrote:
>
> Hi, Hsin-Yi:
>
> On Thu, 2021-01-28 at 15:27 +0800, Hsin-Yi Wang wrote:
> > From: Yongqiang Niu <yongqiang.niu@mediatek.com>
> >
> > This patch add RDMA fifo size error handle
> > rdma fifo size will not always bigger than the calculated threshold
> > if that case happened, we need set fifo size as the threshold
> >
> > Signed-off-by: Yongqiang Niu <yongqiang.niu@mediatek.com>
> > Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
> > ---
> >  drivers/gpu/drm/mediatek/mtk_disp_rdma.c | 4 ++++
> >  1 file changed, 4 insertions(+)
> >
> > diff --git a/drivers/gpu/drm/mediatek/mtk_disp_rdma.c b/drivers/gpu/drm/mediatek/mtk_disp_rdma.c
> > index b84004394970f..04b9542010b00 100644
> > --- a/drivers/gpu/drm/mediatek/mtk_disp_rdma.c
> > +++ b/drivers/gpu/drm/mediatek/mtk_disp_rdma.c
> > @@ -168,6 +168,10 @@ void mtk_rdma_config(struct device *dev, unsigned int width,
> >        * account for blanking, and with a pixel depth of 4 bytes:
> >        */
> >       threshold = width * height * vrefresh * 4 * 7 / 1000000;
> > +
> > +     if (threshold > rdma_fifo_size)
> > +             threshold = rdma_fifo_size;
> > +
>
> Please see the discussion in [1].
>
> [1]
> https://patchwork.kernel.org/project/linux-mediatek/patch/1607591262-21736-6-git-send-email-yongqiang.niu@mediatek.com/
>
> Regards,
> CK
>

Hi CK,

Even if we set threshold to
threshold = RDMA_FIFO_PSEUDO_SIZE(rdma_fifo_size) * width * height *
vrefresh / 2 / MAX_WIDTH / MAX_HEIGHT / MAX_VREFRESH;

I'm not sure what value MAX_WIDTH, MAX_HEIGHT, and MAX_VREFRESH should
set to for each SoC.
Since there's no conclusion yet, I'll drop this patch in the series,
as this seems not an mt8183 specific fix.


> >       reg = RDMA_FIFO_UNDERFLOW_EN |
> >             RDMA_FIFO_PSEUDO_SIZE(rdma_fifo_size) |
> >             RDMA_OUTPUT_VALID_FIFO_THRESHOLD(threshold);
>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
