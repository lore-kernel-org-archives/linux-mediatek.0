Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C5B0CD4F4A
	for <linux-mediatek@archiver.kernel.org>; Mon, 18 May 2026 14:11:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=g2t8910FrRWZux8hizne38ZE1f02Q5VgRvKTVLosCHw=; b=oN7u8Y93vhXfWXFxgFLcRrg4A3
	6iC6FzqN3MhhfzBLPHJTM+YLHh+6LHtFf3IFVssAc8kjW63qwTvIP+z3xwZiDQ2FRLTAtgkcmux71
	n50kiBCCmfcXp1mP75GmNCIjIAY28rKUapFEy/pWFHujTE3uiDzkPL6ykrtLeQYP9a0lXoykevDlD
	ypExHC0NXfsqXfyhhGfhy9fHhDS5yx2ZoIVA54MhktM08QUPfRjT7bfcIHADUtZSkJgEHv9nvsFpC
	F5KOLHTLtnQ3WoqsViglelHKuELmH9vt2QWiyn70cI0OMEUnsRNCnCUe4dIOq00HraUfDmgJa0ZVM
	NletjeFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOygp-0000000Fw2x-2PiZ;
	Mon, 18 May 2026 14:11:27 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOygl-0000000Fw1W-1wA3
	for linux-mediatek@lists.infradead.org;
	Mon, 18 May 2026 14:11:25 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 222CB43D3F
	for <linux-mediatek@lists.infradead.org>; Mon, 18 May 2026 14:11:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 04DEEC4AF09
	for <linux-mediatek@lists.infradead.org>; Mon, 18 May 2026 14:11:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779113483;
	bh=h7gVkfTa5QHeRim/stNXsU/SzV573sj0iQ7u9k7nmU0=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=ryEjjJ6JWn+X5PFCMwVoRDjDgpCxRDbrTUHHWIIaIUJ65I5Efqt2Ea47ot/lc9mvm
	 kZiUmdTgEHsDz2CTJzMoYL5jCYxwjCmcp6JrWljg0A6VodksTJ3ebGI0XTbiUIwKdJ
	 wZg3dT8eeWcZIPG3nfZuqzgKbljHAKBuXYseOBEOmAzzitmh/BJp01IRTgOOGh9dzX
	 1YKLs5BWFqaGTdbz8PUW1Kpm28nNMSKz7hR5NWQtkik0zoA0Mm5Lxa8X7ib49SR6/2
	 5nkrSg0hUA0yTi3iSC2hE/uC7nNi3dAKKqfImpNVSqcBnZXFSYRgPebTk5HQQWLGn7
	 Ad5QaBuJspxLA==
Received: by mail-dl1-f53.google.com with SMTP id a92af1059eb24-1354403c610so5605192c88.0
        for <linux-mediatek@lists.infradead.org>; Mon, 18 May 2026 07:11:23 -0700 (PDT)
X-Gm-Message-State: AOJu0Yy0lpcagPR8glnUQr1mOrHAwQgE8ajs+avPbYZ0l0kTIn7t5d4M
	ltGXz1+5yLhYbpA04WBTh7840Av+cCI4+PPCqu8zrVubGEJ7GCpGCLxJ1AyOhyBOxxsU1Ub+q0T
	nNRajIKDKEEERB15PAQBLWjliICbbYg==
X-Received: by 2002:a05:7023:b11:b0:12a:6ab7:3f73 with SMTP id
 a92af1059eb24-1350463608fmr6954781c88.0.1779113482382; Mon, 18 May 2026
 07:11:22 -0700 (PDT)
MIME-Version: 1.0
References: <20260505214541.333657-1-l.scorcia@gmail.com> <20260505214541.333657-3-l.scorcia@gmail.com>
In-Reply-To: <20260505214541.333657-3-l.scorcia@gmail.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Mon, 18 May 2026 14:11:08 +0000
X-Gmail-Original-Message-ID: <CAAOTY_-ROn-9S1qfHgovv=kU8JOe-A40PAMA+5tsj2O4admTRg@mail.gmail.com>
X-Gm-Features: AVHnY4In4m85pm3lmCfr_GmIUHep1vnejd09hnbSXzHvVRUiJfd8Dukfjspay4c
Message-ID: <CAAOTY_-ROn-9S1qfHgovv=kU8JOe-A40PAMA+5tsj2O4admTRg@mail.gmail.com>
Subject: Re: [PATCH v4 2/2] drm/mediatek: dsi: Add compatible for mt8167-dsi
To: Luca Leonardo Scorcia <l.scorcia@gmail.com>
Cc: linux-mediatek@lists.infradead.org, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Chun-Kuang Hu <chunkuang.hu@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260518_071123_538292_48A17F51 
X-CRM114-Status: GOOD (  17.03  )
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

Luca Leonardo Scorcia <l.scorcia@gmail.com> =E6=96=BC 2026=E5=B9=B45=E6=9C=
=885=E6=97=A5=E9=80=B1=E4=BA=8C =E4=B8=8B=E5=8D=889:46=E5=AF=AB=E9=81=93=EF=
=BC=9A
>
> The mt8167 DSI controller is fully compatible with the one found in
> mt2701. Unfortunately the device tree has a dedicated compatible for
> mt8167 since 2022 and it cannot be changed with a fallback nor removed at
> this point. The only way to get the device to work is to add the
> compatible to the driver.

Applied to mediatek-drm-next [1], thanks.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/chunkuang.hu/linux.git/=
log/?h=3Dmediatek-drm-next

Regards,
Chun-Kuang.

>
> Signed-off-by: Luca Leonardo Scorcia <l.scorcia@gmail.com>
> ---
>  drivers/gpu/drm/mediatek/mtk_dsi.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/gpu/drm/mediatek/mtk_dsi.c b/drivers/gpu/drm/mediate=
k/mtk_dsi.c
> index 5aa71fcdcfab..167e33fef025 100644
> --- a/drivers/gpu/drm/mediatek/mtk_dsi.c
> +++ b/drivers/gpu/drm/mediatek/mtk_dsi.c
> @@ -1305,6 +1305,7 @@ static const struct mtk_dsi_driver_data mt8188_dsi_=
driver_data =3D {
>
>  static const struct of_device_id mtk_dsi_of_match[] =3D {
>         { .compatible =3D "mediatek,mt2701-dsi", .data =3D &mt2701_dsi_dr=
iver_data },
> +       { .compatible =3D "mediatek,mt8167-dsi", .data =3D &mt2701_dsi_dr=
iver_data },
>         { .compatible =3D "mediatek,mt8173-dsi", .data =3D &mt8173_dsi_dr=
iver_data },
>         { .compatible =3D "mediatek,mt8183-dsi", .data =3D &mt8183_dsi_dr=
iver_data },
>         { .compatible =3D "mediatek,mt8186-dsi", .data =3D &mt8186_dsi_dr=
iver_data },
> --
> 2.43.0
>

