Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 553DFC5478C
	for <linux-mediatek@archiver.kernel.org>; Fri,  1 Mar 2024 09:03:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QVVmJ/uMg5Pqchh28v0bKJUq9CTMqS5B7EfctPG8Qts=; b=t//gxmYjC7wlIf4BKhgF5IjLoh
	xB83J1aXDWDjbG+a+K0R1S+2c/xxcHAWY2NXqibO0RmJSGN5Il6WEByGBbquK1YG4/1S4+Ew/YVAe
	JWizrPFLSiLYzZXTE8QKxDSfcvlpW0JFk1mqFB78pVmyRGcAf8zYb6oXN9JpjkFv3UlHLVntH2Gbt
	3QWBy1uyhzyVPmbPchDc2r3Fu+nm0SkYP1uuogoLUAqFWoNxngkre9mO+1Se2UNiKaI01tfmDprdf
	EIj9lcOnnq49gIarZFzIoYWaymt0yymY620cmkZpjdRKGp6ddr4YCqVp9T1pSVlE+gPTTpIZlxsEm
	8k0sN7mQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rfyo6-0000000H2nO-00VZ;
	Fri, 01 Mar 2024 09:03:54 +0000
Received: from madrid.collaboradmins.com ([2a00:1098:ed:100::25])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rfyo2-0000000H2mW-2mKv;
	Fri, 01 Mar 2024 09:03:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1709283829;
	bh=hkf4tHhd3AClvUxsa8LdGdo131B48+hG3jkXyZorL0o=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=BOr0fTGxd8buRCpSPVkD7hu6KavyqqEhPT+mNOfdzEy1d0+snnGQPf+Tv/C1nPpA/
	 efQNQ/RBTEqjxVoi22f/+U2sx9HEFVfKfqN/aaJy2JNwiZSoNSEan7dv2qxJeq7g4T
	 T3v0G60DqpvGaNRee0haVGps28lrNC1QSV6/YW+v03iIy1bL4O8JllqEOfdskxvysF
	 FMUTmc+PZdcbIQXbAAJ8P6WMxdJ86ABFc4AVz0clDEUO9QMRC28kUUpeNQPDSL0PwU
	 TaVr3OfJt+Kfl2t6AqtP3589GiRQon6ApVy/AG6Zq+d+sZ/cPv5yiiT/7NDjZ5Gvwz
	 d1Rb4OoDlH9dA==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 4F88637814A4;
	Fri,  1 Mar 2024 09:03:48 +0000 (UTC)
Message-ID: <ea7f25bf-2294-4ad4-bc18-226827d49ae8@collabora.com>
Date: Fri, 1 Mar 2024 10:03:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] media: mediatek: vcodec: support 36bit physical address
Content-Language: en-US
To: Yunfei Dong <yunfei.dong@mediatek.com>,
 =?UTF-8?Q?N=C3=ADcolas_F_=2E_R_=2E_A_=2E_Prado?= <nfraprado@collabora.com>,
 Nicolas Dufresne <nicolas.dufresne@collabora.com>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Nathan Hebert <nhebert@chromium.org>
Cc: Hsin-Yi Wang <hsinyi@chromium.org>, Fritz Koenig <frkoenig@chromium.org>,
 Daniel Vetter <daniel@ffwll.ch>, Steve Cho <stevecho@chromium.org>,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20240301020126.11539-1-yunfei.dong@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20240301020126.11539-1-yunfei.dong@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240301_010350_869855_9FDC998A 
X-CRM114-Status: GOOD (  16.90  )
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

Il 01/03/24 03:01, Yunfei Dong ha scritto:
> The physical address is beyond 32bit for mt8188 platform, need
> to change the type from unsigned int to unsigned long in case of
> the high bit missing.
> 
> Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>
> ---
>   .../mediatek/vcodec/decoder/vdec/vdec_vp9_req_lat_if.c        | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_vp9_req_lat_if.c b/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_vp9_req_lat_if.c
> index cf48d09b78d7..85df3e7c2983 100644
> --- a/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_vp9_req_lat_if.c
> +++ b/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_vp9_req_lat_if.c
> @@ -1074,7 +1074,7 @@ static int vdec_vp9_slice_setup_tile_buffer(struct vdec_vp9_slice_instance *inst
>   	unsigned int mi_row;
>   	unsigned int mi_col;
>   	unsigned int offset;
> -	unsigned int pa;
> +	unsigned long pa;

If you used the right type from the beginning, you wouldn't have to fix that ;-)

Is there any reason why you didn't - and still don't use the `phys_addr_t` type
for the `pa` member?

Cheers,
Angelo

>   	unsigned int size;
>   	struct vdec_vp9_slice_tiles *tiles;
>   	unsigned char *pos;
> @@ -1109,7 +1109,7 @@ static int vdec_vp9_slice_setup_tile_buffer(struct vdec_vp9_slice_instance *inst
>   	pos = va + offset;
>   	end = va + bs->size;
>   	/* truncated */
> -	pa = (unsigned int)bs->dma_addr + offset;
> +	pa = (unsigned long)bs->dma_addr + offset;
>   	tb = instance->tile.va;
>   	for (i = 0; i < rows; i++) {
>   		for (j = 0; j < cols; j++) {



