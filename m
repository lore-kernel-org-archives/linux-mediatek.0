Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A15C6C3DA45
	for <linux-mediatek@archiver.kernel.org>; Wed, 10 Jul 2024 12:02:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ME9tvwYOMWVQkTGdto2VXU2J5pIKV3QKBjW0KN75794=; b=lJV7vgSiL7DF51TDcO9s4zfUba
	vIZPHIKO6JsLAQiyYPH5myCXClcatsDWi+9U43b3VJCbZGx6gPX6o7R4kUJvL9AaRGDN29s0em1Ty
	7HHaqLfw+sTlmbnIC15xgFQWSZZEzGo0p8e9Z63UOD7C0zFSZ5O1hO3OrbLYaC7fsWSDupcQQN5WG
	o19bnjWAHIG/fWTmcBN/bseyJREL5fNxBxVTwCeJx7IFu8od9Gzw+OSSvXOd+GUBlS6AUcD3yhF1m
	i+0KqTyqXMBcAH+48vTSowSUA6dD4h5X+9vKdUAxaSHCL5EnOs1KMC+odskqCPg/GYjzFnWKzmBbW
	rBc9H0BQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sRW21-0000000ARGp-3K6I;
	Wed, 10 Jul 2024 12:02:45 +0000
Received: from madrid.collaboradmins.com ([2a00:1098:ed:100::25])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sRW1j-0000000ARC5-1uYu;
	Wed, 10 Jul 2024 12:02:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1720612944;
	bh=N5cfTQaboV7BMNjSFWJkZ8/Yiw9vmeDA/9AlCrU3oK4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=M7N0JbUqUZ2vQHTAx3dh9Ud6rzzPLnHVUsgPGi6zrUKhxER+HUuqzuo07vIUVC0tl
	 JNNQ12nb3lIElhmLWwJH5AOdg/FpzaTfTwU6SA8ZrGjgnjF2eVFOmcIjP+OI8ibb/A
	 Xzy70b1LdLTsHwJogNsR6WXpCKgEGKJ1NO1PGNfc7TIPa0mzAUazUDUU1M1W9ODuCs
	 W6uVjDO8j6vZNUY9p7YsJTEFCmInqu6fhNDv0KKRYu42R/Ef5jm1gP/6Z45Dli3tae
	 hmV8L2mwIKtRK3u9aCZA6L+Fsi3rVooVZGRcH2FQnJn9tjN9dCN1nbQ3rkbaHbvqxb
	 QBKfhAawMRoeQ==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 54DCF3781185;
	Wed, 10 Jul 2024 12:02:23 +0000 (UTC)
Message-ID: <d6517e21-8f6f-44e9-b7ac-93e0860a5e7a@collabora.com>
Date: Wed, 10 Jul 2024 14:02:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/5] drm/mediatek: Support "Pre-multiplied" blending in
 OVL
To: shawn.sung@mediatek.com, Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Matthias Brugger <matthias.bgg@gmail.com>
Cc: dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Hsiao Chien Sung <shawn.sung@mediatek.corp-partner.google.com>,
 CK Hu <ck.hu@mediatek.com>
References: <20240710-alpha-blending-v3-0-289c187f9c6f@mediatek.com>
 <20240710-alpha-blending-v3-3-289c187f9c6f@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20240710-alpha-blending-v3-3-289c187f9c6f@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240710_050228_202563_21CFB92E 
X-CRM114-Status: GOOD (  12.91  )
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

Il 10/07/24 10:52, Hsiao Chien Sung via B4 Relay ha scritto:
> From: Hsiao Chien Sung <shawn.sung@mediatek.com>
> 
> Support "Pre-multiplied" alpha blending mode on in OVL.
> Before this patch, only the "coverage" mode is supported.
> 
> Signed-off-by: Hsiao Chien Sung <shawn.sung@mediatek.com>
> Reviewed-by: CK Hu <ck.hu@mediatek.com>
> ---
>   drivers/gpu/drm/mediatek/mtk_disp_ovl.c | 32 +++++++++++++++++++++++++-------
>   1 file changed, 25 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/gpu/drm/mediatek/mtk_disp_ovl.c b/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
> index add671c38613..89b439dcf3a6 100644
> --- a/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
> +++ b/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
> @@ -56,8 +56,12 @@
>   #define GMC_THRESHOLD_HIGH	((1 << GMC_THRESHOLD_BITS) / 4)
>   #define GMC_THRESHOLD_LOW	((1 << GMC_THRESHOLD_BITS) / 8)
>   
> +#define OVL_CON_CLRFMT_MAN	BIT(23)
>   #define OVL_CON_BYTE_SWAP	BIT(24)
> -#define OVL_CON_MTX_YUV_TO_RGB	(6 << 16)
> +
> +/* OVL_CON_RGB_SWAP works only if OVL_CON_CLRFMT_MAN is enabled */
> +#define OVL_CON_RGB_SWAP	BIT(25)
> +
>   #define OVL_CON_CLRFMT_RGB	(1 << 12)
>   #define OVL_CON_CLRFMT_ARGB8888	(2 << 12)
>   #define OVL_CON_CLRFMT_RGBA8888	(3 << 12)
> @@ -65,6 +69,11 @@
>   #define OVL_CON_CLRFMT_BGRA8888	(OVL_CON_CLRFMT_ARGB8888 | OVL_CON_BYTE_SWAP)
>   #define OVL_CON_CLRFMT_UYVY	(4 << 12)
>   #define OVL_CON_CLRFMT_YUYV	(5 << 12)
> +#define OVL_CON_MTX_YUV_TO_RGB	(6 << 16)
> +#define OVL_CON_CLRFMT_PARGB8888 ((3 << 12) | OVL_CON_CLRFMT_MAN)


Shouldn't this be (OVL_CON_CLRFMT_RGBA8888 | OVL_CON_CLRFMT_MAN) ??

That's getting written to the same register, so I'd guess this is like that; but
then, if it is like that, why is it PARGB888 and not PRGBA888?!

Regards,
Angelo



