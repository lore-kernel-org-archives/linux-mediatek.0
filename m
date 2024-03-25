Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EEB72C54E64
	for <linux-mediatek@archiver.kernel.org>; Mon, 25 Mar 2024 08:30:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+nKLEkdWdzdFgN4vcxtbxd5hdMhqGILRieC54RsPRHE=; b=4k9Zwpt9HzMTGXwTw2V0i3Syf6
	pMmSNXe95ecZhfxMKGMATt0nsPDMjTg3oZSSGxRCKP9uUEalTUbux35bjw5cYhAb+/eJ1bXa5GbEs
	k4py+T8ZIjhRwafT+CyYMeV6dZc3Tz2e8NNYftg70VueGXVE0/QSzHYZYdEJpGTjJh9wGxyLzvYUS
	y7eD6SigTyB+vM7eKAjSRstKFhrJO0Hr0O+J0pBZZfVIcRbe3aaQek8vfcNzVxYMqDxv4RGAc+lsO
	tFqrSX/YOXpLr/T+tLnEpLyrhDHvNhYqNRTE5L1Eh7sfoWjEmC9h6+A5eTQ3KTrmcSrcfFNzAB3XW
	6RUVTOAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rofid-0000000GAIr-011H;
	Mon, 25 Mar 2024 08:30:11 +0000
Received: from madrid.collaboradmins.com ([2a00:1098:ed:100::25])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rofiV-0000000GAE0-0xYi;
	Mon, 25 Mar 2024 08:30:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1711355400;
	bh=h//CRCGD0d2uWLlCN+oZeO5mCD2Cg8zsTxqX7sO+7k8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=MrBm0YvQ2wj43Xa4m0qGLAj2InrmGYBOv7ocrTWilwNht2ogn6buEk12a49ONDu6c
	 caUY1+gsZTPHaf/NP9z92M9tweUc69i74xaj7+fCXBL4BfVn29bA6UDTdBdFjxSiqm
	 tBmQIffZhuypp6rrE6g22gviTCwtQ8V+3z586l0Sf57So2vgP+RXvK2/Jz+mP1+Vw7
	 QsmlegZxTUpS/t/7ld0VlTbif6i0AeGn5u1xhfsOKXAFQMqNXmeFTJRqT9nt5XuDNg
	 laRQEMDAVQZGIM2IW0FI+j5BiKcU9B/HuOhWM90qtowD1KGldXkTm+XyIX9BFXtLNW
	 4kHR7MiA8PbWQ==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 4E9B637813B7;
	Mon, 25 Mar 2024 08:29:59 +0000 (UTC)
Message-ID: <fc6f60fe-ddf5-4f18-bf04-225b4cc174fb@collabora.com>
Date: Mon, 25 Mar 2024 09:29:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 2/2] media: i2c: Add GC08A3 image sensor driver
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
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <20240323023851.5503-1-zhi.mao@mediatek.com>
 <20240323023851.5503-3-zhi.mao@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20240323023851.5503-3-zhi.mao@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240325_013003_861075_13BA4A34 
X-CRM114-Status: UNSURE (   4.94  )
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

Il 23/03/24 03:38, Zhi Mao ha scritto:
> Add a V4L2 sub-device driver for Galaxycore GC08A3 image sensor.
> 
> Signed-off-by: Zhi Mao <zhi.mao@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



