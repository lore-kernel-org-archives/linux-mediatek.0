Return-Path: <SRS0=sr8Z=CM=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2354BC433E2
	for <linux-mediatek@archiver.kernel.org>; Thu,  3 Sep 2020 00:08:24 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E19AE20773
	for <linux-mediatek@archiver.kernel.org>; Thu,  3 Sep 2020 00:08:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="xJ5YdCBp";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="ZVPNUDXf"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E19AE20773
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=ePixGgc9P5WOAQAZdRuiOl/Tpk8W6fqziFu64FLRcPo=; b=xJ5YdCBpmeMDC9WIca8pfJvX1
	2wkrx8HlaXSgB5KE6aejs0SvWZFIzimNM5zYEYtnZZ7ap24C2eGyHZhfD/BGNoHQCSO4bbtOfKk44
	ZwjDZRbjwr+umEwYeIBDbCaBEGZ51d3gsFob9OfuE+ki+vtIx3vsb/eGeh0DhMlBP4/3wOKCUmc7P
	HsE0p/iU4tY6TOSvSDBDVmpxG3JW7nuiHHLj8lwEuSvtGZbid538Zgl9yiS1QSjtGpYFwq6zPIEdb
	rnkBunD2XDoHyNYjWzO1mKo4FjQyVosdJu4/7wWAxDBM2SNJRiDL7lddgafcqzriHuI359nbBrU03
	KfGmwEpAA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kDcnX-00073q-46; Thu, 03 Sep 2020 00:08:15 +0000
Received: from mail-vs1-xe44.google.com ([2607:f8b0:4864:20::e44])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kDcnU-00072l-Sj
 for linux-mediatek@lists.infradead.org; Thu, 03 Sep 2020 00:08:13 +0000
Received: by mail-vs1-xe44.google.com with SMTP id o184so747677vsc.0
 for <linux-mediatek@lists.infradead.org>; Wed, 02 Sep 2020 17:08:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=vNGK0drLoWNgYFtnyo0bGiJC6OE4+o9KPc4VANTcGUU=;
 b=ZVPNUDXf6tQVcgw8kkHHQyjEAOsLqycSIz1ehYZm+uVXTd9CN/j5btk5vfe+0MxcpN
 z0MpYoLoq3SETJ9XNMrcemRwFcAyZQadJmVdpxOACzSkHQKavJzwtcVAxvf6+bGo337V
 G47Y0VYQUWmV0mr4nvMqdD/QNGIE9tI4Bw3wQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=vNGK0drLoWNgYFtnyo0bGiJC6OE4+o9KPc4VANTcGUU=;
 b=B1J7qDwHlhbQzCVK5BeUzhHmKvQPcsbVzlTd8HyCArFp3ar3UKvBhgLcS+/TNOH0Bd
 IzE16wJzyij/4hUguSuAzEq4NSq5uAnpNyY3ZbiHSZ46NaSRXpA0ACowioz1/LmgY9CK
 pReh7zf2df8V3IYRrrJ+UjJUzHF4F2wy7mfRLraQHWSdh18be11z4tToLMCtT3n+0NHq
 6KWJXsSCRqdk7I0aWN9DIbRPnpAGKf5wN0ZFTqQ4/rKPuHrAhgiasi5/UqTYN6cjrMlW
 aAsRmNvdFeOdHNrxGtjXoiaL7j5GRDGERNB0NbaGOQEFBuUUvRiHs/amL27CRZbkYnBI
 tM1A==
X-Gm-Message-State: AOAM531qJ2RE/Km358svPO04YznxM+mPM+mUoMe+iY3lCXe64zpk8Lw6
 g6yFiaAF9FzQBs3CrOkxLTzOjY7VqJQXCF2HeeJTMA==
X-Google-Smtp-Source: ABdhPJyyh8r00V5dnzC7J663uWgsb6bIr45zqffFvMVOa7JwQMs1QHsDUIoUGvYd0l5Gb33OEKfuJA9HIJBcdXdIKco=
X-Received: by 2002:a05:6102:3d7:: with SMTP id
 n23mr164533vsq.57.1599091690996; 
 Wed, 02 Sep 2020 17:08:10 -0700 (PDT)
MIME-Version: 1.0
References: <20200902190709.v2.1.I56cf27cd59f4013bd074dc622c8b8248b034a4cc@changeid>
 <20200902165505.GA280378@xps15>
In-Reply-To: <20200902165505.GA280378@xps15>
From: Nicolas Boichat <drinkcat@chromium.org>
Date: Thu, 3 Sep 2020 08:08:00 +0800
Message-ID: <CANMq1KDcYRKWxQ6+AQ=eTRcHdkiWyzH7BTahXdag5=FdnF7e1g@mail.gmail.com>
Subject: Re: [PATCH v2] rpmsg: Avoid double-free in mtk_rpmsg_register_device
To: Mathieu Poirier <mathieu.poirier@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200902_200812_932628_1AC7D6BC 
X-CRM114-Status: GOOD (  19.92  )
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
Cc: Ohad Ben-Cohen <ohad@wizery.com>,
 "open list:REMOTE PROCESSOR \(REMOTEPROC\) SUBSYSTEM"
 <linux-remoteproc@vger.kernel.org>, lkml <linux-kernel@vger.kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Pi-Hsun Shih <pihsun@chromium.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Thu, Sep 3, 2020 at 12:55 AM Mathieu Poirier
<mathieu.poirier@linaro.org> wrote:
>
> On Wed, Sep 02, 2020 at 07:07:15PM +0800, Nicolas Boichat wrote:
> > If rpmsg_register_device fails, it will call
> > mtk_rpmsg_release_device which already frees mdev.
> >
> > Fixes: 7017996951fde84 ("rpmsg: add rpmsg support for mt8183 SCP.")
>
> The SHA should be 12 characters instead of 15.  With that:

Done in v3, thanks (and fixed my process for next time).

> Reviewed-by: Mathieu Poirier <mathieu.poirier@linaro.org>
>
> > Signed-off-by: Nicolas Boichat <drinkcat@chromium.org>
> > ---
> >
> > Changes in v2:
> >  - Drop useless if and ret variable (Markus Elfring)
> >
> >  drivers/rpmsg/mtk_rpmsg.c | 9 +--------
> >  1 file changed, 1 insertion(+), 8 deletions(-)
> >
> > diff --git a/drivers/rpmsg/mtk_rpmsg.c b/drivers/rpmsg/mtk_rpmsg.c
> > index 83f2b8804ee989d..96a17ec2914011d 100644
> > --- a/drivers/rpmsg/mtk_rpmsg.c
> > +++ b/drivers/rpmsg/mtk_rpmsg.c
> > @@ -200,7 +200,6 @@ static int mtk_rpmsg_register_device(struct mtk_rpmsg_rproc_subdev *mtk_subdev,
> >       struct rpmsg_device *rpdev;
> >       struct mtk_rpmsg_device *mdev;
> >       struct platform_device *pdev = mtk_subdev->pdev;
> > -     int ret;
> >
> >       mdev = kzalloc(sizeof(*mdev), GFP_KERNEL);
> >       if (!mdev)
> > @@ -219,13 +218,7 @@ static int mtk_rpmsg_register_device(struct mtk_rpmsg_rproc_subdev *mtk_subdev,
> >       rpdev->dev.parent = &pdev->dev;
> >       rpdev->dev.release = mtk_rpmsg_release_device;
> >
> > -     ret = rpmsg_register_device(rpdev);
> > -     if (ret) {
> > -             kfree(mdev);
> > -             return ret;
> > -     }
> > -
> > -     return 0;
> > +     return rpmsg_register_device(rpdev);
> >  }
> >
> >  static void mtk_register_device_work_function(struct work_struct *register_work)
> > --
> > 2.28.0.402.g5ffc5be6b7-goog
> >

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
