Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FDCFC04FF6
	for <linux-mediatek@archiver.kernel.org>; Fri, 12 Apr 2024 08:03:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sMvckcWEuIps2ST3PWpxhiXW6z76nnxipwsXy7cbOcQ=; b=lOpTNleY9fnrG+kRGSxxhhosL9
	uu/4WGY4ofruDUARhVSNn0NsakYizLDX8UFSc2z0sMM0O9EgXWp9DzneFK087MdgVJwTY2dSGumib
	D6OESggPPMoJb9n8bRRDYbQy7sOgd6Arpxi8UtiWWoP0oeE6FM7mgJiy24LGZQnRKHbh1ugG+OXcI
	69wWPEfkoeEMfAAj5D9n44zDPR0mt+WR9LNh82NIMBSbP0nyBBhuRZnomS0KG4FTvaiXz2nojTRPt
	XaYWBJRc/Ag0ygOqXuwuz51rTTRrkXjwmMMXV00G8XlmjExUbz6BWx/ZHs/jJ9NN5OA18lAo1A3Qe
	pUlmj2NA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rvBsS-0000000Fy39-1Wdh;
	Fri, 12 Apr 2024 08:03:16 +0000
Received: from mail-yb1-xb34.google.com ([2607:f8b0:4864:20::b34])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rvBsJ-0000000Fxv1-0zYr
	for linux-mediatek@lists.infradead.org;
	Fri, 12 Apr 2024 08:03:14 +0000
Received: by mail-yb1-xb34.google.com with SMTP id 3f1490d57ef6-dd045349d42so612358276.2
        for <linux-mediatek@lists.infradead.org>; Fri, 12 Apr 2024 01:03:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1712908985; x=1713513785; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sMvckcWEuIps2ST3PWpxhiXW6z76nnxipwsXy7cbOcQ=;
        b=pghfOminUvpKbbvCoc3wHtEPU4zLgP0+3grpmvO4pAHwk1HegdEYXua7kzQAY7WIrg
         dYoOlfkLkYyj2EaM8WHOrbTFbJSFKE7JrLpVkxtzFMNglTBg70eqsS+CrUVrDDO+uqO+
         9Zo7TSExu42JpPq83N5oXCZ8DufHa0sZ0uqWqy03dPdGL22z9z8vj9kyqdd+YOXrm4tf
         nU3jFJ0ImmDNBy4P9xINfWCZZK8ext7v3mQASK6gGk2rL936sf5X/h7bG+L9xAUOpckk
         SE3ZpAdwSDiumyutH3lnuSoR+i4zgJH+htXzetFaQcj12MXrksthpaqJ7OwMdQW9Ugtg
         UYfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712908985; x=1713513785;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sMvckcWEuIps2ST3PWpxhiXW6z76nnxipwsXy7cbOcQ=;
        b=CYFB5ycSa1r2nCHhdxLaufuO8SwlZM0WYMl4PG2b6/gwbfFy8k3755JfNVntqDn0Hp
         LK8GciRNR0I5rG1oZZwTugU8UIWf0Zrg9o3u8k0PjknE4T4Wt6rRu6KA//BrAEKCfY64
         bkKTdDrQ8dOLAquo/nFypysPKbM/wG5P1UW0mAwpZEmmwes8CwdK3MJqFoISoBdLBaMt
         FvKQBtqQVZZNCh6WBgXp0YTUI95C2KhzntIqslj+1RRIsPS7OJOB+4yYp4+X7FbkcH7Z
         1dOm8uyRFRmJJUbX2lggi6ybS4xLtYDk0xlfZRtu0N0VJ1PN2Btk6a3lMoAWJVW7N+5s
         MmeA==
X-Forwarded-Encrypted: i=1; AJvYcCXYt/VcdzOSgjBjFYXn7dT5Tjue6BP7IMSz8ihfn/UYNFjj4CDXIVxePe4gx17MpN8HH9ik4teY2Hn4q4DwqztiIuqXL5xzt8Bo0kc46DGAt7cO
X-Gm-Message-State: AOJu0YyAGwG13kg1sPMu/kLBOUtgn2icJspflz2glNvdOWLucEZMrrVs
	S0vIy/DS9zH3cjrYDyUxcvDFmgMETK7HKtgblolLUMub9LsMV4SyrqFc1sz0xHQCkTkAQco6IR9
	IrIclki7DcdCYPpIrgyR8tJ/z5FsRvSZ403WHOQ==
X-Google-Smtp-Source: AGHT+IFL6N72A/DwsiHCuflyAbDg8zkwyetqZEftIvZpoI8NkVqPM1+X6exx3vuVrRm5YMeQMMOGJ9flJp9ZQ1araAo=
X-Received: by 2002:a5b:b47:0:b0:dc7:32ea:c89f with SMTP id
 b7-20020a5b0b47000000b00dc732eac89fmr1814859ybr.15.1712908985165; Fri, 12 Apr
 2024 01:03:05 -0700 (PDT)
MIME-Version: 1.0
References: <20240408105128.30586-1-zajec5@gmail.com>
In-Reply-To: <20240408105128.30586-1-zajec5@gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 12 Apr 2024 10:02:53 +0200
Message-ID: <CACRpkdYxd2XM0Gg7DOWQHxK6c1egwcb2xZvP5QdmfC5P-8AHPw@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: pinctrl: mediatek: mt7622: add "gpio-ranges" property
To: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Cc: Sean Wang <sean.wang@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Hsin-Yi Wang <hsinyi@chromium.org>, linux-mediatek@lists.infradead.org, 
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240412_010307_341483_D9EAC60C 
X-CRM114-Status: UNSURE (   7.86  )
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

On Mon, Apr 8, 2024 at 12:51=E2=80=AFPM Rafa=C5=82 Mi=C5=82ecki <zajec5@gma=
il.com> wrote:

> From: Rafa=C5=82 Mi=C5=82ecki <rafal@milecki.pl>
>
> Allow specifying pin to GPIO mapping. It can be find in in-Linux DTS
> file for MT7622.
>
> Signed-off-by: Rafa=C5=82 Mi=C5=82ecki <rafal@milecki.pl>

Patch applied!

Yours,
Linus Walleij

