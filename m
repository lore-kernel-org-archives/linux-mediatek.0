Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4171AC47422
	for <linux-mediatek@archiver.kernel.org>; Mon, 29 Jan 2024 10:27:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iq9yh2nEu1UTbVFwVjmpIPF3pL9DlcVllqHOXyfhfKI=; b=0ZNAWc5+PKM6xG2AWPhtT2gCn9
	5WMcsuoEaxsDy68L1UE7Z59CT4AQ1H5Cw9a/4SN24TtQs/FTUgW2dLO5iDbKsvvYNXjbnYQHHy67T
	W4Sbx5PG/XquWC/hKQYm3M0gl+KiE9Lnm6o1W/QiZrAw6J9Iqca1BC6n9PzvoW3/HU3Gy+HS13koC
	Ith6N75HLBrxeLfmnaOdWJ/KA/EzHOSiRgntcimL11bBcNnATFOF6YacRzMdnnm7YFrpUAiPOoYtY
	ZXzZs0RFea+cHZqPRuAz+2IqyNf1VWvntAtYvX6Gl4F+rXtSg3Vbd5xdH+2MBky/CGtrjLgeJZME0
	0ea8V/9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rUOri-0000000CDS1-3YQI;
	Mon, 29 Jan 2024 10:27:46 +0000
Received: from madrid.collaboradmins.com ([46.235.227.194])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rUOrf-0000000CDQa-25I1;
	Mon, 29 Jan 2024 10:27:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1706524061;
	bh=Se2pMSyaA1uJqQKjYDSSGtdlRITL9xGPFkn0PUHl9v0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=mD7T7xGPoHfuFfVwhvfyhBv8vOGj45UWbeiO4wWgmRRDnbY6U3j8J9YPPllTJ8f+F
	 zUl+gI2Xa7eH6kw2sbhoNQcJ9XbaCV/NbAqNjfgcdtm2dhs21vmxi5jfcEjr9wG/mM
	 2/Ke4p+45wPfDkjuG20D3wUpeDfZDq9xPeFsafNJoI5WJPkQT3cfmw110geOTzjyMI
	 AcZBpGB0khB3xQ6Zh9O6Ux55gRURMP2XwnokZmjMLrFyvv1/1MZd47zbWelC7J0Ajb
	 4+s6sS1R2to2/deYfEuys38AJ67aCVzt7lyY8z7nx9wIqhnOZvyLlmlVIGhEp7845g
	 Wdw8ZiCLwAfJw==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 501BA3780C1F;
	Mon, 29 Jan 2024 10:27:41 +0000 (UTC)
Message-ID: <242fc593-6445-4580-95a8-b60150ff4b84@collabora.com>
Date: Mon, 29 Jan 2024 11:27:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/3] arm64: dts: mediatek: Add socinfo efuses to
 MT8173/83/96/92/95 SoCs
Content-Language: en-US
To: William-tw Lin <william-tw.lin@mediatek.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <20231222080739.21706-1-william-tw.lin@mediatek.com>
 <20231222080739.21706-2-william-tw.lin@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20231222080739.21706-2-william-tw.lin@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240129_022743_720598_923E7FFF 
X-CRM114-Status: UNSURE (   7.06  )
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

Il 22/12/23 09:07, William-tw Lin ha scritto:
> Add efuse nodes for socinfo retrieval for MT8173, MT8183, MT8186,
> MT8192 and MT8195.
> 
> Signed-off-by: William-tw Lin <william-tw.lin@mediatek.com>

Applied to v6.4-next/dts64

Thanks!
Angelo

