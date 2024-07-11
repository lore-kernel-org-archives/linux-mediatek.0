Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1EA3CC3DA41
	for <linux-mediatek@archiver.kernel.org>; Thu, 11 Jul 2024 03:47:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SpOmGWaPs+ZJZCC0I9Q/piIlH+/AVFYjnCcsvYrQiVE=; b=dUPN++GhtcW2EfAJmpgW2BsWgk
	91N022lTmYL8O0E6YGWuIwEof3D5SDl9RQQC3Vp/WEKEm7ez7FJ/5psbv9VVfLuEiOKBeRT4EJJxx
	Ov/k3imHGORFuVgbI+HHtSMfaGqJJE/ZBBI+dLK/64tE7OY+e3FTLRB0pl/I7qV+tbU6L7n9+QEYy
	nX6ewqfr4Z7CUgNFzbReebURO7MLf0WSO9QC71wkydwyA9qr+4TW0dP/V2vqXfCQozvMN7xnulpTq
	4XGiSN0ffwUNVbNhesCU8DccZzI2W2h9o8qy66ODz3Ko08FXg+YcLu9dpffqKmn5n0yNSQvzZ1oBx
	O/Tfv66Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sRkmZ-0000000CbN8-3bNG;
	Thu, 11 Jul 2024 03:47:47 +0000
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sRkmX-0000000CbMN-0GC0;
	Thu, 11 Jul 2024 03:47:46 +0000
Received: by mail-ej1-x62a.google.com with SMTP id a640c23a62f3a-a77e6dd7f72so46502366b.3;
        Wed, 10 Jul 2024 20:47:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720669663; x=1721274463; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SpOmGWaPs+ZJZCC0I9Q/piIlH+/AVFYjnCcsvYrQiVE=;
        b=FcG6Ul4QgF+ncU1IdnfwM6WnByz5IS/E2IUYo44i32zJejE9jkHpWoX/Dwo4PSC3RF
         1QiHQB1lIcmk4G8E3U7mFdwdkhFGlz06CmtBIMBsBdDQw92GCDZF2a0KMw0MN//4sHHr
         A+YrQS4nCjauQlsbvsqCswsu7x7TJwGRjvtV6DgjCjtvDu84OQ395ce+quaFllwEuDiK
         Icq9Afyf2j2zPHOqW3Xz2G97SZLY1DUlmqXcPOw3tS6Q62JKnNOK6geYHI7bcaAckXcD
         Qp8vhZ1EjsS0uyDsuR2cxlOR1VECQ7UxeMe387Lv3Uu3OdyeqWdesTvFpnswA5CrXLLJ
         o2DQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720669663; x=1721274463;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SpOmGWaPs+ZJZCC0I9Q/piIlH+/AVFYjnCcsvYrQiVE=;
        b=jW/VXzaimqNbZ/f+8KeeKU1Tl2ohWqw+548QPSccb4k2yZ74ouFUBIsOsEbYygOiRD
         h81AXqics2N+gVmz762bClf0x/zsPw8Z1a1uzFNV+QocGi8fQeU4FcrlYgtpnjmEZAZ9
         7n2S7PpdUsxttfk/sbYMr72/9UCgBARVD2/aghwxQH1Bf4hjc1XCd8+nB/Z7hV0T/RqT
         ibrPIzPRalJvYARboRhDTodPTxEOQh85y4IzVAwTfqxyFP9d0zeiIeZh4k4vUyOoLh7V
         9tKuGrG6brMTl+RZJ2mnOp51rAuULvlKqhZz7Da39KVj13XXr8Ul6GDBetJi+NyGJIWG
         y3dg==
X-Forwarded-Encrypted: i=1; AJvYcCXK8jcPkt6zRcVNcJ6fV9iHtNAYt4uFWPeruzg3BqIudlceoOSZtMtomXrQ6op+RrylqSUkSyDfbzsuBCOGIQ7klHBdukIrHRQKix/6p6C0B0T1Zn5JWzimB5FbUAcJ2nbVx73/84ida5JP/v8xnJpT9K96uuXhsp4=
X-Gm-Message-State: AOJu0YzdREYCxZZy91FRRNWkpv9sHQ028MV+3Sznic79B3iXGQdRlBYj
	uwX6KRl42iuM+D/uh5PdrMDt5BSPchWlODtGMJsNzGH1m0KU4buPPsF19CLO+e7yWMZyhoa7e7+
	njqB0IUQk7klC9kX71YkoyBj2s/4=
X-Google-Smtp-Source: AGHT+IF5f5jDWbiu4aJ26+hkrJW6To96uJgmyGIL+WmqbDVbCZWbe++pKvx5M9RDu3QukliDRRQlxs3XRKIjVfg5Kn0=
X-Received: by 2002:a17:906:a399:b0:a6f:b5cc:9190 with SMTP id
 a640c23a62f3a-a780b6b18d7mr416400566b.28.1720669662677; Wed, 10 Jul 2024
 20:47:42 -0700 (PDT)
MIME-Version: 1.0
References: <20240614040133.24967-1-jason-jh.lin@mediatek.com>
 <20240614040133.24967-3-jason-jh.lin@mediatek.com> <CABb+yY2bwj2BcdJLGe1ZYwCrnXL3LtcePMb=wQPaBKorBSs2yA@mail.gmail.com>
 <fc92d51cc6e55301c081ea2d589e1ba6cdd295ee.camel@mediatek.com>
 <CABb+yY1L+YGjf6O9UgPYkS2gWAdo=7QoojSAUNWC_8o7XtZQSg@mail.gmail.com>
 <1f815ff8-2b7a-48de-8b47-0bc9b3cb67ab@collabora.com> <CABb+yY1Yy8o3ofAiC-uV+gDrO3QDTWz3_XTUMai_2uyrnj-VrQ@mail.gmail.com>
 <b7ebc021d391452eaf2149976ea2d53fba3d89fc.camel@mediatek.com>
 <CABb+yY3+pnuXDK_jZMDYOAzahdSZ5iig51VqzM=FFHrFpK+9LA@mail.gmail.com>
 <4e5d4362-4940-4ba0-95aa-627b82e21e41@collabora.com> <CABb+yY3eXvJRUq7MOqB8QZ9N4aiuogaUCTfP7MerKdNbAbLkvw@mail.gmail.com>
 <895af04e45d286c38d01f48b29ad41598b7dadb7.camel@mediatek.com>
 <CABb+yY1EZOsKUR7WUX0Ni0Ukbqz0+yRHswiu07tNXtY1A1gNUQ@mail.gmail.com>
 <d6f0e7072ec0e89e573e5720fb2b9c621eb9154c.camel@mediatek.com>
 <CABb+yY0+fFw7Bg578DFEdrigVFgf4-v3qo2JVruEa3ExtvRsMg@mail.gmail.com>
 <092d917b4cae2762317a8739c874855554ae913f.camel@mediatek.com>
 <CABb+yY2-KWYORo_-ZWafyM0VJnh8-2wefvCpeDsK204qB0TchQ@mail.gmail.com>
 <3f655bc4e1e60cd5e0dfc9baa018553fa8892826.camel@mediatek.com>
 <CABb+yY2zBY_3nEYajdhRNfwb+bPMpFOvbXrqY+jM9rB6qbjJNQ@mail.gmail.com> <e860d67f578f1963d785dcc0423936fe5de20547.camel@mediatek.com>
In-Reply-To: <e860d67f578f1963d785dcc0423936fe5de20547.camel@mediatek.com>
From: Jassi Brar <jassisinghbrar@gmail.com>
Date: Wed, 10 Jul 2024 22:47:31 -0500
Message-ID: <CABb+yY0mYrUyfpNLVKZt2aDdzZPf+VjawcwVSpMG8H_=pwKLbw@mail.gmail.com>
Subject: Re: [PATCH 2/2] mailbox: mtk-cmdq: Move pm_runimte_get and put to
 mbox_chan_ops API
To: =?UTF-8?B?SmFzb24tSkggTGluICjmnpfnnb/npaUp?= <Jason-JH.Lin@mediatek.com>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>, 
	=?UTF-8?B?U2luZ28gQ2hhbmcgKOW8teiIiOWciyk=?= <Singo.Chang@mediatek.com>, 
	"chunkuang.hu@kernel.org" <chunkuang.hu@kernel.org>, =?UTF-8?B?TmFuY3kgTGluICjmnpfmrKPonqIp?= <Nancy.Lin@mediatek.com>, 
	Project_Global_Chrome_Upstream_Group <Project_Global_Chrome_Upstream_Group@mediatek.com>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
	"matthias.bgg@gmail.com" <matthias.bgg@gmail.com>, 
	"angelogioacchino.delregno@collabora.com" <angelogioacchino.delregno@collabora.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240710_204745_128713_D09D3660 
X-CRM114-Status: GOOD (  28.48  )
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

On Wed, Jul 10, 2024 at 9:00=E2=80=AFPM Jason-JH Lin (=E6=9E=97=E7=9D=BF=E7=
=A5=A5)
<Jason-JH.Lin@mediatek.com> wrote:
>
> On Fri, 2024-07-05 at 11:43 -0500, Jassi Brar wrote:
> >
> > External email : Please do not click links or open attachments until
> > you have verified the sender or the content.
> >  On Fri, Jul 5, 2024 at 1:11=E2=80=AFAM Jason-JH Lin (=E6=9E=97=E7=9D=
=BF=E7=A5=A5)
> > <Jason-JH.Lin@mediatek.com> wrote:
> > >
> > > [snip]
> > >
> > > > You may disable one to make it easy to capture.
> > > > Make sure your kernel prints have timestamps.
> > > > Over your patchset, apply the following diff and execute your
> > > > usecase.
> > > > Then share
> > > >  $ dmesg | grep Jason
> > > >
> > > > diff --git a/drivers/mailbox/mailbox.c
> > b/drivers/mailbox/mailbox.c
> > > > index bafcc7b0c0b8d..90c0620c0ae63 100644
> > > > --- a/drivers/mailbox/mailbox.c
> > > > +++ b/drivers/mailbox/mailbox.c
> > > > @@ -284,6 +284,7 @@ int mbox_send_message(struct mbox_chan *chan,
> > > > void *mssg)
> > > >  {
> > > >   int t;
> > > >
> > > > + printk("Jason %s: %p\n", __func__, (void *)chan);
> > > >   if (!chan || !chan->cl)
> > > >   return -EINVAL;
> > > >
> > > > diff --git a/drivers/mailbox/mtk-cmdq-mailbox.c
> > > > b/drivers/mailbox/mtk-cmdq-mailbox.c
> > > > index 02cef3eee35a5..6436e1b22f353 100644
> > > > --- a/drivers/mailbox/mtk-cmdq-mailbox.c
> > > > +++ b/drivers/mailbox/mtk-cmdq-mailbox.c
> > > > @@ -317,6 +317,7 @@ static int cmdq_runtime_resume(struct device
> > > > *dev)
> > > >  {
> > > >   struct cmdq *cmdq =3D dev_get_drvdata(dev);
> > > >
> > > > + printk("Jason %s: %p\n", __func__, (void *)dev);
> > > >   return clk_bulk_enable(cmdq->pdata->gce_num, cmdq->clocks);
> > > >  }
> > > >
> > > > @@ -324,6 +325,7 @@ static int cmdq_runtime_suspend(struct device
> > > > *dev)
> > > >  {
> > > >   struct cmdq *cmdq =3D dev_get_drvdata(dev);
> > > >
> > > > + printk("Jason %s: %p\n", __func__, (void *)dev);
> > > >   clk_bulk_disable(cmdq->pdata->gce_num, cmdq->clocks);
> > > >   return 0;
> > > >  }
> > > >
> > > > Thanks
> > >
> > > It seems CMDQ driver is not suspend over 100ms.
> > >
> > here are the time deltas in milli-seconds
> > 10 6005 52 85 304 59 27 203 29 24 25 38 33 57 34 20 41 28 36 48 71 35
> > 21 45 51 22 30 46 46 23 16 16 16 16 16 17 17 31 16 19 31 16 16 17 16
> > 16 16 32 17 32 17 30 21 16 32 18 30 28 25 29 24 31 27 16 17 19 34 30
> > 15 33 16 35 35 29 18 31 16 16 16 16 17 33 35 33 39 20 21 14 34 49 22
> > 42 32 13 21 24 9 130 23 32 35 31 32 16 18 31 36 37 26 14 68 76 111
> > 515
> > 452 64 484 487 497 501 507 161 336 516 486 495 504 495 504 501 500
> > 495
> > 507 495 499 505 496 502 501 502 500 495 501 507 499 499 496 506 501
> > 498 507 490 504 496 501 506 413 28 207 31731 34550 3784 30 23
> >
> > For detlas <100 we don't expect suspend because your set
> > autosuspend_delay to 100ms.
> > For deltas >100 you should have seen suspend. Apparently the changes
> > you want in the api still don't help you.
>
> I think "deltas > 100 ms not autosuspend" and "calling
> pm_runtime_get_sync() in atomic context" are 2 different problems.
>
Fixing the first may avoid the need of the second on your platform.

> >
> > Also I see messages are being submitted on 4 channels, but only for
> > the  '000000000a4d37b5' channel cmdq_mbox_send_data is ever called.
> > Unless you selectively printk only for that channel, your driver has
> > some even fundamental problems.  Maybe trace without your patch and
> > with pm_runtime_xxx commented out (to avoid stack dump).
>
> I've confirmed that autosuspend didn't work without these API patches.
>
You mean _with_ the api patches. right? Because I had suggested "Over
your patchset, apply the following diff ..."

cheers.

