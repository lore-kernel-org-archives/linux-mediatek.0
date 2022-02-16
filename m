Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 461F9C433F5
	for <linux-mediatek@archiver.kernel.org>; Wed, 16 Feb 2022 03:30:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=M3jMVQzQHU6cAg8GAr38zgW4KPra47vNX/jY/AVZ2kE=; b=49g9kK7o7MfQVN
	tv0A04j7lLdNeOqeQ2obUDYPSgGLrdRmoRSOm7Ht94Ol9Kvbyf5B+Su1aXDpJDmt7hJ9i+D2H2PKJ
	HiMvQOGm8m5HGumZupOFIxWGmR6jZx5KJ7iYfBe665NDXir7DKNnavtlumSjXgJayzNzZpEQcEHqp
	KWLWHLqB5fh5DNhdGCwA4vyEI8+42HyS+egP9JnEqpQSS+Up8W+x8D2jJhoOcoyvpg4wu4hrg7DxR
	zyuP/llDrW/xUdlGtSIqC/zUXDuSX7bt7G0yZ9CaCox4cW1IOBy2VNyCvnq3AEqm80W8QQuFVxUGJ
	R+isNrFNg/rHkoR/bSeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nKB1E-005QCy-7K; Wed, 16 Feb 2022 03:30:16 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nKB0s-005Q8Q-IZ; Wed, 16 Feb 2022 03:29:56 +0000
X-UUID: 2aa678231d0b46d6b97873ea2374fa8d-20220215
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=yjIgZeShUvh8GeAGgYIkRVM8QcusEW45M5w+b2kLXIw=; 
 b=OsCx4XaxvjhgyVHSPzj2Azqj21fhwGFix+alQUwrY4g6vJN1vWY/o7AbPY9n15+Wf5a2QPqIP/a/iESWsHr/gWdJjtNRn6lQ3u5Hexq3U568+xNfyegxVKPwi8ozwhUvqTm7w9mMcNLkCmnX3vvdBcJ59BLPeZLktNn1iD2iGUg=;
X-UUID: 2aa678231d0b46d6b97873ea2374fa8d-20220215
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <guodong.liu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 211637076; Tue, 15 Feb 2022 20:29:52 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 15 Feb 2022 19:28:35 -0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Wed, 16 Feb 2022 11:28:33 +0800
Received: from mhfsdcap04 (10.17.3.154) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 16 Feb 2022 11:28:33 +0800
Message-ID: <02f147135e6c1458caa10ed9027bf185beee2023.camel@mediatek.com>
Subject: Re: [PATCH v4 1/3] dt-bindings: pinctrl: mt8186: add pinctrl file
 and binding document
From: Guodong Liu <guodong.liu@mediatek.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Sean Wang <sean.wang@kernel.org>
CC: Sean Wang <sean.wang@mediatek.com>, <linux-gpio@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>
Date: Wed, 16 Feb 2022 11:28:33 +0800
In-Reply-To: <87db864e-fc74-189a-a665-bf51db8b5321@collabora.com>
References: <20220214030631.4969-1-guodong.liu@mediatek.com>
 <20220214030631.4969-2-guodong.liu@mediatek.com>
 <87db864e-fc74-189a-a665-bf51db8b5321@collabora.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220215_192954_665359_C76D9017 
X-CRM114-Status: GOOD (  18.33  )
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

-----Original Message-----
From: AngeloGioacchino Del Regno <
angelogioacchino.delregno@collabora.com>
To: Guodong Liu <guodong.liu@mediatek.com>, Linus Walleij <
linus.walleij@linaro.org>, Rob Herring <robh+dt@kernel.org>, Matthias
Brugger <matthias.bgg@gmail.com>, Sean Wang <sean.wang@kernel.org>
Cc: Sean Wang <sean.wang@mediatek.com>, linux-gpio@vger.kernel.org, 
devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, 
Project_Global_Chrome_Upstream_Group@mediatek.com
Subject: Re: [PATCH v4 1/3] dt-bindings: pinctrl: mt8186: add pinctrl
file and binding document
Date: Mon, 14 Feb 2022 10:58:58 +0100

Il 14/02/22 04:06, Guodong Liu ha scritto:
> 1. This patch adds pinctrl file for mt8186.
> 2. This patch adds mt8186 compatible node in binding document.
> 
> Signed-off-by: Guodong Liu <guodong.liu@mediatek.com>
> ---
>   .../bindings/pinctrl/pinctrl-mt8186.yaml      |  302 +++++
>   include/dt-bindings/pinctrl/mt8186-pinfunc.h  | 1174
> +++++++++++++++++
>   2 files changed, 1476 insertions(+)
>   create mode 100644
> Documentation/devicetree/bindings/pinctrl/pinctrl-mt8186.yaml
>   create mode 100644 include/dt-bindings/pinctrl/mt8186-pinfunc.h
> 
> diff --git a/Documentation/devicetree/bindings/pinctrl/pinctrl-
> mt8186.yaml b/Documentation/devicetree/bindings/pinctrl/pinctrl-
> mt8186.yaml
> new file mode 100644
> index 000000000000..582d131af4e3
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/pinctrl/pinctrl-mt8186.yaml

...snip...

> diff --git a/include/dt-bindings/pinctrl/mt8186-pinfunc.h
> b/include/dt-bindings/pinctrl/mt8186-pinfunc.h
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

Hello Angelo,

we will update it for next version.

Thanks
Guodong
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
