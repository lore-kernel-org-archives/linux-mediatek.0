Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14948C3DA7F
	for <linux-mediatek@archiver.kernel.org>; Thu, 15 Aug 2024 13:57:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dkkNiY5FzOl0kYYB4shogTO8VLprurXDFEzSEF1JWd4=; b=ZxjlYgickXu64okCruHy8X3J2i
	SQ4eHoG1LqDFlSPURX7eVpw+mANN9EoPPYVbDyw/aN2vh+CWTptsBc0HFut/7G5+noLuh8CiABBr6
	GMiZZZYDexWjyMDrgbIQDvYm2+iWum1DhH1XQz8UwmJIFH6qOnOS2h+r/QVaZnISXHNYNlnfLuy1u
	XcrOzJ3wbXRffY2mtS/d/96hs4f7Ch62n4FNbWN28pJLXa6MnN0WlleciMNzTTVuLG5nBBbIQB9Og
	2SRoIAyCT/Wl71u524ebYto5v2RnsxVbVRnLMtt2RyWJ4wO1hlSI9ECD9Qtz2H4q46AYOZCCfaYnc
	sIHJVPAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1seayx-0000000A7QJ-3EXt;
	Thu, 15 Aug 2024 13:57:39 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1seayI-0000000A7IZ-2X9V;
	Thu, 15 Aug 2024 13:57:00 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 7ABC0CE1C79;
	Thu, 15 Aug 2024 13:56:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 879D1C4AF0C;
	Thu, 15 Aug 2024 13:56:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1723730215;
	bh=pNzAuHuhw5vFj0MfUJcfnnwgyE2OQGAdmeyHX+UNaD4=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=DaPmhwBlEUrM/uGlSuvQkk2mh69hNGpN3oP0zLSuu4YAZAzR4D8aC2ZIcAvzlNQLr
	 TKegh9YnwSlgdfXVJXTVxMs/EDzX6qV4Ssxp2LMUz4bgwuKfoNmvcczsng8Na4ZpGJ
	 LYncOTQnQp7swLnA6FCPHVtRBkq1LSxkehOTEI61CKit6QLrxbEgrE6AhMhs2ET97Q
	 NwlTi/+tj10fBRStqSZv3MnAIGe4CM2S1h2kOKMCEprJjcAbtiKWPpnuO+RB0u8LZa
	 0F0BPI2p8oxY/tShm1OCxw6z9kRmx4reVienSJTiRThdFZaarVJCtLlJDZhqZlLnPL
	 9/YiktCVJGk+A==
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-2d3b785d8b1so627115a91.1;
        Thu, 15 Aug 2024 06:56:55 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVuK1atkj2ViuurTVdB0hIL6UxzE3xstsDRqZVIJti8eYPWhZtfYKY82Wej4uVB34nG4SYfz1PoJ2sxzoZ6ViyoSAHZJWLQP974PgRdWaAnnbYDKQCg/rBhBe4wKbBLXNKwokeAhgyV0Rts7OSVufpwLypNrEivEGg=
X-Gm-Message-State: AOJu0YzB9ShKogh2TW258j6Zx6ODrkLIEwthPrr8BaD4ERBD4Qk/LsPS
	SARa/5/s0fLIyR5ivHY5EGIgSJL6HBA5hZQaGSMQwo0vw0UgHrAwJb7KgcacZbWzA5K7Q7ZG2xU
	4YVITkrOlCEvhmDCiJwBg3ybb5g==
X-Google-Smtp-Source: AGHT+IHF8lihSFvFy146V9RFDKmET4UMbp4dFKkjYWDYSa8MfftqgIMB+sTB/uU6Rl3c42kHJSnavDM+yFIZjN3/ZEk=
X-Received: by 2002:a17:90b:230d:b0:2d3:ad41:4d7a with SMTP id
 98e67ed59e1d1-2d3c391157dmr4796664a91.4.1723730215112; Thu, 15 Aug 2024
 06:56:55 -0700 (PDT)
MIME-Version: 1.0
References: <20240624-mtk_disp_ovl_adaptor_scoped-v1-0-9fa1e074d881@gmail.com>
In-Reply-To: <20240624-mtk_disp_ovl_adaptor_scoped-v1-0-9fa1e074d881@gmail.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Thu, 15 Aug 2024 21:57:07 +0800
X-Gmail-Original-Message-ID: <CAAOTY__EAW-Tj93oSnN1TTB0sH3VMnHwwRaVv-Nm7cEGBeuvcQ@mail.gmail.com>
Message-ID: <CAAOTY__EAW-Tj93oSnN1TTB0sH3VMnHwwRaVv-Nm7cEGBeuvcQ@mail.gmail.com>
Subject: Re: [PATCH 0/3] drm/mediatek: fixes for ovl_adaptor
To: Javier Carrasco <javier.carrasco.cruz@gmail.com>
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	"Nancy.Lin" <nancy.lin@mediatek.com>, dri-devel@lists.freedesktop.org, 
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240815_065659_013316_C9D8AC24 
X-CRM114-Status: GOOD (  16.66  )
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

Hi, Javier:

Javier Carrasco <javier.carrasco.cruz@gmail.com> =E6=96=BC 2024=E5=B9=B46=
=E6=9C=8825=E6=97=A5 =E9=80=B1=E4=BA=8C =E4=B8=8A=E5=8D=8812:44=E5=AF=AB=E9=
=81=93=EF=BC=9A
>
> The main fix is a possible memory leak on an early exit in the
> for_each_child_of_node() loop. That fix has been divided into a patch
> that can be backported (a simple of_node_put()), and another one that
> uses the scoped variant of the macro, removing the need for any
> of_node_put(). That prevents mistakes if new break/return instructions
> are added, but the macro might not be available in older kernels.
>
> When at it, an unused header has been dropped.

For this series, applied to mediatek-drm-next [1], thanks.

Regards,
CK

[1] https://git.kernel.org/pub/scm/linux/kernel/git/chunkuang.hu/linux.git/=
log/?h=3Dmediatek-drm-next

>
> Signed-off-by: Javier Carrasco <javier.carrasco.cruz@gmail.com>
> ---
> Javier Carrasco (3):
>       drm/mediatek: ovl_adaptor: drop unused mtk_crtc.h header
>       drm/mediatek: ovl_adaptor: add missing of_node_put()
>       drm/mediatek: ovl_adaptor: use scoped variant of for_each_child_of_=
node()
>
>  drivers/gpu/drm/mediatek/mtk_disp_ovl_adaptor.c | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
> ---
> base-commit: f76698bd9a8ca01d3581236082d786e9a6b72bb7
> change-id: 20240624-mtk_disp_ovl_adaptor_scoped-0702a6b23443
>
> Best regards,
> --
> Javier Carrasco <javier.carrasco.cruz@gmail.com>
>

