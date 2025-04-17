Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA351C369CA
	for <linux-mediatek@archiver.kernel.org>; Thu, 17 Apr 2025 06:31:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Type:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To
	:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oog4OxBxKWiQtqD4HSeX9KLpN0j6tdACPCd+y8x7fug=; b=KDn8ptxQyAXOeprgQNppt8QnkZ
	Ib8/0rfGmp3HyxbxDe+TdvUxdZ1uqIP3DLzl+o5VgBd4hiqiC0YpMYpRg6crW3KJaCYyIR9g4Xe52
	3DQeUfSufB70x2z87ttDfRtstd8aow6/+mm2EZ+SkrM2Ug1uxj6lf8uFTONnGM8KLvJFzUwftsTu9
	v0imDYpy9bKC67hXKzV9hL8zd+ck3zcesFzyxdWVz6UGjTn1rROxqBCESWLMVRNhA0nTGx0RRCIAW
	ICeQmoJqihA9DmzqOwaFLJZrxfaEGkNYIK3OIelvHPwcD3IIvjQQhW8vVIZRy9bEtQJDR0E8b9zGv
	RfBuaTjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5Ime-0000000Buhs-3WXW;
	Thu, 17 Apr 2025 06:31:36 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5IkC-0000000BuOt-1eyT;
	Thu, 17 Apr 2025 06:29:05 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 5A029A4B17F;
	Thu, 17 Apr 2025 06:23:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C96E3C4CEE7;
	Thu, 17 Apr 2025 06:29:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744871343;
	bh=7IAS7u/qyeDA+3kCVGKykpqGrK/XcXN5eUwS62reNK4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XgFcS3y3UHQw9SyyZDhs8yKzZcuIEoe57HITDLImj6A11NPPAyrHQSJ9xUg/AFuFe
	 xOLpwLraz8ffZcLpYyyyGF0como1vwUQvXhYFRLmfNOOomn7obPIhTAKjouuUrCrYd
	 +UwlcZGslCBWCMrUyueRUD4aVASK7sggMb1Jmx/k7S05AdSqcowupyn9XUAMA4wL59
	 tjfzjPP987AIoUMM7NYFD00DgbqU4xvofP+Ey2tfzVogiJW6bIa4uMLAUTo+Yt9ttG
	 +7qZeJPNyE9VsEiVwYdy6kPfDRKUvbpuGqTZW7+omMmdBXv0pQNyJR26D6XLizcpBc
	 ttBso8DqragWA==
Date: Thu, 17 Apr 2025 08:28:58 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Frank Wunderlich <linux@fw-web.de>
Subject: Re: [PATCH v3 1/8] dt-bindings: arm: mediatek: add bpi-r4 2g5 phy
 variant
Message-ID: <20250417-red-smilodon-of-aurora-e5beaf@shite>
References: <20250416095402.90543-1-linux@fw-web.de>
 <20250416095402.90543-2-linux@fw-web.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250416095402.90543-2-linux@fw-web.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250416_232904_494309_CBED9F8F 
X-CRM114-Status: UNSURE (   9.93  )
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
Cc: Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Sean Wang <sean.wang@mediatek.com>, Lee Jones <lee@kernel.org>, Daniel Golle <daniel@makrotopia.org>, linux-phy@lists.infradead.org, linux-kernel@vger.kernel.org, Matthias Brugger <matthias.bgg@gmail.com>, Vinod Koul <vkoul@kernel.org>, linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>, Chunfeng Yun <chunfeng.yun@mediatek.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, devicetree@vger.kernel.org, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Wed, Apr 16, 2025 at 11:53:53AM GMT, Frank Wunderlich wrote:
> From: Frank Wunderlich <frank-w@public-files.de>
> 
> Add new compatible for Bananapi R4 with 2.5G phy.
> Base board is compatible with existing BPI-R4 only 1 SFP is replaced
> by RJ45 port and use mt7988 internal phy.
> 
> Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
> ---
> v3:
> - new patch adding compatible for 2.5g variant
> ---
>  Documentation/devicetree/bindings/arm/mediatek.yaml | 4 ++++
>  1 file changed, 4 insertions(+)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


