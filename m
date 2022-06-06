Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3FBF3C43334
	for <linux-mediatek@archiver.kernel.org>; Mon,  6 Jun 2022 09:21:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TotGYYvyXbS4wzyjFS5JpqHDMetdaNcGQXSCgWjbH5U=; b=K0l80ZJ8QSTQ/i
	O1Rqjt6GO0/bHc4cMl5KHCCUVe3t83W7EYIFzkDVdOAn4OVXIA9C8y7p92HbTXRq0jWnpQcfOExhR
	9sAHuiqVkrVv4uZCXy/amJiIzvfU4IBuBQXCglt+VTrC3RPaqTcdJguGb8Pq8SEpye+cJU6I7hPWc
	YaG3Pv2QI3YwIo9MuJIsqOmsg2XUxNhGW/H4WFp2IicRl+jdRU5Ghu5ncSG+D1ztFSioPcproLxAa
	/YjnSMHU76D+siS56We5ZYURjqpQEmZS/Y3gGCTfIBeUUDCOdiSqwU/vKSJSVCIHrLdAmlqv9OvoK
	CwH8Tn9d7sYYjbrCjFVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ny8uw-000M8g-Ur; Mon, 06 Jun 2022 09:20:58 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ny8uk-000M3r-JB; Mon, 06 Jun 2022 09:20:48 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 1FB226601F9F;
	Mon,  6 Jun 2022 10:20:44 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1654507245;
	bh=hOGlwtWXwq/KtQAdrBRHTu7hvquStP9tnqCCNREO+V4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=IeyJ67nKKhOvCq/O2roO/wRtNVHTWD0XYD1151pb1McHjwXiU06LB6usFcfbKoM1o
	 I8zysIJNhvPsf+Zi8MB/0WLaNdorX7cEalKI16lHP8AlUGM1qONwSUeiVIpRAdhHqi
	 fDr6jcSHWxRHwoJwqDYNcGEPoDUDkHqlCYkR7SlxwDhvpQpYHxCEna4LgJc7+cQCI6
	 RhDZLvioI4NmNLHcyP4IdSUbBNUqd9kWBXwFpgI36hcOWcLEwMiGT76siTOCA0tKZJ
	 2xjqba7WNUDIG3F6tV9sNwKrkqky+ijsXYSLg09HIZL/af0y6w+gHOG2OmJcdpe9HS
	 O8ojqBgXiCOxw==
Message-ID: <ff24a0bf-8137-963a-3a4c-fb0280b5382c@collabora.com>
Date: Mon, 6 Jun 2022 11:20:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH v3 8/8] drm/mediatek: Config orientation property if panel
 provides it
Content-Language: en-US
To: Hsin-Yi Wang <hsinyi@chromium.org>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>
Cc: Hans de Goede <hdegoede@redhat.com>,
 Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Matthias Brugger <matthias.bgg@gmail.com>,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 Rob Clark <robdclark@chromium.org>, Stephen Boyd <swboyd@chromium.org>,
 Douglas Anderson <dianders@chromium.org>, Rob Herring <robh+dt@kernel.org>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20220606044720.945964-1-hsinyi@chromium.org>
 <20220606044720.945964-9-hsinyi@chromium.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220606044720.945964-9-hsinyi@chromium.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220606_022046_815795_EF174122 
X-CRM114-Status: GOOD (  13.43  )
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

Il 06/06/22 06:47, Hsin-Yi Wang ha scritto:
> Panel orientation property should be set before drm_dev_register().
> Mediatek drm driver calls drm_dev_register() in .bind(). However, most
> panels sets orientation property relatively late, mostly in .get_modes()
> callback, since this is when they are able to get the connector and
> binds the orientation property to it, though the value should be known
> when the panel is probed.
> 
> Let the drm driver check if the remote end point is a panel and if it
> contains the orientation property. If it does, set it before
> drm_dev_register() is called.
> 
> Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
> Reviewed-by: Hans de Goede <hdegoede@redhat.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
