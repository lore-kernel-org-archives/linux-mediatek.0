Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85D9AC369CB
	for <linux-mediatek@archiver.kernel.org>; Wed, 23 Apr 2025 13:52:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Type:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To
	:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=w0LHN2WUMsWrU7LKKqlMWt33ZfFNc+WV4T7oR3sZcvI=; b=jcEJLyRT91EOnkVgj9tsbbottn
	v3U8WF/46Tkoa6g0aoOUmJOi5X/irOZaOnvAiEny9phjhZvtySml3Knf/oc7AnyImyhJKnIQF3lIK
	KxA9Nq+wOmrOs834F23S3BptExxjXXYcac3FLLuniAGxYHA5JlQI5+NnJ6qS9qMCZAKmi2vA5CDl3
	mdS7qmK+dcywDN6s8vnwv2SipGifh4w5QabqXVfnhuJfPKZIoZgT/6qcaDkRCzBmjTB50ehNGboz7
	02NFHBAYsRQKDscE502qmMd8xG3xgCN/BdQyr0oc3+yczobxh4g4qWhBYAUFPc6vQKsloOadeL8sS
	c7vlKypQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7aWh-0000000AgfP-0jMt;
	Wed, 23 Apr 2025 13:52:35 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7Zoq-0000000AZ4p-3Lb3;
	Wed, 23 Apr 2025 13:07:18 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id BE70144344;
	Wed, 23 Apr 2025 13:07:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9298FC4CEE2;
	Wed, 23 Apr 2025 13:07:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745413634;
	bh=0Y/vxfE7FmeLJELsNe9Pzm5m1MeRdkYQA8cGN80GuXc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=k00bUcuzt94H99b5OY0qhTC84pXfBi6bfR6OnrBnIHaQeMDR4+xmydUhxe8DvgBEE
	 oEL/tkdD1xi2i9EMOrBoJTceIyU/HXQLafOI03SigmHw1ARA8AtOoAMVRwxeXjkIt9
	 R259pVkXHd8ccmKxFquhMFpthMtPMKmOMJmRNPSqG+D1nDmHMUrLlFMSqfC3nYSDSI
	 eVjQOkGgXtIh2akPdANVWsWViLu8jN9XWN2ev0PjDfF6reM4NRDozL/8wqeoicKp6X
	 l7NkvRZHyW+uzqv4jxsqVv1xuVMJKdYlw2EuSjdVdmuWL/B7SQtPnGTkejCEIpeXsg
	 tQFUQNCRmK3NA==
Date: Wed, 23 Apr 2025 15:07:11 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Frank Wunderlich <linux@fw-web.de>
Subject: Re: [PATCH v4 1/8] dt-bindings: arm: mediatek: add bpi-r4 2g5 phy
 variant
Message-ID: <20250423-debonair-tasteful-barracuda-e41c7e@kuoka>
References: <20250422132438.15735-1-linux@fw-web.de>
 <20250422132438.15735-2-linux@fw-web.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250422132438.15735-2-linux@fw-web.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250423_060716_854689_FB8D88FC 
X-CRM114-Status: GOOD (  10.31  )
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

On Tue, Apr 22, 2025 at 03:24:24PM GMT, Frank Wunderlich wrote:
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


