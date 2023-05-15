Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62F48C77B75
	for <linux-mediatek@archiver.kernel.org>; Mon, 15 May 2023 11:29:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JlJEg01qoVURjhNOM3e0W4VTn7uAsMng05Af35hpTxY=; b=TepAB4ndd6YD9GYEwmJmQHQ1j2
	8UV1QMjVQ1s3pNuEyf0XiUC5KC+KqT3SCuvoRcqb+CFpdM93YjamgFp4tihCZP7WwHn8xhlWdL6t1
	1m9o3LFfIceMpdmkvXZmQTvhQsb9JLVffQfRZxyOhoVXtyHaNu1oyqKfAJQDwx7uxjNJ+PcoU7jUK
	u/tKiJSyXQtI5vQ5yEI0WmH09Dr8u8dEO+xl/Gn8bVtbEG6zVyODEDM5kmECSsKWI9pfr7dmnxay0
	eoqQaiNg6fhH3HOiSPK6TeJjbRxeBxQqHyBANBFkIXQ1yp7iLnr8WQmJinVmciaw1+u20JeOXa08y
	En5Jf0sA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pyWOZ-001ynh-0Q;
	Mon, 15 May 2023 11:29:39 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pyWOW-001ymd-0U;
	Mon, 15 May 2023 11:29:37 +0000
Received: from [IPV6:2001:b07:2ed:14ed:a962:cd4d:a84:1eab] (unknown [IPv6:2001:b07:2ed:14ed:a962:cd4d:a84:1eab])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 3FEC866031D7;
	Mon, 15 May 2023 12:29:32 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1684150173;
	bh=LalSUny/QCaFULSY0Y9gSNVhlJDeYPhrQGuFROWyytw=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=KpKmsN5/9J1wHY56LlCOFpCD6W3pBeBcdtaRkSb9eI40rreAuKsiJ7tbFXfrxRJUI
	 hQMDZaKki177BFrFuCu88KKfHZHTe70Ef/AqqGDw/18eHlpes2ouOx1TmrFxoHN6eB
	 NLL6ceySSM01MGsPrpR4iFJThyppcY1rLJmZSPa8/AvXu3GKSIKlkn5iPfBmIYn6R9
	 DsI0IdM6go9YBf8XhbWr4L1rSkeVPMAHvOJjpbFMOr8b1QjvnYvxKbKY4QRrUUcSZl
	 8Wn+k9Nrs0KrmZItbJ52hS7gFZLD2g2AJ/ceM1clu9XmOmed2nQj6RwGZBBS4K9R20
	 sRiPG+/cHtXOg==
Message-ID: <df8571eb-fba9-0ba7-88d0-1a74114bd73f@collabora.com>
Date: Mon, 15 May 2023 13:29:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: Re: [PATCH 3/6] arm64: dts: mediatek: mt8183: Add
 mediatek,gicr-save-quirk
Content-Language: en-US
To: Douglas Anderson <dianders@chromium.org>, Marc Zyngier <maz@kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: devicetree@vger.kernel.org, linux-mediatek@lists.infradead.org,
 wenst@chromium.org, Eddie Huang <eddie.huang@mediatek.com>,
 Allen-KH Cheng <allen-kh.cheng@mediatek.com>, Ben Ho <Ben.Ho@mediatek.com>,
 Weiyi Lu <weiyi.lu@mediatek.com>, linux-arm-kernel@lists.infradead.org,
 Tinghan Shen <tinghan.shen@mediatek.com>, jwerner@chromium.org,
 Hsin-Hsiung Wang <hsin-hsiung.wang@mediatek.com>, yidilin@chromium.org,
 Seiya Wang <seiya.wang@mediatek.com>, Conor Dooley <conor+dt@kernel.org>,
 linux-kernel@vger.kernel.org
References: <20230511150539.6.Ia0b6ebbaa351e3cd67e201355b9ae67783c7d718@changeid>
 <20230511150539.3.I525a2ed4260046d43c885ee1275e91707743df1c@changeid>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230511150539.3.I525a2ed4260046d43c885ee1275e91707743df1c@changeid>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230515_042936_320835_5E89F6BC 
X-CRM114-Status: GOOD (  14.40  )
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

Il 12/05/23 00:05, Douglas Anderson ha scritto:
> Firmware shipped on mt8183 Chromebooks is affected by the GICR
> save/restore issue as described by the patch ("dt-bindings:
> interrupt-controller: arm,gic-v3: Add quirk for Mediatek SoCs w/
> broken FW"). Add the quirk property.
> 
> Fixes: e526c9bc11f8 ("arm64: dts: Add Mediatek SoC MT8183 and evaluation board dts and Makefile")
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> ---
> 
>   arch/arm64/boot/dts/mediatek/mt8183.dtsi | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/arch/arm64/boot/dts/mediatek/mt8183.dtsi b/arch/arm64/boot/dts/mediatek/mt8183.dtsi
> index 5169779d01df..39545172fce5 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8183.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8183.dtsi
> @@ -709,6 +709,7 @@ gic: interrupt-controller@c000000 {
>   			      <0 0x0c400000 0 0x2000>,   /* GICC */
>   			      <0 0x0c410000 0 0x1000>,   /* GICH */
>   			      <0 0x0c420000 0 0x2000>;   /* GICV */
> +			mediatek,gicr-save-quirk;

Nit: Can you please move this after interrupts?

Thanks,
Angelo

>   
>   			interrupts = <GIC_PPI 9 IRQ_TYPE_LEVEL_HIGH 0>;
>   			ppi-partitions {



