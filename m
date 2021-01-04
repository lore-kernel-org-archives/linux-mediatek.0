Return-Path: <SRS0=ylaU=GH=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E5FBDC433E0
	for <linux-mediatek@archiver.kernel.org>; Mon,  4 Jan 2021 18:34:50 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8EE3021D94
	for <linux-mediatek@archiver.kernel.org>; Mon,  4 Jan 2021 18:34:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8EE3021D94
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:Subject:
	From:References:To:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=h0SCUqzLFVNxAaC3MR9bSSMyrrVzQj2eCNVOMMkrLUY=; b=aHRbvCtvYuFGAut+eBVJ2bNyP
	6+pVCJrmwCyPbOVP5AETtYhDuWz6U4KbfeNPrCmoAvd2BkFH8TQYVwhCE5DGwi6rahbfLkS3WWLHd
	HWVEc3berKV4gPKWx43ljYmFErMV1fAt7aOlpGMkY1J74USaE/nwzUf88FraIjdic3KJTJWgk45wx
	H7Qe19S/0C4a6S6lh8NzhBtzIg1Hu+4Hh12xudmu8bdyypuRF81g9M3EkeRHs9Y3qKV8UYCw/tF2h
	NiXLDdP74aMF5FuNG12Yu0aa9M0buiaqaTJOJ2d7wjNh/m+9X95Ufo9b2YZU4aiReZ3fmvofJSZ2H
	oMK0YtrVQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kwUgd-0007xv-4y; Mon, 04 Jan 2021 18:34:35 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kwUgY-0007vi-FR
 for linux-mediatek@lists.infradead.org; Mon, 04 Jan 2021 18:34:31 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 190so178272wmz.0
 for <linux-mediatek@lists.infradead.org>; Mon, 04 Jan 2021 10:34:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=to:cc:references:from:subject:message-id:date:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=b3mdNXCCr+viQUHC/DPnqNgJo78Ga5nEbT7QXKoyiHA=;
 b=mJcGrH+CF7e3JLUi/6XdtHgMYZ05xDT4uKvH8qP6GKld3KbbCxzzrTReJoHQX0RRos
 z6he8w1AD7bgKoP7w1Ou9GEfIcM0qI50PfzdklX1exifUgOoJxcl+my40jj0NFyHuRr+
 eOO+6Ct4bbkEaXnW34IgnPcRJt2lDp+vcPG9v04pIcmIVVRHd4V37jm/5+e/LruGkdDs
 DbnUK+4AvSXaTxqpQm9HTsNR7FcIOn/uAKi+rnqPum2lVyXnZx1liZpKrLuYc5I9QCUZ
 vBCczjPJT8huRzKIvQC6Imx/iPGtTS7Z2tvxDigfcl0bbjGHA39H3hqnTJTf3Pm36iK1
 2cpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:to:cc:references:from:subject:message-id:date
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=b3mdNXCCr+viQUHC/DPnqNgJo78Ga5nEbT7QXKoyiHA=;
 b=Lf3HJ3ufQzlURLwhi6+6ho+EMEA9+bDJKThwtrd4HLUZSpu8AoZq+tUHD5JefAbDr6
 u23x5mOHiD95YdIRZPd9+Zv/XK8YoHGCvnD9OJJBQnUNxEzO2TEobnw2JwZmP+VjOTjj
 vf3s7ZRT+Ex8SqeO5AHFKQr4xZ0M9ROTtHs0wO9DSxPGpVP1/HVTvBspDn+jE8ZCVr0t
 GaC5PgiYMHJklimAfgtJQxWyR6wt4QakM6DwSF0cryu/DPrG3hwyUY5wHUYP1P2qL2rR
 7wW/2FZcjoOM/ID/R+yKxF+osvCXDS1iOkQDcp13CiA/fgANBIxg8vPD9jYaTFr2ieXz
 K2aQ==
X-Gm-Message-State: AOAM5312nwU95o2piYNpJwSmpHlLYsyp9p/VJwcJui3Zvy/mhjug5X48
 l6F7YB3VYbYRlE3D5H6WBhFB9Q==
X-Google-Smtp-Source: ABdhPJwJYzGSd/ZPw+WDOq9k3YHFJGpNwRYCt7btmT6zdcFteWIZPoxAoFgw/VGVvxy40x8V6O0Sdg==
X-Received: by 2002:a1c:6144:: with SMTP id v65mr164151wmb.125.1609785269279; 
 Mon, 04 Jan 2021 10:34:29 -0800 (PST)
Received: from [10.44.66.8] ([212.45.67.2])
 by smtp.googlemail.com with ESMTPSA id g78sm245217wme.33.2021.01.04.10.34.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 04 Jan 2021 10:34:28 -0800 (PST)
To: Henry Chen <henryc.chen@mediatek.com>, Rob Herring <robh+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Stephen Boyd
 <swboyd@chromium.org>, Ryan Case <ryandcase@chromium.org>,
 Mark Brown <broonie@kernel.org>
References: <1608790134-27425-1-git-send-email-henryc.chen@mediatek.com>
 <1608790134-27425-8-git-send-email-henryc.chen@mediatek.com>
From: Georgi Djakov <georgi.djakov@linaro.org>
Subject: Re: [PATCH V6 07/13] dt-bindings: interconnect: add MT6873
 interconnect dt-bindings
Message-ID: <f8951237-e236-aa99-5dbb-e92415752aa8@linaro.org>
Date: Mon, 4 Jan 2021 20:34:30 +0200
MIME-Version: 1.0
In-Reply-To: <1608790134-27425-8-git-send-email-henryc.chen@mediatek.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210104_133430_663012_0E57FB9E 
X-CRM114-Status: GOOD (  14.09  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: Mark Rutland <mark.rutland@arm.com>, Nicolas Boichat <drinkcat@google.com>,
 devicetree@vger.kernel.org, linux-pm@vger.kernel.org,
 linux-kernel@vger.kernel.org, Fan Chen <fan.chen@mediatek.com>,
 linux-mediatek@lists.infradead.org, Arvin Wang <arvin.wang@mediatek.com>,
 James Liao <jamesjj.liao@mediatek.com>, linux-arm-kernel@lists.infradead.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On 12/24/20 08:08, Henry Chen wrote:
> From: "henryc.chen" <henryc.chen@mediatek.com>
> 
> Add interconnect provider dt-bindings for MT6873.
> 
> Signed-off-by: Henry Chen <henryc.chen@mediatek.com>

checkpatch complains:

From:/Signed-off-by: email name mismatch:
'From: "henryc.chen" <henryc.chen@mediatek.com>' != 'Signed-off-by: Henry Chen 
<henryc.chen@mediatek.com>'

Thanks,
Georgi

> ---
>   include/dt-bindings/interconnect/mtk,mt6873-emi.h | 41 +++++++++++++++++++++++
>   1 file changed, 41 insertions(+)
>   create mode 100644 include/dt-bindings/interconnect/mtk,mt6873-emi.h
> 
> diff --git a/include/dt-bindings/interconnect/mtk,mt6873-emi.h b/include/dt-bindings/interconnect/mtk,mt6873-emi.h
> new file mode 100644
> index 0000000..7a0bbfb
> --- /dev/null
> +++ b/include/dt-bindings/interconnect/mtk,mt6873-emi.h
> @@ -0,0 +1,41 @@
> +/* SPDX-License-Identifier: GPL-2.0
> + *
> + * Copyright (c) 2020 MediaTek Inc.
> + */
> +
> +#ifndef __DT_BINDINGS_INTERCONNECT_MTK_MT6873_EMI_H
> +#define __DT_BINDINGS_INTERCONNECT_MTK_MT6873_EMI_H
> +
> +#define MT6873_SLAVE_DDR_EMI		0
> +#define MT6873_MASTER_MCUSYS		1
> +#define MT6873_MASTER_GPUSYS		2
> +#define MT6873_MASTER_MMSYS		3
> +#define MT6873_MASTER_MM_VPU		4
> +#define MT6873_MASTER_MM_DISP		5
> +#define MT6873_MASTER_MM_VDEC		6
> +#define MT6873_MASTER_MM_VENC		7
> +#define MT6873_MASTER_MM_CAM		8
> +#define MT6873_MASTER_MM_IMG		9
> +#define MT6873_MASTER_MM_MDP		10
> +#define MT6873_MASTER_VPUSYS		11
> +#define MT6873_MASTER_VPU_0		12
> +#define MT6873_MASTER_VPU_1		13
> +#define MT6873_MASTER_MDLASYS		14
> +#define MT6873_MASTER_MDLA_0		15
> +#define MT6873_MASTER_UFS		16
> +#define MT6873_MASTER_PCIE		17
> +#define MT6873_MASTER_USB		18
> +#define MT6873_MASTER_DBGIF		19
> +#define MT6873_SLAVE_HRT_DDR_EMI	20
> +#define MT6873_MASTER_HRT_MMSYS		21
> +#define MT6873_MASTER_HRT_MM_DISP	22
> +#define MT6873_MASTER_HRT_MM_VDEC	23
> +#define MT6873_MASTER_HRT_MM_VENC	24
> +#define MT6873_MASTER_HRT_MM_CAM	25
> +#define MT6873_MASTER_HRT_MM_IMG	26
> +#define MT6873_MASTER_HRT_MM_MDP	27
> +#define MT6873_MASTER_HRT_DBGIF		28
> +#define MT6873_MASTER_WIFI		29
> +#define MT6873_MASTER_BT		30
> +#define MT6873_MASTER_NETSYS		31
> +#endif
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
