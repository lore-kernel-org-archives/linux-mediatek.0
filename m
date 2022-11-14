Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 384C2C4332F
	for <linux-mediatek@archiver.kernel.org>; Mon, 14 Nov 2022 11:09:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kvmm36TO4j/lYEpoVRRbLBCMnloq6Vtklw3iBFNkNHE=; b=a4L3dBsqU9bCoOdIPvyg1XBQE6
	xj/E9V1pBpvTecXRVUAWhev8aclfw5Cpq3kdtnWrOaSBOSiH9PKPSR9B8pkso1Gc/s0fZvpJ+DErt
	BNGjbAr1Jkn8nQfOqAuS/Fx87eLXtbiWafmtew/CmVDHQ/eZ35IbkeGsNRW3iZUXQXmVDwFFqeg8m
	n2WUlG35SnYjFuSVMZnq6nXfWg/Z+LrYszYMrq8tXcWaoQh3duHh+1CBWQ9j57mbbSjSL72l7rwOa
	mOI1YhCvlyQMETAmSxcu1UmXpAexcPz3DeLva+ulG9aclJOabOKy5JrvABmlNRSP/uZnCZUXdjMNV
	Ru+QcKQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ouXKg-000DuY-6y; Mon, 14 Nov 2022 11:08:54 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ouXKV-000Dox-8p; Mon, 14 Nov 2022 11:08:44 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id A1066660035A;
	Mon, 14 Nov 2022 11:08:40 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1668424121;
	bh=WSZBBTuHZl7i5QeHJkZThtLqJACixahwu9l9LESefbA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=oHySW+J8hVuJ7x6PI24Y90yrAp822hL2yetyUUbeIhY1OmfW2+SXasFB0RzCVKCKk
	 4PEkbXvmLBOtcG3Ppj7ZAVn06lona6ffEshFTBBzX3QDkAU6qVoF3wcZaFqUGyQMKU
	 zDk+gT7GhMcJTyWAZ+rjPCr1ZOP+PNAA8FvV3XWJZTTtLl8nBdOw5kZz1y0uw7mDjY
	 VZrkoC12Yj9Wr+Y/09+zvKHs3mrjYwGk6rcgRyU4IZNkMsoJaln0F/0daKkFHBS/HE
	 O6gCjOIJDdo/Vulo7AJGIkkCKdqUvmJpN5PE417zZI1ITorN9tzHbZWGuzMBwVxYBV
	 XGIsXxzvo0s8w==
Message-ID: <f301a43a-5d55-1607-b8d3-5cd057977397@collabora.com>
Date: Mon, 14 Nov 2022 12:08:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.3
Subject: Re: [PATCH v2] media: mediatek: vcodec: fix h264 cavlc bitstream fail
Content-Language: en-US
To: Yunfei Dong <yunfei.dong@mediatek.com>, Chen-Yu Tsai
 <wenst@chromium.org>, Nicolas Dufresne <nicolas@ndufresne.ca>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Tiffany Lin <tiffany.lin@mediatek.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 George Sun <george.sun@mediatek.com>, Xiaoyong Lu
 <xiaoyong.lu@mediatek.com>, Hsin-Yi Wang <hsinyi@chromium.org>,
 Fritz Koenig <frkoenig@chromium.org>, Daniel Vetter <daniel@ffwll.ch>,
 Steve Cho <stevecho@chromium.org>, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20221018114122.26785-1-yunfei.dong@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20221018114122.26785-1-yunfei.dong@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221114_030843_483842_DC481A17 
X-CRM114-Status: GOOD (  22.97  )
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

Il 18/10/22 13:41, Yunfei Dong ha scritto:
> Some cavlc bistream will decode fail when the frame size is small than

s/small/smaller/g

> 20 bytes. Need to add pending data at the end of the bitstream.
> 
> For the minimum size of mapped memory is 256 bytes(16x16), adding four bytes data
> won't lead to access unknown virtual memory.
> 
> Fixes: 59fba9eed5a7 ("media: mediatek: vcodec: support stateless H.264 decoding for mt8192")
> Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>
> ---
> compared with v1:
> - add detail comments for function: vdec_h264_insert_startcode.
> - re-write commit message.
> ---
>   .../vcodec/vdec/vdec_h264_req_multi_if.c      | 32 +++++++++++++++++--
>   1 file changed, 29 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/media/platform/mediatek/vcodec/vdec/vdec_h264_req_multi_if.c b/drivers/media/platform/mediatek/vcodec/vdec/vdec_h264_req_multi_if.c
> index 4cc92700692b..18e048755d11 100644
> --- a/drivers/media/platform/mediatek/vcodec/vdec/vdec_h264_req_multi_if.c
> +++ b/drivers/media/platform/mediatek/vcodec/vdec/vdec_h264_req_multi_if.c
> @@ -539,6 +539,29 @@ static int vdec_h264_slice_core_decode(struct vdec_lat_buf *lat_buf)
>   	return 0;
>   }
>   
> +static void vdec_h264_insert_startcode(struct mtk_vcodec_dev *vcodec_dev, unsigned char *buf,
> +				       size_t *bs_size, struct mtk_h264_pps_param *pps)
> +{
> +	struct device *dev = &vcodec_dev->plat_dev->dev;
> +
> +	/* Need to add pending data at the end of bitstream when bs_sz is small than
> +	 * 20 bytes for cavlc bitstream, or lat will decode fail. This pending data is
> +	 * useful for mt8192 and mt8195 platform.

What is the reason why other SoCs don't need this?

> +	 *
> +	 * cavlc bitstream when entropy_coding_mode_flag is false.
> +	 */
> +	if (pps->entropy_coding_mode_flag || *bs_size > 20 ||
> +	    !(of_device_is_compatible(dev->of_node, "mediatek,mt8192-vcodec-dec") ||
> +	    of_device_is_compatible(dev->of_node, "mediatek,mt8195-vcodec-dec")))

I'm not comfortable seeing of_device_is_compatible... this list will grow whenever
a new SoC needing this appears.
Please think about a good name for a flag/quirk, or a bool, in the platform data
for these two SoCs and use it.

Regards,
Angelo


