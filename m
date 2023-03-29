Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F003CC74A5B
	for <linux-mediatek@archiver.kernel.org>; Wed, 29 Mar 2023 18:10:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=s36Q4sLQX/3/tv2niFl6Gc9T++Xctk19QhnwqMt3BVM=; b=jTQ3Z7sQ7Oij7BeIxBebvrkaMp
	Gg2vVXMWzSXIs93JLcoiI7jViudNE14xHDVtXbfwefO7mYjRaJEt2fRQOgDCQOsU2atsG4xhRYEnZ
	BmY+QEQQ6xWj5YKsMp/HBi41XHM2p6a/7gVljpy+2vYn5JgvJT3rzmXESv8r4zoMT73AueykM7xpF
	qKdwyYWDah0PcE0xlo/h14pr47OT2gbuyxAfy7nnnryf2P2xiNZfC6AxhIhE4n7CrQUvRpkL0JDFa
	kYGTrNB6schxUuMdB+7upSFfjzpcWPLqpr6nn2sp+YBpExMGg4zFy2rSJfmoDRf3psKWr/KybGhw+
	cSEGQ9uA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1phaFx-001QMF-1A;
	Wed, 29 Mar 2023 18:10:45 +0000
Received: from mail-yw1-x1133.google.com ([2607:f8b0:4864:20::1133])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1phaFu-001QLI-1s
	for linux-mediatek@lists.infradead.org;
	Wed, 29 Mar 2023 18:10:43 +0000
Received: by mail-yw1-x1133.google.com with SMTP id 00721157ae682-544787916d9so307810667b3.13
        for <linux-mediatek@lists.infradead.org>; Wed, 29 Mar 2023 11:10:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1680113440;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=s36Q4sLQX/3/tv2niFl6Gc9T++Xctk19QhnwqMt3BVM=;
        b=eDsYeqiG8GB4aZVHJzDU7byR1P1jPt7YE7V+7LrQkBjkHGKR65terpAGMEbNbrpWtc
         GbKOZDyCq7ZL/+Zsg31N3BVfxEvsJ1GDaWJFB38pSjVUW4/6WGSR96i/6pIpJUY1T9+N
         2W7sklR7qOx9HkWIJmhgVq8bUgKpEeVJ7TTmU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680113440;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=s36Q4sLQX/3/tv2niFl6Gc9T++Xctk19QhnwqMt3BVM=;
        b=Xz86wK0gE946dQdDMJYDfKAzrccgdmqYl/QZdDQ/3lA//M/jn4jUu1gnQgyw7tYV6I
         kLCIdtugfE2L0poU8lTK0X+4EqyEwdqQNkF250QoFbCs406xv2moOegX5YY+MgqkVy3n
         sZzlK1ehGXgG/+iPu47TuCLsjeww85S1wY4tZl/xqtTXHNR6Chb4ZypL38Ngzs/vKxph
         Aw9BUEFv5t/npDy1dhJ6JU/MZCgFEUF7QL53cQhXOFGY8DacUNuGGJSU93b9txCalFTY
         /Sq0aJpSQIv7B/a5vtZ0nBH2guDUWK7NSGAlbkCPGWipACVOs1OYjecFXVFa159qn/mE
         3LMA==
X-Gm-Message-State: AAQBX9chIHpKfTskt/Ul5hushnLA+O4CFbftjvckyk87MPRyL0hrG+8i
	I7ibH6KkSJ6KYoAgzmxJFh0WSjEmeGkg4Ez7C6KqEA==
X-Google-Smtp-Source: AKy350bTV90Nmmdqq5XdDMT52Ufu5ut5fzXMHi+iq0KHhNlusnr1XWTmvpO5LoXs+iXfO3xl7HbVrgeRFLebGR+jpH0=
X-Received: by 2002:a81:ac46:0:b0:544:6828:3c09 with SMTP id
 z6-20020a81ac46000000b0054468283c09mr10157919ywj.0.1680113440045; Wed, 29 Mar
 2023 11:10:40 -0700 (PDT)
MIME-Version: 1.0
References: <20230218111712.2380225-1-treapking@chromium.org>
In-Reply-To: <20230218111712.2380225-1-treapking@chromium.org>
From: Jagan Teki <jagan@amarulasolutions.com>
Date: Wed, 29 Mar 2023 23:40:28 +0530
Message-ID: <CAMty3ZD3SY-WCtYK0dexdLxCk8d+2tJ=D9xb5uR06jPGCd=56g@mail.gmail.com>
Subject: Re: [PATCH v3 0/5] Add generic-display-mux driver and bindings
To: Pin-yen Lin <treapking@chromium.org>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Robert Foss <rfoss@kernel.org>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
	Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Benson Leung <bleung@chromium.org>, 
	chrome-platform@lists.linux.dev, Nicolas Boichat <drinkcat@chromium.org>, 
	Chun-Kuang Hu <chunkuang.hu@kernel.org>, linux-kernel@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, Matthias Brugger <matthias.bgg@gmail.com>, 
	devicetree@vger.kernel.org, linux-mediatek@lists.infradead.org, 
	Guenter Roeck <groeck@chromium.org>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230329_111042_656480_B05F34BB 
X-CRM114-Status: GOOD (  10.63  )
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

On Sat, Feb 18, 2023 at 4:47=E2=80=AFPM Pin-yen Lin <treapking@chromium.org=
> wrote:
>
> This series is developed for and tested on MT8173 board, and the layout i=
s:
>
>                                   /-- anx7688
> -- MT8173 HDMI bridge -- GPIO mux
>                                   \-- native HDMI

What is the part number of this GPIO mux? Does mux gpio interrupt
based and able to switch output HDMI and DP. If so, how this gpio
interrupt is different than the HPD in native HDMI? I mean does HPD
have any detection bottlenecks with mux gpio interrupt?

I do have GPIO Mux that input DSI and two outputs DMD/HDMI Input and
HDMI Out. 2x1 with 1x2 mux.

I'm thinking having a generic mux to select the specific out number of
outputs with associated interface outputs can be a viable solution to
address all use cases here.

Thanks,
Jagan.

