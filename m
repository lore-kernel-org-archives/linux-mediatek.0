Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2915C44501
	for <linux-mediatek@archiver.kernel.org>; Wed, 15 Jul 2026 09:57:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mLQw8Dz9/BqW32ZuGCjq3wfn6XQCj2FOXOEpOO5ichg=; b=WYSjccIq9UNvfPXe1iPhL47Pfq
	s5m3LY2w+IdgtRSwYgbNaioJAXgv7/7NuFC4OuaBD2NCZkO51QnjYp+8m5blTopAbV3GAa2u2p4VV
	W39IzXeD75s5Zar+r/FZwZKqksTw9edMu+wPNFogBK3tj04E6o0XjjjzDuzxPRWFToWfSgoUTHmVd
	VUaaLePkBDFHOBkuuWSAU8JqstG1Uy40xTVnF/xm4YCFoDpNqQS2nk1BD0FjG4mRq3PsvYWzJCPul
	Bv1klKkpi/K63KivMAd6LaFUIuFA0MCQaIhKuQClOnZ+yb0dENDMKiKJW0RM1lEqRib93ksWh81AL
	4xR0M/eA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjwMX-0000000EOI0-3lEX;
	Wed, 15 Jul 2026 09:57:09 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjwMR-0000000EOF9-2bJT;
	Wed, 15 Jul 2026 09:57:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1784109420;
	bh=OW/79ZzwiOczh73BlYcxy3dAlykMdIAPkOsugBdp0Zw=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=pSe05nonurkAhJsuBt2yEIQ5fPi41vauOhuIe9sf0w1XEIalfqMYITjaeZL9pFlMm
	 ekZjq00uuCno1aOoslDMoOsi9A3ewW0fpirsf9zZlSfLuXFEkUCIuQYpfspuy2+wJK
	 WYldNiOD8XceM9PxzSXBCdg0Uz2vWPwtTLGoPyPHhz/7+X0VX+/AKRbBQaRJqCNt1a
	 YId3go6YxasMtI/DvWlg7EtGURu9CTkUm3fB3rvgT9MfU6V2Hu457xi7TGD8v20lVn
	 m4hCQDv01OpY8ewAg8iWOISTyt0eAdON8lvD6F0IPQf04ncOb5x+Zdhu9tafNbt+DV
	 t003zfAbnqEfA==
Received: from [100.64.1.21] (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 0839B17E07F8;
	Wed, 15 Jul 2026 11:56:59 +0200 (CEST)
Message-ID: <9a4c815f-8db4-40c3-8f02-5c66eb5b0fc6@collabora.com>
Date: Wed, 15 Jul 2026 11:56:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] pmdomain: mediatek: Add support for MT6858 SoC
To: nikolai.burov@jolla.com, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Ulf Hansson <ulfh@kernel.org>
Cc: Matthias Brugger <mbrugger@suse.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-pm@vger.kernel.org,
 Nikolai Burov <nikolai.burov+review@abscue.de>
References: <20260714-mt6858-pmdomain-v1-0-4f09bbb822e0@jolla.com>
 <20260714-mt6858-pmdomain-v1-3-4f09bbb822e0@jolla.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20260714-mt6858-pmdomain-v1-3-4f09bbb822e0@jolla.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260715_025703_824240_FBBFA41A 
X-CRM114-Status: GOOD (  15.73  )
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

On 7/14/26 15:43, Nikolai Burov via B4 Relay wrote:
> From: Nikolai Burov <nikolai.burov@jolla.com>
> 
> Add support for the power domains found in the MediaTek MT6858 SoC.
> 
> Signed-off-by: Nikolai Burov <nikolai.burov@jolla.com>
> ---
>   drivers/pmdomain/mediatek/mt6858-pm-domains.h | 462 ++++++++++++++++++++++++++
>   drivers/pmdomain/mediatek/mtk-pm-domains.c    |   5 +
>   drivers/pmdomain/mediatek/mtk-pm-domains.h    |   5 +
>   3 files changed, 472 insertions(+)
> 
> diff --git a/drivers/pmdomain/mediatek/mt6858-pm-domains.h b/drivers/pmdomain/mediatek/mt6858-pm-domains.h
> new file mode 100644
> index 000000000000..6d85835115b4
> --- /dev/null
> +++ b/drivers/pmdomain/mediatek/mt6858-pm-domains.h
> @@ -0,0 +1,462 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * Copyright (c) 2025 MediaTek Inc.
> + *                    KY Liu <ky.liu@mediatek.com>
> + * Copyright (c) 2026 Jolla Mobile Ltd
> + *                    Nikolai Burov <nikolai.burov@jolla.com>
> + */

..snip..

> +static const struct scpsys_domain_data scpsys_domain_data_mt6858[] = {
> +	[MT6858_POWER_DOMAIN_MD] = {
> +		.name = "md",
> +		.sta_mask = MT6858_PWR_ACK,
> +		.ctl_offs = 0xe00,
> +		.pwr_sta_offs = 0xe00,
> +		.pwr_sta2nd_offs = 0xe00,
> +		.ext_buck_iso_offs = 0xf20,
> +		.ext_buck_iso_mask = GENMASK(1, 0),
> +		.caps = MTK_SCPD_MODEM_SECURE | MTK_SCPD_EXT_BUCK_ISO |

MTK_SCPD_MODEM_SECURE_PWRSEQ

After which:

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


> +			MTK_SCPD_KEEP_DEFAULT_OFF,
> +	},

