Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA6C9C433F5
	for <linux-mediatek@archiver.kernel.org>; Tue, 11 Jan 2022 10:58:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=B6C+jpQHnYoS1+7v79GtqaXgT1M+AzN6WF3/3rYCNbE=; b=HLWnVHx3JNDVWMU4e17rYgB5f7
	ehVOAankKs9RMHhxS2TUOVkVZly7pDysmXsMNugT8IFZUpCRnLFw0G6Grc3LaSupsbXStf6Iy6v6k
	rkSMD0oJG4qhH0r2WZXIvlEEhJTuthPpDtvqFDBQOGOAwNg40/bsPplplVjJb1nA2yuajQQWSRqpy
	2XEGXSJBINlR1KYrNDBb5VZ6rPmHNnck190WG5oC6UNxw1i8Al1ys7cQGRA7eP8NrO6mPa1Q3FrZg
	RBb6LM+HYuVf2EkUofkYZHi8eEXLcxIJsRlFfAkduVwD6PqqSgWYvnfCb+YhqNVT/DbBvFSPf2S9u
	mBuiiQkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n7ErU-00FtGk-LA; Tue, 11 Jan 2022 10:58:44 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n7EqY-00FsQ9-U4; Tue, 11 Jan 2022 10:57:48 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id 182ED1F43A1E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1641898665;
 bh=YF4OVUlLPdRcXd495FYHFEnvLOeAT5zjs+cfWkZQ59c=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=UumELe331t1PFXufN9ry/eKcEnjWq1ai+QnEAtw/Iq+rujrT6UazNURDOWpI4l/YS
 DaYfvjVzPHgd8i5WXITii9uvsu17sos/JR06eYl2pNqo+Yr2RHBy3lKtW8/48Wv26+
 /T6y448GWREpcy/pSXwcLPSx3BHCHHhnNgmSO0qD3b9QRxnkStz8HvxoDyTusUcCR3
 tnWG+OURtbhUhUZegFFSAF2zdAnzDrBoEP4vfOSPZ43mfYH+u4g+DgBhdcH0kUMYBl
 3uWGwmOxK0PkokHmXCkSwG/o2zipwv3ZRQACcJ/iFnUYKooefLBk8kgqcsBJBFK9s9
 bRSdTFDstZjwg==
Subject: Re: [PATCH v9 11/15] media: mtk-vcodec: dec: Remove
 mtk_vcodec_release_dec_pm
To: Yong Wu <yong.wu@mediatek.com>, Matthias Brugger
 <matthias.bgg@gmail.com>, Joerg Roedel <joro@8bytes.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 David Airlie <airlied@linux.ie>, Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Yunfei Dong <yunfei.dong@mediatek.com>, Will Deacon <will.deacon@arm.com>,
 dri-devel@lists.freedesktop.org, yf.wang@mediatek.com,
 anthony.huang@mediatek.com, youlin.pei@mediatek.com,
 Evan Green <evgreen@chromium.org>, Eizan Miyamoto <eizan@chromium.org>,
 Matthias Kaehlcke <mka@chromium.org>, linux-arm-kernel@lists.infradead.org,
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
 <20211112105509.12010-12-yong.wu@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Message-ID: <0a9e348b-fac5-c93b-b4c4-1d834c96c195@collabora.com>
Date: Tue, 11 Jan 2022 11:57:41 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211112105509.12010-12-yong.wu@mediatek.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220111_025747_166245_1599C638 
X-CRM114-Status: GOOD (  11.58  )
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
> After this patchset, mtk_vcodec_release_dec_pm has only one line.
> then remove that function. Use pm_runtime_disable directly instead.
> 
> For symmetry, move the pm_runtime_enable out from
> mtk_vcodec_init_dec_pm, then mtk_vcodec_init_dec_pm only operate for
> the clocks, rename it from the _pm to _clk.
> 
> No functional change.
> 
> CC: Tiffany Lin <tiffany.lin@mediatek.com>
> CC: Yunfei Dong <yunfei.dong@mediatek.com>
> Signed-off-by: Yong Wu <yong.wu@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
