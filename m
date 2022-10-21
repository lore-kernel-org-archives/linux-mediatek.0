Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 561ABC4332F
	for <linux-mediatek@archiver.kernel.org>; Fri, 21 Oct 2022 08:42:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=D/kxX8CXoByWrjg4UVxs9ZyfFdiph5NvnjnYFMnFh48=; b=n2pVCkrJQsxDmd6UDubah5PuJl
	ECDsADWZsnb9wcMR+w0XldHYRLmUhRf5Azws3QC2Ab0bqhFVQDZTrw/FDlwd9HYwVsscaJQfp3Abk
	FL2Qj0wSvZ5hLCsGDAWADam+tbqjFH4IqjH/UiugTCczdLuXEy6oSdZWkfpuY+DWbc93Ly8P5oKzC
	RhDmakIMmfOH53JY4oqaorkPdK4pee+Y/LI3YspefZDPtBs3nBKgvNpZjyzNmiRaf2gLUKRZwVKtF
	EC8kFQFJiuqVCgTgz3nR/2EpgRjVBmVU9AX9DlixihJRdpf6lSjdEnyG4H4a/DPhFIrv89xKLQAYd
	kAATIl3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1olnbm-006SM0-Hh; Fri, 21 Oct 2022 08:42:26 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1olnan-006Rs6-6r; Fri, 21 Oct 2022 08:41:28 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 0650C6602532;
	Fri, 21 Oct 2022 09:41:22 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1666341684;
	bh=ixtnbYZsDUAjtbOO7dcijDfW674zD9cWoD0xTEe/SQM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=kc/Lz34lDvuXmaLXjA3lWGJ1XXjh4KahLHgw6Qg/eLQirT6/VFA4+qENEKQ7CzHy+
	 DmXe8REyjQXW/J/shRxV7ntpiMvf40yTWmDvhOGP49l07EVv1V9xVbD5CtvC4Fr+8+
	 j+SY7b+/ASlzPr5OeyBZQnj8sPNUS9MSJi01jQ9e/w16v8iwmh7qPFcxuuBmmW6rH6
	 Dez4lLPN8acWboG/QPuQEWT6bdT7nf+CLJqeMTR3bXacgU/Ce6+GVT5g82xjebCRwM
	 Ko7r8wwIxC82TrWt2nu1N+IdE5ecKXmGIrF9h8gWae4RRf5v2w0VmUsW+3DqQtGvFH
	 eiCJl0ACY4RFw==
Message-ID: <de66f0e3-7694-7315-c896-9211259a1a17@collabora.com>
Date: Fri, 21 Oct 2022 10:41:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.3
Subject: Re: [PATCH v2 03/12] ASoC: mediatek: mt8188: support audsys clock
Content-Language: en-US
To: Trevor Wu <trevor.wu@mediatek.com>, broonie@kernel.org, tiwai@suse.com,
 robh+dt@kernel.org, matthias.bgg@gmail.com, p.zabel@pengutronix.de
Cc: Project_Global_Chrome_Upstream_Group@mediatek.com,
 alsa-devel@alsa-project.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org
References: <20221021082719.18325-1-trevor.wu@mediatek.com>
 <20221021082719.18325-4-trevor.wu@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20221021082719.18325-4-trevor.wu@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221021_014125_458331_6FAA38EA 
X-CRM114-Status: GOOD (  16.57  )
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

Il 21/10/22 10:27, Trevor Wu ha scritto:
> Add mt8188 audio cg clock control. Audio clock gates are registered to CCF
> for reference count and clock parent management.
> 
> Signed-off-by: Trevor Wu <trevor.wu@mediatek.com>
> ---
>   sound/soc/mediatek/mt8188/mt8188-audsys-clk.c | 206 ++++++++++++++++++
>   sound/soc/mediatek/mt8188/mt8188-audsys-clk.h |  15 ++
>   .../soc/mediatek/mt8188/mt8188-audsys-clkid.h |  83 +++++++
>   3 files changed, 304 insertions(+)
>   create mode 100644 sound/soc/mediatek/mt8188/mt8188-audsys-clk.c
>   create mode 100644 sound/soc/mediatek/mt8188/mt8188-audsys-clk.h
>   create mode 100644 sound/soc/mediatek/mt8188/mt8188-audsys-clkid.h
> 
> diff --git a/sound/soc/mediatek/mt8188/mt8188-audsys-clk.c b/sound/soc/mediatek/mt8188/mt8188-audsys-clk.c
> new file mode 100644
> index 000000000000..1f294231d4c2
> --- /dev/null
> +++ b/sound/soc/mediatek/mt8188/mt8188-audsys-clk.c
> @@ -0,0 +1,206 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * mt8188-audsys-clk.c  --  MediaTek 8188 audsys clock control
> + *
> + * Copyright (c) 2022 MediaTek Inc.
> + * Author: Chun-Chia Chiu <chun-chia.chiu@mediatek.com>
> + */
> +
> +#include <linux/clk.h>
> +#include <linux/clk-provider.h>
> +#include <linux/clkdev.h>
> +#include "mt8188-afe-common.h"
> +#include "mt8188-audsys-clk.h"
> +#include "mt8188-audsys-clkid.h"
> +#include "mt8188-reg.h"
> +
> +struct afe_gate {
> +	int id;
> +	const char *name;
> +	const char *parent_name;
> +	int reg;
> +	u8 bit;
> +	const struct clk_ops *ops;
> +	unsigned long flags;
> +	u8 cg_flags;
> +};
> +
> +#define GATE_AFE_FLAGS(_id, _name, _parent, _reg, _bit, _flags, _cgflags) {\
> +		.id = _id,					\
> +		.name = _name,					\
> +		.parent_name = _parent,				\
> +		.reg = _reg,					\
> +		.bit = _bit,					\
> +		.flags = _flags,				\
> +		.cg_flags = _cgflags,				\
> +	}
> +
> +#define GATE_AFE(_id, _name, _parent, _reg, _bit)		\
> +	GATE_AFE_FLAGS(_id, _name, _parent, _reg, _bit,		\
> +		       CLK_SET_RATE_PARENT | CLK_IGNORE_UNUSED, CLK_GATE_SET_TO_DISABLE)

Can you please explain what's the reason for CLK_IGNORE_UNUSED here?
Maybe we can solve some issue that you're facing in a cleaner way.

Regards,
Angelo


