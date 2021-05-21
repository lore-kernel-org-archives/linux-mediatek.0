Return-Path: <SRS0=Gsgc=KQ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AB552C433B4
	for <linux-mediatek@archiver.kernel.org>; Fri, 21 May 2021 01:23:00 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2C06861355
	for <linux-mediatek@archiver.kernel.org>; Fri, 21 May 2021 01:23:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2C06861355
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UrBRBgcV4EVpz+KzPsT01PpSi4hH2TWZ7APqDoBg0oI=; b=Mh41tT3047X9WWfSsf1Yo8IDto
	RvYOxwlKOYObDhKBzmwtMRoz302KW55bGuOiTFw3vdZ5WgJyGUUp4JenO9oEXr1s0onf+n6gANf6s
	t4PKwlHx9RHg4iH3Tkm3Thg4CUX6VoeyZTuknQ7OpEppM/SRoQKU3JaZhZ39pq4Xga/MAYBUiTpzQ
	jVBofYLk8PpuRu4a3egiZq9xgxukNZtaFYnDqLySE+Zal1Hx58MKdCKb/wVVqMZj6MfIY+K1e2Stt
	wq0d6/34qC2fs2hTWUpbYqsupkCYE617gJkmV09Gk7A1/hHTgqGvQE6wj+pxMlLjzY2oo0227+Cnd
	Yb/yiM3Q==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ljtsA-003EVO-Cj; Fri, 21 May 2021 01:22:42 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ljtrv-003ET2-QH; Fri, 21 May 2021 01:22:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=k4KWGlvK3qGaxYX6Np3iLLA0ulq4Lc64J8obvuCRFos=; b=gr/0fI5L4b8cZTHSdNBQ2vpYQU
 xDzKVeDHHDaRbEVI46pA1N8lMC4AdarQynSthKcUnz0Gs9tU0noiCSN4JGoD7l5OcoOxhKWwc2wFX
 8c0EwquCURKgB6a7ixb28CnD6gi/cfQATzbANI4iMSSWDPKA4L0IUOWH+e0rmoT8J6932ww6iY4ID
 YTRA9cCL5gZ5XGqCMFuf8t0atIJkGEZvRTFuHMmDfXa72gca8IFLunaJOD2xrreL6qBvjL0+NIeFB
 835CKFn5eRqfmzKQ0LKAS3uyr+jRjoP4Plblo03u1KjIrPmMx7EpCK7NOGzwd1PT1UuDrRL2sECWv
 yCy3L3qw==;
Received: from mail-oi1-f173.google.com ([209.85.167.173])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1ljtrt-00GkF7-AV; Fri, 21 May 2021 01:22:26 +0000
Received: by mail-oi1-f173.google.com with SMTP id v22so18236012oic.2;
 Thu, 20 May 2021 18:22:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=k4KWGlvK3qGaxYX6Np3iLLA0ulq4Lc64J8obvuCRFos=;
 b=a121C86sD8vqleS0XX4DlkdTX096qr6tSu+PNTi5944DAFIQmnGL3wFD+u5NIi9d6g
 duLu+0cJ8yFxp1I5tmyqlQnOSPdi9pD7MiUup6pRSzCxrGlbvRH6ZV0PhrdKd6PZt20Y
 b+39nZnaYuzB8nWMuNIq6QkQlVyMWI2EIJz8LWkNotx6prwYmtWBzV6nfhCheYiVyLje
 MaWfcPnhW1/mbLOKm3Jp9b1hdJ6JXwHE9t6oDWYBQaFZNQGarW+eSLKbnl/N4MhL9yF3
 ZkTOvRbHum7u2EYY5e1Rw62V9S2F+O2x/oyHmmB7P0oa6lX6nY1VTbz7K6Ng16qOxNH0
 U9gQ==
X-Gm-Message-State: AOAM531CDCufbkp/pgHqeDky6Ey7NEiLmuQs2gGclHisfnTrzbERzZAF
 SzBJer2/ggT5J1O/LIRnvg==
X-Google-Smtp-Source: ABdhPJyzqzC2yzSopZN40GRzbx7jDSy385pnzcAhmj1QfM9zVNed5J3r2LqLiVNYyYjjCim8ELXLVQ==
X-Received: by 2002:aca:dd86:: with SMTP id u128mr214796oig.155.1621560144175; 
 Thu, 20 May 2021 18:22:24 -0700 (PDT)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id f2sm960015otp.77.2021.05.20.18.22.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 May 2021 18:22:23 -0700 (PDT)
Received: (nullmailer pid 2428345 invoked by uid 1000);
 Fri, 21 May 2021 01:22:22 -0000
Date: Thu, 20 May 2021 20:22:22 -0500
From: Rob Herring <robh@kernel.org>
To: Fabien Parent <fparent@baylibre.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, Weiyi Lu <weiyi.lu@mediatek.com>,
 mkorpershoek@baylibre.com, Matthias Brugger <mbrugger@suse.com>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Subject: Re: [PATCH 1/2] dt-bindings: power: Add MT8365 power domains
Message-ID: <20210521012222.GA2426808@robh.at.kernel.org>
References: <20210518194008.2921469-1-fparent@baylibre.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210518194008.2921469-1-fparent@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210520_182225_383182_A4B8D526 
X-CRM114-Status: GOOD (  17.76  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Tue, May 18, 2021 at 09:40:07PM +0200, Fabien Parent wrote:
> Add power domains dt-bindings for MT8365.
> 
> Signed-off-by: Fabien Parent <fparent@baylibre.com>
> ---
>  .../power/mediatek,power-controller.yaml      |  2 ++
>  include/dt-bindings/power/mt8365-power.h      | 20 +++++++++++++++++++
>  2 files changed, 22 insertions(+)
>  create mode 100644 include/dt-bindings/power/mt8365-power.h
> 
> diff --git a/Documentation/devicetree/bindings/power/mediatek,power-controller.yaml b/Documentation/devicetree/bindings/power/mediatek,power-controller.yaml
> index f234a756c193..9a26a2cee7fb 100644
> --- a/Documentation/devicetree/bindings/power/mediatek,power-controller.yaml
> +++ b/Documentation/devicetree/bindings/power/mediatek,power-controller.yaml
> @@ -27,6 +27,7 @@ properties:
>        - mediatek,mt8173-power-controller
>        - mediatek,mt8183-power-controller
>        - mediatek,mt8192-power-controller
> +      - mediatek,mt8365-power-controller
>  
>    '#power-domain-cells':
>      const: 1
> @@ -64,6 +65,7 @@ patternProperties:
>                "include/dt-bindings/power/mt8173-power.h" - for MT8173 type power domain.
>                "include/dt-bindings/power/mt8183-power.h" - for MT8183 type power domain.
>                "include/dt-bindings/power/mt8192-power.h" - for MT8192 type power domain.
> +              "include/dt-bindings/power/mt8365-power.h" - for MT8365 type power domain.
>          maxItems: 1
>  
>        clocks:
> diff --git a/include/dt-bindings/power/mt8365-power.h b/include/dt-bindings/power/mt8365-power.h
> new file mode 100644
> index 000000000000..352440c4b5dd
> --- /dev/null
> +++ b/include/dt-bindings/power/mt8365-power.h
> @@ -0,0 +1,20 @@
> +/* SPDX-License-Identifier: GPL-2.0 */

What about non-GPL users of DT? Dual license please.

> +/*
> + * Copyright (c) 2021 MediaTek Inc.
> + */
> +
> +#ifndef _DT_BINDINGS_POWER_MT8365_POWER_H
> +#define _DT_BINDINGS_POWER_MT8365_POWER_H
> +
> +#define MT8365_POWER_DOMAIN_DISP	0
> +#define MT8365_POWER_DOMAIN_CONN	1
> +#define MT8365_POWER_DOMAIN_MFG		2
> +#define MT8365_POWER_DOMAIN_AUDIO	3
> +#define MT8365_POWER_DOMAIN_CAM		4
> +#define MT8365_POWER_DOMAIN_DSP		5
> +#define MT8365_POWER_DOMAIN_VDEC	6
> +#define MT8365_POWER_DOMAIN_VENC	7
> +#define MT8365_POWER_DOMAIN_APU		8
> +
> +#endif /* _DT_BINDINGS_POWER_MT8365_POWER_H */
> +
> -- 
> 2.31.1
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
