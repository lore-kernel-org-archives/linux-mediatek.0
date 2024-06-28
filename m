Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1D8FC2BBCA
	for <linux-mediatek@archiver.kernel.org>; Fri, 28 Jun 2024 03:40:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OS9xqoZMcwoei5o8ahNVSTlTxVXDSb1SnPAKATTACBA=; b=YV8O08bcrNmgWNeJ2q/SmnU4GE
	q6rgS1E5xST8imQL/sS3R9cEm2bg6uN4pOGso+M1Y9DYzq8VLrhBj2osui5CeTPH0Gz6tUnu9sHUO
	XAIvzqkJl6qY9ctt4YL2icXqvFp4TMcNZR9J4hT+z/Tn6eXn/DYn0BuWF43Bi5dd6rYO/yvHH7Inq
	Cm20VXv2i++N9aOYRTWgfw9fn9zjDThFucOfa8L+O7i4ITgH1rKigOyX9zZlgEZiDlFracbMtg+dG
	Knp1OCVuzh7v+vm0tx7rY2JcG0Cs/yg57CKfzj+6Gq54L3M8hxAMY4xzGT2FuIZ21K3Bby7mgILQF
	AckrpYUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sN2TH-0000000CSvX-3gvJ;
	Fri, 28 Jun 2024 03:40:23 +0000
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sN2TE-0000000CSut-1nTm;
	Fri, 28 Jun 2024 03:40:21 +0000
Received: by mail-ej1-x629.google.com with SMTP id a640c23a62f3a-a689ad8d1f6so15057266b.2;
        Thu, 27 Jun 2024 20:40:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719546018; x=1720150818; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OS9xqoZMcwoei5o8ahNVSTlTxVXDSb1SnPAKATTACBA=;
        b=IoYGP0yDUGFDPukattwGwVeannrZWUMRQlkOwJ8zLcxgH9lTKLSJADB7hVQ75ipz1W
         cKUASotD1Z/RRt3wS+y/AzeIg+Bq2P6BjDLcOEWBR9Mz0N9MBx3HhJs6mT/SNepzGM6C
         EHx9ltpQFH75+96X3xw3IV25/+Kfqgd2Cus5tyejezIOzwJbISxUrPhBJvge3m/wiHlR
         LiBo69LaNNPKEZkCxbW0PtHbu3lzonNZ+9svVaGCyWCtwZK/u6k5er9T5al/RhtjIVmn
         wc+ZnY3tPwubWB/9apD5Hj/9OskxwzZviaQQGdzwaZ5cCZfBNavEEJVml5RC4eW0nOsw
         gxUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719546018; x=1720150818;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OS9xqoZMcwoei5o8ahNVSTlTxVXDSb1SnPAKATTACBA=;
        b=I4/43CgeLbntmat2CkRyUAxntwJo9OLyMWloyZQD/jYm/IfkDhNxSYAllwN1Il2n65
         /7isnC/n6clkbiY1qP+W57BLuJvHswDo4gGI0Wdwx2Annvcdp+cAKQtq2OlvRD6Bsryu
         zznCPld5nIN+iNJpnuz21FRYznurTk+YRp8IKWpUoiQozJjKFpZvB+Fm/525wU9XPU3v
         RaaXNeGxAyMPAX/Zgv7ASPjAxnUGk0id21Y4cfbb4irdVsNlfaODP7OTTS/Qri+FaFxu
         Gqtlyu8DwYFTyc+1SFsRvcKUbKKRRii3JdwkFhQFUeJGy8r5bBEbnSaVX0KKJiS5uLgE
         WjPg==
X-Forwarded-Encrypted: i=1; AJvYcCWAOIAYAcu+HgNCXpG2t9R44rlOpIlqmKOtSoHrpz42vGIYGun8Z5pkGvn2z6PaZyXfRgzskXsXD3BaieHbQNT7glVqhMOkTxbiPy6hSxXkCWg5hTeTzdRDpNJ/YuIOnlLxfJ7VV+9i7ZWyx+fPWAYM+O375PL1iSQ=
X-Gm-Message-State: AOJu0YyPtmP4qyiIwmtyAcRIFWNaXmMe/u30kQxQFjBB+ByUgC4cPTgX
	aNOoxWM4+rq31sVMgJQyxDQu8jXpFVMzsMmlopUmYYSmX9ZSPqwNpWv2rtg7fn8AB8+kXHL3m6H
	rsCPsM4fkVUuXdBsx33N/l+5KoiQ=
X-Google-Smtp-Source: AGHT+IEd4MYYyTGYgkdpW1lBusF7xMCqtMtDwYx3Q7a/fEbXrt6+jDUrcup32wPvlQ319IyI0k41m3aS8JS63hLYlkY=
X-Received: by 2002:a17:906:2a5b:b0:a6f:1785:d18 with SMTP id
 a640c23a62f3a-a7245cf2ee7mr928568166b.44.1719546017566; Thu, 27 Jun 2024
 20:40:17 -0700 (PDT)
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
 <CABb+yY1EZOsKUR7WUX0Ni0Ukbqz0+yRHswiu07tNXtY1A1gNUQ@mail.gmail.com> <d6f0e7072ec0e89e573e5720fb2b9c621eb9154c.camel@mediatek.com>
In-Reply-To: <d6f0e7072ec0e89e573e5720fb2b9c621eb9154c.camel@mediatek.com>
From: Jassi Brar <jassisinghbrar@gmail.com>
Date: Thu, 27 Jun 2024 22:40:06 -0500
Message-ID: <CABb+yY0+fFw7Bg578DFEdrigVFgf4-v3qo2JVruEa3ExtvRsMg@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20240627_204020_496744_EF08DDFF 
X-CRM114-Status: GOOD (  24.02  )
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

On Wed, Jun 26, 2024 at 4:32=E2=80=AFAM Jason-JH Lin (=E6=9E=97=E7=9D=BF=E7=
=A5=A5)
<Jason-JH.Lin@mediatek.com> wrote:
> >
> > The idea is that
> > 1) If the gap between transfers on a busy channel is ~10ms or
> > more.  And ..
> > 2) The silence on the mailbox channel is multiple of 100ms. And ...
>
> The mailbox channel would not be always busy and the gap is not
> consistent as well.
> For example, display driver calls mbox_send_message() every ~16ms while
> UI is updating in 60fps.
> If UI dose not update, display driver won't call mbox_send_message(),
> so user may not has the gap and the silence like this.
>
From your logs, send_diff only increases from 16ms if the UI is not
updating. Which makes it more prudent to release the channel.

The user needs the channel for mbox_send_message, while actual power
saving comes from cmdq_runtime_suspend/resume.
So for your target usage pattern, trace mbox_send_message() ,
cmdq_runtime_resume() and cmdq_runtime_suspend() and compare the
timestamped logs with and without this patchset.

> > 3) startup() and shutdown() are empty (as in your driver)
> >   ... then you could afford to release/suspend and resume/request
> > during the silence period because the _api_ cost of request/release
> > should not even be 1ms. Your stack may be designed to make doing that
> > difficult but numbers wise it should work.
>
> Yes, that's true, but I think we can not achieve the goal during the
> suspend/resume stage.
>
> Currently, we use the pm_runtime_get_sync() and
> pm_runtime_auto_suspend() to achieve this.
> So I think adding the PM function hook in mailbox driver is much better
> for users driver and also more flexible for the controller driver.
>
> Please correct me if there is something I misunderstood :)
>
I have a gut feeling the logs above will make it clear :)

Cheers!

