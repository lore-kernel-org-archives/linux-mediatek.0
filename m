Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE852C05027
	for <linux-mediatek@archiver.kernel.org>; Fri, 27 Jan 2023 00:45:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LtFVp7uMa2LNxxHhEbk5rgonsJaDvKOpq2fvMVkDMLo=; b=iil/bJS1nlsvoqr+bpddllXNQw
	vGGIHaFlZvPaO7dSpMZaXE3x6mslSlW61hUxRnR9z2cT50wEO+1XmoP4KkXvhmMYpvWg3hiZA2OKe
	/UUorPJf/VNYsE68VIQtKfum/6WKorkbVrmw/P+SAmxbp6QikiQew0WDEsh5BNmnPvM5SixHyv3W+
	ZHA8NOWMtc8UZGol4cmaKFiAohv7HKqsOn0QevJC2/ZfpvedRYOFIMzTsSTt986OfNQjFzqUld/LV
	01BnLnnfs3seTKEbI4XkymR9IQuU1IKSMWSLcOQ8c3VTudANOgaVeAHufDIK8uHefgjy1Pl0h3A/m
	5Q3RUSvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pLCrw-00D1FO-E5; Fri, 27 Jan 2023 00:45:28 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pLCri-00D1DL-P1; Fri, 27 Jan 2023 00:45:18 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 354AAB81F6C;
	Fri, 27 Jan 2023 00:45:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D2AC6C4339C;
	Fri, 27 Jan 2023 00:45:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1674780311;
	bh=y9mD289SL86gW1Qx8+svxq3Jdqzqo8lV4lWXHSdyUw0=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=kXTFc2ZVvV6nrb/N0J6IqkkgM5CktBRtGoW2j4HrS65BgeX4fSn91HoIOYRvRebaV
	 ru8LU3MeHYNUAH46mLPNRJJkQHGySv0GsPo6lklh0/BViK6CcdG5MgnpRGjTpzNZ2I
	 r00mMCGRt12oi1EfFDFCcyp8rsBvkxFgBm05PjoJm6xhs9waCOTd6eagQZoEy3kGld
	 qz3HXafxehbI4xlHIe+z+bx4UOKwhQKXzgzAPT6Bm2A/op8dmRfehBB6NZ/F/WvTZ6
	 oYmrvNkp6pkiiZsxTdnHzmcbpZx4266ye6WjDp9YyNrJ7J26wxdd5/FBVRzMSRbLwC
	 SxFmRIWlHGvSQ==
Received: by mail-lj1-f180.google.com with SMTP id g14so3878112ljh.10;
        Thu, 26 Jan 2023 16:45:11 -0800 (PST)
X-Gm-Message-State: AFqh2kp6zglKXAoriKNkPh0N8YkkswBsI01FltbVhnQt+9OHPt0cJ+eI
	zvul2boe9XEASoK8Jso8uHTR7Qaypge8uhkljA==
X-Google-Smtp-Source: AMrXdXuvkx1XDqmQrDK35Brew8JLnKkqQAQNvYpsKpbztY/Rn3PnkwInSSUI7HPk0s6JeW5soyPV5j77OmFHHMbZNjI=
X-Received: by 2002:a2e:bd13:0:b0:287:4eeb:53dc with SMTP id
 n19-20020a2ebd13000000b002874eeb53dcmr2199731ljq.27.1674780309880; Thu, 26
 Jan 2023 16:45:09 -0800 (PST)
MIME-Version: 1.0
References: <20230111024443.24559-1-miles.chen@mediatek.com>
In-Reply-To: <20230111024443.24559-1-miles.chen@mediatek.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Fri, 27 Jan 2023 08:44:57 +0800
X-Gmail-Original-Message-ID: <CAAOTY_9SzkF7j5Zj5WpQRbcHeR3FO8Z7sYdm5-8FSZqQNAjfoQ@mail.gmail.com>
Message-ID: <CAAOTY_9SzkF7j5Zj5WpQRbcHeR3FO8Z7sYdm5-8FSZqQNAjfoQ@mail.gmail.com>
Subject: Re: [PATCH v2] drm/mediatek: stop using 0 as NULL pointer
To: Miles Chen <miles.chen@mediatek.com>
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
	Matthias Brugger <matthias.bgg@gmail.com>, CK Hu <ck.hu@mediatek.com>, 
	linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230126_164517_410158_5205CB6D 
X-CRM114-Status: GOOD (  16.17  )
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

Hi, Miles:

Miles Chen <miles.chen@mediatek.com> =E6=96=BC 2023=E5=B9=B41=E6=9C=8811=E6=
=97=A5 =E9=80=B1=E4=B8=89 =E4=B8=8A=E5=8D=8810:52=E5=AF=AB=E9=81=93=EF=BC=
=9A
>
> Use NULL for NULL pointer to fix the following sparse warning:
> drivers/gpu/drm/mediatek/mtk_drm_gem.c:265:27: sparse: warning: Using pla=
in integer as NULL pointer

Applied to mediatek-drm-next [1], thanks.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/chunkuang.hu/linux.git/=
log/?h=3Dmediatek-drm-next

Regards,
Chun-Kuang.

>
> Fixes: 3df64d7b0a4f ("drm/mediatek: Implement gem prime vmap/vunmap funct=
ion")
> Signed-off-by: Miles Chen <miles.chen@mediatek.com>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collab=
ora.com>
>
> ---
>
> Change since v1:
> Add Fixes tag
>
> ---
>  drivers/gpu/drm/mediatek/mtk_drm_gem.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/mediatek/mtk_drm_gem.c b/drivers/gpu/drm/med=
iatek/mtk_drm_gem.c
> index 47e96b0289f9..06aadd5e7f5b 100644
> --- a/drivers/gpu/drm/mediatek/mtk_drm_gem.c
> +++ b/drivers/gpu/drm/mediatek/mtk_drm_gem.c
> @@ -262,6 +262,6 @@ void mtk_drm_gem_prime_vunmap(struct drm_gem_object *=
obj,
>                 return;
>
>         vunmap(vaddr);
> -       mtk_gem->kvaddr =3D 0;
> +       mtk_gem->kvaddr =3D NULL;
>         kfree(mtk_gem->pages);
>  }
> --
> 2.18.0
>

