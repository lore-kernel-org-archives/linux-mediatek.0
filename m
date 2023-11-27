Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06B6EC4167B
	for <linux-mediatek@archiver.kernel.org>; Mon, 27 Nov 2023 14:48:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=E3FLX3YynhvX8mGBDXZEVUPH4OcHBZ2EUZ4Lk2rEt1c=; b=w6irb0x8nkysf0yg+i3lFoM014
	40Lc0/VAhKcCv/2s/iC10QsfN6knHnHpuUD0n/kZT/LbGIutvNQClYtktM9g6bsLucuMmOBe95Sdn
	Gt/X1fgQsHkS0XUob49LfA/Ob+ozoyi1Exm3Mxe6lNZa0/sUQ9NRnDFQwshNzARFJxDhfgBTw2UWO
	oJh+lWhqauW6xqeG9YZYmJfiNxRTGsfuUFrIrh1S9GuBIx/Igc7rtTTtR+yU9w7R8cKrHLI35jtpC
	6HcHvzrmTul6doCG228iBj5vcM4pLu1aGZvD6rwo6TznXOMkAXB6C0w/97DmF8MyNDyxMn27q7Ilu
	6TsUGjJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r7cus-002jde-2L;
	Mon, 27 Nov 2023 14:48:54 +0000
Received: from mail-il1-x12a.google.com ([2607:f8b0:4864:20::12a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r7cuq-002jcY-15
	for linux-mediatek@lists.infradead.org;
	Mon, 27 Nov 2023 14:48:53 +0000
Received: by mail-il1-x12a.google.com with SMTP id e9e14a558f8ab-35cc92a26faso3870775ab.2
        for <linux-mediatek@lists.infradead.org>; Mon, 27 Nov 2023 06:48:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1701096530; x=1701701330; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=E3FLX3YynhvX8mGBDXZEVUPH4OcHBZ2EUZ4Lk2rEt1c=;
        b=f8kEKikiQWJu9BGjgriK6BypOFvhj02gaYwr6DGVXOkbGZJu7q5IiNVFNQTYRaDPWY
         Rw6dNlzWJt8T1AsOY0DNahHFqTLwT8ZNeXBAvJKNwMam3Hmrh6ZgKNUi6Q7Cye49lN/n
         CtDLP63SDZXggtbSxd+D1rxhuYJM9WhKYrKxU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701096530; x=1701701330;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=E3FLX3YynhvX8mGBDXZEVUPH4OcHBZ2EUZ4Lk2rEt1c=;
        b=ZBo3oHzbKmhgh5YCSQXdMUtuPL8Gp48HVXWJWwHuCv62B8pp8S87xLzDt+m50fs7K9
         KH48MN9bVjuRZKh8WzTsCu41j3ifhI5qfLxaTv0ElPJm+0y3inmuXGtVZ8bd/kmLZAnX
         Pg1w+KPitoDn+HhI0F+sKgC1N74UB8/knzuB6ujFXzpYYQrYhocSZW2TwHnmrLQRuBWu
         rkYCVhOyb8t8xPApdSydlK9M/o0HJQFY6EGehjRXtmyEUxC7CbQUGnFJ+e8YMY9X2+DS
         mRyu3GqdTNcoWvnWw+OzrI4sgfBUx2WMZuw6WdD6nzA6PXE1ACajfYkF+kDIoqzW8v+E
         etdg==
X-Gm-Message-State: AOJu0YwlAti6MjhZWr6e0JsGrHM9yHtKFEMqmEF35P3K8oUetEYo5kby
	1af3xSsYNuq4yeHbc4lFHXRJjITZC6/EWI+o45eh0w==
X-Google-Smtp-Source: AGHT+IGcnqezwlGNDh2RQ7YHJ0GhpoAmyujmyGpF9m9aXpMS1mAWqIijhV4vdV0EDPLxT8+wxU+ENK4jUdVRZpXfG9I=
X-Received: by 2002:a05:6e02:20eb:b0:35c:7b32:2425 with SMTP id
 q11-20020a056e0220eb00b0035c7b322425mr11231186ilv.8.1701096530125; Mon, 27
 Nov 2023 06:48:50 -0800 (PST)
MIME-Version: 1.0
References: <20231117095531.1693753-1-treapking@chromium.org> <CAPDyKFqjcP2pAH8uo61Yc7wU76NM1aCMN6P1TaAoafCFfZSeWw@mail.gmail.com>
In-Reply-To: <CAPDyKFqjcP2pAH8uo61Yc7wU76NM1aCMN6P1TaAoafCFfZSeWw@mail.gmail.com>
From: Pin-yen Lin <treapking@chromium.org>
Date: Mon, 27 Nov 2023 22:48:39 +0800
Message-ID: <CAEXTbpd7qD4qzY0p3rDD92eTMVCeu+ZsOWBMwJA8cOYe8=JvgA@mail.gmail.com>
Subject: Re: [PATCH] mmc: mtk-sd: Increase the verbosity of msdc_track_cmd_data
To: Ulf Hansson <ulf.hansson@linaro.org>
Cc: Chaotian Jing <chaotian.jing@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, linux-kernel@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, Chen-Yu Tsai <wenst@chromium.org>, 
	ot_shunxi.zhang@mediatek.corp-partner.google.com, 
	linux-arm-kernel@lists.infradead.org, linux-mmc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231127_064852_408217_F68895B2 
X-CRM114-Status: GOOD (  19.93  )
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

Hi Ulf,

On Fri, Nov 24, 2023 at 1:13=E2=80=AFAM Ulf Hansson <ulf.hansson@linaro.org=
> wrote:
>
> On Fri, 17 Nov 2023 at 10:55, Pin-yen Lin <treapking@chromium.org> wrote:
> >
> > This log message is necessary for debugging, so enable it by default to
> > debug issues that are hard to reproduce locally.
> >
> > Signed-off-by: Pin-yen Lin <treapking@chromium.org>
> >
> > ---
> >
> >  drivers/mmc/host/mtk-sd.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/drivers/mmc/host/mtk-sd.c b/drivers/mmc/host/mtk-sd.c
> > index 97f7c3d4be6e..4469003f571e 100644
> > --- a/drivers/mmc/host/mtk-sd.c
> > +++ b/drivers/mmc/host/mtk-sd.c
> > @@ -1150,7 +1150,7 @@ static void msdc_recheck_sdio_irq(struct msdc_hos=
t *host)
> >  static void msdc_track_cmd_data(struct msdc_host *host, struct mmc_com=
mand *cmd)
> >  {
> >         if (host->error)
> > -               dev_dbg(host->dev, "%s: cmd=3D%d arg=3D%08X; host->erro=
r=3D0x%08X\n",
> > +               dev_err(host->dev, "%s: cmd=3D%d arg=3D%08X; host->erro=
r=3D0x%08X\n",
> >                         __func__, cmd->opcode, cmd->arg, host->error);
>
> How critical is this? Should we perhaps use a dev_warn instead?

After rechecking the driver, I agree that dev_warn() is probably
enough as the driver tries to reset the hardware to recover from the
bad state when this error happens.

I'll wait a few days before sending out v2 to see if Mediatek people
can confirm this.

Thanks and regards,
Pin-yen
>
> >  }
> >
>
> Kind regards
> Uffe

