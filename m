Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75275CED273
	for <linux-mediatek@archiver.kernel.org>; Tue,  8 Oct 2024 07:18:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iF+C/VS/RV7lpIbJDSd0LEsAmluU6E4geD/jADMASpk=; b=3AIDVsqwXt1B+ag1YpnwG87eOw
	FhnK+npYDnmxkrSiT8a4E7u02Vyv84a/k3p2O5Ow1s/NjHLMXeJgtMAELCNO8j/onUBcECyHzcnC/
	61mUmkI3VHUrqrPrIMyqc1U2+avipcxMWZ1okBhzGJK4mSvn5vtVFryhnNsCjffau5TVRPxWEBPdq
	tXE3u1ODjozywj85RCM/mMSRDsptAkTh789JVQeEzimTS0bbTHUD5hEo0jM5PtfYROqI5CyzM3ate
	5GMb8yhK2xdThIOsFPLG6jC/pOgv+9DVHJ6pQrCbMADuynEMlDOp37FsIUemEZA3N/hliDl8+exyB
	GGqylVRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sy4UI-00000004lcR-1aTq;
	Tue, 08 Oct 2024 07:18:30 +0000
Received: from mail-lf1-x12b.google.com ([2a00:1450:4864:20::12b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sy4Ta-00000004lWe-0Tqq
	for linux-mediatek@lists.infradead.org;
	Tue, 08 Oct 2024 07:17:47 +0000
Received: by mail-lf1-x12b.google.com with SMTP id 2adb3069b0e04-5389917ef34so6037103e87.2
        for <linux-mediatek@lists.infradead.org>; Tue, 08 Oct 2024 00:17:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1728371864; x=1728976664; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iF+C/VS/RV7lpIbJDSd0LEsAmluU6E4geD/jADMASpk=;
        b=FIoleWSBd8ihEetJY1ehK5FfplPMwizzSSWMGzxmVkQhTv1iyvFZGItZDxpcktPZ0c
         rZRvdwC3B3X8ICjblaOWUaqLRLCsOoUGM3LWSlZX//DuNx3h7g9m7ZXyjfDwoIt9h5P5
         +A74xHQLL3/MIqWUm6ZC7RKD6pkOGmbW+n6xU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728371864; x=1728976664;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iF+C/VS/RV7lpIbJDSd0LEsAmluU6E4geD/jADMASpk=;
        b=wPW3IVinzt4SBweHMBQQErD45ksm8UrkHw4JseBivRHJMrZpAo3xrh9KtSQarCp8r5
         7eR/aAw7NGAoVMEWTHrQn+/T/ePINteqnE8fXkOGfvFoH9wbQ5FeT+ctBO+tKWAF3VlP
         2ZwnnHGvTOGP9ETdXPMq65PLLGDlWpS6P4zEh4OWAwXS6fiuaUEnVBW9KY9Nz9lHhrQD
         LMbOqoUbRDO9RRes1x1lxR21+awRpkiMFelqYvFzZF2t5E6C6N6i4Nh6q1sUyAiO4Lfx
         gTJ1rHP82lOPXlxF8npdI0isnSS0Ya4X0UmJ7JXwMTfvzE5xZQklez7RObdGwM9kZPll
         H07A==
X-Forwarded-Encrypted: i=1; AJvYcCWN8N6rHc8XMxPVRC5W+ZTAEC63pJHam+8qdWlygYSW7yNLiehLlnzgNn67I/fyv9ycE4MW72d73BEULJlqiQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YwEWT+4L8lhFyYRWVe8wYyD5eliReZIkolPBkXJQwYykOGnoKub
	BVSVeL+djn+H416FmKFtg8ynyqrRZQY+cZ6RorWDHk/RlaFG8A0o1nTynFFScZZ3yn3qjo+j2y+
	34oGQIIPh3BcTgB6tHILeF5Tu79nZhpWFSNe/
X-Google-Smtp-Source: AGHT+IGJdYFdMr2wNoGuz1+xxfBC2TiAmu1OrSreQ10rgif0gERGJQsWqZVudZnKhPo9WSkHp9cPdJ5LNcY3ltFTmbI=
X-Received: by 2002:a05:6512:104b:b0:530:aa3e:f3c with SMTP id
 2adb3069b0e04-539ab87476dmr7294478e87.14.1728371863854; Tue, 08 Oct 2024
 00:17:43 -0700 (PDT)
MIME-Version: 1.0
References: <20241008064716.14670-1-jason-jh.lin@mediatek.com>
 <CAGb2v67qnJ=ZNYziKe_4WU9KeMUpWLsOn2uoze1FLq4mH8m7Rw@mail.gmail.com> <6d5e9a84a3b91c82a8f16965872f7485236cd3f2.camel@mediatek.com>
In-Reply-To: <6d5e9a84a3b91c82a8f16965872f7485236cd3f2.camel@mediatek.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Tue, 8 Oct 2024 15:17:32 +0800
Message-ID: <CAGXv+5EAoNdwsma_5C0q1gXs2B4Zcz8nAuwYFcvtDPPBs6tFow@mail.gmail.com>
Subject: Re: [PATCH v10 0/5] Fix degradation problem of alpha blending series
To: =?UTF-8?B?SmFzb24tSkggTGluICjmnpfnnb/npaUp?= <Jason-JH.Lin@mediatek.com>
Cc: "wens@kernel.org" <wens@kernel.org>, 
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"alpernebiyasak@gmail.com" <alpernebiyasak@gmail.com>, 
	=?UTF-8?B?U2luZ28gQ2hhbmcgKOW8teiIiOWciyk=?= <Singo.Chang@mediatek.com>, 
	"chunkuang.hu@kernel.org" <chunkuang.hu@kernel.org>, 
	=?UTF-8?B?U2hhd24gU3VuZyAo5a6L5a2d6KyZKQ==?= <Shawn.Sung@mediatek.com>, 
	=?UTF-8?B?TmFuY3kgTGluICjmnpfmrKPonqIp?= <Nancy.Lin@mediatek.com>, 
	"dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, 
	Project_Global_Chrome_Upstream_Group <Project_Global_Chrome_Upstream_Group@mediatek.com>, 
	"yassine.oudjana@gmail.com" <yassine.oudjana@gmail.com>, "me@adamthiede.com" <me@adamthiede.com>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241008_001746_213785_320C9F09 
X-CRM114-Status: GOOD (  23.39  )
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

On Tue, Oct 8, 2024 at 3:07=E2=80=AFPM Jason-JH Lin (=E6=9E=97=E7=9D=BF=E7=
=A5=A5)
<Jason-JH.Lin@mediatek.com> wrote:
>
> On Tue, 2024-10-08 at 14:52 +0800, Chen-Yu Tsai wrote:
> >
> > External email : Please do not click links or open attachments until
> > you have verified the sender or the content.
> >  On Tue, Oct 8, 2024 at 2:47=E2=80=AFPM Jason-JH.Lin <
> > jason-jh.lin@mediatek.com> wrote:
> > >
> > > Some SoCs do not support the ignore_pixl_alpha flag, which breaks
> > the
> > > XRGB8888 format. Some SoCs do not support pre-multiplied pixel
> > formats
> > > and extending configuration of OVL pre-multiplied color formats,
> > > such as MT8173.
> > >
> > > Fix the SoC degradation problem by this sreies.
> >
> > Tested-by: Chen-Yu Tsai <wenst@chromium.org>
> >
> > > ---
> > >
> > > Change in v10:
> > > 1. Fix the commit message and comment for OVL_CON_AEN
> >
> > Please carry tested-by tags from people for cosmetic changes such as
> > this.
> >
> OK, I'm sorry about that.
>
> I thought the cover letter won't exist when the whole series go into
> the Linux mainline tree.
>
> But it still can be seen on the patchwork.

Yes. It's simply because people are lazy and don't want to reply to every
patch. Then I guess the tools were changed to support this behavior. :D

> So I'll remember to do this next time. Thanks again!
>
> Regards,
> Jason-JH.Lin
>
> ************* MEDIATEK Confidentiality Notice ********************
> The information contained in this e-mail message (including any
> attachments) may be confidential, proprietary, privileged, or otherwise
> exempt from disclosure under applicable laws. It is intended to be
> conveyed only to the designated recipient(s). Any use, dissemination,
> distribution, printing, retaining or copying of this e-mail (including it=
s
> attachments) by unintended recipient(s) is strictly prohibited and may
> be unlawful. If you are not an intended recipient of this e-mail, or beli=
eve
> that you have received this e-mail in error, please notify the sender
> immediately (by replying to this e-mail), delete any and all copies of
> this e-mail (including any attachments) from your system, and do not
> disclose the content of this e-mail to any other person. Thank you!

