Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E2D3C433EF
	for <linux-mediatek@archiver.kernel.org>; Fri, 25 Feb 2022 16:37:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=u9Uj03vpINsO5PoxEYyF5Ep5JxAU9m6jgBv+m3c0FNs=; b=S9pbq9/el0XBdE
	efoge9mLceNDzLXp02aAD51tTQEDgZ93MgaqnqwDb3vbJtPwd1M4xIPrEuLeKSbLv6nlCtqegjXF5
	x9wul0IGsC8aea/jqXK4lep8J3v2DfWMQun+T43xYAnxIqcbhyteTIv3fMfqrY4uQG63Vo4fB6HqG
	SC00aExGulMXvF9xOowi1NW+8CGqiDAmqAk699+x+MfL57YYEPZGBINitrepfE/UKpv+oMiSBsJ8O
	cWd9mHAkPCQo3A8BTQPnUeBFtWN3EKbENaulwaYLT9g5RDasis0IxYIYvEsOGSd/M2UVIMi9/xtbl
	HwJ5haCkv/7ZCvt+UPJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nNdbI-005xq9-5C; Fri, 25 Feb 2022 16:37:48 +0000
Received: from mail-oo1-xc2f.google.com ([2607:f8b0:4864:20::c2f])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nNdaq-005xeg-99; Fri, 25 Feb 2022 16:37:21 +0000
Received: by mail-oo1-xc2f.google.com with SMTP id
 x6-20020a4a4106000000b003193022319cso6923332ooa.4; 
 Fri, 25 Feb 2022 08:37:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=+CnsTOnDIJmDrNcQ9nVz49RWIRwJjG5a52upp/7BFmQ=;
 b=H4CGbDmty7EZw/ad487z4dM+dubS0VP05GzroPoY/FEPfOW3uYU2f0pcTJNNFiauDe
 Vm+X6sxubeSPnWOpPstKfOPKnOi0EnIoQE706y9/DgNMy1dZAuCqc2NURCnjk+wvG9pM
 qCBPDJJWMkthBekfl49oocDu23Fqayp8+sikC+duVIXhetO1X+vimcuUJPMfQFWQ88HB
 HTLprGxRhDlLcTQg69gOtzg9V/lbdmdXfCkEAaZGt9nQ64ZeIczg6OJ8uaYF2z6Uaqve
 3ky3t2DCHhxNKlm+utiTLxT8BKd8A0p3SJ3NLCYJ1SIPD6qYJKOpLJIZ2xg8yVVRxW35
 /ZSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=+CnsTOnDIJmDrNcQ9nVz49RWIRwJjG5a52upp/7BFmQ=;
 b=Hu0Kr0xSnidkYVuw5uvkySem2hLOoBBM/E1vloT2GlemKzulRy0ymnQr5iK++ZnPVq
 ix0KJUqSnRfu0pAyKCOn/WFLeucSLYHvlhX4RO+8F821g4LIbSVHrpzlb5d1ZLzuz/IE
 BsSsGwf3bFuitQP36BAS7rhL9PPhcA82JTq8WlWmmS7HQeJ1Fe+NHHqRGnASQNrbFKIL
 mnf27uAnP4OLiYvKfeuf9yS5ril2AOQkqKhhQPd0LuJSt31winV9CWjuanuL2tBXInO8
 mZ3bwbbYOAJQzU/q1da6Q+m+vocSxDLfaPRlQCJ3b2yBSRGhdYcWc2ppc+BJgzW/HpZR
 hSGw==
X-Gm-Message-State: AOAM530FR19ngJ49xXKBVmQLn1FDugs7yNV7mBNNSzlCMFVbjGaA0PCm
 HlYTfEgvEEwe8OHHq9OC8i4=
X-Google-Smtp-Source: ABdhPJzZYQI8AhCr2LAlApfBhaQyy3zwuH9AFQj6H1d1talFInZKbk7s4QTyhYD7Ul8eRS2Sx77rOg==
X-Received: by 2002:a05:6870:c5a3:b0:d4:5e07:6e5c with SMTP id
 ba35-20020a056870c5a300b000d45e076e5cmr1650631oab.191.1645807038960; 
 Fri, 25 Feb 2022 08:37:18 -0800 (PST)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c?
 ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id
 t82-20020a4a3e55000000b0031847b47aaasm1312835oot.26.2022.02.25.08.37.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 25 Feb 2022 08:37:18 -0800 (PST)
Message-ID: <b30fed61-9ed4-3ba2-0370-b0007a80d8e9@roeck-us.net>
Date: Fri, 25 Feb 2022 08:37:16 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [2/4] dt-bindings: reset: mt8186: add toprgu reset-controller
 header file
Content-Language: en-US
To: Rex-BC Chen <rex-bc.chen@mediatek.com>, wim@linux-watchdog.org,
 matthias.bgg@gmail.com, robh+dt@kernel.org, p.zabel@pengutronix.de
Cc: runyang.chen@mediatek.com, linux-watchdog@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20220216014505.28428-1-rex-bc.chen@mediatek.com>
 <20220216014505.28428-3-rex-bc.chen@mediatek.com>
From: Guenter Roeck <linux@roeck-us.net>
In-Reply-To: <20220216014505.28428-3-rex-bc.chen@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220225_083720_398029_0ACA5C64 
X-CRM114-Status: GOOD (  13.92  )
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

On 2/15/22 17:45, Rex-BC Chen wrote:
> From: Runyang Chen <runyang.chen@mediatek.com>
> 
> Add toprgu reset-controller header file for MT8186.
> 
> Signed-off-by: Runyang Chen <runyang.chen@mediatek.com>
> Signed-off-by: Rex-BC Chen <rex-bc.chen@mediatek.com>

With the next patch squashed into this one:

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

> ---
>   include/dt-bindings/reset/mt8186-resets.h | 33 +++++++++++++++++++++++
>   1 file changed, 33 insertions(+)
>   create mode 100644 include/dt-bindings/reset/mt8186-resets.h
> 
> diff --git a/include/dt-bindings/reset/mt8186-resets.h b/include/dt-bindings/reset/mt8186-resets.h
> new file mode 100644
> index 000000000000..36e5764e2e6c
> --- /dev/null
> +++ b/include/dt-bindings/reset/mt8186-resets.h
> @@ -0,0 +1,33 @@
> +/* SPDX-License-Identifier: (GPL-2.0+ OR BSD-3-Clause) */
> +/*
> + * Copyright (c) 2022 MediaTek Inc.
> + * Author: Runyang Chen <runyang.chen@mediatek.com>
> + */
> +
> +#ifndef _DT_BINDINGS_RESET_CONTROLLER_MT8186
> +#define _DT_BINDINGS_RESET_CONTROLLER_MT8186
> +
> +#define MT8186_TOPRGU_INFRA_SW_RST				0
> +#define MT8186_TOPRGU_MM_SW_RST					1
> +#define MT8186_TOPRGU_MFG_SW_RST				2
> +#define MT8186_TOPRGU_VENC_SW_RST				3
> +#define MT8186_TOPRGU_VDEC_SW_RST				4
> +#define MT8186_TOPRGU_IMG_SW_RST				5
> +#define MT8186_TOPRGU_DDR_SW_RST				6
> +#define MT8186_TOPRGU_INFRA_AO_SW_RST				8
> +#define MT8186_TOPRGU_CONNSYS_SW_RST				9
> +#define MT8186_TOPRGU_APMIXED_SW_RST				10
> +#define MT8186_TOPRGU_PWRAP_SW_RST				11
> +#define MT8186_TOPRGU_CONN_MCU_SW_RST				12
> +#define MT8186_TOPRGU_IPNNA_SW_RST				13
> +#define MT8186_TOPRGU_WPE_SW_RST				14
> +#define MT8186_TOPRGU_ADSP_SW_RST				15
> +#define MT8186_TOPRGU_AUDIO_SW_RST				17
> +#define MT8186_TOPRGU_CAM_MAIN_SW_RST				18
> +#define MT8186_TOPRGU_CAM_RAWA_SW_RST				19
> +#define MT8186_TOPRGU_CAM_RAWB_SW_RST				20
> +#define MT8186_TOPRGU_IPE_SW_RST				21
> +#define MT8186_TOPRGU_IMG2_SW_RST				22
> +#define MT8186_TOPRGU_SW_RST_NUM				23
> +
> +#endif  /* _DT_BINDINGS_RESET_CONTROLLER_MT8186 */


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
