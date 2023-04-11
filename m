Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F966C76196
	for <linux-mediatek@archiver.kernel.org>; Tue, 11 Apr 2023 08:26:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NpMVQ26rU5BTPQvB4k6vgL3LR86tobUMzTQ23sWUj0Y=; b=dn59ZMN9HO/XN5sPRVCLKWr/9j
	eh1DUTqHB2U8GU+ZhQVU8pdfVwRnjWKlZNr0xUrxq0BNzIArlj0XB80LA3qZqoVJxyhXYzXxVHmt1
	g6UaeGyP5aYXEmKBRJhtaWEbTJzf45HVKNC6YV6iwSa0m4ghaaMnXLpkuydj3TAW5RBkS3rPOuU2A
	ISCQGJkzm+81n9yiX743NOKutGpjC8iBI+/fRVi+vTWNzYhfu5FDAzPZ9Q4AbkBShbtbV1TeQI4+k
	EPG1inLD4aRMjtqTzZ+2OhcZ5fqZJR9tg6amUuvMnsI//9HvF70U7ootuBRV0zZmpxCURsxZbGs5W
	E0BqYtsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pm9Kn-00Gs9d-2C;
	Tue, 11 Apr 2023 08:26:37 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pm9Ki-00Gs60-04;
	Tue, 11 Apr 2023 08:26:34 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 36CC766031E2;
	Tue, 11 Apr 2023 09:26:30 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1681201590;
	bh=tO/aZlkFDq6nWzAF4e3MQD3vaQDUyItkLaIlpliPk3w=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=nFD0BPXq3WU/LbVA9600KAmbN+02q8ST1hWPE+10lYZlnQz0fSYDSu8twYHp5o9Gy
	 pgx+qr1429YjOl9NlgtPLX37gWd68YHrHEluChV7mSkh7OePIBRmxTL/WratyVNlC4
	 rn1cdfWsFgIz8NOhAGN0NLpTB8fg9szPbMrgYeeY7fQ1g6zrDBUscmuHDx/G2LlMOc
	 kXoYk5DcuZTImaB8g3suOyV+bzrdyG+suUvfr/aOWti7tuji7tA/MH6G6Q1zp/nmIh
	 9tCwQX0kAoOVjUH+7bP8f0VHd4cL7z3zXx76zNdACMLhz+erbe9X4Oh9yoxi0GIgsX
	 54uKTZY1GKUkg==
Message-ID: <f7cd5721-3e91-b455-d4bb-9af2775379e3@collabora.com>
Date: Tue, 11 Apr 2023 10:26:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH v3 4/7] arm64: dts: mediatek: add power domain support for
 mt8365 SoC
Content-Language: en-US
To: Alexandre Mergnat <amergnat@baylibre.com>, Yong Wu
 <yong.wu@mediatek.com>, Krzysztof Kozlowski
 <krzysztof.kozlowski@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc: linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20230207-iommu-support-v3-0-97e19ad4e85d@baylibre.com>
 <20230207-iommu-support-v3-4-97e19ad4e85d@baylibre.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230207-iommu-support-v3-4-97e19ad4e85d@baylibre.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230411_012632_183397_8469DA79 
X-CRM114-Status: UNSURE (   8.31  )
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

Il 07/04/23 11:34, Alexandre Mergnat ha scritto:
> The following power domain are added to the SoC dts:
> - MM (MultiMedia)
> - CONN (Connectivity)
> - MFG (MFlexGraphics)
> - Audio
> - Cam (Camera)
> - DSP (Digital Signal Processor)
> - Vdec (Video decoder)
> - Venc (Video encoder)
> - APU (AI Processor Unit)
> 
> Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



