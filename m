Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05471EB64D9
	for <linux-mediatek@archiver.kernel.org>; Tue,  4 Jul 2023 10:26:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HJiwEPP7BXRpFJ6/i59huKVeiCkq4u1Ldoe1JsARqpY=; b=WWHtGEp8BUGGW5TzU3iGzMXaRV
	unYgaq91noMXle3lFIS7PUMKhhovB+fm4zr1Uu0rhy+Kf9Ooh5In2gTWsTTQMJoUGSNkgtmaP9tVP
	XEkdh5CNtAjS3Ox8jI49B1RNPc+vdxkXOW31OVEdQdTvs7zj9p0R4mKfbrmy0e25GcTkhRVsYckbl
	5dW9ElBJ99FNqUU0a8rLF1r6UoVdEmkiDHOXnSju+mytcFe0W7C9HvuLwBlrcYwNwV+l/iyq+H/fw
	PoAMIF1VM17lTnpLRpuPkYMJrqdGY3nB4LO4iGWFqX2AIwFgMjpIX6zm4iOcxkwf/Pd/SV329slru
	xx65n9Nw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qGdEL-00Crzb-0e;
	Tue, 04 Jul 2023 10:25:57 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qGdEG-00CruY-1s;
	Tue, 04 Jul 2023 10:25:53 +0000
Received: from [IPV6:2001:b07:2ed:14ed:c5f8:7372:f042:90a2] (unknown [IPv6:2001:b07:2ed:14ed:c5f8:7372:f042:90a2])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 79EC26606FA4;
	Tue,  4 Jul 2023 11:25:38 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1688466339;
	bh=OK1hVnQx2+QUut5ekc5MMXkV5OBtCioWQbQvC+CYWOk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=AAvx7lsehf+CnXxI5/sKpl2B5gtl72kS9T7gr//4AF3eLhN9/q+jS4IaO3wUGZIId
	 wAY67Qm+rGP4bAHSmoc8YiH4XNn3ZGQL1orgBhzNIf/C/UmQbAHlewEvgEgjQXH81G
	 w1RXBoXgIcachDJ2kCxNjPFcFxV30FhwjDbDjbvj/Cqa6Qlp2DjDJxvPiLCOjUz1Yg
	 6oTz+1M9Z5iftOxrUl6pk1y3I8YJykugGeuVy0zSQP3U18A87MUSvPJk5WI06+gh8U
	 goqnrgntzicd0wfPgqinNDdDznm5Ib5x8gQfP/k00B5nL7SX4Ywvg+KBlxcb6pLdKP
	 3dL7OYFfji1sA==
Message-ID: <59b1b17b-64f8-1f60-7206-4d0a03e4eecb@collabora.com>
Date: Tue, 4 Jul 2023 12:25:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v6 3/8] soc: mediatek: pm-domains: Split bus_prot_mask
Content-Language: en-US
To: Markus Schneider-Pargmann <msp@baylibre.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
Cc: Chun-Jie Chen <chun-jie.chen@mediatek.com>,
 Tinghan Shen <tinghan.shen@mediatek.com>, Fabien Parent
 <parent.f@gmail.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
References: <20230627131040.3418538-1-msp@baylibre.com>
 <20230627131040.3418538-4-msp@baylibre.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230627131040.3418538-4-msp@baylibre.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230704_032552_749642_CEF63D70 
X-CRM114-Status: GOOD (  16.30  )
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

Il 27/06/23 15:10, Markus Schneider-Pargmann ha scritto:
> bus_prot_mask is used for all operations, set clear and acknowledge. In
> preparation of m8365 power domain support split this one mask into two,
> one mask for set and clear, another one for acknowledge.
> 
> Signed-off-by: Markus Schneider-Pargmann <msp@baylibre.com>
> ---
>   drivers/soc/mediatek/mtk-pm-domains.c | 24 ++++++++++++++----------
>   drivers/soc/mediatek/mtk-pm-domains.h | 14 ++++++++------
>   2 files changed, 22 insertions(+), 16 deletions(-)
> 
> diff --git a/drivers/soc/mediatek/mtk-pm-domains.c b/drivers/soc/mediatek/mtk-pm-domains.c
> index aa9ab413479e..c801fa763e89 100644
> --- a/drivers/soc/mediatek/mtk-pm-domains.c
> +++ b/drivers/soc/mediatek/mtk-pm-domains.c
> @@ -123,18 +123,20 @@ static int _scpsys_bus_protect_enable(const struct scpsys_bus_prot_data *bpd, st
>   	int i, ret;
>   
>   	for (i = 0; i < SPM_MAX_BUS_PROT_DATA; i++) {
> -		u32 val, mask = bpd[i].bus_prot_mask;
> +		u32 val;
> +		u32 set_clr_mask = bpd[i].bus_prot_set_clr_mask;
> +		u32 sta_mask = bpd[i].bus_prot_sta_mask;
>   
> -		if (!mask)
> +		if (!set_clr_mask)
>   			break;
>   
>   		if (bpd[i].flags & BUS_PROT_REG_UPDATE)
> -			regmap_set_bits(regmap, bpd[i].bus_prot_set, mask);
> +			regmap_set_bits(regmap, bpd[i].bus_prot_set, set_clr_mask);
>   		else
> -			regmap_write(regmap, bpd[i].bus_prot_set, mask);
> +			regmap_write(regmap, bpd[i].bus_prot_set, set_clr_mask);
>   
>   		ret = regmap_read_poll_timeout(regmap, bpd[i].bus_prot_sta,
> -					       val, (val & mask) == mask,
> +					       val, (val & sta_mask) == sta_mask,
>   					       MTK_POLL_DELAY_US, MTK_POLL_TIMEOUT);
>   		if (ret)
>   			return ret;
> @@ -160,21 +162,23 @@ static int _scpsys_bus_protect_disable(const struct scpsys_bus_prot_data *bpd,
>   	int i, ret;
>   
>   	for (i = SPM_MAX_BUS_PROT_DATA - 1; i >= 0; i--) {
> -		u32 val, mask = bpd[i].bus_prot_mask;
> +		u32 val;
> +		u32 set_clr_mask = bpd[i].bus_prot_set_clr_mask;
> +		u32 sta_mask = bpd[i].bus_prot_sta_mask;

Only one nitpick: val should be declared after the others....
That's just for readability and nothing else, obviously.

Anyway, after that change:

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



