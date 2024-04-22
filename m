Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A77B7C4345F
	for <linux-mediatek@archiver.kernel.org>; Mon, 22 Apr 2024 18:27:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3IQVuWfKjlbzaeQn5CcWdaGvpOlsNL7cN2BaBVhH2sA=; b=SNoJn7r9t9MZ8I30KbSV+0MUh8
	rf08+Bgpfab9/ehL0O+R9J3iak56cmXbExKAVCMuKkqYIYq0y1glOjtF/qBGT0kbFUD6tBRmaTmfD
	1X+ZGrnNTU2RI0oor9GTmcbFwsvnThPIRUrvkuE0ibn5ft+a3FrOG/NTVPcNnK7bt9a0UAOyh4g3z
	d/Ev7TmCDmhGmE67fLD49o1mjeIWHILbVTJ5ROjGW39kKmY3rtIRsTNQwkQR29lJLJlm5fokyLU14
	mGz9Ute6pmkPvsM69LUIw/E+0sxjeNEbBdepBun2H59Ne2T5fkMpYI04TtIt+cSBIOPUf+tSlaRRT
	nKMRT4Ig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ryyO6-0000000EaWk-1aBB;
	Mon, 22 Apr 2024 18:27:34 +0000
Received: from madrid.collaboradmins.com ([46.235.227.194])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ryyO3-0000000EaUe-2cc5;
	Mon, 22 Apr 2024 18:27:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1713810447;
	bh=8r80KTIXw2A2Fos24DKf0GaDXec3rLoq3m5wnIyncQ4=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=wPKGyp9IOUJ70ggKkh7XgdPpD63L8mlJOFjDnq5mQ3iGCVPIiHMy8jqpTyq8+xIWT
	 CLVHyi3yw4UfDRawGDCElWE1gWLvmPGHPVJIp3L7ByOmUjsHbynwIQQ79Dt9b9lL/G
	 LfndbDmvZipxbMocA8tSD4GQHJ58PLob4ZA704L/z0tB8nMJjZTBsgPAIwxsvqnXuo
	 mPcvQ1pcZ7a0LVMJCjgWwSKaDZ3owUCxggCGMSCBLKLkuW0Jy/4ug0EbznxbRuTE9/
	 ke9tbm6dk4nzGS38YQMoNHVhnTqnBRHog2vOw9lZkUpFOrbHA/Ot0oZck85aL8Y7LP
	 A/4uuewB2kcUQ==
Received: from nicolas-tpx395.localdomain (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nicolas)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 072003782134;
	Mon, 22 Apr 2024 18:27:24 +0000 (UTC)
Message-ID: <022936a6704d08fbed22e7f241810d857eecaeda.camel@collabora.com>
Subject: Re: [PATCH] media: mediatek: vcodec: Alloc DMA memory with
 DMA_ATTR_ALLOC_SINGLE_PAGES
From: Nicolas Dufresne <nicolas.dufresne@collabora.com>
To: Douglas Anderson <dianders@chromium.org>, Tiffany Lin
 <tiffany.lin@mediatek.com>, Andrew-CT Chen <andrew-ct.chen@mediatek.com>, 
 Yunfei Dong <yunfei.dong@mediatek.com>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Wei-Shun Chang <weishunc@google.com>, Hans Verkuil
	 <hverkuil-cisco@xs4all.nl>, =?ISO-8859-1?Q?N=EDcolas?= "F. R. A. Prado"
	 <nfraprado@collabora.com>, Rob Herring <robh@kernel.org>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-media@vger.kernel.org, linux-mediatek@lists.infradead.org
Date: Mon, 22 Apr 2024 14:27:21 -0400
In-Reply-To: <20240422100354.1.I58b4456c014a4d678455a4ec09b908b1c71c3017@changeid>
References: <20240422100354.1.I58b4456c014a4d678455a4ec09b908b1c71c3017@changeid>
Autocrypt: addr=nicolas.dufresne@collabora.com; prefer-encrypt=mutual;
 keydata=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
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.4 (3.50.4-1.fc39) 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240422_112731_957597_72D67309 
X-CRM114-Status: GOOD (  19.64  )
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

Le lundi 22 avril 2024 =C3=A0 10:03 -0700, Douglas Anderson a =C3=A9crit=C2=
=A0:
> As talked about in commit 14d3ae2efeed ("ARM: 8507/1: dma-mapping: Use
> DMA_ATTR_ALLOC_SINGLE_PAGES hint to optimize alloc"), it doesn't
> really make sense to try to allocate contiguous chunks of memory for
> video encoding/decoding. Let's switch the Mediatek vcodec driver to
> pass DMA_ATTR_ALLOC_SINGLE_PAGES and take some of the stress off the
> memory subsystem.
>=20
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> ---
> NOTE: I haven't personally done massive amounts of testing with this
> change, but I originally added the DMA_ATTR_ALLOC_SINGLE_PAGES flag
> specifically for the video encoding / decoding cases and I know it
> helped avoid memory problems in the past on other systems. Colleagues
> of mine have told me that with this change memory problems are harder
> to reproduce, so it seems like we should consider doing it.

One thing to improve in your patch submission is to avoid abstracting the
problems. Patch review and pulling is based on a technical rational and ver=
y
rarely on the trust that it helps someone somewhere in some unknown context=
.
What kind of memory issues are you facing ? What is the technical advantage=
 of
using DMA_ATTR_ALLOC_SINGLE_PAGES over the current approach that helps fixi=
ng
the issue? I do expect this to be documented in the commit message itself=
=C3=A9.

regards,
Nicolas

>=20
>  .../media/platform/mediatek/vcodec/common/mtk_vcodec_util.c    | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_uti=
l.c b/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_util.c
> index 9ce34a3b5ee6..3fb1d48c3e15 100644
> --- a/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_util.c
> +++ b/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_util.c
> @@ -64,7 +64,8 @@ int mtk_vcodec_mem_alloc(void *priv, struct mtk_vcodec_=
mem *mem)
>  		id =3D dec_ctx->id;
>  	}
> =20
> -	mem->va =3D dma_alloc_coherent(&plat_dev->dev, size, &mem->dma_addr, GF=
P_KERNEL);
> +	mem->va =3D dma_alloc_attrs(&plat_dev->dev, size, &mem->dma_addr,
> +				  GFP_KERNEL, DMA_ATTR_ALLOC_SINGLE_PAGES);
>  	if (!mem->va) {
>  		mtk_v4l2_err(plat_dev, "%s dma_alloc size=3D%ld failed!",
>  			     dev_name(&plat_dev->dev), size);


