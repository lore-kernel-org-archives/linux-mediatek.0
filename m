Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78252C433FE
	for <linux-mediatek@archiver.kernel.org>; Mon, 10 Oct 2022 08:27:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JVi/5fFdmMhGgg6iup6tp6e6/nDo5XF6ufjcWs1BxqM=; b=4A1eV7I6ZL9Lnkc3xgkAb4ANEH
	II4hHvU9qz3oSG4/8Rfbc5aNWzb2WS8CxQo8FJ/u6/t8asr5xud5arP8g2744DXlvz00WDqqvQ2Kk
	ctspgEKETj1MhfRgUgOx78LDjj+8SHKPGZJB8nGrFqAG+XwCc2Ck74XYrqacVShP/DoWQr3+z8fq0
	gQwS4q0siSDedjeeKQMK+eqBIo5Vm4Cc1HSy+qOSI10TJzmgdF0EJ/ZbI9Qm2l8sXhe6MtdE1OmWs
	eAYf+LkuoquE9uk2PlNY22/811TMfh0vfbHuCpLlPaHdVn6MT2GWjPcAbnNYC9qbxkmQPqjxaHKjt
	+bK9NRLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oho8M-00Hb7N-Ae; Mon, 10 Oct 2022 08:27:34 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oho81-00Hb0y-3R; Mon, 10 Oct 2022 08:27:14 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 3802666022A5;
	Mon, 10 Oct 2022 09:27:11 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1665390431;
	bh=wMMy9Yav9HmoUJlZAx9akLCFU2KdLfeAUhpMVrwFH/Y=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Sxad4tuFxuVIkgMVt9CqTFE5vIsTRHqvVSPAJBslqu7/AoAHGHkxRq8h6eoxqYc8N
	 qZ6d8zH4qUz8pzwZaC9Z0J/kIc1va0s34qbRuB5eYiV0+EEKFFMDA8RE+Tc1ussHsN
	 llBJhUyyU/wsoskWMlh+myWiI3gO9UJDM3MF/lbsi00RQl7tNtRLpVYx5u8LUYrTdr
	 E6aDmvrB7CgFC4d3qRlv/heGf9pCEHC7NsVXVPnvPAuI+iiT0AVEiyuSx+8SVQTfKl
	 6+Nhu/JoRLR6B1ZjK/6a3fuf7Oeo4Oww0P3sPfRL1Jga5UKLlWN9h0oLKV6kcolu66
	 XUi5q2Tw/mXrw==
Message-ID: <20a33876-e7eb-d6aa-748e-2b0e9938506b@collabora.com>
Date: Mon, 10 Oct 2022 10:27:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
Subject: Re: [PATCH 2/2] i2c: mediatek: add mt7986 support
Content-Language: en-US
To: Frank Wunderlich <linux@fw-web.de>, linux-mediatek@lists.infradead.org
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 linux-i2c@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Qii Wang <qii.wang@mediatek.com>
References: <20221009101631.82380-1-linux@fw-web.de>
 <20221009101631.82380-3-linux@fw-web.de>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20221009101631.82380-3-linux@fw-web.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221010_012713_316682_97466914 
X-CRM114-Status: UNSURE (   8.56  )
X-CRM114-Notice: Please train this message.
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

Il 09/10/22 12:16, Frank Wunderlich ha scritto:
> From: Frank Wunderlich <frank-w@public-files.de>
> 
> Add i2c support for MT7986 SoC.
> 
> Signed-off-by: Frank Wunderlich <frank-w@public-files.de>

Verified against u-boot sources for MT7986 located at BPI GIT

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


