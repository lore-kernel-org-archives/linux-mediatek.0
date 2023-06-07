Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45058C7EE25
	for <linux-mediatek@archiver.kernel.org>; Wed,  7 Jun 2023 04:47:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fo4PkLfngXYHY6ja+unUd5R8bGmOlUuTUPgWhxoPbLc=; b=oezO6+6JDaoMalkKV9wmWO0sph
	lt24cHLpld77wz1xQO/SmZGjHHd/gVudKbAuos5DhODquMpfGcKm3+CLLFTxABA88yt/SJSwDdT7D
	MIKHtOOOaWhJOvn15kzoQK8R92kisjg4JqMadWzN0bTcvyjPT44fXG4LiXf3oZthGiMBp5jR27jhU
	bNr8dIZVKiVd9SI5um811oMjyCsfCtE5dZGlbNKjVFo9yi4t/zVtMSQnv3yGA715TKKjjleEENPX6
	SXhK8lbAA5s7l4hwXGjm5Ucuu1hbLxdVPbP6Z398xCX45KU+/yGfs1mSBClUKVGYZTm7xKQ4YN6yD
	dnfLgVrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q6l4f-004KEd-0z;
	Wed, 07 Jun 2023 04:47:09 +0000
Received: from mail-vs1-xe34.google.com ([2607:f8b0:4864:20::e34])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q6l4c-004KDh-2N
	for linux-mediatek@lists.infradead.org;
	Wed, 07 Jun 2023 04:47:08 +0000
Received: by mail-vs1-xe34.google.com with SMTP id ada2fe7eead31-43b1c483c39so2418005137.2
        for <linux-mediatek@lists.infradead.org>; Tue, 06 Jun 2023 21:47:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1686113222; x=1688705222;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fo4PkLfngXYHY6ja+unUd5R8bGmOlUuTUPgWhxoPbLc=;
        b=kyWP28qN8Jys8ZFdoulObIZ5HN99D2774We5lAq1N4NhWeKJpOyDBaA1fL/QwG5r9T
         +3HVez47RYtr0CFUkMYtD5KbpilQxz81OXdUv4lHqQp2EvPn4UUcIo4RkpjyIm/AQYst
         nGZxKi2mYvdsj4X0GO+TasNUe0729O/BU1Ay8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686113222; x=1688705222;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fo4PkLfngXYHY6ja+unUd5R8bGmOlUuTUPgWhxoPbLc=;
        b=lMXrhMona4Pn+hpaZvOldKPb85vws9Vp6VKfW/35NuUZRjjWXvMxa1Q7r0Blj08hO0
         Xx5MINLVV/I5OUnEq1vYgu0YmG41+c5vXpFrGdp5m3DZp1GpO7mQzNyeElIuxxu8BUTR
         ksQaQ0XFHksvcERI0EbtnV0EpJ53buzcXoSoo7/z0maEDkHxXbEKuWtCb1C78Cnbdsi/
         wNdzEzdKRZ2Jaltd25t0pvSTal0KZIkcAVU/wGVCgR5w8nV9IzIL+yLRBl/bJg+NYJZg
         HEUIY8qzmqZto+QaxjDcigadQ8FEysjQYZNoM5r4B5BLUaxiDDS3MJNL8ToV2fVJJTcz
         S9UQ==
X-Gm-Message-State: AC+VfDwZVLw9b5eO/TLUHn56r01pMHgqexhyU9p5p0fGvUXBuD6vo78I
	E+Jk4y2TBYHFRhE/KOO06lEa13R0lxAW+mt8FHSH1w==
X-Google-Smtp-Source: ACHHUZ5G84yzb6PcZC4TA0uvD3i4O/JMOqyu3JqoOcMgDxGkqL//yhdqkr/hCqNBIzESrXBePe5kjXPkufKSEC3CNxA=
X-Received: by 2002:a05:6102:102:b0:43b:1b47:670 with SMTP id
 z2-20020a056102010200b0043b1b470670mr688543vsq.20.1686113222153; Tue, 06 Jun
 2023 21:47:02 -0700 (PDT)
MIME-Version: 1.0
References: <20230602083335.GA181647@google.com> <87a5xii33r.fsf@jogness.linutronix.de>
 <20230603054139.GR14287@atomide.com> <20230603063533.GS14287@atomide.com>
 <20230605061511.GW14287@atomide.com> <CAGXv+5Fbx7eTxP0ep6DV+jyronAWxYvu2M-g=MjHGRhjSXUc=w@mail.gmail.com>
 <20230605122447.GY14287@atomide.com> <CAGXv+5HwL+R5QpO3pHGQd9qAxu2pCMDjYvdni1HjiC8eEE38mg@mail.gmail.com>
 <20230605131803.GA14287@atomide.com> <CAGXv+5GR9TEaNrj4B21H2iukS2kWW=rtoWkoVnWewVsrbcG0Hw@mail.gmail.com>
 <20230606122059.GC14287@atomide.com>
In-Reply-To: <20230606122059.GC14287@atomide.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Wed, 7 Jun 2023 12:46:51 +0800
Message-ID: <CAGXv+5ERwrFgpWBUBTkoawfyyTHU9w=Owiy-2BbCXHwEpZk1tA@mail.gmail.com>
Subject: Re: [PATCH v12 1/1] serial: core: Start managing serial controllers
 to enable runtime PM
To: Tony Lindgren <tony@atomide.com>
Cc: John Ogness <john.ogness@linutronix.de>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby <jirislaby@kernel.org>, 
	Andy Shevchenko <andriy.shevchenko@intel.com>, Dhruva Gole <d-gole@ti.com>, 
	=?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	Johan Hovold <johan@kernel.org>, Sebastian Andrzej Siewior <bigeasy@linutronix.de>, 
	Vignesh Raghavendra <vigneshr@ti.com>, linux-omap@vger.kernel.org, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, linux-kernel@vger.kernel.org, 
	linux-serial@vger.kernel.org, 
	=?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230606_214706_815280_EF87BBAB 
X-CRM114-Status: GOOD (  14.01  )
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

On Tue, Jun 6, 2023 at 8:21=E2=80=AFPM Tony Lindgren <tony@atomide.com> wro=
te:
>
> * Chen-Yu Tsai <wenst@chromium.org> [230606 09:17]:
> > I ended up following 8250_dw's design, which seemed less convoluted.
> > The original code was waaay too convoluted.
>
> OK that looks good to me thanks. Good to hear you got it sorted out.
>
> The 8250_dw style runtime PM is a good solution for simple cases. Where
> it won't work are SoCs where runtime PM calls need to propagate up the
> bus hierarchy. For example, 8250_omap needs runtime PM calls for the
> interconnect and power domain to get register access working.

Good to know. On MediaTek platforms I don't think there are any power
domains covering the basic peripherals. (Or it's hidden from the kernel.)

> > BTW, the Bluetooth breakage seems like a different problem.
>
> OK seems like we're good to go then :)

Yup. After a bit more testing, it seems the Bluetooth problem is more like
an undervolt issue. If I have WiFi and BT probe at the same time, Bluetooth
fails. If they probe separately, everything works fine.

ChenYu

