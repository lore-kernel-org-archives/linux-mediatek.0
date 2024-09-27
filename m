Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 313BACEBF69
	for <linux-mediatek@archiver.kernel.org>; Fri, 27 Sep 2024 04:02:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ts6Ybuhxy9EO97nxINn08YUin8kXfW9IAD6aPStdVq8=; b=i+X5Pua2QoMKh1VL7U3l/GGhml
	BYMkk6nSNaYQumnYFjzLKM0sEEF5qQyKJpeIvN605xNkhCEKQgJgQQ00Go1VgkaCDPHIjtWCGlCdp
	WJJ84Ppf9J7znLWrJasDOK8YluHuLQ3Tph7lV8b08mycjCrVM1YD4zbf2A42r8NKo8NttAg8b5r2+
	GOibD5+fa29kBmkyRB1yuIQM9AJaR3LGX4NmGKt+r8ruX0xVEtcKIR6qkLa9bQu7kJaYcnGUWCB0e
	ila8hiKlobM11MyTtOvoXMGoPY1ohOjnBEGKLu/C6CYAL62FVNc+fX/FSFlvLUnnm9TI+XtTF/ePn
	m8f8kdcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1su2BR-00000009wl9-01Uh;
	Fri, 27 Sep 2024 04:02:21 +0000
Received: from mail-lf1-x12d.google.com ([2a00:1450:4864:20::12d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1su2AC-00000009wb1-2JsF
	for linux-mediatek@lists.infradead.org;
	Fri, 27 Sep 2024 04:01:09 +0000
Received: by mail-lf1-x12d.google.com with SMTP id 2adb3069b0e04-5365c060f47so1922825e87.2
        for <linux-mediatek@lists.infradead.org>; Thu, 26 Sep 2024 21:01:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1727409660; x=1728014460; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ts6Ybuhxy9EO97nxINn08YUin8kXfW9IAD6aPStdVq8=;
        b=DcTG8r2Ec/JhH72vDR9oN+k+rNcJcLxO70N6DsRN18tIKjaBIBtDGNRT5iGbB4lwVF
         t4yP4VDJx3A9bXm1Gk3klZdBKGMEX8LHW32PQRD4U8RIDdf/hCPyCFt+ly1moQoYetYT
         S9SUl+XNV85XZXZwAfdeFyUXX+KHjjEf5hyB8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727409660; x=1728014460;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ts6Ybuhxy9EO97nxINn08YUin8kXfW9IAD6aPStdVq8=;
        b=s7KAhDYeo4pi5/q/aeUsxQtOPEOtPYoCHy6gIhDYFV0GvHG1u0lZx5YzS42nBkHqxH
         2ofCpw8v/tr0K8p0HQrVd1N5BGPBeOOikWVlVhrn4bORtvvlagP/4b9qzqOxu8HYNQgp
         ZKkHjixvaJmXiLeXDsVkn69fX7Q/emnLR1+7kXNUNh0sE3bAkezlTtAtqzTnfS1oTEMb
         uRrhkEG2Apb7pquv96e2Qbs0Wv2tX1C7DSpQvJe+HK4HvGu5IfV3WsoJFKQuZ21ghgEk
         SHUSktQZujIIlEGopqq/IY+4Bvw5EHrdPVWJApC+45mTCSmt9+7frnHjaC0hGab3mJXv
         COsA==
X-Forwarded-Encrypted: i=1; AJvYcCWtzTzKu/8hOUFhyy/zKUt1M/KcEMriiq59hDu4X/7K+z/B28fvoo0XvtSdc1syzkFYEVTFrDK+4tsvkOHtyQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yx7TacPCyVz/T8dxmry8YYLKlP95GjgaNVD53k9ldCp9dZUenma
	TzC9+9UZ1Alal72FW40Gd0siM8Tf6o/RjG5NLMx7eFBqCMhNWY/2JB5gFRvwpz1uoCLH7VyPPuz
	vEE4Ll/thv4eGIRwHdaRZqz7QRNJAuT2Yqx0t
X-Google-Smtp-Source: AGHT+IFhILfvyN612dVfAZjt7mlHdsnT36bs2zlQCVH9UI+WtCiOa7LORMIXTip1YcFTiMjzEjST5u3lqpdVSQXGrdI=
X-Received: by 2002:a05:6512:1256:b0:535:6400:1da8 with SMTP id
 2adb3069b0e04-5389fc477eemr884467e87.28.1727409659514; Thu, 26 Sep 2024
 21:00:59 -0700 (PDT)
MIME-Version: 1.0
References: <20240925093807.1026949-1-wenst@chromium.org> <CAPDyKFqoqppLipOG1vK-8oU_6cMdZ3DV5Gxqhs5-+7+cQJ6=qQ@mail.gmail.com>
In-Reply-To: <CAPDyKFqoqppLipOG1vK-8oU_6cMdZ3DV5Gxqhs5-+7+cQJ6=qQ@mail.gmail.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Fri, 27 Sep 2024 12:00:48 +0800
Message-ID: <CAGXv+5Fot5BVxtAiEj==2u1ew7mGYkrS7=mTqeTMjTiEg8LNag@mail.gmail.com>
Subject: Re: [PATCH v8 0/3] Add of_regulator_get_optional() and Fix MTK Power
 Domain Driver
To: Ulf Hansson <ulf.hansson@linaro.org>
Cc: Mark Brown <broonie@kernel.org>, Sebastian Reichel <sebastian.reichel@collabora.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, 
	Douglas Anderson <dianders@chromium.org>, Johan Hovold <johan@kernel.org>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Pablo Sun <pablo.sun@mediatek.com>, 
	Macpaul Lin <macpaul.lin@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240926_210104_674346_F5CC3979 
X-CRM114-Status: GOOD (  28.01  )
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

On Thu, Sep 26, 2024 at 11:49=E2=80=AFPM Ulf Hansson <ulf.hansson@linaro.or=
g> wrote:
>
> On Wed, 25 Sept 2024 at 11:38, Chen-Yu Tsai <wenst@chromium.org> wrote:
> >
> > Hi folks,
> >
> > This series is split off from my "DT hardware prober" series [1].
> >
> > Changes since v7:
> > - Added stub versions for of_regulator_get_optional() for !CONFIG_OF
> >   and !CONFIG_REGULATOR
> > - Added new patches for devres version and converting MTK pmdomain
> >   driver
> >
> > At ELCE, Sebastian told me about his recent work on adding regulator
> > supply support to the Rockchip power domain driver [2], how the MediaTe=
k
> > driver has been using the existing devm_regulator_get() API and
> > reassigning different device nodes to the device doing the lookup, and
> > how the new of_regulator_get_optional() is the proper fit for this.
> >
> > Patch 1 adds a new of_regulator_get_optional() function to look up
> > regulator supplies using device tree nodes.
> >
> > Patch 2 adds a devres version of the aforementioned function at
> > Sebastian's request for the two power domain drivers.
> >
> > Patch 3 converts the MediaTek power domain driver to use function.
> >
> >
> > Each of the latter two patches depend on the previous one at build time=
.
> > Mark, would it be possible for you to put the two regulator patches
> > on an immutable branch / tag? Otherwise we could have Ulf ack the
> > pmdomain patch and merge it through your tree. Sebastian was fine
> > with converting the rockchip pmdomain some time later.
>
> Thanks for providing some context!
>
> In my opinion I would prefer an immutable branch/tag of the regulator
> core changes, so I can carry the pmdomain changes for MTK through my
> pmdomain tree, but also because I would prefer if Sebastian could make
> the corresponding conversion for the Rockchip pmdomain driver. If this
> can get queued soon, there is really no need to have an intermediate
> step for Rockchip, I think.
>
> Does it make sense - or do you prefer another way forward?

Makes sense to me!

ChenYu

