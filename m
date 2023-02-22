Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1ED86C61DA4
	for <linux-mediatek@archiver.kernel.org>; Wed, 22 Feb 2023 08:39:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dmszevi2SksTWD2ubcICrn01x9b0o7eFEQpxMDnqSAk=; b=4AxLG752cGVT1mRJXdUh+VWZdQ
	8Mn19cTSqdb4awUGBakKCXzB9rYBZt/ufQLGxOzNBFBQ1tERyjZT5I20/g9k2VtxKGyy8ADndffv0
	UVXYnmmuuduMOAbCglrrDUuCYvvBHs/zonQ5xckr0LS/iZfkBr1elBdQ6uLSU8iiY0a8JBWYdIzc6
	YPPlFE6BOxmFCn31yNvrHsN3+DNaofEd6OGmLPyUDsv0PHTi+nH6pbc2NnMJ/JCaP2q9aT1urKXb8
	L7Q/UgKOBxXgTMEgfJjrwQ3LzFrfAwAsfQ1bqjoXsXUSpI3hyabmjkSTe5MIDKGmwhcao5ImbEP9o
	Zfni4ktA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pUkf3-00BG6A-9Q; Wed, 22 Feb 2023 08:39:37 +0000
Received: from mail-vs1-xe2f.google.com ([2607:f8b0:4864:20::e2f])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pUkf0-00BG5a-UI
	for linux-mediatek@lists.infradead.org; Wed, 22 Feb 2023 08:39:36 +0000
Received: by mail-vs1-xe2f.google.com with SMTP id f13so3627056vsg.6
        for <linux-mediatek@lists.infradead.org>; Wed, 22 Feb 2023 00:39:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=dmszevi2SksTWD2ubcICrn01x9b0o7eFEQpxMDnqSAk=;
        b=em4VVRc2okwRN3SQHzajqxgirZ/Imo8edo1OC+ktYXzjmKrRYasm0n9PVupus++Icp
         6GWdGZIKZNg7GzwyuGcWREv+Elvk8JiNhCCcTFJT6BuqxpoYHSEcaUfRSk6rBbUy3NYb
         ThcqWvbcTjsO7bJAETYYb5RiVmz0OWMt4SqkU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dmszevi2SksTWD2ubcICrn01x9b0o7eFEQpxMDnqSAk=;
        b=0gN3sum0Shch1SzIbyhCc2ZO1hMUm3rPKbGzDUpjWMUhCAUL0HX0X9hCfwJtl1JilQ
         20nyzpJg4+U0N1HyAIa8kZL7164LBhLi0nvi/WW2tryedR3K6/HXO9VIUYLI89p6Zgtx
         sztovIIascQflsKcfKmUBeUb/4n0J0kdErQ80SE/CobJpOw5Sp4hITcGnFgDI3q6jyqc
         Qai830XKhxF3oaCtssLwNDUCCxViQvmU1X/atlPz18kWPVgcxQTmGjMJoUCkUltCCKcY
         BtZ6h1/fX129tpkgooRjo6HsO0QH0iVoNhn5jP4ssVBO7FZWsfeEbboEwBAVCRUzLhTm
         Wcvg==
X-Gm-Message-State: AO0yUKXrpeehTMDn0Z/jSZp34lBaHUNJT/lCJfoplpXLXodlxlh0s5S0
	DaG5t8C/KnC06WJDerPK+/b6QgLjafhdcVeKw1SQuA==
X-Google-Smtp-Source: AK7set82JgoEJwmJ5PvwiX+SnPjQIuZJcVlZYYzuz1but6a8Se983ORppZPhV01+jbcYZHkfkMc5ZWYwUsQab1btvKQ=
X-Received: by 2002:a05:6102:570b:b0:3fc:58d:f90f with SMTP id
 dg11-20020a056102570b00b003fc058df90fmr1572193vsb.60.1677055174148; Wed, 22
 Feb 2023 00:39:34 -0800 (PST)
MIME-Version: 1.0
References: <20230221153740.1620529-1-angelogioacchino.delregno@collabora.com> <Y/XKhg+wultVbEWW@google.com>
In-Reply-To: <Y/XKhg+wultVbEWW@google.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Wed, 22 Feb 2023 16:39:23 +0800
Message-ID: <CAGXv+5GV2BuQW+XDBzpiWwXDBi0zbjA4dF3_rD62y+B_qK_xOg@mail.gmail.com>
Subject: Re: [PATCH v2 00/10] Panfrost: Improve and add MediaTek SoCs support
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: airlied@gmail.com, daniel@ffwll.ch, robh+dt@kernel.org, 
	krzysztof.kozlowski+dt@linaro.org, steven.price@arm.com, 
	alyssa.rosenzweig@collabora.com, matthias.bgg@gmail.com, robh@kernel.org, 
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230222_003935_000886_C65502D1 
X-CRM114-Status: GOOD (  22.96  )
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

On Wed, Feb 22, 2023 at 3:55 PM Chen-Yu Tsai <wenst@chromium.org> wrote:
>
> On Tue, Feb 21, 2023 at 04:37:30PM +0100, AngeloGioacchino Del Regno wrote:
> > Changes in v2:
> >  - Add power-domain-names commit from Chen-Yu to the series
> >  - Kept sram-supply in base schema, overridden for non-MediaTek
> >  - Added Reviewed-by tags from Steven Price to the driver commits
> >    (as released in reply to v1's cover letter - thanks!)
> >
> > This series adds support for new MediaTek SoCs (MT8186/MT8192/MT8195)
> > and improves MT8183 support: since the mtk-regulator-coupler driver
> > was picked, it is now useless for Panfrost to look for, and manage,
> > two regulators (GPU Vcore and GPU SRAM) on MediaTek;
> >
> > The aforementioned driver will take care of keeping the voltage
> > relation (/constraints) of the two regulators on its own when a
> > voltage change request is sent to the Vcore, solving the old time
> > issue with not working DVFS on Panfrost+MediaTek (due to devfreq
> > supporting only single regulator).
> >
> > In the specific case of MT8183, in order to not break the ABI, it
> > was necessary to add a new compatible for enabling DVFS.
> >
> > Alyssa Rosenzweig (3):
> >   drm/panfrost: Increase MAX_PM_DOMAINS to 5
> >   drm/panfrost: Add the MT8192 GPU ID
> >   drm/panfrost: Add mediatek,mt8192-mali compatible
> >
> > AngeloGioacchino Del Regno (6):
> >   dt-bindings: gpu: mali-bifrost: Split out MediaTek power-domains
> >     variation
> >   dt-bindings: gpu: mali-bifrost: Allow up to 5 power domains for MT8192
> >   dt-bindings: gpu: mali-bifrost: Add compatible for MT8195 SoC
> >   dt-bindings: gpu: mali-bifrost: Add new MT8183 compatible
> >   dt-bindings: gpu: mali-bifrost: Add a compatible for MediaTek MT8186
> >   drm/panfrost: Add new compatible for Mali on the MT8183 SoC
> >
> > Chen-Yu Tsai (1):
> >   dt-bindings: gpu: mali-bifrost: Add power-domain-names to base schema
> >
> >  .../bindings/gpu/arm,mali-bifrost.yaml        | 67 ++++++++++++++++++-
> >  drivers/gpu/drm/panfrost/panfrost_device.h    |  2 +-
> >  drivers/gpu/drm/panfrost/panfrost_drv.c       | 28 ++++++++
> >  drivers/gpu/drm/panfrost/panfrost_gpu.c       |  8 +++
> >  4 files changed, 101 insertions(+), 4 deletions(-)
>
> Tested-by: Chen-Yu Tsai <wenst@chromium.org>
>
> on MT8183, MT8186, MT8192, MT8195 with glmark2.

Note: the MT8186 was tested with incorrect bindings with one extra power
domain, but that doesn't affect functionality.

