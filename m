Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2563EC83F07
	for <linux-mediatek@archiver.kernel.org>; Mon,  7 Jul 2025 14:46:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rZZi15u78xWjE8eOLKYH9pW+LXsfU7gPY9Jg21rNbP0=; b=WmxI0A7TZarbmmqqUNd9CmokY/
	AhCSjmp8Q9X5lWw7CvND999bXm0zqsUnSLl7zphdtFQqMH4ZUcf9c0BU/lXkVjnhF0NfnOz5AwDdq
	zf6FWiFt4nyWPIEzwCR4kj0SXYAL6naw69J4/4wUCpNLyw8swg/aS5LVFqlOEO88YCQW+TSkhCACr
	eF4oLH2IbhmxWxzYWeZuzE3KZh8N9wWh/nl0fZNE2zytf5Bg5902vD0F3lNRORbEgaX3tro/gJjy6
	Cc+U412qMsHumNGHq2vqAO6VQFHYvJrT8Cq/GOZbwGGY3HB4EWrnbHMTbuRKVjJi34og8nWNdGvmH
	NIF9C9LA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYn6p-00000002kgq-0YZN;
	Mon, 07 Jul 2025 14:46:19 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYmvj-00000002iwh-2hpN;
	Mon, 07 Jul 2025 14:34:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1751898890;
	bh=ftgI7JOkFf+HQ0//LRt4z8im+TRZqPx40imRxqmB1Mk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=naKIiZf5NiWjA2XQ3IkD/fX1kn263RI17ts/5z/z5SRvSIhlNoup37rlEpyZClC6Y
	 yzq/lzhLqDn7AnjqUQ6yrIjMuIMBK5D12CFHtllezSV8/8nJi3Gp13DX9eOPuac58C
	 xZyBp4Gp8RejqTOAHWXsjtxcVwJ7/43kwdS4fqWNoajXh+zv+6WEON5agInGpRY5A8
	 j1RXudoQi8wtvYnUwBNnk/eFc7NORQJzOWHumy3l3DKhBP68qazCI0UHRHP7DN26yp
	 TxwA7cTY5Nj5/bBFvtCKmxHxBw5hcK/CZPVmUmFEYZyYA44MPx8BhrU9AYRJ39MCvY
	 89gIhmUGXdScw==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id D225217E0A28;
	Mon,  7 Jul 2025 16:34:49 +0200 (CEST)
Message-ID: <1c82e387-9d98-4967-bfe9-947238ee2a0f@collabora.com>
Date: Mon, 7 Jul 2025 16:34:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: defconfig: enable XSPHY driver
To: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Cc: linux-mediatek@lists.infradead.org, kernel@collabora.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20250707-mtk-defconfig-usb-phy-v1-1-4a5dd0d26402@collabora.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20250707-mtk-defconfig-usb-phy-v1-1-4a5dd0d26402@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250707_073451_829830_F4805C76 
X-CRM114-Status: UNSURE (   7.66  )
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

Il 07/07/25 16:28, Nicolas Frattaroli ha scritto:
> The mediatek XSPHY driver is required on mt8196 for working USB support.
> Enable it in the defconfig.
> 
> Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



