Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0AACC433EF
	for <linux-mediatek@archiver.kernel.org>; Tue, 29 Mar 2022 15:09:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nABIzCmIRRRUSmKLaP8o/IBIlW0ksZgkOQ+jqbtQ91g=; b=wVHGJedma9vrli
	4jwleZFMu9OvNCl4d7e3qAbSk2m0XxLTBmUoxGzFaXs0hkqlPrRd7ML+B7eGWPBMP1pL1O3oR4z6a
	mifscMR1kYgCAQerpGmGrK6gr+wh+EDCINayaBtsJK+ABdnsZ9Hom4LOlzxHjPGvhUe6qEiwoDKEy
	6WQThA9X9XRaz+u9TDBaOud9utPU0lSFyQEk9kNrRsZIQ02qGlBrd/Qt9BASI73gj+9k9MK+0BPgd
	Xfv5oAqof+ucjzYMhj3IUhoKZr7LXVXJXr1VduuLRsyPumi44tHCd0aiIQVCLzaI67uRLl51efCbE
	fOWo9i6uzEPM/5jQIbhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nZDTV-00CahZ-4q; Tue, 29 Mar 2022 15:09:37 +0000
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nZDSl-00CaGD-As
 for linux-mediatek@lists.infradead.org; Tue, 29 Mar 2022 15:08:57 +0000
Received: by mail-pf1-x42b.google.com with SMTP id b13so14274813pfv.0
 for <linux-mediatek@lists.infradead.org>; Tue, 29 Mar 2022 08:08:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=IYBiB3u6pgGszqmXJWRnNvzAS97qt4GQexZ8YkymLeQ=;
 b=OLc41CD7VhQmZwLRan5dplB/3HewcV8wG9FMkJl9THtcfjL5vmGIH9A10/FnRAcO8p
 wUNQzWzyVkVZuAQxE8HN6wk4m8kjAp2SKXxYWX0RDsRVk0M17mVSRAT3ycydsxcmO4EX
 lw4t5dtBGymqukkwUr3e6/hsteX1dd8zYl7Hlh/oeatvwO7v0DkQ016ouZUun8p71MfH
 zZfcNX1u8XQcwUJ2s42t1ZT0N45/Hy/ugOeacurwfgEKGftLLAwrod2cOGYKSTL1fTgY
 phPy0mFeLVDSCL76CG4eKPkqCvsLyGBMH0kNgHC5i1ybHjHFhNDh3mzh9ixAemSwuSOP
 gBkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=IYBiB3u6pgGszqmXJWRnNvzAS97qt4GQexZ8YkymLeQ=;
 b=YiWhBQ5IDJx3dnRiZdD8Q2ui9QD7heZRHsDKdnPKW9witlwS5z1/yaYq+5QDy4Enw8
 jcUYP+cqrNUmxr8pOqyhHe3RJwdpiiNcoWEHh7sjfmanfxb97/WWIhBwcf63qw7I5fQq
 XZANTsJqJJgDNWAjlsBKUwASfOh/TvN8vsFBOfd9HKsGbCVvAlNL6vBhoZTKzWSE5yM9
 Qlx4Y955RXCPR1xeaRftajg0S/re/miZvXWpqfZ6WUd6Ur9ff5frbJSyWhxrFePnIq8f
 mGrgM3YLDRz2F7fNh7arVS+VugQ303rYsztuTxVLZ7ZKIrHuDU0Ly7/vCerQbWhiw/wm
 7cRg==
X-Gm-Message-State: AOAM531CwC0tp3QMsOBCN+ItbMDRnnVKPNVqNRo/fiUoVvhPttmLcpKp
 MAQzet9ikq1yaDDVtfy1IvLtNA==
X-Google-Smtp-Source: ABdhPJwMfMVbzAiD5UdmKQNww9aqdfrUiLy4V5t1ofj/8Dmu3KkG2VH7U7xVD64jJtvC3qlGk5i6ag==
X-Received: by 2002:a05:6a02:283:b0:342:703e:1434 with SMTP id
 bk3-20020a056a02028300b00342703e1434mr2336093pgb.74.1648566530096; 
 Tue, 29 Mar 2022 08:08:50 -0700 (PDT)
Received: from p14s (S0106889e681aac74.cg.shawcable.net. [68.147.0.187])
 by smtp.gmail.com with ESMTPSA id
 l10-20020a056a00140a00b004c55d0dcbd1sm20516065pfu.120.2022.03.29.08.08.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Mar 2022 08:08:48 -0700 (PDT)
Date: Tue, 29 Mar 2022 09:08:46 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: bjorn.andersson@linaro.org, matthias.bgg@gmail.com, pihsun@chromium.org,
 linux-remoteproc@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 kernel@collabora.com
Subject: Re: [PATCH] rpmsg: mtk_rpmsg: Fix circular locking dependency
Message-ID: <20220329150846.GA3767550@p14s>
References: <20220114144737.375621-1-angelogioacchino.delregno@collabora.com>
 <20220217190349.GA477215@p14s>
 <ad306275-cd38-e6ad-55cc-0f7c4bdfcecf@collabora.com>
 <20220218180111.GA574087@p14s>
 <ea0f7cdd-0fae-fb66-3171-f0870384e6aa@collabora.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ea0f7cdd-0fae-fb66-3171-f0870384e6aa@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220329_080851_441878_AD29EEB8 
X-CRM114-Status: GOOD (  50.82  )
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

On Tue, Mar 29, 2022 at 12:55:33PM +0200, AngeloGioacchino Del Regno wrote:
> Il 18/02/22 19:01, Mathieu Poirier ha scritto:
> > On Fri, Feb 18, 2022 at 10:16:51AM +0100, AngeloGioacchino Del Regno wrote:
> > > Il 17/02/22 20:03, Mathieu Poirier ha scritto:
> > > > Hi Angelo,
> > > > 
> > > > On Fri, Jan 14, 2022 at 03:47:37PM +0100, AngeloGioacchino Del Regno wrote:
> > > > > During execution of the worker that's used to register rpmsg devices
> > > > > we are safely locking the channels mutex but, when creating a new
> > > > > endpoint for such devices, we are registering a IPI on the SCP, which
> > > > > then makes the SCP to trigger an interrupt, lock its own mutex and in
> > > > > turn register more subdevices.
> > > > > This creates a circular locking dependency situation, as the mtk_rpmsg
> > > > > channels_lock will then depend on the SCP IPI lock.
> > > > > 
> > > > > [   18.014514]  Possible unsafe locking scenario:
> > > > > [   18.014515]        CPU0                    CPU1
> > > > > [   18.014517]        ----                    ----
> > > > > [   18.045467]   lock(&mtk_subdev->channels_lock);
> > > > > [   18.045474]                                lock(&scp->ipi_desc[i].lock);
> > > > 
> > > > I spent well over an hour tracing through the meanders of the code to end up in
> > > > scp_ipi_register() which, I think, leads to the above.  But from there I don't
> > > > see how an IPI can come in and that tells me my assumption is wrong.
> > > > 
> > > > Can you give more details on the events that lead to the above?  I'm not saying
> > > > there is no problem, I just need to understand it.
> > > > 
> > > 
> > > Hi Mathieu,
> > > 
> > > I understand that following this flow without the assistance of the actual
> > > hardware may be a little confusing, so, no worries.
> > > 
> > > drivers/remoteproc/mtk_scp.c - this driver manages the SCP (obviously, a
> > > remote processor)
> > > drivers/remoteproc/mtk_scp_ipi.c - public functions for kernel SCP IPC
> > > 
> > > Flow:
> > > - MediaTek SCP gets probed
> > > - RPMSG starts, we start probing "something", like google,cros-ec-rpmsg
> > > - mtk_rpmsg: creates endpoint; IPI handler is registered here.
> > > 
> > >           ( more flow )
> > > 
> > > - mtk_rpmsg: mtk_rpmsg_ns_cb() -> mtk_rpmsg_create_device(), channel is
> > >               added to the channels list, worker gets scheduled
> > 
> > To me the above is out of order.  The name space endpoint is registered as part
> > of the remote processor start sequence.  From there an IPI with ns_ipi_id comes in
> > and then cros_ec_rpmsg_probe() is called.  The above seems to imply the
> > opposite.
> > 
> > > 
> > > 
> > > Now for the part that produces the real issue:
> > > 
> > > label_a:
> > > 
> > > *** RPMSG MUTEX LOCK ***
> > 
> > By this I take you mean the subdev->channels_lock mutex.
> > 
> > > - mtk_rpmsg: ## Go through multiple channels ##, call mtk_rpmsg_register_device()
> > > 
> > > - Registered device tries to communicate through RPMSG
> > > - .send() or .trysend() (depending on the device) is called: send_ipi()
> > >      *** SCP MUTEX LOCK ***
> > 
> > And this one is either scp->send_lock or scp->ipi_desc[i].lock.
> > 
> > >     - mtk_scp_ipi: Data written, ACK? ok -> return 0
> > >      *** SCP MUTEX UNLOCK ***
> > > 
> > > - mtk_scp_ipi: **** INTERRUPT!!! **** New RPMSG NS available? -> create channel
> > >            goto label_a;
> > > 
> > > *** RPMSG MUTEX UNLOCK ***
> > > 
> > > 
> > > Pardon me for keeping some things in this flow implicit, but that was done to
> > > simplify it as much as possible as to try to make you understand the situation.
> > 
> > I certainly appreciate the effort but the above does not provide me with a clear
> > path that causes the lock to happen.  As I said in my last reply I don't doubt
> > there is a lock contention but the provided information doesn't allow to
> > understand how it happens.
> > 
> > All I am looking for is one scenario with all mutexes and functions calls
> > involved.
> > 
> 
> Hello Mathieu,
> I'm sorry for leaving this unresolved for a long time, had to work on other
> things in the meanwhile.
>

I also had to move on and as such details related to this patch have mostly
vanished from my memory.

> I'm not sure what you need, can you please help me to give you the
> issue background that you require?
> 
> In the meanwhile, here's full debugging info coming from the kmsg:
> 
> https://paste.debian.net/1235967/

I will review this pastebin along with the explanation you had provided earlier
in this thread - maybe I'll get it this time... But that will take some time as
I have 5 other patchsets to review before looking at this again.

> 
> Thanks,
> Angelo
> 
> > Thanks,
> > Mathieu
> > 
> > > 
> > > Cheers,
> > > Angelo
> > > 
> > > > Thanks,
> > > > Mathieu
> > > > 
> > > > > [   18.228399]                                lock(&mtk_subdev->channels_lock);
> > > > > [   18.228405]   lock(&scp->ipi_desc[i].lock);
> > > > > [   18.264405]
> > > > > 
> > > > > To solve this, simply unlock the channels_lock mutex before calling
> > > > > mtk_rpmsg_register_device() and relock it right after, as safety is
> > > > > still ensured by the locking mechanism that happens right after
> > > > > through SCP.
> > > > > Notably, mtk_rpmsg_register_device() does not even require locking.
> > > > > 
> > > > > Fixes: 7017996951fd ("rpmsg: add rpmsg support for mt8183 SCP.")
> > > > > Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> > > > > ---
> > > > >    drivers/rpmsg/mtk_rpmsg.c | 2 ++
> > > > >    1 file changed, 2 insertions(+)
> > > > > 
> > > > > diff --git a/drivers/rpmsg/mtk_rpmsg.c b/drivers/rpmsg/mtk_rpmsg.c
> > > > > index 5b4404b8be4c..d1213c33da20 100644
> > > > > --- a/drivers/rpmsg/mtk_rpmsg.c
> > > > > +++ b/drivers/rpmsg/mtk_rpmsg.c
> > > > > @@ -234,7 +234,9 @@ static void mtk_register_device_work_function(struct work_struct *register_work)
> > > > >    		if (info->registered)
> > > > >    			continue;
> > > > > +		mutex_unlock(&subdev->channels_lock);
> > > > >    		ret = mtk_rpmsg_register_device(subdev, &info->info);
> > > > > +		mutex_lock(&subdev->channels_lock);
> > > > >    		if (ret) {
> > > > >    			dev_err(&pdev->dev, "Can't create rpmsg_device\n");
> > > > >    			continue;
> > > > > -- 
> > > > > 2.33.1
> > > > > 
> > > 
> > > 
> > > 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
