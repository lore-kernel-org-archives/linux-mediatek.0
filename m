Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71B9DCDB47E
	for <linux-mediatek@archiver.kernel.org>; Thu, 12 Oct 2023 10:21:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=q1YJIEiFZJTjiIvgSuPxCA15/jyroCjXcgmC0qDAIXs=; b=O2S53jpMvgjy6MYRkx4g0EKvtH
	wJ+uMW0KzopD2aDivZmLDzGQAjhLgaG81haRFqYAIugmdT4zEB3YoAvCdsNqnQ0sC4TGu3uWcPBMk
	XoDizGCXH0d3kuZ7mHKvUyYtq2xPGMwMifDa1k8TFHkZ4CkEcrQP9TxoKts+3JrvnEUfTcyDurqsZ
	akOWoVV8RsuOOWtrZf+5M7YdmrMuuerLgKBJ2nkyjmsyPRfiBJsrmC4rWeZ3P4ic+HWhHGWGSAH+2
	uPWch16AUGYoPNEwImLuurNRQS/8rbKgHCfdbSTDnUPe0r5IRpO2LjdisXzD+/mHjdZOFxX/q5vmM
	p9Mcy2Wg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qqsoc-000eG5-1Q;
	Thu, 12 Oct 2023 10:21:14 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qqsoY-000eF8-1Z;
	Thu, 12 Oct 2023 10:21:12 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 7B7B8660730F;
	Thu, 12 Oct 2023 11:21:08 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1697106069;
	bh=a+fkA7bTx2HmKy1KBcir6vM3hIgk7fN7zSjSs52u8LQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=dh7UUQCdpNslVzlbMA4pDRnnP32NLBuzoe9urs7hXSxHGj9MkBvBqgPYVUyzY4aQ4
	 Ri+K66ougoMrSNU+x0KOlOv7WbA2nBDrhKQpWPA6eV7eUzjMiQseWAq5b1rept1m3K
	 IJPAVlHRKZEKTcPAnnqOP03C0gwmjGgIazFe7GAr5tdDUKsqnPzAqtKB2OEkWflIcT
	 euDYsaKrlGvIgJaov5scdSIx7vW8MkM5DE+geH4o++q2IaFjyWKKznX4GlFc4Z7RHO
	 di/y4JgtFVltcW3jlxV7uxg00kZxp/kS9/sRuXSHkgTrfpP+o8skGDYofmBSk27MiD
	 eJ8X89qdSAmTg==
Message-ID: <91d58b8b-aa63-70a7-253e-7f351a5b5e1b@collabora.com>
Date: Thu, 12 Oct 2023 12:21:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [PATCH v7 07/16] dt-bindings: media: mediatek: mdp3: add
 component HDR for MT8195
Content-Language: en-US
To: Moudy Ho <moudy.ho@mediatek.com>, Chun-Kuang Hu
 <chunkuang.hu@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc: dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20231012084037.19376-1-moudy.ho@mediatek.com>
 <20231012084037.19376-8-moudy.ho@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20231012084037.19376-8-moudy.ho@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231012_032110_651049_27F08325 
X-CRM114-Status: GOOD (  14.62  )
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

Il 12/10/23 10:40, Moudy Ho ha scritto:
> Add the fundamental hardware configuration of component HDR,
> which is controlled by MDP3 on MT8195.
> 
> Signed-off-by: Moudy Ho <moudy.ho@mediatek.com>
> ---
>   .../bindings/media/mediatek,mdp3-hdr.yaml     | 60 +++++++++++++++++++
>   1 file changed, 60 insertions(+)
>   create mode 100644 Documentation/devicetree/bindings/media/mediatek,mdp3-hdr.yaml
> 
> diff --git a/Documentation/devicetree/bindings/media/mediatek,mdp3-hdr.yaml b/Documentation/devicetree/bindings/media/mediatek,mdp3-hdr.yaml
> new file mode 100644
> index 000000000000..98db6cb4d03a
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/mediatek,mdp3-hdr.yaml
> @@ -0,0 +1,60 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/media/mediatek,mdp3-hdr.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: MediaTek Media Data Path 3 HDR Remapping
> +
> +maintainers:
> +  - Matthias Brugger <matthias.bgg@gmail.com>
> +  - Moudy Ho <moudy.ho@mediatek.com>
> +
> +description:
> +  One of Media Data Path 3 (MDP3) components used to perform HDR to SDR

A Media Data Path 3 (MDP3) component used to perform conversion from
High Dynamic Range (HDR) to Standard Dynamic Range (SDR).

after which

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



