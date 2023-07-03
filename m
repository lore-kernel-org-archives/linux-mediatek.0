Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7EE3EB64DC
	for <linux-mediatek@archiver.kernel.org>; Mon,  3 Jul 2023 09:48:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=a91hvs42nD4/IQDVSuBwdpbzqOt01YNCD37Qhuo/pkQ=; b=0ezjckjgAhTpA6bjePxAj55uJQ
	EhdB1MT9Wkq7oZZY1ZT2+ouqkPKcpsxWyN1eo7/PWAcFbsiRzL3XkMPDCBS1Bwl1qvNVPHytq4cx+
	sS8wjlAPi5X3D9teFjWhPXMTVhCGHWz+s9av9/Ddy2y8oI03ILTLKRdgZ/qXcOHPwLaS9DPixNvpj
	+TDsuBujb6lOIBtNrjYCBn73vgBXXSYS4ajF4pZC+VOrvE0XgZua20QbCaq/qBt307FmQIO+zlzxt
	VMB9IGxFebxcFigiMVN/q0URIqiJtWJSyuUfsejt8XqA7h1RH1OxesjTm+0K0PwVBvkzafZBiT19n
	+0ryw4jQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qGGA4-009zqd-15;
	Mon, 03 Jul 2023 09:48:00 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qGGA0-009zoc-2a;
	Mon, 03 Jul 2023 09:47:58 +0000
Received: from [IPV6:2001:b07:2ed:14ed:c5f8:7372:f042:90a2] (unknown [IPv6:2001:b07:2ed:14ed:c5f8:7372:f042:90a2])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id A3C876602329;
	Mon,  3 Jul 2023 10:47:51 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1688377672;
	bh=3nr4rR/iu3oTG2ydNtl+jv3WxDV732H20lVTt5rYlz4=;
	h=Date:Subject:To:References:From:In-Reply-To:From;
	b=dXOZEjgq4Ypw25eN/G5pyBu40qRaoPL/P5/0oLvHt8QHBk+fRA0uQLirAVpOU70NS
	 Zi9ni6RPTUbExxu9klmkpCpPsikeblsDS7SkixgNrNYU8y2PgMWfDSrtGWuy9ADtcQ
	 0I+0SivoMDbIyHCTT0L7Xap+IQoMWoV4+KtUW8XdcOFBBQCkEAICphvytpeONXl5CJ
	 evSbofKQ+rLKAkRHzaSRGnpw3YP5aSoRBfoEmsFns5llhD2gfEyd23dYYuqeLbKeBq
	 xnvfvm/Nppjv5IBTCz8wDh2WnuJRmRh62YECB7gGy8hGSn+/yx3ltx2yFtFN98hB04
	 UGE888ApO9vJg==
Message-ID: <50544558-0c87-7eef-6bcf-3b7011a66e63@collabora.com>
Date: Mon, 3 Jul 2023 11:47:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH 1/2] arm64: dts: mediatek: minor whitespace cleanup around
 '='
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
References: <20230702185128.44052-1-krzysztof.kozlowski@linaro.org>
Content-Language: en-US
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230702185128.44052-1-krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230703_024756_989247_C32C9188 
X-CRM114-Status: UNSURE (   7.20  )
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

Il 02/07/23 20:51, Krzysztof Kozlowski ha scritto:
> The DTS code coding style expects exactly one space before and after '='
> sign.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



