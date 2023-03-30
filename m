Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2BA7BC6FD1D
	for <linux-mediatek@archiver.kernel.org>; Thu, 30 Mar 2023 09:54:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Pbyws3H75gB+yatcu0+FBMyILwRxUxSpq4AefwZkLKg=; b=QwFoIW9+cQN3CicvXFu6q25PYM
	33YwAqR3jCZWZSqZWDsPmqvVO6bEqWFc0+ZIX+20WFLe1YAIVG1O0nUYdAS4TuN6iXCjohBGfyQYI
	xJYbXFtPbchmdo9O7/71pXcDx43a42xq2O9GBF5PX+mSg7gwvTwHCV3Mn3u2R0Mz2pgc/EjluTTr2
	Nat0rU0advY//22nQ22WxSF5/Os0dGbkSHCVzfeKud+R/SnvyOEKNucXx0caJkXsJhHyk8rzQ6DA4
	Ww5qXDOAN7vwoXq2FHoCNSaj7VqQ/gRP+dsBjUqEHFAfYubZ6quFLSLt2C+IfJXQzJeOWpaW4Eoik
	2dsjd9qA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1phozW-003MUg-2U;
	Thu, 30 Mar 2023 09:54:46 +0000
Received: from mail-yb1-xb34.google.com ([2607:f8b0:4864:20::b34])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1phozR-003MTK-2q
	for linux-mediatek@lists.infradead.org;
	Thu, 30 Mar 2023 09:54:44 +0000
Received: by mail-yb1-xb34.google.com with SMTP id b18so22741185ybp.1
        for <linux-mediatek@lists.infradead.org>; Thu, 30 Mar 2023 02:54:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112; t=1680170079;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Pbyws3H75gB+yatcu0+FBMyILwRxUxSpq4AefwZkLKg=;
        b=mZsCUYHtWVu0vKKEGZmsGvkF+uy4o1aUwHzHWz89XldmLe8AQt/HxwPKXCnk93KRbH
         V8UAN9+MMCbN5JvfzvF+7noo3B3ZC1SlListXXAlyAe/Si2dth9gBK0ZYJ1pNZjq9WpB
         iNKgAFfirtS5iYb0r3mNi+HVpohWdyNPRun52UqeTAcSf+8ut/tE0fXdPt8xlgEB0Xiy
         Rj4pHSlWP9szJ+wDfC+QfLt2W4ckBGmT2H86xnDFs4tatnn3zZjeDGcEbbnYNyzNRnHm
         anAKm5idqzYX1EilwXDVQL2PFUkUsY4u2ooCexDw3QuTQhI2n1gfk4TR7i0W9tXx8lZp
         mHGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680170079;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Pbyws3H75gB+yatcu0+FBMyILwRxUxSpq4AefwZkLKg=;
        b=r4/jp62Yu69x3OvfvSMK5Y3iJHtmJZNvMPH5KP4t1Eeun7OMWcocAgMWbKomxwee8f
         JigZd67bFMBl9LZy002BQe+QQXM6bScCX/XU+t51D640AD1Ogcg3uSI0AJhQC2RrcrQO
         TfxKiNY5/0RE2iWwG6QXxPPhqYavC13NjZCcxQYxVfw0gHiEYGCd6A1Tq4VGOrIl0H3D
         ikBUk1Bpwms/Y9IHR5Xs+MwzuMOH/vPQAOxHHbajAAeptYOz6+JIQyy7lAJN2NtB3PS0
         +vucPEnl4BaEoRGn5+3FFH3a/dwk9vEymNRQpz3+l2p53wR4H2RheF6xtS2t28ZHY4kU
         77Tg==
X-Gm-Message-State: AAQBX9cTL0R/AvgvOkn8PJQND4OXZRddn8BXoX9Ycmdr30QhavslXKH/
	OJQsEYDRR6mApEuszJkiJSXWoTQZmJS3rjXamtAASw==
X-Google-Smtp-Source: AKy350bEejlHh/La/ICbG+v0y62RclEvzaIlO/L71B6Mcr7xujU2ePyASX64lF1cgA+JnYGg8IIpcjjXYY2L1pzN96g=
X-Received: by 2002:a05:6902:1501:b0:b6d:80ab:8bb6 with SMTP id
 q1-20020a056902150100b00b6d80ab8bb6mr15155725ybu.1.1680170079704; Thu, 30 Mar
 2023 02:54:39 -0700 (PDT)
MIME-Version: 1.0
References: <20230203-evk-board-support-v3-0-0003e80e0095@baylibre.com> <7h8rffyu9x.fsf@baylibre.com>
In-Reply-To: <7h8rffyu9x.fsf@baylibre.com>
From: Alexandre Mergnat <amergnat@baylibre.com>
Date: Thu, 30 Mar 2023 11:54:27 +0200
Message-ID: <CAFGrd9p7oPvhZ8KL40XYfNi2CAdEd8BZWrXPqfcqu7DTSSg4Kw@mail.gmail.com>
Subject: Re: [PATCH v3 00/17] Improve the MT8365 SoC and EVK board support
To: Kevin Hilman <khilman@baylibre.com>
Cc: Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck <linux@roeck-us.net>, 
	Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Chaotian Jing <chaotian.jing@mediatek.com>, Ulf Hansson <ulf.hansson@linaro.org>, 
	Wenbin Mei <wenbin.mei@mediatek.com>, Linus Walleij <linus.walleij@linaro.org>, 
	Zhiyong Tao <zhiyong.tao@mediatek.com>, =?UTF-8?Q?Bernhard_Rosenkr=C3=A4nzer?= <bero@baylibre.com>, 
	linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, linux-mmc@vger.kernel.org, 
	linux-gpio@vger.kernel.org, Alexandre Bailon <abailon@baylibre.com>, 
	Fabien Parent <fparent@baylibre.com>, Amjad Ouled-Ameur <aouledameur@baylibre.com>, 
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230330_025442_159218_BCC16CB7 
X-CRM114-Status: GOOD (  16.67  )
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

Le jeu. 30 mars 2023 =C3=A0 02:09, Kevin Hilman <khilman@baylibre.com> a =
=C3=A9crit :
>
> Alexandre Mergnat <amergnat@baylibre.com> writes:
>
> > This commits are based on the Fabien Parent <fparent@baylibre.com> work=
.
> >
> > The purpose of this series is to add the following HWs / IPs support fo=
r
> > the mt8365-evk board:
> > - Watchdog
> > - Power Management Integrated Circuit "PMIC" wrapper
> >   - MT6357 PMIC
> > - MultiMediaCard "MMC" & Secure Digital "SD" controller
> > - USB controller
> > - Ethernet MAC controller
> >
> > Add CPU Freq & IDLE support for this board.
> >
> > This series depends to another one which add support for MT8365 SoC and
> > EVK board [1].
>
> It seems to depend on more than that series.  In order to test this, I
> tried applying this series on top of Bero's minimal support (now in
> linux-next), and it does not apply cleanly.
>
> Could you please list all the dependencies that are not yet upstream.

Hi Kevin,
You're right, it also depend to
https://lore.kernel.org/all/20221122-mt8365-i2c-support-v6-0-e1009c8afd53@b=
aylibre.com/

Regards,
Alex

