Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C546CC00140
	for <linux-mediatek@archiver.kernel.org>; Tue,  2 Aug 2022 08:08:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HsSHGNI5OACJwEWXjbDzjjqUsgJ2e/s83LTa6i8r0GI=; b=cuglTWxSqJtvN/ikHNK0DNuGpa
	iMMJopwxCLIAa3tMczsY6aS3XzAGqewX3E+0KMEe4eTVCTnwi5xsnuXa2FCmi65pJbnG4cXMWxpq5
	DmIyJT9Be3ux4EVC1suiU86F1j2S4JvP61yoYtRZwiKiY75wtbghV+FRhunu37R4n+AYOpOh2qSlZ
	yO/HdIZeCEYsV/ThCbsfZ//5e2ahU95rO8js5CnciMXa1Dz1MUHIeVuLRo8zPoBgqeCaCDYTL0lcY
	LUxuFwM5l+h6c1QLPBjgvbGWZRTo1hiuXNEhKkyzRTpYzqVexJ1e+WQgwc0z9kcB5DVcDi32z6LMu
	CvFYqsbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oImxH-00BgK9-MR; Tue, 02 Aug 2022 08:08:43 +0000
Received: from mail-lf1-x136.google.com ([2a00:1450:4864:20::136])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oImx5-00BgAS-58
	for linux-mediatek@lists.infradead.org; Tue, 02 Aug 2022 08:08:33 +0000
Received: by mail-lf1-x136.google.com with SMTP id bq11so15740323lfb.5
        for <linux-mediatek@lists.infradead.org>; Tue, 02 Aug 2022 01:08:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=HsSHGNI5OACJwEWXjbDzjjqUsgJ2e/s83LTa6i8r0GI=;
        b=x9+2qf4ZdKgMTZvBEcj6p1uz8yxPF/KbiP41BT7UBm02nqoaQcV08jWKe5qCE5a4K9
         iRJ5Hx81rBXLs+eFmpXM02R8pj7Qi5ER5uGEzFauqq8zbP5hI/jNqXErDS2fDjRL3ELA
         QdJuzdGI0AFGk7ylTyPLFuYEjpV86+tZ82bjBTnaAWNeUUTPJJDeDSJ41K6C9ejCkaSZ
         JWp3D+OdgZTQki8hyYRZSyyEpbanEwNIHYq2WjRtFa6bUJfeQkaLu3Krk9AACkRYFuoh
         3HpZ9ksUHPAn8tEWjWh4V0lcJ+ivfWefHK9lslCDHJb3wrGIADIufBGDDIQEMeK4etVO
         GLlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=HsSHGNI5OACJwEWXjbDzjjqUsgJ2e/s83LTa6i8r0GI=;
        b=zlQTbxdJkc8nLgWytliGHi4Zl+vWGsFo7Q3la/AJnBs6AkeXvspxUtd3C0TYwPXX5j
         /lbQILBIOYkSI0gDNALYDcrylRp3cbSPnfHC+PAZqsyfSWH1B8I+UZlU/sUlYkNtnO+0
         qkyo1Bs6Yf29xZ7CWORp/L2++MVR/rrsnEZ9Y7smXoOcsUKSpgqrz4CaDPYOuLyZqduf
         dJKPJGqOFtTXvYwfh4nnqJ9VeOTf/SZfDVt362Li/dqaYIwCzEIERVt/k96+6/Rh69mi
         ITpL3avdq8XNef/SdgmfPu/ReuM7/SZlAhpE/4460BjlHxCbbWGcFFAWNiIBIjd9UKQO
         FaEg==
X-Gm-Message-State: ACgBeo0d6m91v5yaQTSqsDSvpF3EpzZwPfc1Yz3g+huorromdJM/pqDq
	HgxodQlMfv6AH3DBFlALNWV/ZQ==
X-Google-Smtp-Source: AA6agR6fhg7bVDtnj6MaImLAqneEW0TB3bldN3JTZEOELsJkGM35fAWCQzptDK4wcs1ivPOsQuqJbg==
X-Received: by 2002:a05:6512:3609:b0:48a:ef9f:9465 with SMTP id f9-20020a056512360900b0048aef9f9465mr4871576lfs.115.1659427705492;
        Tue, 02 Aug 2022 01:08:25 -0700 (PDT)
Received: from [192.168.1.6] ([213.161.169.44])
        by smtp.gmail.com with ESMTPSA id f16-20020a056512361000b0048af4dc964asm894454lfs.73.2022.08.02.01.08.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 02 Aug 2022 01:08:25 -0700 (PDT)
Message-ID: <995fbb2b-2b34-d407-6bfd-4798de2251d7@linaro.org>
Date: Tue, 2 Aug 2022 10:08:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH 2/2] dt-bindings: gce: add gce header file for mt8188
Content-Language: en-US
To: Elvis Wang <Elvis.Wang@mediatek.com>,
 Jassi Brar <jassisinghbrar@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, CK Hu <ck.hu@mediatek.com>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20220729084319.6880-1-Elvis.Wang@mediatek.com>
 <20220729084319.6880-3-Elvis.Wang@mediatek.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220729084319.6880-3-Elvis.Wang@mediatek.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220802_010831_209945_012114EE 
X-CRM114-Status: GOOD (  17.38  )
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

On 29/07/2022 10:43, Elvis Wang wrote:
> Add gce header file to define the gce subsys id, hardware event id and
> constant for mt8188.
> 
> Signed-off-by: Elvis Wang <Elvis.Wang@mediatek.com>
> ---
>  include/dt-bindings/gce/mt8188-gce.h | 1079 ++++++++++++++++++++++++++
>  1 file changed, 1079 insertions(+)
>  create mode 100644 include/dt-bindings/gce/mt8188-gce.h
> 
> diff --git a/include/dt-bindings/gce/mt8188-gce.h b/include/dt-bindings/gce/mt8188-gce.h
> new file mode 100644
> index 000000000000..b15e965fe671
> --- /dev/null
> +++ b/include/dt-bindings/gce/mt8188-gce.h

Use vendor in filename, so mediatek,mt8188-gce.h

> @@ -0,0 +1,1079 @@
> +/* SPDX-License-Identifier: GPL-2.0 */

Dual license.

> +/*
> + * Copyright (c) 2018 MediaTek Inc.
> + *
> + */
> +#ifndef _DT_BINDINGS_GCE_MT8188_H
> +#define _DT_BINDINGS_GCE_MT8188_H
> +
> +/* assign timeout 0 also means default */
> +#define CMDQ_NO_TIMEOUT		0xffffffff
> +#define CMDQ_TIMEOUT_DEFAULT	1000

How CMDQ_TIMEOUT_DEFAULT is part of bindings? How is it related to bindings?

> +
> +/* GCE thread priority */
> +#define CMDQ_THR_PRIO_LOWEST	0
> +#define CMDQ_THR_PRIO_1		1
> +#define CMDQ_THR_PRIO_2		2
> +#define CMDQ_THR_PRIO_3		3
> +#define CMDQ_THR_PRIO_4		4
> +#define CMDQ_THR_PRIO_5		5
> +#define CMDQ_THR_PRIO_6		6
> +#define CMDQ_THR_PRIO_HIGHEST	7
> +
> +/* CPR count in 32bit register */
> +#define GCE_CPR_COUNT		1312

No register values in the bindings.



> +
> +/* GCE subsys table */
> +#define SUBSYS_1400XXXX		0
> +#define SUBSYS_1401XXXX		1
> +#define SUBSYS_1402XXXX		2
> +#define SUBSYS_1c00XXXX		3
> +#define SUBSYS_1c01XXXX		4
> +#define SUBSYS_1c02XXXX		5
> +#define SUBSYS_1c10XXXX		6
> +#define SUBSYS_1c11XXXX		7
> +#define SUBSYS_1c12XXXX		8
> +#define SUBSYS_14f0XXXX		9
> +#define SUBSYS_14f1XXXX		10
> +#define SUBSYS_14f2XXXX		11
> +#define SUBSYS_1800XXXX		12
> +#define SUBSYS_1801XXXX		13
> +#define SUBSYS_1802XXXX		14
> +#define SUBSYS_1803XXXX		15
> +#define SUBSYS_1032XXXX		16
> +#define SUBSYS_1033XXXX		17
> +#define SUBSYS_1600XXXX		18
> +#define SUBSYS_1601XXXX		19
> +#define SUBSYS_14e0XXXX		20
> +#define SUBSYS_1c20XXXX		21
> +#define SUBSYS_1c30XXXX		22
> +#define SUBSYS_1c40XXXX		23
> +#define SUBSYS_1c50XXXX		24
> +#define SUBSYS_1c60XXXX		25
> +#define SUBSYS_NO_SUPPORT	99
> +
> +/* GCE General Purpose Register (GPR) support
> + * Leave note for scenario usage here
> + */
> +/* GCE: write mask */
> +#define GCE_GPR_R00		0x00
> +#define GCE_GPR_R01		0x01

No. These are no bindings. Do not embed device programming model into
bindings header. I'll stop review.


Best regards,
Krzysztof

