Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55283C83F33
	for <linux-mediatek@archiver.kernel.org>; Tue,  5 Sep 2023 08:01:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TEVN9tUhR7RAI5sktITrSLJNJ1isKUAbvTWyB8qwxjI=; b=th+2aBWRRplxKLW3owTf7FOaTT
	EiRjqqamnjW17/hQYUR6+ZBcCcpSmf5IfpSoYmsD7M02IN9XYFdsEazTD/WSXc4CZLwAeUo/sEwdq
	6kNS8gNlJVwJQYvhLw/zA2O+EefywogMDcp4u66IV+VqFey9lhByL7a/66K8NZBzAkEMsGzHYGymt
	/yU4AR+OdxV/o2WDLe0wQAUBKFhVyvvrLSQaZHgWo6zFbHdLGshRnAZFbuyLFJ9Tc7GiPk10fwVQG
	gSQ0AuC9cZj/Zfpvj3kMM75PYFAqrZXJLRRilP2b3XpKlqR2zeA01i89/esjgdHMojuS4q8y4aXIV
	EwVcl/aA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qdR0D-005UMm-0a;
	Tue, 05 Sep 2023 08:01:37 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qdR0A-005ULd-12;
	Tue, 05 Sep 2023 08:01:35 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 2EFFA6600B9D;
	Tue,  5 Sep 2023 09:01:28 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1693900888;
	bh=PU+U/dEE7kc5FeBeCNzM0RHGNzET0eI/w37N7m0QFpg=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=YyzpakIFbIqNDKTvVbkaOuSGBfTwR7NrFX6P/xPmhOIXzsroeFPpIGhdHN6v8zdZd
	 oK3uNbuVHuRkS5WTUDHxjHxZrZd53dyQAZWLpjLLIuS6syzFZVYhairWC6dVJFyzqk
	 3GRXKbmzsGI620yScWx2pBSlIrFSQUfkdGMZUqp70+Wc61F4rIIT18GmbnXQ4GIwUf
	 0wQAK1nbuCx+X+YJoh+OZBXxWA/8efeYBCNpdtWPLyOz7p6437ltiyUbYhRVWocx7i
	 MAb8KEExg6F545YX2dgPIxZdRYVPR4wfnfrkCJcZ+w8DDOV0Jw++AHEKYFJmBi2VfV
	 9v3opMBOo+Z7A==
Message-ID: <e54394b3-eb52-f36b-3ba4-8a4262b5f5e5@collabora.com>
Date: Tue, 5 Sep 2023 10:01:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v3 2/2] arm64: dts: mediatek: mt8195-demo: update and
 reorder reserved memory regions
Content-Language: en-US
To: Macpaul Lin <macpaul.lin@mediatek.com>,
 Alexandre Mergnat <amergnat@baylibre.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Fabien Parent <fparent@baylibre.com>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Cc: Bear Wang <bear.wang@mediatek.com>, Pablo Sun <pablo.sun@mediatek.com>,
 Macpaul Lin <macpaul@gmail.com>, stable@vger.kernel.org
References: <20230825114623.16884-1-macpaul.lin@mediatek.com>
 <20230905034511.11232-1-macpaul.lin@mediatek.com>
 <20230905034511.11232-2-macpaul.lin@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230905034511.11232-2-macpaul.lin@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230905_010134_489254_41EE3FDE 
X-CRM114-Status: GOOD (  11.56  )
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

Il 05/09/23 05:45, Macpaul Lin ha scritto:
> The dts file of the MediaTek MT8195 demo board has been updated to include
> new reserved memory regions.
> These reserved memory regions are:
>   - SCP
>   - VPU,
>   - Sound DMA
>   - APU.
> 
> These regions are defined with the "shared-dma-pool" compatible property.
> In addition, the existing reserved memory regions have been reordered by
> their addresses to improve readability and maintainability of the DTS
> file.
> 
> Cc: stable@vger.kernel.org      # 6.1, 6.4, 6.5
> Fixes: e4a417520101 ("arm64: dts: mediatek: mt8195-demo: fix the memory size of node secmon")
> Signed-off-by: Macpaul Lin <macpaul.lin@mediatek.com>


Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



