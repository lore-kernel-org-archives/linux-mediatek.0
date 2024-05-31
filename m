Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 445E5C25B75
	for <linux-mediatek@archiver.kernel.org>; Fri, 31 May 2024 12:47:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=m5Qi6tMPYenKxcCKUZxYlTD/osvUiKSTkXpMvG5RSX0=; b=Aa4H8di7fRp4TNYVqXh0NvNGYh
	h2GDjAa7s9ZcfhtYtQcb2RfhxOW8egwgeZOvyyq9T3Na1pA8f1rCWTLV6zxzh5fUYKhF4z8FAcHj/
	tqlsOj+BIHnaUZZAtow+ktE2NPKssSMx26bmBzZRgqy2xHmCo5r0uJ/qBz5h7WJssVmApg5QKYC4y
	6eaeZVUAzfqiIcPxBpVI4EUYVeg/yQyLRoBJmuvDi18InDNIFT5DjcuLScqSpwT5bvCTfThItdDn0
	a1GYpu2wQJxNpwZYRKJK6OGwA6/fzMeTHQ5dPiEcV4AXJEwBJXfCvHczXnovLaK+aYqSPGLVCIYmH
	qi4CbmEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sD1fJ-0000000AF4e-05PT;
	Fri, 31 May 2024 12:47:26 +0000
Received: from madrid.collaboradmins.com ([46.235.227.194])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sD1fC-0000000AF1d-0Yw8;
	Fri, 31 May 2024 12:47:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1717159630;
	bh=iW3CNwK1w77FA/ekGYhGcEUsJbEL6oKwZ2aHH3da/fY=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=nMJCspMCwgj+AX5HCpHoS2O45tNHJjK1HppWZDKpt/HT5ymNCJrvo5t8DHASgqosc
	 QZIBZ+gj+1S6uGNPuqktoxYdAlFFYBXUcBpC11wfRk0I6kPedKmwISfr5rkkzgxXhn
	 CIPdeEZWFCFQRPGSz1crAbNxcAfRg2h/VR/ezyanJOv0hItqVyn+ADSVhQH05C0s0z
	 /rfWdLvh3nPXbSDgQlTPZqO4Ij1v7QDfFSWdhurVLV69Ixol5lomhvLdLp8u0JrD64
	 O0Pj2LGog4VDJth6oOhUBwtIswzHzynj/ztxPGFSqLNu0ErHNbCTgKQ/r31gxL2B48
	 FN5C2FabIQumQ==
Received: from nicolas-tpx395.localdomain (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nicolas)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 0271F378148F;
	Fri, 31 May 2024 12:47:08 +0000 (UTC)
Message-ID: <9f73dffc48394e6304263ac2293a2b18864ae3dd.camel@collabora.com>
Subject: Re: [PATCH] media: mediatek: vcodec: Reduce msg queue trans buffer
 size
From: Nicolas Dufresne <nicolas.dufresne@collabora.com>
To: Fei Shao <fshao@chromium.org>, AngeloGioacchino Del Regno
	 <angelogioacchino.delregno@collabora.com>, Hans Verkuil
	 <hverkuil-cisco@xs4all.nl>
Cc: Yunfei Dong <yunfei.dong@mediatek.com>, Andrew-CT Chen
 <andrew-ct.chen@mediatek.com>, Dan Carpenter <dan.carpenter@linaro.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Tiffany Lin <tiffany.lin@mediatek.com>, Xiaoyong Lu
 <xiaoyong.lu@mediatek.com>,  linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org,  linux-media@vger.kernel.org,
 linux-mediatek@lists.infradead.org
Date: Fri, 31 May 2024 08:47:02 -0400
In-Reply-To: <20240521095536.3869399-1-fshao@chromium.org>
References: <20240521095536.3869399-1-fshao@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.1 (3.52.1-1.fc40) 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240531_054718_798102_EC76258D 
X-CRM114-Status: GOOD (  20.57  )
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

Le mardi 21 mai 2024 =C3=A0 17:54 +0800, Fei Shao a =C3=A9crit=C2=A0:
> In the MediaTek HW vcodec pipeline, the `trans` buffer is used to
> transfer the data decoded by the lat decoder to the core decoder.
>=20
> In the beginning, 6MB and 30MB were allocated for the trans buffer to
> handle FHD and higher-resolution contents respectively, but it turns out
> that's more than enough in practice and there's room for improvement.
>=20
> The buffer sizes were reduced to 5MB / 8MB respectively and the decoders
> have been validated to work normally on the MediaTek Android products.
> It's time to adopt that change in the upstream MediaTek vcodec driver.
>=20
> Reduce the msg queue trans buffer size to 5MB / 8MB respectively to
> optimize the memory usage per decoder instance and improve the overall
> system performance.

I don't disagree with the change, but it feels like this is has hack over a
hack. We have an entropy decoder (LAT) metadata buffer, which of course is
resolution dependent, for which we hardcore two sizes.

Any chance Mediatek can document this blob, or at least document the proper
relation between the size and the resolution ? This way we could dynamicall=
y
size the buffer for the chosen resolution and trust it to remain big enough=
 for
a long time. Removing the non scientific claim of "have been validated", wh=
ich
is producible for anyone hitting issue with that change in the future.

Nicolas

>=20
> Signed-off-by: Fei Shao <fshao@chromium.org>
>=20
> CC: Yunfei Dong <yunfei.dong@mediatek.com>
>=20
> ---
> I consulted Yunfei and he confirmed that these are the sizes they are
> using today.
>=20
>  .../media/platform/mediatek/vcodec/decoder/vdec_msg_queue.c   | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/media/platform/mediatek/vcodec/decoder/vdec_msg_queu=
e.c b/drivers/media/platform/mediatek/vcodec/decoder/vdec_msg_queue.c
> index f283c4703dc6..e36741179a97 100644
> --- a/drivers/media/platform/mediatek/vcodec/decoder/vdec_msg_queue.c
> +++ b/drivers/media/platform/mediatek/vcodec/decoder/vdec_msg_queue.c
> @@ -29,9 +29,9 @@
>  static int vde_msg_queue_get_trans_size(int width, int height)
>  {
>  	if (width > 1920 || height > 1088)
> -		return 30 * SZ_1M;
> +		return 8 * SZ_1M;
>  	else
> -		return 6 * SZ_1M;
> +		return 5 * SZ_1M;
>  }
> =20
>  void vdec_msg_queue_init_ctx(struct vdec_msg_queue_ctx *ctx, int hardwar=
e_index)


