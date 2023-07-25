Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1EB9DC00528
	for <linux-mediatek@archiver.kernel.org>; Tue, 25 Jul 2023 06:56:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ua3huDPxPEYJTnEuwPKMbJ6pTxFHp/OqEBs274zWgrw=; b=ByvMrO2cpKDovWNhoigVdiH7IR
	CFGhvnJLp1VOmkAVYs/P4kgCSZkcRfKViS0RoiOyBuQXnQNe9zPcmksYXP0AsF9XDH4YekosZDLkX
	K12rzMphxMNS0QM7Gxcl5eVOXclXfit0A9MC3AowZnbvL0w8MtPv4KqoYi7H6MfnWR6SEo+lD5S70
	L1zdsIRUwjPXqO973EUcor2tCSiTz1KcH8yXLia5HfgxW7vghZP8ALmfakSnSjlPVag9pmR9D9g4c
	V+zyZiriEY9EuraDRdGaS/9TUq3IlPVpeJ4UJE1qDnWCaAzQ8KKGBexWpIhwn8WThJxIk9LYDK2Nh
	0U4cNT1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qOBxr-006Ust-0P;
	Tue, 25 Jul 2023 06:56:11 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qOBxo-006UpU-2T
	for linux-mediatek@lists.infradead.org;
	Tue, 25 Jul 2023 06:56:10 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 8712F6606FD7;
	Tue, 25 Jul 2023 07:56:04 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1690268164;
	bh=B4Byh9ztSQBLozB08jxTQ6IcvGQk5cwwMnDRTpet4ig=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=PW54ktHcjqrBPTv0tI6unfrXFYCCnATCyFw8O02cwFKsJpyT3ENNQ+JiXyfVkExkZ
	 s5H4M3zT3CbmYa0kHt2O0jJ0sVXZ7c/VGmg/OuQmyxllE63kRZZesNWhMwYRL7t1vI
	 36SkTWC+Ny4lh4bRTShHR0tou2K7lSGL/bfA2GIiqU7WH3mHNK79DrUW+K1EAkSTC5
	 i2KcQapFUZCG1r6N347dWGOP3eW64CQpQrFWB4qMMcFk9/e8qKrd4hhM4K4p/gBVOl
	 XBpdXvb5qkAs77wdlzqbQbT+MWJyegjsrCC//xuxLW9yOdnF2+LDxS4JLgsZys4Rrf
	 N/W7v4lW7NIIw==
Message-ID: <cfd6f9f1-5b7a-8a60-a9f5-08d6aa64c720@collabora.com>
Date: Tue, 25 Jul 2023 08:56:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH RESEND] drm/mediatek: Add valid modifier check
Content-Language: en-US
To: Justin Green <greenjustin@chromium.org>,
 linux-mediatek@lists.infradead.org, dri-devel@lists.freedesktop.org
Cc: chunkuang.hu@kernel.org, wenst@chromium.org, jason-jh.lin@mediatek.com,
 justin.yeh@mediatek.com
References: <20230724175839.675911-1-greenjustin@chromium.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230724175839.675911-1-greenjustin@chromium.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230724_235608_929556_2CFD47D1 
X-CRM114-Status: GOOD (  17.09  )
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

Il 24/07/23 19:58, Justin Green ha scritto:
> Add a check to mtk_drm_mode_fb_create() that rejects any modifier that
> is not the AFBC mode supported by MT8195's display overlays.
> 
> Tested by booting ChromeOS and verifying the UI works, and by running
> the ChromeOS kms_addfb_basic binary, which has a test called
> "addfb25-bad-modifier" that attempts to create a framebuffer with the
> modifier DRM_FORMAT_MOD_INVALID and verifies the ADDFB2 ioctl returns
> EINVAL.
> 
> Signed-off-by: Justin Green <greenjustin@chromium.org>
> ---
>   drivers/gpu/drm/mediatek/mtk_drm_drv.c | 7 +++++++
>   1 file changed, 7 insertions(+)
> 
> diff --git a/drivers/gpu/drm/mediatek/mtk_drm_drv.c b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
> index cd5b18ef7951..2096e8a794ad 100644
> --- a/drivers/gpu/drm/mediatek/mtk_drm_drv.c
> +++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
> @@ -51,6 +51,13 @@ mtk_drm_mode_fb_create(struct drm_device *dev,
>   	if (info->num_planes != 1)
>   		return ERR_PTR(-EINVAL);
>   
> +	if (cmd->modifier[0] &&
> +	    cmd->modifier[0] != DRM_FORMAT_MOD_ARM_AFBC(
> +					AFBC_FORMAT_MOD_BLOCK_SIZE_32x8 |
> +					AFBC_FORMAT_MOD_SPLIT |
> +					AFBC_FORMAT_MOD_SPARSE))
> +		return ERR_PTR(-EINVAL);

Would it make more sense to commmonize function mtk_plane_format_mod_supported()
and call that one here instead?

Regards,
Angelo

> +
>   	return drm_gem_fb_create(dev, file, cmd);
>   }
>   




