Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36BA7C38142
	for <linux-mediatek@archiver.kernel.org>; Tue, 24 Jan 2023 15:31:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fIQp2ptsS6Ux38nmDo2o9VhBkEGwDWqTS5z1/vRnHOs=; b=oK+Cgo47zVK9JyamjwEjUJAY1p
	hRyruuwdPZv0qrJa/7C2nmzLWsRMGKi+Iwl7g3jRiS5cHCe0RJJ62jFzoO4lK9QXm9ZXZw/+lzr7d
	csmw22aC08Xfh27Fq6g6PXqEaI2CHUERivomsD46L/t+Z0za9uwUV/EydwLY6kUCf/BxwefDj6XP2
	d7WJ1US0NpyQXRcPT2sJFXx+s3pyRbcNw1T2PY90hqCqNCa01IaXk+ENSSwNIBDpqKXzOCsQBoMrA
	XS0kooHwckVxskT3OrraZduBf2jd4dC83jkQmi24yAKeaLYF03vTb2RMGiE1111YnA3dzhTqgA8xP
	CQwQtxfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pKLGm-004WGQ-GF; Tue, 24 Jan 2023 15:31:32 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pKLGX-004WAv-H7; Tue, 24 Jan 2023 15:31:19 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 5597C6602E26;
	Tue, 24 Jan 2023 15:31:12 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1674574273;
	bh=XzNWMNMUfZ0GUDmKAy/1fnLOVo23adcRjRtL+79OId8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Wd3alA47WJak7VwJSwj/g28hfDBPbDYB4YWhX2yIzbv1EFbkY6ZbZrfU9p8BL4kHG
	 GEkU5beBUZ/ETjL+r9EfyVo++qItpQADfj4QgrVgUZ+2uEuoNNtBJ1jT0KyM7lO0Sp
	 9+0LCBYKp6IdH8CAk+bkCIW7fhIHD/DR6xpkZMuao04IS9ItM4RVcBqrpnyuHQ8fQE
	 MAxPgcPckoC8LuSthZNtsFdpmnc3gsFrNAIGHXan86l9DBk1GfCavwpxVWkhFES1nj
	 +cu5fi0WFvmxIruSdHfV+HgCCsabSIAykerlE+LdrftpqxHNHh4kBxAauZYGi/W150
	 8AwvnJnfqkj8g==
Message-ID: <5dd5c795-5e67-146d-7132-30fc90171d4c@collabora.com>
Date: Tue, 24 Jan 2023 16:31:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v11 4/6] thermal/drivers/mediatek: Add the Low Voltage
 Thermal Sensor driver
Content-Language: en-US
To: bchihi@baylibre.com, daniel.lezcano@linaro.org, rafael@kernel.org,
 amitk@kernel.org, rui.zhang@intel.com, matthias.bgg@gmail.com,
 robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 rdunlap@infradead.org, ye.xingchen@zte.com.cn, p.zabel@pengutronix.de
Cc: linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 devicetree@vger.kernel.org, khilman@baylibre.com, james.lo@mediatek.com,
 rex-bc.chen@mediatek.com
References: <20230124131717.128660-1-bchihi@baylibre.com>
 <20230124131717.128660-5-bchihi@baylibre.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230124131717.128660-5-bchihi@baylibre.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230124_073117_830742_559E84CD 
X-CRM114-Status: GOOD (  13.06  )
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

Il 24/01/23 14:17, bchihi@baylibre.com ha scritto:
> From: Balsam CHIHI <bchihi@baylibre.com>
> 
> The Low Voltage Thermal Sensor (LVTS) is a multiple sensors, multi
> controllers contained in a thermal domain.
> 
> A thermal domains can be the MCU or the AP.
> 
> Each thermal domains contain up to seven controllers, each thermal
> controller handle up to four thermal sensors.
> 
> The LVTS has two Finite State Machines (FSM), one to handle the
> functionin temperatures range like hot or cold temperature and another
> one to handle monitoring trip point. The FSM notifies via interrupts
> when a trip point is crossed.
> 
> The interrupt is managed at the thermal controller level, so when an
> interrupt occurs, the driver has to find out which sensor triggered
> such an interrupt.
> 
> The sampling of the thermal can be filtered or immediate. For the
> former, the LVTS measures several points and applies a low pass
> filter.
> 
> Signed-off-by: Balsam CHIHI <bchihi@baylibre.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

On MT8195 Tomato Chromebook:
Tested-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

