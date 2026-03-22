Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E970FC72C2
	for <linux-mediatek@archiver.kernel.org>; Sun, 22 Mar 2026 13:39:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=x9VDGU1BsBIbk8Bb2krW1uO9i3HEMgaxLsOdAUODPVo=; b=ynIwdLfXjZb2tLIhCvOLifNiGz
	hDfPC6n2p94lgdoEgqBsvy21xZeRx6PFts5WrFgp62LdMCXfzRbs6pDqyYgXLu9ilOaRdJ3j+WG/G
	vXaFdwn5nH1ipoRrsPbdeL93e5xfVKQbLEdTH50Vk2K8LqMrFpsRlIg9yKijUuzXse6hjo+qJK6VE
	/x75lCs+EeE9p3VAfXHkyXz470WDut1pbR4wc0c6snMLt06wBHVJWNlixBppdI9XTQEvFZcpFRbFy
	LvP4i767EPq+FdS9ReQESNgBdZfDRA/o0i655fEYYqf293sgqDC0d1fuQ3vJQBiWsxsHtZdzrMzZf
	hS21NNhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4J1h-0000000FNEu-34JV;
	Sun, 22 Mar 2026 13:39:33 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4J1f-0000000FNDu-0Lj8
	for linux-mediatek@lists.infradead.org;
	Sun, 22 Mar 2026 13:39:32 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 9F8D944239
	for <linux-mediatek@lists.infradead.org>; Sun, 22 Mar 2026 13:39:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 70695C2BCC4
	for <linux-mediatek@lists.infradead.org>; Sun, 22 Mar 2026 13:39:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774186770;
	bh=m3DFLOq8f/rq5Wyza2szchvR0UjBUxMQG1hQfeW+TvQ=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=aIa8y76oIaroKvoVI865SfOL3XDns8ctJ+rbmzQifVRvPhSXTDVsua379xIiy7D/A
	 nnITdWeOzN96YF1k2f9XNr3YVAhU1k9bftiQ61Go9tJClEF5ATA/Om5+hjVteZRnZQ
	 ILlpmQsu7ZEIwJMtyppqhySd2XSGxllO8wDhjELcmVNEGF5jAVvBQtNGUYj/DqNC+S
	 P1H1/0ut4xzYFgOTfez4D0jBPbwjnKdXGLLJK26szBRDnwROJk7ozUxfJrdEr84e72
	 cKUOoGtcy1BUZIk7c+vGumcxuSxxJiwtKkatK/3ZjwSqEXVYUO6zSLAa5lF+XweAo+
	 5yQW3A9mjzYQw==
Received: by mail-dl1-f52.google.com with SMTP id a92af1059eb24-1274204434bso3422129c88.1
        for <linux-mediatek@lists.infradead.org>; Sun, 22 Mar 2026 06:39:30 -0700 (PDT)
X-Gm-Message-State: AOJu0Yx3pD4Q562XJUuU46+k0s1IZNidueMN+JOhrYbQa52qT946ZTi5
	ouSH+g3lpX7dpIfWaXF8F3I8nxqvV4X9Ahayr/+Wp0jRtLWdDRwDb0XGrZ6HJbnd3XWmZsZCYCa
	/NWaSyUwU9uSJZj7n9VaBD/OJYYPSEg==
X-Received: by 2002:a05:7022:6628:b0:128:d5bd:3557 with SMTP id
 a92af1059eb24-12a722a15f4mr3801000c88.4.1774186769719; Sun, 22 Mar 2026
 06:39:29 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1771863641.git.l.scorcia@gmail.com> <5f880f1334aa93184afee3e36132ca42628821fb.1771863641.git.l.scorcia@gmail.com>
In-Reply-To: <5f880f1334aa93184afee3e36132ca42628821fb.1771863641.git.l.scorcia@gmail.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Sun, 22 Mar 2026 13:39:17 +0000
X-Gmail-Original-Message-ID: <CAAOTY_8H0fmap_QGqqV27FAEYTvdj=1aBALSX6VME3r7avVCOA@mail.gmail.com>
X-Gm-Features: AaiRm52YGXR86xSZou6nc8shJxbYgOHHf9z-llYwgyJUbBqSHJxUq9frUqd_1_E
Message-ID: <CAAOTY_8H0fmap_QGqqV27FAEYTvdj=1aBALSX6VME3r7avVCOA@mail.gmail.com>
Subject: Re: [PATCH v3 6/6] gpu: drm: mediatek: ovl: add specific entry for mt8167
To: Luca Leonardo Scorcia <l.scorcia@gmail.com>
Cc: linux-mediatek@lists.infradead.org, Val Packett <val@packett.cool>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Chun-Kuang Hu <chunkuang.hu@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Chunfeng Yun <chunfeng.yun@mediatek.com>, Vinod Koul <vkoul@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-phy@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260322_063931_185160_29A00B40 
X-CRM114-Status: GOOD (  13.60  )
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

Hi, Luca:

Luca Leonardo Scorcia <l.scorcia@gmail.com> =E6=96=BC 2026=E5=B9=B42=E6=9C=
=8823=E6=97=A5=E9=80=B1=E4=B8=80 =E4=B8=8B=E5=8D=884:26=E5=AF=AB=E9=81=93=
=EF=BC=9A
>
> From: Val Packett <val@packett.cool>
>
> While this configuration is otherwise identical to mt8173, according
> to Android kernel sources, this SoC does need smi_id_en.

Applied to mediatek-drm-next [1], thanks.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/chunkuang.hu/linux.git/=
log/?h=3Dmediatek-drm-next

Regards,
Chun-Kuang.

>
> Signed-off-by: Val Packett <val@packett.cool>
> Signed-off-by: Luca Leonardo Scorcia <l.scorcia@gmail.com>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collab=
ora.com>
> ---
>  drivers/gpu/drm/mediatek/mtk_disp_ovl.c | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
>
> diff --git a/drivers/gpu/drm/mediatek/mtk_disp_ovl.c b/drivers/gpu/drm/me=
diatek/mtk_disp_ovl.c
> index e0236353d499..97a899e4bd99 100644
> --- a/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
> +++ b/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
> @@ -671,6 +671,16 @@ static const struct mtk_disp_ovl_data mt2701_ovl_dri=
ver_data =3D {
>         .num_formats =3D ARRAY_SIZE(mt8173_formats),
>  };
>
> +static const struct mtk_disp_ovl_data mt8167_ovl_driver_data =3D {
> +       .addr =3D DISP_REG_OVL_ADDR_MT8173,
> +       .gmc_bits =3D 8,
> +       .layer_nr =3D 4,
> +       .fmt_rgb565_is_0 =3D true,
> +       .smi_id_en =3D true,
> +       .formats =3D mt8173_formats,
> +       .num_formats =3D ARRAY_SIZE(mt8173_formats),
> +};
> +
>  static const struct mtk_disp_ovl_data mt8173_ovl_driver_data =3D {
>         .addr =3D DISP_REG_OVL_ADDR_MT8173,
>         .gmc_bits =3D 8,
> @@ -742,6 +752,8 @@ static const struct mtk_disp_ovl_data mt8195_ovl_driv=
er_data =3D {
>  static const struct of_device_id mtk_disp_ovl_driver_dt_match[] =3D {
>         { .compatible =3D "mediatek,mt2701-disp-ovl",
>           .data =3D &mt2701_ovl_driver_data},
> +       { .compatible =3D "mediatek,mt8167-disp-ovl",
> +         .data =3D &mt8167_ovl_driver_data},
>         { .compatible =3D "mediatek,mt8173-disp-ovl",
>           .data =3D &mt8173_ovl_driver_data},
>         { .compatible =3D "mediatek,mt8183-disp-ovl",
> --
> 2.43.0
>

