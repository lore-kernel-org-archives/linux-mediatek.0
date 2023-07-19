Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E7BCC001E0
	for <linux-mediatek@archiver.kernel.org>; Wed, 19 Jul 2023 10:26:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MDKpzyl715FXpvBs//brcAoLgtj+1UL6KkC6I4T68sU=; b=RLsA78LO5mKu2Tl9+KTcw2ddLr
	NC7HLKv92UU5Gm8a6huAgPiq3QYPolWUb9vLz2TdVT5CRFsWhzW4PqRK5PoVZPLb0LhEsqnfqvlYM
	pbtuyvWYiOESmBnz/VpT5+PBxvhIcNDYDLpgTc2tbUPKEqfWgWF8P8EVFFh3vdfUjmhB3WsEwDdjM
	QfYxazWzsYd4g5NWyT7xq1iWgZ4q+GWdGRx2Vrutj+xMi4NOVb0KhonyyKnJ7uLGU8EC0MTDq2J2/
	1Hh+AW/6QuElgLZEwiNeNj3DiWQu4ZzI0iX1E06jdUTqcIm0RI5MgTv+TW0gtXUQnBNwRoClO3Vvr
	zXqXV8Kg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qM4O9-006hc5-1G;
	Wed, 19 Jul 2023 10:26:33 +0000
Received: from mail-il1-x12e.google.com ([2607:f8b0:4864:20::12e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qM4O6-006haZ-37
	for linux-mediatek@lists.infradead.org;
	Wed, 19 Jul 2023 10:26:32 +0000
Received: by mail-il1-x12e.google.com with SMTP id e9e14a558f8ab-345ff33d286so35213415ab.3
        for <linux-mediatek@lists.infradead.org>; Wed, 19 Jul 2023 03:26:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1689762389; x=1692354389;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MDKpzyl715FXpvBs//brcAoLgtj+1UL6KkC6I4T68sU=;
        b=jNCRPPktz3IdQ1OLcli8U25+1pBR7ixDXGDQpMuaeJ5DdbY5nVkHqIxbxChaZ+3cEm
         dZrBwU2FCtLPUI/LNFq8tA95EEhLZ8azisIL1r+vNkT2+GsP9aQARZG+p7e4iBOoGj02
         cUnUSXb1VtstfPBKVpUKr9Qk7QjoZq2jj3+NY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689762389; x=1692354389;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MDKpzyl715FXpvBs//brcAoLgtj+1UL6KkC6I4T68sU=;
        b=E05mUAIep1KHMBSCHE5IT9RjVEHm979K35npliCPitVp8UZxdyPKnYMDwfmP9Fdl4E
         lcNxjPubymc0eO5cJuhnkwRUnx4rgG456VjxBIxThlnwa+/A+8b2EjF7FdIsBBDJTAsK
         GnLJLjfzpVF+eUxFBFBb6ad05a4NeHDR5HCPUCTTymgBFlAB3v4SES0S8UmiBH/sBb5W
         KZSfAaAd10SFrnl8JGTjK5UO9rxj4YgnKc4zweZ9jCaImrWK2NPPEo/OE3uhwfEzKqeg
         7fnVs65Xy8rQqNgchuyf+CiSmYHA2HwD5h1vwYkxuKppThyxZG7AkiBVNj+o6SoPTiTN
         cuPw==
X-Gm-Message-State: ABy/qLbdrF+Vm74BStStXr8zHDKxS8AsmLYdz6bZ72keLDjWX3wo0Obo
	eo8VP4SH4J+th2/0d9sMRlvGOjDkjYm7YIPXi9I=
X-Google-Smtp-Source: APBJJlGgNMRvUQZrne82klTz7ncPb93ZtHP68qT8jyFDczWPTbewayMWJWx08AqdAsnivFGxGRRDxA==
X-Received: by 2002:a05:6e02:12e1:b0:345:3378:4251 with SMTP id l1-20020a056e0212e100b0034533784251mr6114574iln.23.1689762389402;
        Wed, 19 Jul 2023 03:26:29 -0700 (PDT)
Received: from mail-io1-f46.google.com (mail-io1-f46.google.com. [209.85.166.46])
        by smtp.gmail.com with ESMTPSA id v17-20020a92c811000000b0033b27117120sm1333785iln.13.2023.07.19.03.26.28
        for <linux-mediatek@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Jul 2023 03:26:28 -0700 (PDT)
Received: by mail-io1-f46.google.com with SMTP id ca18e2360f4ac-78360f61ba0so330483039f.1
        for <linux-mediatek@lists.infradead.org>; Wed, 19 Jul 2023 03:26:28 -0700 (PDT)
X-Received: by 2002:a6b:f10c:0:b0:780:c787:637d with SMTP id
 e12-20020a6bf10c000000b00780c787637dmr5094711iog.17.1689762388259; Wed, 19
 Jul 2023 03:26:28 -0700 (PDT)
MIME-Version: 1.0
References: <20230719075056.72178-1-angelogioacchino.delregno@collabora.com> <20230719075056.72178-6-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230719075056.72178-6-angelogioacchino.delregno@collabora.com>
From: Fei Shao <fshao@chromium.org>
Date: Wed, 19 Jul 2023 18:25:52 +0800
X-Gmail-Original-Message-ID: <CAC=S1nhHKCZoh2Q4Fou-WmEB=Kn+kNzj344UaJEXhoG56k3-hw@mail.gmail.com>
Message-ID: <CAC=S1nhHKCZoh2Q4Fou-WmEB=Kn+kNzj344UaJEXhoG56k3-hw@mail.gmail.com>
Subject: Re: [PATCH v2 5/6] drm/mediatek: mtk_dpi: Use devm_platform_ioremap_resource()
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: chunkuang.hu@kernel.org, p.zabel@pengutronix.de, airlied@gmail.com, 
	daniel@ffwll.ch, matthias.bgg@gmail.com, dri-devel@lists.freedesktop.org, 
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, kernel@collabora.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230719_032631_023300_40AD1A28 
X-CRM114-Status: UNSURE (   8.16  )
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

On Wed, Jul 19, 2023 at 3:51=E2=80=AFPM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> Instead of the open-coded platform_get_resource, devm_ioremap_resource
> switch to devm_platform_ioremap_resource(), also dropping the useless
> struct resource pointer, which becomes unused.
>
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@coll=
abora.com>

Reviewed-by: Fei Shao <fshao@chromium.org>

