Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3AFBEB64DD
	for <linux-mediatek@archiver.kernel.org>; Tue,  4 Jul 2023 10:26:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RsDzRMr6TXYS5v2jkwZyCHn3A174qvq/R9WA0/VvT3M=; b=ao3j0h5Swel/Y85yxriQEzehxK
	eXgl+v6cVtspaaK3ZY93kn/V2nSmhXdf1agR+gQ4OUN18x5jv3LAU93D7JHU/ZT5A3Bys/GvpmGV1
	szd10a0W+kFpjJqu12Eed51hQ2IwIaflSo4I1WVK504CPtmVyQPZJDh6OJTOppfsEOgEfN/925PBL
	D8ctQdX2vonOKw3U/7jLtFUXH+F0lrEBHZJOldpDQAeEh78MKxwL+LV7yH7fLJ86GDgrD+j8UoHN+
	4iidX4J2bFeJxIM1qJ+54kooDVmPBdgrD2UzmS8ImSmO9PzBoFlGW3jJdyaC8gN3HaMUImQpD38Ej
	UPC+xVww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qGdFC-00CsOP-2S;
	Tue, 04 Jul 2023 10:26:50 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qGdF9-00CsLm-1J;
	Tue, 04 Jul 2023 10:26:48 +0000
Received: from [IPV6:2001:b07:2ed:14ed:c5f8:7372:f042:90a2] (unknown [IPv6:2001:b07:2ed:14ed:c5f8:7372:f042:90a2])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 911816606FA5;
	Tue,  4 Jul 2023 11:26:45 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1688466406;
	bh=c+kZqm345IMUwiq1G555fw+uH/tt8+ZJJS3xLx7mRUI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=IA/jpNyCgKdXugmDafEYPkJmko3xhZCuKG8VbD09jqaWUzKvcLRu0IYqAD9TprV6R
	 Z+vEWA3Lw1KMjICmwFwrmrsznaMqEQ4kiGVT1WALfYidjmZgmlo4U9AzM37Z3MSIA1
	 3e9Q822Q30lXG7dbf/y4f7Ms04/O67w1GknA3DjiD8gw4+QptbUPI2pQVhG/NNxG3f
	 BpTQ574KtThgnVOPyjGzYfM3MgCoTdFJ4g2le1XSjAT91T3cW9WxfoJ88gYX/9AWJ/
	 q+T0ra/ZelxcbElIZQ5ebffdK2iXNVuimHnQRsewDNFE6cy1KbfNZLbdZp2Heg84BI
	 SVkzZEgmlEvKA==
Message-ID: <263fcd20-c85a-6ea2-4bee-23fa184c0e9f@collabora.com>
Date: Tue, 4 Jul 2023 12:26:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v6 5/8] soc: mediatek: pm-domains: Unify configuration for
 infracfg and smi
Content-Language: en-US
To: Markus Schneider-Pargmann <msp@baylibre.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
Cc: Chun-Jie Chen <chun-jie.chen@mediatek.com>,
 Tinghan Shen <tinghan.shen@mediatek.com>, Fabien Parent
 <parent.f@gmail.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
References: <20230627131040.3418538-1-msp@baylibre.com>
 <20230627131040.3418538-6-msp@baylibre.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230627131040.3418538-6-msp@baylibre.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230704_032647_574915_50FB198E 
X-CRM114-Status: UNSURE (   8.45  )
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

Il 27/06/23 15:10, Markus Schneider-Pargmann ha scritto:
> Use flags to distinguish between infracfg and smi subsystem for a bus
> protection configuration. It simplifies enabling/disabling and prepares
> the driver for the use of another regmap for mt8365.
> 
> Signed-off-by: Markus Schneider-Pargmann <msp@baylibre.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



