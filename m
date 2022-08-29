Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19D69ECAAD2
	for <linux-mediatek@archiver.kernel.org>; Mon, 29 Aug 2022 09:53:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=//LJclyQhjJT2r8S1fH1UxwV3sqIT+8KbA5orHWfoGg=; b=zP0bkJkMrQQc2kCJfslmRWELEf
	G9E0QfsAD6Y8g6W+ZeUPGpmL+bkmNuiZ4neFt/7Z728wiCjPS3Rvut2jWslg/uyexVGCZCYiZMLbC
	dOb9jOt3k4fZ1DZAk3aVEatwNxohCI2Ph9VOpOxj+3E7OYQNqlMJtcNaeBfxo7RqA/gQS7xaWIkXu
	IJ47O4fNIPyXzzDwocIZouuJQ62Am8G2+bPWR5wF8Tt7d2+M4pWQiPSqP5n7Ze3ftCHYHn69LWJDG
	t6VhvbAlOvSeQGxMUN0+i3rw2vd525spJuaj37OEbnwXbnP37TU+G4fLsdT+Yw/Sm0hvssSm3rNH3
	2RWJFaJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oSbSP-006zCG-5D; Mon, 29 Aug 2022 09:53:25 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oSbRt-006yjf-OQ; Mon, 29 Aug 2022 09:52:55 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 55BDB6601EF3;
	Mon, 29 Aug 2022 10:52:51 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1661766772;
	bh=DOOeZ5TocTeNw6rUquvXDuwOcgicPui9OcTrbY9j4bQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=ku2W3MDOZWr/nzqhNKp5ebzlbv8gwpUjeWBI4IcZynG2q/6vyJ6J06KeMDL/ARDm1
	 Y0yohfxSbjIpPsIB6l53B3hPD5ujRJhnDQ3njsBFMNrfydzuyLJs9fPZiwdwJRA73n
	 XvyqWa+GrIdlpxU2n0QG50yCVuV7Q2I8SM0gEeSUHeXqHNlYDuG7BX2DM9Ua8zEAJt
	 A29OdV0xK3pRF4Zr5jXlJCDoNPoB9aLQlKds3JRn1x4dXhMM4Rj1vyVRDv2PexYfVs
	 OVYrtkeLmPpFGtj5QBcI/YxRkH7iPi0ocL9jjmgmBFvFzJaKbh44hzJwqkO8tNS531
	 3n87+SEdtBH0g==
Message-ID: <3e33e564-a62d-d07c-f214-0f1857b99a9c@collabora.com>
Date: Mon, 29 Aug 2022 11:52:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v4,1/2] soc: mediatek: Add mmsys func to adapt to dpi
 output for MT8186
Content-Language: en-US
To: xinlei.lee@mediatek.com, matthias.bgg@gmail.com,
 rex-bc.chen@mediatek.com, jason-jh.lin@mediatek.com,
 yongqiang.niu@mediatek.com, chunkuang.hu@kernel.org, p.zabel@pengutronix.de,
 airlied@linux.ie, daniel@ffwll.ch
Cc: jitao.shi@mediatek.com, dri-devel@lists.freedesktop.org,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <1661743308-29120-1-git-send-email-xinlei.lee@mediatek.com>
 <1661743308-29120-2-git-send-email-xinlei.lee@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <1661743308-29120-2-git-send-email-xinlei.lee@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220829_025254_011463_CD8CCB72 
X-CRM114-Status: GOOD (  13.73  )
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

Il 29/08/22 05:21, xinlei.lee@mediatek.com ha scritto:
> From: Xinlei Lee <xinlei.lee@mediatek.com>
> 
> Add mmsys func to manipulate dpi output format config for MT8186.
> 
> Co-developed-by: Jitao Shi <jitao.shi@mediatek.com>
> Signed-off-by: Jitao Shi <jitao.shi@mediatek.com>
> Signed-off-by: Xinlei Lee <xinlei.lee@mediatek.com>
> Reviewed-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
> ---
>   drivers/soc/mediatek/mt8186-mmsys.h    | 1 +
>   drivers/soc/mediatek/mtk-mmsys.c       | 8 ++++++++
>   include/linux/soc/mediatek/mtk-mmsys.h | 3 +++
>   3 files changed, 12 insertions(+)
> 
> diff --git a/drivers/soc/mediatek/mt8186-mmsys.h b/drivers/soc/mediatek/mt8186-mmsys.h
> index eb1ad9c37a9c..6eca3445bea3 100644
> --- a/drivers/soc/mediatek/mt8186-mmsys.h
> +++ b/drivers/soc/mediatek/mt8186-mmsys.h
> @@ -3,6 +3,7 @@
>   #ifndef __SOC_MEDIATEK_MT8186_MMSYS_H
>   #define __SOC_MEDIATEK_MT8186_MMSYS_H
>   
> +#define MT8186_DPI_OUTPUT_FORMAT		0x400

For readability, can we please rename this definition to

MT8186_MMSYS_DPI_OUTPUT_FORMAT

Thanks,
Angelo


