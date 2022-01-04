Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82E09C433F5
	for <linux-mediatek@archiver.kernel.org>; Tue,  4 Jan 2022 09:18:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Wbw4Mrce46byIbkF0j3WdEBZ4D9ZFDr2mNgqPwEa+xY=; b=ALy5/vzwrY2wYH6azvwqwBQuDc
	NapeUDA1smP7WqefppEp1ctGjjyEnlMF0qBeNFNR7TuNnL7MPir70DMbrwpP+CEDO/ACJRsjBIXJG
	JSYjPiMcg7nYLo7jmm/ClAU+PD3ZuAYlLJ51G38vgSeisTjrALJi6Qjxgj1N3YdA5aRoEXhSXQWj+
	hGZYVXu8S9Aivtd4ITIAXRBS6swARfgjt5xlMmumRNH8GcU1d3etHUEeR7c/k63aVEa3PKw8fR/9t
	qt6qFOZQ2j1KfY75RHtS6RetAzPF29nsCQjUKUW362LFw0296x7ksyP7klpwYuvkx5wh2B6p5l4eG
	qR54wgfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n4fx3-00AwVO-Ge; Tue, 04 Jan 2022 09:17:53 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n4ft6-00Av0V-DP; Tue, 04 Jan 2022 09:13:49 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id 879501F42D87
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1641287627;
 bh=XZd2lykqJomHU+Ox/8ttKPosF+qxXhAWLOOqEgbtIdo=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=iQ8lVGvPPym5/5IZSktbxmSKApdFKXLV8L8JhFK1cp/LQSXq7Lmr3S678qN+ET2gh
 YCAKi7zdhELODH1TlKDTZtSDwSBhVp8nn28VTzd+oAI7KVI/2oqZgxBXSzhWEye0oB
 wWmEW9VsBH97h6caTCJ705TyY1jqDyYywebgbpN8jUfCYWbaZcuHNqwagIvwWO7IdC
 W+hlBtG2dxDoYOpNneQsZZJfMXsiS3qeZYstDQgtZdz28SKGXQNHm+FSsDTta9dC+i
 FMPJ5qz47jH2g6bT9zWr8tpoojCfprjAqSf+zLJAYUI6dw+TjwS/HSs30vfZEzBIVi
 nXVE02V4PKQ/Q==
Subject: Re: [PATCH] drm/mediatek: mtk_dsi: Avoid EPROBE_DEFER loop with
 external bridge
To: dri-devel@lists.freedesktop.org
Cc: linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, chunkuang.hu@kernel.org,
 p.zabel@pengutronix.de, airlied@linux.ie, daniel@ffwll.ch,
 matthias.bgg@gmail.com, kernel@collabora.com
References: <20211210113617.196204-1-angelogioacchino.delregno@collabora.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Message-ID: <a2c54a49-b052-ab41-d2af-1869c63878e3@collabora.com>
Date: Tue, 4 Jan 2022 10:13:44 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211210113617.196204-1-angelogioacchino.delregno@collabora.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220104_011348_647177_A4BCF9CB 
X-CRM114-Status: GOOD (  17.27  )
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

Il 10/12/21 12:36, AngeloGioacchino Del Regno ha scritto:
> DRM bridge drivers are now attaching their DSI device at probe time,
> which requires us to register our DSI host in order to let the bridge
> to probe: this recently started producing an endless -EPROBE_DEFER
> loop on some machines that are using external bridges, like the
> parade-ps8640, found on the ACER Chromebook R13.
> 
> Now that the DSI hosts/devices probe sequence is documented, we can
> do adjustments to the mtk_dsi driver as to both fix now and make sure
> to avoid this situation in the future: for this, following what is
> documented in drm_bridge.c, move the mtk_dsi component_add() to the
> mtk_dsi_ops.attach callback and delete it in the detach callback;
> keeping in mind that we are registering a drm_bridge for our DSI,
> which is only used/attached if the DSI Host is bound, it wouldn't
> make sense to keep adding our bridge at probe time (as it would
> be useless to have it if mtk_dsi_ops.attach() fails!), so also move
> that one to the dsi host attach function (and remove it in detach).
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

Due to the latest changes in drm bridge, we need this patch to land as soon as
possible, otherwise breakages will be seen on all MediaTek powered devices using
DSI to eDP/DP bridges...

...hence, friendly ping for a review :)

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
