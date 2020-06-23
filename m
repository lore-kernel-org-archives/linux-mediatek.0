Return-Path: <SRS0=E2+4=AE=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2A9FFC433E0
	for <linux-mediatek@archiver.kernel.org>; Tue, 23 Jun 2020 18:44:44 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EF4F520781
	for <linux-mediatek@archiver.kernel.org>; Tue, 23 Jun 2020 18:44:43 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="UgEKSZyg";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=vanguardiasur-com-ar.20150623.gappssmtp.com header.i=@vanguardiasur-com-ar.20150623.gappssmtp.com header.b="O84lAlQt"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EF4F520781
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=vanguardiasur.com.ar
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=6IQsBNQN01gPzMVH/mEegQ6CWyenJiFfB9UG3XclO54=; b=UgEKSZygVlXMuVSfO226SYfmr
	nab7TpJhEZjSANr42F8IGXEXC3eBojQvb87z311AFw1/G62XjneT2WLX2qC393U9Wefjq0y9Bv1fg
	vlgRSs0N/OkaYsLKylCMDqyAQ/aVNfppkEOve/H/9lXToNeKSdVAcVwmBs0Y1sJ0KvgcEAj2jqaeB
	hrKhvp+dC/iZSKpBP/ThJBIsWmo43FeZj6XYdhLVdY0HfNN4wNh/hRVWMbiD20LTNeQPZdPqvg5Z4
	9UgDF5eIK+DFoAK3rxRA/4xqdJ6Nnj5vsMw/XZCFQhqOqnQXNDvI1JfBpRJ4668z36RfACN1AflTU
	PqDLInqRg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jnnuG-0002KX-U9; Tue, 23 Jun 2020 18:44:28 +0000
Received: from mail-ed1-x541.google.com ([2a00:1450:4864:20::541])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jnnuD-0002I8-Ek
 for linux-mediatek@lists.infradead.org; Tue, 23 Jun 2020 18:44:26 +0000
Received: by mail-ed1-x541.google.com with SMTP id t21so17114951edr.12
 for <linux-mediatek@lists.infradead.org>; Tue, 23 Jun 2020 11:44:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=vanguardiasur-com-ar.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=YHRfY/482pH60fZPQJikxqae/P0Z6lDDbQXNlIRp7tc=;
 b=O84lAlQtan6g3BHHHf7sIEL60Tt8VsrCeEVE8CQeBdNfZtWiEkIBf5EnEBTSnOIYhV
 EPdW4t8kcLvZ9LhfuTnNxdMsJ721WftZAm2YfItBlw7ZCfjOPOaCPgEhEUNc/LV9MpMT
 UfTabuopH1KekbGurNoL/s3jNY+zFWjIe+weZsQUyV611kaMJC6SyKOGCy0LGyPBBocU
 I6eEwuTw3L5JxgW9yX5wsfKT5IEMwvCDD1gcvJX0Dzz/DeyHX3FjI/lPlo2zl6EOxPbC
 oaCdMzn5EhGGffrjqZGBaLeDIrHSd1fkpJvfsTmFDUL3W1alvsulTjb0gLAndKmgvLhD
 JFYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=YHRfY/482pH60fZPQJikxqae/P0Z6lDDbQXNlIRp7tc=;
 b=XHhIK1bmvscD33MjKG1KBgBbiXyC/0IjVAmXh223NRzzzRkOgsLFtO2uNIO55vujyR
 S3qsuswTM3y59O8M1w0O/UgHG7b5qsG0+Pjx4p6Hm5adAjgrVQ2TGbE1gaBOhXEFNOPa
 7Mf2BwJj2qAC2sEWYR/MrwiICBLd5kR26kwll59XPSz0GGqQYIyPi/uEsfzD1oBAB/Lm
 qcFUEXSr9bIFuwLBR+2F5NOzrfgck0TmMaUrxnc9S4/iW2XBhkYvDYY7DUGfFD6pE7Kq
 b/zHvsfoQMttA9xSl51TvVVgRcXzTEOvwRZeJLcGuEnS+y94jxBhO/Mh5hogcWAbrDJt
 0Xsw==
X-Gm-Message-State: AOAM531+Rk1VCBwYg8nbhohms74Rchg2/RXDubVb+9vK2G2aZjzkYhv4
 ZFFRopOH0IF9U5yQMFet7dsBAetY853tjgD19R1LCQ==
X-Google-Smtp-Source: ABdhPJyPUIlDVH1n7pGFYZ5aO9aLZJphcDUMccOXmcIiaLZUxDvA5Dpv5o3A65C6wRy4Z9PcnkaV9feKOmD03dYG9P4=
X-Received: by 2002:a05:6402:1247:: with SMTP id
 l7mr22177355edw.61.1592937862811; 
 Tue, 23 Jun 2020 11:44:22 -0700 (PDT)
MIME-Version: 1.0
References: <20200622015227.24134-1-yunfei.dong@mediatek.com>
In-Reply-To: <20200622015227.24134-1-yunfei.dong@mediatek.com>
From: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Date: Tue, 23 Jun 2020 15:43:47 -0300
Message-ID: <CAAEAJfBtuZUn-LxiwCZ75rwT_oEuM-_QEXCH4-vFhV6X+8=4SA@mail.gmail.com>
Subject: Re: [PATCH v2, 0/2] This patchset add Read-only(Ro) request for
 capture queue
To: Yunfei Dong <yunfei.dong@mediatek.com>
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
 devicetree <devicetree@vger.kernel.org>,
 Tiffany Lin <tiffany.lin@mediatek.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Tomasz Figa <tfiga@chromium.org>, Hans Verkuil <hverkuil@xs4all.nl>,
 Rob Herring <robh+dt@kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 linux-media <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi Yunfei,

Thanks for the patch.

On Sun, 21 Jun 2020 at 22:55, Yunfei Dong <yunfei.dong@mediatek.com> wrote:
>
> User driver need to get HDR10+ information for each capture buffer;
> For some encoder cases, user driver need to get encoded message for
> each frame. So add support read-only(Ro) request for capture queue.
>
> Ro request mean that user driver just can get ext ctrls, set ext ctrls
> is not not allowed. Ro Request also can be used in output queue.
>
> There is not upstream driver to use this feature at now, but we are
> developing internal driver to use it. If it is ready, we will try to
> upstream vdec/venc driver based on this feature.
>

An upstream driver using the feature would be important, but it would
be nice to also have: an open-source userspace application,
and a proper explanation in the stateless decoder interface specification.

Thanks,
Ezequiel

> Change compared to v1:
> -change commit message of patch 01/02
> -change commit message of patch 02/02
>
> Yunfei Dong (2):
>   media: v4l UAPI: add V4L2_BUF_CAP_SUPPORTS_RO_REQUESTS
>   media: v4l: Add Ro request api for capture queue
>
>  .../media/v4l/vidioc-reqbufs.rst              |   4 +
>  .../media/common/videobuf2/videobuf2-v4l2.c   |   7 ++
>  drivers/media/mc/mc-request.c                 |  10 +-
>  drivers/media/v4l2-core/v4l2-ctrls.c          | 107 +++++++++++++++---
>  drivers/media/v4l2-core/v4l2-ioctl.c          |  22 ++++
>  drivers/media/v4l2-core/v4l2-mem2mem.c        |  19 ++--
>  include/media/v4l2-ctrls.h                    |  22 +++-
>  include/media/v4l2-fh.h                       |   2 +
>  include/media/videobuf2-core.h                |   2 +
>  include/uapi/linux/videodev2.h                |   1 +
>  10 files changed, 158 insertions(+), 38 deletions(-)
>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
