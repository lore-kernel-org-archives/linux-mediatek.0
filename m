Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2916C4828D
	for <linux-mediatek@archiver.kernel.org>; Wed,  7 Feb 2024 14:42:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XGfmfST/BViKzpKiY6ERAlywpmcLIYg8T0mzXMAhsMY=; b=Zczu0MvaqzItWm/0yHufXUZXTi
	GcUP1vBqpVlxCho2DEA5PFsXMQCk+hBhA5Kv3qqV42oUz+Dn44eSi0zoWop5bZoCLDmskb6CLZ1u6
	WGfU4NOqjwmpCyNjym+iFo1UUd7jDgV+/Lrk9H0LFGSVFP81Ug8OEUrLNXAKKrBvhJpKcOkODSxXT
	0JX4hUYLQ9ulImBLQrNNPMhN2OT2zRRQNvcyLOqGTEYFAwxwSspCzXNfn8lJe4LYdW+J9lGd2cpLc
	LUZB/KUtsAkkc0qF0DJvHJr1MXVsoHlPXpzOBOR1P6o9MgmLooMJ46fXrjs/UHNh/Q4+WCDgoD88/
	GaxsP44Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rXj8N-0000000AwRB-1CQJ;
	Wed, 07 Feb 2024 14:42:43 +0000
Received: from madrid.collaboradmins.com ([46.235.227.194])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rXj8K-0000000AwPZ-0m4p;
	Wed, 07 Feb 2024 14:42:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1707316958;
	bh=lgwC+nQacpQt17RsMVSyGHUSSBjw2SwJRYu3FKz012I=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=ByAuNcuj3mlohoOnzvl7BmdLkgeOwehNmhTKZVdeqQBeznicf4Zw/sVSNXOThDjBM
	 zcN654bub8cEGpt1kCxTHDioCOR5AnYbxSEwVPv0akvQXtpAs7DcI4CCgFDt6aRQNF
	 l7UUtrqbUtH+470b0VC/OBbmtVrQbIJswD6ouu7A4Qo/RxWwEc+UkdHFoHAshLZ2yo
	 BR25qkuB1WJSz4lsFxjwUZ9YJL0/hCvJMlK2jiOLaqnt+K2TW9+A7OQbMqj60XNs/Y
	 l3NiXMG3YrupnomL5/2KEjMYhX3oNrp3BDiVaRptVsVTBvwYpgVbT2VUCOIORKO2v+
	 P5d7mSnz85pTA==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 368913782059;
	Wed,  7 Feb 2024 14:42:36 +0000 (UTC)
Message-ID: <420ee120-2962-4848-b76f-b32ed70e70b0@collabora.com>
Date: Wed, 7 Feb 2024 15:42:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/2] media: dt-bindings: i2c: add GalaxyCore GC08A3
 image sensor
Content-Language: en-US
To: Zhi Mao <zhi.mao@mediatek.com>, mchehab@kernel.org, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, sakari.ailus@linux.intel.com
Cc: laurent.pinchart@ideasonboard.com, shengnan.wang@mediatek.com,
 yaya.chang@mediatek.com, 10572168@qq.com,
 Project_Global_Chrome_Upstream_Group@mediatek.com, yunkec@chromium.org,
 conor+dt@kernel.org, matthias.bgg@gmail.com, jacopo.mondi@ideasonboard.com,
 hverkuil-cisco@xs4all.nl, heiko@sntech.de, jernej.skrabec@gmail.com,
 macromorgan@hotmail.com, linus.walleij@linaro.org, hdegoede@redhat.com,
 tomi.valkeinen@ideasonboard.com, gerald.loacker@wolfvision.net,
 andy.shevchenko@gmail.com, bingbu.cao@intel.com,
 dan.scally@ideasonboard.com, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
References: <20240204061538.2105-1-zhi.mao@mediatek.com>
 <20240204061538.2105-2-zhi.mao@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20240204061538.2105-2-zhi.mao@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240207_064240_386381_FB754157 
X-CRM114-Status: UNSURE (   5.40  )
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

Il 04/02/24 07:15, Zhi Mao ha scritto:
> Add YAML device tree binding for GC08A3 CMOS image sensor,
> and the relevant MAINTAINERS entries.
> 
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Signed-off-by: Zhi Mao <zhi.mao@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



