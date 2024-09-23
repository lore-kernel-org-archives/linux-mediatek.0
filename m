Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6C6ACF9C71
	for <linux-mediatek@archiver.kernel.org>; Mon, 23 Sep 2024 08:42:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=h3NHiz5LFGdaMdwKqUkEmFWEXWZKJIwAQAFp2oWwr/0=; b=34F76QC1sGn0V4j00OHXM5cbkd
	aS9/4ju1wWcZP1P9ijyI7MB9MszbEh/jewzQQQ1pupW9OKDtYRJMz/7iXF3Lg4MaPL9Bm48ZqVAI3
	IZoB1hNbQi305BN50zF9cNOeOEhlUjXsaHLgeiAa5ZUMDjeIiUZgHQvosCHf9P3SS0AMA3dh71c21
	SqBZouWE3sGyqQ9l/jGUz8D3YReQe9KzNVPDr2PO7uOkbQdADrJvEC9Ac+kgpSZjyqD5i+KgAeHtF
	KafVk0LJKGc5pnlpxr9lDWXcay59RijzeC+DWWvdeAodlf27towx+els9gymCj4k8UaXloTOhbkxd
	OX5sKP/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sseef-0000000GhkK-2sS3;
	Mon, 23 Sep 2024 08:42:49 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1ssebh-0000000GhJP-0gtE;
	Mon, 23 Sep 2024 08:39:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1727080783;
	bh=bSnbgZUAu2nk9hGR+H3RrZqnwocCi9HL5rpRcPXtGaI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=JkzibY8yNoTP0KVx9uvdQYEKOluf/YYmnFnjWXH9RkneDbndgYynZYAtEgd3JDo4+
	 1iLmgiTGCcZyz24ISK1uM9G1+G9+VR/4jX6qADGbfXGSiL4vK5cLYeFv4OiPaYA5Wz
	 sHWpRtI0o899VRGs6shQ9/z5cDA6PW/m+vmj2EAIpfVmHOmlL5tpmapKkpE29JioCa
	 y2zj87+GisB5Y36KWf/f3dFD4JolE8beUs7dddk68Rmo6pUzyy7XFztVv42mA1v/bi
	 x7CJHSQErAy5x4gAL1CWENK599Fi5MvsCnJg+Rg4ZflyeLhpksz0ATwdC40keXqL2a
	 svVCitdpgG9RA==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 4E0DC17E1060;
	Mon, 23 Sep 2024 10:39:43 +0200 (CEST)
Message-ID: <ae69d0f6-97ff-478f-8e58-662fe4a923f4@collabora.com>
Date: Mon, 23 Sep 2024 10:39:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/5] arm64: dts: mediatek: mt8188: Add efuse for GPU speed
 binning
To: Pablo Sun <pablo.sun@mediatek.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-clk@vger.kernel.org
References: <20240920134111.19744-1-pablo.sun@mediatek.com>
 <20240920134111.19744-5-pablo.sun@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20240920134111.19744-5-pablo.sun@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240923_013945_384869_F14BA9D1 
X-CRM114-Status: UNSURE (   8.22  )
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

Il 20/09/24 15:41, Pablo Sun ha scritto:
> The OPP table of mt8188 GPU contains duplicated frequencies
> for different speed bins.
> 
> In order to support OPP table, we need to provide the speed bin info
> in the efuse data so the GPU driver could properly set the
> supported hardware speed bin.
> 
> Signed-off-by: Pablo Sun <pablo.sun@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



