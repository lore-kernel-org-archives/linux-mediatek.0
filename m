Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF4E3CF9C6B
	for <linux-mediatek@archiver.kernel.org>; Tue, 24 Sep 2024 11:50:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aEDJAqgCXWC3pGAWI44tEEj3mgJve+axRglCkHWLoWs=; b=rm3h1bb/P+JcWNsQs1OIA+Fj6A
	Lw5YWiunIOfGBGF8GyXdJnodFwOYrxAg5ox1zaL6GMI354gfKJarXBWwVvQdP9LK258FhxmqhoBFV
	Zc0C8TG4aPOBidS1iO1DBf8sXUjTShxTZdQSgSvKGrY4jHnmL8GoCzQFTv4m0uPyrRLPrmg8k79D6
	awLYrw3PQN73/m797MJJRanrOnU3/GPuRkodxuqz18SjWCUf0tNaE+zVSESr56gwkHfbOCQuX3oI+
	eriK9NmIuI37il7W1W6bT1p674EP9WBow8+q8KtLbL/e2Cp4YT+H677OLYhMoG/6OEjnevZ3RzXSD
	UAcaezFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1st43i-00000002EGU-3BVk;
	Tue, 24 Sep 2024 11:50:22 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1st41n-00000002Du8-1EWA;
	Tue, 24 Sep 2024 11:48:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1727178501;
	bh=hbs0QfvrCF5e6YpC+UbZ6TJfsmRJxVnWq7hDZ1/K6Ks=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=I4IKKd5H3566701rXcsWtf+cZdAG0lkh+4wD0qQKkxBgWEHwR5Mxvgx/LCeOuzN3N
	 GHSO0cieZrRzaX83JAamBT8rHuNeEdFTENuf9OpBT4f15sXRMIzgD+wVOYKpoF3fTu
	 NMkqqthmzC8Jq9BbhjTG3boBZKd7hNM8oSbdZhkPpIu1iZtD4hqeDp3FyxVWP3v+kM
	 WDkJ/td9ArfFdeJ0mOZHUHK0Ys1WrZGxceXB0bmp1PwumaN5uZf89EI0OmJ3FIMoN5
	 5oCoxuvorVJobi5dn5pLv3fv62Z+70EOC73ka6MnHqzT6p4rmfla1GkiyjR+gZL6K+
	 EtTtBLAHHVfdg==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id AA93E17E125E;
	Tue, 24 Sep 2024 13:48:18 +0200 (CEST)
Message-ID: <ed0c25ba-2816-4d4b-9023-2e07976f4341@collabora.com>
Date: Tue, 24 Sep 2024 13:48:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/6] dt-bindings: display: mediatek: dpi: Add mt8195
 support in power domains
To: Macpaul Lin <macpaul.lin@mediatek.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Yong Wu <yong.wu@mediatek.com>,
 Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
 Robin Murphy <robin.murphy@arm.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, dri-devel@lists.freedesktop.org,
 linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, iommu@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org,
 Alexandre Mergnat <amergnat@baylibre.com>
Cc: Bear Wang <bear.wang@mediatek.com>, Pablo Sun <pablo.sun@mediatek.com>,
 Macpaul Lin <macpaul@gmail.com>, Sen Chu <sen.chu@mediatek.com>,
 Chris-qj chen <chris-qj.chen@mediatek.com>,
 MediaTek Chromebook Upstream
 <Project_Global_Chrome_Upstream_Group@mediatek.com>,
 Chen-Yu Tsai <wenst@chromium.org>
References: <20240924103156.13119-1-macpaul.lin@mediatek.com>
 <20240924103156.13119-6-macpaul.lin@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20240924103156.13119-6-macpaul.lin@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240924_044823_521031_3AD1BA40 
X-CRM114-Status: GOOD (  15.33  )
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

Il 24/09/24 12:31, Macpaul Lin ha scritto:
> Add power domain binding to the mediatek DPI controller for MT8185.
> 
> The dpi node in mt8195.dtsi was triggering a dtbs_check error:
>    dp-intf@1c113000: power-domains: False schema does not allow [[44, 18]]
> 
> Fixes: 5474d49b2f79 ("dt-bindings: display: mediatek: dpi: Add power domains")
> Signed-off-by: Macpaul Lin <macpaul.lin@mediatek.com>
> ---
>   .../devicetree/bindings/display/mediatek/mediatek,dpi.yaml       | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.yaml
> index 3a82aec9021c..07acc8a76bfc 100644
> --- a/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.yaml
> +++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.yaml
> @@ -89,6 +89,7 @@ allOf:
>                   - mediatek,mt6795-dpi
>                   - mediatek,mt8173-dpi
>                   - mediatek,mt8186-dpi
> +                - mediatek,mt8195-dp-intf

The dp_intf1 block has a power domain (VDOSYS1)... so that will break the check
for the other one.

Besides, I'm fairly sure that the right fix is to actually add the missing VDOSYS0
power domain to dp_intf0 instead, as that block is indeed in VDO0.

So.. for this patch: nak.

Cheers,
Angelo

>       then:
>         properties:
>           power-domains: false



