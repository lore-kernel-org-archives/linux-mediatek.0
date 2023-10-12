Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A297CCDB47E
	for <linux-mediatek@archiver.kernel.org>; Thu, 12 Oct 2023 10:17:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5GNR334KaZapUm1QfaPEw5j8Y5tOGjKA5NGZBsDzpGw=; b=4+R/4sd2xBcEgZ373Nh8UrZAAo
	Iti5xICARxmn+mO11sz9bbBR3ioJeWYo/20y67rQxTBxESnt/Rtz1JGWDyzXjAMwnfsBW4rDxZ9cP
	UMAb0XBJew+gqi7wYgFXHNYvCoyWo2Xq/DokcRPaRSRKCuq/2siMXlb+QeyStE+DYxon9R+mKiRH+
	CHCqCiiRf0zldHgVBpiqAPKtLxPFPaR45uCdlMN+XuEhp0i3jzvacptb0scDcXjiSjZq7k55h+qh0
	+FbKkXdSAT8SZOXGRuidN54AVecKcRIjIHwAeG7D7hdfZ7Ws1ZvjB18+t/i9+xcgKVitKYo2vvnY7
	/2uOYorg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qqslF-000d09-1w;
	Thu, 12 Oct 2023 10:17:45 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qqslC-000cxV-10;
	Thu, 12 Oct 2023 10:17:43 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 5F39E660730F;
	Thu, 12 Oct 2023 11:17:40 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1697105861;
	bh=g3ns2c4RoQU8nzXEQ8VUyBiWwm9Ooa52x4tpLHq9B+0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=fC555cNGl+Ly1HW1tK2ksVyK0MG/FjTo1j7THokikv5Pi+FlMYaEBcFRQIq/sOJPq
	 gG8CzEadDaVkkrjxrtNyi12WdRGBXqVWmTcsB0emaDAOaTXsv4J1cbYFWlurVuC8Tr
	 6CgODM0m3/HeVgY6dTl+qoBlhstBeHXlbkLdQqX0CxnDpSJzWb/V6VQ0ZTupzKmH7c
	 LVaIRests9W7dMrsDPtZmcD4iplXgD0o2NbQrBB2sDIOxYVMqFd/6Yl9eIQHcTx6OY
	 mwSwZBOOJSCir8hJTx0yTTvX2jIWRnD8CiwjAJTPDpoG5txZRgj+VsbFf36wXe0beU
	 66/Mjz8eo1p+w==
Message-ID: <bf2cf999-7a1a-df14-7ba9-ac5047c998c0@collabora.com>
Date: Thu, 12 Oct 2023 12:17:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [PATCH v7 09/16] dt-bindings: media: mediatek: mdp3: add
 component TCC for MT8195
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
 <20231012084037.19376-10-moudy.ho@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20231012084037.19376-10-moudy.ho@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231012_031742_473995_7D71CBAC 
X-CRM114-Status: GOOD (  13.95  )
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
> Add the fundamental hardware configuration of component TCC,
> which is controlled by MDP3 on MT8195.
> 
> Signed-off-by: Moudy Ho <moudy.ho@mediatek.com>
> ---
>   .../bindings/media/mediatek,mdp3-tcc.yaml     | 62 +++++++++++++++++++
>   1 file changed, 62 insertions(+)
>   create mode 100644 Documentation/devicetree/bindings/media/mediatek,mdp3-tcc.yaml
> 
> diff --git a/Documentation/devicetree/bindings/media/mediatek,mdp3-tcc.yaml b/Documentation/devicetree/bindings/media/mediatek,mdp3-tcc.yaml
> new file mode 100644
> index 000000000000..f134160f85b9
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/mediatek,mdp3-tcc.yaml
> @@ -0,0 +1,62 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/media/mediatek,mdp3-tcc.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: MediaTek Media Data Path 3 TCC

MediaTek Media Data Path 3 Tone Curve Conversion


after which:

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

