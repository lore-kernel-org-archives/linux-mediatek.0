Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52665C88E5C
	for <linux-mediatek@archiver.kernel.org>; Wed, 16 Sep 2026 10:38:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=afzDQkWCM1UrVIWCB7uZ9l1LLYbZ4/y/LSYbWzKvuYs=; b=PACfOWbdKFNcnG5cLelV7Ra9ER
	OzL4eY8O6c21nR6//HQ7+Oyfu9iHoeIXwIq4Vk7JYO+glrQepnuUwEs+LWxlCFLZH22YCIWQvLIEU
	FuRnvwA70UcsCEOI3PTM7k4uJA/28uHe2n21HKQwO3VRitBSc4Q2r0G+Om72Sag61op3APdrm8Db/
	q+8BCMq29L/swQ0Pfr86G6cVWHOk/vSnpswAZNbq3E5cBNMa4nZuiqP503kaH9lKwfmqdoO5Oas4O
	s83UprFbs3mBgI/tPUH4viVq3kex7tkgFSXRRKZW/0sMozC0Fj46zz5PnX6dBCZjnZEMapUH2bhcK
	rrzGcJ7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6n2U-00000008zVQ-00IC;
	Wed, 16 Sep 2026 10:38:54 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6n2R-00000008zUL-3p4i;
	Wed, 16 Sep 2026 10:38:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1789555129;
	bh=wlK7T+thxGW2u82RLGOMg5hccJ0lex45IGnPBtdSf+0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=XDkcVR4fSHHhOs1N1vcHFg47P3vFhftFp6pUVCKCejhDlKhHl0YV2j4ccwYKtB78D
	 VE5OdeUcSdGfZ8Og+BySib3uUH6sJ4QtT6DEv2KTrcmfnHc7BNgVkUvCy2cr9byTyi
	 nsZbCe+KDJDncoB+lP1hhb9oMqt+XmtKdaYTu+NH3sXM0iF+zp1SFPj0ds+Zrxyefu
	 QKrNRLv21aRh8WJdFFW4r4now/D/7afQ2a/L6llIqLA+Mb/FXJDSvsEKGvLmm3Sz6C
	 kVzGcYE93SZ8m844omREpFeZLOn+A/dxODdiOLNCH45wnOJIPf6ABjv5Vo7SvOrK96
	 DSC0PFNcQM2sA==
Received: from [100.64.1.21] (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange x25519)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id EC37317E0420;
	Wed, 16 Sep 2026 12:38:48 +0200 (CEST)
Message-ID: <bcd66bb6-d7f0-4c31-b527-c1b710df3909@collabora.com>
Date: Wed, 16 Sep 2026 12:38:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] phy: mediatek: xsphy: add eUSB2 repeater support for
 USB2 ports
To: Julien Massot <julien.massot@collabora.com>, kernel@collabora.com,
 Chunfeng Yun <chunfeng.yun@mediatek.com>, Vinod Koul <vkoul@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260826-mtk-usb2-repeater-usb2-v1-0-e8e48e2fd6d8@collabora.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20260826-mtk-usb2-repeater-usb2-v1-0-e8e48e2fd6d8@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260916_033852_097782_F9B0AD02 
X-CRM114-Status: GOOD (  11.67  )
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

On 8/26/26 14:38, Julien Massot wrote:
> Some USB2 PHY ports are connected to an external eUSB2 repeater chip
> that sits between the PHY and the USB connector. To support such
> configurations, this series adds an optional phys property to the
> MediaTek xsphy port sub-node and integrates the repeater into the USB2
> PHY init, exit and mode handling.
> 
> The binding follows the same pattern as the Synopsys eUSB2 PHY, which
> already uses a phys property at the sub-node level to reference an
> external repeater. The driver change similarly manages the repeater PHY
> alongside the MediaTek USB2 PHY.
> 
> Signed-off-by: Julien Massot <julien.massot@collabora.com>

Series is

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

Cheers,
Angelo

> ---
> Julien Massot (2):
>        dt-bindings: phy: mediatek,xsphy: add optional repeater phys property
>        phy: mediatek: xsphy: add optional repeater support for USB2 ports
> 
>   .../devicetree/bindings/phy/mediatek,xsphy.yaml    |  5 +++++
>   drivers/phy/mediatek/phy-mtk-xsphy.c               | 26 ++++++++++++++++++++--
>   2 files changed, 29 insertions(+), 2 deletions(-)
> ---
> base-commit: 917df6be58562d024374b4076e6e7618876a0c4a
> change-id: 20260826-mtk-usb2-repeater-usb2-7d5bad6afce8
> 
> Best regards,


