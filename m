Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2AB51C433FE
	for <linux-mediatek@archiver.kernel.org>; Thu, 13 Jan 2022 16:08:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=s79kTIMPpKIy/dzFVi+MbCAQjaSdNaKKyUNKsDJMdm0=; b=K6lRTD8DEkK6mu9F4nbS3ku4X6
	rzZcXDr2Gw64YVgyxYuNT/9ZWxdYF7/RKoOMOylS5hUaKLP9nUykwHeLVrsnycrW4yWA3E7LByveF
	Dkafl/b29ZCmKoCs411Yi2K4Q8xW+xsCP2CcIB0Yu1QCVGCIdLJjAczpHtdM4eWbE0Swcad5PWopr
	ptEAo0W/zapG5e8vDB+QirbePlioobgm62UHcK1AoIv7YAm3PDxRAopUxh4RMEv1UkX8RWsY60JsR
	QgPgPUlEW+K9UEIxrz+a65rgs9YdbhIm/p3ail8XY1vhvKy6VyoH/9SBzQNlMlc/f7nln3KI4SgiG
	kfU52++A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n82eD-006TX0-Hv; Thu, 13 Jan 2022 16:08:21 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n82dx-006TKr-Di; Thu, 13 Jan 2022 16:08:06 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id 016CD1F45F44
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1642090084;
 bh=grp7me+DC1tymcFVDuQBF2qCAT4WsTSUuXfAL8gosJQ=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=ny+rEgZVHPJRlCPgjIkYrm37bk9oR+IaeqZkOkNA7ocvkFNuWpNDquYxbvEgxmKSO
 wcBUO8MmtQL4GN8n3BPbq3YUBSgY8Y43xXxiRkjsELV0duTm9RpOFOs/7kWmt1847d
 xbbloF7jq27G+OqEX96pX6Atl1cZl+AYYz5pueuWOc64ER1CcEcikvRt5q5n3WjY3F
 sZ7E9oNnVd7PWOMxrxgDQ8vFb4BCdLJ1DotUdOlZ0zjs2qDX3QuyTKF+5+kMbRXZet
 hGGEvST0bK0Xi4Yv5gpmvqTKHnwSGEhvHTIsr78s4AM28PWx/92ZA5T4ERyn+01urw
 wZU4qNTpsw+EQ==
Subject: Re: [PATCH v11 19/22] drm/mediatek: modify mediatek-drm for mt8195
 multi mmsys support
To: "Nancy.Lin" <nancy.lin@mediatek.com>, CK Hu <ck.hu@mediatek.com>
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 "jason-jh . lin" <jason-jh.lin@mediatek.com>,
 Yongqiang Niu <yongqiang.niu@mediatek.com>, dri-devel@lists.freedesktop.org,
 linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 singo.chang@mediatek.com, srv_heupstream@mediatek.com
References: <20220110084645.31191-1-nancy.lin@mediatek.com>
 <20220110084645.31191-20-nancy.lin@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Message-ID: <d50c21ea-c62f-7d47-80e7-1db8522b2d38@collabora.com>
Date: Thu, 13 Jan 2022 17:08:00 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20220110084645.31191-20-nancy.lin@mediatek.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220113_080805_637438_C5D63EF0 
X-CRM114-Status: GOOD (  10.94  )
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

Il 10/01/22 09:46, Nancy.Lin ha scritto:
> MT8195 have two mmsys. Modify drm for MT8195 multi-mmsys support.
> The two mmsys (vdosys0 and vdosys1) will bring up two drm drivers,
> only one drm driver register as the drm device.
> Each drm driver binds its own component. The last bind drm driver
> allocates and registers the drm device to drm core.
> Each crtc path is created with the corresponding drm driver data.
> 
> Signed-off-by: Nancy.Lin <nancy.lin@mediatek.com>


Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
