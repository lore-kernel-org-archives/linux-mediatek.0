Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01AD7C4345F
	for <linux-mediatek@archiver.kernel.org>; Wed, 24 Apr 2024 10:02:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=b587ZfRWDFgGbJ2dkHn7GtcVmp/UFD1ys2cZnMwRIjs=; b=mNPuq1g+5C+N+mcMEOIc4wgIG1
	fy6iN7DobOwjHUHarU6PjagKN2J0+QrM9O1QO1F8n83jQjUBx1sdO9a0N/7I3oRv9L5345rn2pRmp
	NN6NgFkUhlqBOwOkeEl9zM3VRFzSqLFntXO+M6zahL8d3ZwEclQgrp/N/hPIJ3GH2kSWKc/Yti8Uf
	WK7PWeWS5ybLWODrEKQjsJNxnPivdT3aFFeLdIivViFZa4ZVJM+Xj1J6pjU1q8PHNraZkxEo7aubQ
	55VFZP+pGo5MHPKQReKTDzWbj6gvHl5vgnkYL8oIZz86cphAWuziqhEMDc8OL5ya8aV5aAVcEsUFW
	p5CKFL0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rzZSc-00000003c5r-2q5F;
	Wed, 24 Apr 2024 10:02:42 +0000
Received: from madrid.collaboradmins.com ([46.235.227.194])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rzZSS-00000003c2W-1eig;
	Wed, 24 Apr 2024 10:02:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1713952951;
	bh=nZK5irVR2uIXCl1fxQYGDrvG2jZj3KlZwFclmsGUUjc=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=gVnxQX4WvAFaZyHnI8bBEmo2M9V/VUoMmCAW3Cc5O4TwdKHj9MWP7NYjYUZ5lz+fP
	 kKatbrN/7bWiU4Q9PKnbF3Et76Ap8sNkU3tvEC3MOoaVpo5OJeWJu1NcNnzAndvncF
	 ftAgwckMUrv0CGW6fX6umdmHqhRYFmgZ4Y0tS+OvZ8Spfo3u5PfOdDtKDIOP5ZBvsC
	 r/9ckIvPj0LXx3mxB5alDGGt57uvbwn4ocNFpIrFfFpWk380kv/Lb0CWiA1tPbZZMW
	 +zQH4+Ng++PXuA4jNOH7gvT4rsmjQee/MQRxSGnpwUv/SMj42hKroHiR8ZhORmwo+u
	 Ch33dWBiH77Kg==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 263D2378107C;
	Wed, 24 Apr 2024 10:02:30 +0000 (UTC)
Message-ID: <ba25cb7b-ff93-4fcb-b943-154e960d45a0@collabora.com>
Date: Wed, 24 Apr 2024 12:02:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/4] media: mediatek: imgsys: Support image processing
To: Olivia Wen <olivia.wen@mediatek.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Mathieu Poirier <mathieu.poirier@linaro.org>, Rob Herring <robh@kernel.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Tinghan Shen <tinghan.shen@mediatek.com>,
 linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 jason-ch.chen@mediatek.com, yaya.chang@mediatek.com, teddy.chen@mediatek.com
References: <20240424030351.5294-1-olivia.wen@mediatek.com>
 <20240424030351.5294-5-olivia.wen@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20240424030351.5294-5-olivia.wen@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240424_030232_595770_E0C2A3B1 
X-CRM114-Status: GOOD (  11.81  )
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

Il 24/04/24 05:03, Olivia Wen ha scritto:
> Integrate the imgsys core architecture driver for image processing on
> the MT8188 platform.
> 
> Signed-off-by: Olivia Wen <olivia.wen@mediatek.com>

This should be reordered before introducing the 8188 scp core 1 support commit,
but let's check with Mathieu before sending a v4.

With that reordered,

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

> ---
>   include/linux/remoteproc/mtk_scp.h | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/include/linux/remoteproc/mtk_scp.h b/include/linux/remoteproc/mtk_scp.h
> index 7c2b7cc9..344ff41 100644
> --- a/include/linux/remoteproc/mtk_scp.h
> +++ b/include/linux/remoteproc/mtk_scp.h
> @@ -43,6 +43,7 @@ enum scp_ipi_id {
>   	SCP_IPI_CROS_HOST_CMD,
>   	SCP_IPI_VDEC_LAT,
>   	SCP_IPI_VDEC_CORE,
> +	SCP_IPI_IMGSYS_CMD,
>   	SCP_IPI_NS_SERVICE = 0xFF,
>   	SCP_IPI_MAX = 0x100,
>   };


