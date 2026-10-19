Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70676CCF2DA
	for <linux-mediatek@archiver.kernel.org>; Mon, 19 Oct 2026 09:44:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BjU+lCsa+wJqtJMmjDTe0djVhuOigs70r9AaD8jwKDQ=; b=cjX0GY1dMly0RZTNOUBmsL6WCp
	ReAMDlnaKygxVD6kUMi2I8K36Dh4AWIutcUcvSB8O0LKbIlwNh23exvEoFnZbM61nW1B7Orj2r2ns
	diE/fjXBt6peRMTaPNvyGh1me4bdOVm1hLBgU9i1vyZ1b8qZS/bQ/anOvDz+52RjaZjcCDWB7sP9K
	d2yLY2JLqi5K0wdJ3ah0C4V5SYkWxBLDf4j5R5uDsnd11OQDf+Z+wo7/VR4ZOutZHMso8x/DtXhcj
	EZHY7H8mwUyBEFtt3eZRe1Ks+zRCmKHderzIKRkY7kxbr/9mM+rR75/NeDGYz01yCRW+L6D8WBDKq
	M8qth5jA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIjvD-000000072i5-1rje;
	Mon, 19 Oct 2026 09:44:47 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIjvB-000000072hD-0lbH;
	Mon, 19 Oct 2026 09:44:45 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 65D3C600CB;
	Mon, 19 Oct 2026 09:44:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7D2391F000C5;
	Mon, 19 Oct 2026 09:44:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792403084;
	bh=BjU+lCsa+wJqtJMmjDTe0djVhuOigs70r9AaD8jwKDQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=cRpM1kfSi8spSuvrgbOTT314LgvTPK2oYceZymHEUnVJWF46DFi4emKSErNeqd3Ya
	 ed3vGNV635eDH2wf2KIdcyZwn+33XG4lelXs6dFIV2RjbxHm3FT9L9uL1bnWJrcsii
	 9lErdwvpHGbIP7GjWdKs8YQ/0sLBr42p5VAwxSRTX7/rL2IRgTWbjdIJFPVAmUaL3P
	 9bN4YRxKdtvGdxApJ5RvnGmcHOIpx0SSCF42wEBI29QSDg5IFNOJJi7c2M9zh8sEaF
	 NORYr2VtLkvYDsRCPzH5kErdaQW2HxFt9HBei7fZlG8Y7id5tpxvAPBi7mP1HQSpEx
	 wcrBG7WA5zWtA==
Date: Mon, 19 Oct 2026 11:44:41 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Ben Grisdale <bengris32@protonmail.ch>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Sean Wang <sean.wang@mediatek.com>, 
	Thomas Gleixner <tglx@kernel.org>, Radu Rendec <radu@rendec.net>, 
	Daniel Lezcano <daniel.lezcano@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Jiri Slaby <jirislaby@kernel.org>, Wim Van Sebroeck <wim@linux-watchdog.org>, 
	Guenter Roeck <linux@roeck-us.net>, Philipp Zabel <p.zabel@pengutronix.de>, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, linux-serial@vger.kernel.org, 
	linux-watchdog@vger.kernel.org
Subject: Re: [PATCH 2/8] dt-bindings: interrupt-controller:
 mediatek,mt6577-sysirq: Add MT8163
Message-ID: <20261019-wakeful-wrasse-of-purring-72a0c9@quoll>
References: <20261019-arm64-initial-support-for-mediatek-mt8163-soc-v1-0-f2462b2d2437@protonmail.ch>
 <20261019-arm64-initial-support-for-mediatek-mt8163-soc-v1-2-f2462b2d2437@protonmail.ch>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261019-arm64-initial-support-for-mediatek-mt8163-soc-v1-2-f2462b2d2437@protonmail.ch>
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

On Mon, Oct 19, 2026 at 01:39:58AM +0100, Ben Grisdale wrote:
> Add a compatible string for the SYSIRQ interrupt polarity controller on
> the MediaTek MT8163 SoC, which is compatible with the MT6577 SYSIRQ.
> 
> Signed-off-by: Ben Grisdale <bengris32@protonmail.ch>
> ---
>  .../devicetree/bindings/interrupt-controller/mediatek,mt6577-sysirq.yaml | 1 +
>  1 file changed, 1 insertion(+)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


