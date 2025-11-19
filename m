Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF640CF2597
	for <linux-mediatek@archiver.kernel.org>; Wed, 19 Nov 2025 08:32:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1GjrMlb1Km4dyFe8xp7zVk8p4DGH804VlDa0cJcO8IA=; b=3RksKOdzQn/G/coc+D+hq3ur+5
	9Qs9ALkqlPYVwJP7L2gEr1CL/sCTsyR5DzNTrB5TL1EySk6oCD3B0EMv7ba7zIQIHfPM43WpiDMtN
	hVrYu2vpbHo+GzgelxrtoMw8D3SeL1URgcZuro4hKRLq3zAbSgD+A5eL8lE0eRxJmJKwYoHORWk3v
	/RRK6Of6O2A5c2TywmPqFQIXgzo40lIHFwULzwgCImQ8ri5LeSRu8GBv1oy77EolLAUAl0P1RHAf6
	GbDhgOSP/qB5dWMN3mA6GH8qvl/CvVVHs9Oy+4/WCf2UKZxhnJVf2+JtyAEiesjAKk3laeXKJyBR9
	nyvY6+lw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLdcS-00000002nSH-3eTa;
	Wed, 19 Nov 2025 08:32:52 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLdcP-00000002nRI-44fU;
	Wed, 19 Nov 2025 08:32:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1763541167;
	bh=wBrRth6jrMBMC97BugaJ+iim5MtferOSNB82gPcG4Rc=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=oLA1GjWRfrf4rj0OLTrqowQHNksAh/PrM1sSJPt35wSyikgWfoRMcNxUDCDoV1hXU
	 uftIdxdac2QC8SI82kX07cdKNhAN0eE+EcD4uNGnM4Wd0UW6C/PdqFzTPabR3RfM6m
	 XS4GRD/422P5XHXhQxO9dbP1UGNeyjDr+HnTQ7UZm11F7j13l5g2GjG2X+hoBI6qLP
	 l997tC0WzRCWiST4dSyYf5Cc+gjtCpwXUgDaq9++JePHAbYK4Ft7We4SGl9zSssCbx
	 4i5u6XMtcMMSlq1ouzIPhajHhUnhxrbpaig1yC2DVPmFDSI+5umhrbzxYYe/t6kqKV
	 4hqO8wC6d1qOg==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id AA2B417E0154;
	Wed, 19 Nov 2025 09:32:46 +0100 (CET)
Message-ID: <39fba430-3841-4bf2-9fe7-44f372ff4a16@collabora.com>
Date: Wed, 19 Nov 2025 09:32:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 01/13] dt-bindings: soc: mediatek: dvfsrc: Add support for
 MT8196
To: Krzysztof Kozlowski <krzk@kernel.org>,
 Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Henry Chen <henryc.chen@mediatek.com>,
 Georgi Djakov <djakov@kernel.org>, kernel@collabora.com,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-pm@vger.kernel.org
References: <20251114-mt8196-dvfsrc-v1-0-b956d4631468@collabora.com>
 <20251114-mt8196-dvfsrc-v1-1-b956d4631468@collabora.com>
 <20251119-alluring-jellyfish-of-chaos-4f5bd8@kuoka>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20251119-alluring-jellyfish-of-chaos-4f5bd8@kuoka>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251119_003250_176765_8A32AABF 
X-CRM114-Status: UNSURE (   9.86  )
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

Il 19/11/25 08:41, Krzysztof Kozlowski ha scritto:
> On Fri, Nov 14, 2025 at 05:53:55PM +0100, Nicolas Frattaroli wrote:
>> From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
>>
>> Add a compatible for the MediaTek MT8196 Chromebook SoC's
>> DVFSRC hardware, introducing capability to communicate with it.
>>
>> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> 
> Incomplete DCO chain.
> 
> Best regards,
> Krzysztof
> 

Eh yes, Nicolas forgot to add his SoC on all of my commits, whoops :-)

Cheers,
Angelo

