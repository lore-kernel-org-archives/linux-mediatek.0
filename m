Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDAC3C433EF
	for <linux-mediatek@archiver.kernel.org>; Tue, 11 Jan 2022 10:59:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=60li713n3PIU6YKqtk9uX4RMAPqLVS51G4u51Nsb+UU=; b=z7wg3eOyJ5WTx0X8gc4pN4nWMJ
	tO226SMd2zRC+RLMZ1UXgfX7L1+jMhk2DWNEl4IZ7HhWUZXOP38S8Q2ejtPpH3BKEdWNZNhfJjo5f
	dl7YUvzgZf94yqd/+VXX8TI7Ci+Ivf2simUhFNhCBJdiDDUIO+7Pu0OdBQlFL4hlfv+7nzkJigdhJ
	s+MBWgOGRFLtyqXz3SlUURiXZADtXQ7OSVIXNIkRGdY/zJoCHFzgiBBqdgwKsxqrjvOuRE9X0+amS
	E8YXqvjG9mfpFfn/lmgqNpWu3hhaiIRm2yq4ZUBylGgR6CLiAKypKs/ZvSQY5doDyfW2+zfkHSw3c
	RrnEQ/xg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n7EsZ-00Fu1f-Gr; Tue, 11 Jan 2022 10:59:51 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n7Eqb-00FsTL-RS; Tue, 11 Jan 2022 10:57:52 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id 47C8A1F43A30
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1641898668;
 bh=z7dhA4q/V4tftc+cZa+nBqU+2vdxSivbhiKy1h+7qtQ=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=RRaYOVQpussaCc+0yRBL6RBG5qsxzVLHCsJN2oZEWUjvH48V2MO743x7hHveXauoF
 +3Nha4N37fz8qj+kkWoc+sjcU3rEDzW3vnYJbVCqfjC1Jv2SI4Q6zDZ/SnkzbZPV5x
 OlxczaXehAvI/3oePC6t5A90g330Z/J5+sFtMLG5VbhN933DtEr9MMwqfhbINiJaCp
 N6cyz5EWmr2G8xsfA7HPK07hnVgeonTE77IrbWGCKc94cmXSnuco7AMQQLVPsnF2Tf
 EMkhNj53mj8kA9OBp4UXrXGHXfz/W1TxYphtIJNijCt/kSZ72W8xMJOeSFAZlb5Wx6
 IgspKKiIJdMzQ==
Subject: Re: [PATCH v9 08/15] drm/mediatek: Add pm runtime support for ovl and
 rdma
To: Yong Wu <yong.wu@mediatek.com>, Matthias Brugger
 <matthias.bgg@gmail.com>, Joerg Roedel <joro@8bytes.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 David Airlie <airlied@linux.ie>, Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, Will Deacon <will.deacon@arm.com>,
 dri-devel@lists.freedesktop.org, yf.wang@mediatek.com,
 anthony.huang@mediatek.com, youlin.pei@mediatek.com,
 Evan Green <evgreen@chromium.org>, Eizan Miyamoto <eizan@chromium.org>,
 Matthias Kaehlcke <mka@chromium.org>, linux-arm-kernel@lists.infradead.org,
 Yongqiang Niu <yongqiang.niu@mediatek.com>, CK Hu <ck.hu@mediatek.com>,
 mingyuan.ma@mediatek.com, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, Philipp Zabel <p.zabel@pengutronix.de>,
 libo.kang@mediatek.com, yi.kuo@mediatek.com,
 linux-mediatek@lists.infradead.org, Hsin-Yi Wang <hsinyi@chromium.org>,
 Tiffany Lin <tiffany.lin@mediatek.com>, anan.sun@mediatek.com,
 srv_heupstream@mediatek.com, acourbot@chromium.org,
 linux-kernel@vger.kernel.org, Tomasz Figa <tfiga@chromium.org>,
 iommu@lists.linux-foundation.org, Daniel Vetter <daniel@ffwll.ch>,
 Robin Murphy <robin.murphy@arm.com>
References: <20211112105509.12010-1-yong.wu@mediatek.com>
 <20211112105509.12010-9-yong.wu@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Message-ID: <ae5c8350-75c1-b90e-3bad-78c19154d7bd@collabora.com>
Date: Tue, 11 Jan 2022 11:57:43 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211112105509.12010-9-yong.wu@mediatek.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220111_025750_105394_6090E05B 
X-CRM114-Status: GOOD (  12.96  )
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

Il 12/11/21 11:55, Yong Wu ha scritto:
> From: Yongqiang Niu <yongqiang.niu@mediatek.com>
> 
> Prepare for smi cleaning up "mediatek,larb".
> 
> Display use the dispsys device to call pm_rumtime_get_sync before.
> This patch add pm_runtime_xx with ovl and rdma device whose nodes has
> "iommus" property, then display could help pm_runtime_get for smi via
> ovl or rdma device.
> 
> CC: CK Hu <ck.hu@mediatek.com>
> Signed-off-by: Yongqiang Niu <yongqiang.niu@mediatek.com>
> Signed-off-by: Yong Wu <yong.wu@mediatek.com>
> (Yong: Use pm_runtime_resume_and_get instead of pm_runtime_get_sync)
> Acked-by: Chun-Kuang Hu <chunkuang.hu@kernel.org>
> Tested-by: Frank Wunderlich <frank-w@public-files.de> # BPI-R2/MT7623

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
