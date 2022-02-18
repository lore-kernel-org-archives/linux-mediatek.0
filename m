Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2BBE5C433EF
	for <linux-mediatek@archiver.kernel.org>; Fri, 18 Feb 2022 18:01:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ihuto7B8VQQ1V9/0H/Yg3rNMyxhPVjTXy3tIa1ZmbkA=; b=xPyFsFAEZXfakO
	rA9+BQkaR0MzZT4VPZAyVQTq58Pk6mERcI82AO1lr3flCNQhUXj6HeZ9TkVM4HR+hIYet/t5+RDxV
	8QdYx0XWOMKEcX9qlo+bbMBfOT9B9DG1waygFWOUODRh74CKObNGCN6TmozRyAcElLKLLubpR6LWJ
	oGTzVTQv+O0L9Ga299cKTvMBVjDiPlnsn9jHFXSO9P0iI3C0MkrGilxzWm37abmFBUS9Qb5lVWXPC
	wRjzrfjpXjdSKVMG5+91pur02X6gzp7wpRdxxFkdJhyULb+1nwLZQQk7vP+GzGa7LjMDW58OIXG4o
	TENZ9eNY/vl4zPJcvp7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nL7ZR-00FRzf-Bs; Fri, 18 Feb 2022 18:01:29 +0000
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nL7ZF-00FRxr-5X
 for linux-mediatek@lists.infradead.org; Fri, 18 Feb 2022 18:01:18 +0000
Received: by mail-pl1-x636.google.com with SMTP id w1so7756858plb.6
 for <linux-mediatek@lists.infradead.org>; Fri, 18 Feb 2022 10:01:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=mYa/Ng+qxZsnILfjVR2nbtXNKAWIjZlbnZSGa5MiPd4=;
 b=ndBjwBE+GGl0MW4CnH/U147wgIPsvkGTaQsLqVl3hpG0VdKEatFGB8JRSBHsgUbg1X
 Ljkf9oYEkXopX70XO3QkRaiYqau3s87IfPtT6pTO6L7Q/aj7fw0uh0T+VMXbrNphalh7
 AF7eozoEleavm8u2vEQLkh0Q+US3gJx7BKMkoa9AQ3gGQoEqbammRv7THGP8viXbSsWP
 79CXBjjNJIvxcRTm2wi5gLxfStrvVEXtc2jMPnV8MZrN74cRh8rxWtR+HKwrIiVHsd37
 UpckS5J9XxmOxYHJe6zn+C1/xUPLr2lEAKOwRsVAPiVC6BtDsu+yQDsaK5oWV35djSzY
 6zBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=mYa/Ng+qxZsnILfjVR2nbtXNKAWIjZlbnZSGa5MiPd4=;
 b=7CfxAWcT+Bmq93QIQ7J0q1KyWy0nBW00aXo2cf6OOd32A62gt+6NbMRmmuRBpXKZD+
 4CJk7dd/t+iX/87LmETt5jbIWkp8hymoRaGPD34/0x72j4D17J2rub8Wn5/5nzTiQVD1
 PR/97cldkiBDKewlGUWOhHY8iEPau996cyPsqJtMS6k0IdkKV/sGMZOuf58AxULMKPm4
 ReYYLF1154ZK5SFzZkwKSKzmHH+bPEyYmLu9om6hYr8Dxrbm0LYHkexqkX/OpVp5+PF1
 WhDRt1hwFbvawkNRvWuvU7mxovvYWq1K1ZYBWAiqZ3zqX3zI30bQvtU0nzh2Szo5hfog
 ZGFw==
X-Gm-Message-State: AOAM531m15wLlWOTQsM+Yq56qA1F/ZVj/T4aefO56DqKYucVLMaJjuNY
 3qqtbdiR7E7s9nFEbdssQRWntw==
X-Google-Smtp-Source: ABdhPJwxNL2qp5uVuAl20iyQqNEJlD2O13uPwdNpOREkSCOi9pQv/gyMNJhyp0jyK447LPmdbBC0nA==
X-Received: by 2002:a17:902:7c84:b0:14d:66b5:8233 with SMTP id
 y4-20020a1709027c8400b0014d66b58233mr8348857pll.3.1645207275508; 
 Fri, 18 Feb 2022 10:01:15 -0800 (PST)
Received: from p14s (S0106889e681aac74.cg.shawcable.net. [68.147.0.187])
 by smtp.gmail.com with ESMTPSA id b1sm11292534pgb.66.2022.02.18.10.01.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Feb 2022 10:01:13 -0800 (PST)
Date: Fri, 18 Feb 2022 11:01:11 -0700
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: bjorn.andersson@linaro.org, matthias.bgg@gmail.com, pihsun@chromium.org,
 linux-remoteproc@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 kernel@collabora.com
Subject: Re: [PATCH] rpmsg: mtk_rpmsg: Fix circular locking dependency
Message-ID: <20220218180111.GA574087@p14s>
References: <20220114144737.375621-1-angelogioacchino.delregno@collabora.com>
 <20220217190349.GA477215@p14s>
 <ad306275-cd38-e6ad-55cc-0f7c4bdfcecf@collabora.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ad306275-cd38-e6ad-55cc-0f7c4bdfcecf@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220218_100117_296401_7E60D64E 
X-CRM114-Status: GOOD (  38.60  )
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

On Fri, Feb 18, 2022 at 10:16:51AM +0100, AngeloGioacchino Del Regno wrote:
> Il 17/02/22 20:03, Mathieu Poirier ha scritto:
> > Hi Angelo,
> > 
> > On Fri, Jan 14, 2022 at 03:47:37PM +0100, AngeloGioacchino Del Regno wrote:
> > > During execution of the worker that's used to register rpmsg devices
> > > we are safely locking the channels mutex but, when creating a new
> > > endpoint for such devices, we are registering a IPI on the SCP, which
> > > then makes the SCP to trigger an interrupt, lock its own mutex and in
> > > turn register more subdevices.
> > > This creates a circular locking dependency situation, as the mtk_rpmsg
> > > channels_lock will then depend on the SCP IPI lock.
> > > 
> > > [   18.014514]  Possible unsafe locking scenario:
> > > [   18.014515]        CPU0                    CPU1
> > > [   18.014517]        ----                    ----
> > > [   18.045467]   lock(&mtk_subdev->channels_lock);
> > > [   18.045474]                                lock(&scp->ipi_desc[i].lock);
> > 
> > I spent well over an hour tracing through the meanders of the code to end up in
> > scp_ipi_register() which, I think, leads to the above.  But from there I don't
> > see how an IPI can come in and that tells me my assumption is wrong.
> > 
> > Can you give more details on the events that lead to the above?  I'm not saying
> > there is no problem, I just need to understand it.
> > 
> 
> Hi Mathieu,
> 
> I understand that following this flow without the assistance of the actual
> hardware may be a little confusing, so, no worries.
> 
> drivers/remoteproc/mtk_scp.c - this driver manages the SCP (obviously, a
> remote processor)
> drivers/remoteproc/mtk_scp_ipi.c - public functions for kernel SCP IPC
> 
> Flow:
> - MediaTek SCP gets probed
> - RPMSG starts, we start probing "something", like google,cros-ec-rpmsg
> - mtk_rpmsg: creates endpoint; IPI handler is registered here.
> 
>          ( more flow )
> 
> - mtk_rpmsg: mtk_rpmsg_ns_cb() -> mtk_rpmsg_create_device(), channel is
>              added to the channels list, worker gets scheduled

To me the above is out of order.  The name space endpoint is registered as part
of the remote processor start sequence.  From there an IPI with ns_ipi_id comes in
and then cros_ec_rpmsg_probe() is called.  The above seems to imply the
opposite.

>
> 
> Now for the part that produces the real issue:
> 
> label_a:
> 
> *** RPMSG MUTEX LOCK ***

By this I take you mean the subdev->channels_lock mutex.

> - mtk_rpmsg: ## Go through multiple channels ##, call mtk_rpmsg_register_device()
> 
> - Registered device tries to communicate through RPMSG
> - .send() or .trysend() (depending on the device) is called: send_ipi()
>     *** SCP MUTEX LOCK ***

And this one is either scp->send_lock or scp->ipi_desc[i].lock.

>    - mtk_scp_ipi: Data written, ACK? ok -> return 0
>     *** SCP MUTEX UNLOCK ***
> 
> - mtk_scp_ipi: **** INTERRUPT!!! **** New RPMSG NS available? -> create channel
>           goto label_a;
> 
> *** RPMSG MUTEX UNLOCK ***
> 
> 
> Pardon me for keeping some things in this flow implicit, but that was done to
> simplify it as much as possible as to try to make you understand the situation.

I certainly appreciate the effort but the above does not provide me with a clear
path that causes the lock to happen.  As I said in my last reply I don't doubt
there is a lock contention but the provided information doesn't allow to
understand how it happens. 

All I am looking for is one scenario with all mutexes and functions calls
involved.

Thanks,
Mathieu

> 
> Cheers,
> Angelo
> 
> > Thanks,
> > Mathieu
> > 
> > > [   18.228399]                                lock(&mtk_subdev->channels_lock);
> > > [   18.228405]   lock(&scp->ipi_desc[i].lock);
> > > [   18.264405]
> > > 
> > > To solve this, simply unlock the channels_lock mutex before calling
> > > mtk_rpmsg_register_device() and relock it right after, as safety is
> > > still ensured by the locking mechanism that happens right after
> > > through SCP.
> > > Notably, mtk_rpmsg_register_device() does not even require locking.
> > > 
> > > Fixes: 7017996951fd ("rpmsg: add rpmsg support for mt8183 SCP.")
> > > Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> > > ---
> > >   drivers/rpmsg/mtk_rpmsg.c | 2 ++
> > >   1 file changed, 2 insertions(+)
> > > 
> > > diff --git a/drivers/rpmsg/mtk_rpmsg.c b/drivers/rpmsg/mtk_rpmsg.c
> > > index 5b4404b8be4c..d1213c33da20 100644
> > > --- a/drivers/rpmsg/mtk_rpmsg.c
> > > +++ b/drivers/rpmsg/mtk_rpmsg.c
> > > @@ -234,7 +234,9 @@ static void mtk_register_device_work_function(struct work_struct *register_work)
> > >   		if (info->registered)
> > >   			continue;
> > > +		mutex_unlock(&subdev->channels_lock);
> > >   		ret = mtk_rpmsg_register_device(subdev, &info->info);
> > > +		mutex_lock(&subdev->channels_lock);
> > >   		if (ret) {
> > >   			dev_err(&pdev->dev, "Can't create rpmsg_device\n");
> > >   			continue;
> > > -- 
> > > 2.33.1
> > > 
> 
> 
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
