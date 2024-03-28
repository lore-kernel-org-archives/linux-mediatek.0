Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F845CD11DF
	for <linux-mediatek@archiver.kernel.org>; Thu, 28 Mar 2024 19:23:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GyFGSwdDS+8X5fWOjo2s+K1AMkRQoOt7S254R+rI76g=; b=46mYbM4mYoUxya/L1y+cCKSAPD
	mJX4RbeCB71sGISSE+IhJ6Lqny5GFGHfbRocAACMtzRG82cWVb4E/GHkG/iHJXxNCe7TyNwlimFzC
	e7Os6mXkqLqxBufuQ76mESYgWWNSI0dt3BcQSUkTe3R9xWOrINBptoXYqW+YvnRBvWXpz8X8CiSb/
	9I6I1EIbxjPB1nQhIDG1MXr47P44EJ0EIl6JTtxfvIzPWqlEPksJUyQJ0ilH+PecVQ3lGft9Y5kaO
	DgK/DfuRxnmAwyybwQ0SwIs1LBD0XpgTV8Oa7ZZidM3kyyvNkp1QILbMP9hKXB61Cu5lfH/hH0zOc
	aBTaQGoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rpvLJ-0000000FMVk-33rR;
	Thu, 28 Mar 2024 19:23:17 +0000
Received: from mail-ot1-x336.google.com ([2607:f8b0:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rpvLF-0000000FMUi-0O0n;
	Thu, 28 Mar 2024 19:23:15 +0000
Received: by mail-ot1-x336.google.com with SMTP id 46e09a7af769-6e707210ab9so57441a34.2;
        Thu, 28 Mar 2024 12:23:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1711653790; x=1712258590; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:reply-to:message-id:subject:cc:to:from:date
         :sender:from:to:cc:subject:date:message-id:reply-to;
        bh=GyFGSwdDS+8X5fWOjo2s+K1AMkRQoOt7S254R+rI76g=;
        b=e9pVkHb/ttN6YKzxLWmnXcW1FKBONoeclefZMwrEm7PGQsgY/mj3YyTTbsMkw0WFYX
         +CyZYyXCfdl8ipPiolxD6DjVKeDjne+mR1UWKlG29hwQM2CRxjKWcOejXrrzhMhAtqZB
         +tmdORPo8G8Y0j6d74GLMaXKxXZW7wWmk8rnWLMq0BvIuycapuRlOMvHZUC+r8eo7YPs
         lS57QSrqxHP/CZqDTssHi1sxAhUqkTlPg5c+XkQDVXjo9Dy9Jnj4TstTKSkivVFiFgrW
         4CXEhiELuPcRnGZPRLN3wHkPQ5Livucs/YkNct0umuB0THkFgkSPe9syzRLdCoBu0KaD
         csHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711653790; x=1712258590;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:reply-to:message-id:subject:cc:to:from:date
         :sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GyFGSwdDS+8X5fWOjo2s+K1AMkRQoOt7S254R+rI76g=;
        b=KGkrxlSTa2IRIdFJ0lwsD5qO401Xe0IHERfxAi/0aiTVQhQT7P5u91p10gv7dKVXmG
         Iu2/5V9Sw9GuhHQ/wD89AJmH+pAjI2lwNws2VmpeDTq0FUcEY5uNHLNkqW71omObrIQk
         d690vRCS2cJcSU0v4RxodJoIj/lm/quqXMW8lR2dOFnuaWP57Js/jp8rXvifmRDrx8e0
         qffhUpc9ITpR9e0i+pUTgO5eZx1Reqt4qhsDlsnN6IFtI5Z2qjVP9Efonsv06Oz5nkfj
         GnmkFh179X7J0xANibRH/CYYq4FyLV6QL5u7qVXq7CkUSS3opqnhzHPnXDPZHI2KqCxW
         XYxw==
X-Forwarded-Encrypted: i=1; AJvYcCVs51q53CI8oNKlY8u1Pft7C8s62f5fQRqDEeiWkphwfxGsDRH4bAMgfP/slVZ/4m/SsIHh252VE0841TxHnONcQiolS3wZYsdRLSW7qO/p46fwLTx7VjzfOoxN6ePTpx0ntui5M3WBPPeNqyAik9SLMFm/9GuyFMB69izE2f5vf/lQMHKGeXBjBfMAm/arJxk990KnD55MialUpJjoPnVZfM7OLx++PnAy9BG1IKQl7YSI+3unrpEn9CdFWEPn7u7smaAWN1PBBPo+VKbjMb1nyHkVZxTT8u05A3kTl1zH1Bt4
X-Gm-Message-State: AOJu0YzdSPtZmL01d04KOTGaR4ioygURKAMRTY0oaYKtifDMcYWbjMYQ
	KtxRCUnSKmSw5MTXxkl4TBL9Jgys8RJBzr9+YQig2qi4FbTadTM=
X-Google-Smtp-Source: AGHT+IEOtLqqAjjYrlHQS8qBEVcSrjCNrCoEQoC8julgRSnyZQ6WZe0wbYQEX2ZQYcLWJzzUoCRR0w==
X-Received: by 2002:a9d:7754:0:b0:6e6:6ea1:9820 with SMTP id t20-20020a9d7754000000b006e66ea19820mr191312otl.14.1711653790323;
        Thu, 28 Mar 2024 12:23:10 -0700 (PDT)
Received: from serve.minyard.net (serve.minyard.net. [2001:470:b8f6:1b::1])
        by smtp.gmail.com with ESMTPSA id n9-20020a9d64c9000000b006e6c9a56591sm344956otl.19.2024.03.28.12.23.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Mar 2024 12:23:09 -0700 (PDT)
Received: from mail.minyard.net (unknown [IPv6:2001:470:b8f6:1b:b987:69e:202a:697a])
	by serve.minyard.net (Postfix) with ESMTPSA id A60B1180011;
	Thu, 28 Mar 2024 19:23:08 +0000 (UTC)
Date: Thu, 28 Mar 2024 14:23:07 -0500
From: Corey Minyard <minyard@acm.org>
To: Allen <allen.lkml@gmail.com>
Cc: Allen Pais <apais@linux.microsoft.com>, linux-kernel@vger.kernel.org,
	tj@kernel.org, keescook@chromium.org, vkoul@kernel.org,
	marcan@marcan.st, sven@svenpeter.dev, florian.fainelli@broadcom.com,
	rjui@broadcom.com, sbranden@broadcom.com, paul@crapouillou.net,
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
Message-ID: <ZgXDmx1HvujsMYAR@mail.minyard.net>
References: <20240327160314.9982-1-apais@linux.microsoft.com>
 <20240327160314.9982-7-apais@linux.microsoft.com>
 <ZgRePyo2zC4A1Fp4@mail.minyard.net>
 <CAOMdWS+1AFxEqmACiBYzPHc+q0Ut6hp15tdV50JHvfVeUNCGQw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAOMdWS+1AFxEqmACiBYzPHc+q0Ut6hp15tdV50JHvfVeUNCGQw@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240328_122313_270384_69D156FA 
X-CRM114-Status: GOOD (  36.58  )
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

On Thu, Mar 28, 2024 at 10:52:16AM -0700, Allen wrote:
> On Wed, Mar 27, 2024 at 11:05 AM Corey Minyard <minyard@acm.org> wrote:
> >
> > I believe that work queues items are execute single-threaded for a work
> > queue, so this should be good.  I need to test this, though.  It may be
> > that an IPMI device can have its own work queue; it may not be important
> > to run it in bh context.
> 
>   Fair point. Could you please let me know once you have had a chance to test
> these changes. Meanwhile, I will work on RFC wherein IPMI will have its own
> workqueue.
> 
>  Thanks for taking time out to review.

After looking and thinking about it a bit, a BH context is still
probably the best for this.

I have tested this patch under load and various scenarios and it seems
to work ok.  So:

Tested-by: Corey Minyard <cminyard@mvista.com>
Acked-by: Corey Minyard <cminyard@mvista.com>

Or I can take this into my tree.

-corey

> 
> - Allen
> 
> >
> > -corey
> >
> > >
> > > Based on the work done by Tejun Heo <tj@kernel.org>
> > > Branch: https://git.kernel.org/pub/scm/linux/kernel/git/tj/wq.git for-610
> > >
> > > Signed-off-by: Allen Pais <allen.lkml@gmail.com>
> > > ---
> > >  drivers/char/ipmi/ipmi_msghandler.c | 30 ++++++++++++++---------------
> > >  1 file changed, 15 insertions(+), 15 deletions(-)
> > >
> > > diff --git a/drivers/char/ipmi/ipmi_msghandler.c b/drivers/char/ipmi/ipmi_msghandler.c
> > > index b0eedc4595b3..fce2a2dbdc82 100644
> > > --- a/drivers/char/ipmi/ipmi_msghandler.c
> > > +++ b/drivers/char/ipmi/ipmi_msghandler.c
> > > @@ -36,12 +36,13 @@
> > >  #include <linux/nospec.h>
> > >  #include <linux/vmalloc.h>
> > >  #include <linux/delay.h>
> > > +#include <linux/workqueue.h>
> > >
> > >  #define IPMI_DRIVER_VERSION "39.2"
> > >
> > >  static struct ipmi_recv_msg *ipmi_alloc_recv_msg(void);
> > >  static int ipmi_init_msghandler(void);
> > > -static void smi_recv_tasklet(struct tasklet_struct *t);
> > > +static void smi_recv_work(struct work_struct *t);
> > >  static void handle_new_recv_msgs(struct ipmi_smi *intf);
> > >  static void need_waiter(struct ipmi_smi *intf);
> > >  static int handle_one_recv_msg(struct ipmi_smi *intf,
> > > @@ -498,13 +499,13 @@ struct ipmi_smi {
> > >       /*
> > >        * Messages queued for delivery.  If delivery fails (out of memory
> > >        * for instance), They will stay in here to be processed later in a
> > > -      * periodic timer interrupt.  The tasklet is for handling received
> > > +      * periodic timer interrupt.  The work is for handling received
> > >        * messages directly from the handler.
> > >        */
> > >       spinlock_t       waiting_rcv_msgs_lock;
> > >       struct list_head waiting_rcv_msgs;
> > >       atomic_t         watchdog_pretimeouts_to_deliver;
> > > -     struct tasklet_struct recv_tasklet;
> > > +     struct work_struct recv_work;
> > >
> > >       spinlock_t             xmit_msgs_lock;
> > >       struct list_head       xmit_msgs;
> > > @@ -704,7 +705,7 @@ static void clean_up_interface_data(struct ipmi_smi *intf)
> > >       struct cmd_rcvr  *rcvr, *rcvr2;
> > >       struct list_head list;
> > >
> > > -     tasklet_kill(&intf->recv_tasklet);
> > > +     cancel_work_sync(&intf->recv_work);
> > >
> > >       free_smi_msg_list(&intf->waiting_rcv_msgs);
> > >       free_recv_msg_list(&intf->waiting_events);
> > > @@ -1319,7 +1320,7 @@ static void free_user(struct kref *ref)
> > >  {
> > >       struct ipmi_user *user = container_of(ref, struct ipmi_user, refcount);
> > >
> > > -     /* SRCU cleanup must happen in task context. */
> > > +     /* SRCU cleanup must happen in work context. */
> > >       queue_work(remove_work_wq, &user->remove_work);
> > >  }
> > >
> > > @@ -3605,8 +3606,7 @@ int ipmi_add_smi(struct module         *owner,
> > >       intf->curr_seq = 0;
> > >       spin_lock_init(&intf->waiting_rcv_msgs_lock);
> > >       INIT_LIST_HEAD(&intf->waiting_rcv_msgs);
> > > -     tasklet_setup(&intf->recv_tasklet,
> > > -                  smi_recv_tasklet);
> > > +     INIT_WORK(&intf->recv_work, smi_recv_work);
> > >       atomic_set(&intf->watchdog_pretimeouts_to_deliver, 0);
> > >       spin_lock_init(&intf->xmit_msgs_lock);
> > >       INIT_LIST_HEAD(&intf->xmit_msgs);
> > > @@ -4779,7 +4779,7 @@ static void handle_new_recv_msgs(struct ipmi_smi *intf)
> > >                        * To preserve message order, quit if we
> > >                        * can't handle a message.  Add the message
> > >                        * back at the head, this is safe because this
> > > -                      * tasklet is the only thing that pulls the
> > > +                      * work is the only thing that pulls the
> > >                        * messages.
> > >                        */
> > >                       list_add(&smi_msg->link, &intf->waiting_rcv_msgs);
> > > @@ -4812,10 +4812,10 @@ static void handle_new_recv_msgs(struct ipmi_smi *intf)
> > >       }
> > >  }
> > >
> > > -static void smi_recv_tasklet(struct tasklet_struct *t)
> > > +static void smi_recv_work(struct work_struct *t)
> > >  {
> > >       unsigned long flags = 0; /* keep us warning-free. */
> > > -     struct ipmi_smi *intf = from_tasklet(intf, t, recv_tasklet);
> > > +     struct ipmi_smi *intf = from_work(intf, t, recv_work);
> > >       int run_to_completion = intf->run_to_completion;
> > >       struct ipmi_smi_msg *newmsg = NULL;
> > >
> > > @@ -4866,7 +4866,7 @@ void ipmi_smi_msg_received(struct ipmi_smi *intf,
> > >
> > >       /*
> > >        * To preserve message order, we keep a queue and deliver from
> > > -      * a tasklet.
> > > +      * a work.
> > >        */
> > >       if (!run_to_completion)
> > >               spin_lock_irqsave(&intf->waiting_rcv_msgs_lock, flags);
> > > @@ -4887,9 +4887,9 @@ void ipmi_smi_msg_received(struct ipmi_smi *intf,
> > >               spin_unlock_irqrestore(&intf->xmit_msgs_lock, flags);
> > >
> > >       if (run_to_completion)
> > > -             smi_recv_tasklet(&intf->recv_tasklet);
> > > +             smi_recv_work(&intf->recv_work);
> > >       else
> > > -             tasklet_schedule(&intf->recv_tasklet);
> > > +             queue_work(system_bh_wq, &intf->recv_work);
> > >  }
> > >  EXPORT_SYMBOL(ipmi_smi_msg_received);
> > >
> > > @@ -4899,7 +4899,7 @@ void ipmi_smi_watchdog_pretimeout(struct ipmi_smi *intf)
> > >               return;
> > >
> > >       atomic_set(&intf->watchdog_pretimeouts_to_deliver, 1);
> > > -     tasklet_schedule(&intf->recv_tasklet);
> > > +     queue_work(system_bh_wq, &intf->recv_work);
> > >  }
> > >  EXPORT_SYMBOL(ipmi_smi_watchdog_pretimeout);
> > >
> > > @@ -5068,7 +5068,7 @@ static bool ipmi_timeout_handler(struct ipmi_smi *intf,
> > >                                      flags);
> > >       }
> > >
> > > -     tasklet_schedule(&intf->recv_tasklet);
> > > +     queue_work(system_bh_wq, &intf->recv_work);
> > >
> > >       return need_timer;
> > >  }
> > > --
> > > 2.17.1
> > >
> > >
> >
> 
> 
> -- 
>        - Allen
> 

