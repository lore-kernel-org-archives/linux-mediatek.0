Return-Path: <SRS0=gG0U=EF=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	UNPARSEABLE_RELAY,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 48C40C4363A
	for <linux-mediatek@archiver.kernel.org>; Fri, 30 Oct 2020 11:44:19 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B8E702076D
	for <linux-mediatek@archiver.kernel.org>; Fri, 30 Oct 2020 11:44:18 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="QDXq8JhL"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B8E702076D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=NyFlTl8sVYIgEf7mlr0K8Fp7Ec/6SqNg04p7wgI9mNA=; b=QDXq8JhLp5+ALQHKEv/f5tsDt
	NIXsiC1o2aErlsk0pSTXaWiTEWrKQF74QyUuN8wYGZ3D9bJByC5DIMS93J9bSj32dGa+ze3QGT6Yi
	NBlz0cLItbpqNDoBsh4FsESX3ipwvz45tNqBPSA9th4PsQ1WfrrrDz8iTMdTSyGkgJ8gReFOGG7LB
	/KTAlz01soFRLEy6vxmnQ42/n0y5aHT+vBF/Ci8qAw2nfTPofcEVXONJEfbu6Sx6OPUWgs1PN9hQD
	BqqX1l4zwTAMrxQpttYk+OTgramzBhAcuTK4Wg5eXusJ43gUjpprjXyJ0kObjbYtBbz4sSUrUnVsq
	dRDfDvV7A==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kYSpE-0004dz-UI; Fri, 30 Oct 2020 11:44:09 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kYSoe-0004PP-Re; Fri, 30 Oct 2020 11:43:46 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: eballetbo) with ESMTPSA id F132C1F45EBC
Subject: Re: [PATCH v2 1/2] dt-bindings: power: Add MT8167 power domains
To: Fabien Parent <fparent@baylibre.com>, Rob Herring <robh+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Weiyi Lu <weiyi.lu@mediatek.com>
References: <20201027131122.374046-1-fparent@baylibre.com>
From: Enric Balletbo i Serra <enric.balletbo@collabora.com>
Message-ID: <c00a5ba1-154d-66ab-2ac7-c504e2e87b3e@collabora.com>
Date: Fri, 30 Oct 2020 12:43:28 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20201027131122.374046-1-fparent@baylibre.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201030_074333_195598_B613613D 
X-CRM114-Status: GOOD (  21.13  )
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
Cc: devicetree@vger.kernel.org, Matthias Brugger <mbrugger@suse.com>,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi Fabien,

Thank you for the patch and base it on [0]

On 27/10/20 14:11, Fabien Parent wrote:
> Add power domains dt-bindings for MT8167.
> 
> Signed-off-by: Fabien Parent <fparent@baylibre.com>
> ---
> 
> This patch depends on the SCPSYS PM domains driver [0].
> 
> v2:
> 	* Implement on top of new SCPSYS PM domains driver [0]
> 
> [0] https://patchwork.kernel.org/project/linux-mediatek/list/?series=370737
> 
>  .../power/mediatek,power-controller.yaml       |  2 ++
>  include/dt-bindings/power/mt8167-power.h       | 18 ++++++++++++++++++
>  2 files changed, 20 insertions(+)
>  create mode 100644 include/dt-bindings/power/mt8167-power.h
> 
> diff --git a/Documentation/devicetree/bindings/power/mediatek,power-controller.yaml b/Documentation/devicetree/bindings/power/mediatek,power-controller.yaml
> index 0318ffb1133c..73e5452c3a5d 100644
> --- a/Documentation/devicetree/bindings/power/mediatek,power-controller.yaml
> +++ b/Documentation/devicetree/bindings/power/mediatek,power-controller.yaml
> @@ -23,6 +23,7 @@ properties:
>  
>    compatible:
>      enum:
> +      - mediatek,mt8167-power-controller
>        - mediatek,mt8173-power-controller
>        - mediatek,mt8183-power-controller
>        - mediatek,mt8192-power-controller
> @@ -59,6 +60,7 @@ patternProperties:
>        reg:
>          description: |
>            Power domain index. Valid values are defined in:
> +              "include/dt-bindings/power/mt8167-power.h" - for MT8167 type power domain.
>                "include/dt-bindings/power/mt8173-power.h" - for MT8173 type power domain.
>                "include/dt-bindings/power/mt8183-power.h" - for MT8183 type power domain.
>                "include/dt-bindings/power/mt8192-power.h" - for MT8192 type power domain.
> diff --git a/include/dt-bindings/power/mt8167-power.h b/include/dt-bindings/power/mt8167-power.h
> new file mode 100644
> index 000000000000..7e3babfc2eef
> --- /dev/null
> +++ b/include/dt-bindings/power/mt8167-power.h
> @@ -0,0 +1,18 @@
> +/* SPDX-License-Identifier: GPL-2.0
> + *
> + * Copyright (c) 2020 MediaTek Inc.
> + */
> +
> +#ifndef _DT_BINDINGS_POWER_MT8167_POWER_H
> +#define _DT_BINDINGS_POWER_MT8167_POWER_H
> +
> +#define MT8167_POWER_DOMAIN_MM		0
> +#define MT8167_POWER_DOMAIN_DISP	0

Is that correct? Both domains have the same index?

> +#define MT8167_POWER_DOMAIN_VDEC	1
> +#define MT8167_POWER_DOMAIN_ISP		2
> +#define MT8167_POWER_DOMAIN_CONN	3
> +#define MT8167_POWER_DOMAIN_MFG_ASYNC	4
> +#define MT8167_POWER_DOMAIN_MFG_2D	5
> +#define MT8167_POWER_DOMAIN_MFG		6
> +
> +#endif /* _DT_BINDINGS_POWER_MT8167_POWER_H */
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
