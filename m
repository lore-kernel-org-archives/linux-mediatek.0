Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A678FECAAD8
	for <linux-mediatek@archiver.kernel.org>; Wed, 14 Sep 2022 08:18:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Llsgat33sbmCea4gLFhOeGPuEHBAi3ix59mCbawYsNw=; b=E3zG++oysz3OQXUPlFzw7DSVSB
	jVyiZMy68olI2Em4RSvapmQxZtvrCVrs3HnOjfLodZrmLpCYuc8bE1JBk4verVClk0u532H5Huq/2
	ZRu4WfXVUwCfwdfZe/m8bgG7tkKjYxkct/oVLMXzhhhoYlZQBrt5kX6ma0uZKPFK37Cw296/o6IJx
	jNY8cdIR5BBiiFEIxg5uKpTP6vnQNYzDWJGb+syuqRfNSA2BLh2FjjDdg3MRu+Plny5uuXWw3K1WB
	HsDEJhIHj+uCh+BhPhtvL/fY9rVNcLYofnd308zihtpdipyOtE9ityCz4Ob8aSFOHTyLSBAgoISbY
	t5i4E62A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oYNaj-00DRjI-Ot; Wed, 14 Sep 2022 08:17:53 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oYNaX-00DRWt-T9; Wed, 14 Sep 2022 08:17:43 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id AF0AD660037C;
	Wed, 14 Sep 2022 09:17:39 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1663143460;
	bh=HFEQ65O/mE3evHovBKdThpzSRkNG08TXQRM2aECKklU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=H9hmToNizNS8Y2APOOTL4yzGIZXc7SvGyz/ZEea1Gh13MMaV/Q7RJkW7sb0ZQLExj
	 ip5wP8rDIFMeAp1h7Tun+ZDVrrkgFD/nAI7GSKh3bjIkQbk3T8jLENTml9qog51tDC
	 g9yemHzg37bQhBC/1mLsu1B1pk6BzPTXi9dfkALIQ+guZmvJs7KneFATdCFOGHyD72
	 8+H4GU+HXaB6M4PdxVUawUeIjEW7okQnIRTyHN0vN4faOOtglAoEZnFoBW/GGV4KUN
	 RAqxeqQT/kUe/SHR/GJy+QJBrKgrELz/5g2zupAncqJnq6wz0yXnQzy+2M9z4MAaNE
	 +weBYv+DU3GFg==
Message-ID: <0723c329-475c-42a1-f6d5-f478d649aef1@collabora.com>
Date: Wed, 14 Sep 2022 10:17:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
Subject: Re: [PATCH] drm: mediatek: Fix display vblank timeout when disable
 dsi
Content-Language: en-US
To: xinlei.lee@mediatek.com, chunkuang.hu@kernel.org, p.zabel@pengutronix.de,
 airlied@linux.ie, daniel@ffwll.ch, matthias.bgg@gmail.com,
 jitao.shi@mediatek.com
Cc: rex-bc.chen@mediatek.com, dri-devel@lists.freedesktop.org,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <1663136309-29491-1-git-send-email-xinlei.lee@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <1663136309-29491-1-git-send-email-xinlei.lee@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220914_011742_137900_5CAC470F 
X-CRM114-Status: UNSURE (   8.05  )
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

Il 14/09/22 08:18, xinlei.lee@mediatek.com ha scritto:
> From: Xinlei Lee <xinlei.lee@mediatek.com>
> 
> Dsi is turned off at bridge.disable, causing crtc to wait for vblank timeout.
> It is necessary to add count protection to turn off dsi, and turn off at post_disable.
> 
> Fixes: cde7e2e35c28 ("drm/mediatek: Separate poweron/poweroff from enable/disable and define new funcs")
> Signed-off-by: Xinlei Lee <xinlei.lee@mediatek.com>

Hello Xinlei,
which machine is this commit targeting?

Can you please try to reproduce again the issue that you're seeing with my
mtk_dsi fix [1], but without this commit?

Thanks,
Angelo

[1]: 
https://patchwork.kernel.org/project/linux-mediatek/patch/20220721172727.14624-1-angelogioacchino.delregno@collabora.com/


