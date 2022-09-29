Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E66BC07E9D
	for <linux-mediatek@archiver.kernel.org>; Thu, 29 Sep 2022 08:27:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=csxHMoV7rZGj6RZdSys8gg/iJwdNSFkGpHyes/lo0Ao=; b=Rm7PxM2ZBxDwSAGz6eXTVJUrNs
	+LPTnozI4QCGAiTy0ly+Rs0mxv3XG2vpyGqyenjJVnOkP6tYUCGwNKrUCc6ATZzZ5CrnwzE/IJObH
	942pedmIY2gA7se+a2q+ZJz8PF3Nadnah9+FgG+UBdMh/pj5lZKfs0i3+/jS8klCqpLhZ3cCGRm9l
	tYkcpj5/iU5dzlnhlOqnR0E+HVB0GrooKDofzYoHRYMmNymONWhepgJSOAhrJGx8BDy1K02oBq3tm
	H+gyWQ9ZIzPfNb+CO5u/x5AbYa/UAH6vX66WV4KfRQYSRkR+0Dbf0iwyz5BRNlBoahh8xtPMBFaPT
	AQtNNarA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1odotH-001p7a-UC; Thu, 29 Sep 2022 08:27:31 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1odos2-001oR6-Ay; Thu, 29 Sep 2022 08:26:15 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 76E7066022A4;
	Thu, 29 Sep 2022 09:26:12 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1664439973;
	bh=KWUoXXAk6o0BCBiAsiGqrnHSb/eXnc4H+xT7gm5rr6c=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=lctdJjd3YIz0jsS7WT5B+VBKJKB1m3r95Q6IpGrU1RYiFo0WJYcOWbfpHz69nHark
	 55T7CDlYAHhnfHS8tkKNHirgzQ7zmZatrRJSNHQHjvXzD+07bxsgdVA4evDMrIjyhA
	 jYd/ojiwuNNs1qm0+Orej6yIZFcAJ9PwNPbn52tKMcseLaGkmXEtH49VywHTM/yXuU
	 V31bgXhA8m4JkB5uNct6Q3ebmaA1w2F/hOj28qr4QBxjMtYs/jqkgMVNkrYBpxENIr
	 JRuto3vGG1inYX0GcPM1rTU+36AxgZtmNYB2kXUEhelsCxGrZrzirKLdXhlnQp4Crq
	 NN70nw6jqNMHw==
Message-ID: <050439a2-bd54-54ec-10da-ff8d3a2b50ca@collabora.com>
Date: Thu, 29 Sep 2022 10:26:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
Subject: Re: [PATCH 5/8] soc: mediatek: mtk-svs: Move SoC specific functions
 to new files
Content-Language: en-US
To: matthias.bgg@kernel.org, roger.lu@mediatek.com, jia-wei.chang@mediatek.com
Cc: nfraprado@collabora.com, khilman@baylibre.com,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Philipp Zabel <p.zabel@pengutronix.de>
References: <20220928155519.31977-1-matthias.bgg@kernel.org>
 <20220928155519.31977-6-matthias.bgg@kernel.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220928155519.31977-6-matthias.bgg@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220929_012614_565264_F47F6795 
X-CRM114-Status: GOOD (  14.39  )
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

Il 28/09/22 17:55, matthias.bgg@kernel.org ha scritto:
> From: Matthias Brugger <matthias.bgg@gmail.com>
> 
> With every SoC added to the driver, it grows. Move SoC specific
> callbacks to a new source files.
> 
> Signed-off-by: Matthias Brugger <matthias.bgg@gmail.com>
> ---
> 
>   drivers/soc/mediatek/Makefile         |   3 +-
>   drivers/soc/mediatek/mt8183-svs.h     | 113 ++++
>   drivers/soc/mediatek/mt8192-svs.h     |  64 ++
>   drivers/soc/mediatek/mtk-svs-mt8183.c | 234 ++++++++
>   drivers/soc/mediatek/mtk-svs-mt8192.c | 100 ++++
>   drivers/soc/mediatek/mtk-svs.c        | 831 ++------------------------
>   drivers/soc/mediatek/mtk-svs.h        | 279 +++++++++
>   7 files changed, 837 insertions(+), 787 deletions(-)
>   create mode 100644 drivers/soc/mediatek/mt8183-svs.h
>   create mode 100644 drivers/soc/mediatek/mt8192-svs.h
>   create mode 100644 drivers/soc/mediatek/mtk-svs-mt8183.c
>   create mode 100644 drivers/soc/mediatek/mtk-svs-mt8192.c
>   create mode 100644 drivers/soc/mediatek/mtk-svs.h
> 
> diff --git a/drivers/soc/mediatek/Makefile b/drivers/soc/mediatek/Makefile
> index 0e9e703c931a..851131638644 100644
> --- a/drivers/soc/mediatek/Makefile
> +++ b/drivers/soc/mediatek/Makefile
> @@ -7,4 +7,5 @@ obj-$(CONFIG_MTK_SCPSYS) += mtk-scpsys.o
>   obj-$(CONFIG_MTK_SCPSYS_PM_DOMAINS) += mtk-pm-domains.o
>   obj-$(CONFIG_MTK_MMSYS) += mtk-mmsys.o
>   obj-$(CONFIG_MTK_MMSYS) += mtk-mutex.o
> -obj-$(CONFIG_MTK_SVS) += mtk-svs.o
> +mtk_svs-objs := mtk-svs.o mtk-svs-mt8183.o mtk-svs-mt8192.o
> +obj-$(CONFIG_MTK_SVS) += mtk_svs.o
> diff --git a/drivers/soc/mediatek/mt8183-svs.h b/drivers/soc/mediatek/mt8183-svs.h
> new file mode 100644
> index 000000000000..89c0deb9fb11
> --- /dev/null
> +++ b/drivers/soc/mediatek/mt8183-svs.h
> @@ -0,0 +1,113 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +
> +#ifndef __DRV_SVS_MT8183_H
> +#define __DRV_SVS_MT8183_H
> +

Please avoid implicit header inclusion (here and in mt8192-svs.h).

#include "mtk-svs.h"

Cheers,
Angelo



