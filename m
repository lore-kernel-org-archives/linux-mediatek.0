Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 068E4C369C7
	for <linux-mediatek@archiver.kernel.org>; Wed, 16 Apr 2025 10:31:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DXCImHbhgaHYD5NXAki2E5LHyVFHbeqj7RL6q2PIT+U=; b=BIc2g/cWZeP+B4YjxqmF6FTOj3
	MIfi1S1ux0cOLUK9k1EjbPVOfMHrT5jtErr/gZHsSeBqojEEeMtiMrdjBAZ5+FvAbzoA7pZqaR85C
	pZac+QpMaSoNmbnKql0PS/4aZmvoDAVzqlbPWgNoshrdufvTnMeY5cxHaILszitDk/8jORYRUXNBj
	qnLetr0tI4r9f4hwok94q770PxKvhnmgeYNlFNqjdyPjka5ucl/HNSSgay68TNOnrqRwwaKUv2DE/
	/Qv92b3oGR5ZdfPG+gbeqiLy3RACIBHohfANLswT3t6LGNsPJfwAxxQ+zq47HmDIFrDaCOTrWrrK0
	sZ9Px7Aw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u502v-000000098uz-1iN3;
	Wed, 16 Apr 2025 10:31:09 +0000
Received: from mail-lf1-x131.google.com ([2a00:1450:4864:20::131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4yGO-00000008qTV-3Yl4
	for linux-mediatek@lists.infradead.org;
	Wed, 16 Apr 2025 08:36:58 +0000
Received: by mail-lf1-x131.google.com with SMTP id 2adb3069b0e04-5499614d3d2so7305138e87.3
        for <linux-mediatek@lists.infradead.org>; Wed, 16 Apr 2025 01:36:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744792615; x=1745397415; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DXCImHbhgaHYD5NXAki2E5LHyVFHbeqj7RL6q2PIT+U=;
        b=Mk4R82EaKhkISjJ5NZT3bSFh7UtnZQLNIn5D73p95oZej6t5HBad5qf+oVIGrDvxxQ
         hpip8KDF3gF43LbQOFUui5MFxoOLXYP7YAdQAL5zMidcCkiCvaI6Orozyo2UTPMhbEim
         8G/9i2cJxynI68a1mPSyaygQ2ZSV0b3Cr1OLvqRw8cT1aeiBjFYmUkKqOUG/oyk1jacx
         ZIuYKUazTZ1QDiY2DV74TOxAxU9UjXMVuhjzqfGPeoH6cqXdc4iv7qWF+opLzDhQkL9X
         3oH7GaDrvuqU7gSNUQbM4gJT1/qeoupwoQ8Tn+npEW8Q4H16smpm9cj35OxRi6QupKbT
         8E0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744792615; x=1745397415;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DXCImHbhgaHYD5NXAki2E5LHyVFHbeqj7RL6q2PIT+U=;
        b=lH1cOeNVqIr400cl1ZpyESaUKp4IOelZ0tLpR3Brol/DRP/AMmrc9fSsXDKhNtoET+
         E/HaLSLXGqM26ixGdCaulXslo3YatKemB3GcrTwf0isdAAw874n+0Y+pHpMLyhKavFSl
         mrVeoXQxrTTm+vOyd25PGuELPPYoDRqlKmkn9GczJj2SNVkV0VTASaPisYIDLuzJN3vG
         pvPu8LmzxKSw7f7gpZ7VbyVe7wxmKLkGmAVFnzzoYmXDnj7JLjGhn3ySpPKAZFboyNqt
         HotRtoPpU37HRJ1pPU3O266Y0c0bGar7iaBIHSTqppBohnkWhY5+JrzNUOM8tpWF0XVK
         Ic3g==
X-Forwarded-Encrypted: i=1; AJvYcCUJJeZQcdrmKFDQG5HB6xSUn3bh4CFVuFtuwZDz8TlU1XV9mllw1E1M+n9JZz8yMbvsGT3BRmm/+/ufrF/pcg==@lists.infradead.org
X-Gm-Message-State: AOJu0Yx2mN2ekfBHp3eunnwbIJwGv3/bpRtjun0cysvqZJPHol0lLLHp
	oUHlR5cwitZjCxfOCLsMso2RM0up7XS62F0ypHkbiW5R7fNX2Sb6ziwXhEOm4t1WodYY22DNNat
	MUdi8AFoV3atcSOhBWbKqJtiyforFN4I/vFKCcg==
X-Gm-Gg: ASbGncuwU1jvAWwTMBk2wbOEVvpU7gS9tmcYj3XsDIqqX8qKxbWeY2pTfUIBzGPBV1x
	uT1Z6cHndlg2jj5w/8uX3Pz1KpRuz3JtMEQaj5xVBtmyU4D8ld6SvTdeC57iprqFSupfiKjy9i4
	CYWDW3nk3aovLnGisVnRtgMW+nLFzKQjXB
X-Google-Smtp-Source: AGHT+IFnTyulj/0oGbeIikzilFJSE7sEuMb0JSQLD2qCkdI3QvGlZH639PCmqr2wKnbHsJXFbiOa8zKp3Mk8GGtQ/fo=
X-Received: by 2002:a05:6512:3d02:b0:549:5802:b32d with SMTP id
 2adb3069b0e04-54d64a7ae44mr362901e87.3.1744792614952; Wed, 16 Apr 2025
 01:36:54 -0700 (PDT)
MIME-Version: 1.0
References: <20250322035307.4811-1-ot_chhao.chang@mediatek.com>
 <20250322035307.4811-2-ot_chhao.chang@mediatek.com> <43nd5jxpk7b7fv46frqlfjnqfh5jlpqsemeoakqzd4wdi3df6y@w7ycd3k5ezvn>
In-Reply-To: <43nd5jxpk7b7fv46frqlfjnqfh5jlpqsemeoakqzd4wdi3df6y@w7ycd3k5ezvn>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 16 Apr 2025 10:36:42 +0200
X-Gm-Features: ATxdqUG40hdym0n5Q2fxGBsUSS0OPVO8ybbpsBi47RVMjHapZZipAk2JRY_FG-A
Message-ID: <CACRpkdbhGJhmNhoS-rqWEtqvH=D_2Q2+djaXWmyEu3o8UEcaZQ@mail.gmail.com>
Subject: Re: [PATCH v5 1/1] pinctrl: mediatek: Add EINT support for multiple addresses
To: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@baylibre.com>
Cc: Hao Chang <ot_chhao.chang@mediatek.com>, Sean Wang <sean.wang@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Wenbin Mei <wenbin.mei@mediatek.com>, Axe Yang <axe.yang@mediatek.com>, 
	Qingliang Li <qingliang.li@mediatek.com>, Hanks Chen <hanks.chen@mediatek.com>, 
	Chunhui Li <chunhui.li@mediatek.com>, linux-mediatek@lists.infradead.org, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, regressions@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250416_013656_884211_A85789C6 
X-CRM114-Status: UNSURE (   8.22  )
X-CRM114-Notice: Please train this message.
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

On Mon, Apr 14, 2025 at 4:57=E2=80=AFPM Uwe Kleine-K=C3=B6nig
<u.kleine-koenig@baylibre.com> wrote:

> this patch became commit 3ef9f710efcb in v6.15-rc1. It breaks booting a
> mt8365-evk.
>
> With earlycon it's possible to see a null pointer exception:

Argh, does this patch fix it:
https://lore.kernel.org/all/20250415112339.2385454-1-wenst@chromium.org/

I have applied that one for fixes.

Yours,
Linus Walleij

