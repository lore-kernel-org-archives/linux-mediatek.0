Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6CF76C30653
	for <linux-mediatek@archiver.kernel.org>; Wed,  3 Jul 2024 19:07:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rzqLcYmNlhaEa9iw+jtKoQZyVNKKD3jdk0VbO2iS/r8=; b=WWtCnekGYf6D+yT1xd72RTixEr
	FPmpaLJKpGz0Yma6X+iUNrS+sQeX6taMYMMLpPfgw1pHnKeZImOcJJWhfvprrt7N9/sCDyONmoGwo
	i+lXxrDVvid8BacuIJITruf7JSvT3C6rr5hYkbPZjtZ/+8Z+ieLaCTM0YRmHrDirHf5ImCJ/fxg0f
	njX8D4X7SXaTfjFFk3X27oSDXPBQVge3pXZCiKO+V4Df9VDv20XV54vMkDdofZnU3OGCTy/cCI+Rc
	jK6LtgoyVAvR0kFSdzP5PsMq7ZCGjIME1GXkrBdFzvehkSBGWtAjP39JarNx9/APZSQzbT0KGgpvM
	ULIIJLEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sP5Jz-0000000BEoD-0VLJ;
	Wed, 03 Jul 2024 19:07:15 +0000
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sP5Jw-0000000BEnd-0muu;
	Wed, 03 Jul 2024 19:07:14 +0000
Received: by mail-ed1-x530.google.com with SMTP id 4fb4d7f45d1cf-57ccd1111aeso4466966a12.0;
        Wed, 03 Jul 2024 12:07:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720033629; x=1720638429; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rzqLcYmNlhaEa9iw+jtKoQZyVNKKD3jdk0VbO2iS/r8=;
        b=ajNoW9+vuFWoFRatveyhFtJvtOR3+ffgrPbJWYNEkqLXvnOLrCo+K3NWDRBRM2PTvs
         2ET5zYet8gUQhn5WnhGR8X/kEqQLmXy/R0Gic7nSC2t2iM/SYJoEPM1Mduhur4JUKNhB
         vWLDt78LJp90SILcaRpa30GAsvZf0QfvN0CnR1ofMeIMJNjD080Kmo0Q9Fs2T3eesM8z
         +D5Zous8X4fj+/CerWmsiv07SNmNTFvSKpN2lZNMQ/m3xtNlXha7z3wv4sHVZqslNJHX
         vxVPpU3QI6odEHDkocizXUKVZCu3tL1cDlcGW2sVrLT1ABPu4BWXWveKWBeS6ztnCVum
         MjVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720033629; x=1720638429;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rzqLcYmNlhaEa9iw+jtKoQZyVNKKD3jdk0VbO2iS/r8=;
        b=RBiE6p9jPgyEJzOjea+eRcW8mDlPnNBB8Zeo9NVXBuywRBURM1XBPJYeh9/yYDdpg2
         bIU5d+e2wzsYOLHhRj+KOKbwoqd3P7J4106JxReZyVzRowFZR1ALhNQgOgCJi8IXIk+e
         VoaAA+3SowrzRTVzLKZnZaDWFLqaYVuCN99jFbdkW8YYh0CifC0tRmtITx56ndwVTF2V
         PoL5Hal4EG2clQKGRbZidFn7dezZ9daWTdk4RPy9r/3PIns4nAW95Sfw4/qDOEuEqUO/
         xQbsWgkyigGaD/orMQbuWRIspf6LbcTfyD2Go2OHILIQaC8luw8Koycd3o5Rxj3F/GyN
         RlpA==
X-Forwarded-Encrypted: i=1; AJvYcCURI4nsy5urYkQCIfk2HXq0Iyp+4ZGndn0/c+FWXmOzypLOMF0lyjjCnRUmUVhjjzt/O7aVzT+vNGKhRBnK6k+5Dn8T3KBN1aeEWjSi/XWTklDQfgZo7MzC8GFltzf8Tgonpqpi6ysxn7eN7wpKhnGm3ftqb+JYyyE=
X-Gm-Message-State: AOJu0YzTtHDrFtPi/ceMRbHHNPo2vzlHUztTS1L3kyirlWOcfH0zN6YV
	xeGe/MpibCoVWfDIaXIeULA0KLlC/b70ZWj2He9Ks/OiwDXXnAT0MVCpqNEUXYdD9QcUF0zQQej
	LUcNp+kCoyb/9mGadBr00BcsyhXs=
X-Google-Smtp-Source: AGHT+IFTvqGKg+d2P1MX6zFoO20UuDNnBH0NZJoGdJm/F+Ghp9HnoLsYjQOjQhwonC/vbbujybApLnU1klWdkMuzG50=
X-Received: by 2002:a17:906:fccc:b0:a72:548a:6f42 with SMTP id
 a640c23a62f3a-a751445451dmr802270766b.18.1720033629247; Wed, 03 Jul 2024
 12:07:09 -0700 (PDT)
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
 <CABb+yY0+fFw7Bg578DFEdrigVFgf4-v3qo2JVruEa3ExtvRsMg@mail.gmail.com> <092d917b4cae2762317a8739c874855554ae913f.camel@mediatek.com>
In-Reply-To: <092d917b4cae2762317a8739c874855554ae913f.camel@mediatek.com>
From: Jassi Brar <jassisinghbrar@gmail.com>
Date: Wed, 3 Jul 2024 14:06:57 -0500
Message-ID: <CABb+yY2-KWYORo_-ZWafyM0VJnh8-2wefvCpeDsK204qB0TchQ@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20240703_120712_252405_9F0CD8CC 
X-CRM114-Status: GOOD (  25.56  )
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

On Wed, Jul 3, 2024 at 11:41=E2=80=AFAM Jason-JH Lin (=E6=9E=97=E7=9D=BF=E7=
=A5=A5)
<Jason-JH.Lin@mediatek.com> wrote:
>
> On Thu, 2024-06-27 at 22:40 -0500, Jassi Brar wrote:
> >
> > External email : Please do not click links or open attachments until
> > you have verified the sender or the content.
> >  On Wed, Jun 26, 2024 at 4:32=E2=80=AFAM Jason-JH Lin (=E6=9E=97=E7=9D=
=BF=E7=A5=A5)
> > <Jason-JH.Lin@mediatek.com> wrote:
> > > >
> > > > The idea is that
> > > > 1) If the gap between transfers on a busy channel is ~10ms or
> > > > more.  And ..
> > > > 2) The silence on the mailbox channel is multiple of 100ms. And
> > ...
> > >
> > > The mailbox channel would not be always busy and the gap is not
> > > consistent as well.
> > > For example, display driver calls mbox_send_message() every ~16ms
> > while
> > > UI is updating in 60fps.
> > > If UI dose not update, display driver won't call
> > mbox_send_message(),
> > > so user may not has the gap and the silence like this.
> > >
> > From your logs, send_diff only increases from 16ms if the UI is not
> > updating. Which makes it more prudent to release the channel.
> >
> > The user needs the channel for mbox_send_message, while actual power
> > saving comes from cmdq_runtime_suspend/resume.
> > So for your target usage pattern, trace mbox_send_message() ,
> > cmdq_runtime_resume() and cmdq_runtime_suspend() and compare the
> > timestamped logs with and without this patchset.
> >
> [snip]
>
> I realized that we have 2 cmdq drivers:
> display uses 10320000.mailbox and imgsys uses 10330000.mailbox
>
You may disable one to make it easy to capture.
Make sure your kernel prints have timestamps.
Over your patchset, apply the following diff and execute your usecase.
Then share
 $ dmesg | grep Jason

diff --git a/drivers/mailbox/mailbox.c b/drivers/mailbox/mailbox.c
index bafcc7b0c0b8d..90c0620c0ae63 100644
--- a/drivers/mailbox/mailbox.c
+++ b/drivers/mailbox/mailbox.c
@@ -284,6 +284,7 @@ int mbox_send_message(struct mbox_chan *chan, void *mss=
g)
 {
  int t;

+ printk("Jason %s: %p\n", __func__, (void *)chan);
  if (!chan || !chan->cl)
  return -EINVAL;

diff --git a/drivers/mailbox/mtk-cmdq-mailbox.c
b/drivers/mailbox/mtk-cmdq-mailbox.c
index 02cef3eee35a5..6436e1b22f353 100644
--- a/drivers/mailbox/mtk-cmdq-mailbox.c
+++ b/drivers/mailbox/mtk-cmdq-mailbox.c
@@ -317,6 +317,7 @@ static int cmdq_runtime_resume(struct device *dev)
 {
  struct cmdq *cmdq =3D dev_get_drvdata(dev);

+ printk("Jason %s: %p\n", __func__, (void *)dev);
  return clk_bulk_enable(cmdq->pdata->gce_num, cmdq->clocks);
 }

@@ -324,6 +325,7 @@ static int cmdq_runtime_suspend(struct device *dev)
 {
  struct cmdq *cmdq =3D dev_get_drvdata(dev);

+ printk("Jason %s: %p\n", __func__, (void *)dev);
  clk_bulk_disable(cmdq->pdata->gce_num, cmdq->clocks);
  return 0;
 }

Thanks

