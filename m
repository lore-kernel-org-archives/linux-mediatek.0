Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57AFDC531F9
	for <linux-mediatek@archiver.kernel.org>; Tue, 28 Jul 2026 09:59:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Type:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To
	:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XcpGEwAi/2YnkfZAtIkUhwvZ4Xx1tA03i/JXF0Vvceg=; b=qgaMrbQ/ldng+y9ynEsOWRHwgN
	GuNELtl8uIyAd45rbjEZ0GWdAg4AyavLMQ5O9jI5bQO/zbU97S86ebVlPvNRWN4CZ02fM0AKO4XAn
	QXhWR2n7pwpmFUmTE+55ljp2KxCMDcSdcT48gG2qfPVMEMtX/ymSZJwjn1LOQ++Nzv4I4c29+Ic0d
	4VcnobTnsw+pV8MKFBjy4n5CIc/W3FjwZwVhTgMIUJdsWdQ/SXtvKbn0bCd1XX3nNNLdTWnVXUqCj
	GzarSJC+RJX9sL0ctJUBNoz45Dqyrp/BC6ujg76TJIyZgcHc8pBsmzCLPnFYDSFziRU2eaRRXNfe9
	31+Am8LQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woeaw-00000004u8w-19OE;
	Tue, 28 Jul 2026 09:59:30 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woeav-00000004u8d-0z9g;
	Tue, 28 Jul 2026 09:59:29 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 8FCA44189F;
	Tue, 28 Jul 2026 09:59:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 65DC41F000E9;
	Tue, 28 Jul 2026 09:59:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785232768;
	bh=XcpGEwAi/2YnkfZAtIkUhwvZ4Xx1tA03i/JXF0Vvceg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=oNK++skCpKie7y91Mf4xhrJoE44OM2RCQgtjHIqx/mRp7w5oRQAJbeBu6uJ8wJNvV
	 sws0lWio7Bsuzhib5NY5fINLM/avUsuRaWKp7xRMBrbe0/6NVv+dG2BQSE/k7DLZfO
	 tPZlclunU96o0VdFCWsc2K0IdFmU/r0RtouWTm9dcLpnICdD7ynMyNl49e219kNwLv
	 j3RxuQbMSGMinDMJKwK1b5T6FC2cXFpWg7KH5NiNTlzzSh05FgJb7ehTMxqiLesG55
	 3vcQpTNxLOYb/moZIT3Y0m/pq8XlpUWeMPeStoldVzC5BmLrzLlWsJlXiHJPnqfN8E
	 gCakxy4UWzaVg==
Date: Tue, 28 Jul 2026 11:59:23 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: Re: [PATCH v2 1/2] dt-bindings: thermal: mediatek: Make resets
 optional for MT8196
Message-ID: <20260728-hopeful-phenomenal-stoat-3ec6e3@quoll>
References: <20260721105230.101906-1-angelogioacchino.delregno@collabora.com>
 <20260721105230.101906-2-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260721105230.101906-2-angelogioacchino.delregno@collabora.com>
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
Cc: robh@kernel.org, conor+dt@kernel.org, rafael@kernel.org, devicetree@vger.kernel.org, linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, wenst@chromium.org, laura.nao@collabora.com, jiapeng.chong@linux.alibaba.com, linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, p.zabel@pengutronix.de, daniel.lezcano@kernel.org, matthias.bgg@gmail.com, rui.zhang@intel.com, kernel@collabora.com, krzk+dt@kernel.org, lukasz.luba@arm.com, bchihi@baylibre.com
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Tue, Jul 21, 2026 at 12:52:29PM +0200, AngeloGioacchino Del Regno wrote:
> Both LVTS-AP and LVTS-MCU may be shared with SoC-internal MCUs
> running some sort of firmware that checks thermals in order to
> scale frequency, or to take action for critical SoC thermal
> protection - and this is seen on most MT8196 boards.
> 
> Make resets optional, as doing a HW reset on such boards will
> result in either an immediate thermal protect shutdown or in
> a rather important and usually permanent system slowdown.
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
>  .../bindings/thermal/mediatek,lvts-thermal.yaml     | 13 ++++++++++++-
>  1 file changed, 12 insertions(+), 1 deletion(-)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


