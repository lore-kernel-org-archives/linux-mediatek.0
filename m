Return-Path: <SRS0=GdzH=KO=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 05ABFC433B4
	for <linux-mediatek@archiver.kernel.org>; Wed, 19 May 2021 05:24:03 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 733916135F
	for <linux-mediatek@archiver.kernel.org>; Wed, 19 May 2021 05:24:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 733916135F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=A9VqpTDCs8a+FHxgetSW/3IXXj1JnvDaNK8AH791Mik=; b=FXxvdJIesr9MbJXYaVpP70iit
	vB4JHqoHwdNzlwguIau/sTaMbKpcv+iyqdMD2y9O9Demx/C7FS/b3J9rbgcO8t0eB2PP/U1xWPp9x
	RIppeRSEu1UNt8XJnKQUo+rsIPDgOKpwL5WpFPfkVRZCuSe6z7gvyr8egt28OCuaJ0WJ6MXa+BlNo
	aT2yTDP+utxQGMZ1vGwgx/zgGk1NTEf0P+2jSeYHeQuRfe41JY3758GClMVkVaBBPTK6r2/CRNs1W
	TSAYIyCFzyvwX7KlCVeinp3Llot4krJ0/iajsvfFtM5S58y0N+FHqrpXjlWMA1MgLFNUK4adOavIe
	p0SwgdcgA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1ljEgN-002qyQ-Vp; Wed, 19 May 2021 05:23:48 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1ljEgL-002qy6-Bo
 for linux-mediatek@desiato.infradead.org; Wed, 19 May 2021 05:23:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Type:Cc:To:Subject:Message-ID
 :Date:From:In-Reply-To:References:MIME-Version:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=mgekGujD0L3/nuy0lfC+9c6pRyC5gvzSw48ji+1o7eY=; b=J2CSLCqlSjAJNjJFCkfP9wfOWd
 SZ3oj9cVx/2N66nrEaWV+/ilI0NfSS/kNZTo5rdIo9o2WWlePBXxpwiPzuMCpq1saBGOl2svzPZpu
 nUIj+3zC+zpGL9BasOSk4TVtWXSvIvJOXkCs0g8nGE+ZILnVEdu+BvoYSnnmLUZGHhcCcWMKM2dYR
 sEbCYVsw2vi6f955UE+iUb6nMBnrtbVNaUDHyjEDW+JkQ560GTajaNxp/XOgWnLz9+qYi54YixpeH
 vG4NVfd4uDUgh2ejwwKUoZcQMXPIc64qVvyXGDk33AVB3PuYZckTAxzdLRXITZwLtXos23b6U+1/3
 iRWBcj5Q==;
Received: from mail-lf1-x12f.google.com ([2a00:1450:4864:20::12f])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1ljEgI-00F90d-P9
 for linux-mediatek@lists.infradead.org; Wed, 19 May 2021 05:23:44 +0000
Received: by mail-lf1-x12f.google.com with SMTP id r5so17156254lfr.5
 for <linux-mediatek@lists.infradead.org>; Tue, 18 May 2021 22:23:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=mgekGujD0L3/nuy0lfC+9c6pRyC5gvzSw48ji+1o7eY=;
 b=BxXwbNi9geW7T+UQxXc7H28320kvwfeHhK6Z/pd+0AYTKV/reJlbzKJC4H19m0YnoU
 iFW1hqFzgcsSMO9x503aMETpWJfSZP1YRNossqQlHRVF3YwT6NpR35ZR9ioalX8zjyLC
 VRhwJtGk99MfU9GmkdCBAIaYcg8r5cKy5Aa/w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=mgekGujD0L3/nuy0lfC+9c6pRyC5gvzSw48ji+1o7eY=;
 b=VYIDEp5wlHMLvOJi4sBZN7OtO/6H37f1WdT7yk91sxShfbajmY3ab/hUHbOWcs1gsS
 /J7eRPzKkQdXC0VWRCF9SWCHBeeme3GZGzVTJNZ0FncCQGG1kpZkz2BRbtjINfXm+/kz
 wvxa8957U04VkCzVVtSIg+HD/qvHZe6iJGFjiTr3YtKh58IullCCwnnvDVZ8vEwYuV1d
 2hKtCZdRBpJzt97fjaU4G8NQ1YgFZ4KVxXvDs2jQRLG8zxCJBqog5Pyqg4FficupVOk0
 ctbj7OBXRxz544/+5A+YdXT6k5c/4qu9UTozoTE1aFqURAM57weXfF/co4Yi5W3u8YfF
 oSoA==
X-Gm-Message-State: AOAM532V8UsEcfDHlTzuE+prEWmhUBGer3byX1701DqC3gLYaWoLVraW
 beVk239anHBd3NeFagV2vPFZFHbpnU0Kyw==
X-Google-Smtp-Source: ABdhPJxBmBUhzHqAwkJwIkEKvMXIOBskf3z/BmaQb1ytaZ1sdAmVKorbqgfwW+gHz2FI5uj9v4Cc9A==
X-Received: by 2002:a05:6512:220b:: with SMTP id
 h11mr7008309lfu.17.1621401819945; 
 Tue, 18 May 2021 22:23:39 -0700 (PDT)
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com.
 [209.85.167.48])
 by smtp.gmail.com with ESMTPSA id c5sm1012930ljj.17.2021.05.18.22.23.39
 for <linux-mediatek@lists.infradead.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 18 May 2021 22:23:39 -0700 (PDT)
Received: by mail-lf1-f48.google.com with SMTP id j6so14493952lfr.11
 for <linux-mediatek@lists.infradead.org>; Tue, 18 May 2021 22:23:39 -0700 (PDT)
X-Received: by 2002:a05:6512:33c8:: with SMTP id
 d8mr7286426lfg.614.1621401818561; 
 Tue, 18 May 2021 22:23:38 -0700 (PDT)
MIME-Version: 1.0
References: <20210427111526.1772293-1-acourbot@chromium.org>
 <20210427111526.1772293-8-acourbot@chromium.org>
 <CAJMQK-g=bnr9bAkvN61sFapX_XOKmUF8LPivtCEzUhP-LjoHUw@mail.gmail.com>
In-Reply-To: <CAJMQK-g=bnr9bAkvN61sFapX_XOKmUF8LPivtCEzUhP-LjoHUw@mail.gmail.com>
From: Alexandre Courbot <acourbot@chromium.org>
Date: Wed, 19 May 2021 14:23:25 +0900
X-Gmail-Original-Message-ID: <CAPBb6MXgG2fENJXgCrKoUxaeV6H0Azo7BWpwf9-4ZyJZ9JiSTg@mail.gmail.com>
Message-ID: <CAPBb6MXgG2fENJXgCrKoUxaeV6H0Azo7BWpwf9-4ZyJZ9JiSTg@mail.gmail.com>
Subject: Re: [PATCH v4 07/15] media: mtk-vcodec: vdec: add media device if
 using stateless api
To: Hsin-Yi Wang <hsinyi@chromium.org>
Cc: Tiffany Lin <tiffany.lin@mediatek.com>,
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>, 
 Rob Herring <robh+dt@kernel.org>, Yunfei Dong <yunfei.dong@mediatek.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>, 
 Linux Media Mailing List <linux-media@vger.kernel.org>,
 lkml <linux-kernel@vger.kernel.org>, 
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210518_222342_884834_7257707E 
X-CRM114-Status: GOOD (  18.85  )
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

On Mon, May 17, 2021 at 1:35 PM Hsin-Yi Wang <hsinyi@chromium.org> wrote:
>
> On Tue, Apr 27, 2021 at 7:16 PM Alexandre Courbot <acourbot@chromium.org> wrote:
> >
> > From: Yunfei Dong <yunfei.dong@mediatek.com>
> >
> > The stateless API requires a media device for issuing requests. Add one
> > if we are being instantiated as a stateless decoder.
> >
> > Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>
> > [acourbot: refactor, cleanup and split]
> > Co-developed-by: Alexandre Courbot <acourbot@chromium.org>
> > Signed-off-by: Alexandre Courbot <acourbot@chromium.org>
> > ---
> >  drivers/media/platform/Kconfig                |  1 +
> >  .../platform/mtk-vcodec/mtk_vcodec_dec_drv.c  | 39 +++++++++++++++++++
> >  .../platform/mtk-vcodec/mtk_vcodec_drv.h      |  2 +
> >  3 files changed, 42 insertions(+)
> >
> > diff --git a/drivers/media/platform/Kconfig b/drivers/media/platform/Kconfig
> > index ae1468aa1b4e..4154fdec2efb 100644
> > --- a/drivers/media/platform/Kconfig
> > +++ b/drivers/media/platform/Kconfig
> > @@ -315,6 +315,7 @@ config VIDEO_MEDIATEK_VCODEC
> >         select VIDEO_MEDIATEK_VCODEC_VPU if VIDEO_MEDIATEK_VPU
> >         select VIDEO_MEDIATEK_VCODEC_SCP if MTK_SCP
> >         select V4L2_H264
> > +       select MEDIA_CONTROLLER
>
> Should this also select MEDIA_CONTROLLER_REQUEST_API config?

Yup, it probably should. hantro and rkvdec also select it, so let's do the same.

Thanks!
Alex.

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
