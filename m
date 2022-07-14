Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18737C433EF
	for <linux-mediatek@archiver.kernel.org>; Thu, 14 Jul 2022 14:51:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xa5RQmHCM2NCaGhtbRl+Zd37a4LSUMe5pWmo4ZyYNKI=; b=3od2ZS5DlVpiyF5Gj0S8t8m04o
	YPbCCRri1pWmAodvfjnmTUYVK0E+0UUleEmPSTbDwMjq8di1EoBvNkGEITVeaqvhYrkcEpM3Xwj6j
	sUznTZ2JPRdAWRjfEK8xoiWO6nEFUwtIQzSB4K5x0Nq+cLw58Qo4bkMjBV1yXnxT5EeEBD+g34ezJ
	VakjBOso3XHR6/dCv9x4zDegcEIehpvJvNe7TzQUZIwfMcxY1fb57AWqEsgUMoG7QF3Ru/jKKcQd4
	PmOMU3EQ+cmjrvKwISaQnua4cSMmcWhWxQUncSEs5PZcp4cLlrmSyDNQ/ae//LfL+2fpUjoSGXenj
	iCIohqmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oC0Br-00FMrB-Q6; Thu, 14 Jul 2022 14:51:43 +0000
Received: from [2601:1c0:6280:3f0::a6b3]
	by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oC0Bg-00FMlR-OE; Thu, 14 Jul 2022 14:51:32 +0000
Message-ID: <f418dc88-96e8-99bb-dfc0-1da277b7f0ee@infradead.org>
Date: Thu, 14 Jul 2022 07:51:30 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v22 4/4] media: platform: mtk-mdp3: add Mediatek MDP3
 driver
Content-Language: en-US
To: Moudy Ho <moudy.ho@mediatek.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring
 <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Rob Landley <rob@landley.net>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, Alexandre Courbot
 <acourbot@chromium.org>, tfiga@chromium.org, drinkcat@chromium.org,
 pihsun@chromium.org, hsinyi@google.com,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 daoyuan huang <daoyuan.huang@mediatek.com>,
 Ping-Hsun Wu <ping-hsun.wu@mediatek.com>, allen-kh.cheng@mediatek.com,
 xiandong.wang@mediatek.com, randy.wu@mediatek.com,
 jason-jh.lin@mediatek.com, roy-cw.yeh@mediatek.com,
 river.cheng@mediatek.com, Project_Global_Chrome_Upstream_Group@mediatek.com,
 cellopoint.kai@gmail.com
References: <20220714092153.16686-1-moudy.ho@mediatek.com>
 <20220714092153.16686-5-moudy.ho@mediatek.com>
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20220714092153.16686-5-moudy.ho@mediatek.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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

	

On 7/14/22 02:21, Moudy Ho wrote:
> diff --git a/drivers/media/platform/mediatek/mdp3/Kconfig b/drivers/media/platform/mediatek/mdp3/Kconfig
> new file mode 100644
> index 000000000000..6640763c7c5e
> --- /dev/null
> +++ b/drivers/media/platform/mediatek/mdp3/Kconfig
> @@ -0,0 +1,20 @@
> +# SPDX-License-Identifier: GPL-2.0-only
> +config VIDEO_MEDIATEK_MDP3
> +	tristate "Mediatek MDP v3 driver"
> +	depends on MTK_IOMMU || COMPLIE_TEST

	                        COMPILE_TEST

> +	depends on VIDEO_DEV
> +	depends on ARCH_MEDIATEK || COMPILE_TEST
> +	depends on MTK_MMSYS
> +	depends on HAS_DMA
> +	select VIDEOBUF2_DMA_CONTIG
> +	select V4L2_MEM2MEM_DEV
> +	select VIDEO_MEDIATEK_VPU
> +	select MTK_CMDQ
> +	select MTK_SCP
> +	default n
> +	help
> +	    It is a v4l2 driver and present in Mediatek MT8183 SoC.
> +	    The driver supports for scaling and color space conversion.

	  The driver supports scaling and color space conversion.

> +
> +	    To compile this driver as a module, choose M here: the
> +	    module will be called mtk-mdp3.

-- 
~Randy

