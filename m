Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC511CF9C6F
	for <linux-mediatek@archiver.kernel.org>; Tue, 24 Sep 2024 11:48:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vfINCI0Nv4qEGkUKDJalDbhQLNyKDyfzRJYai1vsKVA=; b=T96dTxE2YgTw3EMMqq1V+9hA4T
	S0p8G7bFIRJADS3ZyykACzyQhoX0unO3v8+lkALSLW9tAI+1JU+6c/aLerh74imCR47eNgJ3bK2qC
	j+7th6L/A1C6e1Go/Y+lK3Tfw/xzWXjQN14y6DJFcpUNndP4F98ilPHPLR8SplvoVmyJYDYJB3Nue
	4KVyataKunUvvrdanECLyMgDXV0fkp9pdW64sf7ApgrBMvPkf3Urb4zJsWzyTCv4ntA4N8nEE3tAD
	J4Y5XGYdA2VNAALc4e7t008yyhFeXOvPveSw1MV3KqhrfXeVU8vddtTf3w930e8YoeiK3VmvNKsxX
	jTk/td2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1st41T-00000002DrG-3dpZ;
	Tue, 24 Sep 2024 11:48:03 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1st3wq-00000002D5k-3IOw;
	Tue, 24 Sep 2024 11:43:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1727178195;
	bh=SU5MDVugN9wq2UPurRQrLx+qX4c0j5tAS7Phiv68XM0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Wi77O6rqSD6tSZk8btni0aIKEOC6piGPVcqP1Heu5337fwpUGa50wSEojpHyHu87I
	 atAAuVDZFLKRV3Nud4DRyR7k7HryJuTUsY5sP8urmJXVzk4M0KE+C4PYEJG7CGalHW
	 aEi701FKGVKOOKWrqwg3RSkkW3OaVOWX3u9TmDhQ735c68De37y5Cy4UYyVsqkrcXm
	 4njlzguOP3/pRQCtKNk9TbjkqwZq/vLFKjqXe63ZuchL/jCQaawX0z3WDCfKLdypzs
	 rdFAywR+ocmuqagsyGYhs8cHnTKNn1azKASnWgt4rD1gg+SglTyfnTIB0O2yCXz0kj
	 oUtc6ybxbechQ==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 2505217E1250;
	Tue, 24 Sep 2024 13:43:14 +0200 (CEST)
Message-ID: <0b573e20-e08b-42e3-bc45-7db07fc6cf57@collabora.com>
Date: Tue, 24 Sep 2024 13:43:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/6] arm64: dts: mt8195: Fix dtbs_check error for mutex
 node
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
 <20240924103156.13119-5-macpaul.lin@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20240924103156.13119-5-macpaul.lin@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240924_044317_009153_E5A94BC9 
X-CRM114-Status: UNSURE (   9.09  )
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

Il 24/09/24 12:31, Macpaul Lin ha scritto:
> The mutex node in mt8195.dtsi was triggering a dtbs_check error:
>    mutex@1c101000: 'clock-names', 'reg-names' do not match any of the
>                    regexes: 'pinctrl-[0-9]+'
> 
> This seems no need by inspecting the DT schemas and other reference boards,
> so drop 'clock-names' and 'reg-names' in mt8195.dtsi.
> 
> Fixes: 92d2c23dc269 ("arm64: dts: mt8195: add display node for vdosys1")
> Signed-off-by: Macpaul Lin <macpaul.lin@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



