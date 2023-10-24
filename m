Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49593C07545
	for <linux-mediatek@archiver.kernel.org>; Tue, 24 Oct 2023 08:38:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:Subject:From:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HI3ZiLtaCiRXVnUJEElLjIyOv6LpdSs5oE0k0wSfTYo=; b=On/w6/P4g7sBVAqiWTFN53Bx3w
	RduqYPBe3Xj2P2org6g1jkikvZvlLXjeq/7tbDvvbYIKNuG9BfbZ2NfyVVqLEdt1/4GdLOiIZde/B
	z5MPJTkT67A6omcnytHZymjm1lAVSEody/lXzm08LcqTye9ao2VpA7lIks9Tbdv0bhOkYt27npicm
	CGxz32N3d4T9QD+bPpnyeq+Nq3bO0xGc5V3VpQUsU7jwXTEpRoD0MNx0ugAJad1lC7SDrBP+kxpCU
	sD1B0gFnv79NRDWFjlsTwpsJd2oZDJ8h/Odfc8w+zZBKgCcSMUG3/ze7sEKrPFgt4yBH/mTxxtljs
	kbGgMl7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qvCvb-009D70-0q;
	Tue, 24 Oct 2023 08:38:19 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qvCvC-009CrI-0w;
	Tue, 24 Oct 2023 08:37:55 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 4D30766072F1;
	Tue, 24 Oct 2023 09:37:52 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1698136673;
	bh=zP6vOilkZ0sm+tw53oGfhBi7YFiKClwvxIzUr5yGLpI=;
	h=Date:From:Subject:To:Cc:References:In-Reply-To:From;
	b=LGQgRQS/VTjZqKg/j9fomOFt2RWMhGEpZj0kzuxJI55ULzIweIUjZP5mnTXgqDeZX
	 Ej/PRdJpmMO3gkPKa6lcfdmKxDHBGwpXvSW+482Kd5mNonPFPeXMq/sT+/+tz8C8YN
	 /AsrD2dDo08jvpbXFgBIUGsa5P8OqbmnLVC5SpqAS7E+s9imGhmIlYS2ve205xKoK1
	 ICMBBSUe4Bk31NVDn0LBa6/jMlBu8LZGHTNAxodVafW2gRHiIfzGHDJVFbiLVUzXO1
	 0wkLr8OpBYK6Fe9FisOI2qsEgdmCFfPIjnw/xmI69sV3QmKVCa7x/yKZHlMAJxOkQH
	 eU46ccydvDnMA==
Message-ID: <f7fa1c3c-8233-40ab-858a-fdf8a2117a04@collabora.com>
Date: Tue, 24 Oct 2023 10:37:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: Re: [PATCH v2 02/11] drm/mediatek/uapi: Add
 DRM_MTK_GEM_CREATED_ENCRYPTTED flag
To: "Jason-JH.Lin" <jason-jh.lin@mediatek.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>
Cc: Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, dri-devel@lists.freedesktop.org,
 linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org,
 Jason-ch Chen <jason-ch.chen@mediatek.com>,
 Johnson Wang <johnson.wang@mediatek.com>,
 Singo Chang <singo.chang@mediatek.com>, Nancy Lin <nancy.lin@mediatek.com>,
 Shawn Sung <shawn.sung@mediatek.com>,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 Jeffrey Kardatzke <jkardatzke@google.com>
References: <20231023044549.21412-1-jason-jh.lin@mediatek.com>
 <20231023044549.21412-3-jason-jh.lin@mediatek.com>
Content-Language: en-US
In-Reply-To: <20231023044549.21412-3-jason-jh.lin@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231024_013754_463911_1977BE6C 
X-CRM114-Status: GOOD (  13.38  )
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

Il 23/10/23 06:45, Jason-JH.Lin ha scritto:
> Add DRM_MTK_GEM_CREATED_ENCRYPTTED flag to allocate a secure buffer
> to support secure video path feature.
> 

You have a typo in both the commit description and the title. Please fix.

> Signed-off-by: Jason-JH.Lin <jason-jh.lin@mediatek.com>
> ---
>   include/uapi/drm/mediatek_drm.h | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/include/uapi/drm/mediatek_drm.h b/include/uapi/drm/mediatek_drm.h
> index c050de320a84..93f25e0c21d7 100644
> --- a/include/uapi/drm/mediatek_drm.h
> +++ b/include/uapi/drm/mediatek_drm.h
> @@ -48,6 +48,7 @@ struct drm_mtk_gem_map_off {
>   
>   #define DRM_MTK_GEM_CREATE		0x00
>   #define DRM_MTK_GEM_MAP_OFFSET		0x01
> +#define DRM_MTK_GEM_CREATE_ENCRYPTED	0x02
>   
>   #define DRM_IOCTL_MTK_GEM_CREATE	DRM_IOWR(DRM_COMMAND_BASE + \
>   		DRM_MTK_GEM_CREATE, struct drm_mtk_gem_create)


