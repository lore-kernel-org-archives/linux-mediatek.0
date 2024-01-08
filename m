Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE9FDC3DA6E
	for <linux-mediatek@archiver.kernel.org>; Mon,  8 Jan 2024 10:12:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject
	:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YTByeeBisx+kAXBWal5SD/VDzVDsY0aOC3A+ZIzlKwo=; b=H5G7Kb8s0AW44x
	hcbnpty1PxGcjhNkWnTx8oi0EsOrxFHNcLh/KnVWgR+vwg/kUzTEBJjMJcnCNEPifF9c0JnAyQVfZ
	3OxlNZz27hs5EhWcfsgoXw3dN3L3HZezLk3JWUDnjpQ6mVi3KIXXZO2XIDQcjkjUrkmIv9STpqxSA
	vCf2iBnzLI+NrI+mTIxz8jdVOcSMe00g99FP6xEVcqSB2H4hl9W5lByEzO/+kjUKzINrrTIlJsT3W
	ML5v+5oZ6yW6ttrL0HDTtRfv7sCDfw8ut+OqAOkIMdQNKVusGBunW8jpE5mCSC33MjbafuHGNdrl5
	3FDLaB4DYJfzLDrUgtjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rMmcV-004Zae-2q;
	Mon, 08 Jan 2024 10:12:35 +0000
Received: from madrid.collaboradmins.com ([46.235.227.194])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rMmcS-004Za1-1q;
	Mon, 08 Jan 2024 10:12:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1704708748;
	bh=CUvDS7z0vaI7dKOLj6bDMDn82Ts3BKg1N9K5vuqjjVo=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=KxIykQWJv9qPHoTN685bsqx/ZvJpaW5HT8TW6IaaeOu3furkgK8e+B7jfcScu7RSA
	 EKmbZB1w5OdbHcw3FqdgvDKlVGt/6bNy5MsdggYfaxC7F6HZVnmSng1QvKSb6DetyC
	 WjPLWzFktbECWAJ63+a8AE8pCwxu9BvHzEihqqJZAbToHzCMzyyI3fyjI5UHKqeuhc
	 JjjSb+q66rQ51PdjzYsbrceEC4Z8vCdg5Z/oAsHOi95POXNHNl7cViQc2QxzkSObYu
	 4C6IG/dcUKEONXLAl5o3gaF2EAmF9xK3Yy7DpswnX19IqcoSC5barSp7J7pYath7rw
	 BHyJS4FCMYgVw==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id A4CDC3780625;
	Mon,  8 Jan 2024 10:12:27 +0000 (UTC)
Message-ID: <717a21bb-de39-4f7d-913c-f2a20d8b02bd@collabora.com>
Date: Mon, 8 Jan 2024 11:12:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] clk: mediatek: add infracfg reset controller for
 mt7988
Content-Language: en-US
To: Frank Wunderlich <linux@fw-web.de>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>
References: <20240105162056.43266-1-linux@fw-web.de>
 <20240105162056.43266-3-linux@fw-web.de>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20240105162056.43266-3-linux@fw-web.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240108_021232_770355_B123C915 
X-CRM114-Status: GOOD (  17.08  )
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
Cc: devicetree@vger.kernel.org, Sam Shih <sam.shih@mediatek.com>, Daniel Golle <daniel@makrotopia.org>, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Il 05/01/24 17:20, Frank Wunderlich ha scritto:
> From: Frank Wunderlich <frank-w@public-files.de>
> 
> Infracfg can also operate as reset controller, add support for it.
> 
> Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
> ---
>   drivers/clk/mediatek/clk-mt7988-infracfg.c | 20 ++++++++++++++++++++
>   1 file changed, 20 insertions(+)
> 
> diff --git a/drivers/clk/mediatek/clk-mt7988-infracfg.c b/drivers/clk/mediatek/clk-mt7988-infracfg.c
> index 8011ef278bea..1660a45349ff 100644
> --- a/drivers/clk/mediatek/clk-mt7988-infracfg.c
> +++ b/drivers/clk/mediatek/clk-mt7988-infracfg.c
> @@ -14,6 +14,9 @@
>   #include "clk-gate.h"
>   #include "clk-mux.h"
>   #include <dt-bindings/clock/mediatek,mt7988-clk.h>
> +#include <dt-bindings/reset/mediatek,mt7988-resets.h>
> +
> +#define	INFRA_RST_SET_OFFSET	0x80
>   
>   static DEFINE_SPINLOCK(mt7988_clk_lock);
>   
> @@ -249,12 +252,29 @@ static const struct mtk_gate infra_clks[] = {
>   	GATE_INFRA3(CLK_INFRA_133M_PCIE_CK_P3, "infra_133m_pcie_ck_p3", "sysaxi_sel", 31),
>   };
>   
> +static u16 infra_rst_ofs[] = {
> +	INFRA_RST_SET_OFFSET,
> +};
> +
> +static u16 infra_idx_map[] = {
> +	[MT7988_INFRA_RST0_THERM_CTRL_SWRST] = 0 * RST_NR_PER_BANK + 9,

The MT7988A datasheet says that INFRA_RST0 bit 9 is CONN2EMI_M0_GALS_SLV_SWRST, so
this is wrong: THERM_CTRL_SWRST is in the RST1 register, bit 9.

Also, I'm sure that you really want to add the PCIe MAC reset bit as well, to be
used with the PCIe driver...

[MT7988_INFRA_RST0_PEXTP_MAC_SWRST] = 0 * RST_NR_PER_BANK + 6,
[MT7988_INFRA_RST1_THERM_CTRL_SWRST] = 1 * RST_NR_PER_BANK + 9,

Enjoy... :-)

Cheers,
Angelo


