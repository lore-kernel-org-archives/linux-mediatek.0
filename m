Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00BF8CD4F4A
	for <linux-mediatek@archiver.kernel.org>; Mon, 18 May 2026 14:26:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5fhFev+xWAooVTT+tM9hoBXOCTAMaZYFzCvirUusCO4=; b=bi+ojuDtmhm951jYqV3PLiK5Gh
	F7JVsV8mnK1yNS18OKF1wzPzU+o9p/ys5f4NKTPa5DcH4eadiRsI17F6yi7lNjF4tngavGuOE0Kcq
	F/0eY52yuxOTsHq3GmNpuQ5j9kBSUAMoJcNZpRFVoFe2rgbCddTFGaWgcrTWwkzvJWzQHLWQ8BWiA
	B9AOfwlvBxYBPcgJkFh4qDkQGqyt4JPRMD3PcM73imNJD3816mNSg6xScQRCnjZBVPCeF99Kl+83q
	LUZVfcoB4VzsER3tBbuxeFS4gr9eI6h2kTKrDj4GjwkyHJ9cJ1eHWr3XoWzyDhuLfb7DOhmiAkfsP
	UxsGGzvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOyvn-0000000FyOb-3ZV3;
	Mon, 18 May 2026 14:26:55 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOyvl-0000000FyNl-33Xp
	for linux-mediatek@lists.infradead.org;
	Mon, 18 May 2026 14:26:54 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 3EA5840172
	for <linux-mediatek@lists.infradead.org>; Mon, 18 May 2026 14:26:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 19E83C2BD04
	for <linux-mediatek@lists.infradead.org>; Mon, 18 May 2026 14:26:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779114413;
	bh=hm+pya9FfihN/vfpg8++W+yWh8lnVDDOk1psXq+CI/s=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=vCY1AWCq63YDIRhRIg8pRz68eEPzXnj0ZixhlTK9Nkbcs4CG8tTj1eQXlqnK4M6WL
	 uD2pHi1p9nC5ZLUGNuJzz1OGTWx/oPnu0M6cl6yRl6GUxUdnTPTpXOy2EmS7xtY7c0
	 nf1YhUicPLVgsnmX7OU+8ybYl4jXJyrG/2FhSgfp7gSWk/JOpRpMA7T8TiJKW67tBk
	 aiP/JdY+E9w3Eptue1axz0XrPBskwuPxe4WRgF/JZx6JlCr0p7RKQY02EYDmojfBnH
	 Fb9U082pOMXNSGzIvxzh0xM0ZySnGi4eEoOV+fBL5TDTf/xwd6HodDAccokFwigeGe
	 Iz9jTy9wuuZZQ==
Received: by mail-dl1-f53.google.com with SMTP id a92af1059eb24-130c9dcbd25so2112559c88.1
        for <linux-mediatek@lists.infradead.org>; Mon, 18 May 2026 07:26:53 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ+7N6vyRBCX7h1W697daNhsswkuumuU9soKE2wB4iSoci357LCrx2+GKqLsNBHyg2MCf6CABcThODcce5LWeQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YxCeAcAETbQzS9y7vsezJP99BOfXSHjd/kZ+gwI5RIcOyL6YWj6
	9pdhNe/DPJkV+GPr8GvZQd/HJhAePgcNxs6l3BfWqKlZpxXqX4/3jDcnNNF4Sbjw6BPr2AxVqdP
	gZBuWSXDX/xtkPLTwJdY2F0Hf81ZQqA==
X-Received: by 2002:a05:7022:128d:b0:12d:b8e5:5e2 with SMTP id
 a92af1059eb24-134c8d4f477mr8519239c88.23.1779114412312; Mon, 18 May 2026
 07:26:52 -0700 (PDT)
MIME-Version: 1.0
References: <20260429-mediatek-drm-fix-sparse-warnings-v1-0-d95c4d118b83@collabora.com>
In-Reply-To: <20260429-mediatek-drm-fix-sparse-warnings-v1-0-d95c4d118b83@collabora.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Mon, 18 May 2026 14:26:40 +0000
X-Gmail-Original-Message-ID: <CAAOTY_8ra9pD7CuJPP+KtP3keQmRBhy18ci+6tdCCmdzY_wYqA@mail.gmail.com>
X-Gm-Features: AVHnY4Ib1xGbXsskUH68KIQINuq9-DNUQmBWC2ptMW1dekY9PU2APVoyDwlBMvE
Message-ID: <CAAOTY_8ra9pD7CuJPP+KtP3keQmRBhy18ci+6tdCCmdzY_wYqA@mail.gmail.com>
Subject: Re: [PATCH 0/4] drm/mediatek: fix sparse warnings
To: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, CK Hu <ck.hu@mediatek.com>, 
	Alexandre Mergnat <amergnat@baylibre.com>, kernel@collabora.com, 
	dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	kernel test robot <lkp@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260518_072653_799898_E84186FA 
X-CRM114-Status: GOOD (  12.33  )
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

Hi, Louis:

Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com> =E6=96=BC 2026=E5=B9=
=B44=E6=9C=8829=E6=97=A5=E9=80=B1=E4=B8=89 =E4=B8=8A=E5=8D=889:59=E5=AF=AB=
=E9=81=93=EF=BC=9A
>
> This series fixes in the mediatek-drm driver the sparse warnings
> reported by [1] and two others introduced during v6.16 development
> cycle.
>
> The series has compile-tested and is based on linux-next (tag:
> next-2040428).
>
> [1]: https://lore.kernel.org/all/202604132044.fcYjEcU8-lkp@intel.com/

For this series, applied to mediatek-drm-fixes [1], thanks.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/chunkuang.hu/linux.git/=
log/?h=3Dmediatek-drm-fixes

Regards,
Chun-Kuang.

>
> Signed-off-by: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
> ---
> Louis-Alexis Eyraud (4):
>       drm/mediatek: mtk_hdmi_ddc_v2: Fix non-static global variable
>       drm/mediatek: mtk_hdmi_v2: Fix non-static global variable
>       drm/mediatek: mtk_cec: Fix non-static global variable
>       drm/mediatek: mtk_hdmi_ddc: Fix non-static global variable
>
>  drivers/gpu/drm/mediatek/mtk_cec.c         | 2 +-
>  drivers/gpu/drm/mediatek/mtk_hdmi_ddc.c    | 2 +-
>  drivers/gpu/drm/mediatek/mtk_hdmi_ddc_v2.c | 2 +-
>  drivers/gpu/drm/mediatek/mtk_hdmi_v2.c     | 2 +-
>  4 files changed, 4 insertions(+), 4 deletions(-)
> ---
> base-commit: 0f3ef35b0747832b58b97171bad99011d084c6b1
> change-id: 20260424-mediatek-drm-fix-sparse-warnings-7404de18204c
>
> Best regards,
> --
> Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
>

