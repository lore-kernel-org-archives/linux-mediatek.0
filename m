Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D94F7C07CB1
	for <linux-mediatek@archiver.kernel.org>; Mon, 27 Nov 2023 13:27:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yAq4dPEchi5TPJO00Z9IQ/xMrpvp7tQ1sS/kQItu6VE=; b=A3GKVlSfJRjbo1xUbGz60ZMQ/t
	Ig7DeNdHX7mNFxpcw51RZxis1cS5KgqO1Dtq1oNncetbwzFuCLRY6R06d/6WgHi71Uds1j7Q9AcD4
	zdP/1P8uWfBuT1jebmjcksyi4jEedubITT8lFlxwclw7LlMAN8kUEOYjbDBEvsHhkNn8YNiThcHWV
	do7r7KzZhCpvMnrD5A70vza5Yti5IRjvMN1DvaMtz60En7nL6LC/fq8yPEVWfVfeZrkfU90gtSrcs
	WvuokTthJqDbzrPTy6rgSIJeyM9keYF1ov29FkVMnsgoNGlqpgIgBI0oY2Du1UmxSuqjtWBP1iVZ/
	AorwLy8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r7be5-002ZYW-2v;
	Mon, 27 Nov 2023 13:27:29 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r7be2-002ZXB-20;
	Mon, 27 Nov 2023 13:27:27 +0000
Received: from [100.107.97.3] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 6D4BD6605835;
	Mon, 27 Nov 2023 13:27:23 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1701091645;
	bh=DvdTt/2joGjmSG0un+grPJz1gQ9C99woeiwQLvx7PIk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=ace0jcUMaaLGzfJzHjPcsPWpVDpK61lQJqlhON6SE7GegzdsUn9vpO+Z9u1MI5rId
	 1vtulJdlAyIsPGpiW5q+PnkJmR3phB4bqhdb8wLz5wO8XRfckZFk76iONud5D2ea2c
	 JCRrx87PpeqCgmT+bMDxeKGUb5XwZIRnf7/z8otHa8CuxabDO+HxOWIPdpbKCqazo1
	 1pOmwdm9ZayP4qnNV1RDPygEGag9iiiYiqXbOVwFna0+KNmlE1odL4/4gVKrH2vdvP
	 zNZv5Try393NNMHGSByfDITJbKle6eCPibneDaIPvIn3HMTCsvJIeTdPE+9VHcIbIF
	 wCZ1f0J5ctnuA==
Message-ID: <18516d3d-f866-41de-9045-ed9b4da94697@collabora.com>
Date: Mon, 27 Nov 2023 14:27:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] arm64: dts: mediatek: mt8195: add DSI and MIPI DPHY
 nodes
Content-Language: en-US
To: Michael Walle <mwalle@kernel.org>, Chun-Kuang Hu
 <chunkuang.hu@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Chunfeng Yun
 <chunfeng.yun@mediatek.com>, Vinod Koul <vkoul@kernel.org>,
 Kishon Vijay Abraham I <kishon@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Jitao Shi
 <jitao.shi@mediatek.com>, Xinlei Lee <xinlei.lee@mediatek.com>
Cc: dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-phy@lists.infradead.org
References: <20231123133749.2030661-1-mwalle@kernel.org>
 <20231123133749.2030661-4-mwalle@kernel.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20231123133749.2030661-4-mwalle@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231127_052726_798848_55F1F498 
X-CRM114-Status: UNSURE (   5.97  )
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

Il 23/11/23 14:37, Michael Walle ha scritto:
> Add the two DSI controller node and the associated DPHY nodes.
> Individual boards have to enable them in the board device tree.
> 
> Signed-off-by: Michael Walle <mwalle@kernel.org>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


