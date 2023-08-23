Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BEC48C3DA66
	for <linux-mediatek@archiver.kernel.org>; Wed, 23 Aug 2023 19:11:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=z/z++L67LsgS5CeBHRbV3vQihN14HaxRSYn9ahWfvaI=; b=Gbwxr8ICqRLNCO/NgQWc+gSQuw
	eb/z8sVGkTkG5HCoQintB4OC3N2MSAHN3vWz6pLfY6n052vkqsbm6ELzbAOTOT5fEMhliymPGho8F
	3wXERpoX88ZLVzO0LPgsYCRKR6WtzUGwfNEmTZCP+Y5CHCqKFXQAFv4tCwFrQLVADKYc6R3NV/Bx2
	x3gnbXmHXPpqqUYUjUpINL1zKWrgZp3DJHgO1aFtfnDSgxOyZqdWllhoFL9+IcKsfNcVAARxAy+sT
	Dz9wjFcsafythN54MfTo/vDsjArMO1AYrmedWea3EOYDvjLaEhRg7YdHHzVjgNUlx7Fg8cJZmuj+D
	8KNuUkWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qYtGF-001O8M-1v;
	Wed, 23 Aug 2023 19:11:23 +0000
Received: from mail-lj1-x235.google.com ([2a00:1450:4864:20::235])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qYtGB-001O7Y-2e;
	Wed, 23 Aug 2023 19:11:21 +0000
Received: by mail-lj1-x235.google.com with SMTP id 38308e7fff4ca-2b9d07a8d84so93531771fa.3;
        Wed, 23 Aug 2023 12:11:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692817874; x=1693422674;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=z/z++L67LsgS5CeBHRbV3vQihN14HaxRSYn9ahWfvaI=;
        b=j5NWQxKgKxiyKasFqwOGDRncYcWX5tb0apAk/rligFF/9nY20cTHqm7QfzSbRog0Iv
         0zbr1xpLQEWG8tXsZL9ShwNI1thvgYstvYrUA3N0ykI4dn9niP6hJEqHDPaior3M107f
         da4TUZIyTOvU6BPFriAjPDBO72Q6UOnYo5ewB4aba1BgpTPSFm2HU7jvv7v1dfSb03DJ
         OXfluvr5aF8yRJOTsdTm/PR65j/oe851GBxxk6YleLdenxTv7EmHcj5qY6ADMzNQc7f3
         zeG86A0qlUwhgdbKVfM7B0SvA7rueFk3uffJeE/i/mxGUK8SDkOCy7I4sNO+GbH8xdhr
         grGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692817874; x=1693422674;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=z/z++L67LsgS5CeBHRbV3vQihN14HaxRSYn9ahWfvaI=;
        b=MI9ASFZRh2SV+EDJslXWK46dwviPqGVMKtFYwizymNFRQXngInPACWz5Db+aabjzqm
         nBlEBIXeaMSf7LrG+tXYGs35UAqpjJdymvSg9U/gLcI/Ys+YJVOjQhJvvN9tiyuOhP+S
         JUR5g+krxGvgOYqTVBrVNb8+itPRwGLV1cIplfsb2zxNgvQqT+x+jC/OxfGPJxofKlTy
         wrbAvsRI45EaGvB0JSP2jcGkeuGWOVQ5i9REbgreMf/C4Js9PsXUIOYUcgM28tSV5j1T
         uPChLSJwfF7/GP6v84MsM32cICD30pLCxoq85KQPTZQXsuXCfc6fupI+U3X85eDQW/1H
         lIhQ==
X-Gm-Message-State: AOJu0YxYfmXYVp0p/NTm7lHzrsje1ykZLIeQsrT95YNetRyGqUbzuC6w
	1SeNb2v7BZPHsGs8TrFl2AxAcqEi2UM=
X-Google-Smtp-Source: AGHT+IFTKofw15kfmJaES5wnAO8K/GJ/mqB+Un+40kpOipUOrSBoQbYDlcpIRBkEZyL3pswrSrTZ0Q==
X-Received: by 2002:a2e:9104:0:b0:2ba:5ca7:2311 with SMTP id m4-20020a2e9104000000b002ba5ca72311mr10376164ljg.41.1692817873870;
        Wed, 23 Aug 2023 12:11:13 -0700 (PDT)
Received: from jernej-laptop.localnet (82-149-12-148.dynamic.telemach.net. [82.149.12.148])
        by smtp.gmail.com with ESMTPSA id rv6-20020a17090710c600b0099cc3c7ace2sm10189735ejb.140.2023.08.23.12.11.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Aug 2023 12:11:13 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Ulf Hansson <ulf.hansson@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Chen-Yu Tsai <wens@csie.org>, Samuel Holland <samuel@sholland.org>,
 Rob Herring <robh@kernel.org>
Cc: linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-sunxi@lists.linux.dev
Subject: Re: [PATCH v2] genpd: Explicitly include correct DT includes
Date: Wed, 23 Aug 2023 21:11:10 +0200
Message-ID: <12268735.O9o76ZdvQC@jernej-laptop>
In-Reply-To: <20230823170438.2489746-1-robh@kernel.org>
References: <20230823170438.2489746-1-robh@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230823_121119_896021_2F50966E 
X-CRM114-Status: GOOD (  11.97  )
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

Dne sreda, 23. avgust 2023 ob 19:04:37 CEST je Rob Herring napisal(a):
> The DT of_device.h and of_platform.h date back to the separate
> of_platform_bus_type before it was merged into the regular platform bus.
> As part of that merge prepping Arm DT support 13 years ago, they
> "temporarily" include each other. They also include platform_device.h
> and of.h. As a result, there's a pretty much random mix of those include
> files used throughout the tree. In order to detangle these headers and
> replace the implicit includes with struct declarations, users need to
> explicitly include the correct includes.
> 
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---
> v2: Previously sent for drivers/soc/. Gathered up files which got moved
>     to genpd to new patch.
> ---
>  drivers/genpd/mediatek/mtk-pm-domains.c | 2 +-
>  drivers/genpd/mediatek/mtk-scpsys.c     | 2 +-
>  drivers/genpd/sunxi/sun20i-ppu.c        | 2 +-

for sun20i-ppu:
Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej



