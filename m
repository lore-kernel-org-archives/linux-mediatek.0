Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D5F9CD4F21
	for <linux-mediatek@archiver.kernel.org>; Wed, 13 May 2026 19:03:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GdXLQIho8TrhnBI8/E4VzCFjFoB5ng7Z8UQwDMJOZM8=; b=lCVocjZJmKg2usHKjbx8FjI0RA
	sMxvMKzCR5NaXS6uLHPvfJyvicg4u2n7SagHiBPP16O7KKXAuu3o9loWnuqC29sQqZgci4WudHgBF
	AynZYiVl0a3bNb/teTuipN9P2arW/7VMqdztWmrBu12BCfS7YKoq0Mg6XqKx0DCnElXT8SaVyh6hq
	Nw0a0vpZAiKioBAyMOO3zkVB287sGNoMzwNjRkOK3/4zKPp8uX3aj3D3QvBZhlWrYkxKV449zUICr
	A/aDxcRrW9B1qj3S8h54W2Gnranj2/84orB4slFdJVfLjuVG5/WhjV8QtM8x8HqKmcAFv3UgXrtgY
	lft40/EQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNErP-00000003Wat-0JeW;
	Wed, 13 May 2026 19:03:11 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNErM-00000003Wa1-1uFm;
	Wed, 13 May 2026 19:03:09 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id CFC3B42A4E;
	Wed, 13 May 2026 19:03:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6EAC4C2BCB7;
	Wed, 13 May 2026 19:03:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778698987;
	bh=EFHyCV5Fzy8lGU/TCEK6Y6BJe4DrIl8NrL1B869ZVsM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ctcRFAXlqMutmFA6F/+gFzVfl4BL8HfCR1MZmVwUsvKfoeiFexzmU7e1ULgorBHya
	 vOLibPt5AAjx/H/IiEvnLBN4/MRP6qEXdju7mbASCoQG2VFpTzbQPodE9xSeO4Ibmi
	 OjSh0jm8fpxd27hlo7GYc/70GZoq4kHyvTQSvICc6OecO//a3aFKpRj0zRtuKUfltq
	 icI3GYe1TuVDTqSHtBAXEYbn5X8IqgboNkbpxwfBK6R/JVsIjQrK4mp/48wJ4KaC/e
	 nF4op8QaKdOdjN2NfAFFTEolmxUzGFTRbN76BNpSboJthpTYkOr/YllfGpNZtDD0bK
	 5OnkVEJXgJ2Ig==
Date: Wed, 13 May 2026 14:03:04 -0500
From: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Conor Dooley <conor.dooley@microchip.com>
Subject: Re: [PATCH v2] media: dt-bindings: mediatek: Constrain iommus
Message-ID: <20260513190304.GA1677938-robh@kernel.org>
References: <20250821065900.17430-2-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250821065900.17430-2-krzysztof.kozlowski@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260513_120308_515614_BF221E0F 
X-CRM114-Status: GOOD (  11.18  )
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

On Thu, Aug 21, 2025 at 08:59:01AM +0200, Krzysztof Kozlowski wrote:
> Lists should have fixed constraints, because binding must be specific in
> respect to hardware.  Add missing constraints to number of iommus in
> Mediatek media devices and remove completely redundant and obvious
> description.
> 
> Acked-by: Conor Dooley <conor.dooley@microchip.com>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 
> ---
> 
> Changes in v2:
> 1. Ack
> 2. Mention dropping description
> ---
>  .../bindings/display/mediatek/mediatek,ovl-2l.yaml           | 5 ++---
>  .../devicetree/bindings/display/mediatek/mediatek,ovl.yaml   | 5 ++---
>  .../devicetree/bindings/display/mediatek/mediatek,rdma.yaml  | 4 +---
>  .../devicetree/bindings/display/mediatek/mediatek,wdma.yaml  | 4 +---
>  4 files changed, 6 insertions(+), 12 deletions(-)

Applied, thanks.

Rob

