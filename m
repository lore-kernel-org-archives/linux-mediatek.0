Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66E23C433EF
	for <linux-mediatek@archiver.kernel.org>; Mon, 11 Apr 2022 02:58:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ME51MCvuQanCx9BZfOp5FzboWNMQaM53xLsnwOKvyfU=; b=HN4BJayXYDsAgR
	GLyvczFZglvcMyU8/ZseT5tiytIneoNEHCvocBTijVkU7NUYPD1kp08YztzNDxOUO1CXBvrk72OC1
	VM1Syn4J7X+9mXjKRHJ63S7RSHQSYmtkLVFn4uvnqA/lTO9L8fHZlxojDZtfc2btCaENwUimHWcwx
	J2T0+sGVcJjpLU/gqRjrGvoOGBjR2JgHMLbOWsGqdpykcFu4Ow+SWPCga60FCQNv4B1Njq2VuBZIv
	4iMp8+91zeJyNTNn5P8RbUoXmWqhTFbQ67H2QLD77FWAuf7l/JDYiAS9c2ix6Jfvv7hYoMv96ZR3Z
	i1thFCDmM3WQD/1jGwuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ndkFj-006MKn-T5; Mon, 11 Apr 2022 02:58:07 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ndkFC-006M4e-Pv; Mon, 11 Apr 2022 02:57:36 +0000
X-UUID: 8c80dac8dfd84f3d81fbc3c9c0409fd4-20220410
X-UUID: 8c80dac8dfd84f3d81fbc3c9c0409fd4-20220410
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <tinghan.shen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1108314108; Sun, 10 Apr 2022 19:57:30 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sun, 10 Apr 2022 19:51:42 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3; 
 Mon, 11 Apr 2022 10:51:40 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 11 Apr 2022 10:51:40 +0800
Message-ID: <8c27890e8b33bce333c2f8afaf4b4f893560ca7f.camel@mediatek.com>
Subject: Re: [PATCH v1 1/1] dt-bindings: pwrap: mediatek: fix pwrap document
 for mt8195
From: Tinghan Shen <tinghan.shen@mediatek.com>
To: Zhiyong Tao <zhiyong.tao@mediatek.com>, <lee.jones@linaro.org>,
 <robh+dt@kernel.org>, <matthias.bgg@gmail.com>, <lgirdwood@gmail.com>,
 <broonie@kernel.org>, <eddie.huang@mediatek.com>, <a.zummo@towertech.it>,
 <alexandre.belloni@bootlin.com>, <fshao@chromium.org>
CC: <srv_heupstream@mediatek.com>, <hui.liu@mediatek.com>,
 <hsin-hsiung.wang@mediatek.com>, <sean.wang@mediatek.com>,
 <macpaul.lin@mediatek.com>, <wen.su@mediatek.com>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-rtc@vger.kernel.org>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>
Date: Mon, 11 Apr 2022 10:51:40 +0800
In-Reply-To: <20220411014121.15015-2-zhiyong.tao@mediatek.com>
References: <20220411014121.15015-1-zhiyong.tao@mediatek.com>
 <20220411014121.15015-2-zhiyong.tao@mediatek.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220410_195734_906303_A45811E7 
X-CRM114-Status: GOOD (  15.22  )
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

Hi all,

After discussed with Zhiyong, this patch will be sent together within mt8195 dts series.
It's because this change is related to mt8195 dts pwrap node.

Follow this link for resend version of this patch,

https://patchwork.kernel.org/project/linux-mediatek/patch/20220411022724.11005-2-tinghan.shen@mediatek.com/


Best regards,
Tinghan

On Mon, 2022-04-11 at 09:41 +0800, Zhiyong Tao wrote:
> From: "Zhiyong.Tao" <zhiyong.tao@mediatek.com>
> 
> fix pwrap document description for mt8195
> 
> Signed-off-by: Zhiyong.Tao <zhiyong.tao@mediatek.com>
> ---
>  .../devicetree/bindings/soc/mediatek/pwrap.txt         | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/soc/mediatek/pwrap.txt
> b/Documentation/devicetree/bindings/soc/mediatek/pwrap.txt
> index d74a7a5ae9f2..601647717ceb 100644
> --- a/Documentation/devicetree/bindings/soc/mediatek/pwrap.txt
> +++ b/Documentation/devicetree/bindings/soc/mediatek/pwrap.txt
> @@ -30,20 +30,20 @@ Required properties in pwrap device node.
>  	"mediatek,mt8195-pwrap" for MT8195 SoCs
>  	"mediatek,mt8516-pwrap" for MT8516 SoCs
>  - interrupts: IRQ for pwrap in SOC
> -- reg-names: Must include the following entries:
> +- reg-names: Must include "pwrap", "pwrap-bridge" is optinal.
>    "pwrap": Main registers base
>    "pwrap-bridge": bridge base (IP Pairing)
>  - reg: Must contain an entry for each entry in reg-names.
> -- reset-names: Must include the following entries:
> -  "pwrap"
> -  "pwrap-bridge" (IP Pairing)
> -- resets: Must contain an entry for each entry in reset-names.
>  - clock-names: Must include the following entries:
>    "spi": SPI bus clock
>    "wrap": Main module clock
>  - clocks: Must contain an entry for each entry in clock-names.
>  
>  Optional properities:
> +- reset-names: Some SoCs include the following entries:
> +  "pwrap"
> +  "pwrap-bridge" (IP Pairing)
> +- resets: Must contain an entry for each entry in reset-names.
>  - pmic: Using either MediaTek PMIC MFD as the child device of pwrap
>    See the following for child node definitions:
>    Documentation/devicetree/bindings/mfd/mt6397.txt


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
