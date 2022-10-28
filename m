Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C78FAECAAA1
	for <linux-mediatek@archiver.kernel.org>; Fri, 28 Oct 2022 13:03:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OiV4yDZ234QuN2yDkCEr8FG8ifqvvjo3BxYt8scz0B0=; b=KPebZVJ9y1SHP6FkO637P2ExEe
	5KND93Lr6MkjoyV1Cg81Zk+T77RUPYGJ7DsqCA80K7zxmgYv5lwigM7Y8+5sEu1v53BR1ftkOzCl7
	NNmjHwel7NaRr99x6cfXKiiPcKbbOmTyRw2fCXPmPLber34stMkRjVn26mZwmwae3qRbgUTqO9MU4
	FRJVrTdLDXJ2gLdvNgMcB7b+ZhAxepcESziTXux4XYvzHOI6AiIBBKRUUt7KM9Em0hLS0f1fdIHKY
	VoH4qbNrF5DRL0Pv91vs4w9dnV8lzGwmvY1MxZe/td7eeQkAOyxH4BkpETfgPl60TKMxLi/dPuaq/
	gMNzuKxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ooP0p-00HCoW-Bg; Fri, 28 Oct 2022 13:03:03 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ooP0e-00HCl5-7X; Fri, 28 Oct 2022 13:02:53 +0000
Received: from nicolas-tpx395.localdomain (192-222-136-102.qc.cable.ebox.net [192.222.136.102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nicolas)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 151C1660291B;
	Fri, 28 Oct 2022 14:02:44 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1666962166;
	bh=RrGA38kF9uCwoRURHrbUbA5rP3minRYBauW06GkVdAU=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=NFoyMEsUhXGvmBVAW3ALjq2HZ8/Biw0fHKo/MDNE9ElPw/7r2GTINx78pugexMRUx
	 nFH3TFfpwnvS1Uvu9ZnYJwvHAun5T/lTDokvKsDrZ1gJlPlXfipVda2AIGTUkKgOH+
	 dyJ3fHj7Vb8xQcx1SGdYX36IDysFKj+BbtVTbzyNQVoVQ0kN5BJ36NNdRRpmR0uUoe
	 krI6GGix+CcI2O1JD7zTznOUdhswx12G2ZuQ+ElKjGJ7gNqY736hIsoYzIiqK8Yj6u
	 KNpaO3WUAZGM51+1Yxk07l7MnByK6xj+8YFrZIeyEfp9XPFpExrZaoneZ3gKa/S/dz
	 LgI7QMwL0KpiQ==
Message-ID: <664bd195bdde7fd740572c4981c60b32de1465aa.camel@collabora.com>
Subject: Re: [PATCH] vcodec: mediatek: add check for NULL for 
 vsi->frm_bufs[vsi->new_fb_idx].buf.fb in vp9_swap_frm_bufs
From: Nicolas Dufresne <nicolas.dufresne@collabora.com>
To: Anastasia Belova <abelova@astralinux.ru>, Mauro Carvalho Chehab
	 <mchehab@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
Cc: Tiffany Lin <tiffany.lin@mediatek.com>, Andrew-CT Chen
 <andrew-ct.chen@mediatek.com>, Yunfei Dong <yunfei.dong@mediatek.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Hans
 Verkuil <hverkuil-cisco@xs4all.nl>,  linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org,  linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org,  lvc-project@linuxtesting.org
Date: Fri, 28 Oct 2022 09:02:35 -0400
In-Reply-To: <20221028125811.11340-1-abelova@astralinux.ru>
References: <20221028125811.11340-1-abelova@astralinux.ru>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.4 (3.44.4-2.fc36) 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221028_060252_438471_3D9F5973 
X-CRM114-Status: GOOD (  14.38  )
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

Hi,

Le vendredi 28 octobre 2022 =C3=A0 15:58 +0300, Anastasia Belova a =C3=A9cr=
it=C2=A0:
> If vsi->frm_bufs[vsi->new_fb_idx].buf.fb =3D=3D NULL while cleaning
> fb_free_list NULL-pointer is dereferenced.
>=20
> Found by Linux Verification Center (linuxtesting.org) with SVACE.
>=20
> Fixes: f77e89854b3e ("[media] vcodec: mediatek: Add Mediatek VP9 Video De=
coder Driver")
>=20
> Signed-off-by: Anastasia Belova <abelova@astralinux.ru>
> ---
>  drivers/media/platform/mediatek/vcodec/vdec/vdec_vp9_if.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/media/platform/mediatek/vcodec/vdec/vdec_vp9_if.c b/=
drivers/media/platform/mediatek/vcodec/vdec/vdec_vp9_if.c
> index 70b8383f7c8e..b0679aaf6192 100644
> --- a/drivers/media/platform/mediatek/vcodec/vdec/vdec_vp9_if.c
> +++ b/drivers/media/platform/mediatek/vcodec/vdec/vdec_vp9_if.c
> @@ -512,7 +512,7 @@ static void vp9_swap_frm_bufs(struct vdec_vp9_inst *i=
nst)
>  	 * clean fb_free_list
>  	 */
>  	if (vsi->frm_bufs[vsi->new_fb_idx].ref_cnt =3D=3D 0) {
> -		if (!vp9_is_sf_ref_fb(
> +		if (vsi->frm_bufs[vsi->new_fb_idx].buf.fb !=3D NULL && !vp9_is_sf_ref_=
fb(
>  			inst, vsi->frm_bufs[vsi->new_fb_idx].buf.fb)) {
>  			struct vdec_fb *fb;

Perhaps we could try and maintain some readability ? I'd suggest to move th=
e
check into vp9_is_sf_ref_fb() as an early return.

Nicolas



