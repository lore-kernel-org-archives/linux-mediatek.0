Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20D4BC2BD09
	for <linux-mediatek@archiver.kernel.org>; Mon, 24 Jun 2024 17:46:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sZYo2+ECZA8zTSTbRF5VYWEcTe4tY+q+w5/GiTenvpA=; b=mNF029bWDgDdzyjQU+iuV4IoX2
	42/UrT32nRHAiuMYZYaIS3X/hdozV8bUL9hieZUjmYkjogl7lwSwdWX4m36vyY0ha08zefJBJF8Gf
	/RpSIT6ox3ouEkAdtQdVT145btW2867EBLoAMwRiAr4zuhS7sDnD9HR8sfM9w4Nncczzv2IcCb7TN
	V1P/D2SKNt6gQ4fxLDsFkQwXEUjeyJmYPV91QxuDHV5oWlPbXVesN86uhN16QTWjgFKosRJaCmXmi
	weVMzg6d+/29yLv5hu5VamTsndvtSUBCNGfdbMPsRgz9A1nOXZMCn1yBIh21uYm2ypUo0itP3w4/Q
	6j+MNPSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sLnlS-000000008mQ-2aVt;
	Mon, 24 Jun 2024 17:46:02 +0000
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sLnlP-000000008ke-2miG;
	Mon, 24 Jun 2024 17:46:01 +0000
Received: by mail-ed1-x529.google.com with SMTP id 4fb4d7f45d1cf-57cb9efd8d1so9120099a12.0;
        Mon, 24 Jun 2024 10:45:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719251157; x=1719855957; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sZYo2+ECZA8zTSTbRF5VYWEcTe4tY+q+w5/GiTenvpA=;
        b=QOWWfFIp9/o/A8x3k79Mu+xyRKn3FxjwJA0/iTIm/9Cm9wEVSsYxM3VSzM8Mgwyw7T
         /ssmg3WLaKyUL+AFVBtRj16bpgqeTeYzEUlfo/x/0EuKdpgDquC5vH1M3XNKPYK/yVe6
         ycL9BCF8zC92FHrWDTuZkW4lBWi3oGcEkt0+r4il7d6mjQvCE4+gAFGRee9x7W+2ktBT
         CL/pmsdG/uNIp2Rj0EVcgyyyTb0qBiEZCjSDirj3Ax/N3qZgQttIvhOeB7zXEUH596/u
         +8zdN5IDWxuUDC0NSkO7IsiskLtw+LUn7q07y/9E64PqiOOTNLWtv00q44R6l2xqVQXZ
         LLpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719251157; x=1719855957;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sZYo2+ECZA8zTSTbRF5VYWEcTe4tY+q+w5/GiTenvpA=;
        b=L+/X+0RWvtasZxFr1angUvnvz54fFjLliHkrTmceJ906+w/H6FTKRFGuSsxzRTByDT
         g2dUhkYB19PME+xdTCAVJ9q9FjXwh5I1/F8gvmyHmlvxSx3x5EJurgcDAXhgcv70dcoB
         4YBYc672Go0EmIGac7jQtgptfsveMA4xaI64OV3NtkWGmgI4Cxp0MvM4NeyoS2Qvaxxn
         MehYHAPLoQ5wJzTcW+2rmaB1lI7Uor2ZYrDkc8fAqMwXKG22M0kCiZTR1szTgAZ01laM
         cLop+0pUizivjpndIb2x4+gyLtftCL7fsUc0LCFbhOzPinxdbFa7/fT1sKvCToAoOI85
         qGiQ==
X-Forwarded-Encrypted: i=1; AJvYcCUDCgc9us/GU+GEFUa4qkz/3y9Jk5Ejup/ZIlTXDzgpGj3z3+BmoMbr163tjueldZ4Yo/+y6FidIzanl5Q6jYFGZ+nipwhBbRfrHILI4LoLxOIY3lranZ51j8Np8cx5XCHWQqoaVp+SyIqOQtQZXQb4KRwoqcUy7/M=
X-Gm-Message-State: AOJu0Ywsui+N3Yq4X8O9AKUOfZ6N+CuOjig0P6t/6HYq/e+TPvKbMH3D
	lsf3qwE4SPPtvjbnqgXTroKNPGPoeNSR7Bj0Lfr92d72nZa8HGTIxBQ64HJEotQ73M9RbNQEcTS
	WWCqQ1Rl3/jwRUjyA2yItN4PZvZc=
X-Google-Smtp-Source: AGHT+IEK2tK6rYzn4sB+7rfr1nwSQOK4Jcvm8x3U7EK8lUjz2q4DDHHncsAyU5rn5neLiJRN/nDaFSTXyuOY9lpfqgk=
X-Received: by 2002:a17:906:abd2:b0:a6f:e2f1:537b with SMTP id
 a640c23a62f3a-a700e706f07mr511078566b.28.1719251156998; Mon, 24 Jun 2024
 10:45:56 -0700 (PDT)
MIME-Version: 1.0
References: <20240614040133.24967-1-jason-jh.lin@mediatek.com>
 <20240614040133.24967-3-jason-jh.lin@mediatek.com> <CABb+yY2bwj2BcdJLGe1ZYwCrnXL3LtcePMb=wQPaBKorBSs2yA@mail.gmail.com>
 <fc92d51cc6e55301c081ea2d589e1ba6cdd295ee.camel@mediatek.com>
 <CABb+yY1L+YGjf6O9UgPYkS2gWAdo=7QoojSAUNWC_8o7XtZQSg@mail.gmail.com>
 <1f815ff8-2b7a-48de-8b47-0bc9b3cb67ab@collabora.com> <CABb+yY1Yy8o3ofAiC-uV+gDrO3QDTWz3_XTUMai_2uyrnj-VrQ@mail.gmail.com>
 <b7ebc021d391452eaf2149976ea2d53fba3d89fc.camel@mediatek.com>
 <CABb+yY3+pnuXDK_jZMDYOAzahdSZ5iig51VqzM=FFHrFpK+9LA@mail.gmail.com> <4e5d4362-4940-4ba0-95aa-627b82e21e41@collabora.com>
In-Reply-To: <4e5d4362-4940-4ba0-95aa-627b82e21e41@collabora.com>
From: Jassi Brar <jassisinghbrar@gmail.com>
Date: Mon, 24 Jun 2024 12:45:45 -0500
Message-ID: <CABb+yY3eXvJRUq7MOqB8QZ9N4aiuogaUCTfP7MerKdNbAbLkvw@mail.gmail.com>
Subject: Re: [PATCH 2/2] mailbox: mtk-cmdq: Move pm_runimte_get and put to
 mbox_chan_ops API
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: =?UTF-8?B?SmFzb24tSkggTGluICjmnpfnnb/npaUp?= <Jason-JH.Lin@mediatek.com>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>, 
	=?UTF-8?B?U2luZ28gQ2hhbmcgKOW8teiIiOWciyk=?= <Singo.Chang@mediatek.com>, 
	"chunkuang.hu@kernel.org" <chunkuang.hu@kernel.org>, =?UTF-8?B?TmFuY3kgTGluICjmnpfmrKPonqIp?= <Nancy.Lin@mediatek.com>, 
	Project_Global_Chrome_Upstream_Group <Project_Global_Chrome_Upstream_Group@mediatek.com>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
	"matthias.bgg@gmail.com" <matthias.bgg@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240624_104559_867985_BBEE0430 
X-CRM114-Status: GOOD (  35.41  )
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

On Mon, Jun 24, 2024 at 6:29=E2=80=AFAM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> Il 20/06/24 16:39, Jassi Brar ha scritto:
> > On Thu, Jun 20, 2024 at 1:33=E2=80=AFAM Jason-JH Lin (=E6=9E=97=E7=9D=
=BF=E7=A5=A5)
> > <Jason-JH.Lin@mediatek.com> wrote:
> >>
> >> On Wed, 2024-06-19 at 10:38 -0500, Jassi Brar wrote:
> >>>
> >>> External email : Please do not click links or open attachments until
> >>> you have verified the sender or the content.
> >>>   On Wed, Jun 19, 2024 at 3:18=E2=80=AFAM AngeloGioacchino Del Regno
> >>> <angelogioacchino.delregno@collabora.com> wrote:
> >>>> Il 18/06/24 17:59, Jassi Brar ha scritto:
> >>> .....
> >>>
> >>>> For example, when static content is displayed on screen, the CMDQ
> >>> mailbox never
> >>>> gets shut down, but no communication happens for a relatively long
> >>> time; the
> >>>> overhead of actually shutting down the mailbox and setting it back
> >>> up would be
> >>>> increasing latency in an unacceptable manner.
> >>>>
> >>> Hmm...  in your driver,  startup() is _empty_   and  shutdown() is
> >>> all
> >>> under a spin-lock with irqs disabled, so that too shouldn't be
> >>> expensive. Right?
> >>> Then what causes unacceptable latencies?
> >>>
> >>
> >> I found that the BUG report only occurred when opening the camera APP.
> >> Maybe something in imgsys_cmdq_sendtask() is too expensive or somewher=
e
> >> else in imgsys driver.
> >>
> > If you move anything from submit() into startup(), which is once per
> > lifetime of a channel, it will only make imgsys_cmdq_sendtask()
> > cheaper.
> > Btw, the imgsys code is not public, I don't know how it looks.
> >
> >
> >> I'm wondering why this BUG report is not occurred in display use case
> >> which is more frequent than imgsys use case.
> >> Does this mean sleep() is not always called in pm_runtime_get_sync()
> >> and if we can guarantee this sleep() won't be called, then using
> >> pm_runtime_get_sync() in atomic context is OK?
> >>
> > Instead of hacking around, maybe try using startup() and shutdown()
> > which is for such uses? Maybe request/release channel as part of RPM
> > in your client driver if you are worried about the noise?
> >
> >
> >>>> This is why I opted for autosuspend - it's only bringing down
> >>> certain clocks for
> >>>> the CMDQ HW, adding up a bit of power saving to the mix which, for
> >>> some use cases
> >>>> such as mobile devices with relatively small batteries, is
> >>> definitely important.
> >>>>
> >>>> I'll also briefly (and only briefly) mention that 120Hz displays
> >>> are already a
> >>>> common thing and in this case the gap between TX and ACK is ~8.33ms
> >>> instead, let
> >>>> alone that displays with a framerate of more than 120Hz also do
> >>> exist even though
> >>>> they're less common.
> >>>>
> >>> I don't know how even busier channels help your point.
> >>>
> >>>> All of the above describes a few of the reasons why autosuspend is
> >>> a good choice
> >>>> here, instead of a shutdown->startup flow.
> >>>> And again - I can place some bets that PM would also be applicable
> >>> to SoCs from
> >>>> other vendors as well, with most probably different benefits (but
> >>> still with some
> >>>> power related benefits!) compared to MediaTek.
> >>
> >> I agree with Angelo's point!
> >>
> > Ok, but you or Angelo still don't explain "unacceptable latencies"
> > when your startup() and shutdown() are empty. You just want api
> > changed, which we can but at least do you part and tell me where the
> > bottleneck (unexpected latency) comes from.
> >
>
> "I want numbers" is a sensible request, honestly I would do the same so I=
 totally
> understand that.
>
> Jason, can you please perform latency measurements on 60Hz and *especiall=
y* ISP/cam
> cases while "continuously" calling startup() and shutdown() for every pow=
er saving
> operation?
>
To be clear, do with the mailbox channel that you do with the clocks
now, because your startup() is literally and shutdown() is practically
empty.
Call shutdown() when no request has come in for a while, so you know
the client has quiesced likely. So try putting request/release in
higher level RPM with autosuspend.

thanks

