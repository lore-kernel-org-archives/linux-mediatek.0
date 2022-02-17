Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9279CC433EF
	for <linux-mediatek@archiver.kernel.org>; Thu, 17 Feb 2022 16:09:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/OD9Km+zboq5ODflFkzAYjRCo03rTU683FTbo5t9b30=; b=4ggC53qB8QaUrB
	7+ha5To3PABq5HyHet4n5ZUHlS6WBz39zbV3dUUqvwjitGqU26M9FtVPBx7i7laV7NLiWIzfM6doA
	4I5FK1ulkcEU5EY5L2dyXu42z5AuQAHDUEKh4SVVj25AyntOI42ap4z7d/T+Uvc+bS+4HrmEuO/QN
	v3WSwxUe/txXF3KyYpbLrl+2GP2xBN24Yfe1FgyxFvhoNuM0qF9H4jtkSG5su6/XNOLrMSE5SJrUw
	IetxL9I7VMEP+hyfNg7QuRtPw2fihQS3nmk1AcXlWvywzJeQGxtDcrM/dDdlwf+4y2YoKOYUkQLN+
	++uKM4kGVJlsD0PoJT7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nKjLB-00BO5Y-RA; Thu, 17 Feb 2022 16:09:09 +0000
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nKjKy-00BO1o-VT
 for linux-mediatek@lists.infradead.org; Thu, 17 Feb 2022 16:08:58 +0000
Received: by mail-pj1-x102c.google.com with SMTP id b8so6005461pjb.4
 for <linux-mediatek@lists.infradead.org>; Thu, 17 Feb 2022 08:08:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=VD8H9XEccLJ1gEJ8HFd5QAYd/aMwLkrTq6BJhjDSisU=;
 b=F2rnoQOUj5vrdaK05HWLiQ7Dayy2FS/VLwwppCjteGUtmVGphPSPL1yNlR/PsVhO4Q
 SGeRoVRv5Uus+p4dn8QbXAGf80LP4h24IJAa0YKQc/bBrJA2mgvX6k6S+QaZhSinsQPe
 o216cTDDHjXReLeUyM4oLkcXFtL1l/32drgLI8Q3Ol851JV0AFiUSkZYV96ZmH6yoaRz
 AKOTAqvSoj03fN1c6IOu25o9+GmlKYmh8Tz/z/Z1zg3CfaJqHt1e0AWkINesw/Pf2V0l
 g76JZRFDHXvhz1CCgn1/99do97O3lEyvZTQa1XyJAFrLSbwg3bv9oVKn+Ugr30Tfha1B
 919w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=VD8H9XEccLJ1gEJ8HFd5QAYd/aMwLkrTq6BJhjDSisU=;
 b=5BFq0jTze7c0S3+JVLcUZFFzPLAnCCpo5olTWznWMiMVGu4eNYRNC3KGyya1GeuAxb
 SWB6ZAy76bFytbuzv54lFME2aob72XbnIM5dqloiIYuuM7QzK18sYoZ9o4Q5dJecEq0S
 COyMet6NvRblFq98ugA9ISDdXMmW9mEzehFyE940PIzQL1CgWonyk+ppuZRVQ1UPILUL
 hfHg9wzrHAYBtyQQVpsrB6ECxW3nD5BRA0vPruqKBOg9Thv/Y3TpboEz2kGaCQHPiuzi
 GM+Bp6lUIw7r/sJudTt2TCsXXTVgSLw22+JOdLb6TpxgbZ5EuMYoBMdWEJXnkutxZDtI
 6RZg==
X-Gm-Message-State: AOAM533ewH43kukmmETzIicG7vFHVjhm0lhGhfgCpU4Zor6VFz1/ljXQ
 4QfLP822i9BH9HVTmKySNuKdWg==
X-Google-Smtp-Source: ABdhPJyFsjmnJxcyI3zQL+VFCRE3os2dZrHdxY5v38ChREUHcE+PvGbETp2COJG44FjB8IEmuf5tZQ==
X-Received: by 2002:a17:90a:4dc7:b0:1b9:ca2:311e with SMTP id
 r7-20020a17090a4dc700b001b90ca2311emr3717927pjl.175.1645114135171; 
 Thu, 17 Feb 2022 08:08:55 -0800 (PST)
Received: from p14s (S0106889e681aac74.cg.shawcable.net. [68.147.0.187])
 by smtp.gmail.com with ESMTPSA id h9sm51611pfv.135.2022.02.17.08.08.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Feb 2022 08:08:53 -0800 (PST)
Date: Thu, 17 Feb 2022 09:08:51 -0700
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: bjorn.andersson@linaro.org, matthias.bgg@gmail.com, pihsun@chromium.org,
 linux-remoteproc@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 kernel@collabora.com
Subject: Re: [PATCH] rpmsg: mtk_rpmsg: Fix circular locking dependency
Message-ID: <20220217160851.GA474184@p14s>
References: <20220114144737.375621-1-angelogioacchino.delregno@collabora.com>
 <b531eeca-40e8-d759-5579-59567eb5af84@collabora.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <b531eeca-40e8-d759-5579-59567eb5af84@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220217_080857_029934_9895F312 
X-CRM114-Status: GOOD (  22.48  )
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

On Wed, Feb 16, 2022 at 05:06:22PM +0100, AngeloGioacchino Del Regno wrote:
> Il 14/01/22 15:47, AngeloGioacchino Del Regno ha scritto:
> > During execution of the worker that's used to register rpmsg devices
> > we are safely locking the channels mutex but, when creating a new
> > endpoint for such devices, we are registering a IPI on the SCP, which
> > then makes the SCP to trigger an interrupt, lock its own mutex and in
> > turn register more subdevices.
> > This creates a circular locking dependency situation, as the mtk_rpmsg
> > channels_lock will then depend on the SCP IPI lock.
> > 
> > [   18.014514]  Possible unsafe locking scenario:
> > [   18.014515]        CPU0                    CPU1
> > [   18.014517]        ----                    ----
> > [   18.045467]   lock(&mtk_subdev->channels_lock);
> > [   18.045474]                                lock(&scp->ipi_desc[i].lock);
> > [   18.228399]                                lock(&mtk_subdev->channels_lock);
> > [   18.228405]   lock(&scp->ipi_desc[i].lock);
> > [   18.264405]
> > 
> > To solve this, simply unlock the channels_lock mutex before calling
> > mtk_rpmsg_register_device() and relock it right after, as safety is
> > still ensured by the locking mechanism that happens right after
> > through SCP.
> > Notably, mtk_rpmsg_register_device() does not even require locking.
> > 
> > Fixes: 7017996951fd ("rpmsg: add rpmsg support for mt8183 SCP.")
> > Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> 
> Friendly ping for an important fix... :)
>

This seems to have slipped through the cracks...  I will take a look later
today.

Thanks,
Mathieu

> > ---
> >   drivers/rpmsg/mtk_rpmsg.c | 2 ++
> >   1 file changed, 2 insertions(+)
> > 
> > diff --git a/drivers/rpmsg/mtk_rpmsg.c b/drivers/rpmsg/mtk_rpmsg.c
> > index 5b4404b8be4c..d1213c33da20 100644
> > --- a/drivers/rpmsg/mtk_rpmsg.c
> > +++ b/drivers/rpmsg/mtk_rpmsg.c
> > @@ -234,7 +234,9 @@ static void mtk_register_device_work_function(struct work_struct *register_work)
> >   		if (info->registered)
> >   			continue;
> > +		mutex_unlock(&subdev->channels_lock);
> >   		ret = mtk_rpmsg_register_device(subdev, &info->info);
> > +		mutex_lock(&subdev->channels_lock);
> >   		if (ret) {
> >   			dev_err(&pdev->dev, "Can't create rpmsg_device\n");
> >   			continue;
> 
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
