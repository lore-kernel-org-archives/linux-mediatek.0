Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DCEE7C04A68
	for <linux-mediatek@archiver.kernel.org>; Wed, 27 Jul 2022 08:17:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sbL++Luwy1H6uCe36p+1Aw/ZgHEOyJNbJxdgT1af+TQ=; b=02ePwfGQLEqmYPC8cXg/vXLbEx
	FD6j4A2fioWXvtfKLLfjIDUhaxApKiW+PVup7Ot7GziRp3/eYEcjvEWZP6rVy1r/YBtc/zK/CySru
	xAH7kqqzh8KN9Dh2YRZc9zKZZQ2j/b1PXBf559nhe8zTL2gDLGQoBmxTZ4tyfhnzvvVuDgVm7SIWN
	2KqtG+xkNdnTIxQSEHTTVZxgR0y0hBr11LSUCqdZqwEWvl6jvcLk4PKpz0wBYDEc65xs20O9AFOzb
	dibYHpDWOi3V9evphzdWQ5GDBe1yleKXW07MNhm2wX3gB45G6MlujdbKMXtQyktiX0vgwyBoJN9+n
	1dQoUvmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oGcEl-00B2Lx-Ek; Wed, 27 Jul 2022 08:17:47 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oGcEM-00B25F-UX; Wed, 27 Jul 2022 08:17:25 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id CFF896601B1A;
	Wed, 27 Jul 2022 09:17:20 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1658909841;
	bh=fXIJ2hAtpli+W6S1Y8IGI1hYRxklmzSVaDFjnGNKiYE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=HVzr2P0a9UH6kJl2DYJR97d2HxdM8dsRiIvlj5Djxi0fRrCGxPd17mDSXLprr4cHl
	 rBXJ9ladoQn/B6hhQmy7p2JTKdishZmHQjtEvE6mTrrDqVtpoc30TgtBn9BizdDiep
	 LE4ZpOU6H56tOR7kLsvuY1HAZ1+PZFG+E9EBkHYuC8CzUj3fmJRg5m6lohXqQY02mt
	 HTNgagQi/NQtGs7W5GXhimenTLjfhE2uIi5ZDfbySn+L4iS0t8qAGHI1heOisUrEv0
	 YziUA4Ler8HgqLm4DKLxDRsmj5eb4ZAOE22WjiG2hR0907g4zsI/a3oqbzlIGFG4sf
	 EC+/wUhAP65Ow==
Message-ID: <cad2ac1c-992b-960c-09c7-ba12baa58c93@collabora.com>
Date: Wed, 27 Jul 2022 10:17:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v8 1/6] thermal: mediatek: Relocate driver to mediatek
 folder
Content-Language: en-US
To: Balsam CHIHI <bchihi@baylibre.com>, rafael@kernel.org,
 rui.zhang@intel.com, daniel.lezcano@linaro.org, amitk@kernel.org
Cc: linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
 khilman@baylibre.com, mka@chromium.org, robh+dt@kernel.org,
 krzk+dt@kernel.org, matthias.bgg@gmail.com, p.zabel@pengutronix.de,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, james.lo@mediatek.com,
 fan.chen@mediatek.com, louis.yu@mediatek.com, rex-bc.chen@mediatek.com,
 abailon@baylibre.com
References: <20220726135506.485108-1-bchihi@baylibre.com>
 <20220726135506.485108-2-bchihi@baylibre.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220726135506.485108-2-bchihi@baylibre.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220727_011724_553264_1E8946C2 
X-CRM114-Status: UNSURE (   7.20  )
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

Il 26/07/22 15:55, Balsam CHIHI ha scritto:
> Add Mediatek proprietary folder to upstream more thermal zone and cooler
> drivers. Relocate the original thermal controller driver to it and rename
> as soc_temp.c to show its purpose more clearly.
> 
> Signed-off-by: Michael Kao <michael.kao@mediatek.com>
> Signed-off-by: Ben Tseng <ben.tseng@mediatek.com>
> Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com>
> Signed-off-by: Balsam CHIHI <bchihi@baylibre.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


