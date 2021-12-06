Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F456C433F5
	for <linux-mediatek@archiver.kernel.org>; Mon,  6 Dec 2021 11:53:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=INIkA9YwJmqaX8kZCN8n/8YmLqTWf+iOcC1Y2ra4M64=; b=BwtfzJvV6tTnQl
	wfDUAgTcFKna4+q05BBgVLMfBMxY0Tac7Eg7E1kLQq6NSOnPtfU9sZG3YWAgZDaPMGpDYyBMMrQDn
	YY3LPhqyp5ggR7TeByEwsyeqS8jBNFwUYHk4q2pqFt+OaInQiQhSp2+JdSr5T0oMwzRp6bCAsXjU6
	s7zWM5OgoCJD5vOG95XtFXk0YjSWloSgcyykujM7ZM4+yVEv3219+tHgLZRwOS73bGmU5eOuC3007
	UlECuyQEGwPJKXYaVOUs5sCkJ1Lgk+3+Ky+tkfSMBmc283tUyth+t8jdWibaF/KoP2WjaOC6etDYI
	i2VOmR4xncG8DQtHsFdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1muCYY-003dB3-CY; Mon, 06 Dec 2021 11:53:18 +0000
Received: from 8bytes.org ([2a01:238:4383:600:38bc:a715:4b6d:a889]
 helo=theia.8bytes.org)
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1muCYM-003d6z-1x; Mon, 06 Dec 2021 11:53:07 +0000
Received: by theia.8bytes.org (Postfix, from userid 1000)
 id 4F708396; Mon,  6 Dec 2021 12:52:58 +0100 (CET)
Date: Mon, 6 Dec 2021 12:52:36 +0100
From: Joerg Roedel <joro@8bytes.org>
To: Yong Wu <yong.wu@mediatek.com>
Subject: Re: [PATCH v9 00/15] Clean up "mediatek,larb"
Message-ID: <Ya35hNY0iAR/JPmI@8bytes.org>
References: <20211112105509.12010-1-yong.wu@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211112105509.12010-1-yong.wu@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211206_035306_296910_2CFF681E 
X-CRM114-Status: GOOD (  10.79  )
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
Cc: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, David Airlie <airlied@linux.ie>,
 Will Deacon <will.deacon@arm.com>, dri-devel@lists.freedesktop.org,
 yf.wang@mediatek.com, anthony.huang@mediatek.com, youlin.pei@mediatek.com,
 Tiffany Lin <tiffany.lin@mediatek.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Evan Green <evgreen@chromium.org>, Eizan Miyamoto <eizan@chromium.org>,
 Matthias Kaehlcke <mka@chromium.org>, mingyuan.ma@mediatek.com,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 Philipp Zabel <p.zabel@pengutronix.de>, libo.kang@mediatek.com,
 yi.kuo@mediatek.com, Rob Herring <robh+dt@kernel.org>,
 linux-mediatek@lists.infradead.org, Hsin-Yi Wang <hsinyi@chromium.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 linux-arm-kernel@lists.infradead.org, anan.sun@mediatek.com,
 srv_heupstream@mediatek.com, acourbot@chromium.org,
 linux-kernel@vger.kernel.org, Tomasz Figa <tfiga@chromium.org>,
 iommu@lists.linux-foundation.org, Daniel Vetter <daniel@ffwll.ch>,
 Robin Murphy <robin.murphy@arm.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Fri, Nov 12, 2021 at 06:54:54PM +0800, Yong Wu wrote:
> Yong Wu (14):
>   dt-binding: mediatek: Get rid of mediatek, larb for multimedia HW
>   iommu/mediatek-v1: Free the existed fwspec if the master dev already
>     has
>   iommu/mediatek: Return ENODEV if the device is NULL
>   iommu/mediatek: Add probe_defer for smi-larb
>   iommu/mediatek: Add device_link between the consumer and the larb
>     devices
>   media: mtk-jpeg: Get rid of mtk_smi_larb_get/put
>   media: mtk-mdp: Get rid of mtk_smi_larb_get/put
>   drm/mediatek: Get rid of mtk_smi_larb_get/put
>   media: mtk-vcodec: Get rid of mtk_smi_larb_get/put
>   media: mtk-vcodec: dec: Remove mtk_vcodec_release_dec_pm
>   media: mtk-vcodec: enc: Remove mtk_vcodec_release_enc_pm
>   memory: mtk-smi: Get rid of mtk_smi_larb_get/put
>   arm: dts: mediatek: Get rid of mediatek, larb for MM nodes
>   arm64: dts: mediatek: Get rid of mediatek, larb for MM nodes
> 
> Yongqiang Niu (1):
>   drm/mediatek: Add pm runtime support for ovl and rdma

What is the plan for merging this? If Matthias has no objections I can
take the iommu-parts, or will this go through another tree?

Regards,

	Joerg

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
