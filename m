Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BFE6C433EF
	for <linux-mediatek@archiver.kernel.org>; Tue, 26 Apr 2022 09:36:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:From:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uCZYk8R79/2xmAlYkPN8qqQr6vEBWJxMXZhitxbUF5I=; b=kLwD7p2SeArM9Z
	iZw/ikzwA5rK/rFhIrb+Gl4Qs9SSSORt9c3cadVTkVa+CuwVNBoMoRrwypMDgZPSfk56f1k+dR3LP
	pqWIA3tLcRc4Bh6dhFcrEs5sUWOi3Iv98eH6soSanaxjWiHXi0lgltyVJswaye2WBEn9Juuew88TW
	RygW5AQqu5lsba1Z7Fk79LL7rCUBjjQCYnDEbeyi7sWWBul0xgcfwovfk1EzjT41cXes26a0z3L2m
	hKzTbvXhjO2mXZnzPMaDu2U0QksCEpyM+FnqAd6cW7mdajDFb6mTnNmZf+Nzr7/MUaOR4+nUtnNML
	VyioR3mBNYS1Ts6r9WNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1njHc5-00Deem-SV; Tue, 26 Apr 2022 09:36:05 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1njHaN-00Ddgb-4o; Tue, 26 Apr 2022 09:34:20 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id 261811F42EA8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1650965658;
 bh=tcRCODsiHa0GCjxOg9qb3gec1FUUlqIrKCXGOGU7ZjU=;
 h=Date:From:Subject:To:Cc:References:In-Reply-To:From;
 b=l8S1h1bWx9PtCiYzoXrXDfMtsZONH2SY1+FJ1e2Ayu8Dd/tZowI8gpOzFuIhVyC0h
 0HtGoFU59JMgok80/St8vahQQIlZajspvpYARimS4e1G9okckV2pOCll5nH9ukc3M6
 JmAHDxVe5ev77Xmp4QZPWcUKryRmqkgCghwOAEV0XyNGE8fUUOVaSHOiuP7T+ZIoUy
 25MIKYsvtzIj7DQHm+ZFuC5kiKqnFC1Vr2SMGpIKA7c3+7yQeekiqJTs1GweOraw/i
 v8vUzkG3LG80ZMLE+5kcT8AFt2RfULFfNzCiV1UVuXi0TDTYKjaIkLlPchOXzpr3Ds
 IF+KCL8t6rT6w==
Message-ID: <2e2f27b5-2ad9-b70a-3f2c-3bcdbd0bec72@collabora.com>
Date: Tue, 26 Apr 2022 11:34:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: Re: [PATCH V3 08/17] clk: mediatek: reset: Add new register reset
 function with device
To: Rex-BC Chen <rex-bc.chen@mediatek.com>, mturquette@baylibre.com,
 sboyd@kernel.org, matthias.bgg@gmail.com, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org
Cc: p.zabel@pengutronix.de, chun-jie.chen@mediatek.com, wenst@chromium.org,
 runyang.chen@mediatek.com, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20220422060152.13534-1-rex-bc.chen@mediatek.com>
 <20220422060152.13534-9-rex-bc.chen@mediatek.com>
Content-Language: en-US
In-Reply-To: <20220422060152.13534-9-rex-bc.chen@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220426_023419_491708_CE6FAF47 
X-CRM114-Status: UNSURE (   6.82  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Il 22/04/22 08:01, Rex-BC Chen ha scritto:
> It's a proper implementation using device to register reset controller.
> Howerver, some clock drviers of MediaTeks only provide device_node.
> Therefore, we still remain register reset function with device_node and
> add a function with device to register reset controller.
> 
> Signed-off-by: Rex-BC Chen <rex-bc.chen@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
