Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10B8ECF6497
	for <linux-mediatek@archiver.kernel.org>; Thu, 20 Nov 2025 00:11:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dluZy1SniiF90BWLRvELA75/MxECMMSntjdUDuLeOp4=; b=pPW3jRIRNCeIPInP+41miR9DyN
	6hEWES2Q2goL/I+87MscTekNJNAIpudrVrBdz7eNXmCNvNGF2Jtd2Y2BiFKbloV7vepf5D6/wGhBp
	ylcnJkj1G5nUgSejm9U5kHvAA5wv7kXYG9AzNPNPj2q9b9Df5+dDTr1XfSjdrYQ8f4YfDN7hyMxur
	m6FVfT2+Nk+/XuzBd2GHjwyC7wxoUnWDOrpvT9Qj4ZPqYHgf39XfPHlfVt+tq/sfoKPRMsY0j19j/
	nRZPF+n6r8o0uDDRpW0J/kVwMK2f3oBZ5eSgThHhLS0SmYsgJmfpQEPDuTo+L7f8VFcEG7lyVkUyV
	YkZbnZbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLsH5-00000005s6e-18K7;
	Thu, 20 Nov 2025 00:11:47 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLsH3-00000005s5r-088i;
	Thu, 20 Nov 2025 00:11:46 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id B277E42A75;
	Thu, 20 Nov 2025 00:11:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6AF39C4CEF5;
	Thu, 20 Nov 2025 00:11:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763597504;
	bh=BJXgWOV8ilrXkWcqiCBuYjzC9vId9KOVewUanGTI5AU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=p3kk9/Nxp/DO5l6FwrufqoasWCnTaPs+yanQIOr3qixcWop2otdgPZTMQE6f/Wrvu
	 nnCKtR/+npDlAJBxplDQ/BcJw31Y619hrnwJ8UNh+xSbkdTuJqu0d3roN4dE2o+K4w
	 1aXOpaHRzWI3aPJ3PjsVTow/sTS288ppZuANK1PR6TCY3I0n9/wZRrkc+nGrddYpOt
	 PT4/T9Acq/r81e0ZmY4OuBGE4Lu5s1YeflOsIld55Dozqdsh28CMqpfeSlSYaJovPf
	 T6mw26E9kU94Qn0KI1wh6SisdegAE6oNaEmqUCWFiIqyCLZyDK+Tj+XnQXNl/gyTMl
	 a5zVlgv0dbzaw==
Date: Wed, 19 Nov 2025 18:11:42 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Cc: Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
	Matthias Brugger <matthias.bgg@gmail.com>, kernel@collabora.com,
	Georgi Djakov <djakov@kernel.org>,
	linux-mediatek@lists.infradead.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Henry Chen <henryc.chen@mediatek.com>, linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: Re: [PATCH 03/13] dt-bindings: interconnect: mt8183-emi: Add support
 for MT8196 EMI
Message-ID: <176359750213.3605847.582811616705438270.robh@kernel.org>
References: <20251114-mt8196-dvfsrc-v1-0-b956d4631468@collabora.com>
 <20251114-mt8196-dvfsrc-v1-3-b956d4631468@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251114-mt8196-dvfsrc-v1-3-b956d4631468@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251119_161145_088653_0BAEC38B 
X-CRM114-Status: UNSURE (   9.41  )
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


On Fri, 14 Nov 2025 17:53:57 +0100, Nicolas Frattaroli wrote:
> From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> 
> Add a new compatible for the External Memory Interface Interconnect
> found on the MediaTek MT8196 Chromebook SoC.
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
>  .../bindings/interconnect/mediatek,mt8183-emi.yaml |  1 +
>  include/dt-bindings/interconnect/mediatek,mt8196.h | 48 ++++++++++++++++++++++
>  2 files changed, 49 insertions(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


