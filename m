Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7EFE4CDE01B
	for <linux-mediatek@archiver.kernel.org>; Thu, 26 Sep 2024 15:51:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=q/C6W+i03PB1ReYtpl5/qyhBiUgWpLGUr9VE1GQJcEg=; b=LX9Clnd9F9hyILBHPDw4g/YiMy
	PM2md9V9O9GYzbj0nvn1WhUMLVyX1qkRJsVdSaBY3/+5QKcXBVIjme0tRcSHWdHWoju1lv1egXCge
	QyEYS3RGETx3K6c9hDGLYjyr2QsvbYKmusJDPg5mFnzuMtpwNpoOeLAKsZ5DJ8x1dZfWTJ8MxsR94
	Bf1M2lqyIceqR23lNgvkP7peyLSLfkNqiINuQ0HwWHF5bdduNiu1zRt/twOD5J8Fxln0N9Sdpd2jq
	Om6la4rBjza1x3ajfgTEDcdIA/f3vBLefwhgPMG2s9ds7Rm0cBjjmIJy6oOYnYLTLksm1OCIf4vjE
	LSA4RUWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1stqln-00000008nCV-1cOg;
	Thu, 26 Sep 2024 15:51:07 +0000
Received: from mail-yb1-xb2b.google.com ([2607:f8b0:4864:20::b2b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1stqkc-00000008n2y-3uuu
	for linux-mediatek@lists.infradead.org;
	Thu, 26 Sep 2024 15:49:56 +0000
Received: by mail-yb1-xb2b.google.com with SMTP id 3f1490d57ef6-e25ccd64be9so967208276.2
        for <linux-mediatek@lists.infradead.org>; Thu, 26 Sep 2024 08:49:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1727365793; x=1727970593; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=q/C6W+i03PB1ReYtpl5/qyhBiUgWpLGUr9VE1GQJcEg=;
        b=KXd1i0j/OS0MXXEojLwl/QCVrMRd4r5Ebw5dunAQLMujfKlaql+G04tOHyUXX7dE8k
         ZnlCDB+2qBRQ2dGVqbI2QimhMg9TPQ3mr9Ze54GwuT1TDzRyo/xuG2hHoOGSm/EVZ44N
         tqSJuySzLmDx38Ddsyi1veeHEpvz0lVhP12FU022cYpWZSnkMm59QI9dv0zvM2sjtEtk
         Sl8ns5mx8Y0BRUwSluyPtKjJdy6RWt7znR2IsYgQOTZ8SJRSLVv1PQ6obJz0MqABAmkP
         o8XlHL5Wny0E2IxCbvj3QNgU+isE0anWWH4IOKrldgtSpavKsOr1QN/LY11WKgbuClY6
         d0sA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727365793; x=1727970593;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=q/C6W+i03PB1ReYtpl5/qyhBiUgWpLGUr9VE1GQJcEg=;
        b=OdDeBGODYU6sPKdGzD02msZvzMCrAVT1SJ8Hr0PjnbkaBzLFwvsSxeFmvrfS/pSktv
         +QV18ZvANMuBG/XlscNUGoWU+R0qOfUchExvjJuD8wJYXRgknwlS/9Oc0CcUXVm44AYC
         5bSiHQsqDKDFez99bLEf9M1R3cPPiLTtkR35K/bFoSkHIetcmYtODLPIN7tqOgXT0bjc
         6g+ikOaTXLEmHNkOYkXi393iGD6nB7Doq2mVP74wTE8kpm4/v2/05bIrWjloam7Vq9An
         KXQRAusl3VoCQTCZAciO5cxXXRV7Iw2RuFcJ/GOOBgVk52Ch9V16JgFM0oAvoLzKfJFI
         sxFQ==
X-Forwarded-Encrypted: i=1; AJvYcCXHsd+RHrPWp3+fnoG7T4hlfQ8hIh5hrIlQArbFUami56fqSY95YA3/n+xMaoGJxoleaxd45mXjlaGnfP2nzQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yw+IR/9dstWq1Zt5lXZacCn/K2IrStH1a+zDU2O5dn6Q4vU4y6f
	HhKoCsBuLCXvntMOfKOtHSsqu2gWanWpQp5nzkfHZrg0aoRHlOHKgj9NTOs/zur7hExob1URWTr
	ou59Gq2MaiAAK9zz1cCFadEdpWWNxUo5tmtl/Gw==
X-Google-Smtp-Source: AGHT+IFqqGJreMRNFfnsSuthz64Gd/N9P25tYQ9qT6LFx4CM65znxx9CuUuNf/VeLj3Ht2p1xv5M9snqdM0j4M8TDec=
X-Received: by 2002:a05:6902:2583:b0:e25:e2f5:38ce with SMTP id
 3f1490d57ef6-e25e2f539e1mr696097276.37.1727365793039; Thu, 26 Sep 2024
 08:49:53 -0700 (PDT)
MIME-Version: 1.0
References: <20240925093807.1026949-1-wenst@chromium.org>
In-Reply-To: <20240925093807.1026949-1-wenst@chromium.org>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Thu, 26 Sep 2024 17:49:16 +0200
Message-ID: <CAPDyKFqoqppLipOG1vK-8oU_6cMdZ3DV5Gxqhs5-+7+cQJ6=qQ@mail.gmail.com>
Subject: Re: [PATCH v8 0/3] Add of_regulator_get_optional() and Fix MTK Power
 Domain Driver
To: Chen-Yu Tsai <wenst@chromium.org>, Mark Brown <broonie@kernel.org>, 
	Sebastian Reichel <sebastian.reichel@collabora.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, 
	Douglas Anderson <dianders@chromium.org>, Johan Hovold <johan@kernel.org>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Pablo Sun <pablo.sun@mediatek.com>, 
	Macpaul Lin <macpaul.lin@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240926_084954_980899_E4056565 
X-CRM114-Status: GOOD (  21.49  )
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

On Wed, 25 Sept 2024 at 11:38, Chen-Yu Tsai <wenst@chromium.org> wrote:
>
> Hi folks,
>
> This series is split off from my "DT hardware prober" series [1].
>
> Changes since v7:
> - Added stub versions for of_regulator_get_optional() for !CONFIG_OF
>   and !CONFIG_REGULATOR
> - Added new patches for devres version and converting MTK pmdomain
>   driver
>
> At ELCE, Sebastian told me about his recent work on adding regulator
> supply support to the Rockchip power domain driver [2], how the MediaTek
> driver has been using the existing devm_regulator_get() API and
> reassigning different device nodes to the device doing the lookup, and
> how the new of_regulator_get_optional() is the proper fit for this.
>
> Patch 1 adds a new of_regulator_get_optional() function to look up
> regulator supplies using device tree nodes.
>
> Patch 2 adds a devres version of the aforementioned function at
> Sebastian's request for the two power domain drivers.
>
> Patch 3 converts the MediaTek power domain driver to use function.
>
>
> Each of the latter two patches depend on the previous one at build time.
> Mark, would it be possible for you to put the two regulator patches
> on an immutable branch / tag? Otherwise we could have Ulf ack the
> pmdomain patch and merge it through your tree. Sebastian was fine
> with converting the rockchip pmdomain some time later.

Thanks for providing some context!

In my opinion I would prefer an immutable branch/tag of the regulator
core changes, so I can carry the pmdomain changes for MTK through my
pmdomain tree, but also because I would prefer if Sebastian could make
the corresponding conversion for the Rockchip pmdomain driver. If this
can get queued soon, there is really no need to have an intermediate
step for Rockchip, I think.

Does it make sense - or do you prefer another way forward?

[...]

Kind regards
Uffe

