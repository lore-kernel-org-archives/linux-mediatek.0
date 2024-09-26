Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FD65CCFA15
	for <linux-mediatek@archiver.kernel.org>; Thu, 26 Sep 2024 09:45:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TTougdn5ZMGPi4Su4uh3zObtc+EXqip9CD9cEHgGWiA=; b=cJamOI04ibGdqWp5mKOqtKkrQE
	S7P0Lj/6X+ZyUVgzXNzKbWB/cghbnB1irwFDbK6ZRIcM3JvBFI9xVS/wyOb0eskff4xbAl8j8uDlH
	mzpYqyqmt1NFtEe6ZucTfTySXfFyKqjPwZiewmHkWKkWQTGKan0pvwgtl5Ron+Ulg6uU51f+PEBSI
	lKii8rPYB0aYPLjQX38jq/JRdylO9v7ZjlgkVUmAwBiZsai8h2c85IaW9C6M84X8f8DNsBaJciVvb
	El5VcIv8ESmo/AJTkYUyhnpV9jopr7Ff0stUXaEwcoAVQLhCrQoLBBN20g1a2RThiUXvTfoBhuoEY
	sDbyiodA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1stl3r-00000007w6w-06gJ;
	Thu, 26 Sep 2024 09:45:23 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1stksr-00000007tyx-3wlN;
	Thu, 26 Sep 2024 09:34:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1727343240;
	bh=Df5Y9+CiHpGGKQOzwFg0ep4DadWij8jUa5ykfjb2WLg=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=LUI9tduOcNBvZPpnTbgYRam64lWcZhKujisk4t/35GFgvZ3/st0pJn2jrXSu2Lam/
	 Gx47u64L0EkRtup8c5zi8swKwdFlx+VVe7hNov7e3ADoinAftAd76eU7zuq+HxTjnC
	 3nAtsNaz0uSLtWynTVo4uMw6aIk7jVob4wcZG0JzCgJU7pZCzpLNcGrFJVYdKsz7HK
	 jDX1G+UG1G76vTDUzqWghRCbx7RcZZkZgveShv9jaXsmoYbcs/0wV9fGORZ5AUW2TN
	 wlvkAcEaJSeG8jOFcRyzWjw598PAtHi7g0GXzvExvy4ERbfmz8rapp2Rp7/L+rCD0B
	 +e5zymaIdn3ug==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id A271117E10AE;
	Thu, 26 Sep 2024 11:33:59 +0200 (CEST)
Message-ID: <d8f54575-6df8-4198-a078-70debc9f8e0b@collabora.com>
Date: Thu, 26 Sep 2024 11:33:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/1] drm/mediatek: Fix wrong check of nvmem_cell_read
To: Liankun Yang <liankun.yang@mediatek.com>, chunkuang.hu@kernel.org,
 p.zabel@pengutronix.de, airlied@gmail.com, simona@ffwll.ch,
 matthias.bgg@gmail.com, rex-bc.chen@mediatek.com, msp@baylibre.com,
 granquet@baylibre.com, dmitry.osipenko@collabora.com,
 jitao.shi@mediatek.com, mac.shen@mediatek.com, peng.liu@mediatek.com
Cc: Project_Global_Chrome_Upstream_Group@mediatek.com,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20240925084116.28848-1-liankun.yang@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20240925084116.28848-1-liankun.yang@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240926_023402_168278_7655226C 
X-CRM114-Status: GOOD (  13.60  )
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

Il 25/09/24 10:40, Liankun Yang ha scritto:
> If the len is 0, kernel crash will occur when performing operations.
> Add the len check conditions to prevent kernel crash.
> 

Please fix the commit title:

drm/mediatek: mtk_dp: Fix potential KP on 0 bytes nvmem cell read

> Fixes: f70ac097a2cf ("drm/mediatek: Add MT8195 Embedded DisplayPort driver")
> 

Please remove this blank line between the Fixes tag and your S-o-b.

> Signed-off-by: Liankun Yang <liankun.yang@mediatek.com>
> ---
>   drivers/gpu/drm/mediatek/mtk_dp.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/mediatek/mtk_dp.c b/drivers/gpu/drm/mediatek/mtk_dp.c
> index d8796a904eca..0cc75ba96b98 100644
> --- a/drivers/gpu/drm/mediatek/mtk_dp.c
> +++ b/drivers/gpu/drm/mediatek/mtk_dp.c
> @@ -1082,7 +1082,7 @@ static void mtk_dp_get_calibration_data(struct mtk_dp *mtk_dp)
>   	buf = (u32 *)nvmem_cell_read(cell, &len);
>   	nvmem_cell_put(cell);
>   
> -	if (IS_ERR(buf) || ((len / sizeof(u32)) != 4)) {
> +	if (IS_ERR(buf) || (len == 0) || ((len / sizeof(u32)) != 4)) {

if (IS_ERR(buf) || !len || ((len / sizeof(u32)) != 4)) {

Cheers,
Angelo


