Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19144C44506
	for <linux-mediatek@archiver.kernel.org>; Sat, 11 Jul 2026 15:08:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RO0MF0UO52N/BtTir7O87MyPoM0YbxI8BeP9WMXMBa8=; b=0luIeEHEG+m7imL3L2evx9gczM
	o9y9j54OCEHAyLLO9qlJduqXP9a9GZoJ94RbWz+k7LgvKb7xKVHj0Uk7BdhU3fb6sOrNqu6P2Lt6Q
	EBKx0dl8BTkazh1RHl6k+b4U9Ntir/01Ai1hXQJ/wTZdmHcEJQvzBPIHTvf/DamMonxQevxWMBnq0
	pCHnNWnInB47FgWRJQNIxBk2s9FYjIej028O4xdTL9b2LQF3zNbRRWlLMpS+voaKYd5SfxA9v7Mzw
	x+Hf7EWqOpeVti/t4eZgF2NG4jVUTgGDivA+STOcLL70uZSYkoQUjnt+AwtGo9pNLkwN/XdmvQWdL
	ucyCKLPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wiZJg-00000006dNt-3uIn;
	Sat, 11 Jul 2026 15:08:32 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wiZJf-00000006dN9-2VNg;
	Sat, 11 Jul 2026 15:08:31 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id DF480411F8;
	Sat, 11 Jul 2026 15:08:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 050AA1F000E9;
	Sat, 11 Jul 2026 15:08:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783782510;
	bh=RO0MF0UO52N/BtTir7O87MyPoM0YbxI8BeP9WMXMBa8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=l2W6jO7GmyST4ZStZowKVuylMTRzj91JHzDKY1Bw8IYsi5tftBTA9nh7/2B1/Zzby
	 x4cErQwpyvltwy0553zx620THvjKjhoD8PEjb/uxzWchNnBt4CQRD3A8q9Inq+Jyqp
	 bHl9bKksHNU3y3/jBPD79OEgcEKEbI3Wy3f4x6YLKKyav5VszCO+YoswItWCm4H29e
	 pkKd90f/bQCtAvUrYnPLZ5mzgC93SEtGhtwJ5iVkag+vOuvra8Lu32rojl9EWnDG/e
	 ZUukR2eamLdZil3lfBWS3EHnx7Qo5ilnAuyHaVYzOisU9DQgS+iCex3PabUEq1X9Ev
	 GjO+bTlT7weUw==
Date: Sat, 11 Jul 2026 17:08:27 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: chunkuang.hu@kernel.org, p.zabel@pengutronix.de, airlied@gmail.com, 
	simona@ffwll.ch, maarten.lankhorst@linux.intel.com, mripard@kernel.org, 
	tzimmermann@suse.de, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	matthias.bgg@gmail.com, jitao.shi@mediatek.com, granquet@baylibre.com, 
	rex-bc.chen@mediatek.com, dmitry.osipenko@collabora.com, ck.hu@mediatek.com, 
	amergnat@baylibre.com, justin.yeh@mediatek.com, jason-jh.lin@mediatek.com, 
	dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, kernel@collabora.com
Subject: Re: [PATCH v4 02/12] dt-bindings: display: mediatek: dp: Add
 compatible for MT8196 eDP
Message-ID: <20260711-chital-of-incredible-gaiety-b390c7@quoll>
References: <20260709113148.49090-1-angelogioacchino.delregno@collabora.com>
 <20260709113148.49090-3-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260709113148.49090-3-angelogioacchino.delregno@collabora.com>
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

On Thu, Jul 09, 2026 at 01:31:38PM +0200, AngeloGioacchino Del Regno wrote:
> Add a new compatible for the Embedded DisplayPort IP found in the
> MT8196 SoC.
> 
> This IP is compatible with the previous ones, but not fully.
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
>  .../devicetree/bindings/display/mediatek/mediatek,dp.yaml        | 1 +
>  1 file changed, 1 insertion(+)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


