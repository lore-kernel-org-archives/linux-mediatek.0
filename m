Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1C0BC64ED8
	for <linux-mediatek@archiver.kernel.org>; Fri, 24 Feb 2023 10:05:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0u8VmJumLQNtV9/ARtd+o+9mpGq0aOZ8ZCgtdjL5v+w=; b=X8WBNqSUt/2+uQPI5B4w8vMUpb
	3ewV6jTPRmzc1Q9VXzsdLmLSEzkZjLT8oZ9QMTXLAcWIKSw+NmNV9wsaNi+sCDvgsDGvpP/eXOSSn
	N7XNvpnns+pxo1rZR4NeKTjBPFmLCRbCXISXfTHwDH1tdFN1eOplg4onN2SwPaJqX24ynd1t9UvrS
	BPX5H6v0l5kNP6X5pGaJK9YTJDJFUAdKKw+gL48fdtrJwVykG8W+FiZqe6CdzVRQsVocJgKvA0GD6
	UQv1ki47q0uXrxXTn+LUboQmy0zkeBairKu/v8WcEupf0SN0/mTi5si67iu1tXGJi717JmbbjhpiO
	b8Qr6HSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pVUwy-001rgh-S7; Fri, 24 Feb 2023 10:05:12 +0000
Received: from mail-vs1-xe31.google.com ([2607:f8b0:4864:20::e31])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pVUvp-001qkT-V8
	for linux-mediatek@lists.infradead.org; Fri, 24 Feb 2023 10:04:05 +0000
Received: by mail-vs1-xe31.google.com with SMTP id v27so12779913vsa.7
        for <linux-mediatek@lists.infradead.org>; Fri, 24 Feb 2023 02:04:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=0u8VmJumLQNtV9/ARtd+o+9mpGq0aOZ8ZCgtdjL5v+w=;
        b=EgsPh7aSD/co6nKbOhDHsb3KMpAIMysgVMJfaHHYHNPA073DiSs2ERsYTUzdL3kVko
         eMmyJKRblWg9LZ+22ANmwLaKQWEaYMv1WoM8T9j/5/70vpsyoiD+5RfSO0QIGFAO/1wB
         JeO5cdxPNefTYF9xqcMpZPLRc8jy9sDK34+l8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0u8VmJumLQNtV9/ARtd+o+9mpGq0aOZ8ZCgtdjL5v+w=;
        b=L5sJv4U1FywAdFDSTCYtHfAU4N0cai+HWQpgTqGX/W4AqtP0VwjTsowzI7WD1cIhxn
         cwTHMxXD9F1YdXmJrrWZfs406jvI4MInvznRev0iBe54s8+Bp2G8IuaUUlqt/vQS6Hhj
         RUOUn3PgDMR4EjZg6Q5IFt7BrwfYAUIXfsRoJZ4aJE0PrdHSkVZZzbltb+ixx7JvyWqu
         9drhp8wXH+VZ9OiK0anFmpUUm5g6NKaXuiDy+SCQdYJ50hCXHnmhXyx0+YnrSoZcg5Z2
         7WDZdEjgYcA43dQyfdr/EYAO6AzH0wyzrN9UWV5+a1qIKz5BGoGeuO8wFlg0pc1WDCc0
         2wbA==
X-Gm-Message-State: AO0yUKUmRiUkcFfQKMYkKOn7c4aeLhcFNM4SrypSiqbcUytAsEd8tpOQ
	/pBmG2ts24IU+gOwW0wx744IBPtmSWdhH05oZboF/g==
X-Google-Smtp-Source: AK7set/EfMTEye/Wi0OVyrpkCCmfX4ds+u4ezKh/3ZXapSRgu/h6EFpnsSXhr2sXtUcVxibs89nG9mgSVoo2QY9u5Bo=
X-Received: by 2002:a67:d21c:0:b0:402:999f:51dd with SMTP id
 y28-20020a67d21c000000b00402999f51ddmr2209797vsi.3.1677233041527; Fri, 24 Feb
 2023 02:04:01 -0800 (PST)
MIME-Version: 1.0
References: <20230223133440.80941-1-angelogioacchino.delregno@collabora.com> <20230223133440.80941-11-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230223133440.80941-11-angelogioacchino.delregno@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Fri, 24 Feb 2023 18:03:50 +0800
Message-ID: <CAGXv+5Ekx0NNf349qYsJXXXpNSFnT6Qq1zved9peBpn1ybVfKA@mail.gmail.com>
Subject: Re: [PATCH v3 10/11] drm/panfrost: Add new compatible for Mali on the
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
X-CRM114-CacheID: sfid-20230224_020402_036573_C7186746 
X-CRM114-Status: GOOD (  13.38  )
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

On Thu, Feb 23, 2023 at 9:35 PM AngeloGioacchino Del Regno
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

