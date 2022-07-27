Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1BC76C04A68
	for <linux-mediatek@archiver.kernel.org>; Wed, 27 Jul 2022 09:37:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RdpIzQi+HOjVeLlleKo9oRctWSlXZHTDQwShZr8scFY=; b=RZhLA06ixis9bdHI+Cy48VTA2f
	IhzMyZ7VfXFeaO8OOyoumDn2NbkfSbVpUBaONNdcp/ZJSFYCQ5rgQELC3aFYMLeFSSm9nvP0ZoJZK
	VwxOErerUn8gWZhsfiIeBm+M0mv0Bu2RQ8qFOwOigJ5Uk3Y7sFLP8WeHmjjHIrkkYgrdzRiI2pS4i
	KzLTK0JeTS30N2+tuBpm3xYcb3nHTtbk+wRAeeDVsUYZ7+y6uaxU9xhBBDgIpTAmE2uME8W+Zw/3B
	pr8/c7U+qr4+OelfvmGYX/RdCpqlkf6Hm9HRMUC2G7UkxTmGVbH0ezjnBEGLtbxUV8bQiOJvXIEN0
	4Eh8PiQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oGdTm-00BrC9-RE; Wed, 27 Jul 2022 09:37:22 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oGdTU-00Br0E-UZ; Wed, 27 Jul 2022 09:37:07 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 969426601B24;
	Wed, 27 Jul 2022 10:37:02 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1658914623;
	bh=aNeE4NIwYGWJ7gmVikW1+br2hiX94QgkF1KjhpADzTA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=NIkq8FAmVhT+As5rqjhYmdrF1jOw3KVT1eGdp/io0BOt0GGmB3eoIcp/QsU21cu59
	 IAQoqrELvegPiAt1mXWDdp5Nh19eap8kOg0a9MzI5OZrjtMuBbANW4fc95LQwjOsoD
	 0lnESPF9T0KAu5c1uvyuxRxAMqehdZaLcXSWt4BwHkAG06/L07FIXTYKMoL+gU+guV
	 GmM1f8/iag7fItPd2syuUSI6/cBpwi/ld07U5ZRdOaHvQKBxSPNbRk7JEcESn9MN5n
	 R4Kq8GLtlPeSx1TgFt7a0ZeUZZh3s0zf3x1FVJmM7uGqBDYul3VeAGgD3N0zpGMYvD
	 H+HY8PX6XBN0g==
Message-ID: <99295c28-af23-2bf4-b2b5-ed39209a1897@collabora.com>
Date: Wed, 27 Jul 2022 11:36:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v15 05/11] drm/mediatek: Add MT8195 Embedded DisplayPort
 driver
Content-Language: en-US
To: Bo-Chen Chen <rex-bc.chen@mediatek.com>, chunkuang.hu@kernel.org,
 p.zabel@pengutronix.de, daniel@ffwll.ch, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, mripard@kernel.org, tzimmermann@suse.de,
 matthias.bgg@gmail.com, deller@gmx.de, airlied@linux.ie
Cc: msp@baylibre.com, granquet@baylibre.com, jitao.shi@mediatek.com,
 wenst@chromium.org, ck.hu@mediatek.com, liangxu.xu@mediatek.com,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-fbdev@vger.kernel.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20220727045035.32225-1-rex-bc.chen@mediatek.com>
 <20220727045035.32225-6-rex-bc.chen@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220727045035.32225-6-rex-bc.chen@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220727_023705_189639_2D63CFAA 
X-CRM114-Status: GOOD (  14.73  )
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

Il 27/07/22 06:50, Bo-Chen Chen ha scritto:
> From: Markus Schneider-Pargmann <msp@baylibre.com>
> 
> This patch adds a embedded displayport driver for the MediaTek mt8195 SoC.
> 
> It supports the MT8195, the embedded DisplayPort units. It offers
> DisplayPort 1.4 with up to 4 lanes.
> 
> The driver creates a child device for the phy. The child device will
> never exist without the parent being active. As they are sharing a
> register range, the parent passes a regmap pointer to the child so that
> both can work with the same register range. The phy driver sets device
> data that is read by the parent to get the phy device that can be used
> to control the phy properties.
> 
> This driver is based on an initial version by
> Jitao shi <jitao.shi@mediatek.com>
> 
> Signed-off-by: Markus Schneider-Pargmann <msp@baylibre.com>
> Signed-off-by: Guillaume Ranquet <granquet@baylibre.com>
> Signed-off-by: Bo-Chen Chen <rex-bc.chen@mediatek.com>

Tested-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

