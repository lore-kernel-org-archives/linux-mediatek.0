Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB0A9C25B78
	for <linux-mediatek@archiver.kernel.org>; Tue, 28 May 2024 20:15:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7qSEByr0cVqm4o+EKl2XQRiChKteOLXLt82vx/Q7ni4=; b=Ihci2Crbi0k8cTyXWm2J1gm+IP
	0B4Mqvgn8l0Hpcar4AWN6/SGkfCB21O2H4GYoJMDK3XnkMjy9vCwD2CVN1p6NSN+FOsA/JKPy4wE8
	4g8TB1RduadVXB0ga+kv32Iyx0N3NopZXByV0FO+yI2zeQpzdrjKi5k0i5hRWHQalO3zt+tvQLnkC
	tp3xGerGjPk8NbPURppbMlN2cSZLHT9kTWEOBylAg07eOmUl3dI+6XxMZDbsFlrmiAkZh/AK2UBQD
	ApbkgnK2qdLbA6M5qguAdo7FFh6mrsQIru0AmNLWZPE0ImHO1nk0WEs5fXNsEqDdDu9GKFjtJZH4f
	HwAtwPeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sC3Dz-00000001wU7-2hqt;
	Tue, 28 May 2024 20:15:11 +0000
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sC3Dx-00000001wSm-1RYo
	for linux-mediatek@lists.infradead.org;
	Tue, 28 May 2024 20:15:10 +0000
Received: by mail-pf1-x42e.google.com with SMTP id d2e1a72fcca58-701ae8698d8so1006069b3a.0
        for <linux-mediatek@lists.infradead.org>; Tue, 28 May 2024 13:15:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1716927306; x=1717532106; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7qSEByr0cVqm4o+EKl2XQRiChKteOLXLt82vx/Q7ni4=;
        b=ZKN8QjRfUua8FXgFQ4jg6mkrDFAbuHPvdDZpWnoJJ1vrd2bXsCKbOwe/jRuWy2C/ox
         1KUPWQEyFZCNJOXAd0YGX8DLHMnOg45hjfQE8TLNAAb1Z9xPgIG8zkcGl1A/HbnjgLaX
         nLlLgqs/UQ2Mw2VK2lcN8Y2DwHquPIkD3xRYY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716927306; x=1717532106;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7qSEByr0cVqm4o+EKl2XQRiChKteOLXLt82vx/Q7ni4=;
        b=tfFKUbkrQ1AwUG3HgCvxzzXHZ5bcLk8B5Ibv+Rbfnfw8ByNpcKkmn0m5fbIbDwnb/q
         Ud0clrDeogGEYxpdFLfnTIhxTXiy5hXeVm10bRShfsOX4eNpYEZPHt6Yvmesbjm0sGQq
         6jGP8cnNLrG2oF7mbli83cfuey/xBFnQx6nRpI4ykASZT/IAxQNp5cOO/oB53WsYJC7H
         viMNyTJuOkIJ7GqRCp9wT3pvsClhHdrg0IAmSbnTqxilV0witkFbK0mRZau6Prz2pa26
         7belYlByYh0VRvnrUlnEiQxlMCrnDc1rc88MrVJLP21Vth/dluSPaFVap3YrPunCG5e0
         uzfA==
X-Forwarded-Encrypted: i=1; AJvYcCUJFdF0GQvaRBhY09OhsxeYuQspBrldIzu2Adog1glVfYlvak2ZCyPRN1VT1dOBkl6Tzd9HIWKIDmwEDr3Kgrnr+KDVX1NAVGzAskn7VDFGok7K
X-Gm-Message-State: AOJu0Ywqxfp5tUt8IpBX+gVwggw0ochDk1Pc1MUl3V1FErjK9577WLW6
	XzlUgHnES4K98u08Vfbshmh0CMCK5+2AWBEWQsBJGbkjVI7cylWTk/pocObFoJBt3glpeXjpP5E
	=
X-Google-Smtp-Source: AGHT+IEh497TtWVbYqVlS/4AwEDKbXIj5B4qu9tT+7Brboaz51ztZt1ifoqkCKuYgrvmNwIPvLcKTQ==
X-Received: by 2002:a05:6a21:4987:b0:1a9:c4cc:721d with SMTP id adf61e73a8af0-1b212f64a6fmr13062976637.57.1716927305530;
        Tue, 28 May 2024 13:15:05 -0700 (PDT)
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com. [209.85.214.180])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-6f8fbd3eaf9sm6806761b3a.27.2024.05.28.13.15.04
        for <linux-mediatek@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 May 2024 13:15:05 -0700 (PDT)
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-1f339d61e78so42025ad.0
        for <linux-mediatek@lists.infradead.org>; Tue, 28 May 2024 13:15:04 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCV/Qnw5QZeiA2rhlAIm2r/eMDh1SnX55mA/jrwnc+taykcTYQsQ5hv97IkwsEiRSWEUBg5bclPa7D4xdvgd21g6FG8QMgXB+ZIP6LdcB5yj0Zb4
X-Received: by 2002:a05:622a:1e17:b0:43f:e034:724f with SMTP id
 d75a77b69052e-43fe1103588mr257971cf.15.1716927283572; Tue, 28 May 2024
 13:14:43 -0700 (PDT)
MIME-Version: 1.0
References: <20240503213441.177109-1-dianders@chromium.org>
 <CACRpkdYbtfE9RLsDewV2UwnJknCp_sFEgc+cq=OF+Qd3tkTcwA@mail.gmail.com> <CAD=FV=WoYm43SzrdrSZ1Np58iQ4nMwF0u6uamOAnZc4pqmBpsg@mail.gmail.com>
In-Reply-To: <CAD=FV=WoYm43SzrdrSZ1Np58iQ4nMwF0u6uamOAnZc4pqmBpsg@mail.gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Tue, 28 May 2024 13:14:27 -0700
X-Gmail-Original-Message-ID: <CAD=FV=V-4CnU7k0W3zwPAf_aeddykmHPN6=wMnjKAzQcbwHeNA@mail.gmail.com>
Message-ID: <CAD=FV=V-4CnU7k0W3zwPAf_aeddykmHPN6=wMnjKAzQcbwHeNA@mail.gmail.com>
Subject: Re: [RFT PATCH v2 00/48] drm/panel: Remove most store/double-check of
 prepared/enabled state
To: Linus Walleij <linus.walleij@linaro.org>
Cc: dri-devel@lists.freedesktop.org, Maxime Ripard <mripard@kernel.org>, 
	Chris Morgan <macromorgan@hotmail.com>, Yuran Pereira <yuran.pereira@hotmail.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Daniel Vetter <daniel@ffwll.ch>, 
	David Airlie <airlied@gmail.com>, =?UTF-8?Q?Guido_G=C3=BCnther?= <agx@sigxcpu.org>, 
	Jessica Zhang <quic_jesszhan@quicinc.com>, Jonathan Corbet <corbet@lwn.net>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, Ondrej Jirman <megi@xff.cz>, 
	Purism Kernel Team <kernel@puri.sm>, Robert Chiras <robert.chiras@nxp.com>, Sam Ravnborg <sam@ravnborg.org>, 
	Sumit Semwal <sumit.semwal@linaro.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240528_131509_440320_C9CC8940 
X-CRM114-Status: GOOD (  32.08  )
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

Hi,

On Wed, May 8, 2024 at 2:14=E2=80=AFPM Doug Anderson <dianders@chromium.org=
> wrote:
>
> > This is the right thing to do, thanks for looking into this!
> >
> > As for the behaviour of .remove() I doubt whether in many cases
> > the original driver authors have even tested this themselves.
>
> Yeah, I'd tend to agree.
>
>
> > I would say we should just apply the series as soon as it's non-RFC
>
> It's not actually RFC now, but "RFT" (request for testing). I don't
> _think_ there's any need to send a version without the RFT tag before
> landing unless someone really feels strongly about it.
>
>
> > after the next merge window
>
> With drm-misc there's not really any specific reason to wait for the
> merge window to open/close as we can land in drm-misc-next at any time
> regardless of the merge window. drm-misc-next will simply stop feeding
> linuxnext for a while.
>
> That all being said, I'm happy to delay landing this until after the
> next -rc1 comes out if people would prefer that. If I don't hear
> anything, I guess I'll just wait until -rc1 before landing any of
> these.
>
>
> > and see what happens. I doubt it
> > will cause much trouble.
>
> I can land the whole series if that's what everyone agrees on. As I
> mentioned above, I'm at least slightly worried that I did something
> stupid _somewhere_ in this series since no automation was possible and
> with repetitive tasks like this it's super easy to flub something up.
> It's _probably_ fine, but I guess I still have the worry in the back
> of my mind.
>
> If folks think I should just apply the whole series then I'm happy to
> do that. If folks think I should just land parts of the series as they
> are reviewed/tested I can do that as well. Let me know. If I don't
> hear anything I'd tend to just land patches that are reviewed/tested.
> Then after a month or so (hopefully) I'd send out a v2 with anything
> left.

Nobody said anything, so I did what I indicated above:

1. I've applied all patches that someone responded to with Linus +
Maxime's Acks + any given tags. This includes the st7703 panels which
Ond=C5=99ej replied to the cover letter about but didn't officially get any
tags.

2. I also applied patches for panels that I was personally involved
with. This includes panel-edp, panel-simple, samsung-atna33xc20,
boe-tv101wum-nl6.

Anything totally unresponded to I've left unapplied. I'll wait a
little while (at least a week) and then plan to send a v2 with
anything still outstanding. If someone sends Tested-by/Reviewed-by for
some panels in the meantime I'll apply them.

Here are the 25 patches applied to drm-misc-next:

[01/48] drm/panel: raydium-rm692e5: Stop tracking prepared
        commit: 598dc42f25cc3060fd350db0f52af1075af3f500

[04/48] drm/panel: boe-tv101wum-nl6: Stop tracking prepared
        commit: 3c24e31c908eb12e99420ff33b74c01f045253fe
[05/48] drm/panel: boe-tv101wum-nl6: Don't call unprepare+disable at
shutdown/remove
        commit: 1985e3512b5a3777f6a18c36e40f3926037120bb
[06/48] drm/panel: edp: Stop tracking prepared/enabled
        commit: 3904f317fd977533f6d7d3c4bfd75e0ac6169bb7
[07/48] drm/panel: edp: Add a comment about unprepare+disable at shutdown/r=
emove
        commit: ec7629859331fb67dbfb6bcd47f887a402e390ff
[08/48] drm/panel: innolux-p079zca: Stop tracking prepared/enabled
        commit: f9055051292442d52092f17e191cf0a58d23d4ed
[09/48] drm/panel: innolux-p079zca: Don't call unprepare+disable at
shutdown/remove
        commit: eeb133ff78476eb1e6e88154dfb75a741e8a034a

[12/48] drm/panel: kingdisplay-kd097d04: Stop tracking prepared/enabled
        commit: 157c1381780a453e06430f8b35bb8c5d439eb8c6
[13/48] drm/panel: kingdisplay-kd097d04: Don't call unprepare+disable
at shutdown/remove
        commit: 68c205ef3c39edce4a3346b8a53fd2b700394a0c
[14/48] drm/panel: ltk050h3146w: Stop tracking prepared
        commit: f124478dd18c519544489caddce78e7c5796a758
[15/48] drm/panel: ltk050h3146w: Don't call unprepare+disable at shutdown/r=
emove
        commit: b7ca446ecb53205944968617b158f073bcacaedc
[16/48] drm/panel: ltk500hd1829: Stop tracking prepared
        commit: 2b8c19b9d7bc9d03e8c44bd391d21e95c07a2c83
[17/48] drm/panel: ltk500hd1829: Don't call unprepare+disable at shutdown/r=
emove
        commit: 3357f6f465e62c0bc5e906365063734740c9f6d4
[18/48] drm/panel: novatek-nt36672a: Stop tracking prepared
        commit: b605f257f386b7f4b6fc9c0f82b86b75d0579287
[19/48] drm/panel: novatek-nt36672a: Don't call unprepare+disable at
shutdown/remove
        commit: 2a9487b5aa55753993fde80e4841128c8da4df71

[24/48] drm/panel: samsung-atna33xc20: Stop tracking prepared/enabled
        commit: 5a847750aac8454a1604070ab99d689c0a6e4290
[25/48] drm/panel: samsung-atna33xc20: Don't call unprepare+disable at
shutdown/remove
        commit: 49869668ff0e3f380858b4c20b8d0cb02b933f48
[26/48] drm/panel: simple: Stop tracking prepared/enabled
        commit: 2a1c99d7159b798288bfb20a76c1e665e2344126
[27/48] drm/panel: simple: Add a comment about unprepare+disable at
shutdown/remove
        commit: bc62654df3c888dec735343f5db9907ac93aea60

[30/48] drm/panel: xinpeng-xpp055c272: Stop tracking prepared
        commit: 4e5e6fa77a9d40cdf85ade7f86d07dc8929941c9
[31/48] drm/panel: xinpeng-xpp055c272: Don't call unprepare+disable at
shutdown/remove
        commit: ac9e1786271f771ff1f774742602330be2d57a12

[42/48] drm/panel: sitronix-st7703: Stop tracking prepared
        commit: 3004d2e9cca5d59d25dff670a03a005d40601ded
[43/48] drm/panel: sitronix-st7703: Don't call disable at shutdown/remove
        commit: 718bd8a1a5ee873778a72523c06da054a89108b4

[46/48] drm/panel: sony-acx565akm: Don't double-check enabled state in disa=
ble
        commit: e28df86aeeff0b84c13e676f641ea879abbdb809
[47/48] drm/panel: sony-acx565akm: Don't call disable at remove
        commit: 6afebd850d1ab5518c273b32532f0b2086cc633a


-Doug

