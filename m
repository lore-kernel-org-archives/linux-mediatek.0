Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95B50C77B7A
	for <linux-mediatek@archiver.kernel.org>; Wed, 31 May 2023 13:59:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0vEqY/E4kBl9Nf1zMfIIL6jodud4pGK1JF+jErJgfEs=; b=SOP83bqliHa568RQRDzODioH2T
	NtIQyj08B7Hr1vvZxiNZCJ82D96IAdf0DJAbR2sG5medTSyoKhKfUlGKQIYZJUHj8NenK9I2OkBgN
	1P9DjKy+2CPM3mpfiThe0e9lYa23jNlpn3s54iwZ4zgLls8B/MxwWJ5oMQ0fJqHdnPyYSa1mrsA9b
	41b9w6TmmFWGVlhNuNU0oD0Bb1UCX2fip1V7MEAQanEnlOLNjwAfpmaqQyoVjFJmcJatFyGv95v+J
	nnNIEUAX9mpxahWIReOLd2u+zdjh2TZCTSrMZ1Tv1/Q7FF1PNmH6QZo4V6wO+SnckxPhfyJ9pNQw9
	OWc9iT7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q4MLo-0003mH-2d;
	Wed, 31 May 2023 13:58:56 +0000
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q4MLl-0003jy-0a
	for linux-mediatek@lists.infradead.org;
	Wed, 31 May 2023 13:58:54 +0000
Received: by mail-pj1-x1030.google.com with SMTP id 98e67ed59e1d1-256766a1c43so2159222a91.1
        for <linux-mediatek@lists.infradead.org>; Wed, 31 May 2023 06:58:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1685541529; x=1688133529;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0vEqY/E4kBl9Nf1zMfIIL6jodud4pGK1JF+jErJgfEs=;
        b=neIWSeebU38L+k7ehAS+RBxHNWEupmG722beJumbpZqMWPccr+dJUq/da+lyhS+3d0
         A7eN6MEyJse/zz2b93tTm7ogYYpilgD7gr09jUGBOCYhgwAeTR6P8flu98t4NQVGFPg9
         rnMcVgarQAe+HSvd6ojjp89K/RTl0OKUFdDIg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685541529; x=1688133529;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0vEqY/E4kBl9Nf1zMfIIL6jodud4pGK1JF+jErJgfEs=;
        b=M7xTTK5yxbdkaqsVUujhmyBPHVZRkVtrcwJX9Wl3i8dgyldnPpGGJs12Nsd1mCTSti
         PuUeFa4tmMaUlXgStwQD17Gr+YOlx7XlYkS3W5jIDAAl3KTAYfVeSB9muj34oawEy60L
         Sy7eFFJ8dblJD42cDIEypjMaq/8KNRt0gNMs915Nh1pCtvkr6AC+FrTQiPaja/vtimkb
         3iqWJvNWy8VUmGgtmYQvcT7g3PwLeYjCZkMemeVSB2NBHNOb8ZwhlZLgMBy7FMkiadLk
         TumXEPR1K3kMLq7Slc4DGLsfsIdizL/4zJW/ta6BzPb7sbAh19b2Xp6f/zypR+Nb2IHJ
         I6Wg==
X-Gm-Message-State: AC+VfDzfhdTBV7Jwhif5ys7mmlLb6Iy/cEfGrZ7CqSh8HKAF715Rnqcy
	qFKi3VBFTIhBCyeruRwIkDYaErfzp4ojoy+VkLE=
X-Google-Smtp-Source: ACHHUZ57qxtC02+70aFaDJBdbKoPpdEBRW4KgCVCStpt3wm0VQgFJg7DAuiG0eZn98o17kA0IEOeHw==
X-Received: by 2002:a17:90b:1d07:b0:256:78d7:9c75 with SMTP id on7-20020a17090b1d0700b0025678d79c75mr4766616pjb.19.1685541529007;
        Wed, 31 May 2023 06:58:49 -0700 (PDT)
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com. [209.85.214.174])
        by smtp.gmail.com with ESMTPSA id 18-20020a17090a001200b0025645ce761dsm1329172pja.35.2023.05.31.06.58.48
        for <linux-mediatek@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 31 May 2023 06:58:48 -0700 (PDT)
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-1b025aaeddbso126415ad.1
        for <linux-mediatek@lists.infradead.org>; Wed, 31 May 2023 06:58:48 -0700 (PDT)
X-Received: by 2002:a17:903:7cb:b0:1ab:2763:e003 with SMTP id
 ko11-20020a17090307cb00b001ab2763e003mr110372plb.17.1685541527389; Wed, 31
 May 2023 06:58:47 -0700 (PDT)
MIME-Version: 1.0
References: <20230531134020.3383253-1-sashal@kernel.org> <20230531134020.3383253-12-sashal@kernel.org>
In-Reply-To: <20230531134020.3383253-12-sashal@kernel.org>
From: Doug Anderson <dianders@chromium.org>
Date: Wed, 31 May 2023 06:58:35 -0700
X-Gmail-Original-Message-ID: <CAD=FV=WpsV8hZBkHVbVCSkatnkGN=oMebEGykGDvaOr+2yyikQ@mail.gmail.com>
Message-ID: <CAD=FV=WpsV8hZBkHVbVCSkatnkGN=oMebEGykGDvaOr+2yyikQ@mail.gmail.com>
Subject: Re: [PATCH AUTOSEL 6.3 12/37] irqchip/gic-v3: Disable pseudo NMIs on
 Mediatek devices w/ firmware issues
To: Sasha Levin <sashal@kernel.org>
Cc: linux-kernel@vger.kernel.org, stable@vger.kernel.org, 
	Julius Werner <jwerner@chromium.org>, Marc Zyngier <maz@kernel.org>, tglx@linutronix.de, 
	matthias.bgg@gmail.com, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230531_065853_251733_3A5A09BC 
X-CRM114-Status: GOOD (  23.52  )
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

On Wed, May 31, 2023 at 6:40=E2=80=AFAM Sasha Levin <sashal@kernel.org> wro=
te:
>
> From: Douglas Anderson <dianders@chromium.org>
>
> [ Upstream commit 44bd78dd2b8897f59b7e3963f088caadb7e4f047 ]
>
> Some Chromebooks with Mediatek SoCs have a problem where the firmware
> doesn't properly save/restore certain GICR registers. Newer
> Chromebooks should fix this issue and we may be able to do firmware
> updates for old Chromebooks. At the moment, the only known issue with
> these Chromebooks is that we can't enable "pseudo NMIs" since the
> priority register can be lost. Enabling "pseudo NMIs" on Chromebooks
> with the problematic firmware causes crashes and freezes.
>
> Let's detect devices with this problem and then disable "pseudo NMIs"
> on them. We'll detect the problem by looking for the presence of the
> "mediatek,broken-save-restore-fw" property in the GIC device tree
> node. Any devices with fixed firmware will not have this property.
>
> Our detection plan works because we never bake a Chromebook's device
> tree into firmware. Instead, device trees are always bundled with the
> kernel. We'll update the device trees of all affected Chromebooks and
> then we'll never enable "pseudo NMI" on a kernel that is bundled with
> old device trees. When a firmware update is shipped that fixes this
> issue it will know to patch the device tree to remove the property.
>
> In order to make this work, the quick detection mechanism of the GICv3
> code is extended to be able to look for properties in addition to
> looking at "compatible".
>
> Reviewed-by: Julius Werner <jwerner@chromium.org>
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> Signed-off-by: Marc Zyngier <maz@kernel.org>
> Link: https://lore.kernel.org/r/20230515131353.v2.2.I88dc0a0eb1d9d537de61=
604cd8994ecc55c0cac1@changeid
> Signed-off-by: Sasha Levin <sashal@kernel.org>
> ---
>  drivers/irqchip/irq-gic-common.c |  8 ++++++--
>  drivers/irqchip/irq-gic-common.h |  1 +
>  drivers/irqchip/irq-gic-v3.c     | 20 ++++++++++++++++++++
>  3 files changed, 27 insertions(+), 2 deletions(-)

Please delay picking this across all stable versions unless until you
can also get Marc's fix:

https://lore.kernel.org/r/168544149933.404.717399647227994720.tip-bot2@tip-=
bot2

-Doug

