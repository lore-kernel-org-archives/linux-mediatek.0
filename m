Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0576DE75438
	for <linux-mediatek@archiver.kernel.org>; Tue,  3 Oct 2023 09:19:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject
	:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bVtle11+F+2q7ObKN9xrHyZuOwyjS3lgpspTKIH/0qI=; b=F80onlWEzlKGQH
	qMV6p7ywmNHwv6VqN9nLQLe898Adi30waPk6frIxy14BzuLQD9L//KiK9O1nsQAUF/69cZkGjcOaP
	OsGu1dg5BYz6HwMeYmwRTuQO4W2g9AyBoDd8fS8DjkZztln5dRmASN65OAAWt4Af+ds5SWkVkBLaq
	D4909+ZM1NVvE2rWwjRolq6v6yyfCoWGMYpLFZrHnUlzn1RCX9ROoHZ2Ri4HiUi/ia2DiwTT6+7cL
	s2AMcq5JbYQvU98lYOCd0lhQqa5/iy6i2QMKf+7+hACAAHhI9R0JQv84bd+Q3t2YZnF7ppmqd8bL6
	MNwonAVEkn1s7aYh8/zA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qnbYm-00EE45-31;
	Tue, 03 Oct 2023 09:19:20 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qnbYj-00EE37-29;
	Tue, 03 Oct 2023 09:19:18 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id D61126607181;
	Tue,  3 Oct 2023 10:19:12 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1696324753;
	bh=M7lfKOTZR3YgSLdRNfIAxVgHYEotO9VtiVlCynD3SMU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=R9dZ3Hy8CrWJehTL759PY4epu4CXhVtEAx0t+4u0GSOvsGFPl0XCm1rlm6Hgljxnx
	 6688lQSte61FZiO+mzoLEJl+ZIfzwSuMp3dEWaO9QXLWGfzC6R5Se12IBixDFn6FUy
	 Jx0Yv/gMMOCmrKjgaIifK+O0ccXdkdCeuvz7jBuYmfibjGOR9lj7IN0Tbl76smwSDQ
	 bnbRQIyBi5nQ5vfSGLiv8+Ojj+wwbNUrrcqYC/4z/v0+gYPIXCF5RDYjjuZpsDPXzr
	 ItbgOf6lhLk/NHzdz/G3PSRNxAsIiODjzh/NuLqz8V0VqHi9sg/n2UYAKthk145IHH
	 Nf72jko8PEfHg==
Message-ID: <f10651a0-797b-ee55-a7db-9a26699c13ce@collabora.com>
Date: Tue, 3 Oct 2023 11:19:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [PATCH v2 2/2] arm64: dts: mediatek: fix t-phy unit name
Content-Language: en-US
To: Eugen Hristev <eugen.hristev@collabora.com>,
 linux-mediatek@lists.infradead.org
References: <20230814093931.9298-1-eugen.hristev@collabora.com>
 <20230814093931.9298-2-eugen.hristev@collabora.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230814093931.9298-2-eugen.hristev@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231003_021917_855266_B983D770 
X-CRM114-Status: UNSURE (   8.42  )
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
Cc: kishon@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org, sam.shih@mediatek.com, linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org, matthias.bgg@gmail.com, vkoul@kernel.org, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, chunfeng.yun@mediatek.com, kernel@collabora.com, chris.obbard@collabora.com, linux-arm-kernel@lists.infradead.org, jieyy.yang@mediatek.com
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Il 14/08/23 11:39, Eugen Hristev ha scritto:
> dtbs_check throws a warning at t-phy nodes:
> Warning (unit_address_vs_reg): /t-phy@1a243000: node has a unit name, but no reg or ranges property
> Warning (unit_address_vs_reg): /soc/t-phy@11c00000: node has a unit name, but no reg or ranges property
> 
> The ranges is empty thus removing the `@1a243000`, `@11c00000` from
> the node name.
> 
> Fixes: 6029cae696c8 ("arm64: dts: mediatek: mt7622: harmonize node names and compatibles")
> Fixes: 918aed7abd2d ("arm64: dts: mt7986: add pcie related device nodes")
> Signed-off-by: Eugen Hristev <eugen.hristev@collabora.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



