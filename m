Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2062C433FE
	for <linux-mediatek@archiver.kernel.org>; Wed,  9 Nov 2022 16:02:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WR9m9xGAUrcO1/AvRVvG5U32PAMYEGiJLP5jiZDvjSk=; b=xBzlZ7YDp1mNlGMmiYGwSWBA5C
	Vf6YhS7F0Nnt2TQZDw7LmtoI97g0473koLY1nX/exrtDiVA9vOV3mJFslaT2eXAy85X+TuDvc9Q8L
	+vR48PeURmijME4SmwrOiG8t3XnWZjxWi5A+Pdfg4OwBJ7PHhUrG9QkeyNcCAiJa7nX7lTPcozQDG
	S8ABp0+8bI0po7v0wo+fB2lnJGLGWzIBeNkN5lpLymPAhDGnram6Oc1ulbvknNwuOH5gDMpZy7LSa
	4eya/rjlGlQiA4OirslL3oRUwYW1hgNzjzVp1EgOE5iGxm83WQmwmxERSyOD3ZxkXXy1ODVKBsz5Z
	InEb4W2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1osnX8-00EuPw-Ul; Wed, 09 Nov 2022 16:02:34 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1osnWy-00EuJZ-2d
	for linux-mediatek@lists.infradead.org; Wed, 09 Nov 2022 16:02:25 +0000
Received: by mail-wm1-x334.google.com with SMTP id p16so11124471wmc.3
        for <linux-mediatek@lists.infradead.org>; Wed, 09 Nov 2022 08:02:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WR9m9xGAUrcO1/AvRVvG5U32PAMYEGiJLP5jiZDvjSk=;
        b=uSb83s+HW6rE4ZSs/mfMPfqbB/RtectTSQZrCBmkHlcMYPyWmUWwv5tMxgv0jUb9BM
         rNJuNtbOZQkb8qnTNIJGBxJdxZrG3DkUqRYyn8ZN7Ua7H8Kiap3gsVzYDrvDdEVYU99p
         Z4eRQSUBwnddiLnULbfK/QmURfi+lfP61BK1QNw9fYTzP8D17CHbbc0AGV575JENhHPY
         Lk1CExEzwCZN/P35iP/CQ3qMq9T/j5NSIsoD9ucOdzELhBWDqjfy/SRZ3cqFwGioO7qz
         WZhz+U7RzOuqgoEwcorbRrUeERVch4HzNu2QfGQU0ADcvIiSVImf4ogesA5ZniJlHTWO
         s7RA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WR9m9xGAUrcO1/AvRVvG5U32PAMYEGiJLP5jiZDvjSk=;
        b=8CZG+wY6a+r85KTlteBAgTUUj/VJWdibMOWSVs+Z9u43WrDORbKoA9pQb32IaLsl+o
         /hX7EC4/aBrO1aOBnC2B/IMYayQ5QMZlpgZ/J8MF8v2NdYd7Do15ToFaL6WjEXmdMrv8
         5dHxHjLI/TW8ZIMiEzmRt2WF5lVjQNAeTTj5527AbK9pMWMMHSqofeXLf8qX/xXRjTQE
         2MLGdgYCw1ZOdBTFvQKBm0LUEdhFFGw8r0QOfiP6WmKmgLaLICTg2vqC6crtXDtQ0tpA
         EITTalEUe0qVhQ771a/MRcX/DozuK3UwjNI9yj8gfBQJBd6SFldNXx3gy8AUWPf3z2ec
         tW3Q==
X-Gm-Message-State: ACrzQf2SKLJs7UGXvWHRqnAlFVwmVxC8pBJxZLmVMYB8qfqNTAY5BOH6
	pbZd5tInnGbAZgq4dsZvNzPKqSeHz1PxnlKRm9dZqw==
X-Google-Smtp-Source: AMsMyM55YvmkRzYCd+FdwuzCtLvww/XUEX97+sLt0snJRUKlnBEeVBkZ0X4BUVrKG6997P2iT6sTJgSfoxl3FEMJEaY=
X-Received: by 2002:a05:600c:4d86:b0:3cf:7257:ba15 with SMTP id
 v6-20020a05600c4d8600b003cf7257ba15mr35748058wmp.22.1668009735506; Wed, 09
 Nov 2022 08:02:15 -0800 (PST)
MIME-Version: 1.0
References: <20221108105352.89801-1-haozhe.chang@mediatek.com>
 <CAMZdPi96dZV0J_6U-mH5eCquWycSQLPvoz6JX1BHWn0eQJyeDA@mail.gmail.com> <8406210223bd8dcbf6682082570f791a6088104c.camel@mediatek.com>
In-Reply-To: <8406210223bd8dcbf6682082570f791a6088104c.camel@mediatek.com>
From: Loic Poulain <loic.poulain@linaro.org>
Date: Wed, 9 Nov 2022 17:01:38 +0100
Message-ID: <CAMZdPi9t2bz06kTECHT01g6zZeTXPgrODvR5qnR2n8BGRUHjWA@mail.gmail.com>
Subject: Re: [PATCH v2] wwan: core: Support slicing in port TX flow of WWAN subsystem
To: =?UTF-8?B?SGFvemhlIENoYW5nICjluLjmtanlk7Ip?= <Haozhe.Chang@mediatek.com>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>, 
	"linuxwwan@intel.com" <linuxwwan@intel.com>, 
	"m.chetan.kumar@linux.intel.com" <m.chetan.kumar@linux.intel.com>, 
	=?UTF-8?B?SHVhIFlhbmcgKOadqOWNjik=?= <Hua.Yang@mediatek.com>, 
	=?UTF-8?B?SGFpanVuIExpdSAo5YiY5rW35YabKQ==?= <haijun.liu@mediatek.com>, 
	"chiranjeevi.rapolu@linux.intel.com" <chiranjeevi.rapolu@linux.intel.com>, 
	"ryazanov.s.a@gmail.com" <ryazanov.s.a@gmail.com>, "kuba@kernel.org" <kuba@kernel.org>, 
	=?UTF-8?B?WGlheXUgWmhhbmcgKOW8oOWkj+Wuhyk=?= <Xiayu.Zhang@mediatek.com>, 
	"johannes@sipsolutions.net" <johannes@sipsolutions.net>, 
	"chandrashekar.devegowda@intel.com" <chandrashekar.devegowda@intel.com>, 
	"edumazet@google.com" <edumazet@google.com>, "netdev@vger.kernel.org" <netdev@vger.kernel.org>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
	"pabeni@redhat.com" <pabeni@redhat.com>, "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>, 
	"ricardo.martinez@linux.intel.com" <ricardo.martinez@linux.intel.com>, 
	"davem@davemloft.net" <davem@davemloft.net>, =?UTF-8?B?TGFtYmVydCBXYW5nICjnjovkvJ8p?= <Lambert.Wang@mediatek.com>, 
	"srv_heupstream@mediatek.com" <srv_heupstream@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221109_080224_130786_0FE588BE 
X-CRM114-Status: GOOD (  49.15  )
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

On Wed, 9 Nov 2022 at 12:23, Haozhe Chang (=E5=B8=B8=E6=B5=A9=E5=93=B2)
<Haozhe.Chang@mediatek.com> wrote:
>
> Hi Loic
>
> On Tue, 2022-11-08 at 13:14 +0100, Loic Poulain wrote:
> > Hi Haozhe,
> >
> > On Tue, 8 Nov 2022 at 11:54, <haozhe.chang@mediatek.com> wrote:
> > >
> > > From: haozhe chang <haozhe.chang@mediatek.com>
> > >
> > > wwan_port_fops_write inputs the SKB parameter to the TX callback of
> > > the WWAN device driver. However, the WWAN device (e.g., t7xx) may
> > > have an MTU less than the size of SKB, causing the TX buffer to be
> > > sliced and copied once more in the WWAN device driver.
> > >
> > > This patch implements the slicing in the WWAN subsystem and gives
> > > the WWAN devices driver the option to slice(by chunk) or not. By
> > > doing so, the additional memory copy is reduced.
> > >
> > > Meanwhile, this patch gives WWAN devices driver the option to
> > > reserve
> > > headroom in SKB for the device-specific metadata.
> > >
> > > Signed-off-by: haozhe chang <haozhe.chang@mediatek.com>
> > >
> > > ---
> > > Changes in v2
> > >   -send fragments to device driver by skb frag_list.
> > > ---
> > >  drivers/net/wwan/t7xx/t7xx_port_wwan.c | 42 ++++++++++-------
> > >  drivers/net/wwan/wwan_core.c           | 65 ++++++++++++++++++++
> > > ------
> > >  include/linux/wwan.h                   |  5 +-
> > >  3 files changed, 80 insertions(+), 32 deletions(-)
> > >
> > > diff --git a/drivers/net/wwan/t7xx/t7xx_port_wwan.c
> > > b/drivers/net/wwan/t7xx/t7xx_port_wwan.c
> > > index 33931bfd78fd..74fa58575d5a 100644
> > > --- a/drivers/net/wwan/t7xx/t7xx_port_wwan.c
> > > +++ b/drivers/net/wwan/t7xx/t7xx_port_wwan.c
> > > @@ -54,13 +54,13 @@ static void t7xx_port_ctrl_stop(struct
> > > wwan_port *port)
> >
> > [...]
> > >  static const struct wwan_port_ops wwan_ops =3D {
> > >         .start =3D t7xx_port_ctrl_start,
> > >         .stop =3D t7xx_port_ctrl_stop,
> > >         .tx =3D t7xx_port_ctrl_tx,
> > > +       .needed_headroom =3D t7xx_port_tx_headroom,
> > > +       .tx_chunk_len =3D t7xx_port_tx_chunk_len,
> >
> > Can you replace 'chunk' with 'frag' everywhere?
> >
> OK
> > >  };
> > >
> > >  static int t7xx_port_wwan_init(struct t7xx_port *port)
> > > diff --git a/drivers/net/wwan/wwan_core.c
> > > b/drivers/net/wwan/wwan_core.c
> > > index 62e9f7d6c9fe..ed78471f9e38 100644
> > > --- a/drivers/net/wwan/wwan_core.c
> > > +++ b/drivers/net/wwan/wwan_core.c
> > > @@ -20,7 +20,7 @@
> > >  #include <uapi/linux/wwan.h>
> > >
> > >  /* Maximum number of minors in use */
> > > -#define WWAN_MAX_MINORS                (1 << MINORBITS)
> > > +#define WWAN_MAX_MINORS                BIT(MINORBITS)
> > >
> > >  static DEFINE_MUTEX(wwan_register_lock); /* WWAN device
> > > create|remove lock */
> > >  static DEFINE_IDA(minors); /* minors for WWAN port chardevs */
> > > @@ -67,6 +67,8 @@ struct wwan_device {
> > >   * @rxq: Buffer inbound queue
> > >   * @waitqueue: The waitqueue for port fops (read/write/poll)
> > >   * @data_lock: Port specific data access serialization
> > > + * @headroom_len: SKB reserved headroom size
> > > + * @chunk_len: Chunk len to split packet
> > >   * @at_data: AT port specific data
> > >   */
> > >  struct wwan_port {
> > > @@ -79,6 +81,8 @@ struct wwan_port {
> > >         struct sk_buff_head rxq;
> > >         wait_queue_head_t waitqueue;
> > >         struct mutex data_lock; /* Port specific data access
> > > serialization */
> > > +       size_t headroom_len;
> > > +       size_t chunk_len;
> > >         union {
> > >                 struct {
> > >                         struct ktermios termios;
> > > @@ -550,8 +554,13 @@ static int wwan_port_op_start(struct wwan_port
> > > *port)
> > >         }
> > >
> > >         /* If port is already started, don't start again */
> > > -       if (!port->start_count)
> > > +       if (!port->start_count) {
> > >                 ret =3D port->ops->start(port);
> > > +               if (port->ops->tx_chunk_len)
> > > +                       port->chunk_len =3D port->ops-
> > > >tx_chunk_len(port);
> >
> > So, maybe frag len and headroom should be parameters of
> > wwan_create_port() instead of port ops, as we really need this info
> > only once.
> >
> If frag_len and headroom are added, wwan_create_port will have 6
> parameters, is it too much? And for similar requirements in the future,
> it may be difficult to add more parameters.

I think 6 is still fine, if we need more fields in the future we can
always have a port_config struct as a parameter instead.

>
> Is it a good solution to provide wwan_port_set_frag_len and
> wwan_port_set_headroom_len to the device driver? if so, the device
> driver has a chance to modify the wwan port's field after calling
> wwan_create_port.

Would be preferable to not have these values changeable at runtime.

> > > +               if (port->ops->needed_headroom)
> > > +                       port->headroom_len =3D port->ops-
> > > >needed_headroom(port);
> > > +       }
> > >
> > >         if (!ret)
> > >                 port->start_count++;
> > > @@ -698,30 +707,56 @@ static ssize_t wwan_port_fops_read(struct
> > > file *filp, char __user *buf,
> > >  static ssize_t wwan_port_fops_write(struct file *filp, const char
> > > __user *buf,
> > >                                     size_t count, loff_t *offp)
> > >  {
> > > +       size_t len, chunk_len, offset, allowed_chunk_len;
> > > +       struct sk_buff *skb, *head =3D NULL, *tail =3D NULL;
> > >         struct wwan_port *port =3D filp->private_data;
> > > -       struct sk_buff *skb;
> > >         int ret;
> > >
> > >         ret =3D wwan_wait_tx(port, !!(filp->f_flags & O_NONBLOCK));
> > >         if (ret)
> > >                 return ret;
> > >
> > > -       skb =3D alloc_skb(count, GFP_KERNEL);
> > > -       if (!skb)
> > > -               return -ENOMEM;
> > > +       allowed_chunk_len =3D port->chunk_len ? port->chunk_len :
> > > count;
> >
> > I would suggest making port->chunk_len (frag_len) always valid, by
> > setting it to -1 (MAX size_t) when creating a port without frag_len
> > requirement.
> >
> Ok, it will help to reduce some code.
> > > +       for (offset =3D 0; offset < count; offset +=3D chunk_len) {
> > > +               chunk_len =3D min(count - offset, allowed_chunk_len);
> > > +               len =3D chunk_len + port->headroom_len;
> > > +               skb =3D alloc_skb(len, GFP_KERNEL);
> >
> > That works but would prefer a simpler solution like:
> > do {
> >     len =3D min(port->frag_len, remain);
> >     skb =3D alloc_skb(len + port->needed_headroom; GFP_KERNEL);
> >     [...]
> >     copy_from_user(skb_put(skb, len), buf + count - remain)
> > } while ((remain -=3D len));
> >
> May I know if the suggestion is because "while" is more efficient
> than  "for", or is it more readable?

It's more readable to me, but it's a subjective opinion here.

> > > +               if (!skb) {
> > > +                       ret =3D -ENOMEM;
> > > +                       goto freeskb;
> > > +               }
> > > +               skb_reserve(skb, port->headroom_len);
> > > +
> > > +               if (!head) {
> > > +                       head =3D skb;
> > > +               } else if (!tail) {
> > > +                       skb_shinfo(head)->frag_list =3D skb;
> > > +                       tail =3D skb;
> > > +               } else {
> > > +                       tail->next =3D skb;
> > > +                       tail =3D skb;
> > > +               }
> > >
> > > -       if (copy_from_user(skb_put(skb, count), buf, count)) {
> > > -               kfree_skb(skb);
> > > -               return -EFAULT;
> > > -       }
> > > +               if (copy_from_user(skb_put(skb, chunk_len), buf +
> > > offset, chunk_len)) {
> > > +                       ret =3D -EFAULT;
> > > +                       goto freeskb;
> > > +               }
> > >
> > > -       ret =3D wwan_port_op_tx(port, skb, !!(filp->f_flags &
> > > O_NONBLOCK));
> > > -       if (ret) {
> > > -               kfree_skb(skb);
> > > -               return ret;
> > > +               if (skb !=3D head) {
> > > +                       head->data_len +=3D skb->len;
> > > +                       head->len +=3D skb->len;
> > > +                       head->truesize +=3D skb->truesize;
> > > +               }
> > >         }
> > >
> > > -       return count;
> > > +       if (head) {
> >
> > How head can be null here?
> >
> if the parameter "count" is 0, the for loop will not be executed.

Ok, right (with do/while version it should not happen).
But maybe the !count case should be caught earlier, if even possible in fop=
s.

Regards,
Loic

