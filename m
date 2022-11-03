Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90988C433FE
	for <linux-mediatek@archiver.kernel.org>; Thu,  3 Nov 2022 16:18:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MVCVa7KWVIH7S5RnoHtmNnvvrOGrqEfTeCPuTEI4FLc=; b=tG2sAnVuc1QPhSuoavoGk0KurM
	hpx8rYD1qcw/WUoniQADOJp86rVwjJNoDHkgGZtW3eomrYNin8voktYz3OWnHioUCSg3AB5dE05+F
	PqminVF7g5dqHqXzuTN3U8TQhWdPNPTRXnhTuxYLMu3w1/LOKjBCJD2C5GzotGahNG1f0je8aaPhA
	Kbx6YpxfPoZIe6O7S7J39J8wDy7NGWCY9GHKtt2FZPYbM4Ag7Is2XcuLoMy+4ETk7fqs8GJ1ULl9S
	y4Yw+uNMAENR9ybVeGV2OMuUDYEMdU78+d/QjC10lUPkN7zHCG33VhYHDjlnyDO/lSiCPSv0v7RBS
	iSyIQZtw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oqcuj-000ddC-Jo; Thu, 03 Nov 2022 16:17:57 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oqcuN-000dQc-Ou; Thu, 03 Nov 2022 16:17:37 +0000
Received: from nicolas-tpx395.localdomain (192-222-136-102.qc.cable.ebox.net [192.222.136.102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nicolas)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 66FEB6602962;
	Thu,  3 Nov 2022 16:17:27 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1667492249;
	bh=UF8gcf9Zdsra79jQbu7uASjF23J3RPW5N777RLTHhuY=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=BuefWQlJf8M4p09e0/uP4GwZBjBH8QwGMfRznG/AwyOlcJj/RN64+2lpdnSV4cTNK
	 n+huZqFNDDR3di5xNQ/VMT5NhuiG0V9Xq/50r3FVSBLnY/VAeg4HPpl7iryOOPFazz
	 xAnb4V7qFNpJVHZbEDNFS3VSkWY7jWTXdyl3tAv29BtVo17G0BMwKR9/mKBxAGtK1B
	 UXEf5yEGt8vDymhc5wEnFfMFhj2wmOPe1NFdWOejaPwclO+ASdD+i+K4HNwIF0RE4X
	 accQfnWvEhuO/Ph1cAufgt6fTa0P1fuXvZ/alaa5/rrH2zX55/ezcLRmhhh6u3qgTi
	 WogQ4pHX/hJ4A==
Message-ID: <df2676f0e4dce565d483ce2149b2c54da05b34a5.camel@collabora.com>
Subject: Re: [PATCH v2] vcodec: mediatek: add check for NULL for
From: Nicolas Dufresne <nicolas.dufresne@collabora.com>
To: Anastasia Belova <abelova@astralinux.ru>, Mauro Carvalho Chehab
	 <mchehab@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
Cc: Tiffany Lin <tiffany.lin@mediatek.com>, Andrew-CT Chen
 <andrew-ct.chen@mediatek.com>, Yunfei Dong <yunfei.dong@mediatek.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Hans
 Verkuil <hverkuil-cisco@xs4all.nl>,  linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org,  linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org,  lvc-project@linuxtesting.org
Date: Thu, 03 Nov 2022 12:17:17 -0400
In-Reply-To: <20221102121027.4285-1-abelova@astralinux.ru>
References: <20221102121027.4285-1-abelova@astralinux.ru>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.4 (3.44.4-2.fc36) 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221103_091735_972159_5D86B40C 
X-CRM114-Status: GOOD (  13.41  )
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

Le mercredi 02 novembre 2022 =C3=A0 15:10 +0300, Anastasia Belova a =C3=A9c=
rit=C2=A0:
> Any time calling vp9_is_sf_ref_fb we need fb !=3D NULL after checks.
>=20
> Found by Linux Verification Center (linuxtesting.org) with SVACE.
>=20
> Fixes: f77e89854b3e ("[media] vcodec: mediatek: Add Mediatek VP9 Video De=
coder Driver")

As Angelo said, this change is a no-op in practice, for this reason I would
suggest to drop the `Fixes` tag (not worth the effort of back-porting this)=
.

>=20
> Signed-off-by: Anastasia Belova <abelova@astralinux.ru>

Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>

> ---
>  drivers/media/platform/mediatek/vcodec/vdec/vdec_vp9_if.c | 3 +++
>  1 file changed, 3 insertions(+)
>=20
> diff --git a/drivers/media/platform/mediatek/vcodec/vdec/vdec_vp9_if.c b/=
drivers/media/platform/mediatek/vcodec/vdec/vdec_vp9_if.c
> index 70b8383f7c8e..776468cd834a 100644
> --- a/drivers/media/platform/mediatek/vcodec/vdec/vdec_vp9_if.c
> +++ b/drivers/media/platform/mediatek/vcodec/vdec/vdec_vp9_if.c
> @@ -208,6 +208,9 @@ static bool vp9_is_sf_ref_fb(struct vdec_vp9_inst *in=
st, struct vdec_fb *fb)
>  	int i;
>  	struct vdec_vp9_vsi *vsi =3D inst->vsi;
> =20
> +	if (!fb)
> +		return true;
> +
>  	for (i =3D 0; i < ARRAY_SIZE(vsi->sf_ref_fb); i++) {
>  		if (fb =3D=3D &vsi->sf_ref_fb[i].fb)
>  			return true;


