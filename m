Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16E92C433EF
	for <linux-mediatek@archiver.kernel.org>; Wed, 12 Jan 2022 02:05:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2yh2XpJp77Q73saA7pzBhf6ASfATbSFB286YTZWLPx8=; b=OjXX3dcwzruvRc
	H3JVHIIH/Z1CwZZtapQz6MsRNOLaEH3dDuXWQ7FeGaYhrDmdsIUPsKLN9WZJF529ixEhiay4NuUJp
	NSgdwzQv/EQxA50jfhQtz1Y1VIt4ephWpNVK1I+aYsUKm0E53+Y4PqxV/C45bwesZv/IQfqh7APIX
	ePFay1bUQGKXcTvFyH6nWB2B2JVn4vXrKcFV3GkRbnLstB9ZPOj1IUcHjcOLDB81yKTMhPDAJN3LB
	csSFC6uTFnP+lCSykvclLflhb4Ut/ZZ16Cmmb0qv12CHwkT2ti5kbvkAcJPSgdEhpFlKlR72ODLeW
	teYz1bTmEKmdrsd3yW6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n7T10-000mTH-4i; Wed, 12 Jan 2022 02:05:30 +0000
Received: from mail-oi1-f179.google.com ([209.85.167.179])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n7T0k-000mNd-NN; Wed, 12 Jan 2022 02:05:16 +0000
Received: by mail-oi1-f179.google.com with SMTP id w188so1509001oiw.13;
 Tue, 11 Jan 2022 18:05:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=7yYE6Cs10Esq3OViO3ltPRe5e9ugTO3WijsMpNxMlOs=;
 b=VyifrIzuM29K8Q04O7O8yHn80qd42y6tKsj5R313YYHR49sPN/AfrR0jOWgDpGAt2R
 kQloW/3M9ojB6kG2qgkYBnfJW6iWq8PELeQncavwehLiqHhbZDGJSKsvVaLkP5qBf7m3
 dTn3XkE/lOMDNbI2VnkloagRYgj7IrAu8i4xflI5VGqQ3Azr9gn6LB6II/5sBwGwMs7N
 DDOnWeo+v8cVZ6Tw5SBiXkRfevRZMmmQ1mJM8MmsTjgGlh290Kf8thEK3rMdAFiX8oM0
 e2i5DlWtmFrSp2Vb++yCrMVIeT+zyu/q2UwyWJ3wH/kE/v654U7X95srJgMUHg45A69n
 Qylw==
X-Gm-Message-State: AOAM531H+ZJYhIxphH65XudW6b9Hp6HZcn+HmQfF9GqA82EQdIpow9ay
 C5RWP4rjzhBBhRhXfFWs4SNsCSrZ0g==
X-Google-Smtp-Source: ABdhPJwZSetCrwyoCTRuxp0BWKa6Ycop3qtlZUE4Xdi6xWhx3gEMoXb6UUGZRi5pGMZWrEgL2mwrhQ==
X-Received: by 2002:a05:6808:1710:: with SMTP id
 bc16mr3653978oib.179.1641953113423; 
 Tue, 11 Jan 2022 18:05:13 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.gmail.com with ESMTPSA id t26sm1998929oic.51.2022.01.11.18.05.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Jan 2022 18:05:12 -0800 (PST)
Received: (nullmailer pid 3920878 invoked by uid 1000);
 Wed, 12 Jan 2022 02:05:11 -0000
Date: Tue, 11 Jan 2022 20:05:11 -0600
From: Rob Herring <robh@kernel.org>
To: Chun-Jie Chen <chun-jie.chen@mediatek.com>
Cc: Enric Balletbo Serra <eballetbo@gmail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Nicolas Boichat <drinkcat@chromium.org>, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-mediatek@lists.infradead.org, srv_heupstream@mediatek.com,
 Project_Global_Chrome_Upstream_Group@mediatek.com
Subject: Re: [v1 1/2] dt-bindings: power: Add MT8186 power domains
Message-ID: <Yd43V1woRMAcXOfS@robh.at.kernel.org>
References: <20220108131953.16744-1-chun-jie.chen@mediatek.com>
 <20220108131953.16744-2-chun-jie.chen@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220108131953.16744-2-chun-jie.chen@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220111_180514_795201_C517D30A 
X-CRM114-Status: GOOD (  16.42  )
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

On Sat, Jan 08, 2022 at 09:19:52PM +0800, Chun-Jie Chen wrote:
> Add power domains dt-bindings for MT8186.
> 
> Signed-off-by: Chun-Jie Chen <chun-jie.chen@mediatek.com>
> ---
>  .../power/mediatek,power-controller.yaml      |  1 +
>  include/dt-bindings/power/mt8186-power.h      | 32 +++++++++++++++++++
>  2 files changed, 33 insertions(+)
>  create mode 100644 include/dt-bindings/power/mt8186-power.h
> 
> diff --git a/Documentation/devicetree/bindings/power/mediatek,power-controller.yaml b/Documentation/devicetree/bindings/power/mediatek,power-controller.yaml
> index d6ebd77d28a7..135c6f722091 100644
> --- a/Documentation/devicetree/bindings/power/mediatek,power-controller.yaml
> +++ b/Documentation/devicetree/bindings/power/mediatek,power-controller.yaml
> @@ -26,6 +26,7 @@ properties:
>        - mediatek,mt8167-power-controller
>        - mediatek,mt8173-power-controller
>        - mediatek,mt8183-power-controller
> +      - mediatek,mt8186-power-controller
>        - mediatek,mt8192-power-controller
>        - mediatek,mt8195-power-controller
>  
> diff --git a/include/dt-bindings/power/mt8186-power.h b/include/dt-bindings/power/mt8186-power.h
> new file mode 100644
> index 000000000000..ca8ea2d24801
> --- /dev/null
> +++ b/include/dt-bindings/power/mt8186-power.h
> @@ -0,0 +1,32 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */

Dual license please.

> +/*
> + * Copyright (c) 2022 MediaTek Inc.
> + * Author: Chun-Jie Chen <chun-jie.chen@mediatek.com>
> + */
> +
> +#ifndef _DT_BINDINGS_POWER_MT8186_POWER_H
> +#define _DT_BINDINGS_POWER_MT8186_POWER_H
> +
> +#define MT8186_POWER_DOMAIN_MFG0			0
> +#define MT8186_POWER_DOMAIN_MFG1			1
> +#define MT8186_POWER_DOMAIN_MFG2			2
> +#define MT8186_POWER_DOMAIN_MFG3			3
> +#define MT8186_POWER_DOMAIN_SSUSB			4
> +#define MT8186_POWER_DOMAIN_SSUSB_P1			5
> +#define MT8186_POWER_DOMAIN_DIS				6
> +#define MT8186_POWER_DOMAIN_IMG				7
> +#define MT8186_POWER_DOMAIN_IMG2			8
> +#define MT8186_POWER_DOMAIN_IPE				9
> +#define MT8186_POWER_DOMAIN_CAM				10
> +#define MT8186_POWER_DOMAIN_CAM_RAWA			11
> +#define MT8186_POWER_DOMAIN_CAM_RAWB			12
> +#define MT8186_POWER_DOMAIN_VENC			13
> +#define MT8186_POWER_DOMAIN_VDEC			14
> +#define MT8186_POWER_DOMAIN_WPE				15
> +#define MT8186_POWER_DOMAIN_CONN_ON			16
> +#define MT8186_POWER_DOMAIN_CSIRX_TOP			17
> +#define MT8186_POWER_DOMAIN_ADSP_AO			18
> +#define MT8186_POWER_DOMAIN_ADSP_INFRA			19
> +#define MT8186_POWER_DOMAIN_ADSP_TOP			20
> +
> +#endif /* _DT_BINDINGS_POWER_MT8186_POWER_H */
> -- 
> 2.18.0
> 
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
