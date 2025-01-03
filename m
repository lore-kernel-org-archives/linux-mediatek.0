Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 041C8E77198
	for <linux-mediatek@archiver.kernel.org>; Fri,  3 Jan 2025 09:42:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eJyhb00NSmaSXwChC05EgANTEYBgS1IvRh2cmjZf7IE=; b=cgJarARQG98e0M
	+Drt/jZP18K6bRobS21SgNWPuqGaiInUmqEbvmXFZHLpNC74564/8B23ZnWIrk4hDIKzay1ClKX4v
	ZNJ0aYN8TL54T91tl/pXwN2Qolt1JuPn8Ma7dlO4b9rOdFfSd6/35IUWH0+WafDTfH9Opzq3KKQ+I
	dTTTPb2XicatlyYdvLlHRaUMpIO4ub5haZWrVJDG/zHLGHcVBO6y7WbeFyJjB0ufst5+MfuWI6W02
	yC1HqYL7GJzvOnW8P0P0gElR1/c37wc59wOdZQjic9Y39lrlYNSdOYOIify1eNt8dpzbcx04OA8xk
	ZOgbNON0q7ZUp9K61j6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tTeC2-0000000Ceh0-37kv;
	Fri, 03 Jan 2025 09:42:10 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tTeAq-0000000CeYb-0AVV;
	Fri, 03 Jan 2025 09:40:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1735897254;
	bh=5vztbglS15xfKUbDC0vnLnilTZgDf+eQTTloOlJ6PzY=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=GL+kYDBxGaj2JbhB31ScE3ZtMIvO1L52hieMQmb4KxB+BjlshE5t4oUSGDjoEGglY
	 3p+zpaULxfHftzj2Zx+N8v6ZjqDkbLX2Vs35/02d6kPK0q+xLJ3g9NV5WUqCl0Qwla
	 Rr0GAaSKGs0FMigIsaNc1Lx++qE8aQzMzldn0+Wu+3hUO9zM3JWXhl5iLrFgRzUkRR
	 CDdMWBdCGENkraKEFyBK8kkum7w1Le3ZnNlIZieV7KFBJIdB6zfqpV/qu8XNAhmopj
	 lomCwAamuJoNIP/qAQAvA0++VB0yGzGeIzRQV0azedbx3jwk7RXNsLXmy5zH1W3LpE
	 o+p8kVDiHYvxQ==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 9EB1E17E1541;
	Fri,  3 Jan 2025 10:40:53 +0100 (CET)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 "Jason-JH.Lin" <jason-jh.lin@mediatek.com>
In-Reply-To: <20241219181531.4282-1-jason-jh.lin@mediatek.com>
References: <20241219181531.4282-1-jason-jh.lin@mediatek.com>
Subject: Re: [PATCH v3 0/4] Update MT8188 OVL compatible from MT8183 to
 MT8195
Message-Id: <173589725358.61653.1284687133545128429.b4-ty@collabora.com>
Date: Fri, 03 Jan 2025 10:40:53 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250103_014056_238637_10A70578 
X-CRM114-Status: UNSURE (   9.44  )
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
Cc: devicetree@vger.kernel.org, Singo Chang <singo.chang@mediatek.com>, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, Project_Global_Chrome_Upstream_Group@mediatek.com, Pin-yen Lin <treapking@chromium.org>, Nancy Lin <nancy.lin@mediatek.com>, linux-mediatek@lists.infradead.org, Shawn Sung <shawn.sung@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>, linux-arm-kernel@lists.infradead.org
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Fri, 20 Dec 2024 02:15:27 +0800, Jason-JH.Lin wrote:
> This patch series updates the compatible strings for the MediaTek OVL
> in the MT8188 dts and the corresponding dt-binding.
> The changes ensure that the MT8188 OVL device is correctly identified
> and managed by the appropriate drivers.
> 
> The first patch is adding the MT8188 compatible strings, refer to:
> - https://lore.kernel.org/all/20241218105320.38980-2-angelogioacchino.delregno@collabora.com/
> 
> [...]

Applied to v6.13-next/dts64, thanks!

[1/4] dt-bindings: display: mediatek: ovl: Add compatible strings for MT8188 MDP3
      commit: eb27e8d75b83c0781eb330f356d4442177674e74
[2/4] dt-bindings: display: mediatek: ovl: Modify rules for MT8195/MT8188
      commit: 5ecd1e700b67b33fac1a48d86fea124b6c19d052
[3/4] dts: arm64: mediatek: mt8188: Update OVL compatible from MT8183 to MT8195
      commit: 7c791dc2cb62f8ec523872108c8a8c718512c218
[4/4] dts: arm64: mediatek: mt8195: Remove MT8183 compatible for OVL
      commit: f72561bf756baba4ab300bfc728fefd85c67913e

Cheers,
Angelo



