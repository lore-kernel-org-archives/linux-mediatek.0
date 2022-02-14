Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B731C433F5
	for <linux-mediatek@archiver.kernel.org>; Mon, 14 Feb 2022 11:14:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KeP2rnPEE+GKGin0CCCQG4WliT0N8oPl3vgkS9isTWY=; b=dDJqSNnlXdx79A
	CNeiEtxnU4wX3k+7x9bg2Cx9J5C5w3iOgHI3mSNs5gBErMb4XdYLBP0QJAf+he3XZgJ8WEyImliF4
	sUQsqkhiuROn8nSiE6wO0rD9VsnYcrGJwWtfgCu1mTjYvHUwLDr3rk2Tdf/NDErLMKbPgnzGyjI8k
	YwK+srdR0/ZRdlbkeZRWR70auRzQlTOHpDgvCyzdstpMcE2tvyfYr/vrvgliUS1cdwUJDPa0MF1O0
	Z1rLuEIRxPRfGfG6ZOMKnKOGSNZOS7AktQGC1eLWcGVGK7OtxFSG1j6i7o3LncuFlS5vkrZ/NTzaH
	7hXVrTD5AtRORZ2g9l5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nJZIv-00EjoX-7n; Mon, 14 Feb 2022 11:14:01 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nJY8N-00ENOS-0Q; Mon, 14 Feb 2022 09:59:04 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id 06CD51F43053
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1644832741;
 bh=OaINPsaheT6XUF0+hFr141uKFbMlStd2byNaS6I2GKs=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=fGemg3CLB1WP8e5KYjv0QDiN8sv7DuAdkLeRWz7Svak1RqzeSREYL4mIrBDLKFNAb
 i2cRTKJ+Gsl0Pj6yAAo8qxpzXg6Ns+FtuXmeFkOINlU+b3WDFaiFxijoiHtts1W0Gn
 uWqtFsbSGDqHe4VVhmjEgtxP+36lok5C8WKldI3eP3+GfKkddyCh9wxBIzZuqSb+Rv
 hRgNp3dTgwu0Tgsma0i7nNkgNMfhwK+7LRB+9XWbcJSlzebKyS+YfUIoEehQZVgjb9
 dlGDbTEeU9eeF/c6B6ZYYwdugaIaayKPqDdRn5tdOByWmUIE87AvmpiydgZko+gpak
 70qs8d1QAkefg==
Message-ID: <87db864e-fc74-189a-a665-bf51db8b5321@collabora.com>
Date: Mon, 14 Feb 2022 10:58:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.1
Subject: Re: [PATCH v4 1/3] dt-bindings: pinctrl: mt8186: add pinctrl file and
 binding document
Content-Language: en-US
To: Guodong Liu <guodong.liu@mediatek.com>,
 Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Sean Wang <sean.wang@kernel.org>
Cc: Sean Wang <sean.wang@mediatek.com>, linux-gpio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20220214030631.4969-1-guodong.liu@mediatek.com>
 <20220214030631.4969-2-guodong.liu@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220214030631.4969-2-guodong.liu@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220214_015903_247321_76C57926 
X-CRM114-Status: GOOD (  16.74  )
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

Il 14/02/22 04:06, Guodong Liu ha scritto:
> 1. This patch adds pinctrl file for mt8186.
> 2. This patch adds mt8186 compatible node in binding document.
> 
> Signed-off-by: Guodong Liu <guodong.liu@mediatek.com>
> ---
>   .../bindings/pinctrl/pinctrl-mt8186.yaml      |  302 +++++
>   include/dt-bindings/pinctrl/mt8186-pinfunc.h  | 1174 +++++++++++++++++
>   2 files changed, 1476 insertions(+)
>   create mode 100644 Documentation/devicetree/bindings/pinctrl/pinctrl-mt8186.yaml
>   create mode 100644 include/dt-bindings/pinctrl/mt8186-pinfunc.h
> 
> diff --git a/Documentation/devicetree/bindings/pinctrl/pinctrl-mt8186.yaml b/Documentation/devicetree/bindings/pinctrl/pinctrl-mt8186.yaml
> new file mode 100644
> index 000000000000..582d131af4e3
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/pinctrl/pinctrl-mt8186.yaml

...snip...

> diff --git a/include/dt-bindings/pinctrl/mt8186-pinfunc.h b/include/dt-bindings/pinctrl/mt8186-pinfunc.h
> new file mode 100644
> index 000000000000..dcff86201a61
> --- /dev/null
> +++ b/include/dt-bindings/pinctrl/mt8186-pinfunc.h
> @@ -0,0 +1,1174 @@
> +/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
> +/*
> + * Copyright (C) 2021 MediaTek Inc.
> + * Author: Guodong Liu <Guodong.Liu@mediatek.com>
> + *
> + */
> +

Hello,
I've just noticed that we have a typo here....

You wrote "MT8168", but this should be "MT8186" instead; please fix it.

P.S.: I'm sorry for not seeing that before!

> +#ifndef __MT8168_PINFUNC_H
> +#define __MT8168_PINFUNC_H
> +

..snip..

> +
> +#endif /* __MT8168-PINFUNC_H */

Thank you,
Angelo

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
