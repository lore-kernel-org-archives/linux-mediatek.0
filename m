Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6B66C7EE23
	for <linux-mediatek@archiver.kernel.org>; Tue, 23 May 2023 13:32:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qO7uVfTZIwTK5eWidHNY3IE4aDCiaYIaf7Mtd0r6B0Y=; b=o5xlHDvlB+LDiv
	3AdITQ03cOKwNDE3oDTWqNQZdEp98uS7670i+tmvGdJ9ARsI4pVWkrDfq8o17x638CEn3/i+I5Tfz
	hF4+Yuw4x5ZMAL3fcQzrrWBtCkA6shYRyhTGSQRcAlTq9TKIS8NTOcsOUddhVDhyOLihE1cXZPbiy
	nuYVRPtdbNRNAzh0kg13i0FbVkjVyz4HjKPFf/XNBcrybW0YDI9xUhlM3UGcgJ+Tsc0D1YlkSgG1l
	Om+thuw8zjCSHCjljf4wdexmN74O+I9qXP3G8sCvEalZTFZYX/UpJfg71rCKohA7IYXscCDeTBizW
	iK1OGd2MqNnJEPXFIjZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q1S8B-00ANgw-2Z;
	Tue, 23 May 2023 13:32:51 +0000
Received: from mail-io1-xd2d.google.com ([2607:f8b0:4864:20::d2d])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q1S88-00ANfU-0o
	for linux-mediatek@lists.infradead.org;
	Tue, 23 May 2023 13:32:49 +0000
Received: by mail-io1-xd2d.google.com with SMTP id ca18e2360f4ac-76c626eb5d1so102768939f.0
        for <linux-mediatek@lists.infradead.org>; Tue, 23 May 2023 06:32:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1684848765; x=1687440765;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qO7uVfTZIwTK5eWidHNY3IE4aDCiaYIaf7Mtd0r6B0Y=;
        b=AdDSWc374YkjBgXBqZkOGXJEqTjlWF/NQfuCT+T28Ac81kbhUmpZNweNpMxV5xnoOb
         bVR7GnLyOlo0z4N9Su4a9ocYTfuk4QBPGpagurg0c+sX/TXSYfq9b95KucsA5e79VhN0
         sajjM1Ghdbsyk3hosRLD/UMMvJC9ObydFf3IM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684848765; x=1687440765;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qO7uVfTZIwTK5eWidHNY3IE4aDCiaYIaf7Mtd0r6B0Y=;
        b=fWMBXLwlz/B8vuVPtf24KzEqj7GBbjJyHKaAVWSuQCiyxXpYSH5LGkmcRO7MhKA4cY
         IVdipTFznRDETD1ogjNGH4IHXSSRp+70hACT4HnRcbCemaH82p7hDZ+15Ib6EQmJkFGi
         9W8kXCv7mmISYNDhnjoFNJY+K2h7u/arauGHEskSn72mtKdI/CiYQEJYn4WVKTY1WNVt
         Io6O0/HgTdtPKKSTYRVXindLsLdk9oC+n7uygPcRhqwObqvDvDPdjifYdsGwCmavV41u
         POjYzOxz7EhFuTRbtfu2qQxVIlVysxpAhdgdfo3LfFhX4Vc0ixay8xo5zCYm1Te75KC8
         VZvA==
X-Gm-Message-State: AC+VfDwORWCJAB/S7XaKc67be1VjYi1GZzE8WNndg33LU5P9iNR1PALi
	Uz326e33GxwjBhhCkZWx7cLbeQXldtkhDbl+uGg=
X-Google-Smtp-Source: ACHHUZ7gGTURyP+BX9kbI6MVojug7A0CKzIOFfh+plY/UxLcWKSaQuNK7kxF9t9Osy7Tltw8eGG43Q==
X-Received: by 2002:a92:cb84:0:b0:335:56cb:a3a with SMTP id z4-20020a92cb84000000b0033556cb0a3amr9139577ilo.16.1684848764883;
        Tue, 23 May 2023 06:32:44 -0700 (PDT)
Received: from mail-il1-f182.google.com (mail-il1-f182.google.com. [209.85.166.182])
        by smtp.gmail.com with ESMTPSA id o22-20020a02a1d6000000b0041650ca49casm2506620jah.83.2023.05.23.06.32.42
        for <linux-mediatek@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 May 2023 06:32:42 -0700 (PDT)
Received: by mail-il1-f182.google.com with SMTP id e9e14a558f8ab-33828a86ee2so168345ab.0
        for <linux-mediatek@lists.infradead.org>; Tue, 23 May 2023 06:32:42 -0700 (PDT)
X-Received: by 2002:a05:6e02:1d0f:b0:329:333e:4e79 with SMTP id
 i15-20020a056e021d0f00b00329333e4e79mr252495ila.1.1684848762023; Tue, 23 May
 2023 06:32:42 -0700 (PDT)
MIME-Version: 1.0
References: <20230427035656.1962698-1-fshao@chromium.org> <CAD=FV=XVubT-ozs7JssBPz+9UcsZb+q0My8Aq6HNs-nFiJnogg@mail.gmail.com>
 <nycvar.YFH.7.76.2305231510270.29760@cbobk.fhfr.pm>
In-Reply-To: <nycvar.YFH.7.76.2305231510270.29760@cbobk.fhfr.pm>
From: Doug Anderson <dianders@chromium.org>
Date: Tue, 23 May 2023 06:32:30 -0700
X-Gmail-Original-Message-ID: <CAD=FV=UyEw5xViGreQb6+cLNLrMcT27ts5P87aR=FEYWNOBM_w@mail.gmail.com>
Message-ID: <CAD=FV=UyEw5xViGreQb6+cLNLrMcT27ts5P87aR=FEYWNOBM_w@mail.gmail.com>
Subject: Re: [PATCH v4 0/2] Fix Goodix touchscreen power leakage for MT8186 boards
To: Jiri Kosina <jikos@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230523_063248_314903_9479733F 
X-CRM114-Status: GOOD (  30.59  )
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
Cc: devicetree@vger.kernel.org, Stephen Kitt <steve@sk2.org>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Benjamin Tissoires <benjamin.tissoires@redhat.com>, linux-mediatek <linux-mediatek@lists.infradead.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, linux-input@vger.kernel.org, Jeff LaBundy <jeff@labundy.com>, Matthias Kaehlcke <mka@chromium.org>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi,

On Tue, May 23, 2023 at 6:11=E2=80=AFAM Jiri Kosina <jikos@kernel.org> wrot=
e:
>
> On Fri, 19 May 2023, Doug Anderson wrote:
>
> > > These changes are based on the series in [1], which modified the
> > > i2c-hid-of-goodix driver and removed the workaround for a power leaka=
ge
> > > issue, so the issue revisits on Mediatek MT8186 boards (Steelix).
> > >
> > > The root cause is that the touchscreen can be powered in different wa=
ys
> > > depending on the hardware designs, and it's not as easy to come up wi=
th
> > > a solution that is both simple and elegant for all the known designs.
> > >
> > > To address the issue, I ended up adding a new boolean property for th=
e
> > > driver so that we can control the power up/down sequence depending on
> > > that.
> > >
> > > Adding a new property might not be the cleanest approach for this, bu=
t
> > > at least the intention would be easy enough to understand, and it
> > > introduces relatively small change to the code and fully preserves th=
e
> > > original control flow.
> > > I hope this is something acceptable, and I'm open to any better
> > > approaches.
> > >
> > > [1] https://lore.kernel.org/all/20230207024816.525938-1-dianders@chro=
mium.org/
> > >
> > > Changes in v4:
> > > - Minor coding style improvement
> > >
> > > Changes in v3:
> > > - In power-down, only skip the GPIO but not the regulator calls if th=
e
> > >   flag is set
> > >
> > > Changes in v2:
> > > - Use a more accurate property name and with "goodix," prefix.
> > > - Do not change the regulator_enable logic during power-up.
> > >
> > > Fei Shao (2):
> > >   dt-bindings: input: goodix: Add "goodix,no-reset-during-suspend"
> > >     property
> > >   HID: i2c-hid: goodix: Add support for "goodix,no-reset-during-suspe=
nd"
> > >     property
> > >
> > >  .../bindings/input/goodix,gt7375p.yaml           |  9 +++++++++
> > >  drivers/hid/i2c-hid/i2c-hid-of-goodix.c          | 16 ++++++++++++++=
+-
> > >  2 files changed, 24 insertions(+), 1 deletion(-)
> >
> > Just double-checking if there is any work needed on this series. I
> > think it's ready to land but I wanted to double-check.
>
> I don't think I've been CCed on the dt-binding part (patch 1/2 I guess).
> Has it been Acked? If so, I will happily take it through hid.git, but
> please send it my way.

Yeah, Rob Acked it:

https://lore.kernel.org/r/168261692866.3205353.5077242811275926416.robh@ker=
nel.org/

Fei: can you repost the series with collected tags and make sure to CC Jiri=
?

Thanks!

-Doug

