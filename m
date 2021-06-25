Return-Path: <SRS0=Skuz=LT=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 172B5C2B9F4
	for <linux-mediatek@archiver.kernel.org>; Fri, 25 Jun 2021 09:58:23 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D790861429
	for <linux-mediatek@archiver.kernel.org>; Fri, 25 Jun 2021 09:58:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D790861429
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:Cc:To:Subject:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=nLQJUbOBHCP8qVOUhCFnoDoSWNlBz5BrFMnjy9bpQe8=; b=x8kU/zjpN8qoWsFiVDl721cY53
	RjucchPvB5Af/enMo/IWuKYCMmkWLQwctoj5qh/2nkrxS+Km7d8NAfLLLQ7Joxrfqi9wDlM8Vetas
	1pmBjGDQmKPyTy5yPTh8Wd88BMpeMzD2kIXPcIGVtZ6zCduAwP0PjpjLuNtZX9o9uf7LxcMkFufpG
	xOl3VcSJyi2j/HO1UHByS6zAg5rPWXZxkicjfXXD969eLU2xlaeIV8xNEq7EvDSD/tofQgntesPLh
	QZ9JSHXDGzXvN1vBrSXqe3ATrf9LT2nzs5Zb55wA1LLkD9L05oYC2VqSgt7LyC3gN4DPvaR3yNTFP
	A4chWkDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lwibD-000oIs-L3; Fri, 25 Jun 2021 09:58:11 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lwhfR-000XGQ-7V; Fri, 25 Jun 2021 08:58:30 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: eballetbo) with ESMTPSA id 625721F44485
Subject: Re: [RESEND PATCH v2 2/4] dt-bindings: power: Add MT8195 power domains
To: Chun-Jie Chen <chun-jie.chen@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Nicolas Boichat <drinkcat@chromium.org>, Rob Herring <robh+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-mediatek@lists.infradead.org,
 srv_heupstream@mediatek.com,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20210616000659.28347-1-chun-jie.chen@mediatek.com>
 <20210616000659.28347-3-chun-jie.chen@mediatek.com>
From: Enric Balletbo i Serra <enric.balletbo@collabora.com>
Message-ID: <d55142b4-082b-7fbc-dc9a-3dd2d1fca645@collabora.com>
Date: Fri, 25 Jun 2021 10:58:25 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210616000659.28347-3-chun-jie.chen@mediatek.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210625_015829_493609_95A805FE 
X-CRM114-Status: GOOD (  16.32  )
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

Hi Chun-Jie Chen,

Thank you for your patch.

On 16/6/21 2:06, Chun-Jie Chen wrote:
> Add power domains dt-bindings for MT8195.
> 
> Signed-off-by: Chun-Jie Chen <chun-jie.chen@mediatek.com>

Reviewed-by: Enric Balletbo i Serra <enric.balletbo@collabora.com>

> ---
>  .../power/mediatek,power-controller.yaml      |  2 +
>  include/dt-bindings/power/mt8195-power.h      | 51 +++++++++++++++++++
>  2 files changed, 53 insertions(+)
>  create mode 100644 include/dt-bindings/power/mt8195-power.h
> 
> diff --git a/Documentation/devicetree/bindings/power/mediatek,power-controller.yaml b/Documentation/devicetree/bindings/power/mediatek,power-controller.yaml
> index f234a756c193..d6ebd77d28a7 100644
> --- a/Documentation/devicetree/bindings/power/mediatek,power-controller.yaml
> +++ b/Documentation/devicetree/bindings/power/mediatek,power-controller.yaml
> @@ -27,6 +27,7 @@ properties:
>        - mediatek,mt8173-power-controller
>        - mediatek,mt8183-power-controller
>        - mediatek,mt8192-power-controller
> +      - mediatek,mt8195-power-controller
>  
>    '#power-domain-cells':
>      const: 1
> @@ -64,6 +65,7 @@ patternProperties:
>                "include/dt-bindings/power/mt8173-power.h" - for MT8173 type power domain.
>                "include/dt-bindings/power/mt8183-power.h" - for MT8183 type power domain.
>                "include/dt-bindings/power/mt8192-power.h" - for MT8192 type power domain.
> +              "include/dt-bindings/power/mt8195-power.h" - for MT8195 type power domain.
>          maxItems: 1
>  
>        clocks:
> diff --git a/include/dt-bindings/power/mt8195-power.h b/include/dt-bindings/power/mt8195-power.h
> new file mode 100644
> index 000000000000..43fd36e1f538
> --- /dev/null
> +++ b/include/dt-bindings/power/mt8195-power.h
> @@ -0,0 +1,51 @@
> +/* SPDX-License-Identifier: GPL-2.0
> + *
> + * Copyright (c) 2021 MediaTek Inc.
> + * Author: Chun-Jie Chen <chun-jie.chen@mediatek.com>
> + */
> +
> +#ifndef _DT_BINDINGS_POWER_MT8195_POWER_H
> +#define _DT_BINDINGS_POWER_MT8195_POWER_H
> +
> +#define MT8195_POWER_DOMAIN_PCIE_MAC_P0		0
> +#define MT8195_POWER_DOMAIN_PCIE_MAC_P1		1
> +#define MT8195_POWER_DOMAIN_PCIE_PHY		2
> +#define MT8195_POWER_DOMAIN_SSUSB_PCIE_PHY	3
> +#define MT8195_POWER_DOMAIN_CSI_RX_TOP		4
> +#define MT8195_POWER_DOMAIN_ETHER		5
> +#define MT8195_POWER_DOMAIN_ADSP		6
> +#define MT8195_POWER_DOMAIN_AUDIO		7
> +#define MT8195_POWER_DOMAIN_AUDIO_ASRC		8
> +#define MT8195_POWER_DOMAIN_NNA			9
> +#define MT8195_POWER_DOMAIN_NNA0		10
> +#define MT8195_POWER_DOMAIN_NNA1		11
> +#define MT8195_POWER_DOMAIN_MFG0		12
> +#define MT8195_POWER_DOMAIN_MFG1		13
> +#define MT8195_POWER_DOMAIN_MFG2		14
> +#define MT8195_POWER_DOMAIN_MFG3		15
> +#define MT8195_POWER_DOMAIN_MFG4		16
> +#define MT8195_POWER_DOMAIN_MFG5		17
> +#define MT8195_POWER_DOMAIN_MFG6		18
> +#define MT8195_POWER_DOMAIN_VPPSYS0		19
> +#define MT8195_POWER_DOMAIN_VDOSYS0		20
> +#define MT8195_POWER_DOMAIN_VPPSYS1		21
> +#define MT8195_POWER_DOMAIN_VDOSYS1		22
> +#define MT8195_POWER_DOMAIN_DP_TX		23
> +#define MT8195_POWER_DOMAIN_EPD_TX		24
> +#define MT8195_POWER_DOMAIN_HDMI_TX		25
> +#define MT8195_POWER_DOMAIN_HDMI_RX		26
> +#define MT8195_POWER_DOMAIN_WPESYS		27
> +#define MT8195_POWER_DOMAIN_VDEC0		28
> +#define MT8195_POWER_DOMAIN_VDEC1		29
> +#define MT8195_POWER_DOMAIN_VDEC2		30
> +#define MT8195_POWER_DOMAIN_VENC		31
> +#define MT8195_POWER_DOMAIN_VENC_CORE1		32
> +#define MT8195_POWER_DOMAIN_IMG			33
> +#define MT8195_POWER_DOMAIN_DIP			34
> +#define MT8195_POWER_DOMAIN_IPE			35
> +#define MT8195_POWER_DOMAIN_CAM			36
> +#define MT8195_POWER_DOMAIN_CAM_RAWA		37
> +#define MT8195_POWER_DOMAIN_CAM_RAWB		38
> +#define MT8195_POWER_DOMAIN_CAM_MRAW		39
> +
> +#endif /* _DT_BINDINGS_POWER_MT8195_POWER_H */
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
