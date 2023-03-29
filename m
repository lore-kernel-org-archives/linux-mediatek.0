Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2475FC74A5B
	for <linux-mediatek@archiver.kernel.org>; Wed, 29 Mar 2023 13:37:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oUXOaMO0S9HwoVYkV2yDb9D1x0nvyGVKIRLwps9IBUU=; b=NY/3xj4gcr17/fq7/BbYh9sQjb
	S5EuprIjemh/TBxmfAqINzxPYqm3UUwWZnlVZaXEeUgRXU10dFjgUUi3OQVttlmV5HuF+QMqlDXNm
	G6IyXFKEygjoAWl8ZBT+EK5EQBYKAclvLw3A8UHmPBVUGf/7jCwZfIDISAk5ZbCUR/22kgi76Y3tv
	YA1K6YakyoY/7OX1aCd0x/Z4/zylrDcj6KaRTbdRSR6kCeOThvTeVfyTuTtb0xvnGuhOHfRolQ1fO
	HMMqFMzk5VuZrmqWwB32pg7HE5pSoRaaRGZTUPECIY3/kllg6fBGkjiK6oOFiKjYZOOv6xW2/FN3q
	5e9Zda1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1phVzG-000QqL-11;
	Wed, 29 Mar 2023 13:37:14 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1phVzC-000QoZ-2P;
	Wed, 29 Mar 2023 13:37:12 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 0AFBD6602EDC;
	Wed, 29 Mar 2023 14:37:08 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1680097029;
	bh=jw6n+X+JHIaas8VBWE1sZxdqpL6FC797U9ot+cYY+c8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=kusL0qH2YilLjFOM2MOtUxR0rkYp6n1cS8Yc9B3IOosrc9qh4oXLQZP8zfcibVcQI
	 6kgfffMPIyhpJ0VSZMPr9ACbmE17HrjqlFcWetJDQ7zI2SycAYbNYux03qaMOiQ4h2
	 9ebJjsTjGlMPLnfSrW1BMKEO3EyU/2lisGOh9I7cl576tCoJPXVm+O4+km3Q/k/6rI
	 ojgmlbk+GkiRLfExXUsaRVh+qgdfoEMzZZiJif7EBADJytjQMEZG5KY7Z8ra0VUyTa
	 qy0wqTGZIStsY6A6/jlS4VHW60U1yDwpImBRYDR0xLWbkOYjpyeoFVkUaErXop6AU5
	 6kxGImSRVmWGA==
Message-ID: <54441f6a-cdb7-eb49-bca6-59aa9e828160@collabora.com>
Date: Wed, 29 Mar 2023 15:37:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH RESEND 5/6] arm64: dts: mediatek: add larb support for
 mt8365 SoC
Content-Language: en-US
To: Alexandre Mergnat <amergnat@baylibre.com>, Yong Wu
 <yong.wu@mediatek.com>, Krzysztof Kozlowski
 <krzysztof.kozlowski@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc: linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20230207-iommu-support-v1-0-4a902f9aa412@baylibre.com>
 <20230207-iommu-support-v1-5-4a902f9aa412@baylibre.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230207-iommu-support-v1-5-4a902f9aa412@baylibre.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230329_063710_908854_0CEE6FAC 
X-CRM114-Status: UNSURE (   9.23  )
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

Il 29/03/23 11:52, Alexandre Mergnat ha scritto:
> Local arbiter (LARB) is a component of Smart Multimedia Interface (SMI),
> used to help the memory management (IOMMU).
> This patch add 4 LARBs and 2 clocks for the larb1 and larb3 support.
> 
> Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


