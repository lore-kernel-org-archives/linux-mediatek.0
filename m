Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3B82C61DA4
	for <linux-mediatek@archiver.kernel.org>; Wed, 22 Feb 2023 07:07:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qlPwPykFYo8rhIVwD6mBB4FPi0U1mYPcwHgebQEUnaw=; b=W3v6t8Vf7RLJX2Khm3RkOfZacS
	JcMMdM1skEn+PVxfKhylb25Ha3YExzpTseRY85qM856PG/NsMAfOX+5wahddT1tGLRERaMCLTJyH+
	8iFLRiFU/DxcorLzEkXFuUYF6dTWhhIk+99AexZtEUME71IHA4Tb95i44laUYaXjmGMuBmLz0Bz+o
	If6fCN8o+SbzIeBn1TTI+VvHk31lXM3Kflv/ORyLZ4q1sUam0yFuckweEvDa+rHdOADBhT1P/nobA
	DXbtDa2O4dHd/YW9AA0c6/WSV9e0mb8wzmV8Mlxx5WM1duh0TSIZpHn7a8CaaYVCmrxmVIyEwYxxt
	rs4w3nQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pUjDf-00B1UL-6A; Wed, 22 Feb 2023 07:07:15 +0000
Received: from mail-ua1-x92c.google.com ([2607:f8b0:4864:20::92c])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pUjDb-00B1SL-P1
	for linux-mediatek@lists.infradead.org; Wed, 22 Feb 2023 07:07:13 +0000
Received: by mail-ua1-x92c.google.com with SMTP id s13so2243909uac.8
        for <linux-mediatek@lists.infradead.org>; Tue, 21 Feb 2023 23:07:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=qlPwPykFYo8rhIVwD6mBB4FPi0U1mYPcwHgebQEUnaw=;
        b=VXIAa7FunJm6q3CeB62nQ167gZdQVEQe2WuW1+KVUVZUKVfVSRrsFHRIuvLcvB+WAI
         BkW2mPJ4C7KTo2uk2BNR5ieJykYAv4X+UkH3enEhjvEHcvm8VjYHwUjN7CBfiAFvp+r3
         S/1r2W9l9+ur2AMr7PnVyAh/q4cfsy1OA2+z4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qlPwPykFYo8rhIVwD6mBB4FPi0U1mYPcwHgebQEUnaw=;
        b=lxi6+vet79wBOz9HcdpwOxO7Poe7Otq4Qm2OS0cq0rq27OPPrSAjHPhDeIgQE2+7+W
         9BoNas3GvAmVesEO6Sv9f/4bTdliOXJfgzbDd1vcjmbpifw0oVpLhs3FDmsAY1ieJwWJ
         3HN7QhbuStsaYy1sxck1Mbp8zDn+cT7SB/N8Oz3WPwXcsTTeItbPTb6jzZsnqq6BWwxm
         jQLZGr2lkyPtqekZypEnWMgDEflKQNgOG2ND+wuiqV2hCMGf9Yk++McH4LHYx34DPsLU
         LgW1lNIkzWduZ8mi2SRUKqd2+wH7b7ywF2EDgbhPPTQlf8z6O+9HomSIqvtL3yJl0qG+
         FFDQ==
X-Gm-Message-State: AO0yUKURvJ1q/DjsjRn6sxQJAGrpgLMj/qn0i48LwR6LWwnEGMC7n9z4
	HqGau/8Dkh+AfY/K8AJhVMNfegX1JhpKs+0oWM/xJA==
X-Google-Smtp-Source: AK7set8LX05PaXjP97oF1G9cF2P3OWsBmaHQhbW//L1C7tUi+Z8JteajDRu6P6E5vLHDtTDlMdm48IpSEsLEbY4UVV4=
X-Received: by 2002:a1f:208d:0:b0:3e8:66ce:a639 with SMTP id
 g135-20020a1f208d000000b003e866cea639mr1283824vkg.2.1677049624519; Tue, 21
 Feb 2023 23:07:04 -0800 (PST)
MIME-Version: 1.0
References: <20230221153740.1620529-1-angelogioacchino.delregno@collabora.com> <20230221153740.1620529-11-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230221153740.1620529-11-angelogioacchino.delregno@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Wed, 22 Feb 2023 15:06:53 +0800
Message-ID: <CAGXv+5FqZPXaE8tyEFtejsYpKMLzUt5R_QnkbQrDSBM_u7rRYg@mail.gmail.com>
Subject: Re: [PATCH v2 10/10] drm/panfrost: Add new compatible for Mali on the
 MT8183 SoC
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: airlied@gmail.com, daniel@ffwll.ch, robh+dt@kernel.org, 
	krzysztof.kozlowski+dt@linaro.org, steven.price@arm.com, 
	alyssa.rosenzweig@collabora.com, matthias.bgg@gmail.com, robh@kernel.org, 
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230221_230711_818308_051EB3A6 
X-CRM114-Status: GOOD (  14.02  )
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
> The "mediatek,mt8183-mali" compatible uses platform data that calls for
> getting (and managing) two regulators ("mali" and "sram") but devfreq
> does not support this usecase, resulting in DVFS not working.
>
> Since a lot of MediaTek SoCs need to set the voltages for the GPU SRAM
> regulator in a specific relation to the GPU VCORE regulator, a MediaTek
> SoC specific driver was introduced to automatically satisfy, through
> coupling, these constraints: this means that there is at all no need to
> manage both regulators in panfrost but to otherwise just manage the main
> "mali" (-> gpu vcore) regulator instead.
>
> Keeping in mind that we cannot break the ABI, the most sensible route
> (avoiding hacks and uselessly overcomplicated code) to get a MT8183
> node with one power supply was to add a new "mediatek,mt8183b-mali"
> compatible, which effectively deprecates the former.
>
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> Reviewed-by: Steven Price <steven.price@arm.com>

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>

