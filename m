Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0EB4DC64EC4
	for <linux-mediatek@archiver.kernel.org>; Wed, 22 Feb 2023 04:39:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GVoxvyPN1nhO1N4WDOubFYF2WsT9Vx0F6vnuM2++yDk=; b=SXNbdCeis2HNa6RBf/Q+yWc8v3
	U97Qm2Rl473uTTq+aGyF5a6fScTh3epZH2Hit3njzkGMhT5CChh4Ew3xRnQKGg77qMVwwJXAGFbR7
	JH9rnHMx0m7y7bHYTEUCx82rZm0nguKC1UCPloF3NKD4DwOHsDoWRb+kv21ojrm68l9QlMOKV/Wiv
	t/ONQyKPgbXIex+yEa7FfCHJM4jzrgOHMRYgZIUmq0pooXiJoFQdo/d7ZBclKxHV3XjlRfMIvO3aC
	4LpCt8GKUou0PiiWcLfKi7CjUaJT++0IzDZf7b68eci1T3zQuIF+tC1u1jWm1y8R4MTeWY4Z3yAyq
	xIXMz6kA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pUguU-00AkjL-U4; Wed, 22 Feb 2023 04:39:18 +0000
Received: from mail-vs1-xe33.google.com ([2607:f8b0:4864:20::e33])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pUguS-00AkhC-CQ
	for linux-mediatek@lists.infradead.org; Wed, 22 Feb 2023 04:39:17 +0000
Received: by mail-vs1-xe33.google.com with SMTP id 6so7362162vsv.7
        for <linux-mediatek@lists.infradead.org>; Tue, 21 Feb 2023 20:39:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=GVoxvyPN1nhO1N4WDOubFYF2WsT9Vx0F6vnuM2++yDk=;
        b=aL/X1/QSvGLZUB2gQzJlQGgNBI0utUwoe+QVxxv47ccsL91gPFsZ8EhrIKAcwkTtl5
         ydBjo6D40FwxudR7M8CIsAgSmn4szkb4iSQsSHKOznqjBjEFAFopUM8ubJQuGalc73Zb
         9O0Cr60WrMikcg0bCxsbDMDeXgTY4ejDaw4gc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GVoxvyPN1nhO1N4WDOubFYF2WsT9Vx0F6vnuM2++yDk=;
        b=ZpRh4V59wrEjC3E1tAmBbpFbXHPzO5cnZUKfWbThXpl7CI/hg+N0kBj1SNhr+v5GPI
         fI+dTCRBhA9yOlDVLqLl2vzDp55k5XPELObSAbzclkctXjufK2QEjtLe0rjPtXQ/uY0I
         IcdhOVLpY/YoWNL1ARNtPePfcHHaYtVhZNiHgDthRPpqt/bEr2rVuHyc8zL7hMe/G0ZW
         MmmvfWFhW0hMli63n1n11Ugj5gvrlLO1YBevIkOPZywKcU34a8/o9eFNhOCIPNsov/0D
         pwjaOxyG/Z9Vm9PTrwncP0wOWfm0jTBlHql448PCBTZyy4lfSR0GYsDZWAfnHkboeyb9
         oTFg==
X-Gm-Message-State: AO0yUKUvLebY17NuOFIvWJzJmcfnKv80ggKcGFpJrFAxKYvFa9+5zhbG
	99gaO77x45Hss3z4guK6S3WWkGLp70iuu78qtwty+g==
X-Google-Smtp-Source: AK7set8Svy6X2qVPrDh0/xqnxlJyxoyam0jIuQ00GgQwGtx0+ljaNuLzHxrSOvTRQu+v7FfJ8TiLYQfAUv4WRifKOu0=
X-Received: by 2002:a05:6102:570b:b0:3fc:58d:f90f with SMTP id
 dg11-20020a056102570b00b003fc058df90fmr1475672vsb.60.1677040753210; Tue, 21
 Feb 2023 20:39:13 -0800 (PST)
MIME-Version: 1.0
References: <20230221153740.1620529-1-angelogioacchino.delregno@collabora.com> <20230221153740.1620529-10-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230221153740.1620529-10-angelogioacchino.delregno@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Wed, 22 Feb 2023 12:39:02 +0800
Message-ID: <CAGXv+5EJpkzKFJFzuz8d5xNzxwnJ=X+MpvXspUHYCNKB8YRNaQ@mail.gmail.com>
Subject: Re: [PATCH v2 09/10] drm/panfrost: Add mediatek,mt8192-mali compatible
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: airlied@gmail.com, daniel@ffwll.ch, robh+dt@kernel.org, 
	krzysztof.kozlowski+dt@linaro.org, steven.price@arm.com, 
	alyssa.rosenzweig@collabora.com, matthias.bgg@gmail.com, robh@kernel.org, 
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230221_203916_437932_1DE19883 
X-CRM114-Status: UNSURE (   8.70  )
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

On Tue, Feb 21, 2023 at 11:37 PM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> From: Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>
>
> Required for Mali-G57 on the Mediatek MT8192 and MT8195, which
> uses even more power domains than the MT8183 before it.
>
> Signed-off-by: Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>
> [Angelo: Removed unneeded "sram" supply, added mt8195 to commit description]
> Co-developed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> Reviewed-by: Steven Price <steven.price@arm.com>

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>

