Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97145C4332F
	for <linux-mediatek@archiver.kernel.org>; Fri, 16 Dec 2022 12:39:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1C1t7Qhw/4Y/cukYlXL7QXYS7VSdfs0nLzx2PMLsJKc=; b=KadnXbP+6ySoTv2c+7zI9I/B5p
	vcD92lC4WBf6bimk78RbdnwTqOvh11jrEI5PlYKn5aDxU94J+9QxYOWA5+DmvdysQFFU/mMpcT6lc
	wwlAa8Cy51FscKPQAHAQGP8Y8sUo0KKeJuyGAKGXsbP4dVzQIjxTHoS5Km87/4t8ybxmLsRDnLGeP
	GxGqL/jhnDBWujuhauYln/JBI7co5J8j4e7tQfiPyZ7N47+IeBagdzKp6MEXTo+2otR4RRB4UqcT+
	N8OzLJHaHD0+z5G9GY38hklkN4bUhSttsU+Iq/D7sHoViJRew8rMRlekeyDIypadcKYyzKrcu0GUq
	ps/P8PNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p69zp-00EyC8-TE; Fri, 16 Dec 2022 12:39:25 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p69zm-00Ey2r-Tf; Fri, 16 Dec 2022 12:39:24 +0000
Received: by mail-wr1-x42a.google.com with SMTP id h12so2331877wrv.10;
        Fri, 16 Dec 2022 04:39:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1C1t7Qhw/4Y/cukYlXL7QXYS7VSdfs0nLzx2PMLsJKc=;
        b=FWlOPhXmYQIcPI01pZmsrS90gM78wa1c7zAhnU7K4ckWoyxWCz/PG2DUXkon6ww3Dk
         Njwe/v/XAIX18vJuwZxeJT0OOXe4gVS5e8ZcL1HHSBktsBO+AloCjabNe1RE3liQnx9S
         FTOmIGO5MV8tlwtU9ZnP/u5teQbNvAs9Jk0Q7wvworT+0vLCs6NeG93Uj8UBuZGO+Vg4
         F6NawSUF2FTrO8DGv7xyjRnMZqnE33rCTzdcX3KCc7Mv7gP1ljwMuHQCC6OyDzJy5WnK
         RrBs1AI2D9B5uLMdeCEzRvVJ54q9CR53BWEmERsonL4C2kqB/IpSmK1prrWDD0MrGH7D
         FNCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1C1t7Qhw/4Y/cukYlXL7QXYS7VSdfs0nLzx2PMLsJKc=;
        b=3LjvJssI9B365H1+D02OblbWixFJv4PvEx7/YJVMPi9V5pP1AjZLEeMc21ZjxDx4ja
         b/E+w2u1+UQoxhd2KR/F26BSeO6NyaV9C3Ym314mSMvilqetYku/ywalepcl8XCh3E7c
         dEQ71x2m8f424dhXUA/yxVxGvQfJ3Q988C2ifXuVAEEYuANzzuVDODwX+IJYBPa5hhVd
         BHThGwyPjzQE4fWBYqq5dMCiVUpKT3xtQwLq0U+nBWXwsm8O0rugT3Gb5LbcVR3z86Sy
         VtY/cY63W9FnfUzyY8ljHThOe/zYLls+8w0685EjzitTYyj9W2iiAcfSJgaSUbLjL2gA
         ToUQ==
X-Gm-Message-State: ANoB5pl66pjwpLKUechfmyQLvNzwkaTSvJqSECK/4zeE3Ic2VSnknjIn
	ilCT0rpEJMbXEbkS9weXY9g=
X-Google-Smtp-Source: AA0mqf4pMaLKkzaoevxB+rOSsPa++2dY506eWmzPr35JFyeRLluIAvbS+LVqLNgYdPE8mCAYon0LPg==
X-Received: by 2002:adf:de06:0:b0:242:1277:925b with SMTP id b6-20020adfde06000000b002421277925bmr20332500wrm.59.1671194358648;
        Fri, 16 Dec 2022 04:39:18 -0800 (PST)
Received: from [192.168.1.132] ([207.188.167.132])
        by smtp.gmail.com with ESMTPSA id m2-20020a5d4a02000000b0022ae0965a8asm2193502wrq.24.2022.12.16.04.39.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 Dec 2022 04:39:17 -0800 (PST)
Message-ID: <83aee145-17dc-45fe-dde5-324602dde0f9@gmail.com>
Date: Fri, 16 Dec 2022 13:39:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH v4 0/6] Add first version mt8188 vdosys0 driver
Content-Language: en-US
To: "nathan.lu" <nathan.lu@mediatek.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: "jason-jh . lin" <jason-jh.lin@mediatek.com>, CK Hu <ck.hu@mediatek.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Rex-BC Chen <rex-bc.chen@mediatek.com>, Moudy Ho <moudy.ho@mediatek.com>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, lancelot.wu@mediatek.com,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20221206020046.11333-1-nathan.lu@mediatek.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <20221206020046.11333-1-nathan.lu@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221216_043923_050282_A837A61C 
X-CRM114-Status: GOOD (  16.07  )
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

Applied patches 2,3,4,5
The rest will go through the DRM driver tree.

Thanks!

On 06/12/2022 03:00, nathan.lu wrote:
> From: Nathan Lu <nathan.lu@mediatek.com>
> 
> This patch is to add first version mt8188 vdosys0 driver
> Modify and add new files include:
> 1. bindings documents
> 2. mtk mmsys
> 3. mtk mutex
> 4. mtk drm driver
> 
> Change in V4:
> - based on [1]
> [1] Change mmsys compatible for mt8195 mediatek-drm
>      - https://patchwork.kernel.org/project/linux-mediatek/list/?series=699386
> - Modify mediatek,mmsys.yaml, move mt8188-vdosys0 to ****mmsys
> - Modify mt8188_mmsysy.h DSI mux setting
> 
> Change in V3:
> - based on [1]
> [1] Change mmsys compatible for mt8195 mediatek-drm
>      - https://patchwork.kernel.org/project/linux-mediatek/list/?series=699386
> - Modify mediatek,mmsys.yaml mt8188-mmsys name to mt8188-vdosys0
> - Modify mtk-mmsys.c compatible name to mt8188-vdosys0
> - Add DSI mutex in mtk-mutex.c
> - Modify mtk_drm_drv.c mt8188-mmsysy name to mt8188-vdosys0
> 
> 
> Change in V2:
> - based on [2] and [3]
> [2] Add MediaTek SoC(vdosys1) support for mt8195
>      - https://patchwork.kernel.org/project/linux-mediatek/list/?series=658416
> [3] Add MediaTek SoC DRM (vdosys1) support for mt8195
>      - https://patchwork.kernel.org/project/linux-mediatek/list/?series=665269
> - Seperate bindings doucment into mmsys/mutex/display 3 parts
> - Remove redundent char in mediatek,gamma.yaml
> - Add another mediatek,mt8188-disp-rdma in mediatek,rdma.yaml
> - Remove io_start variable setting in mtk_drm_drv.c and mtk_mmsys.c
> 
> Nathan Lu (6):
>    dt-bindings: mediatek: modify VDOSYS0 display device tree
>      Documentations for MT8188
>    dt-bindings: mediatek: modify VDOSYS0 mmsys device tree Documentations
>      for MT8188
>    dt-bindings: mediatek: modify VDOSYS0 mutex device tree Documentations
>      for MT8188
>    soc: mediatek: add mtk-mmsys support for mt8188 vdosys0
>    soc: mediatek: add mtk-mutex support for mt8188 vdosys0
>    drm/mediatek: add mediatek-drm of vdosys0 support for mt8188
> 
>   .../bindings/arm/mediatek/mediatek,mmsys.yaml |   1 +
>   .../display/mediatek/mediatek,aal.yaml        |   1 +
>   .../display/mediatek/mediatek,ccorr.yaml      |   1 +
>   .../display/mediatek/mediatek,color.yaml      |   1 +
>   .../display/mediatek/mediatek,dither.yaml     |   1 +
>   .../display/mediatek/mediatek,gamma.yaml      |   1 +
>   .../display/mediatek/mediatek,ovl.yaml        |   1 +
>   .../display/mediatek/mediatek,postmask.yaml   |   1 +
>   .../display/mediatek/mediatek,rdma.yaml       |   4 +
>   .../bindings/soc/mediatek/mediatek,mutex.yaml |   1 +
>   drivers/gpu/drm/mediatek/mtk_drm_drv.c        |  21 +++
>   drivers/soc/mediatek/mt8188-mmsys.h           | 149 ++++++++++++++++++
>   drivers/soc/mediatek/mtk-mmsys.c              |  11 ++
>   drivers/soc/mediatek/mtk-mutex.c              |  53 +++++++
>   14 files changed, 247 insertions(+)
>   create mode 100644 drivers/soc/mediatek/mt8188-mmsys.h
> 

