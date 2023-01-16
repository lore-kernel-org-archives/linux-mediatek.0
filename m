Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9FD7C46467
	for <linux-mediatek@archiver.kernel.org>; Mon, 16 Jan 2023 10:41:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pOtwh6w/krx6kkVQzg3TwXx4A+KTNg4AMFEu4Tz84J0=; b=Hjk9LifvSsUz33u15AKe1OGQjA
	z533sQ4f8XKg1mdE20VhXdHM6KwqPqJ9R9XR7MOqqQYHoI2J1MwFYrMp9vs57UKkC574mGtN8ZhrG
	7Ucr3nU5KhIT8+TW13GzUNUdx41Q65HVfuM9znKj8Ci+HSVmMkt3+ppHwSBi3LBwx0R9x8Nwxp87X
	5o4VJdyWo/BNIS/f04QHJ0HPlDAFi/yFTS50BiNQTkEtll2bQfOTuW7aPmIh92+JkDzj1OAjSgNkn
	IggVm+x3S6QqocGEjFJ4Vl4wFuGMG9C11f9Yo7bcR+EFVlqTmvxBKCCugyVq/M7wD46NTUB8VUala
	sqWHZL6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pHMvH-009hzE-Vp; Mon, 16 Jan 2023 10:41:03 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pHMsz-009gnZ-DV; Mon, 16 Jan 2023 10:38:43 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 9E4556602BBC;
	Mon, 16 Jan 2023 10:38:39 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1673865520;
	bh=MJZ8hIGpWIRst0RKUwXcfgQlfIxWHuKlt8Ve6cCdatc=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Fz7Yq4eLkD1ujs7uy2bxt9BmtxdooCGyKLrIDW27LPcX2ZfpnAnumolgILTYLluWN
	 5UqVsYNA/Ggz3Wu+4ATrr8ffyfDJ8JcpMpRDI6dveZAuWPOunlGpABFKfRfvM9WwxX
	 dOiwbLgGHmET9w0WY76jzLTggz+rcP3kdYgNW9BsF//HCMRqRegRLgvIO1iZVEOf+8
	 rW0AiInn9s1lAX17ZmiUayWtKJDApLIAQPtr7pAztrlpCkKFyxfTRczJ9psQaXWATm
	 wFU9eAjq1Dbpejgle5/wqY7bRvOuGu+nGUq2Ghyr3/eYWFb3qn9Z66jsF5gqym1ye6
	 HY9CKAB1PVycw==
Message-ID: <256c2328-a426-a1bf-4f47-1d6c9e706f63@collabora.com>
Date: Mon, 16 Jan 2023 11:38:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v10 2/6] dt-bindings/thermal/mediatek: Add dt-binding
 document for LVTS thermal controllers
Content-Language: en-US
To: bchihi@baylibre.com, daniel.lezcano@linaro.org, rafael@kernel.org,
 amitk@kernel.org, rui.zhang@intel.com
Cc: linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
 khilman@baylibre.com, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, james.lo@mediatek.com,
 rex-bc.chen@mediatek.com
References: <20230112152855.216072-1-bchihi@baylibre.com>
 <20230112152855.216072-3-bchihi@baylibre.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230112152855.216072-3-bchihi@baylibre.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230116_023841_676336_AD6759AB 
X-CRM114-Status: GOOD (  17.97  )
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

Il 12/01/23 16:28, bchihi@baylibre.com ha scritto:
> From: Balsam CHIHI <bchihi@baylibre.com>
> 
> Add dt-binding document for mt8192 and mt8195 LVTS thermal controllers.
> 
> Signed-off-by: Balsam CHIHI <bchihi@baylibre.com>
> ---
>   .../thermal/mediatek,lvts-thermal.yaml        | 140 ++++++++++++++++++
>   1 file changed, 140 insertions(+)
>   create mode 100644 Documentation/devicetree/bindings/thermal/mediatek,lvts-thermal.yaml
> 
> diff --git a/Documentation/devicetree/bindings/thermal/mediatek,lvts-thermal.yaml b/Documentation/devicetree/bindings/thermal/mediatek,lvts-thermal.yaml
> new file mode 100644
> index 000000000000..43b8777fc1b2
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/thermal/mediatek,lvts-thermal.yaml
> @@ -0,0 +1,140 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/thermal/mediatek,lvts-thermal.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: MediaTek SoC Low Voltage Thermal Sensor (LVTS)
> +
> +maintainers:
> +  - Balsam CHIHI <bchihi@baylibre.com>
> +
> +description: |
> +  LVTS is a thermal management architecture composed of three subsystems,
> +  a Sensing device - Thermal Sensing Micro Circuit Unit (TSMCU),
> +  a Converter - Low Voltage Thermal Sensor converter (LVTS), and
> +  a Digital controller (LVTS_CTRL).
> +
> +properties:
> +  compatible:
> +    enum:
> +      - mediatek,mt8192-lvts-mcu
> +      - mediatek,mt8192-lvts-ap

I agree, MT8192 has LVTS... but you don't have it in the driver?
I don't think that it would be much effort to just add it to the commit that
adds the driver itself... otherwise, even though bindings are describing the
hardware and not the drivers, I, personally, don't really like to see the
binding advertising mt8192 mcu/ap while it's not really supported in the driver.

Regards,
Angelo

