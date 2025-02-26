Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7A74C18E7C
	for <linux-mediatek@archiver.kernel.org>; Wed, 26 Feb 2025 14:38:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ch3NGv37NcB7K7eYD5lO4gl3z19aKzb9mYBAeq/Ppzk=; b=p45befVdp2oAgbuTYeO1Ue/Btu
	Yf5ocfo30crTSOjjhewN0iQV/taoC3Rfw8M+ZxIoBnMI7cQfoYtAB3AgwJ1ZgTKrmC1jpwXavZd0A
	OdGgu6w0eGqwNonMzKVGAjQ8UOUB4inaBVSHliEN0afhlUCHMk//xPZZMQ9hFRCOaRxGmghiYruNQ
	ZtMxao7rHOAaO2e60gAbc35pbF80ldW7JGFkAnVMF4DMMLn4jzqKIUmDifaVvHqxCVvd3jdmGNxmd
	lf5eSmsWphyH6nbGgTFfn+1ziSUTTkKdZ86nWaSM8T26MwfYYMLHynK1VMPTw2WMXblFvbjCpwNss
	FKwa7GXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnIY5-000000047lL-2mBD;
	Wed, 26 Feb 2025 14:38:09 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnGgx-00000003ikx-0Zva;
	Wed, 26 Feb 2025 12:39:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1740573548;
	bh=Be98U+3nuuSPxPyag9P+ADgagKKSNdsCQD96gtP6QyM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=TVokcpGW6T6rlNiHJ1PBSVs/Pu4XLYWfDKUY+5a+lNzwgyVZKfI/QCuF08TxawQfT
	 aNZnWSolzvrl8qXzo8n8PL0+VSi+EnT6bxaksECCHNGLx0cWH9+KR4CuiSYs5u3Y+M
	 etDWL3yql/ZsVhAWgBLlNQkrHvjZ5J1oOJurmjb3OjJD3fQSJOcZWfZVQpKndBHpWc
	 6EX/eg7UgJaPWjMuXc80TkOXXBqVEVXK3BHf9Cq/m+x5o+534iaQSaO47Ixp4nBdlU
	 kpp3ucNWUGGxM2lTo8EeQqXoLeUxmNbKL2YHzNBLCdjpKsYINxdNjxH5URJGHQ7P1E
	 D3LFh4MbhRc5Q==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 44AF317E061D;
	Wed, 26 Feb 2025 13:39:06 +0100 (CET)
Message-ID: <17850817-123d-41d9-9b1c-41ded05e2be1@collabora.com>
Date: Wed, 26 Feb 2025 13:39:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RESEND 04/12] drm/mediatek: move to
 devm_platform_ioremap_resource() usage
To: Anusha Srivatsa <asrivats@redhat.com>, Joel Stanley <joel@jms.id.au>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Andrew Jeffery <andrew@codeconstruct.com.au>, Stefan Agner
 <stefan@agner.ch>, Alison Wang <alison.wang@nxp.com>,
 Xinliang Liu <xinliang.liu@linaro.org>, Tian Tao <tiantao6@hisilicon.com>,
 Xinwei Kong <kong.kongxinwei@hisilicon.com>,
 Sumit Semwal <sumit.semwal@linaro.org>, Yongqin Liu
 <yongqin.liu@linaro.org>, John Stultz <jstultz@google.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Matthias Brugger <matthias.bgg@gmail.com>, Marek Vasut <marex@denx.de>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Orson Zhai <orsonzhai@gmail.com>,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 Chunyan Zhang <zhang.lyra@gmail.com>, Alain Volmat
 <alain.volmat@foss.st.com>, Raphael Gallais-Pou <rgallaispou@gmail.com>,
 Yannick Fertre <yannick.fertre@foss.st.com>,
 Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>,
 Philippe Cornu <philippe.cornu@foss.st.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Mikko Perttunen <mperttunen@nvidia.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Alexey Brodkin <abrodkin@synopsys.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 =?UTF-8?Q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>,
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
 Jonathan Corbet <corbet@lwn.net>
Cc: linux-aspeed@lists.ozlabs.org, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, imx@lists.linux.dev,
 linux-stm32@st-md-mailman.stormreply.com, linux-tegra@vger.kernel.org,
 linux-doc@vger.kernel.org, CK Hu <ck.hu@mediatek.com>
References: <20250225-memory-drm-misc-next-v1-0-9d0e8761107a@redhat.com>
 <20250225-memory-drm-misc-next-v1-4-9d0e8761107a@redhat.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20250225-memory-drm-misc-next-v1-4-9d0e8761107a@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250226_043911_329477_6F4D3ACF 
X-CRM114-Status: UNSURE (   7.41  )
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

Il 25/02/25 23:20, Anusha Srivatsa ha scritto:
> Replace platform_get_resource + devm_ioremap_resource
> with just devm_platform_ioremap_resource()
> 
> Used Coccinelle to do this change. SmPl patch:
> @rule_1@
> identifier res;
> expression ioremap_res;
> identifier pdev;
> @@
> -struct resource *res;
> ...
> -res = platform_get_resource(pdev,...);
> -ioremap_res = devm_ioremap_resource(...);
> +ioremap_res = devm_platform_ioremap_resource(pdev,0);
> 
> Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>
> Cc: Philipp Zabel <p.zabel@pengutronix.de>
> Reviewed-by: Maxime Ripard <mripard@kernel.org>
> Reviewed-by: CK Hu <ck.hu@mediatek.com>
> Signed-off-by: Anusha Srivatsa <asrivats@redhat.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



