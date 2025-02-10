Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE96BC02198
	for <linux-mediatek@archiver.kernel.org>; Mon, 10 Feb 2025 11:20:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject
	:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=701lOTwvBQqrihNU39WbbYRFpPnSdZwDaGPQJEns54E=; b=iNdiWA3RmzWCOn
	zH2GR/SMzM6s6FO/0McJ58OdFJJYRV1FfOJbgRPniGGGOewOlztJl8K4OxfBnS9aqlm3LVA5K96tx
	blr4EentXD2RezX/ZFmuG3gaLo1pkNC5UyNHFtnANd32y9TyedC7TQO5ZN1hGkCdSN53rEcCH+4bo
	GIl7Y2uE28vLUAL7jyRHB+mjqLHE+zrZNpRinojc2tXGO/Do6/l2aXcnBruCe5+cml2hsplnkXc5f
	MnPjFqDwIBg/gG3KNfmL5KtmNmWD9e+Meq4ULe0PDkSRehz/PtlQxhVT3MkZbLOD8yBuAYqtBkjum
	8MJvpqcCtlly7W3wp1qQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thRpn-0000000HBxf-3AvL;
	Mon, 10 Feb 2025 11:20:15 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thRT1-0000000H6qU-2v8k;
	Mon, 10 Feb 2025 10:56:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1739185002;
	bh=ktC9CGjjL2cK7vFGI+t8o65NobGAFD0a2MtqEaxpWTI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=VDIALnGMNk86NrAPmfAd//FQLk4s/j7kOe0F0n8rU1AgHnkN+pGf2mMHWtgI2EcLT
	 EJuZCOQfrFUko7tDluFAUWNZ+QgrJ/t0yExuxM+74rynDfLRqcsFoJf23rVUQQlB26
	 TwrHNQxxJdHe5gcN+8SsrU7j5IVjGvzgu0TvvCtCwx10WGhQV2WC7X0RBjUwt7mmkW
	 QrW+7OO7oAR6TbKLfDGGroGrKflj6HdDOmsDI+WDwqsvxJ1lSRlNEGgINxLDJtrdcn
	 mCX83JTYosnDUGW4HNpIM4CQupfp2bHWXNP6A/mSxhGuCW0yfzBc9iUhPsm14DKUiH
	 wxQwbGJSDiGDg==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 9E57917E0EA4;
	Mon, 10 Feb 2025 11:56:41 +0100 (CET)
Message-ID: <b56a7597-fa39-4e02-b601-db05bfa48472@collabora.com>
Date: Mon, 10 Feb 2025 11:56:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: mediatek: mt7988a-bpi-r4: allow hw variants
 of bpi-r4
To: Frank Wunderlich <linux@fw-web.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
References: <20250207135501.30741-1-linux@fw-web.de>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20250207135501.30741-1-linux@fw-web.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250210_025643_881031_A3782F01 
X-CRM114-Status: GOOD (  13.04  )
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
Cc: devicetree@vger.kernel.org, linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Il 07/02/25 14:54, Frank Wunderlich ha scritto:
> From: Frank Wunderlich <frank-w@public-files.de>
> 
> Sinovoip has released other variants of Bananapi-R4 board.
> The known changes affecting only the LAN SFP+ slot which is replaced
> by a 2.5G phy with optional PoE.
> 
> As the SFP-Ports are not upstreamed yet this patch simply renames the
> current board dts to dtsi, creating new dts for the board including
> the new dtsi and move i2c-mux channel for sfp lan to board dts.
> 
> Signed-off-by: Frank Wunderlich <frank-w@public-files.de>

I understand what's going on, and I agree, but this change alone doesn't make a lot
of sense, does it?

If I were to see a commit that moves everything in a dtsi, and justifies that by
adding two dts for the two variants, though, things would be different.... :-)

Cheers,
Angelo

> ---
>   .../dts/mediatek/mt7988a-bananapi-bpi-r4.dts  | 404 +-----------------
>   .../dts/mediatek/mt7988a-bananapi-bpi-r4.dtsi | 403 +++++++++++++++++
>   2 files changed, 407 insertions(+), 400 deletions(-)
>   create mode 100644 arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4.dtsi
> 

