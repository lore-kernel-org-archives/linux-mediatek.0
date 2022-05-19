Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A10FAC433F5
	for <linux-mediatek@archiver.kernel.org>; Thu, 19 May 2022 11:19:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qjbrWiafhcj5MI2gFeJQTwx8XJM0zs/J1DszcLMDlIM=; b=fJsWA807fZI8PQ
	XDpY1pgD/1S3httkBqD8PDHwXGAV4bLP1/xDMMagfvqTS0laCEOcQ3FfA/VObK2xBrFB0r8I7BisP
	ckMqqTgtYAvepC/Vjad76RGhdrhPjcowLoHRp4FXsvpDfc5uAakNHtV3QWHSn+wsNb+aOVH/G40s4
	f3KeojNdv6DlLFkAWSfuefTwd9Ak+IaI56P4ifa0/ItRtbTHjdZbNr3MRoiOa6Cexw1Q99eXoMyS2
	cwbWLy6YMLPvoADnu0NGPd9XaVrhvRus90nvq83SXv63Wz7umKOu0SLwI0CqZwtHl9qh+DoFMy4ug
	NAkJOa07IkPQfeFqFCwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nreBG-006RNH-SA; Thu, 19 May 2022 11:18:58 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nreB3-006RG3-Dz; Thu, 19 May 2022 11:18:47 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id 294EA1F45A60
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1652959119;
 bh=8hHuB3iHrcQC4fZoJfLi8hVlnXkttGVOtI+EU+Ln4bY=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=kNIuRzKxMhgD6upJLoGW4KXkvrPyPPNaTjtKrzGhVwZ4+O5k1tWYP5R6kRZ+IYT+J
 +atXn1qrvnV2JlvB0+3tGpNwpFnt9fQSoOUVzuLRYLHZzrvmccL4/8bRhc6UCaZaah
 V+lOKHmNH0nafJ4RlygrDiu1Kt8eC1b1tmkwSreJs4sFZ4VjHkEio+SftcbeswhHF+
 akrlMLbeNQH8eC0AR1pzL4Drni98XU7Ki00K7QqDEYQLWqPpvbeflCMGwi+pRRbyiA
 UgPGV44+4ccNcANnHzuo8BHoV6evaHbLu+EQYtPewZQfaV37MZEljFs/Of5SfxIpFA
 FTa0rCBgWVigw==
Message-ID: <d8de6b98-23a3-1991-8ceb-24098c38c335@collabora.com>
Date: Thu, 19 May 2022 13:18:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH v10 1/3] dt-bindings: mmc: mtk-sd: extend interrupts and
 pinctrls properties
Content-Language: en-US
To: Axe Yang <axe.yang@mediatek.com>, Ulf Hansson <ulf.hansson@linaro.org>,
 Rob Herring <robh+dt@kernel.org>, Chaotian Jing
 <chaotian.jing@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 Adrian Hunter <adrian.hunter@intel.com>
Cc: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
 Satya Tangirala <satyat@google.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Wolfram Sang <wsa+renesas@sang-engineering.com>, Lucas Stach
 <dev@lynxeye.de>, Eric Biggers <ebiggers@google.com>,
 Andrew Jeffery <andrew@aj.id.au>, Stephen Boyd <swboyd@chromium.org>,
 Kiwoong Kim <kwmad.kim@samsung.com>, Yue Hu <huyue2@yulong.com>,
 Tian Tao <tiantao6@hisilicon.com>, linux-mmc@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20220519111323.14586-1-axe.yang@mediatek.com>
 <20220519111323.14586-2-axe.yang@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220519111323.14586-2-axe.yang@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220519_041845_738724_9AD87255 
X-CRM114-Status: GOOD (  17.82  )
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

Il 19/05/22 13:13, Axe Yang ha scritto:
> Extend interrupts and pinctrls for SDIO wakeup interrupt feature.
> This feature allow SDIO devices alarm asynchronous interrupt to host
> even when host stop providing clock to SDIO card. An extra wakeup
> interrupt and pinctrl states for SDIO DAT1 pin state switching are
> required in this scenario.
> 
> Signed-off-by: Axe Yang <axe.yang@mediatek.com>
> ---
>   .../devicetree/bindings/mmc/mtk-sd.yaml       | 53 ++++++++++++++++++-
>   1 file changed, 52 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/mmc/mtk-sd.yaml b/Documentation/devicetree/bindings/mmc/mtk-sd.yaml
> index 2a2e9fa8c188..b068ab67a054 100644
> --- a/Documentation/devicetree/bindings/mmc/mtk-sd.yaml
> +++ b/Documentation/devicetree/bindings/mmc/mtk-sd.yaml
> @@ -72,12 +72,26 @@ properties:
>         - const: ahb_cg
>   
>     interrupts:
> -    maxItems: 1
> +    description:
> +      Should at least contain MSDC GIC interrupt. To support SDIO in-band wakeup, an extended
> +      interrupt is required and be configured as wakeup source irq.
> +    minItems: 1
> +    maxItems: 2
> +
> +  interrupt-names:
> +    items:
> +      - const: msdc_irq
>   

That ain't right. You have two interrupts, so you describe two interrupts:

interrupt-names:
   minItems: 1
   items:
     - const: msdc
     - const: sdio-wakeup

...also, I personally don't like the "_irq" suffix: we're specifying interrupts in
interrupt-names, so it sounds a bit redundant.

You're free to keep it, if you really like it though.

Regards,
Angelo

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
