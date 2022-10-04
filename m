Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C065CC4332F
	for <linux-mediatek@archiver.kernel.org>; Tue,  4 Oct 2022 09:49:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=60ON9TuCB4z4S/w0yNkrM6DAGMcqyDLavqMBfN5d6PQ=; b=ZMvVtiGdsRzfgLYsOeYwjYUiJo
	Jn1TREb5+Lno9UdbsSsqoB6m1wJYVpmO6FdpCeMg9aOGs9DNEp6xS/s8vYOTPLZiBndbPpR32foYO
	VTkZO4JOEqfbPqQ05Gys1oKvupjGNHsUcIc9a/zwx2MdpFpn7WZ+0Kbp5X9L76KjNjKj3o+f2grT9
	csozjzT8aB4J0PHIVJ/0wTm6Qm6OLgvMok/2PCuCIoJi6YUlSFpkU5M87WznoA1Yuwi6OjDMBycmy
	2TmNh1Pv5YH1Cyhm+z+DiImhZF4m4IMfYcjHpwStgHAAGoS2Iu3GEDmXAVsDjusWfWTNuiGydE4F+
	UrSFbGMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ofeYT-009DVx-GO; Tue, 04 Oct 2022 09:49:37 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ofeYR-009DUh-5f
	for linux-mediatek@lists.infradead.org; Tue, 04 Oct 2022 09:49:36 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 3CE686601595;
	Tue,  4 Oct 2022 10:49:33 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1664876973;
	bh=0JAossrh1s1hdIruCobtP1yntPLtj2cheG0ilCpKD4g=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=iNMFa0r/mUkXcpDHLcGnQXzL5H/YCfCOFDr7/zwbiDZQwxLsS1PaxgsKhaMno6kqG
	 MuzvN5z+biFI64Q8cQ50/LNSOzmfiql0cBClk7Rwk71MVD4Lye27Kn+KjQxZQ4QMDd
	 WnsmIF6vB0O7M79Jd1NwgfZursYLILfxIfR0gU8LTYfO+oUwGz72lamFmgRudlVrdI
	 X81kL9mA8SAgNn3zcsh3UL1uQ6wGu/lcHwM+oh7d83Dx5fGGGBKt6cGpSTRZpM6IRl
	 qsn7f1XmzRVhlMcXmBgyjvj/ibLklrqc8B4bg4YIFEjNnw96gqq8Tt5o8q6DgkvokI
	 TS2TRfsWm59Bw==
Message-ID: <699e33a2-9498-9a84-47c9-419c952e75cf@collabora.com>
Date: Tue, 4 Oct 2022 11:49:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
Subject: Re: [PATCH] media: platform: mtk-mdp3: remove unused
 VIDEO_MEDIATEK_VPU config
Content-Language: en-US
To: Moudy Ho <moudy.ho@mediatek.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, linux-media@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20221004023727.28946-1-moudy.ho@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20221004023727.28946-1-moudy.ho@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221004_024935_461533_669D83FA 
X-CRM114-Status: GOOD (  14.20  )
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

Il 04/10/22 04:37, Moudy Ho ha scritto:
> Since remoteproc completely replaces the VPU in MDP3, unused config
> should be removed to avoid compilation warnings reported on i386 or x86_64.
> 

MTK_SCP replaces VIDEO_MEDIATEK_VPU... but your description is not wrong, anyway.

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

> Warning messages:
>      WARNING: unmet direct dependencies detected for VIDEO_MEDIATEK_VPU
>            Depends on [n]: MEDIA_SUPPORT [=y] && MEDIA_PLATFORM_SUPPORT [=y]
>          && MEDIA_PLATFORM_DRIVERS [=y] && V4L_MEM2MEM_DRIVERS [=n] &&
>          VIDEO_DEV [=y] && (ARCH_MEDIATEK || COMPILE_TEST [=y])
>            Selected by [y]:
>            - VIDEO_MEDIATEK_MDP3 [=y] && MEDIA_SUPPORT [=y] &&
>          MEDIA_PLATFORM_SUPPORT [=y] && MEDIA_PLATFORM_DRIVERS [=y] &&
>          (MTK_IOMMU [=n] || COMPILE_TEST [=y]) && VIDEO_DEV [=y] &&
>          (ARCH_MEDIATEK || COMPILE_TEST [=y]) && HAS_DMA [=y] && REMOTEPROC
>          [=y]
> 
> Fixes: 61890ccaefaf ("media: platform: mtk-mdp3: add MediaTek MDP3 driver")
> Signed-off-by: Moudy Ho <moudy.ho@mediatek.com>
> ---
>   drivers/media/platform/mediatek/mdp3/Kconfig | 1 -
>   1 file changed, 1 deletion(-)
> 
> diff --git a/drivers/media/platform/mediatek/mdp3/Kconfig b/drivers/media/platform/mediatek/mdp3/Kconfig
> index 50ae07b75b5f..846e759a8f6a 100644
> --- a/drivers/media/platform/mediatek/mdp3/Kconfig
> +++ b/drivers/media/platform/mediatek/mdp3/Kconfig
> @@ -9,7 +9,6 @@ config VIDEO_MEDIATEK_MDP3
>   	select VIDEOBUF2_DMA_CONTIG
>   	select V4L2_MEM2MEM_DEV
>   	select MTK_MMSYS
> -	select VIDEO_MEDIATEK_VPU
>   	select MTK_CMDQ
>   	select MTK_SCP
>   	default n
> 


