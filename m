Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71774CDB482
	for <linux-mediatek@archiver.kernel.org>; Wed, 18 Oct 2023 08:03:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1SzkgGMZrjQ2+WGPT68szIwzLN/dEhw/FjUCPwDBph8=; b=jOcjbNhPzhn0AeT87gc30EeUXM
	W62AL6lo7SWPwsb8y9sl/i/F1iGK+UrGLJKjMQ7WvXz8rNPbhzYGLJhirm/PZV4/BhL54yhG5ZPHc
	hgMiywdehWbxyK2Nj+njtox1kj6k8yNVWbA14uSDPx9CgYjwFBBVEVOCJIRGpQLxnH7BW0UtyTUC1
	bJVVo4c8L1ssvWJ2DClmemirF3u6Gg5KAJNR2EIGybDTgFHg4yEkxHnakL/tf22mjlizv7XsVRtSR
	rq7X/k3jLh0lroXSerd+tc0slp4fAs+w8p3XXwEZtQRG0+1O4ZRhDEBQ1/Xf4etpoEi33UdoWxKvP
	vgdGgRuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qt1WJ-00E5mq-0a;
	Wed, 18 Oct 2023 08:03:11 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qt1WF-00E5kQ-1X;
	Wed, 18 Oct 2023 08:03:08 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 1FC1B66072F4;
	Wed, 18 Oct 2023 09:03:04 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1697616185;
	bh=BzCeLcDnyVpGNQ25QSxsx2zwulo4lGI2Vka4ybY5HjA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=NE+Dui5a6xhmhcondJxHHYw+UhK723wueVo/00NuAro4Oepei8lsvl6fVuZFnOoQk
	 LcPbBnYIomG9s6riHWfNHl5HyC6niRV68J/8LdrXHjzgmCBN5Fni80qvvER4t4/pHD
	 zJTsNYui4MBRXVDyrf6q5xRUA3IuoZnocvB1g2q9zIlibHdYgkqjVaSqE9CEE7rv+4
	 +qyVT9n2B1A/RwPq2xXoaGdIzxgCxtOUzBGxGVQAsf1Ia7Ux1IFI2+iAxe9SZMPlql
	 YtVACzVw80+8GZtrNeqg1+J2IUVGN7eG+wg+SEO3+GPtF3/qy3K1+oPZq8JbEjMB6b
	 WdOmAlm169YUQ==
Message-ID: <0130480d-aebf-44fd-9334-e288ac2ddc32@collabora.com>
Date: Wed, 18 Oct 2023 10:03:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 4/5] arm64: dts: mediatek: mt8192: Add thermal nodes
 and thermal zones
Content-Language: en-US
To: =?UTF-8?Q?Bernhard_Rosenkr=C3=A4nzer?= <bero@baylibre.com>,
 daniel.lezcano@linaro.org, rafael@kernel.org, amitk@kernel.org,
 rui.zhang@intel.com, matthias.bgg@gmail.com, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, dunlap@infradead.org,
 e.xingchen@zte.com.cn, p.zabel@pengutronix.de
Cc: linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 devicetree@vger.kernel.org, wenst@chromium.org, ames.lo@mediatek.com,
 rex-bc.chen@mediatek.com, nfraprado@collabora.com, abailon@baylibre.com,
 amergnat@baylibre.com, khilman@baylibre.com
References: <20231017190545.157282-1-bero@baylibre.com>
 <20231017190545.157282-5-bero@baylibre.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20231017190545.157282-5-bero@baylibre.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231018_010307_716891_1D9EF8A5 
X-CRM114-Status: UNSURE (   7.19  )
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

Il 17/10/23 21:05, Bernhard Rosenkränzer ha scritto:
> From: Balsam CHIHI <bchihi@baylibre.com>
> 
> Add thermal nodes and thermal zones for the mt8192.
> 
> The mt8192 SoC has several hotspots around the CPUs.
> Specify the targeted temperature threshold to apply the mitigation
> and define the associated cooling devices.
> 
> Signed-off-by: Balsam CHIHI <bchihi@baylibre.com>
> Reviewed-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
> [bero@baylibre.com: cosmetic changes, reduce lvts_ap size]
> Signed-off-by: Bernhard Rosenkränzer <bero@baylibre.com>
> Reviewed-by: Alexandre Mergnat <amergnat@baylibre.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


