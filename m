Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2E69CA0FE4
	for <linux-mediatek@archiver.kernel.org>; Fri,  1 Sep 2023 15:01:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Lnevc20nRmP7PquEdhakfrPorTg+eX5G0icySYl0ICg=; b=ZJR7HAN22LhvwaXIX3MljSzkjz
	xbm/eNkItXpjgex5949dAd9/l9HyuH0nIuM87z7A2HKwnpCxZ0cIgZotv0PG/T1Gclrgs3osmKnFm
	Cf8FL4sHGoDLdIxYoiwp54nmeGW4hHsKOwAZsvz43ZPPG6zyvz5eZHOLlifE1E5s+LfIy8Eyd0CST
	6oigyufoHRz/SVxOstDVmRZqAigwVuPxtpu1QEKxdlXlDiuWtSJ2/wh+DP7vrzGTmoNlsHGsI9iT8
	V/SRmvK2NkPwUnSoQ+J2J6kKy2R2XSFRX6dvR6bB67R1fOKO+oLPyNh5L2Bb/0Jh70E2h6FZem2z8
	Fa2q8nWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qc5du-0004BL-2G;
	Fri, 01 Sep 2023 15:01:02 +0000
Received: from mail-vk1-xa2f.google.com ([2607:f8b0:4864:20::a2f])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qc5dr-00049e-2H
	for linux-mediatek@lists.infradead.org;
	Fri, 01 Sep 2023 15:01:01 +0000
Received: by mail-vk1-xa2f.google.com with SMTP id 71dfb90a1353d-48ff372840aso704888e0c.0
        for <linux-mediatek@lists.infradead.org>; Fri, 01 Sep 2023 08:00:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1693580457; x=1694185257; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Lnevc20nRmP7PquEdhakfrPorTg+eX5G0icySYl0ICg=;
        b=GuB1OK/qy36vKKhc4Z37+VqtJw/ZV/PL+24kEP88oqw+hZz2QR4qHKBZ9pnoxJUvLS
         WQ9iLAdX09yxsdWmv1gFK5FB/6/xxypJrCZtL5SQ7SUNA0JT6JGx1PGAyAiTheRL/hNG
         gwgu42gEgesyUu5MzRVDs2Q9dCntKk8rm2QkE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693580457; x=1694185257;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Lnevc20nRmP7PquEdhakfrPorTg+eX5G0icySYl0ICg=;
        b=ZGvzkQpwc+2X48zt12BB69rzCEpku6dFO8siLPeR1VHFQDo4kwGgmkaMPj4bYJq4Ss
         zT6Z9TVqE8trUUvkKS23GSd6YDVwBjoAQ7CYKuxbaNSi5piOo7v3h9tBdQhHA/iijYhX
         kHzaACattktem6V0koKmyptZP3ghMiQbkKIIQizQ4MvNACdc2WPePTSzXOSYxOnj5f24
         WMioY/4Y/DhqC6knKsJcjV6jpY2aTO+m2XSzK7o9MP1GM6/e7hdl79C/EFIJXCrAKP83
         tmQixYrVxSE7Kv6gvzzwEzSlV8wB9WCeWDnS7Xd1jDBVCU0v/weNwOYrutdV06we73LO
         srpg==
X-Gm-Message-State: AOJu0YxIHFnQ0YGGPDEfoqA06rWVGEuP1BXcvyYiT1r6wQkPaE3jWL2U
	Ld1Y5/GjEGxGizCJpI2GSkoCngK3r6W98BwnFQg/ig==
X-Google-Smtp-Source: AGHT+IG+W/T5TeKymvtATZ1GHNxllQKC01DOQi4Q4SMcnuEycQsU5HjjfQBucfegSU4lOxNjd79MQXGybqZbwL/BL1I=
X-Received: by 2002:a1f:ed81:0:b0:48d:1fcd:9760 with SMTP id
 l123-20020a1fed81000000b0048d1fcd9760mr2743978vkh.10.1693580456779; Fri, 01
 Sep 2023 08:00:56 -0700 (PDT)
MIME-Version: 1.0
References: <20230725073234.55892-10-angelogioacchino.delregno@collabora.com>
 <20230825120109.3132209-1-mwalle@kernel.org> <5b438dba-9b85-4448-bc89-08a11ddb822a@notapiano>
 <fc6c054941420ac2d016496ccbeecad4@kernel.org> <00f65d49-497c-4ade-a2f3-7a5b7ad803b6@notapiano>
 <18bfffdd7ce3bd7693c8362b28651b49@kernel.org> <cce6f9c2-e0b6-47e4-ae1c-9a3d8a4e4b02@notapiano>
 <7a3257dddac78c46408341253a3286f4@kernel.org> <CAGXv+5E4nWSuZdHmRhgYDUG4WhYs5o+-ZQBh3pnd2T_fdf9Edg@mail.gmail.com>
 <d6031e00cda9ea1e30bb75b2ca97300f@kernel.org>
In-Reply-To: <d6031e00cda9ea1e30bb75b2ca97300f@kernel.org>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Fri, 1 Sep 2023 23:00:45 +0800
Message-ID: <CAGXv+5H_L+Zg66+nTaVGQ=yqcazMtKqG54eURtcjgA=q0VK2Eg@mail.gmail.com>
Subject: Re: [PATCH v7 09/11] drm/mediatek: dp: Add support for embedded
 DisplayPort aux-bus
To: Michael Walle <mwalle@kernel.org>
Cc: =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>, 
	angelogioacchino.delregno@collabora.com, airlied@gmail.com, 
	amergnat@baylibre.com, chunkuang.hu@kernel.org, ck.hu@mediatek.com, 
	daniel@ffwll.ch, dri-devel@lists.freedesktop.org, ehristev@collabora.com, 
	kernel@collabora.com, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, 
	matthias.bgg@gmail.com, p.zabel@pengutronix.de
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230901_080059_742981_4A25E22C 
X-CRM114-Status: GOOD (  19.76  )
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

On Fri, Sep 1, 2023 at 6:00=E2=80=AFPM Michael Walle <mwalle@kernel.org> wr=
ote:
>
> Hi,
>
> >> I was just curious if you know of any development for that (or
> >> similar)
> >> in the kernel.
> >
> > This is probably because support for this SoC began with Chromebooks,
> > which have fixed and defined uses for the pipelines. I suspect that
> > what you are working on is much more flexible.
>
> Yes. that is correct.
>
> > The driver should be made to allow dynamic selection of outputs, as
> > is commonly seen with other drivers, but I don't know if that's on
> > anyone's TODO list.
>
> Do you have any pointers where to look at?

There's a series [1] called "Add connector dynamic selection capability".
Not sure if it does what you want though. I haven't looked into it.

ChenYu

[1] https://lore.kernel.org/all/20230809181525.7561-1-jason-jh.lin@mediatek=
.com/

