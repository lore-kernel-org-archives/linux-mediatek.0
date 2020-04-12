Return-Path: <SRS0=wblk=54=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E4EE8C2D0EC
	for <linux-mediatek@archiver.kernel.org>; Sun, 12 Apr 2020 19:53:39 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BB82E208FE
	for <linux-mediatek@archiver.kernel.org>; Sun, 12 Apr 2020 19:53:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="pul4DFgF"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BB82E208FE
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ravnborg.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dDai3dsq7E6zb8gnr0vzU0mAY/36o0ryTi6+YuX7/oY=; b=pul4DFgF2acT/z
	MYE7sHqyfWOxGJkpRXogY1ukKFcN9TAx2UGE+OL3QoFMY5IcJS22brCHZX+GIUv57qgcZ7QYz2dI1
	3VLgiDOdpW4zfoqzUIYGRsCuLtR9rp8LLyaDzZMw9erA6OeJwsNa/hSRU1LLeOZTZG+PqWR6IXsEH
	rzCk4hkGTzrQPgkaAE1fKKiisw5ibe2loTdyCKKapqKSQl4pnPYWL9IlXi//LLwRNVvNDvHdX6OEj
	3rvPA0HgJMj0fGcjL2LrBmxIWjkCW/KA39cN5EiUx8suW+siozc+YZq6T3lOvMp/jp+bpcHVBEzCc
	/LTHGrLk7mCechQ3/61g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jNifY-0004la-Qx; Sun, 12 Apr 2020 19:53:28 +0000
Received: from asavdk4.altibox.net ([109.247.116.15])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jNifO-0004US-Nk; Sun, 12 Apr 2020 19:53:20 +0000
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk4.altibox.net (Postfix) with ESMTPS id 6E1E580475;
 Sun, 12 Apr 2020 21:53:00 +0200 (CEST)
Date: Sun, 12 Apr 2020 21:52:53 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Enric Balletbo i Serra <enric.balletbo@collabora.com>
Subject: Re: [PATCH 6/7] drm/mediatek: mtk_dsi: Use the drm_panel_bridge API
Message-ID: <20200412195253.GA711@ravnborg.org>
References: <20200408211120.1407512-1-enric.balletbo@collabora.com>
 <20200408211120.1407512-7-enric.balletbo@collabora.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200408211120.1407512-7-enric.balletbo@collabora.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=XpTUx2N9 c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=kj9zAlcOel0A:10 a=e5mUnYsNAAAA:8
 a=_Dwo-_uELdbJNNcBnpoA:9 a=CjuIK1q_8ugA:10 a=Vxmtnl_E_bksehYqCbjh:22
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200412_125318_959573_1263A1E2 
X-CRM114-Status: GOOD (  13.22  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, drinkcat@chromium.org,
 David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 laurent.pinchart@ideasonboard.com, hsinyi@chromium.org, matthias.bgg@gmail.com,
 Collabora Kernel ML <kernel@collabora.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi Enric.

Just a "drive-by" comment.
I browsed all the patches - and nothing jumped at me.
But then I did not follow all the changes.

> @@ -1202,10 +1055,19 @@ static int mtk_dsi_probe(struct platform_device *pdev)
>  	}
>  
>  	ret = drm_of_find_panel_or_bridge(dev->of_node, 0, 0,
> -					  &dsi->panel, &dsi->next_bridge);
> +					  &panel, &dsi->next_bridge);
>  	if (ret)
>  		goto err_unregister_host;
>  
> +	if (panel) {
> +		panel->connector_type = DRM_MODE_CONNECTOR_DSI;
This assignment of panel->connector_type is wrong.
We should let the panel tell the type of connector.

And if the panel fails to do so - then fix it in the panel.

One day, when I get sufficiently bored/motivated I plan to go through
all panels to make sure they all update connector_type.

	Sam



> +		dsi->panel_bridge = devm_drm_panel_bridge_add(dev, panel);
> +		if (IS_ERR(dsi->panel_bridge)) {
> +			ret = PTR_ERR(dsi->panel_bridge);
> +			goto err_unregister_host;
> +		}
> +	}
> +
>  	dsi->driver_data = of_device_get_match_data(dev);
>  
>  	dsi->engine_clk = devm_clk_get(dev, "engine");
> -- 
> 2.25.1
> 
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
