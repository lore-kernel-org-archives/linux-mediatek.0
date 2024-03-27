Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F0BCC47DD9
	for <linux-mediatek@archiver.kernel.org>; Wed, 27 Mar 2024 17:58:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yWR/88ZuStiYrDMS5UWD0VLDt0J6Sqyii5LmdWwCGKc=; b=hkS2/eKUWiq2y4BuvVefzRkIyE
	eU9KO0c2mSIqccw7IaY7rryj+l7GifFrAUxwqYuYnXyXF3Gv9VNK6tKR17Lm9hVQ+wsoyoTpIZp4I
	HPB+Qb5WDPRsQeEmoICJj4uaff+wOn9bsqrCgHdYFUiBpGtJbwTBqnkjZsUoXffK9RuJi8iATggj2
	8BWRA4DYInz8PSvymLdtOPEOSQAE+GhbnG3/d7FEGgon7EZIIcrsecfv4gRfiimpdnfLdTPB2XzqO
	T4f1V8NzzxDBZkmrna3PTjfK8wpYVNxEGk2wt/+wmqyhunTWDNbHCcjkQBCoPqw3qv3W1kaIkSdre
	KFBFwXzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rpXXs-0000000AQXN-0aGJ;
	Wed, 27 Mar 2024 17:58:40 +0000
Received: from mail-oi1-x234.google.com ([2607:f8b0:4864:20::234])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rpXXl-0000000AQR5-0HiB;
	Wed, 27 Mar 2024 17:58:36 +0000
Received: by mail-oi1-x234.google.com with SMTP id 5614622812f47-3c3ae53f662so70676b6e.3;
        Wed, 27 Mar 2024 10:58:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1711562306; x=1712167106; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:reply-to
         :message-id:subject:cc:to:from:date:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yWR/88ZuStiYrDMS5UWD0VLDt0J6Sqyii5LmdWwCGKc=;
        b=IaKuJiGwCQkFc+VR2sNowkHrXAqJnaSOUnTrExTzlt+/fpRknR6bSmbTBWiB6sR81F
         6YqZOF5kX6JzGmAn0bJBOz+rSSaJI+FzagxOI5oUZsL7GHYR5S1BsDfVLTTCyn68WxQi
         a6oZ9kA5lvMFngosGyWVya9dvB3C3jx9GtD56Njf62o2ugwGQnZoc0gm3bsi8L5O1Eyv
         Z6Imu7LiJ98XOvwCf7nhjS11v6p3zdQUjHpRlnfJTYttJx+SKXR7GzMQqZGwjCLG7+aU
         WNrMmXqc/6zUT2nd14Xx+nMTbiZWdmYqlRIYdizGZKbZTITndJs6sxm6q9vJR0aj42IP
         rsHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711562306; x=1712167106;
        h=in-reply-to:content-disposition:mime-version:references:reply-to
         :message-id:subject:cc:to:from:date:sender:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=yWR/88ZuStiYrDMS5UWD0VLDt0J6Sqyii5LmdWwCGKc=;
        b=i6tRD+7CfKiM7iGC/3elgy4cPy2oI+FzO/xJG7wPOTtW/euO6FRNYqLqsjxDuUm5y1
         KRqex4T9bIC5+1e3gD4T/DIK1Abs//KE9Qze4I3lnrPRp5FqYb3MCl6L8TjWW8BYF+U6
         A1ka7QGQsobyIxeYl13dipuySFRcK954lba3SyOv3VXWtQvzLHUOklw0PB1UbXQ5tHFA
         atYvuPgYAp+L0YG3msIv+nkymO4Ln09tviBW5JK+as8ARp8Ifrd4MfoKPv9UI07dPPvb
         2CQYlCch9aT8raCZDKW5VxiPghzX88rJ7ve6sGXKSu5ZMkN0+lJxOxT+gy0b5uobDtBa
         dZXg==
X-Forwarded-Encrypted: i=1; AJvYcCUvXz9EjoOdj7zENkzJ1p5+/rSzcjCCrQhrGENxTkDIQ0P7IGN6kpICCeFn80Om/R+GGOTOYUNfabQvMvo9OtPfFjI1H4T4OVI2WDRzkooWZBCDMXGWhloR3bD3ckv3lqOX6fEY4/Ie1MsyjTTLf54mLyrW1SXDTSNvDYx6ct8jMdVdwrtmPtYN1oEwjVIPeKPOTnNRDNBMxDC0Bl0kYxyduppgEJupxFR4DDlVYi2cBPOE7tKBa2hQwDwJYOAnVJEyMeLuWH+uvh8LaSXKMgCzmTI3l65ZuKSO/TYz8U8VnM/g
X-Gm-Message-State: AOJu0YxQHLtD/FKZd/lZBX4Bhhxhf+oOUnxV/lo6UCiMi80q0zWMlxo5
	BhC5+pnJOYol5z4mhlqYWPYdXLoOONZRV/+pXqvcrlpI7Bc6m78=
X-Google-Smtp-Source: AGHT+IGIuqcpUfq3tRIl3Tp+ivSdarRw1h1Pz+NBzSyS6B+Wv1klEWD1UlLYSK6t5b6FwD/aGF7AqA==
X-Received: by 2002:a05:6808:16a8:b0:3c3:7e7a:8236 with SMTP id bb40-20020a05680816a800b003c37e7a8236mr846136oib.18.1711562306195;
        Wed, 27 Mar 2024 10:58:26 -0700 (PDT)
Received: from serve.minyard.net ([47.184.181.2])
        by smtp.gmail.com with ESMTPSA id bl16-20020a056808309000b003c3ca856452sm1579224oib.55.2024.03.27.10.58.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Mar 2024 10:58:25 -0700 (PDT)
Received: from mail.minyard.net (unknown [IPv6:2001:470:b8f6:1b:ac74:4d5d:21e4:a88a])
	by serve.minyard.net (Postfix) with ESMTPSA id 6CA7D1800B9;
	Wed, 27 Mar 2024 17:58:24 +0000 (UTC)
Date: Wed, 27 Mar 2024 12:58:23 -0500
From: Corey Minyard <minyard@acm.org>
To: Allen Pais <apais@linux.microsoft.com>
Cc: linux-kernel@vger.kernel.org, tj@kernel.org, keescook@chromium.org,
	vkoul@kernel.org, marcan@marcan.st, sven@svenpeter.dev,
	florian.fainelli@broadcom.com, rjui@broadcom.com,
	sbranden@broadcom.com, paul@crapouillou.net,
	Eugeniy.Paltsev@synopsys.com, manivannan.sadhasivam@linaro.org,
	vireshk@kernel.org, Frank.Li@nxp.com, leoyang.li@nxp.com,
	zw@zh-kernel.org, wangzhou1@hisilicon.com, haijie1@huawei.com,
	shawnguo@kernel.org, s.hauer@pengutronix.de, sean.wang@mediatek.com,
	matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com,
	afaerber@suse.de, logang@deltatee.com, daniel@zonque.org,
	haojian.zhuang@gmail.com, robert.jarzmik@free.fr,
	andersson@kernel.org, konrad.dybcio@linaro.org, orsonzhai@gmail.com,
	baolin.wang@linux.alibaba.com, zhang.lyra@gmail.com,
	patrice.chotard@foss.st.com, linus.walleij@linaro.org,
	wens@csie.org, jernej.skrabec@gmail.com, peter.ujfalusi@gmail.com,
	kys@microsoft.com, haiyangz@microsoft.com, wei.liu@kernel.org,
	decui@microsoft.com, jassisinghbrar@gmail.com, mchehab@kernel.org,
	maintainers@bluecherrydvr.com, aubin.constans@microchip.com,
	ulf.hansson@linaro.org, manuel.lauss@gmail.com,
	mirq-linux@rere.qmqm.pl, jh80.chung@samsung.com, oakad@yahoo.com,
	hayashi.kunihiko@socionext.com, mhiramat@kernel.org,
	brucechang@via.com.tw, HaraldWelte@viatech.com, pierre@ossman.eu,
	duncan.sands@free.fr, stern@rowland.harvard.edu, oneukum@suse.com,
	openipmi-developer@lists.sourceforge.net, dmaengine@vger.kernel.org,
	asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-rpi-kernel@lists.infradead.org, linux-mips@vger.kernel.org,
	imx@lists.linux.dev, linuxppc-dev@lists.ozlabs.org,
	linux-mediatek@lists.infradead.org,
	linux-actions@lists.infradead.org, linux-arm-msm@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-sunxi@lists.linux.dev,
	linux-tegra@vger.kernel.org, linux-hyperv@vger.kernel.org,
	linux-rdma@vger.kernel.org, linux-media@vger.kernel.org,
	linux-mmc@vger.kernel.org, linux-omap@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org, linux-s390@vger.kernel.org,
	netdev@vger.kernel.org, linux-usb@vger.kernel.org
Subject: Re: [PATCH 6/9] ipmi: Convert from tasklet to BH workqueue
Message-ID: <ZgRePyo2zC4A1Fp4@mail.minyard.net>
References: <20240327160314.9982-1-apais@linux.microsoft.com>
 <20240327160314.9982-7-apais@linux.microsoft.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240327160314.9982-7-apais@linux.microsoft.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240327_105833_170022_2CDDDDF2 
X-CRM114-Status: GOOD (  28.68  )
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
Reply-To: minyard@acm.org
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Wed, Mar 27, 2024 at 04:03:11PM +0000, Allen Pais wrote:
> The only generic interface to execute asynchronously in the BH context is
> tasklet; however, it's marked deprecated and has some design flaws. To
> replace tasklets, BH workqueue support was recently added. A BH workqueue
> behaves similarly to regular workqueues except that the queued work items
> are executed in the BH context.
> 
> This patch converts drivers/infiniband/* from tasklet to BH workqueue.

I think you mean drivers/char/ipmi/* here.

I believe that work queues items are execute single-threaded for a work
queue, so this should be good.  I need to test this, though.  It may be
that an IPMI device can have its own work queue; it may not be important
to run it in bh context.

-corey

> 
> Based on the work done by Tejun Heo <tj@kernel.org>
> Branch: https://git.kernel.org/pub/scm/linux/kernel/git/tj/wq.git for-6.10
> 
> Signed-off-by: Allen Pais <allen.lkml@gmail.com>
> ---
>  drivers/char/ipmi/ipmi_msghandler.c | 30 ++++++++++++++---------------
>  1 file changed, 15 insertions(+), 15 deletions(-)
> 
> diff --git a/drivers/char/ipmi/ipmi_msghandler.c b/drivers/char/ipmi/ipmi_msghandler.c
> index b0eedc4595b3..fce2a2dbdc82 100644
> --- a/drivers/char/ipmi/ipmi_msghandler.c
> +++ b/drivers/char/ipmi/ipmi_msghandler.c
> @@ -36,12 +36,13 @@
>  #include <linux/nospec.h>
>  #include <linux/vmalloc.h>
>  #include <linux/delay.h>
> +#include <linux/workqueue.h>
>  
>  #define IPMI_DRIVER_VERSION "39.2"
>  
>  static struct ipmi_recv_msg *ipmi_alloc_recv_msg(void);
>  static int ipmi_init_msghandler(void);
> -static void smi_recv_tasklet(struct tasklet_struct *t);
> +static void smi_recv_work(struct work_struct *t);
>  static void handle_new_recv_msgs(struct ipmi_smi *intf);
>  static void need_waiter(struct ipmi_smi *intf);
>  static int handle_one_recv_msg(struct ipmi_smi *intf,
> @@ -498,13 +499,13 @@ struct ipmi_smi {
>  	/*
>  	 * Messages queued for delivery.  If delivery fails (out of memory
>  	 * for instance), They will stay in here to be processed later in a
> -	 * periodic timer interrupt.  The tasklet is for handling received
> +	 * periodic timer interrupt.  The work is for handling received
>  	 * messages directly from the handler.
>  	 */
>  	spinlock_t       waiting_rcv_msgs_lock;
>  	struct list_head waiting_rcv_msgs;
>  	atomic_t	 watchdog_pretimeouts_to_deliver;
> -	struct tasklet_struct recv_tasklet;
> +	struct work_struct recv_work;
>  
>  	spinlock_t             xmit_msgs_lock;
>  	struct list_head       xmit_msgs;
> @@ -704,7 +705,7 @@ static void clean_up_interface_data(struct ipmi_smi *intf)
>  	struct cmd_rcvr  *rcvr, *rcvr2;
>  	struct list_head list;
>  
> -	tasklet_kill(&intf->recv_tasklet);
> +	cancel_work_sync(&intf->recv_work);
>  
>  	free_smi_msg_list(&intf->waiting_rcv_msgs);
>  	free_recv_msg_list(&intf->waiting_events);
> @@ -1319,7 +1320,7 @@ static void free_user(struct kref *ref)
>  {
>  	struct ipmi_user *user = container_of(ref, struct ipmi_user, refcount);
>  
> -	/* SRCU cleanup must happen in task context. */
> +	/* SRCU cleanup must happen in work context. */
>  	queue_work(remove_work_wq, &user->remove_work);
>  }
>  
> @@ -3605,8 +3606,7 @@ int ipmi_add_smi(struct module         *owner,
>  	intf->curr_seq = 0;
>  	spin_lock_init(&intf->waiting_rcv_msgs_lock);
>  	INIT_LIST_HEAD(&intf->waiting_rcv_msgs);
> -	tasklet_setup(&intf->recv_tasklet,
> -		     smi_recv_tasklet);
> +	INIT_WORK(&intf->recv_work, smi_recv_work);
>  	atomic_set(&intf->watchdog_pretimeouts_to_deliver, 0);
>  	spin_lock_init(&intf->xmit_msgs_lock);
>  	INIT_LIST_HEAD(&intf->xmit_msgs);
> @@ -4779,7 +4779,7 @@ static void handle_new_recv_msgs(struct ipmi_smi *intf)
>  			 * To preserve message order, quit if we
>  			 * can't handle a message.  Add the message
>  			 * back at the head, this is safe because this
> -			 * tasklet is the only thing that pulls the
> +			 * work is the only thing that pulls the
>  			 * messages.
>  			 */
>  			list_add(&smi_msg->link, &intf->waiting_rcv_msgs);
> @@ -4812,10 +4812,10 @@ static void handle_new_recv_msgs(struct ipmi_smi *intf)
>  	}
>  }
>  
> -static void smi_recv_tasklet(struct tasklet_struct *t)
> +static void smi_recv_work(struct work_struct *t)
>  {
>  	unsigned long flags = 0; /* keep us warning-free. */
> -	struct ipmi_smi *intf = from_tasklet(intf, t, recv_tasklet);
> +	struct ipmi_smi *intf = from_work(intf, t, recv_work);
>  	int run_to_completion = intf->run_to_completion;
>  	struct ipmi_smi_msg *newmsg = NULL;
>  
> @@ -4866,7 +4866,7 @@ void ipmi_smi_msg_received(struct ipmi_smi *intf,
>  
>  	/*
>  	 * To preserve message order, we keep a queue and deliver from
> -	 * a tasklet.
> +	 * a work.
>  	 */
>  	if (!run_to_completion)
>  		spin_lock_irqsave(&intf->waiting_rcv_msgs_lock, flags);
> @@ -4887,9 +4887,9 @@ void ipmi_smi_msg_received(struct ipmi_smi *intf,
>  		spin_unlock_irqrestore(&intf->xmit_msgs_lock, flags);
>  
>  	if (run_to_completion)
> -		smi_recv_tasklet(&intf->recv_tasklet);
> +		smi_recv_work(&intf->recv_work);
>  	else
> -		tasklet_schedule(&intf->recv_tasklet);
> +		queue_work(system_bh_wq, &intf->recv_work);
>  }
>  EXPORT_SYMBOL(ipmi_smi_msg_received);
>  
> @@ -4899,7 +4899,7 @@ void ipmi_smi_watchdog_pretimeout(struct ipmi_smi *intf)
>  		return;
>  
>  	atomic_set(&intf->watchdog_pretimeouts_to_deliver, 1);
> -	tasklet_schedule(&intf->recv_tasklet);
> +	queue_work(system_bh_wq, &intf->recv_work);
>  }
>  EXPORT_SYMBOL(ipmi_smi_watchdog_pretimeout);
>  
> @@ -5068,7 +5068,7 @@ static bool ipmi_timeout_handler(struct ipmi_smi *intf,
>  				       flags);
>  	}
>  
> -	tasklet_schedule(&intf->recv_tasklet);
> +	queue_work(system_bh_wq, &intf->recv_work);
>  
>  	return need_timer;
>  }
> -- 
> 2.17.1
> 
> 

