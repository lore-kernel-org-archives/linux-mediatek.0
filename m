Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5E6DC4332F
	for <linux-mediatek@archiver.kernel.org>; Tue,  8 Nov 2022 18:27:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cAQdX1ILMh9aXeRd7w9Jd8jntvfrZSZnbFs6WkiPpO8=; b=aI+V/8gnTeVtpRzbMXTh4efafh
	3J5Y1KdpPdzj3nky3/QWc/f8AA+jo9fHaFvVGg4D8iNa5nPw6ht0Hmhb20JA4oc8p8XnJSb50F9xw
	gdAhiU6z/h1GjfZmHLlCvzuVz/IxBCzYE89ed+9XiPlHtppjtCyr1HPBkEM2dI8FlrXkI1KTZr0hh
	492TmpnOcNU42gdiDnCfHXZjjYf4k3iushgvyLMpdyLdr2S/Jotf5mD0BGiLwuMy5yQKQ0XT05kgF
	m/qXqgNie3k/aJIfKcORQqxJns142Zic4G0lbOWUJAuOhyud/7UCrf6v+/4/twFKAA1by/GwuE1f5
	poFp8tPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1osTJc-007TUh-KH; Tue, 08 Nov 2022 18:27:16 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1osTJX-007TQz-Q5; Tue, 08 Nov 2022 18:27:15 +0000
Received: by mail-wm1-x334.google.com with SMTP id c3-20020a1c3503000000b003bd21e3dd7aso12300174wma.1;
        Tue, 08 Nov 2022 10:27:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=cAQdX1ILMh9aXeRd7w9Jd8jntvfrZSZnbFs6WkiPpO8=;
        b=XlmvxCc+lyBnTAGJpAjr4RWWAW5baexaFDH+jXn8compF5Jqub8MYiRJQl14IcKygg
         PiM40PLcAwukpeIPuL7A6upDD9B/fV17HXYfKe2pbCapku4qoyJT9IhmKGMpYsM0gZhK
         ftbf0JsXiCPUl9FcE2927lMbNkl+qMrQ4u9sh+w/Oh1G90tnXjUG14zFmdkYCEPhRsdR
         xEvNe+F/lTNohVHEearplxXSLsT8bU9RG4ens9JverkqL/xNPDZuRa1silwBLqB2GJY9
         VAXgq9S4XS5viaoBvVrtNr60FpFHRr/NP2kRrCb0mo4+hTg/bvzgdUvGk6yA16vDMQnB
         q6xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=cAQdX1ILMh9aXeRd7w9Jd8jntvfrZSZnbFs6WkiPpO8=;
        b=iZ3LRM/hupG0DsovXho5VXFMKLxIcYNVdGejLtnrlGz7pLkw9yEBneqgM26wvTbwG8
         1hGI4axvR29X6g/G18+/c8UuTDmxDFAlmLMwJg0TJM40MEsCBjRjujoYpKIc73bXk+Js
         f7erBSHKWYIRFBUV/QNR6tBasdicxgT8JysoSolF71LaK9AM+KY9/MWT4JogiJpQINxo
         bY7qwc5dDlgPXXA9mDSjvNof0DioCu926iA2pMggn7GdkjqblcETWQbWckxSlC/qdIKn
         bFO7kouuYomFaYf/lebAbfnPTz4uTPXgxepWkgKDtbzNsmyjHtFb68RUAi5bbUvgLu1u
         0yNw==
X-Gm-Message-State: ACrzQf0N1hA8TeO+HY9ToN+WU6zksPtywV5hbVZl+gCVkSEO6G96iKQ7
	X1nwQzu2XbyIwx4Jy2IXhP4=
X-Google-Smtp-Source: AMsMyM7ZE2dSGreeyFtOSVNEf8QxTSoAAIhu8Fbx1MWvcj/SQe7+XTB3J/7Xjj5rqCWYXDG0uNg23A==
X-Received: by 2002:a05:600c:1ca5:b0:3cf:550f:0 with SMTP id k37-20020a05600c1ca500b003cf550f0000mr39520633wms.23.1667932027075;
        Tue, 08 Nov 2022 10:27:07 -0800 (PST)
Received: from [192.168.0.25] ([37.222.251.204])
        by smtp.gmail.com with ESMTPSA id bh23-20020a05600c3d1700b003a83ca67f73sm12464531wmb.3.2022.11.08.10.27.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Nov 2022 10:27:06 -0800 (PST)
Message-ID: <c9228b64-c786-fa24-ff96-376eacfb1816@gmail.com>
Date: Tue, 8 Nov 2022 19:27:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
Subject: Re: [PATCH v13,0/3] Add dpi output format control for MT8186
Content-Language: en-US
To: xinlei.lee@mediatek.com, rex-bc.chen@mediatek.com,
 angelogioacchino.delregno@collabora.com, jason-jh.lin@mediatek.com,
 nfraprado@collabora.com, chunkuang.hu@kernel.org, p.zabel@pengutronix.de,
 airlied@linux.ie, daniel@ffwll.ch
Cc: dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <1666577099-3859-1-git-send-email-xinlei.lee@mediatek.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <1666577099-3859-1-git-send-email-xinlei.lee@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221108_102711_957288_2A5A4446 
X-CRM114-Status: GOOD (  22.04  )
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

Hi Xinlei,

Somehow b4 broke with your thread but I was able to apply patch 1 and 2 by hand.

Thanks
Matthias

On 24/10/2022 04:04, xinlei.lee@mediatek.com wrote:
> From: Xinlei Lee <xinlei.lee@mediatek.com>
> 
> Base on the branch of linus/master v6.1 rc1.
> 
> Change since v12:
> 1. Add MT8186_ prefix to variables added in mt8186-mmsys.h file.
> 
> Change since v11:
> 1. Rebase on v6.1-rc1. Change nothing.
> 
> Change since v10:
> 1. Modify patch title and add review tag.
> 
> Change since v9:
> 1. Modify the location of the mmsys_dev member variable.
> 
> Change since v8:
> 1. Modified the title and some description information.
> 
> Changes since v7:
> 1. This series is based on the following patch:
>     [1] soc: mediatek: Add mmsys func to adapt to dpi output for MT8186
>     https://patchwork.kernel.org/project/linux-mediatek/patch/1663161662-1598-2-git-send-email-xinlei.lee@mediatek.com/
> 2. Modify the DPI_FORMAT_MASK macro definition to GENMASK(1, 0);
> 3. Add all settings to mtk_mmsys_ddp_dpi_fmt_config;
> 4. Modify the commit title to Add mt8186 dpi compatibles and platform
> data.
> 
> Changes since v6:
> 1. Different from other ICs, when mt8186 DPI changes the output format,
> the mmsys_base+400 register needs to be set to be valid at the same
> time.
>     In this series, all the situations that mmsys need to be set up are
> perfected (not necessarily used in practice).
> 2. Put the value that controls the mmsys function in mtk-mmsys.h.
> 3. Encountered the sink ic switched between dual edge and single edge,
> perfected setting and clearing mmsys bit operations in mtk_dpi.c.
> 
> Changes since v5:
> 1. Separate the patch that adds edge_cfg_in_mmsys from the patch that
> adds mt8186 dpi support.
> 2. Move the mmsys register definition to mmsys driver.
>   
> Changes since v4:
> 1. This series of cancellations is based on the following patches:
>     [1] Add MediaTek SoC(vdosys1) support for mt8195
>     https://patchwork.kernel.org/project/linux-mediatek/cover/20220711075245.10492-1-nancy.lin@mediatek.com/
>     [2] Add MediaTek SoC DRM (vdosys1) support for mt8195
>     https://patchwork.kernel.org/project/linux-mediatek/cover/20220804072827.22383-1-nancy.lin@mediatek.com/
> 2. Added mtk_mmsys_update_bits function in mtk-mmsys.c;
> 3. MMSYS 0x400 register is modified to MT8186_MMSYS_DPI_OUTPUT_FORMAT;
> 4. Fix formatting issues.
> 
> Changes since v3:
> 1. Fix formatting issues;
> 2. Modify the edge output control name & description;
> 3. Fix the threading problem.
> 
> Changes since v2:
> 1. Modify key nouns in the description;
> 2. Add the label of jitao to Co-developed-by;
> 3. Macro definition address lowercase problem and function naming;
> 4. Add missing a description of this property in the mtk_dpi_conf.
> 
> Change since v1:
> 1. Modify mt8186 compatiable location.
> 2. Modify MT8186_DPI_OUTPUT_FORMAT name.
> 
> When MT8186 outputs dpi signal, it is necessary to add dual edge output
> format control in mmsys.
> 
> Xinlei Lee (3):
>    soc: mediatek: Add all settings to mtk_mmsys_ddp_dpi_fmt_config func
>    drm: mediatek: Set dpi format in mmsys
>    drm: mediatek: Add mt8186 dpi compatibles and platform data
> 
>   drivers/gpu/drm/mediatek/mtk_dpi.c     | 32 ++++++++++++++++++++++++++
>   drivers/gpu/drm/mediatek/mtk_drm_drv.c |  2 ++
>   drivers/soc/mediatek/mt8186-mmsys.h    |  8 ++++---
>   drivers/soc/mediatek/mtk-mmsys.c       | 27 +++++++++++++++++-----
>   include/linux/soc/mediatek/mtk-mmsys.h |  7 ++++++
>   5 files changed, 67 insertions(+), 9 deletions(-)
> 

