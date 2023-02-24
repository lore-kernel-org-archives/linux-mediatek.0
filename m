Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4D0DC64ED8
	for <linux-mediatek@archiver.kernel.org>; Fri, 24 Feb 2023 10:04:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TOM+IbwtBAiPFvq6ycNMUw45nB2aH2u3BMzF8LfulTo=; b=S9qgksXvh5xgvJgvCCwsOEQOlj
	wirdJkFnQYxsDl054agXjivUEyJmPahdpVNT6VrVj9wiJMYSs7UN06fQ2zn0eMG0s5116nfvsbj74
	MXpLYbAg/Uxga8paETb5+iPPG9LkPenAFpMT7ZoQcS4MtIA0z0IWOTjG4/SzjcGY75h2Mwsdk4hB/
	IPoYO++idpBUKOZ6DICyfd6ji/zvODULNFUwN+p68PvsGzFJV/IkMfpRqM6IsfHAb+ve2TYckYA9n
	jWLLGT9Pry4k3xlD9/oPQ7EPd23kcF3UxeliwNUNF6FxVgStLdprjVO/2/dZaAM1MWDFiMZE2BsTp
	Stg0q77A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pVUwI-001rFt-Dm; Fri, 24 Feb 2023 10:04:30 +0000
Received: from mail-vs1-xe31.google.com ([2607:f8b0:4864:20::e31])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pVUvQ-001qkT-Ez
	for linux-mediatek@lists.infradead.org; Fri, 24 Feb 2023 10:03:38 +0000
Received: by mail-vs1-xe31.google.com with SMTP id v27so12777878vsa.7
        for <linux-mediatek@lists.infradead.org>; Fri, 24 Feb 2023 02:03:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=TOM+IbwtBAiPFvq6ycNMUw45nB2aH2u3BMzF8LfulTo=;
        b=lJjz2Ig4+Qs0/rc6HicYYxTiXTrw3KU0aEtlIWog/dkOb8669avk/G9Gc4z2yCrPEl
         UoSJKuPWV6wmTncogJPoVR1Libzx7QPM8JhpBQbdMWNV0msZeWG4uvYtb/X+GnIDdPXR
         xm22++ecslEfdQwZpn9qB5YEVo0hakXaU17uU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TOM+IbwtBAiPFvq6ycNMUw45nB2aH2u3BMzF8LfulTo=;
        b=VjrGUVxYftupJfGQOVKTAWbow+aza8t8Jgxt3Ht0Slj9IgTvfbIlh5jZWI0wAP5EZN
         3orB9jgYiYuPUTMt2hFSaNx37mIaqTD8+Zkohcr+RmwowHvZHE4C5HL9YbWCTvDvTvLC
         2ZcLEOMPWvIBMBvq+Mc8423iTHUS2iEglNFCVQd3OmtRJRFXbNA3kV+ywP5D1vP8sjpK
         SwEKEtDzkW580i6VPOeTyavaHlpelaZUtJv66CbZDspS5EIOs8tsdEOxsOAeXPYxaUP9
         YUwSVy4qyRgm1hEntERziON+Bty7tED1SIS1hDbhtR7SM9Zln2KZBIu6Pe+F+Ymn2SLG
         22fw==
X-Gm-Message-State: AO0yUKWl/MwbBj8Noaq+YyMBoC5OYnT+D5Agzsnlp+t6M/VEgWcEujLV
	DIhDN5yM+Q7WCtznz8YAVIq+KPmESYaz/j4fH5NWPQ==
X-Google-Smtp-Source: AK7set/SYPCxVBflpRQGKecsjnyfDdkoGF7kargtYFZ6pSE/pnkb0nj2hS8BJcPINJZtdPjnTGck5LQCaDsEStN/Zvs=
X-Received: by 2002:ab0:1014:0:b0:68b:90f4:1d8c with SMTP id
 f20-20020ab01014000000b0068b90f41d8cmr4235195uab.1.1677233015332; Fri, 24 Feb
 2023 02:03:35 -0800 (PST)
MIME-Version: 1.0
References: <20230223133440.80941-1-angelogioacchino.delregno@collabora.com>
 <20230223133440.80941-12-angelogioacchino.delregno@collabora.com> <4e0673e7-5685-ad1b-2fac-4ae544caefeb@arm.com>
In-Reply-To: <4e0673e7-5685-ad1b-2fac-4ae544caefeb@arm.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Fri, 24 Feb 2023 18:03:24 +0800
Message-ID: <CAGXv+5E68nV_Lj-fE5aTqBryUwMu+JJ0N=EZEzjLTXp+980MEQ@mail.gmail.com>
Subject: Re: [PATCH v3 11/11] drm/panfrost: Add support for Mali on the MT8186 SoC
To: Steven Price <steven.price@arm.com>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, airlied@gmail.com, 
	daniel@ffwll.ch, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, 
	alyssa.rosenzweig@collabora.com, matthias.bgg@gmail.com, robh@kernel.org, 
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230224_020336_525044_393ED854 
X-CRM114-Status: UNSURE (   9.42  )
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

On Fri, Feb 24, 2023 at 4:46 PM Steven Price <steven.price@arm.com> wrote:
>
> On 23/02/2023 13:34, AngeloGioacchino Del Regno wrote:
> > MediaTek MT8186 has a Mali-G52 MC2 2EE (Bifrost): add a new compatible
> > and platform data using the same supplies list as "mt8183_b" (only one
> > regulator), and a new pm_domains list with only two power domains.
> >
> > Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
>
> Reviewed-by: Steven Price <steven.price@arm.com>

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>

