Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7AB34CCFA13
	for <linux-mediatek@archiver.kernel.org>; Mon, 10 Nov 2025 14:11:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UvdaQiXCxjFQh2GbC8svdb8+Ty/VpPxF16kIVDW7X8k=; b=vRsDBrfHDNo3tAuUZxAOCyz45c
	/rcEJByHIQXo1n5Y0OCpHN4ttOJphKmKrD1OpSvp/5qciBpBhEwNnvtuWCaPwj5a35G6pTAVVEU7F
	WP40S5R8jY8I2407/9JUznD25pnGkUkY7PSKhh9j2+AoygrbqLzw2wafhdSg0Ad7jh5GBHCt7rPb7
	pBjPnNs2Wmb6kttGNZbBw3+CJWvR6CwOp9aFg9f2kSmQak2A0au+Dbxfq6zGIfg2sVkwfkWFuTtxy
	LLYSx5KJw5E75hnkiulBCRCQ79Odli4AbsFu6Qt6QfNKcwnf9cSTWxw3n2uyvuEE892wI610jrqBY
	hBvyNjVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vISbz-00000005YS3-3RqF;
	Mon, 10 Nov 2025 14:11:15 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vISbw-00000005YRc-41S4;
	Mon, 10 Nov 2025 14:11:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1762783872; x=1794319872;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=48QFvVDn/gQXwmUmio9XPnllOgtcyyXloU9GmXy3GXQ=;
  b=ZDg5Zht+M3uHdI+rvTKQCzVxGrvRJfv/4snLp1f1vynfLGFEDXDUeWMZ
   FomnT5jVzOpPsaqMhxCmh2C9BOmimeTnofE7YGJQgeaSsjL0gVD/TsHm4
   ndTw8WtpVGga9Yk9ulVzcUyrwcCtpWfmwdfiLxGNGvO9SkhEAG2wCgZDU
   aiuSJv1eQHd+3mX+aYi5mCVwpXisEmJaK6nQahyk4xLCARY5SEyBidq4l
   HF7g5In6E5xPuzE5gUZPZtA50x4DLacBXs2iwGQAAfZPhjjyQ7VgmsY39
   XQv+qi6y2S+efKI/a6iXHHuah+9iEUclhUC8iSA3U4tKOtDRsGFxul9Sz
   w==;
X-CSE-ConnectionGUID: 7jHQAg5DRaCcnmeaPG7SRg==
X-CSE-MsgGUID: cZ/bQKkfRpi6h9O940oGMw==
X-IronPort-AV: E=Sophos;i="6.19,293,1754982000"; 
   d="scan'208";a="280277302"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa5.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Nov 2025 07:11:09 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.87.151) by
 chn-vm-ex3.mchp-main.com (10.10.87.32) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.2562.29; Mon, 10 Nov 2025 07:10:29 -0700
Received: from [10.159.245.205] (10.10.85.11) by chn-vm-ex04.mchp-main.com
 (10.10.85.152) with Microsoft SMTP Server id 15.1.2507.58 via Frontend
 Transport; Mon, 10 Nov 2025 07:10:23 -0700
Message-ID: <e7ddaff8-0d8a-4d79-a2b1-97aaac524a83@microchip.com>
Date: Mon, 10 Nov 2025 15:10:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 08/13] irqchip/atmel-aic: Simplify with
 of_machine_get_match_data()
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Rob Herring
	<robh@kernel.org>, Saravana Kannan <saravanak@google.com>, "Rafael J.
 Wysocki" <rafael@kernel.org>, Viresh Kumar <viresh.kumar@linaro.org>,
	Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Yangtao Li
	<tiny.windzz@gmail.com>, Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec
	<jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, Lorenzo
 Pieralisi <lpieralisi@kernel.org>, Daniel Lezcano
	<daniel.lezcano@linaro.org>, Bjorn Andersson <andersson@kernel.org>, Konrad
 Dybcio <konradybcio@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Claudiu Beznea
	<claudiu.beznea@tuxon.dev>, Maximilian Luz <luzmaximilian@gmail.com>, Hans de
 Goede <hansg@kernel.org>, =?UTF-8?Q?Ilpo_J=C3=A4rvinen?=
	<ilpo.jarvinen@linux.intel.com>, Daniel Lezcano <daniel.lezcano@kernel.org>,
	Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter
	<jonathanh@nvidia.com>
CC: <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-pm@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>, <linux-sunxi@lists.linux.dev>,
	<linux-arm-msm@vger.kernel.org>, <platform-driver-x86@vger.kernel.org>,
	<linux-tegra@vger.kernel.org>
References: <20251106-b4-of-match-matchine-data-v1-0-d780ea1780c2@linaro.org>
 <20251106-b4-of-match-matchine-data-v1-8-d780ea1780c2@linaro.org>
From: Nicolas Ferre <nicolas.ferre@microchip.com>
Content-Language: en-US, fr
Organization: microchip
In-Reply-To: <20251106-b4-of-match-matchine-data-v1-8-d780ea1780c2@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251110_061113_142792_737434E8 
X-CRM114-Status: GOOD (  17.43  )
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

On 06/11/2025 at 20:07, Krzysztof Kozlowski wrote:
> Replace open-coded getting root OF node, matching against it and getting
> the match data with new of_machine_get_match_data() helper.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Acked-by: Nicolas Ferre <nicolas.ferre@microchip.com>

Thanks Krzysztof, best regards,
   Nicolas

> ---
> 
> Depends on the first OF patch.
> ---
>   drivers/irqchip/irq-atmel-aic-common.c | 15 +++------------
>   1 file changed, 3 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/irqchip/irq-atmel-aic-common.c b/drivers/irqchip/irq-atmel-aic-common.c
> index 3cad30a40c19..e68853815c7a 100644
> --- a/drivers/irqchip/irq-atmel-aic-common.c
> +++ b/drivers/irqchip/irq-atmel-aic-common.c
> @@ -187,20 +187,11 @@ void __init aic_common_rtt_irq_fixup(void)
> 
>   static void __init aic_common_irq_fixup(const struct of_device_id *matches)
>   {
> -       struct device_node *root = of_find_node_by_path("/");
> -       const struct of_device_id *match;
> +       void (*fixup)(void);
> 
> -       if (!root)
> -               return;
> -
> -       match = of_match_node(matches, root);
> -
> -       if (match) {
> -               void (*fixup)(void) = match->data;
> +       fixup = of_machine_get_match_data(matches);
> +       if (fixup)
>                  fixup();
> -       }
> -
> -       of_node_put(root);
>   }
> 
>   struct irq_domain *__init aic_common_of_init(struct device_node *node,
> 
> --
> 2.48.1
> 


