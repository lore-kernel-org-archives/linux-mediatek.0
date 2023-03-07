Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32CB6C678D4
	for <linux-mediatek@archiver.kernel.org>; Tue,  7 Mar 2023 09:53:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3KQIAhdlXww65eUhy0j2w15z+KgD81bSw/EYAnBg8cI=; b=egwOPfi3JzufqEA4pRKyKV9yHx
	rB55wOH6URE+qW830HjEFCgasgwV7E7QztB4uLCnLrrAd6JgDA2gDikYE8PHK2qD8yHCkDABN/1Mf
	3ldkOaCOS+01LE5hBoWEzoQ47DmCUxcpMTodIl6dFjLprvnB0D2i8wjh0NEGM1gVUAoaUGRAy+7Kj
	j+PVFuMpydx5XvXQSpcqblb6a9C3YT0+bfVFprpNXu4qWRtXYIhUiLtI/X+2mCSGwZDITdygimkuT
	egZ7Nzw7kekJN9xnh57EmC3bvrKFjC3s4SG/qA+TrZyKPPWQO4duh4W40E95DTKrvxZQdjS+wDGqO
	pw5abObw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZU0Y-00H3GM-Dy; Tue, 07 Mar 2023 09:53:22 +0000
Received: from mail-ua1-x936.google.com ([2607:f8b0:4864:20::936])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZU0L-00H39G-W4
	for linux-mediatek@lists.infradead.org; Tue, 07 Mar 2023 09:53:12 +0000
Received: by mail-ua1-x936.google.com with SMTP id n4so8408107ual.13
        for <linux-mediatek@lists.infradead.org>; Tue, 07 Mar 2023 01:53:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1678182787;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3KQIAhdlXww65eUhy0j2w15z+KgD81bSw/EYAnBg8cI=;
        b=GqIUUxkGszWnMyOJ9v/BsV0SLfdciSErtv2GTbk1+4kZkly8MVF9kX6UN6NjIVjb32
         HKoSqSqoaG/6JON51LwZn+0Q0RhUULLXfVGKSoXK7kbasF/aigKMDSoXh/l9ADVNG9g3
         Vv3UPAnqRbJrkXBZry3fPmnF+a0p7piAnFTnA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678182787;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3KQIAhdlXww65eUhy0j2w15z+KgD81bSw/EYAnBg8cI=;
        b=dEkwF2wNRssT8nD3GDTC/OboPXIkx9SAnpezAl44wkQ89VwcV1ic6XpeTc8rrjvgvz
         imp0FQVJ3Fr+obcilq9ADNo6O9Yf9JxNYQkVhteb5eUDCn7mme5ezQlecnubSKIsqBV4
         dyhTLboByCnLdHsmJDOyp3o3JVa5F/QcPiO+gSHpknH/i4QiTlw+TFRWB7sa9jdDinpz
         w6NjeeUIJdI3yugCDAeOxmykQCXiMgsaXPHmljB+Gzd4KjwFninAy2iA85vmfec5pZnk
         7pf7XarAwGwLruplMA0MJL6mRoZCPbuCytrmhsoiGznVJ7kDJFhcwfwu5jPTbwWXuoIs
         4w+w==
X-Gm-Message-State: AO0yUKV9QRW2x/Jls7bITXEUlYUM3YPImXZM0JOb6EDtAO6QzD+utXB2
	GnIGUt5xOrvFVhxSrgRguHBXPn5Uo0ILt43kEf3GgQ==
X-Google-Smtp-Source: AK7set/+w8N6bIxRsr/VdjA+rzkO3mjOWFu0972MmNK+MtYl7ZKujQy20Hpt6L+Qt7IMdIula/6V0iHxgFoTKB6NZYQ=
X-Received: by 2002:ab0:544e:0:b0:68a:5c52:7f2b with SMTP id
 o14-20020ab0544e000000b0068a5c527f2bmr8829170uaa.1.1678182786803; Tue, 07 Mar
 2023 01:53:06 -0800 (PST)
MIME-Version: 1.0
References: <20230228102704.708150-1-angelogioacchino.delregno@collabora.com> <20230228102704.708150-11-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230228102704.708150-11-angelogioacchino.delregno@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Tue, 7 Mar 2023 17:52:55 +0800
Message-ID: <CAGXv+5G=fm_R8yqkFGXN0999uZVTjSRW-gyM+1FCA+=TmZFt7w@mail.gmail.com>
Subject: Re: [PATCH v4 11/12] drm/panfrost: Add new compatible for Mali on the
 MT8183 SoC
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
X-CRM114-CacheID: sfid-20230307_015310_059686_DEBECED9 
X-CRM114-Status: GOOD (  13.83  )
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
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@coll=
abora.com>
> Reviewed-by: Steven Price <steven.price@arm.com>

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>
Tested-by: Chen-Yu Tsai <wenst@chromium.org>

