Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 593BEFA373D
	for <linux-mediatek@archiver.kernel.org>; Thu, 27 Oct 2022 08:02:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kPjdyBntLLDTsh6LPDdPIAJRCjha2D+VMpsBqpb5nJA=; b=yo76icHjIMvOM5z/btJMr2LMew
	236VjjchLBz8zgLMlenBJl4zF+GybH5gCeq6BvdhFdu6+Hw7KasW6/gXm+w5zg5Npa0cdHHucjf6C
	V6VebqSQ/NXqgGlYeiVSf2nD+/Q/yCPEfroDb7ynMt3HU5+H8FOIH9MVBK4sBSpf5ApDAdoNykmNV
	w/JuNRQP7RWN3NCM/K4Q8rc3DGpaswuNrVCE2ZDlAKbPG3FLdtFjFTHMvF9OcQNrgCYEX0RB21O0e
	+JXCQs2L9bDbYvDtPiNTiV6JUS6RfmWAytBmUxTpY3xVOb1hPBMt60zTDOCTOFpUdw2zzQSqO5cOD
	qfb8h5Hg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1onxqD-00CHWt-TC; Thu, 27 Oct 2022 08:02:17 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1onxpw-00CHPO-TW; Thu, 27 Oct 2022 08:02:02 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 57CC666028B1;
	Thu, 27 Oct 2022 09:01:53 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1666857714;
	bh=yO43O0Ij5pmMAVoNrtoBuu/v1iop62RTKlB3zDlmtFI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=fnfBf668GgwNgOd61OHpD1e7l3E3f/czncjPulg7zCxCDAKPTVLIz4/fWOFQnTL5c
	 BZuGegg9913uoUEJD0IYYGpH+8W6eFKz8auaO3HuNq68UGmIHoVIdvBuM3iS1k3uDn
	 zvna4RQVZFCV+rIh30aTcK1Oxtc7M7/mkjddsWbXSWIuQpUcq6D3B9iUU1eiI/LeZe
	 uFkrQL7B1oh0qh0sl+T3PUjUc16M+3oVx84S4WCxK9HuT7zUiyWqw+7KQ008hNMSoy
	 qBWbvWppyFcYub0uosEEgHQlvsfHkI3rct0+qq1KTKGOddIiOX6wfuXkPfFa+mIPce
	 k3pz8oJHAokEg==
Message-ID: <49dda9b5-9b19-81f6-46fe-3264c210d76a@collabora.com>
Date: Thu, 27 Oct 2022 10:01:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.3
Subject: Re: [PATCH v5 4/6] arm64: dts: mt8183: drop drv-type from mmc-node
Content-Language: en-US
To: Frank Wunderlich <linux@fw-web.de>, linux-mediatek@lists.infradead.org
Cc: devicetree@vger.kernel.org, Ulf Hansson <ulf.hansson@linaro.org>,
 Wenbin Mei <wenbin.mei@mediatek.com>, Sam Shih <Sam.Shih@mediatek.com>,
 linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, linux-arm-kernel@lists.infradead.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Chaotian Jing <chaotian.jing@mediatek.com>
References: <20221025132953.81286-1-linux@fw-web.de>
 <20221025132953.81286-5-linux@fw-web.de>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20221025132953.81286-5-linux@fw-web.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221027_010201_120765_0F457CE8 
X-CRM114-Status: UNSURE (   8.24  )
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

Il 25/10/22 15:29, Frank Wunderlich ha scritto:
> From: Frank Wunderlich <frank-w@public-files.de>
> 
> This property is not defined in binding and driver.
> 
> Fixes: cd894e274b74 ("arm64: dts: mt8183: Add krane-sku176 board")
> Signed-off-by: Frank Wunderlich <frank-w@public-files.de>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



