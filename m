Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 277E9C27C53
	for <linux-mediatek@archiver.kernel.org>; Wed, 19 Jun 2024 15:38:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GpBmZ3ib4xI7+SnubC1rq/jcP2mXeb9MXah8Iw53YHI=; b=HWhwE2wuQ0ILS4mCd54gkS18a1
	lVzV9bvjvCfZ/IO35fbUht8qDH7ei5uz363113dSDre5m0H7AqeDeHxLL0zPgME51w1XGBAWVQFm0
	J4W7QmlDMz4XeZlfFVcQPPz3Nz0ojn95I5vrlfEtFv2L+3I2j37j6wYH/OR3LqvzGsVEkaAufipb1
	mARtgb4/riwWj4g6v1NUYbA30DgwjClfvC6CvV6BdmGbCK7pCElV29mAzyTYvy62nlgbXM6z/Kzmh
	GQ+GllWMdL9ptMIzuVM8lvPq73xUxasJIsMwuJ0oeoUeP+da/9Knwb9V/oMlqrGlMp3jnNFpFstfx
	OuptdNeQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJxNu-00000001ptC-3qYQ;
	Wed, 19 Jun 2024 15:38:06 +0000
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJxNr-00000001prN-0K06;
	Wed, 19 Jun 2024 15:38:05 +0000
Received: by mail-ed1-x52e.google.com with SMTP id 4fb4d7f45d1cf-57d1d614049so118194a12.1;
        Wed, 19 Jun 2024 08:37:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718811475; x=1719416275; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GpBmZ3ib4xI7+SnubC1rq/jcP2mXeb9MXah8Iw53YHI=;
        b=Gi2Ar4OYf9OWhqsYiIwKh7X55zdJ/piQQrr9mf2bz8VeGL+Bip0a4k+mwjaSsLUzrk
         4r3Qju7orFm2uf0etFoHWAeNPWcs0nu2Rhzqb6za7dO9kZCUa+jOqXg9uo/QPZp4amLp
         EIOhFaUSKKdT8VdsA85gV85UeVfv59cEkT+VWJZ1yCQMRJwilMugWgn2ZPZN7Nw4ImQb
         VQ1zAu0tmhSQ1U+V7pZgymMf0k+Io04J8gliVrVs/5nvVqId1OQ+t/eSK04NAPEfdbx+
         DNJEEyElR0yLygk7vQlZX/mEe82ZujUc7i1cqo4d1vgRm+p9+RBCwQSwk0QteI0BP7ka
         /MYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718811475; x=1719416275;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GpBmZ3ib4xI7+SnubC1rq/jcP2mXeb9MXah8Iw53YHI=;
        b=kFwnG2kE/sWPQqksY6+a0JWL47gRxfnnUvNIskmtqHdqP+QFaPW0PZmeLX/sA8gJDb
         QWuPraKp6NJ6fTb+1aYvcF63KkpjOqcCXEmufq1OtA9LNUVM8Wvh04Te1Fkpn7fQHDXn
         1OBUpIuRqkpccpA7Hxv7BE/+KSoFRtUkt3l1p86Q4uy7fwMjVFoZCFgQL5Dwb+MyPmMI
         Hp/V+CRIcHZn3M7QeaBsa1+F/dh5qv77rarOzJ6d3JpKSI4KJDKsvnQ2o8RJrgSy5Szo
         HYt4twI3ZPoAnG0jkriSrHfLYc/5N5qRaWRzgHIilY36CvNKstZzyt4r9hXwo36ShTuy
         5u6w==
X-Forwarded-Encrypted: i=1; AJvYcCWCSr7kJqsXDp+7sZqqZ3CYN8Bho7XsuIZ1lOMcyO76IwbvOFc1hnDO514eA+0XINbNw9DA7pJeeb0kYYLN7/Bjm/UEmded+PuyJ91Eub1N44ctmnvDH7eAUACCETbSehFB4W/8JdArbK7IsfWXXhtpaAPUx8X0GS8=
X-Gm-Message-State: AOJu0YxgmjD6vQHgimU3Si3jLy/O3vQ94soaBHSxNI4S6dmaHLeroSJV
	IaoSQUCdan/42ljbAbjvaBk6sS6YWDzjLxJiBbwgNLJ/kpgVs48aabpdNX2k8W0Jh8jHlkSOXxK
	Qeem7VGjW/8oGHjhizgzyIVQ3C7w=
X-Google-Smtp-Source: AGHT+IE0loaN0axTBDRLmzig04cOZXee4WarvcqGqZjF4nQ6GQ8v7otsT0YAWBCuN5/c+dE0PPHGZct/sGaadcz/Ps0=
X-Received: by 2002:a17:907:7293:b0:a6f:6f4a:b25c with SMTP id
 a640c23a62f3a-a6fab60a2acmr237107666b.14.1718811474952; Wed, 19 Jun 2024
 08:37:54 -0700 (PDT)
MIME-Version: 1.0
References: <20240614040133.24967-1-jason-jh.lin@mediatek.com>
 <20240614040133.24967-3-jason-jh.lin@mediatek.com> <CABb+yY2bwj2BcdJLGe1ZYwCrnXL3LtcePMb=wQPaBKorBSs2yA@mail.gmail.com>
 <fc92d51cc6e55301c081ea2d589e1ba6cdd295ee.camel@mediatek.com>
 <CABb+yY1L+YGjf6O9UgPYkS2gWAdo=7QoojSAUNWC_8o7XtZQSg@mail.gmail.com> <1f815ff8-2b7a-48de-8b47-0bc9b3cb67ab@collabora.com>
In-Reply-To: <1f815ff8-2b7a-48de-8b47-0bc9b3cb67ab@collabora.com>
From: Jassi Brar <jassisinghbrar@gmail.com>
Date: Wed, 19 Jun 2024 10:38:15 -0500
Message-ID: <CABb+yY1Yy8o3ofAiC-uV+gDrO3QDTWz3_XTUMai_2uyrnj-VrQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] mailbox: mtk-cmdq: Move pm_runimte_get and put to
 mbox_chan_ops API
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: =?UTF-8?B?SmFzb24tSkggTGluICjmnpfnnb/npaUp?= <Jason-JH.Lin@mediatek.com>, 
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>, 
	=?UTF-8?B?U2luZ28gQ2hhbmcgKOW8teiIiOWciyk=?= <Singo.Chang@mediatek.com>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"chunkuang.hu@kernel.org" <chunkuang.hu@kernel.org>, =?UTF-8?B?TmFuY3kgTGluICjmnpfmrKPonqIp?= <Nancy.Lin@mediatek.com>, 
	Project_Global_Chrome_Upstream_Group <Project_Global_Chrome_Upstream_Group@mediatek.com>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
	"matthias.bgg@gmail.com" <matthias.bgg@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240619_083803_141671_624452C7 
X-CRM114-Status: GOOD (  14.31  )
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

On Wed, Jun 19, 2024 at 3:18=E2=80=AFAM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
> Il 18/06/24 17:59, Jassi Brar ha scritto:
.....

> For example, when static content is displayed on screen, the CMDQ mailbox=
 never
> gets shut down, but no communication happens for a relatively long time; =
the
> overhead of actually shutting down the mailbox and setting it back up wou=
ld be
> increasing latency in an unacceptable manner.
>
Hmm...  in your driver,  startup() is _empty_   and  shutdown() is all
under a spin-lock with irqs disabled, so that too shouldn't be
expensive. Right?
Then what causes unacceptable latencies?

> This is why I opted for autosuspend - it's only bringing down certain clo=
cks for
> the CMDQ HW, adding up a bit of power saving to the mix which, for some u=
se cases
> such as mobile devices with relatively small batteries, is definitely imp=
ortant.
>
> I'll also briefly (and only briefly) mention that 120Hz displays are alre=
ady a
> common thing and in this case the gap between TX and ACK is ~8.33ms inste=
ad, let
> alone that displays with a framerate of more than 120Hz also do exist eve=
n though
> they're less common.
>
I don't know how even busier channels help your point.

> All of the above describes a few of the reasons why autosuspend is a good=
 choice
> here, instead of a shutdown->startup flow.
> And again - I can place some bets that PM would also be applicable to SoC=
s from
> other vendors as well, with most probably different benefits (but still w=
ith some
> power related benefits!) compared to MediaTek.
>
Sure, if some platform _actually_ has a high channel
startup()/shutdown() cost, it may need finer PM control. And I have a
way for that, but even with that I am sure someone from MTK will
realize they didn't need that.

Thanks.

