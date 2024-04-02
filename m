Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 073A2C6FD1F
	for <linux-mediatek@archiver.kernel.org>; Tue,  2 Apr 2024 10:08:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5+iKD4xo5x2r5+P6lJml9QQucQAWkM0/wI8UfkuAUUo=; b=r5jeLSJto6c2NZdSi+tbJ7y8Sb
	U/9+jaKmnv/QegVyooK9twFWOEgp1r4v5jLaaL92cWRvAVRWmI3B+c0rXORuR4wwd3Y7LdHJ3RGdN
	jRgsku//JTUAjVyNRci33V4bSjfvCpXyalS0Spt2ftbbRHHKRRPGSQ0Q/3TGpSS1JcPZJZ3XXN4VE
	1F5lpJWbkWwRrwIwSFJ8EXXQ4SMOdZ0kjA3BFJGBzYcVEGqeB9mZsi3qrt4Tx21VoJOWvULGLI24C
	kFlQhpBJMISBCW/xe1HWmLhlccbk+JxHz2CMGC2GDhRZcOEdkuaYgKgc7Y5qUVZGfuouyhOCRGjzG
	SBLgCeng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rrb4C-0000000AZjU-2B6E;
	Tue, 02 Apr 2024 10:08:32 +0000
Received: from madrid.collaboradmins.com ([2a00:1098:ed:100::25])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rrb44-0000000AZPS-16X6;
	Tue, 02 Apr 2024 10:08:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1712052393;
	bh=KTT/8Mc/chtrCVxYE332MN7zGpT28w7lyGm0suaoo9I=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=hzKk9Yxgn4OFOjI9VmZMJ6NAkp+4mRgZ1Q4tp3mH3k+M/mKPcpp+H648oh0a1z4iY
	 2Uln6C0iJPGfoKD+BDn4HJpsp+sThjZIBf+uD1apTuLcJXcWmcztPx0pbKmp9ipNHR
	 d7Qzh9Dj2+HiXDhNC50bvdV77dA2fc1iD83i3WH03NG5OWf1Gug6Z9cqiud+1JvlCG
	 c+f+WDjz/zW7YBGwgmEBk80BZ028mQy6jWO7nncMoZ8xTp/xSpabJiZ74kMT5Nahi7
	 BIGBOX48YQ62bFRtxa0vBglJrbXLwAvvsstBpvCzVCXtn6fnwbc3YMDD5dpXlr55wd
	 lv42GNZXVHH0w==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 06D8A37820EE;
	Tue,  2 Apr 2024 10:06:32 +0000 (UTC)
Message-ID: <53c08ee3-51d7-43d9-a643-91c76b853c43@collabora.com>
Date: Tue, 2 Apr 2024 12:06:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 00/11] drm/mediatek: drop driver owner initialization
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Matthias Brugger <matthias.bgg@gmail.com>
Cc: dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20240330-b4-module-owner-drm-mediatek-v1-0-fd5c4b8d633e@linaro.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20240330-b4-module-owner-drm-mediatek-v1-0-fd5c4b8d633e@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240402_030824_507793_85BC1D8F 
X-CRM114-Status: UNSURE (   7.95  )
X-CRM114-Notice: Please train this message.
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

Il 30/03/24 21:43, Krzysztof Kozlowski ha scritto:
> Simplify the code by dropping unnecessary .owner initialization in the
> driver.
> 

For the entire series:

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

> Best regards,
> Krzysztof
> 
> ---
> Krzysztof Kozlowski (11):
>        drm/mediatek: aal: drop driver owner initialization
>        drm/mediatek: ccorr: drop driver owner initialization
>        drm/mediatek: color: drop driver owner initialization
>        drm/mediatek: gamma: drop driver owner initialization
>        drm/mediatek: merge: drop driver owner initialization
>        drm/mediatek: ovl: drop driver owner initialization
>        drm/mediatek: ovl_adaptor: drop driver owner initialization
>        drm/mediatek: rdma: drop driver owner initialization
>        drm/mediatek: ethdr: drop driver owner initialization
>        drm/mediatek: mdp_rdma: drop driver owner initialization
>        drm/mediatek: padding: drop driver owner initialization
> 
>   drivers/gpu/drm/mediatek/mtk_disp_aal.c         | 1 -
>   drivers/gpu/drm/mediatek/mtk_disp_ccorr.c       | 1 -
>   drivers/gpu/drm/mediatek/mtk_disp_color.c       | 1 -
>   drivers/gpu/drm/mediatek/mtk_disp_gamma.c       | 1 -
>   drivers/gpu/drm/mediatek/mtk_disp_merge.c       | 1 -
>   drivers/gpu/drm/mediatek/mtk_disp_ovl.c         | 1 -
>   drivers/gpu/drm/mediatek/mtk_disp_ovl_adaptor.c | 1 -
>   drivers/gpu/drm/mediatek/mtk_disp_rdma.c        | 1 -
>   drivers/gpu/drm/mediatek/mtk_ethdr.c            | 1 -
>   drivers/gpu/drm/mediatek/mtk_mdp_rdma.c         | 1 -
>   drivers/gpu/drm/mediatek/mtk_padding.c          | 1 -
>   11 files changed, 11 deletions(-)
> ---
> base-commit: 7fdcff3312e16ba8d1419f8a18f465c5cc235ecf
> change-id: 20240330-b4-module-owner-drm-mediatek-aa525b70f033
> 
> Best regards,



