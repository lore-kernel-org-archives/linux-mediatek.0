Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 446BEC54E5D
	for <linux-mediatek@archiver.kernel.org>; Mon, 18 Mar 2024 11:32:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pDR2haNLgue4V3201tTwnQvoXID8tvFYTtUHhHYEKx4=; b=yWlyBr/1MgLT0dysaZ2jKO/x1D
	JdGNjyAmwzWDPUhNk5Vey5EbAwztqxWmRwVRKsHyLg6BPv5P53JoSHmnhg/dXHleRVOTaXu1scNRy
	9bzHmLGOZmBPAnpKw7LQYKXvPTKU9wPQmAWvq2el/Zx9ikcT82O05idpg5NHvS7AhBJCp9VfpVNL2
	geQsWZsbb6kiWmLi1++685LTBqEBIzaAQfkr9tGZ5X/tfa/xWgVX7JH5jIqWLGV0buTE6b9LloMCq
	tdNAODqCeIr819d+163DtpbibWSm6ViQSu0YLuWFpn87/j2LD7ymA7m7JbDWCZuzWW3JxQHsUX7zd
	PBoARipw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rmBEJ-00000008O54-2vrV;
	Mon, 18 Mar 2024 11:32:35 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rmA6V-000000087Rl-3Nmy;
	Mon, 18 Mar 2024 10:20:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=pDR2haNLgue4V3201tTwnQvoXID8tvFYTtUHhHYEKx4=; b=qIYXgUiu5bE3nSw8uQj47Pb8DS
	KaxYZMWB43hMALznjtzDCZgnwpDWVQ7so/F7l6ZN3Kpg8yUI8ql+00bLyZxdXyRWZDX/BoQx1Uauh
	V3YPwH56kCPm3Fwdd3lBPCRFdfFGrkMlc5fgwHed2ooWueOPhCZdSQPfblFuN80piZwqR1RwCFihs
	CDgYuH4J+bx0ri73wDcWIFDYBsdL+dS7Ev2GwWCogzJhULO/ewC1SiZM5/euSp9COyFpSmMVEk/XY
	04WWJU4zyrKZLwWqcPayHDJGDCaXiViGQpNTNmgLgBiGPhntNmYyhtvN5t60jKyd60snCp7oAN7EK
	p5RjLpVg==;
Received: from madrid.collaboradmins.com ([2a00:1098:ed:100::25])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rmA6R-0000000CZu8-36gW;
	Mon, 18 Mar 2024 10:20:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1710757222;
	bh=M++vTJkQ759R9Mkwui1J3cBXY015Nmf4LfDb5qGiOEo=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=NAfZixBZJGbT+COCy8sgZlNk1eZM4R0hVqDxf6FepWL07MyI1pL6zWmskVm+agb8B
	 HJ0ZYuwRDs7eU3fR1hdXul+C6XeOlikz2JJXznYKMVI7SSHWAimjm69iBeS/dxDLoe
	 DFCVnfoYLBV5tzCAGebKocQ13LJehhmQ/yaLc/CQSGL1CxU04BwKfTWg4zSWruSrfZ
	 C2ornlIbt8UYdiVqUX4l1yCpeedC3QN6/hHrgM6NIDd3FMHHLFMWJp4/X/tKFDvzZs
	 TDF5EfHvEfdYz5OYRjNscGuwMHzhlAkooSygOdm1Cjnl3MlN6eBj9xWYAJ7YLS4EgC
	 rts9Y3vn01WXA==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id C2ACC3782033;
	Mon, 18 Mar 2024 10:20:21 +0000 (UTC)
Message-ID: <b9ba05e9-888d-4af4-8b64-d06cc8e6553d@collabora.com>
Date: Mon, 18 Mar 2024 11:20:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 07/14] mips: dts: ralink: mt7621: reorder spi0 node
 attributes
Content-Language: en-US
To: Justin Swartz <justin.swartz@risingedge.co.za>,
 =?UTF-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>,
 Sergio Paracuellos <sergio.paracuellos@gmail.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: linux-mips@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
References: <20240316045442.31469-1-justin.swartz@risingedge.co.za>
 <20240316045442.31469-8-justin.swartz@risingedge.co.za>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20240316045442.31469-8-justin.swartz@risingedge.co.za>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240318_102024_148921_FBD04247 
X-CRM114-Status: UNSURE (   6.22  )
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

Il 16/03/24 05:54, Justin Swartz ha scritto:
> Reorder the attributes of the SPI controller node so that
> they're aligned with the DTS style guide.
> 
> Signed-off-by: Justin Swartz <justin.swartz@risingedge.co.za>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



