Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2035ECAAD1
	for <linux-mediatek@archiver.kernel.org>; Wed, 31 Aug 2022 08:23:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8Mz4dI3DuoDdJsFsbFI0PXEuRx3pCPJ5RRlMIXCzq0E=; b=aobyh0AO7qZcBwZeLRDDIsDpgZ
	CD2i092VxPqJsHxp4VoHfKBwhHI34yrxDY9il8aHe3KDhVDCjBet/4Injmuujb2IPFl+wWMNTfi5b
	jS24RLvnJsKp86KdzWlw6LQu5xiCE0a/SUVBDlcxQsjbCLomM4f1/8j21TZBNE2a2rRHsnEeEjIHQ
	3cpJBlofSBHmXhKFH/9dSpEyaW+PJFvxJF6Qfgp+fATvjiQ0Ap5Roi3BLe9P0FhnQkOhEFgiYEPyS
	b4qTd2GAG8CSaV9gUHcF3fydtIyKePrpboI9aEHxTgZA2pY9DyU7qYoJ0acgnWYAM/fAskDksa6Lp
	+jzGNG9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oTJ0X-004ucZ-CG; Wed, 31 Aug 2022 08:23:33 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oTIrm-004qpD-0G; Wed, 31 Aug 2022 08:14:31 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id B6F8F6601A13;
	Wed, 31 Aug 2022 09:14:27 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1661933668;
	bh=MxOD5M65W1GJcNc0Z8B2s/tYrrWG9J/LN9h5lRW6bSU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=iaGCilpQKPcvOdreLUtUnyAO/H8KlaMdDQY5OwiupI4t3Ruht7gtwqhUgexUB9SPV
	 p4okatpOHehg5tuz60UsjxuUuTKp07/aH9d94kH53QPMA/Bkeg0z8oxof/I1XPKUgw
	 J/P5qqUYbelSw0cQUg2qqwljDtPkXqieT86jRDFdBkFhCycZOXOaTKBebwT8PpF6h5
	 AxxrV3K60UmDTdA9mzSlWdXHYBCBmFS6MOSp2IkWcskFS6tinz73Y1ioLbE8Ic3edB
	 oqooAJiBqGuoYJww0T4/ga0JmNHLFLVEJNhReQmRIMCpVvuhpRff8IDuIbN6o6LyiR
	 X8CTpZsWeNlnw==
Message-ID: <219aef5a-af2a-6873-f682-cb6aef862425@collabora.com>
Date: Wed, 31 Aug 2022 10:14:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
Subject: Re: [PATCH v2 3/7] phy: phy-mtk-tphy: add property to set
 pre-emphasis
Content-Language: en-US
To: Chunfeng Yun <chunfeng.yun@mediatek.com>, Vinod Koul <vkoul@kernel.org>,
 Rob Herring <robh+dt@kernel.org>
Cc: Kishon Vijay Abraham I <kishon@ti.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Eddie Hung <eddie.hung@mediatek.com>
References: <20220829080830.5378-1-chunfeng.yun@mediatek.com>
 <20220829080830.5378-3-chunfeng.yun@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220829080830.5378-3-chunfeng.yun@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220831_011430_229594_A5EA73AC 
X-CRM114-Status: GOOD (  15.51  )
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

Il 29/08/22 10:08, Chunfeng Yun ha scritto:
> Add a property to set usb2 phy's pre-emphasis, it's disabled by default
> on some SoCs.
> 
> Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
> ---
> v2: no changes
> ---
>   drivers/phy/mediatek/phy-mtk-tphy.c | 10 ++++++++++
>   1 file changed, 10 insertions(+)
> 
> diff --git a/drivers/phy/mediatek/phy-mtk-tphy.c b/drivers/phy/mediatek/phy-mtk-tphy.c
> index 8ee7682b8e93..986fde0f63a0 100644
> --- a/drivers/phy/mediatek/phy-mtk-tphy.c
> +++ b/drivers/phy/mediatek/phy-mtk-tphy.c
> @@ -72,6 +72,8 @@
>   #define PA5_RG_U2_HS_100U_U3_EN	BIT(11)
>   
>   #define U3P_USBPHYACR6		0x018
> +#define PA6_RG_U2_PRE_EMP		GENMASK(31, 30)
> +#define PA6_RG_U2_PRE_EMP_VAL(x)	((0x3 & (x)) << 30)

Hello Chunfeng,

can you please clarify which SoC is this change referred to?

If I'm not missing anything, there may be a register layout conflict between
one version and the other for T-PHYs, for which, it may be a good idea to add
a PHY version check before allowing to write settings that are supported only
on a specific IP...

Regards,
Angelo


