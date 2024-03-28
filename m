Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A8B9CD1283
	for <linux-mediatek@archiver.kernel.org>; Thu, 28 Mar 2024 17:52:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=K7LBZgef3OmAKuVME1pwiv1MCdqK5azmNzQAONOqk24=; b=wAVM6hdhCuy8Saonq55oxHeqVO
	pn3rQHDtCQvYR8amZgMAU7WAox+hLBL1N4r5amhOl5CrXI826TuDJC89oY1S8hvHeU6cECc+i2850
	FOqrm0Q9gEoyITcQ6EAXb8tjuIzHt23oSW814WAj7czT+clqBXzbjSsRVz9Styj1ob3iQyOP9r2e5
	2Y+dSONeOcOVdSMfynCDpc1aequIapp2TPPw7Eo3sSxrKlA3OdqyVxdfYnsyg9+sZSaeHCmhDrb00
	/ku3g3+CJpBUpLmo3fQDBKR6cIKeEAa7DA1VJ9puWz8zad17KgcYVgJt17AsgHYLZYPyG2J8APwWz
	MadVnPnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rptvW-0000000F2Ws-3XVU;
	Thu, 28 Mar 2024 17:52:34 +0000
Received: from mail-ua1-x92b.google.com ([2607:f8b0:4864:20::92b])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rptvS-0000000F2Uj-0lNk;
	Thu, 28 Mar 2024 17:52:31 +0000
Received: by mail-ua1-x92b.google.com with SMTP id a1e0cc1a2514c-7e05b1ef941so329975241.3;
        Thu, 28 Mar 2024 10:52:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1711648348; x=1712253148; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=K7LBZgef3OmAKuVME1pwiv1MCdqK5azmNzQAONOqk24=;
        b=MYHxwm3RjlqtYJyduSo/RsbTyYEKakM+tQC7xHA+7/49U5UaFly74esGSBsOtkvsG2
         jpgdy12yDJJbxs31xl9j4N2yZu4x222FPFypsRdQ8C91sHD/P+Iojp09oNy+Ms7HMPet
         rfkNiqYI153LYVBNdXFank1HtYCYNTqhy5FkpLQj7v7v0tVK4lByyPeuw4ecjGFqMLD5
         cl+atDh8MudywbuMgCrav/fYOxz/n/iDgsv/VuMQDDH+RfSJzcZEjIRVLEnovze6ypH8
         cMLlBqDtMyOzjhpFwM8pzGshYS1CnMwi7iuDZynrnTr2014Ho+eTWKb2owhvGGgKc4tp
         CrGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711648348; x=1712253148;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=K7LBZgef3OmAKuVME1pwiv1MCdqK5azmNzQAONOqk24=;
        b=sqkvk7ic7MIY5LPxAjFsbOkCu3Qw63t/avd4qXesXWZBstea75kQ4LuEwbTJoO0uck
         XU+gZ0DgbNoDGw5gH7xzRuFSGCj1LU9P+45KvGFQTpmAwRhT3pR6Pp21zK8hY2no4J7l
         jYU8S4fldX6ZbSHQcIfEIgQx8zaetSAItebExbcx8D8L6izWcP0GWn3RFYLVQiqAjuGE
         Ugm/2vs0IzhWHTvySivEVw/IqyPn+SVMtDyb+8o/9T/in3zP7vvfjet5PnBYRGsujwYA
         T4fYTRa2mP9IQNvL10Xd3ecHJ8+evzjldf5zFcy9QZahXKBDKNkm1Ud+C+4aDQoFZSgC
         jzQA==
X-Forwarded-Encrypted: i=1; AJvYcCWSu6w38rE1XtAPwDXDsA0rrxSo0vjvsYu/Em2wPQradV4fsdZtKgSGn0/yc7spGlFDrk1VY+nA0OF4TX+oJfmXY69htgq4hgjG7gdbvu0Q5DNEzoiLDMLGMpSVJCoJ+Nz3xYjOpTQBMns33+svUoyBXfsw3luV7+U2A0BTGrWRl4RnkysPbNmO+gYLffYDPt4UyIoynEH7WkiVqjRy7PQz3gXgNvllRS3BDc8ghxe5Lp4Tp8UA36Gk2bQI56NP+0FsnSOVICMnaMNxKiN90XoWdj1rbgJmw/TDTIEgdyBo+ml6
X-Gm-Message-State: AOJu0YwhZciYWjrj8+PjKOd+fVNqtpgzjUb40Sm4zsMVBiRXg5WxwJn8
	s3iVqeEd+F7odr+3VL41bpqHiIcil5Te14btx0nhxJmLpM/fmdhN3jdSHbwDdHawTFqlOQVU3Ti
	hQ09pJtkc1mO2TkETsBLsRYAyg4c=
X-Google-Smtp-Source: AGHT+IE95pKnkyYhJyn8YRFxcJ3UpRrXG0+tqWRBp7m1EgSmM0bJzOr09iKkrzG5ElLe1R0ae4jladZnXe+pzUi/Iq8=
X-Received: by 2002:a05:6102:6d1:b0:478:4c1a:efbd with SMTP id
 m17-20020a05610206d100b004784c1aefbdmr2262487vsg.13.1711648347936; Thu, 28
 Mar 2024 10:52:27 -0700 (PDT)
MIME-Version: 1.0
References: <20240327160314.9982-1-apais@linux.microsoft.com>
 <20240327160314.9982-7-apais@linux.microsoft.com> <ZgRePyo2zC4A1Fp4@mail.minyard.net>
In-Reply-To: <ZgRePyo2zC4A1Fp4@mail.minyard.net>
From: Allen <allen.lkml@gmail.com>
Date: Thu, 28 Mar 2024 10:52:16 -0700
Message-ID: <CAOMdWS+1AFxEqmACiBYzPHc+q0Ut6hp15tdV50JHvfVeUNCGQw@mail.gmail.com>
Subject: Re: [PATCH 6/9] ipmi: Convert from tasklet to BH workqueue
To: minyard@acm.org
Cc: Allen Pais <apais@linux.microsoft.com>, linux-kernel@vger.kernel.org, tj@kernel.org, 
	keescook@chromium.org, vkoul@kernel.org, marcan@marcan.st, sven@svenpeter.dev, 
	florian.fainelli@broadcom.com, rjui@broadcom.com, sbranden@broadcom.com, 
	paul@crapouillou.net, Eugeniy.Paltsev@synopsys.com, 
	manivannan.sadhasivam@linaro.org, vireshk@kernel.org, Frank.Li@nxp.com, 
	leoyang.li@nxp.com, zw@zh-kernel.org, wangzhou1@hisilicon.com, 
	haijie1@huawei.com, shawnguo@kernel.org, s.hauer@pengutronix.de, 
	sean.wang@mediatek.com, matthias.bgg@gmail.com, 
	angelogioacchino.delregno@collabora.com, afaerber@suse.de, 
	logang@deltatee.com, daniel@zonque.org, haojian.zhuang@gmail.com, 
	robert.jarzmik@free.fr, andersson@kernel.org, konrad.dybcio@linaro.org, 
	orsonzhai@gmail.com, baolin.wang@linux.alibaba.com, zhang.lyra@gmail.com, 
	patrice.chotard@foss.st.com, linus.walleij@linaro.org, wens@csie.org, 
	jernej.skrabec@gmail.com, peter.ujfalusi@gmail.com, kys@microsoft.com, 
	haiyangz@microsoft.com, wei.liu@kernel.org, decui@microsoft.com, 
	jassisinghbrar@gmail.com, mchehab@kernel.org, maintainers@bluecherrydvr.com, 
	aubin.constans@microchip.com, ulf.hansson@linaro.org, manuel.lauss@gmail.com, 
	mirq-linux@rere.qmqm.pl, jh80.chung@samsung.com, oakad@yahoo.com, 
	hayashi.kunihiko@socionext.com, mhiramat@kernel.org, brucechang@via.com.tw, 
	HaraldWelte@viatech.com, pierre@ossman.eu, duncan.sands@free.fr, 
	stern@rowland.harvard.edu, oneukum@suse.com, 
	openipmi-developer@lists.sourceforge.net, dmaengine@vger.kernel.org, 
	asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-rpi-kernel@lists.infradead.org, linux-mips@vger.kernel.org, 
	imx@lists.linux.dev, linuxppc-dev@lists.ozlabs.org, 
	linux-mediatek@lists.infradead.org, linux-actions@lists.infradead.org, 
	linux-arm-msm@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, linux-tegra@vger.kernel.org, 
	linux-hyperv@vger.kernel.org, linux-rdma@vger.kernel.org, 
	linux-media@vger.kernel.org, linux-mmc@vger.kernel.org, 
	linux-omap@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	linux-s390@vger.kernel.org, netdev@vger.kernel.org, linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240328_105230_253981_C52E76E1 
X-CRM114-Status: GOOD (  34.49  )
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

On Wed, Mar 27, 2024 at 11:05=E2=80=AFAM Corey Minyard <minyard@acm.org> wr=
ote:
>
> On Wed, Mar 27, 2024 at 04:03:11PM +0000, Allen Pais wrote:
> > The only generic interface to execute asynchronously in the BH context =
is
> > tasklet; however, it's marked deprecated and has some design flaws. To
> > replace tasklets, BH workqueue support was recently added. A BH workque=
ue
> > behaves similarly to regular workqueues except that the queued work ite=
ms
> > are executed in the BH context.
> >
> > This patch converts drivers/infiniband/* from tasklet to BH workqueue.
>
> I think you mean drivers/char/ipmi/* here.

 My apologies, my scripts messed up the commit messages for this series.
Will have it fixed in v2.

>
> I believe that work queues items are execute single-threaded for a work
> queue, so this should be good.  I need to test this, though.  It may be
> that an IPMI device can have its own work queue; it may not be important
> to run it in bh context.

  Fair point. Could you please let me know once you have had a chance to te=
st
these changes. Meanwhile, I will work on RFC wherein IPMI will have its own
workqueue.

 Thanks for taking time out to review.

- Allen

>
> -corey
>
> >
> > Based on the work done by Tejun Heo <tj@kernel.org>
> > Branch: https://git.kernel.org/pub/scm/linux/kernel/git/tj/wq.git for-6=
.10
> >
> > Signed-off-by: Allen Pais <allen.lkml@gmail.com>
> > ---
> >  drivers/char/ipmi/ipmi_msghandler.c | 30 ++++++++++++++---------------
> >  1 file changed, 15 insertions(+), 15 deletions(-)
> >
> > diff --git a/drivers/char/ipmi/ipmi_msghandler.c b/drivers/char/ipmi/ip=
mi_msghandler.c
> > index b0eedc4595b3..fce2a2dbdc82 100644
> > --- a/drivers/char/ipmi/ipmi_msghandler.c
> > +++ b/drivers/char/ipmi/ipmi_msghandler.c
> > @@ -36,12 +36,13 @@
> >  #include <linux/nospec.h>
> >  #include <linux/vmalloc.h>
> >  #include <linux/delay.h>
> > +#include <linux/workqueue.h>
> >
> >  #define IPMI_DRIVER_VERSION "39.2"
> >
> >  static struct ipmi_recv_msg *ipmi_alloc_recv_msg(void);
> >  static int ipmi_init_msghandler(void);
> > -static void smi_recv_tasklet(struct tasklet_struct *t);
> > +static void smi_recv_work(struct work_struct *t);
> >  static void handle_new_recv_msgs(struct ipmi_smi *intf);
> >  static void need_waiter(struct ipmi_smi *intf);
> >  static int handle_one_recv_msg(struct ipmi_smi *intf,
> > @@ -498,13 +499,13 @@ struct ipmi_smi {
> >       /*
> >        * Messages queued for delivery.  If delivery fails (out of memor=
y
> >        * for instance), They will stay in here to be processed later in=
 a
> > -      * periodic timer interrupt.  The tasklet is for handling receive=
d
> > +      * periodic timer interrupt.  The work is for handling received
> >        * messages directly from the handler.
> >        */
> >       spinlock_t       waiting_rcv_msgs_lock;
> >       struct list_head waiting_rcv_msgs;
> >       atomic_t         watchdog_pretimeouts_to_deliver;
> > -     struct tasklet_struct recv_tasklet;
> > +     struct work_struct recv_work;
> >
> >       spinlock_t             xmit_msgs_lock;
> >       struct list_head       xmit_msgs;
> > @@ -704,7 +705,7 @@ static void clean_up_interface_data(struct ipmi_smi=
 *intf)
> >       struct cmd_rcvr  *rcvr, *rcvr2;
> >       struct list_head list;
> >
> > -     tasklet_kill(&intf->recv_tasklet);
> > +     cancel_work_sync(&intf->recv_work);
> >
> >       free_smi_msg_list(&intf->waiting_rcv_msgs);
> >       free_recv_msg_list(&intf->waiting_events);
> > @@ -1319,7 +1320,7 @@ static void free_user(struct kref *ref)
> >  {
> >       struct ipmi_user *user =3D container_of(ref, struct ipmi_user, re=
fcount);
> >
> > -     /* SRCU cleanup must happen in task context. */
> > +     /* SRCU cleanup must happen in work context. */
> >       queue_work(remove_work_wq, &user->remove_work);
> >  }
> >
> > @@ -3605,8 +3606,7 @@ int ipmi_add_smi(struct module         *owner,
> >       intf->curr_seq =3D 0;
> >       spin_lock_init(&intf->waiting_rcv_msgs_lock);
> >       INIT_LIST_HEAD(&intf->waiting_rcv_msgs);
> > -     tasklet_setup(&intf->recv_tasklet,
> > -                  smi_recv_tasklet);
> > +     INIT_WORK(&intf->recv_work, smi_recv_work);
> >       atomic_set(&intf->watchdog_pretimeouts_to_deliver, 0);
> >       spin_lock_init(&intf->xmit_msgs_lock);
> >       INIT_LIST_HEAD(&intf->xmit_msgs);
> > @@ -4779,7 +4779,7 @@ static void handle_new_recv_msgs(struct ipmi_smi =
*intf)
> >                        * To preserve message order, quit if we
> >                        * can't handle a message.  Add the message
> >                        * back at the head, this is safe because this
> > -                      * tasklet is the only thing that pulls the
> > +                      * work is the only thing that pulls the
> >                        * messages.
> >                        */
> >                       list_add(&smi_msg->link, &intf->waiting_rcv_msgs)=
;
> > @@ -4812,10 +4812,10 @@ static void handle_new_recv_msgs(struct ipmi_sm=
i *intf)
> >       }
> >  }
> >
> > -static void smi_recv_tasklet(struct tasklet_struct *t)
> > +static void smi_recv_work(struct work_struct *t)
> >  {
> >       unsigned long flags =3D 0; /* keep us warning-free. */
> > -     struct ipmi_smi *intf =3D from_tasklet(intf, t, recv_tasklet);
> > +     struct ipmi_smi *intf =3D from_work(intf, t, recv_work);
> >       int run_to_completion =3D intf->run_to_completion;
> >       struct ipmi_smi_msg *newmsg =3D NULL;
> >
> > @@ -4866,7 +4866,7 @@ void ipmi_smi_msg_received(struct ipmi_smi *intf,
> >
> >       /*
> >        * To preserve message order, we keep a queue and deliver from
> > -      * a tasklet.
> > +      * a work.
> >        */
> >       if (!run_to_completion)
> >               spin_lock_irqsave(&intf->waiting_rcv_msgs_lock, flags);
> > @@ -4887,9 +4887,9 @@ void ipmi_smi_msg_received(struct ipmi_smi *intf,
> >               spin_unlock_irqrestore(&intf->xmit_msgs_lock, flags);
> >
> >       if (run_to_completion)
> > -             smi_recv_tasklet(&intf->recv_tasklet);
> > +             smi_recv_work(&intf->recv_work);
> >       else
> > -             tasklet_schedule(&intf->recv_tasklet);
> > +             queue_work(system_bh_wq, &intf->recv_work);
> >  }
> >  EXPORT_SYMBOL(ipmi_smi_msg_received);
> >
> > @@ -4899,7 +4899,7 @@ void ipmi_smi_watchdog_pretimeout(struct ipmi_smi=
 *intf)
> >               return;
> >
> >       atomic_set(&intf->watchdog_pretimeouts_to_deliver, 1);
> > -     tasklet_schedule(&intf->recv_tasklet);
> > +     queue_work(system_bh_wq, &intf->recv_work);
> >  }
> >  EXPORT_SYMBOL(ipmi_smi_watchdog_pretimeout);
> >
> > @@ -5068,7 +5068,7 @@ static bool ipmi_timeout_handler(struct ipmi_smi =
*intf,
> >                                      flags);
> >       }
> >
> > -     tasklet_schedule(&intf->recv_tasklet);
> > +     queue_work(system_bh_wq, &intf->recv_work);
> >
> >       return need_timer;
> >  }
> > --
> > 2.17.1
> >
> >
>


--=20
       - Allen

