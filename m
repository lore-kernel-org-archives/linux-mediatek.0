Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48457C433EF
	for <linux-mediatek@archiver.kernel.org>; Thu, 13 Jan 2022 16:08:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7f9pe7CD0Jd6yiVYy5kjgL7RF06e04biYAJAakiC7S4=; b=AmoCvXscIKwl8Ffgzi/0Do5yiP
	i7MqVp2SkTbdiKwBZlNmiwmGaLbWxZU8inOyuhcnJNOkFTPAYHVGIM67w2p1bTqvWQ2lFTh0IFIGj
	kKuWHdoqzLaXWAlvtnPvHJIIXECfYpcdJyRUbIqdDAOSayH83Bm5K8yqg+kywYWmH0pc05cO3B+Ee
	oNnpa0dYJFjloIXIHKVJYP2KJtf1p1MvYhTtboajuHptD9EyuoYiP+hmE1XI3xSyneKXZi/QFAAwf
	xXUNB9OyweX7EL4EzFDA27qsYZ/KidKFq3ZZmOiBtkU5LcNaevVif2tlT2W0tV8BbjCtz+9Hm0paX
	TYHfrFeg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n82eb-006TjI-DE; Thu, 13 Jan 2022 16:08:45 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n82dx-006TKz-TZ; Thu, 13 Jan 2022 16:08:07 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id DA21D1F45F46
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1642090084;
 bh=0afL8O9chGVfAjPlzEOzkPRaywrvSV34kF1vm5ztZk8=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=lXs2HOwXliLjnm2TbrKCIJscwm/JjeVfOXsk3PaGwlgBCimMj1IoEk4eAw8ooVntV
 95mfFPVDZ49it8+chLj5S7VZdxneR6mtI5ZKkrHtPDiGFmcANkz1qRI8BnG4q1yOeW
 Pw6kUYZSWTuGpZ1HOd3hAjFL04Bse0weXtnQBUNRfU9y1hxspAdDIWtOWorxYiZ4sy
 wZJsbmj+wWjayjGAsvPXOGFS8+jisG90MTyYcX4CgRH6ThLfDMZhfjEbEX6QlpFLGO
 soIR4Dgg+F8zX5LjkZB47LZ+Tq7WwuoA1nCxk54a6sVG1Pr7RYP+0RLzgl4UfxQDkr
 pq1KlmjeDE9Wg==
Subject: Re: [PATCH v11 20/22] drm/mediatek: add drm ovl_adaptor sub driver
 for MT8195
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
 <20220110084645.31191-21-nancy.lin@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Message-ID: <005c3f95-b456-486b-e8d3-cbeddb9bb5fb@collabora.com>
Date: Thu, 13 Jan 2022 17:08:01 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20220110084645.31191-21-nancy.lin@mediatek.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220113_080806_120291_FE0ACAA4 
X-CRM114-Status: UNSURE (   9.18  )
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

Il 10/01/22 09:46, Nancy.Lin ha scritto:
> Add drm ovl_adaptor sub driver. Bring up ovl_adaptor sub driver if
> the component exists in the path.
> 
> Signed-off-by: Nancy.Lin <nancy.lin@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
