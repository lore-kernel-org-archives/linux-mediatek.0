Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18749C74A5B
	for <linux-mediatek@archiver.kernel.org>; Thu, 30 Mar 2023 04:11:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DlqWzaTFeXNF93oCsw3CKOaZb2BdZ8J89dsRkm+g8nE=; b=KtpchDACNpRlO37QJlCAexWndM
	hBURaRX/W/FR7b+v2jlTj4Zf078dcMUUsjAMq65wuHCpS6389wdg+pVFD5frvDwc5AGll8ep4aTJg
	unhmHkIP8gNibzEeOImkN6MRhmRVsvdmdxauWqRP3k8g0+2e2orCfsp/JeMXQfDtIYYxOSA91ayRG
	z/HI+MAnGMGtCxQJj/DiL+cYGNfx5JwWeHBFDSjw9mcnG63bezvKIkquhOGGdAbfcGKELg8/xa5qT
	W4+scbSmqVnxxHFw0SLQe67bokAg540HPRdBbQ0MHh9zelxi01eoJj5TDKlb8UhI0Aukz5sHbVAXB
	4zEKD/YQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1phjdQ-002Ufm-1y;
	Thu, 30 Mar 2023 04:11:36 +0000
Received: from mail-ua1-x934.google.com ([2607:f8b0:4864:20::934])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1phjdM-002UeN-2d
	for linux-mediatek@lists.infradead.org;
	Thu, 30 Mar 2023 04:11:34 +0000
Received: by mail-ua1-x934.google.com with SMTP id g9so12895033uam.9
        for <linux-mediatek@lists.infradead.org>; Wed, 29 Mar 2023 21:11:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1680149489;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DlqWzaTFeXNF93oCsw3CKOaZb2BdZ8J89dsRkm+g8nE=;
        b=Jwl8XnBNPHXUrgPWG3nOY/ScmyoA1qdPjqbybFRGhnJG73H8ZIYdkEMyoOxUKr4jy0
         RAMQZs8WujJX7IOJFjv2jXyqqRhX7ZHdmLOsQKgvSc6dI3y8AWEMMyZQKBu+6FM90Hu9
         LeUEchBHwB35VJfRrd9cNQUME4vv23vwGtN+o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680149489;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DlqWzaTFeXNF93oCsw3CKOaZb2BdZ8J89dsRkm+g8nE=;
        b=yqcD5leCgNT7PKAO76pTWgnDHbF3DdV2n8z9qPptWMe3s3/faqDCRPjJCkFyzhpjVT
         lbgGGW3pBK/f4b0YDvgQyBg8WeECkUbY9Gdvb28XpqCK92gtQ6o72fpWZQAYuoq+FCYp
         a7psKDyclD5U3CNo8xmUhcyw+0Vg8P3BaysUf5dcnx3crV7ATBEMTQ+PXpg+z1lhy/X7
         MXZCD1eD3J7F+s0ZDdHfF5wpWcywcXf92UZneDzrmitoCQU7nQYXYdp9Vp/LTeqGAmZX
         AEmFX69hgNixegJrY3RsycVfTvPxo8GXA0stN1wtWnup3L2aBvF640me/8AxtiSpZXsj
         /P3w==
X-Gm-Message-State: AAQBX9clHwQCKeZaVwldlbJSS2EhjI/wdr1ZWw0ehX59YfcknbEwpJLR
	fM3fqnOWrY3jjqY4HLCoFu2N8rcp+S6xYecWSALtlw==
X-Google-Smtp-Source: AKy350aOTSTGLpyThgFsYnGIfmpFWfK++5W92pNG1SY5fkfAr3BAjmNQvMlKt6sE5LGDBzYjwJbAbGBsSvz5yHx1Zxk=
X-Received: by 2002:ab0:3d9e:0:b0:764:793a:6618 with SMTP id
 l30-20020ab03d9e000000b00764793a6618mr14789585uac.1.1680149489280; Wed, 29
 Mar 2023 21:11:29 -0700 (PDT)
MIME-Version: 1.0
References: <20230218111712.2380225-1-treapking@chromium.org> <CAMty3ZD3SY-WCtYK0dexdLxCk8d+2tJ=D9xb5uR06jPGCd=56g@mail.gmail.com>
In-Reply-To: <CAMty3ZD3SY-WCtYK0dexdLxCk8d+2tJ=D9xb5uR06jPGCd=56g@mail.gmail.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Thu, 30 Mar 2023 12:11:18 +0800
Message-ID: <CAGXv+5HFP-1SFFBsUneyVT-42b3_6BPtQ-CkULmUT6v0pUoLbA@mail.gmail.com>
Subject: Re: [PATCH v3 0/5] Add generic-display-mux driver and bindings
To: Jagan Teki <jagan@amarulasolutions.com>
Cc: Pin-yen Lin <treapking@chromium.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Nicolas Boichat <drinkcat@chromium.org>, Robert Foss <rfoss@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Jonas Karlman <jonas@kwiboo.se>, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
	devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, 
	linux-mediatek@lists.infradead.org, 
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Andrzej Hajda <andrzej.hajda@intel.com>, 
	Chun-Kuang Hu <chunkuang.hu@kernel.org>, chrome-platform@lists.linux.dev, 
	Guenter Roeck <groeck@chromium.org>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230329_211132_851787_1866DE0F 
X-CRM114-Status: GOOD (  17.85  )
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

On Thu, Mar 30, 2023 at 2:10=E2=80=AFAM Jagan Teki <jagan@amarulasolutions.=
com> wrote:
>
> On Sat, Feb 18, 2023 at 4:47=E2=80=AFPM Pin-yen Lin <treapking@chromium.o=
rg> wrote:
> >
> > This series is developed for and tested on MT8173 board, and the layout=
 is:
> >
> >                                   /-- anx7688
> > -- MT8173 HDMI bridge -- GPIO mux
> >                                   \-- native HDMI
>
> What is the part number of this GPIO mux? Does mux gpio interrupt
> based and able to switch output HDMI and DP. If so, how this gpio
> interrupt is different than the HPD in native HDMI? I mean does HPD
> have any detection bottlenecks with mux gpio interrupt?

It's a full blown HDMI 1:2 demultiplexer, so DDC and HPD signals are muxed
as well. The anx7688 handles all the Type-C stuff, and our EC talks to it.
If HDMI output from the SoC needs to be muxed over for DP alt-mode, the EC
will signal the SoC.

> I do have GPIO Mux that input DSI and two outputs DMD/HDMI Input and
> HDMI Out. 2x1 with 1x2 mux.
>
> I'm thinking having a generic mux to select the specific out number of
> outputs with associated interface outputs can be a viable solution to
> address all use cases here.

AFAIK DRM doesn't allow dynamically changing the constitution of a display
pipeline, so it doesn't really work out for us.

If you're just muxing between different outputs with passive/dumb bridges,
it may still work for you.

ChenYu

