Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 544D9C433F5
	for <linux-mediatek@archiver.kernel.org>; Tue, 11 Jan 2022 10:58:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PMCWJyc11KCirl2gChTTTvF3bUZ0fRrtkrNWPWP/Q0I=; b=t2rnFI0+MPEC8WoQl4X/ZbayZ/
	xoRi89kNDJx0iAwEfkJFpJNbEN6DZdC+ckMWiA9BprszQx9f3DWiOdGAbOR+MTHOxnlx9Uxt18Mi5
	CpMEJoSxiJQVAffIfJqUYmx/1YbpVEZQGLBLiCp2swCINJ5cqCoMqZpyNiog6YJutTAiAC4wrsOL2
	Lu1TvOhxJ9xXGmiidqnv3uaID2F/cgP1Bk3bGyT2nQHkxIF4tJegbpQ0aN11acvhGiblwpZ6B2bcz
	tapGvUF5yQl+8FJNrvArgo76GW8T36988OQJWSCxbdQyRZXM9iECvOZW/DZpw2/P4YVIRxWzqkkHw
	aQq3PsdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n7Er2-00FsyI-DA; Tue, 11 Jan 2022 10:58:16 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n7EqR-00FsLP-EN; Tue, 11 Jan 2022 10:57:40 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id BA5D11F43A1E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1641898657;
 bh=odIaYUtTLtqDV6yq4bHb+J7fAeN6960RbkGDgDyuzKE=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=ntvmSjOyg+6YLC3LW1riENiDGrPvlKiPBVSv/XdDPh9JBuJXY0n3EXj/RGO7SA3bF
 xBFAvubQqCWN0PoADFlikeXf45LiMOs4ZaUud1XGx+ejJgB4HpbvRmERwfpcBc7hY5
 6k22EDTLby/20VPss4mRejOEONSPkZPGTxHxS1eVa3LmFllh7SFlkP8Eoms0bOOxAb
 bASzAfgJpZrkkrBOXixa3Dc65+e0+vMLCcX7nEg7MGHgkLKA5lFJMxJ6GvhkwrBzQQ
 PHwaeX2kKPXifJFkRQ2BgNjXnl9hq0YLUKy4uGiFdnX6Si3QUddFRszpOUO80X/Xhc
 ikr9p3+pzKYfA==
Subject: Re: [PATCH v9 13/15] memory: mtk-smi: Get rid of mtk_smi_larb_get/put
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
 <20211112105509.12010-14-yong.wu@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Message-ID: <d1a6af37-a51a-e31a-aace-d43227ac5e19@collabora.com>
Date: Tue, 11 Jan 2022 11:57:33 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211112105509.12010-14-yong.wu@mediatek.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220111_025739_646610_6D37C31A 
X-CRM114-Status: GOOD (  11.03  )
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
> After adding device_link between the iommu consumer and smi-larb,
> the pm_runtime_get(_sync) of smi-larb and smi-common will be called
> automatically. we can get rid of mtk_smi_larb_get/put.
> 
> CC: Matthias Brugger <matthias.bgg@gmail.com>
> Signed-off-by: Yong Wu <yong.wu@mediatek.com>
> Reviewed-by: Evan Green <evgreen@chromium.org>
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
> Acked-by: Matthias Brugger <matthias.bgg@gmail.com>
> Reviewed-by: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
> Tested-by: Frank Wunderlich <frank-w@public-files.de> # BPI-R2/MT7623

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
