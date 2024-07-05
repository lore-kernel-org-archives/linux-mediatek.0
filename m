Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF4C2C38150
	for <linux-mediatek@archiver.kernel.org>; Fri,  5 Jul 2024 16:44:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZJenFuhYTgsk0Co2eVcbS7MuCtTS3fgyqVgRI/D0SG4=; b=y/dbd9F68DvoczQi7RU07TeYjA
	gHgVy2CN+Cr1U49tAXYdr8g9hHSzJwj5/NICdeBT6WhKR98G9HB/4j8yo3Xc7gbg/rBB1svc4Me5/
	sJ8jXZkUvCAD4xRTNqznZCqYvXEMW3hKbqaUmch5pTFqqfp2fFSXyCfd/w1rydLVbYMbvy97ePb5h
	rfpLV3HKXRHKrO5hhgocJV/OhUH72PpNrDxqhJioY7dPglJCrCUDZdNUV39QKoZCL4hz89FTSLlrU
	mpF9v0vvspz5vSlO4PIg5HJkSQMdBofLKSZ3jm4dGw6va+oW5JK4isfP7tQtV1+IQ7RcuaZDhQ+x1
	XxokApWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sPm2U-0000000GRRj-30D8;
	Fri, 05 Jul 2024 16:44:02 +0000
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sPm2R-0000000GRQo-346P;
	Fri, 05 Jul 2024 16:44:01 +0000
Received: by mail-ej1-x629.google.com with SMTP id a640c23a62f3a-a77d9217e6fso72018166b.2;
        Fri, 05 Jul 2024 09:43:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720197837; x=1720802637; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZJenFuhYTgsk0Co2eVcbS7MuCtTS3fgyqVgRI/D0SG4=;
        b=e9txbeo7H86j94Tns4teeldHSKvel5eXDsHZ8nvrnhkk5WDgNp0UVRHeA4y33DjPFK
         fSqoD+h3pcp+NimkgGxpgbSDuGqEmxQY0lYOZHKrYg2aBb4vgW5s/myv1cpEzp6qKwai
         f5DMueF8oYKcIy2z0c0iR/+fQHSWj+CxvsQMpSh2v3DnLh5ueZ6xDrya6gNN+Gvq1nfo
         jo5xViU5bML7sVzaIR/Hy2FoWw6k0DnNvLqfz4wVhI9X4n0vLLGIfqc90udrU6B3+NkQ
         +LsqoKfQ5f4UYm6atr7dYgGT+etnhwgf0x55+QOzYecFTkJ92pQoO1sJx5xr6EmcC/4j
         QTkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720197837; x=1720802637;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZJenFuhYTgsk0Co2eVcbS7MuCtTS3fgyqVgRI/D0SG4=;
        b=Xa3HDKw0H5Vx+n+Zo0crtox1EUm50ZeJ2e9lBQZ6wOI+SYMBQHGelrRAePCWvdyEjF
         6WEZddxsPzzEq/itBj//wdCfkLJa5R2RrKAvfJxC4Qt0EyXjAPlnWXDTgKfZ3YomOmgo
         HQV0uTA6rBASQHWlikNUrIXomgTMWQCLWmRXgKoconN5RyCoUVo198QwCFmQk34mTzkI
         ozR6IKb7zzjsVCczfJ8eN7VvEEivUdYl0r2UhS+tsT7ygQN63qL8T3VU6g1XAoD+z3rI
         OBQN2A/yVRevoUf3PUUa83vvDyQBjMwL10imE7PID86r5tPioWjokD126iLtA+dBBcps
         AOMw==
X-Forwarded-Encrypted: i=1; AJvYcCUh6Mc2LzGs561XDdJtwsQPGx/f7U9uztT1M7t97nWF/hiexMWZMKWUeTzI+temlTxM/5WgvDZ7ShetENV+yFkcuHGDST+0upZgOVeBGeh6QYkZzMF5dW9nZExqh9SPDd5g7/9QfYKqCW886bkMUOw1DqgPp26q7NQ=
X-Gm-Message-State: AOJu0Ywc9WZ/VyGlEq5x03p8QoZGpkp0ov0xw5vE+ba2jrsVJfGeKj+M
	HGnm8ssThUqSQaI09++lgXouApoIIe9RmzK6HyUHvYhwTkcGQqOenDEkUNqaApmwrzYYCANExTb
	iYWJhfqzaOTHeb+hVgpAahRXqvbmcrm8n
X-Google-Smtp-Source: AGHT+IGcaZiB45U0dGEbln18cDiJd3sDca+NpmXy0yPlfGtDlVRVgn7AC9FOVqrMmcrnP05WjpdOAvlQdl8HbklmSXc=
X-Received: by 2002:a17:906:17c4:b0:a72:9963:eb8e with SMTP id
 a640c23a62f3a-a77ba46f9aamr317906466b.28.1720197836518; Fri, 05 Jul 2024
 09:43:56 -0700 (PDT)
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
 <CABb+yY2-KWYORo_-ZWafyM0VJnh8-2wefvCpeDsK204qB0TchQ@mail.gmail.com> <3f655bc4e1e60cd5e0dfc9baa018553fa8892826.camel@mediatek.com>
In-Reply-To: <3f655bc4e1e60cd5e0dfc9baa018553fa8892826.camel@mediatek.com>
From: Jassi Brar <jassisinghbrar@gmail.com>
Date: Fri, 5 Jul 2024 11:43:45 -0500
Message-ID: <CABb+yY2zBY_3nEYajdhRNfwb+bPMpFOvbXrqY+jM9rB6qbjJNQ@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20240705_094359_793631_2E464694 
X-CRM114-Status: GOOD (  16.70  )
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

On Fri, Jul 5, 2024 at 1:11=E2=80=AFAM Jason-JH Lin (=E6=9E=97=E7=9D=BF=E7=
=A5=A5)
<Jason-JH.Lin@mediatek.com> wrote:
>
> [snip]
>
> > You may disable one to make it easy to capture.
> > Make sure your kernel prints have timestamps.
> > Over your patchset, apply the following diff and execute your
> > usecase.
> > Then share
> >  $ dmesg | grep Jason
> >
> > diff --git a/drivers/mailbox/mailbox.c b/drivers/mailbox/mailbox.c
> > index bafcc7b0c0b8d..90c0620c0ae63 100644
> > --- a/drivers/mailbox/mailbox.c
> > +++ b/drivers/mailbox/mailbox.c
> > @@ -284,6 +284,7 @@ int mbox_send_message(struct mbox_chan *chan,
> > void *mssg)
> >  {
> >   int t;
> >
> > + printk("Jason %s: %p\n", __func__, (void *)chan);
> >   if (!chan || !chan->cl)
> >   return -EINVAL;
> >
> > diff --git a/drivers/mailbox/mtk-cmdq-mailbox.c
> > b/drivers/mailbox/mtk-cmdq-mailbox.c
> > index 02cef3eee35a5..6436e1b22f353 100644
> > --- a/drivers/mailbox/mtk-cmdq-mailbox.c
> > +++ b/drivers/mailbox/mtk-cmdq-mailbox.c
> > @@ -317,6 +317,7 @@ static int cmdq_runtime_resume(struct device
> > *dev)
> >  {
> >   struct cmdq *cmdq =3D dev_get_drvdata(dev);
> >
> > + printk("Jason %s: %p\n", __func__, (void *)dev);
> >   return clk_bulk_enable(cmdq->pdata->gce_num, cmdq->clocks);
> >  }
> >
> > @@ -324,6 +325,7 @@ static int cmdq_runtime_suspend(struct device
> > *dev)
> >  {
> >   struct cmdq *cmdq =3D dev_get_drvdata(dev);
> >
> > + printk("Jason %s: %p\n", __func__, (void *)dev);
> >   clk_bulk_disable(cmdq->pdata->gce_num, cmdq->clocks);
> >   return 0;
> >  }
> >
> > Thanks
>
> It seems CMDQ driver is not suspend over 100ms.
>
here are the time deltas in milli-seconds
10 6005 52 85 304 59 27 203 29 24 25 38 33 57 34 20 41 28 36 48 71 35
21 45 51 22 30 46 46 23 16 16 16 16 16 17 17 31 16 19 31 16 16 17 16
16 16 32 17 32 17 30 21 16 32 18 30 28 25 29 24 31 27 16 17 19 34 30
15 33 16 35 35 29 18 31 16 16 16 16 17 33 35 33 39 20 21 14 34 49 22
42 32 13 21 24 9 130 23 32 35 31 32 16 18 31 36 37 26 14 68 76 111 515
452 64 484 487 497 501 507 161 336 516 486 495 504 495 504 501 500 495
507 495 499 505 496 502 501 502 500 495 501 507 499 499 496 506 501
498 507 490 504 496 501 506 413 28 207 31731 34550 3784 30 23

For detlas <100 we don't expect suspend because your set
autosuspend_delay to 100ms.
For deltas >100 you should have seen suspend. Apparently the changes
you want in the api still don't help you.

Also I see messages are being submitted on 4 channels, but only for
the  '000000000a4d37b5' channel cmdq_mbox_send_data is ever called.
Unless you selectively printk only for that channel, your driver has
some even fundamental problems.  Maybe trace without your patch and
with pm_runtime_xxx commented out (to avoid stack dump).

-jassi

