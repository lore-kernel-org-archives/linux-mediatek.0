Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1DB26CD11DD
	for <linux-mediatek@archiver.kernel.org>; Mon, 25 Mar 2024 08:30:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JtSgWHk1xHAhI5zxMgtFggLv8t4JQ9ZRtaS4KfZWjYk=; b=EbAC9fJ/m90SGS7NzBozws5Fua
	+/cVyHi9fZyyG7dnG9uZaUEZHdg0pvZBlW7I2AX7xZYZ353mi1+3rsauHfSU8/QPVUM1a5zwT5mc2
	tAT7Igfi2oins5dc2zVyOq1Gu8e4JCbe9tMqpHk9rkTTfMfLTp3pTC/uvUcDYX46r3AbljkRDrSR9
	JbwRYjLJmWCQNVjqTyFufAcoEaLVtSbDO83CwLggTUUiEZuGvcOnT/bsQx6MaUfw61ZdeetW9OG6K
	RrKcfCNlxSUSQFWdXP4fkGCiIo2CSJjo9uNqroAiP6GZTemrRjDJ/wxC2V5icb+of+BRNMLdgEtrW
	Kg9+auAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rofik-0000000GANf-0w8O;
	Mon, 25 Mar 2024 08:30:18 +0000
Received: from madrid.collaboradmins.com ([2a00:1098:ed:100::25])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rofiW-0000000GAEs-1xAc;
	Mon, 25 Mar 2024 08:30:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1711355403;
	bh=WcjRvdfQ2EbQum9xWCjkiEU3kMs3JIEIAvUpABV232Q=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=0BBCJUwJ7vWjw3HrU5xaFXwV+xSULegmhfamw+lIn+trZZQiFHhl9jk1mZ2Q2cjYo
	 AiIAWSTeFlM9byqnX0Z2lMbZ/EAnx95k6Ojb3pEmJgkj2mAvV4BPVyWRK9XTCTBX5x
	 brzFmnzKmSQvTEca4b8Q7/u+cQocbgIGCUfap8KdtQDcWJJxMphuDCVUSYd09SroRa
	 g2uDARjYNHVfL089PTtXe2DXFayNNbKeOB30fEpDeT4EP6Qc61+wOuFLg+71+PZlLD
	 z10N5ghqVJsOkm6U9iOtTkG64KpuBSbWqIDaIZZmgzBuXEBx23ht9I6I64fnmD07Ul
	 pbvLZPF0sk5Lw==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 883D7378209C;
	Mon, 25 Mar 2024 08:30:01 +0000 (UTC)
Message-ID: <26c3e4e6-89b2-4411-b55b-8fad80d38c75@collabora.com>
Date: Mon, 25 Mar 2024 09:30:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] media: dt-bindings: i2c: add GalaxyCore GC05A2
 image sensor
To: Zhi Mao <zhi.mao@mediatek.com>, mchehab@kernel.org, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, sakari.ailus@linux.intel.com
Cc: laurent.pinchart@ideasonboard.com, shengnan.wang@mediatek.com,
 yaya.chang@mediatek.com, Project_Global_Chrome_Upstream_Group@mediatek.com,
 yunkec@chromium.org, conor+dt@kernel.org, matthias.bgg@gmail.com,
 jacopo.mondi@ideasonboard.com, 10572168@qq.com, hverkuil-cisco@xs4all.nl,
 heiko@sntech.de, jernej.skrabec@gmail.com, macromorgan@hotmail.com,
 linus.walleij@linaro.org, hdegoede@redhat.com,
 tomi.valkeinen@ideasonboard.com, gerald.loacker@wolfvision.net,
 andy.shevchenko@gmail.com, bingbu.cao@intel.com,
 dan.scally@ideasonboard.com, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
References: <20240323014751.4989-1-zhi.mao@mediatek.com>
 <20240323014751.4989-2-zhi.mao@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20240323014751.4989-2-zhi.mao@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240325_013004_953988_BDFF82B2 
X-CRM114-Status: UNSURE (   5.31  )
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

Il 23/03/24 02:47, Zhi Mao ha scritto:
> Add YAML device tree binding for GC05A2 CMOS image sensor,
> and the relevant MAINTAINERS entries.
> 
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Signed-off-by: Zhi Mao <zhi.mao@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



