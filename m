Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11C05C4828D
	for <linux-mediatek@archiver.kernel.org>; Tue,  6 Feb 2024 10:31:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JcpXEMS5q8X3MrjViIpcSnvi7m+8n2iVZHzQTU0Azm4=; b=tDkQrmMTwMZJ0S6ksUd1klDyTf
	ipHrMVRE0YXc6Eea43zuvFMn5HiWgUBTRLuhyitpZr8MpECaFrtMqqF24O+SjPKu/z2c34EVaSFee
	l4QRLCoryhUld1X9zmUyqma0bRDCrDFCK/O//isXZaZRyScrSxbspI9IP/iAKr7Q4pyKthjhtx9S3
	zmFmPX4ZfYeuv7WgbGc38lpHOdbkQF5gkdQnEbh2jDEuDCcQlca/7PxI4MGyUKCZ1ySfoafd2fbL1
	3wAl4v1pkTHvQOZ9dMeMtPWjLJzAQxdM93M7FUL45NELvrqm2adK3cc7dEaDL+St6A5PJn/HJoPJO
	hQWN5RoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rXIjJ-000000073Nm-2XC0;
	Tue, 06 Feb 2024 10:31:05 +0000
Received: from madrid.collaboradmins.com ([2a00:1098:ed:100::25])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rXHkQ-00000006i86-3l39;
	Tue, 06 Feb 2024 09:28:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1707211689;
	bh=A4GC26ZvMOKhodYJDqUeGvS/fHc7oz32Zo3RglFVqy4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=ZuUd+Fue2DTUYn81nMSnY9HrH+nWCVRoR4LnDIm5HmZK4+fsBHcspBXbsP9JyW0u/
	 X2Efdk2AC/zoERqxDDw5O3wVfjcBXpBOyfYUYLQgGtRxD5X1WRXpUbkNtTmPtRYaBA
	 buGg7spyDambfAq4WTT+4YZUx/a/OkPxNxlN/bGL8Fzs2FUURqOY8eJU1q/NkYalNu
	 z/O6E5UD7zU1Vyu265Ve/LHqNtwtUdOo26k53cX8HMf1D8hqTh06YsKdm67l1/uFsG
	 m1jst4zG6jgS+GLeuApS2U6zjEHcSH79aNtN665AEmLZItO1Ko0Jaglu6/9PrLQJvP
	 ghtVaIqIAA2kw==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id D2D7F3782039;
	Tue,  6 Feb 2024 09:28:07 +0000 (UTC)
Message-ID: <02f4d6ee-e9f6-4184-a125-091f45bae54a@collabora.com>
Date: Tue, 6 Feb 2024 10:28:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] phy: add driver for MediaTek XFI T-PHY
Content-Language: en-US
To: Daniel Golle <daniel@makrotopia.org>,
 Chunfeng Yun <chunfeng.yun@mediatek.com>, Vinod Koul <vkoul@kernel.org>,
 Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Qingfang Deng <dqfext@gmail.com>,
 SkyLake Huang <SkyLake.Huang@mediatek.com>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, netdev@vger.kernel.org
Cc: Bc-bocun Chen <bc-bocun.chen@mediatek.com>,
 Steven Liu <steven.liu@mediatek.com>, John Crispin <john@phrozen.org>
References: <3251ac3db1a739e0c18ded0a824edae981c1e2df.1707153425.git.daniel@makrotopia.org>
 <2972dfd0b9ca48174fbf49b9d162bac1a12b2331.1707153425.git.daniel@makrotopia.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <2972dfd0b9ca48174fbf49b9d162bac1a12b2331.1707153425.git.daniel@makrotopia.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240206_012811_118267_D61BD4BD 
X-CRM114-Status: GOOD (  13.64  )
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

Il 05/02/24 18:29, Daniel Golle ha scritto:
> Add driver for MediaTek's XFI T-PHY which can be found in the MT7988
> SoC. The XFI T-PHY is a 10 Gigabit/s Ethernet SerDes PHY with muxes on
> the internal side to be used with either USXGMII PCS or LynxI PCS,
> depending on the selected PHY interface mode.
> 
> The PHY can operates only in PHY_MODE_ETHERNET, the submode is one of
> PHY_INTERFACE_MODE_* corresponding to the supported modes:
> 
>   * USXGMII                 \
>   * 10GBase-R                }- USXGMII PCS - XGDM  \
>   * 5GBase-R                /                        \
>                                                       }- Ethernet MAC
>   * 2500Base-X              \                        /
>   * 1000Base-X               }- LynxI PCS - GDM     /
>   * Cisco SGMII (MAC side)  /
> 
> In order to work-around a performance issue present on the first of
> two XFI T-PHYs present in MT7988, special tuning is applied which can be
> selected by adding the 'mediatek,usxgmii-performance-errata' property to
> the device tree node.
> 
> There is no documentation for most registers used for the
> analog/tuning part, however, most of the registers have been partially
> reverse-engineered from MediaTek's SDK implementation (an opaque
> sequence of 32-bit register writes) and descriptions for all relevant
> digital registers and bits such as resets and muxes have been supplied
> by MediaTek.
> 
> Signed-off-by: Daniel Golle <daniel@makrotopia.org>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



