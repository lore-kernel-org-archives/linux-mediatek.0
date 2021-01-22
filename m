Return-Path: <SRS0=vrrm=GZ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 984CEC433DB
	for <linux-mediatek@archiver.kernel.org>; Fri, 22 Jan 2021 21:34:50 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4615923B06
	for <linux-mediatek@archiver.kernel.org>; Fri, 22 Jan 2021 21:34:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4615923B06
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=hXPSMwVQrtvFsYrKPoLOkVkJA3GIwnxWe0pinLZ4oFE=; b=WnHDsrf2aeCM+TUgX8GcuIvHx
	NNz3ysVj1vORq21WCw57ytjoB9MN8gGL52PPHAAN25LPJdlit5Ey499v6EfSg9hfUZo0dvIS7HfYf
	T0U5oCqUg9vgn+A1tRbhyI+qG4rCcNhUbKEMLFSWcvlc0MAfIdjyngmTPt5rb6UnHjb8B+5BhP04h
	jfJnpxlFYEgIcaeh1r7+QnZGRAqUPeAniPQ/jddSHDRMVBp+BlCmv8lghK6iM3mM49rfD0RbXb5T0
	cPUHwTp9dHw2MAmyI5WXkvfHsX8Rln5c4R6jcI4xMXzBYDRHiXYP49eJydj/H0ycY+CIYnz2KVxD7
	A77HyAEtw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l344f-0004nT-Tj; Fri, 22 Jan 2021 21:34:34 +0000
Received: from mail-ej1-f51.google.com ([209.85.218.51])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l344d-0004mq-9M; Fri, 22 Jan 2021 21:34:32 +0000
Received: by mail-ej1-f51.google.com with SMTP id by1so9737383ejc.0;
 Fri, 22 Jan 2021 13:34:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=UUV29RpxjVNGedVCZG35UzFCrYjLETYa/Rl1PkWj6Ks=;
 b=Y78GZp/n8lEmSeSik5qkk5QzkFb/M8c+hbFk/fVRcjZ1g4A8+rDr8R6FtlpJ1dGgn+
 sdVplBUj18vN0k5tSj2aeNSD4pwakWMvJV/hs8OUJRJjKjfx5VrPzAMmJvFkL1Flch74
 tP6Sk87pzEgmVZfkdsw/L46fy4FdwJ3fXEKNW1vvp49AaPsp9PSIFF/avG+FhALDpKBH
 +bNS73r5jzi6U744rLNuZTxjssW7fdn4CV2GVhNtHfsBZvc4dwmszN8w9svsenTh0AmO
 BqWKHIUXAe0MPm7490QSvDSJH52VV/Zg7n+3C15xaUOel+hZodc+M2/EmBvL9BMWAFNj
 EhoA==
X-Gm-Message-State: AOAM533FKwHHhwp1MTKELTpwNzrpJl74r/xgA6964xLbMGERQj119sHX
 04DiPpGOrJe2Ybb8zx9wmnw=
X-Google-Smtp-Source: ABdhPJxHt80Jvb/lOspEpWGHk4RR9X1vDlMGLNUVWPiSLSr9iaYR9oS1vVzvVNzhfl428fLAzdYDOQ==
X-Received: by 2002:a17:907:932:: with SMTP id
 au18mr4214890ejc.91.1611351269791; 
 Fri, 22 Jan 2021 13:34:29 -0800 (PST)
Received: from kozik-lap (adsl-84-226-167-205.adslplus.ch. [84.226.167.205])
 by smtp.googlemail.com with ESMTPSA id i15sm5321214ejj.28.2021.01.22.13.34.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Jan 2021 13:34:28 -0800 (PST)
Date: Fri, 22 Jan 2021 22:34:27 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Yong Wu <yong.wu@mediatek.com>
Subject: Re: [PATCH 2/3] memory: mtk-smi: Add module_exit and module_license
Message-ID: <20210122213427.mwjyjn2wsgnko7mk@kozik-lap>
References: <20210121062429.26504-1-yong.wu@mediatek.com>
 <20210121062429.26504-3-yong.wu@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210121062429.26504-3-yong.wu@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210122_163431_340748_EDF90891 
X-CRM114-Status: GOOD (  19.13  )
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
Cc: youlin.pei@mediatek.com, anan.sun@mediatek.com,
 Nicolas Boichat <drinkcat@chromium.org>, srv_heupstream@mediatek.com,
 Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>,
 linux-kernel@vger.kernel.org, yi.kuo@mediatek.com,
 Tomasz Figa <tfiga@google.com>, iommu@lists.linux-foundation.org,
 linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>,
 Will Deacon <will@kernel.org>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Thu, Jan 21, 2021 at 02:24:28PM +0800, Yong Wu wrote:
> The config MTK_SMI always depends on MTK_IOMMU which is built-in
> currently. Thus we don't have module_exit before. This patch adds
> module_exit and module_license. It is a preparing patch for supporting
> MTK_SMI could been built as a module.
> 
> Signed-off-by: Yong Wu <yong.wu@mediatek.com>
> ---
>  drivers/memory/mtk-smi.c | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 
> diff --git a/drivers/memory/mtk-smi.c b/drivers/memory/mtk-smi.c
> index e2aebd2bfa8e..aa2a25abf04f 100644
> --- a/drivers/memory/mtk-smi.c
> +++ b/drivers/memory/mtk-smi.c
> @@ -597,3 +597,13 @@ static int __init mtk_smi_init(void)
>  	return platform_register_drivers(smidrivers, ARRAY_SIZE(smidrivers));
>  }
>  module_init(mtk_smi_init);
> +
> +static void __exit mtk_smi_exit(void)
> +{
> +	platform_unregister_drivers(smidrivers, ARRAY_SIZE(smidrivers));
> +}
> +module_exit(mtk_smi_exit);
> +
> +MODULE_DESCRIPTION("MediaTek SMI driver");
> +MODULE_ALIAS("platform:MediaTek-SMI");

Drivers do not use capital letters, so I have doubts whether this alias
is correct.

Adding all these should be squashed with changing Kconfig into tristate.
It does not have sense on its own.

Best regards,
Krzysztof

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
