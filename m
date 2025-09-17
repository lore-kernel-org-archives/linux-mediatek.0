Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A460DCA0EE8
	for <linux-mediatek@archiver.kernel.org>; Wed, 17 Sep 2025 09:02:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qSIFMTHzTIvKagx0fnMFrPNyFA9b9tvSmyLhS/Ydg34=; b=hertC/C4wkKu/cEvTe1C+c+xIN
	GXmuWJYJQcnEZHCw5aMJ/OhfVw9LJ7SQxDFbVj7nTyvoSiq8finrFZ8cit/u5VLxdfMLNydwZ0+sH
	rK3+mMnAdx4ENx1HDyeLrbKKb9XohaAGAK7VrVzU/QBAhVttBKUqi1Wmz07BnR43WrlcC8I3I++++
	inlHyQia1gr0q/Jfs+WWs1CNDmsUYoEaSzyNevpzFp7EzBNP47jG2qYxToZSsx8id43PrFOeNA2eS
	j2CHhBPYjp0S7K7vKdltxFOmDy8RO3ItjkYSUh4q+SjmMDtRi8c1mExkyINkyEyYAFVeGJF6I8WTh
	B42EF98w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyo3f-0000000AjNU-2c2b;
	Wed, 17 Sep 2025 09:02:35 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyo3c-0000000AjMv-250d;
	Wed, 17 Sep 2025 09:02:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1758099748;
	bh=3I0xAujrqXNySvA/jSJripSl2wkgTi/oVKNIpzfHs9M=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=I1mEL4GLjKOLZ+oD5m3q+2PtWZkCh/9PCnI1oZipqtsmQD8jAHOrbVIn1YLWaYvxx
	 rHVLBrGXicm0PZ8z27I/HuQYNXClfsHKunUbNFwih5wKnUJGIFhOO4MwPzNAXziPxL
	 IyY8iaIpTarkTausOqGxDoGDqMv9yEOPQof9L3hoMjKlUFiU9Uu2s94u43VUNT1Y5g
	 N6OzPJ+32KLoy+vMrcjc2iSkTFAOA98Rye8nNXUGdcion8S8BNvC2CZr1OA6Ttet4j
	 lqSxcvB2DHZq39ruAEmANP/YuTZknEnlZiNsWCDCsh0LZO1tNIYq3Hv7/FVFdT8BzA
	 0u6wMHNgvQEDA==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 46C1417E0AC3;
	Wed, 17 Sep 2025 11:02:28 +0200 (CEST)
Message-ID: <d1c26107-6365-4681-9f7f-5a8bbb2ba08b@collabora.com>
Date: Wed, 17 Sep 2025 11:02:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] spi: mt65xx: add dual and quad mode for standard spi
 device
To: Tim Kuo <Tim.Kuo@mediatek.com>, Mark Brown <broonie@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: linux-spi@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 Steven Liu <Steven.Liu@mediatek.com>, Sky Huang <Skylake.Huang@mediatek.com>
References: <20250917055839.500615-1-Tim.Kuo@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20250917055839.500615-1-Tim.Kuo@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250917_020232_730680_75DE03EC 
X-CRM114-Status: UNSURE (   7.87  )
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

Il 17/09/25 07:58, Tim Kuo ha scritto:
> From: "Tim Kuo" <Tim.Kuo@mediatek.com>
> 
> Mediatek SPI hardware natively supports dual and quad modes, and these
> modes are already enabled for SPI flash devices under spi-mem framework
> in MTK SPI controller spi-mt65xx. However, other SPI devices, such as
> touch panels, are limited to single mode because spi-mt65xx lacks SPI
> mode argument parsing from SPI framework for these SPI devices outside
> spi-mem framework.
> 
> This patch adds dual and quad mode support for these SPI devices by
> introducing a new API, mtk_spi_set_nbits, for SPI mode argument parsing.
> 
> Signed-off-by: Tim Kuo <Tim.Kuo@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



