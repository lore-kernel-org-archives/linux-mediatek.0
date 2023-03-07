Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48009C678D4
	for <linux-mediatek@archiver.kernel.org>; Tue,  7 Mar 2023 09:54:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZiJUwfXXWKebxDkpzA7S70ZvbXc9ROq8nFsaPfKDwtA=; b=IDB66A9J6OqZ1yDHfVsMJziUxj
	isaojL1Azvdoq63fqI0kGi3eP3t/8kjRngFHUCrNwWaMHep+PZ4lYOE8/+tx7yN48yoj6x/Es4jMA
	cfJuIMxxVNw/imDjjQPDM7LMHGglcSLwjovGj6J4jylK7u5IYR9ZlTFGtabpiWK9oXgRTlVJhxlF5
	2YPvTzeiNKRma+wJ5MgvtPSWrCWHJKqLl/Sd/VGyHb+FWC0b59bJOVq3w6DQoZ7CYdwsmDifdFN91
	OhoFX7uUpb6S3S5d3Jjp+RzjnW1ZO3ApDKQszj2s1hquGoMTvPaGF9r/Wc08Yi/0+154jbZTGZ8ph
	L8xBFMTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZU1j-00H3xr-LI; Tue, 07 Mar 2023 09:54:35 +0000
Received: from mail-vs1-xe35.google.com ([2607:f8b0:4864:20::e35])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZU14-00H3XC-KE
	for linux-mediatek@lists.infradead.org; Tue, 07 Mar 2023 09:53:59 +0000
Received: by mail-vs1-xe35.google.com with SMTP id d20so11778563vsf.11
        for <linux-mediatek@lists.infradead.org>; Tue, 07 Mar 2023 01:53:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1678182832;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZiJUwfXXWKebxDkpzA7S70ZvbXc9ROq8nFsaPfKDwtA=;
        b=LCnLo+1Lt8yESm8HOaYnZDce+UzPbTLSyBa9jOeFGnomDhvHHP3JVwfDhwEYufqpRL
         mvx/zBNfZq1ThX2nv1i8W+7g4cppdPw6UB7tyvfCR5g+2h3CEE/U6RnJsH2KkZGbRF80
         PBe1EBCPuFy0zFp5oi7VY95HQZSdqmMN0VrFM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678182832;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZiJUwfXXWKebxDkpzA7S70ZvbXc9ROq8nFsaPfKDwtA=;
        b=PsYPv2Xz40Y96jeuEmKkEyrhUHPRHnaYltryqp4A9tyKURfsJyP1yePf+BXVKtKKUs
         1n5lUsaLKT1YviMszc3rdHRuOweyAurWgZBVU2+SsssdxwAgswsCL0nxCZo2BRdNWr/d
         OUKdgLP+/TeZCIi5PviAzrUwWFEVTNQ82ioo21xspeXDqxdrkJrM5ZotNXbuFNzcn7Kj
         0vdrtORJdP8hI3LGeoESJx+oROcuRSm7bqLCa3Vfx7+7F8qKFxaEQO/WQ6l02v1TGlmG
         90WvUZor9JE83fv1QoDp9PIeuAbayDucckieRn8V5zruUZ8Oo+rN8sv33Rln3K81B4LG
         rzOA==
X-Gm-Message-State: AO0yUKWWYZB4zlEWlkTpIwyMkALdVubdTamAexY+bN4bOm7EBX2R20ot
	1KmzI6QqY5tsjbC52XwkP6W9etqijGJ4osxgZhZoBQ==
X-Google-Smtp-Source: AK7set+6irPSk3s8bwrc7X4UKLc0k0PJT/LZgEKEVJOKB17JmYB6LU5bRJAQFAFODuPu7JFfjvtfu1Vqd9CK04niu14=
X-Received: by 2002:a67:d583:0:b0:411:fff6:3cc4 with SMTP id
 m3-20020a67d583000000b00411fff63cc4mr9654426vsj.3.1678182832240; Tue, 07 Mar
 2023 01:53:52 -0800 (PST)
MIME-Version: 1.0
References: <20230228102704.708150-1-angelogioacchino.delregno@collabora.com> <20230228102704.708150-9-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230228102704.708150-9-angelogioacchino.delregno@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Tue, 7 Mar 2023 17:53:41 +0800
Message-ID: <CAGXv+5HSAM46wzQ4ef+S3SPg3yhFVS9nar8wRmtzFc_hzsyn3g@mail.gmail.com>
Subject: Re: [PATCH v4 09/12] drm/panfrost: Add the MT8192 GPU ID
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: airlied@gmail.com, daniel@ffwll.ch, robh+dt@kernel.org, 
	krzysztof.kozlowski+dt@linaro.org, steven.price@arm.com, 
	alyssa.rosenzweig@collabora.com, matthias.bgg@gmail.com, robh@kernel.org, 
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230307_015354_721613_16BE91DF 
X-CRM114-Status: GOOD (  10.19  )
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

On Tue, Feb 28, 2023 at 6:27=E2=80=AFPM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> From: Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>
>
> MediaTek MT8192 has a Mali-G57 with a special GPU ID. Add its GPU ID,
> but treat it as otherwise identical to a standard Mali-G57.
>
> We do _not_ fix up the GPU ID here -- userspace needs to be aware of the
> special GPU ID, in case we find functional differences between
> MediaTek's implementation and the standard Mali-G57 down the line.
>
> Signed-off-by: Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@coll=
abora.com>
> Reviewed-by: Steven Price <steven.price@arm.com>

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>
Tested-by: Chen-Yu Tsai <wenst@chromium.org>

