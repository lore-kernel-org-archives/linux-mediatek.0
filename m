Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8523C43334
	for <linux-mediatek@archiver.kernel.org>; Tue, 21 Jun 2022 12:12:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aD5R/oHfnlo05GaqmR7BpRckZ+lIvLsACyf1dihdYgo=; b=Y3/hKbDAtiWnItt8OEDPkZul5W
	vVUcnY4jDaexpSWJ7B/zmCqX6Ef4ubOW4jNn51FZyTmzoI/UT1uIh1Zw6XKFmcp/CMjK8vhYMiKwz
	GAXc9j0pEKZxTyFKZODsxgAxsE76ry9nFBmORKKD1RhYtqn/ht+xjqLtiELVRqp1yhWrRFcphNk2A
	ztlaMoNOYjbJauyAxn3OYdZMyVzPWhvsAq4DgRymZ+wucVb25geFCLXG6y3Ymf+OqEXs26YPg6qJi
	2Lc3nElS7WbosnS/9bEDPGwowJvUaYp17lukOGQVyI56p7N7dRZWXZqrYSU1iD2qNt/xyc44OH1Mt
	UXGcjKKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o3cjz-005Ew5-K7; Tue, 21 Jun 2022 12:12:19 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o3cjT-005EfY-NK; Tue, 21 Jun 2022 12:11:49 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 5399D6601795;
	Tue, 21 Jun 2022 13:11:44 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1655813505;
	bh=HlUSN22NItfpRsSQU5D6uXf4MKq/qtRGbjiKMjx6BEk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Xh/O0r+4jW6DD8KtuCLF/cB7PbLmuWQCFSb/Rk6xfXWG44FeHJgH9DAz5i8yICzd6
	 ypNFC8ekgND9bQe6etipNxNOvJaCfgmHfNX9Ke7MNkaxhzooYZ6dRJEieFXBbt/0Ja
	 3M+AAFvgDdA5VF9pDwj2XMEciiFlE6jNnLHhHt0m4MKu8ooWzei9+bzmtDHbfrGuG2
	 cbl5tYRQLoQu9De0aDhvJW5bwifRUvXZo0KA/MjTc1hhDCj+nk/h8+QbQPQspeehT5
	 Ik4VdEbVoReCWNF3FZ+ljhSDkVyXrbZl5mhoa2+itJTOu4gnYv+Us5tsqNed+dGfKy
	 aoHAZ0PpjDSCQ==
Message-ID: <98679256-5903-3923-dcaf-5a965174e049@collabora.com>
Date: Tue, 21 Jun 2022 14:11:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v13 11/14] drm/mediatek: dpi: Add YUV422 output support
Content-Language: en-US
To: Bo-Chen Chen <rex-bc.chen@mediatek.com>, chunkuang.hu@kernel.org,
 p.zabel@pengutronix.de, daniel@ffwll.ch, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, matthias.bgg@gmail.com, airlied@linux.ie
Cc: msp@baylibre.com, granquet@baylibre.com, jitao.shi@mediatek.com,
 wenst@chromium.org, ck.hu@mediatek.com, dri-devel@lists.freedesktop.org,
 linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20220621113732.11595-1-rex-bc.chen@mediatek.com>
 <20220621113732.11595-12-rex-bc.chen@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220621113732.11595-12-rex-bc.chen@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220621_051147_944935_CF2BE25D 
X-CRM114-Status: GOOD (  15.93  )
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

Il 21/06/22 13:37, Bo-Chen Chen ha scritto:
> Dp_intf supports YUV422 as output format. In MT8195 Chrome project,
> YUV422 output format is used for 4K resolution.
> 
> To support this, it is also needed to support color format transfer.
> Color format transfer is a new feature for both dpi and dpintf of MT8195.
> 
> The input format could be RGB888 and output format for dp_intf should be
> YUV422. Therefore, we add a mtk_dpi_matrix_sel() helper to update the
> DPI_MATRIX_SET register depending on the color format.
> 
> Signed-off-by: Guillaume Ranquet <granquet@baylibre.com>
> Signed-off-by: Bo-Chen Chen <rex-bc.chen@mediatek.com>
> ---
>   drivers/gpu/drm/mediatek/mtk_dpi.c      | 34 ++++++++++++++++++++++++-
>   drivers/gpu/drm/mediatek/mtk_dpi_regs.h |  3 +++
>   2 files changed, 36 insertions(+), 1 deletion(-)
> 

..snip..

> diff --git a/drivers/gpu/drm/mediatek/mtk_dpi_regs.h b/drivers/gpu/drm/mediatek/mtk_dpi_regs.h
> index 3a02fabe1662..65fce11316b7 100644
> --- a/drivers/gpu/drm/mediatek/mtk_dpi_regs.h
> +++ b/drivers/gpu/drm/mediatek/mtk_dpi_regs.h
> @@ -217,4 +217,7 @@
>   
>   #define EDGE_SEL_EN			BIT(5)
>   #define H_FRE_2N			BIT(25)
> +
> +#define DPI_MATRIX_SET		0xB4
> +#define INT_MATRIX_SEL_MASK	(0x1F << 0)

Please, change INT_MATRIX_SEL_MASK: that's GENMASK(4, 0).

After that,

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

>   #endif /* __MTK_DPI_REGS_H */



