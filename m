Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16AB3C27C53
	for <linux-mediatek@archiver.kernel.org>; Wed, 19 Jun 2024 10:18:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8ngPGc/hFtGsrMMFvI2VR8EgB+U9LeNzTYZovoR1s9s=; b=aKZQvxPLlWP84lnnNkHcsp4u0I
	YDze35kaoJlH36fWPlMTcv3pfQfRSkyo4abVf75MJCuYDP40EvM26KJkQZ2YS6J1Qsh7Vn8knmrJM
	gfPGp5saTJqc0QEZ0q6Vucyb2w7WW/fn6qoDL/oIAGqUvBT/QVjIssEJmPl857LaUjTmSIKJmr/Pp
	s1knPFWkCTy7XiZWGSzgzU1ogOm+Mt+QaQyfhUnBmalyfkiz7dbEdLz+Trt3193dGIzP2iQ/KvCsC
	zL0hLUdeOFBUbNNrLXMsMZ9kjVhbWWx1pi3HlZOZvhBzYkN7GlsIaXi0htjp5JhZqlqcERx0qh2S6
	KkjCf4EQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJsOh-00000000llC-25XM;
	Wed, 19 Jun 2024 10:18:35 +0000
Received: from mail-oo1-xc2b.google.com ([2607:f8b0:4864:20::c2b])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJsOe-00000000lkd-2dCM
	for linux-mediatek@lists.infradead.org;
	Wed, 19 Jun 2024 10:18:34 +0000
Received: by mail-oo1-xc2b.google.com with SMTP id 006d021491bc7-5c1a6daa04bso760952eaf.0
        for <linux-mediatek@lists.infradead.org>; Wed, 19 Jun 2024 03:18:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1718792311; x=1719397111; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8ngPGc/hFtGsrMMFvI2VR8EgB+U9LeNzTYZovoR1s9s=;
        b=CtrveA55lD0uBmViC0hEghPLuDfQLKh1GZmhXRgNa15MrjgtY4VP55Hh6ZEKX6R/+Z
         KTTNbq5SFsZKOLw48Rj2MjoJfRtOXAN/RSPtIND3cwtJ7g+bS0ur7y/tIQw2MqprLMtP
         0cEUHCJV96lcAH+aLAJOfkm9VYKK7u4P0QvkU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718792311; x=1719397111;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8ngPGc/hFtGsrMMFvI2VR8EgB+U9LeNzTYZovoR1s9s=;
        b=FyMbkZ2o3sUjHTep2GxNJqCGET5SFcTB2Y5Ig+eqZgW7Xm5KFQ2QaqLynZHhJWxDxm
         VYNWRRP86H7dSbZQARgclQxgGZfttfqRMJIiWBFEIO6etf48WDuGzoUEGvJ6x8NJqCgF
         sDF786YzN5/fDi3bx5TIksnww0lXi7JYlqpJCKUeVMwLjqaYTGtBO+w20roXGfD/NWjU
         fj8PZaB++/W1Wxzywnn1Ly1YNz08Vl1oQJnRDKl0jTlIo+CxGNv+X+/PMb+w5OtDjtmy
         1kwoVMPMHnJpLSzTBuGJ7nVBDU25wR0aszq5ss1iDWXK4/TMa/79GOGeXvTbmJwlbMJQ
         q8fw==
X-Forwarded-Encrypted: i=1; AJvYcCW0n3XUdUBEOooi1kIKmHZhqmwlvjCJoTJpDCfS+Mgw77gO1QvPcTogtJeJk2OUv1yWGY/7RKWzqmZdBuCxTtsdhpRoebSLjwbQGSy7niGPrLRk
X-Gm-Message-State: AOJu0Yz1wHd6u3j4oSDvGymktdtk4yeD/aCriq8pj90rWL99rZvmiEQ8
	dkKBDPg6QKXFQBKByAzj3gx/MrcaxnjsM/IcIvyPEPywmIYKDvwZytj3bPLEkmS2EPQxv1ZHYFE
	=
X-Google-Smtp-Source: AGHT+IGcF3akMYTxtJ5MF/L9z2XvdE8b26+5yiuE1TlMxkb05P2LMoy71FpNVEDJzuSUITMQTpcMDw==
X-Received: by 2002:a05:6358:72a:b0:1a1:b9dd:d2b8 with SMTP id e5c5f4694b2df-1a1fd393fe3mr267551155d.10.1718792309149;
        Wed, 19 Jun 2024 03:18:29 -0700 (PDT)
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com. [209.85.210.174])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-6fedcf36b93sm9135385a12.18.2024.06.19.03.18.28
        for <linux-mediatek@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Jun 2024 03:18:28 -0700 (PDT)
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-7061d37dc9bso1581634b3a.2
        for <linux-mediatek@lists.infradead.org>; Wed, 19 Jun 2024 03:18:28 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWWjQmXlmmfs05HtXHJ1n72fisg1nPwiikKLiSouplO85L3uXD5bgo1xh++jvk+eWieUa3aUO8UpbLlF/FX8nTHC38GHSfjS0ZAkUhCfQlo1lBm
X-Received: by 2002:a67:f80e:0:b0:48c:397b:3996 with SMTP id
 ada2fe7eead31-48f13007867mr2130877137.8.1718791825452; Wed, 19 Jun 2024
 03:10:25 -0700 (PDT)
MIME-Version: 1.0
References: <20240322092845.381313-1-angelogioacchino.delregno@collabora.com> <20240322092845.381313-3-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20240322092845.381313-3-angelogioacchino.delregno@collabora.com>
From: Fei Shao <fshao@chromium.org>
Date: Wed, 19 Jun 2024 18:09:47 +0800
X-Gmail-Original-Message-ID: <CAC=S1niaYZ=NNTwfSrJPdj79uG_hmqGm=cz_Sis3Zrf9octsnw@mail.gmail.com>
Message-ID: <CAC=S1niaYZ=NNTwfSrJPdj79uG_hmqGm=cz_Sis3Zrf9octsnw@mail.gmail.com>
Subject: Re: [PATCH 2/4] soc: mediatek: mtk-mutex: Add support for MT8188 VPPSYS
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-media@vger.kernel.org, mchehab@kernel.org, robh@kernel.org, 
	krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org, 
	matthias.bgg@gmail.com, amergnat@baylibre.com, moudy.ho@mediatek.com, 
	hverkuil-cisco@xs4all.nl, sebastian.fricke@collabora.com, 
	u.kleine-koenig@pengutronix.de, chunkuang.hu@kernel.org, 
	p.zabel@pengutronix.de, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, kernel@collabora.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240619_031832_679680_784B0282 
X-CRM114-Status: GOOD (  17.65  )
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

Hi Angelo,

On Fri, Mar 22, 2024 at 5:29=E2=80=AFPM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> Add MT8188 VPPSYS0 and VPPSYS1 mutex info to driver data
>
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@coll=
abora.com>
> ---
>  drivers/soc/mediatek/mtk-mutex.c | 41 ++++++++++++++++++++++++++++++++
>  1 file changed, 41 insertions(+)
>
> diff --git a/drivers/soc/mediatek/mtk-mutex.c b/drivers/soc/mediatek/mtk-=
mutex.c
> index 73c256d3950b..b5af1fb5847e 100644
> --- a/drivers/soc/mediatek/mtk-mutex.c
> +++ b/drivers/soc/mediatek/mtk-mutex.c
> @@ -496,6 +496,39 @@ static const unsigned int mt8188_mutex_mod[DDP_COMPO=
NENT_ID_MAX] =3D {
>         [DDP_COMPONENT_MERGE5] =3D MT8188_MUTEX_MOD_DISP1_VPP_MERGE4,
>  };
>
> +static const unsigned int mt8188_mdp_mutex_table_mod[MUTEX_MOD_IDX_MAX] =
=3D {
> +       [MUTEX_MOD_IDX_MDP_RDMA0] =3D MT8195_MUTEX_MOD_MDP_RDMA0,
> +       [MUTEX_MOD_IDX_MDP_RDMA2] =3D MT8195_MUTEX_MOD_MDP_RDMA2,
> +       [MUTEX_MOD_IDX_MDP_RDMA3] =3D MT8195_MUTEX_MOD_MDP_RDMA3,
> +       [MUTEX_MOD_IDX_MDP_FG0] =3D MT8195_MUTEX_MOD_MDP_FG0,
> +       [MUTEX_MOD_IDX_MDP_FG2] =3D MT8195_MUTEX_MOD_MDP_FG2,
> +       [MUTEX_MOD_IDX_MDP_FG3] =3D MT8195_MUTEX_MOD_MDP_FG3,
> +       [MUTEX_MOD_IDX_MDP_HDR0] =3D MT8195_MUTEX_MOD_MDP_HDR0,
> +       [MUTEX_MOD_IDX_MDP_HDR2] =3D MT8195_MUTEX_MOD_MDP_HDR2,
> +       [MUTEX_MOD_IDX_MDP_HDR3] =3D MT8195_MUTEX_MOD_MDP_HDR3,
> +       [MUTEX_MOD_IDX_MDP_AAL0] =3D MT8195_MUTEX_MOD_MDP_AAL0,
> +       [MUTEX_MOD_IDX_MDP_AAL2] =3D MT8195_MUTEX_MOD_MDP_AAL2,
> +       [MUTEX_MOD_IDX_MDP_AAL3] =3D MT8195_MUTEX_MOD_MDP_AAL3,
> +       [MUTEX_MOD_IDX_MDP_RSZ0] =3D MT8195_MUTEX_MOD_MDP_RSZ0,
> +       [MUTEX_MOD_IDX_MDP_RSZ2] =3D MT8195_MUTEX_MOD_MDP_RSZ2,
> +       [MUTEX_MOD_IDX_MDP_RSZ3] =3D MT8195_MUTEX_MOD_MDP_RSZ3,
> +       [MUTEX_MOD_IDX_MDP_MERGE2] =3D MT8195_MUTEX_MOD_MDP_MERGE2,
> +       [MUTEX_MOD_IDX_MDP_MERGE3] =3D MT8195_MUTEX_MOD_MDP_MERGE3,
> +       [MUTEX_MOD_IDX_MDP_TDSHP0] =3D MT8195_MUTEX_MOD_MDP_TDSHP0,
> +       [MUTEX_MOD_IDX_MDP_TDSHP2] =3D MT8195_MUTEX_MOD_MDP_TDSHP2,
> +       [MUTEX_MOD_IDX_MDP_TDSHP3] =3D MT8195_MUTEX_MOD_MDP_TDSHP3,
> +       [MUTEX_MOD_IDX_MDP_COLOR0] =3D MT8195_MUTEX_MOD_MDP_COLOR0,
> +       [MUTEX_MOD_IDX_MDP_COLOR2] =3D MT8195_MUTEX_MOD_MDP_COLOR2,
> +       [MUTEX_MOD_IDX_MDP_COLOR3] =3D MT8195_MUTEX_MOD_MDP_COLOR3,
> +       [MUTEX_MOD_IDX_MDP_OVL0] =3D MT8195_MUTEX_MOD_MDP_OVL0,
> +       [MUTEX_MOD_IDX_MDP_PAD0] =3D MT8195_MUTEX_MOD_MDP_PAD0,
> +       [MUTEX_MOD_IDX_MDP_PAD2] =3D MT8195_MUTEX_MOD_MDP_PAD2,
> +       [MUTEX_MOD_IDX_MDP_PAD3] =3D MT8195_MUTEX_MOD_MDP_PAD3,

I know it's too late since this is in the tree already, but I noticed
that MDP_COMP_TCC0 is added in the 4th patch but not here.
Is that expected?

Everything else looks nice, so just a record in the mailing list:
Reviewed-by: Fei Shao <fshao@chromium.org>

Regards,
Fei


> +       [MUTEX_MOD_IDX_MDP_WROT0] =3D MT8195_MUTEX_MOD_MDP_WROT0,
> +       [MUTEX_MOD_IDX_MDP_WROT2] =3D MT8195_MUTEX_MOD_MDP_WROT2,
> +       [MUTEX_MOD_IDX_MDP_WROT3] =3D MT8195_MUTEX_MOD_MDP_WROT3,
> +};
> +
>  static const unsigned int mt8192_mutex_mod[DDP_COMPONENT_ID_MAX] =3D {
>         [DDP_COMPONENT_AAL0] =3D MT8192_MUTEX_MOD_DISP_AAL0,
>         [DDP_COMPONENT_CCORR] =3D MT8192_MUTEX_MOD_DISP_CCORR0,
> @@ -735,6 +768,13 @@ static const struct mtk_mutex_data mt8188_mutex_driv=
er_data =3D {
>         .mutex_sof_reg =3D MT8183_MUTEX0_SOF0,
>  };
>
> +static const struct mtk_mutex_data mt8188_vpp_mutex_driver_data =3D {
> +       .mutex_sof =3D mt8188_mutex_sof,
> +       .mutex_mod_reg =3D MT8183_MUTEX0_MOD0,
> +       .mutex_sof_reg =3D MT8183_MUTEX0_SOF0,
> +       .mutex_table_mod =3D mt8188_mdp_mutex_table_mod,
> +};
> +
>  static const struct mtk_mutex_data mt8192_mutex_driver_data =3D {
>         .mutex_mod =3D mt8192_mutex_mod,
>         .mutex_sof =3D mt8183_mutex_sof,
> @@ -1089,6 +1129,7 @@ static const struct of_device_id mutex_driver_dt_ma=
tch[] =3D {
>         { .compatible =3D "mediatek,mt8186-disp-mutex", .data =3D &mt8186=
_mutex_driver_data },
>         { .compatible =3D "mediatek,mt8186-mdp3-mutex", .data =3D &mt8186=
_mdp_mutex_driver_data },
>         { .compatible =3D "mediatek,mt8188-disp-mutex", .data =3D &mt8188=
_mutex_driver_data },
> +       { .compatible =3D "mediatek,mt8188-vpp-mutex",  .data =3D &mt8188=
_vpp_mutex_driver_data },
>         { .compatible =3D "mediatek,mt8192-disp-mutex", .data =3D &mt8192=
_mutex_driver_data },
>         { .compatible =3D "mediatek,mt8195-disp-mutex", .data =3D &mt8195=
_mutex_driver_data },
>         { .compatible =3D "mediatek,mt8195-vpp-mutex",  .data =3D &mt8195=
_vpp_mutex_driver_data },
> --
> 2.44.0
>
>

