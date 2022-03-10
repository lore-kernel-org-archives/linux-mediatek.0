Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D956C433F5
	for <linux-mediatek@archiver.kernel.org>; Thu, 10 Mar 2022 10:55:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bHA3hVzwbA2ad1i1XPKpr4vbq2vr7EOJJj7d2lJe2PM=; b=j2BeRutMeaAy15
	jQzQ/IrtU1ryBT32afc8ljCsbSG+gtuiv2mmJBU348TOBtKih4wLyBqdnwO/sOI0Fw21E3N5ibZnC
	my13gwinwlYFbvEs7LWelgHvT46kOtWmrT8n/FW2rd1AdS8Edbb2KFkIxAEpp0MEHwqs9dH4wdi8g
	IIj61aRjOw2jNIXPX33W8jttx9my5oettKgwXEE8op9vtYUxkKmJNrCubMY+8ZTgTxV7pYYjMp1e+
	ns2y32dRQ6WTjrkUxuaxNiAZ+ZWNzg5RCnarePMg8ROebgZhdYHcSzNkf3+vbow2l1zyy8rZFFYg1
	KpwGY/h/VnRkLLiq/cig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nSGSG-00CVoe-Rp; Thu, 10 Mar 2022 10:55:36 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nSGPh-00CUGU-Rg; Thu, 10 Mar 2022 10:52:59 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id 8C15C1F454CB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1646909576;
 bh=XZu2CPgKfnoR/3OvjjvechU+ohZ+UyXg7yVflCM7u2g=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=FAn8r3GcOBRnrfY3T3yAWonrmQaUcN9D4zoyLw/LS8kjC0dUhh1xBwkWW/XhkcEdL
 iKI/uEQLSEw22gE8lT0MRAV/CEiwiH8sfotY7UrNHS0B54/FLPW78sM9c9FXNIp2k0
 +aqmnPVWh7alE+0I8PexgjONUSP4FaXqU2Vxn65XfkNAj+aGxJ1Ma082JjpdL7wVBd
 KJ2lxyEsG18ubw0L+Ge5YfpJ1RR5oJbcR2AOdttniPaOFVISI4YBnW/GnXu5b0ip+0
 H3e2j82uWchH4RHhO4wJrtYZTcC8tzSn9brF/7M+5qBGzUd5oOJIMwfNUjF1pcMZhZ
 tEpXA0v9max3Q==
Message-ID: <85e126f5-b90f-c78f-5ae4-3757b6bc4b7a@collabora.com>
Date: Thu, 10 Mar 2022 11:52:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.1
Subject: Re: [PATCH v14 15/22] drm/mediatek: add ETHDR support for MT8195
Content-Language: en-US
To: "Nancy.Lin" <nancy.lin@mediatek.com>, Rob Herring <robh+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, wim@linux-watchdog.org,
 linux@roeck-us.net
Cc: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Nathan Chancellor <nathan@kernel.org>,
 Nick Desaulniers <ndesaulniers@google.com>,
 "jason-jh . lin" <jason-jh.lin@mediatek.com>,
 Yongqiang Niu <yongqiang.niu@mediatek.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, dri-devel@lists.freedesktop.org,
 llvm@lists.linux.dev, singo.chang@mediatek.com, srv_heupstream@mediatek.com,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20220310035515.16881-1-nancy.lin@mediatek.com>
 <20220310035515.16881-16-nancy.lin@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220310035515.16881-16-nancy.lin@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220310_025258_082530_48148E64 
X-CRM114-Status: GOOD (  11.29  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Il 10/03/22 04:55, Nancy.Lin ha scritto:
> ETHDR is a part of ovl_adaptor.
> ETHDR is designed for HDR video and graphics conversion in the external
> display path. It handles multiple HDR input types and performs tone
> mapping, color space/color format conversion, and then combine
> different layers, output the required HDR or SDR signal to the
> subsequent display path.
> 
> Signed-off-by: Nancy.Lin <nancy.lin@mediatek.com>
> Reviewed-by: Chun-Kuang Hu <chunkuang.hu@kernel.org>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

> ---
>   drivers/gpu/drm/mediatek/Makefile      |   1 +
>   drivers/gpu/drm/mediatek/mtk_drm_drv.c |   1 +
>   drivers/gpu/drm/mediatek/mtk_drm_drv.h |   1 +
>   drivers/gpu/drm/mediatek/mtk_ethdr.c   | 376 +++++++++++++++++++++++++
>   drivers/gpu/drm/mediatek/mtk_ethdr.h   |  23 ++
>   5 files changed, 402 insertions(+)
>   create mode 100644 drivers/gpu/drm/mediatek/mtk_ethdr.c
>   create mode 100644 drivers/gpu/drm/mediatek/mtk_ethdr.h
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
