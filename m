Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A8B7CD11C2
	for <linux-mediatek@archiver.kernel.org>; Fri,  5 Apr 2024 07:50:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5ENL61ZuRADNElmNoMGE+8n9WvgZzjGcxH6OAcuhUeU=; b=u44qTMRaZ6w0OVsqY8ztYmgzcE
	9rtuPVFnNMnzDtZAfVLKFgc0Oa1VTvQRrsVujegdrM2paP7aJpbO/wYCRJwLGU0rz/T6hbj01rLLK
	UyHdZKxkTxGNwlwl8REfpMJKyFV08w7hoCa1nIjq8Y+9bK1KJ6PYr5vr8Sqj9hOYlOYgRwzjCQesc
	e4uX9hRjqUR/G0vCjj+TpaiEvWEavJUQ12i6mo6RMs/boLa8sMN5LHDp4A2XRcOf5VVgcnVm/HUEf
	N6xX9NdXFjZ+O6DypFxyrdpTSH4YIcXJGFfSvu10xjaz4xuEgaaEncep0d9f3SPPv1/9r4rk553zw
	Ekswj0RA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rseLU-00000005lKt-1YKC;
	Fri, 05 Apr 2024 07:50:44 +0000
Received: from madrid.collaboradmins.com ([2a00:1098:ed:100::25])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rseLQ-00000005lIo-0bza;
	Fri, 05 Apr 2024 07:50:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1712303434;
	bh=H7kK29oj+wvc5c9f238ZbY+t3yjQC9CUKnWWHNbYtnI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=SM5Mzf1lrfWXDFKW6B+MwigdEtMBo2c89S6Q6JJFnaDf+wEvggbX1uRrPnCRxPhON
	 4FHVSZ5msVYQMRy7mT9ax2PEza1WAbaWYuxbqeoIy36U0J11keRYrWlMaTU8D4cl2I
	 TNkMakzETyU0fAhHDeVvDiVTSeB1W3srvrt7dSoTbXeuzJpCt+fYwP2nIFF3YT64ma
	 0k9I4KA2vf/59YKtMprWHm1f3nZA0vM/oC94okIgPlt7STUByXmLGJowhgq7c+4Ke5
	 RpHkXeL/I/VIrqmlqqQaqIDJ/pZT/zG+6RUnKrVfYKWiiDR2K3YlGJviEpx8z8h9Fq
	 3vrGhgXyscjAg==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 4E4D7378212D;
	Fri,  5 Apr 2024 07:50:33 +0000 (UTC)
Message-ID: <fd030e38-aa3b-4bf7-8018-455ed83f5cc4@collabora.com>
Date: Fri, 5 Apr 2024 09:50:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: mediatek: mt2712: fix validation errors
To: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>
References: <20240301074741.8362-1-zajec5@gmail.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20240301074741.8362-1-zajec5@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240405_005040_576063_C05C416B 
X-CRM114-Status: UNSURE (   7.80  )
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

Il 01/03/24 08:47, Rafał Miłecki ha scritto:
> From: Rafał Miłecki <rafal@milecki.pl>
> 
> 1. Fixup infracfg clock controller binding
>     It also acts as reset controller so #reset-cells is required.
> 2. Use -pins suffix for pinctrl
> 
> This fixes:
> arch/arm64/boot/dts/mediatek/mt2712-evb.dtb: syscon@10001000: '#reset-cells' is a required property
>          from schema $id: http://devicetree.org/schemas/arm/mediatek/mediatek,infracfg.yaml#
> arch/arm64/boot/dts/mediatek/mt2712-evb.dtb: pinctrl@1000b000: 'eth_default', 'eth_sleep', 'usb0_iddig', 'usb1_iddig' do not match any of the regexes: 'pinctrl-[0-9]+', 'pins$'
>          from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt65xx-pinctrl.yaml#
> 
> Signed-off-by: Rafał Miłecki <rafal@milecki.pl>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


