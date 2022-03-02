Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5CACC433EF
	for <linux-mediatek@archiver.kernel.org>; Wed,  2 Mar 2022 13:26:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:MIME-Version:
	Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Q4YtV9HrzbY4s5xS3yykSFWE2JXTQb/41q9W7c7mA58=; b=bDjf7XW3rn6+sEKfdiXjJRNNAr
	UxM6EzsrTCjiuX9ts8ta71Q3+ct2ru+V87MIQldVIrvlzpReHfe79VrZu7Y8ichcP160DNcR0aWYB
	vuORlvgpOXL37y7V02HAFJGdjpaXLlbo/kUAf8adHLS+QCk4+HAUD8X0TmDUOpawd6uvrESVVWVP3
	xU3oWYcukiqQMDSyzumd+B1oHmmnguB5sAQYSOgDFrx2IjWhILYhaXcjy6H3JpWSXmVoigMTY6WGO
	oVcZt2CJxoYT18zWMSAkcXkw+EJ9hDCYfgidqK35LKr/qveMLFYC4HqOkyzaJXY8cvC2UgULPDu4Z
	krfy+ing==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nPP01-002nQ5-7y; Wed, 02 Mar 2022 13:26:37 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nPOzf-002nGr-Mz; Wed, 02 Mar 2022 13:26:18 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id E9A591F44E0D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1646227574;
 bh=vIbI9aNzOb5Yz1Pb7B8zVtgYkA/gIFiYF+AyCtFN6y8=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=mO/NL1EeZ7vpHaJLT+lciSlTguGF2C81AFnzhEdgFH6TC5y/Brb9oJ6+DxM9vmujM
 FELXibdgQSP7F7AtjgHoJDL3a4XzhsaWXLM0hEj0TqZsGocHvvvkbUH3sVZpNsS0x+
 za59oWN6X7M+SQN6r4hKc/wKjXYFI3u8I+wMcLcUyguRhVOLZIpg8dG0qBTnXDepfb
 Bb9vGfTK0Y28bV1ElQ5DZ5sdEh/ZV7RkRBvxL+zqLui/ITL7YP9aJVeJm8AHIUgL6s
 pKd95O0mBomkxpuTZEeNb4nwOVKA3E27bdgZwe0xPw0qyfPJLt7r6oThxqXyF1On7u
 DRtsfAzLL1KMA==
Message-ID: <f006d46c-8060-3bee-b589-5e39c1ebf768@collabora.com>
Date: Wed, 2 Mar 2022 14:26:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.1
Subject: Re: [PATCH v15 00/12] Add Mediatek Soc DRM (vdosys0) support for
 mt8195
Content-Language: en-US
To: Jason-JH Lin <jason-jh.lin@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>
References: <20220126071932.32615-1-jason-jh.lin@mediatek.com>
 <c73eefcbf85cbb1eb9d1278e675608f8d9775693.camel@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <c73eefcbf85cbb1eb9d1278e675608f8d9775693.camel@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220302_052615_981168_3905063F 
X-CRM114-Status: GOOD (  15.53  )
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
Cc: devicetree@vger.kernel.org, Jitao shi <jitao.shi@mediatek.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, David Airlie <airlied@linux.ie>,
 linux-kernel@vger.kernel.org, singo.chang@mediatek.com,
 Alexandre Torgue <alexandre.torgue@foss.st.com>, roy-cw.yeh@mediatek.com,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 Fabien Parent <fparent@baylibre.com>, moudy.ho@mediatek.com,
 linux-mediatek@lists.infradead.org, Daniel Vetter <daniel@ffwll.ch>,
 hsinyi@chromium.org, CK Hu <ck.hu@mediatek.com>, nancy.lin@mediatek.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Il 14/02/22 11:13, Jason-JH Lin ha scritto:
> Hello Matthias,
> 
> The DRM parts are all reviewed by Chun-Kuang.
> Can you spare some time to give us some suggestion for mmsys parts?
> 
> Or do you think we should separate the driver of mmsys related patches
> to another series and resend again?
> Would it be better to combine mmsys related patches from vdosys0 [1]
> and vdosys1 [2] series?
> 
> e.g.
> [v1,0/7] soc: mediatek: mmsys: add mt8195 mmsys support
> [v1,1/7] dt-bindings: arm: mediatek: mmsys: add power and gce
> properties
> [v1,2/7] dt-bindings: arm: mediatek: mmsys: add mt8195 SoC binding
> [v1,3/7] dt-bindings: reset: mt8195: add vdosys1 reset control bit
> [v1,4/7] soc: mediatek: mmsys: add mtk-mmsys support for mt8195 vdosys0
> [v1,5/7] soc: mediatek: mmsys: add mtk-mmsys support for mt8195 vdosys1
> [v1,6/7] soc: mediatek: mmsys: add mtk-mmsys config API for mt8195
> vdosys1
> [v1,7/7] soc: mediatek: mmsys: modify reset controller for MT8195
> vdosys1
> 
> ---
> [1] Add Mediatek Soc DRM (vdosys0) support for mt8195
> -
> https://patchwork.kernel.org/project/linux-mediatek/list/?series=608548
> [2] Add MediaTek SoC DRM (vdosys1) support for mt8195
> -
> https://patchwork.kernel.org/project/linux-mediatek/list/?series=604065
> ---
> 
> Regards,
> Jason-JH.Lin
> 

Hello everyone,

I think that all the drm/mediatek and soc/mediatek patches in this series
are safe and ready (and also tested for regressions on older SoCs).

Feel free to pick them in your trees.

Cheers,
Angelo



_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
