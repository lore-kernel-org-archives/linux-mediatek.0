Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA7A3C3DA78
	for <linux-mediatek@archiver.kernel.org>; Fri, 13 Jan 2023 20:49:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:References:In-Reply-To:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fkHnDayGcMAohLKGEspej/e05EdmPSY3auvLO5nhKvg=; b=bhqiOUYkATExkIrkPsoHKurLas
	JR0hD/pQi4nIk+DDxlFF4ScJNB6LrzvATDxRPfe9BvOASf3QRErHEhCilHb6RH3+IqZxUS04GbIF6
	WHwtOVYf5o/rz96xWArYieFvnBPIrdHNX7duuMaPNbcwT0gMAVO3GDZe8qxEUAdbq+4aTZQfGk3ly
	2OZPiVNNkwj//ssxWHPZoEoFhffWzXN8S0hTEBnYKz47kopmOFsCogj10mlZID0kYIeVerdk1QczK
	zWGHuHecZOZCq3VAPA4y0O1CQvkuIfOTb0hxpJKq/mXXTPCANJWjp/swDNotrMbXmAFpHHVFudHup
	305cJklg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pGQzm-004Msh-RE; Fri, 13 Jan 2023 20:49:50 +0000
Received: from mail-lf1-x136.google.com ([2a00:1450:4864:20::136])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pGQzj-004MrW-JH
	for linux-mediatek@lists.infradead.org; Fri, 13 Jan 2023 20:49:49 +0000
Received: by mail-lf1-x136.google.com with SMTP id b3so34737257lfv.2
        for <linux-mediatek@lists.infradead.org>; Fri, 13 Jan 2023 12:49:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:user-agent:from:references
         :in-reply-to:mime-version:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fkHnDayGcMAohLKGEspej/e05EdmPSY3auvLO5nhKvg=;
        b=B1hyLm+idg00BzqYNZMLiXGprSAGG6i9IwN0XKFvJoTp+bbSmW2iNf+GJtXCutZOO3
         8RgU6vVG5lOlOdS4Jh+/EFjzMIfNlQs2UESZqPIAVNO8K6uwqRQpbb6GfpuoMr4V1iJU
         C54ylt/YF1UuhIaYBPOGvyctdx3Rtziy4tGIc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:user-agent:from:references
         :in-reply-to:mime-version:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fkHnDayGcMAohLKGEspej/e05EdmPSY3auvLO5nhKvg=;
        b=wAVTqR2iiS0XNozki8P2z8cEZhVJli5E5OoODX5flnv4PWpKvYDds3c4id3Lm5sDb0
         bEF/JpNgR00lvCHeZHhOwZ1uSumVehScLCb1uq7LOzx4OFwjQD+UMf5kO8+ayd0geJ4a
         9U5IN/ADInU7aehMwrTNVAR6Unqtx1dG9HJEwQuQP7cJhktFiQQJ+A8ekjexX9SmSAII
         bZJN/JwnZty/yLYxJXt0mPRpksh0mKvLYcGprcZ+9ttsWZjdbu/VGduIt/222BKaH/kd
         vowbRz2uWB8i11b7l2YBm+1oQJIip4MEgQ1gIFmy3sEo/zLKdsB6mHl2NOpOLsFlcBAG
         yEQw==
X-Gm-Message-State: AFqh2kpWMaB7ak0qcIn26Wk+upcxzaTJwapyLiPat7qqvQxodJIVafr0
	mD56yzM0tsEk1p9nSgS2EPb9mhMoVEbXo+PGDGhdTw==
X-Google-Smtp-Source: AMrXdXsFLXpkYgLqPlD2aDMji/uNDYTLN9rr6vjDLKKJD82SrMUZ1JiyUGLTXyWhvAyNsS4E39x10UQlL6/nncEdZ5s=
X-Received: by 2002:ac2:4e50:0:b0:4ca:e48d:2b4b with SMTP id
 f16-20020ac24e50000000b004cae48d2b4bmr8301849lfr.511.1673642984424; Fri, 13
 Jan 2023 12:49:44 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 13 Jan 2023 14:49:43 -0600
MIME-Version: 1.0
In-Reply-To: <Y8FwGTWeYtX0j8MX@ravnborg.org>
References: <20230106030108.2542081-1-swboyd@chromium.org> <Y7nV+aeFiq5aD0xU@ravnborg.org>
 <CAE-0n50QOv_+j1Pe19xKj4Cx2Y5_Ak5Kt68UBJuZt10D-jQ44g@mail.gmail.com> <Y8FwGTWeYtX0j8MX@ravnborg.org>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date: Fri, 13 Jan 2023 14:49:43 -0600
Message-ID: <CAE-0n51XmyzSeKuGNn2BsJew3fK_cEHNoDpVVRqStNAF+Zzp1A@mail.gmail.com>
Subject: Re: [PATCH] drm/panel: boe-tv101wum-nl6: Ensure DSI writes succeed
 during disable
To: Sam Ravnborg <sam@ravnborg.org>
Cc: Thierry Reding <thierry.reding@gmail.com>, linux-kernel@vger.kernel.org, 
	patches@lists.linux.dev, dri-devel@lists.freedesktop.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	yangcong <yangcong5@huaqin.corp-partner.google.com>, 
	Douglas Anderson <dianders@chromium.org>, Jitao Shi <jitao.shi@mediatek.com>, 
	Rob Clark <robdclark@chromium.org>, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230113_124947_657170_349E3523 
X-CRM114-Status: GOOD (  16.93  )
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

Quoting Sam Ravnborg (2023-01-13 06:52:09)
> Hi Stephen,
> On Tue, Jan 10, 2023 at 11:29:41AM -0800, Stephen Boyd wrote:
> > Quoting Sam Ravnborg (2023-01-07 12:28:41)
> >
> > >
> > > For this case we could ask ourself if the display needs to enter sleep
> > > mode right before we disable the regulator. But if the regulator is
> > > fixed, so the disable has no effect, this seems OK.
> >
> > What do you mean by fixed?
> What I tried to say here is if we have a fixed regulator - or in others
> words a supply voltage we cannot turn off, then entering sleep mode is
> important to reduce power consumption.
> But any sane design where power consumption is a concern will have the
> possibility to turn off the power anyway.

Ok got it!

>
> >
> > >
> > > Please fix the unprepare to not jump out early, on top of or together
> > > with the other fix.
> >
> > After this patch the unprepare only bails out early if the bool
> > 'prepared' flag isn't set.
> OK, then everything is fine.
>

Doug pointed out that enable isn't symmetric because it doesn't do the
DSI writes. I've updated the patch and I'll send a v2.

