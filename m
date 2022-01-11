Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8D7EC433F5
	for <linux-mediatek@archiver.kernel.org>; Tue, 11 Jan 2022 11:00:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=r0S1hDwJ0bJY6vTjMkhpPGd+j88pLRzoZeM6OypeXgM=; b=W5s4loK9+L7Mmf5PbG5aVyXPln
	eXMqulF9yP8L8O5aNIp00rq/K2TCi8y6HPRhFUNooYtoUxgrOhc+QSRUuqqyUJxP4wHTAuxNeo/9w
	h1aX39vzWghbb63rG/U1Ubj5C3K9BgcuFvtQkkKuvMePIHCEfqV4z7pKAEz1I1oeT1r7VwXnslr3F
	8zKh7l0qvK0waAXNwe+7DLwy8FxMzY8Hh2VzjKXGgHb9pNstszNF+7P45bTXjPQdMWRh9XbzwZNqh
	YghgTJZ6othIxvUxbOv9YG2j7v7VHIZ/UgkwEgPVC64LX3oMYSpxkRXDTGJngfA2uyP5y+6Bk4jar
	7nzRr6fg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n7EtP-00Fud0-QA; Tue, 11 Jan 2022 11:00:43 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n7Eqd-00FsVW-2c; Tue, 11 Jan 2022 10:57:55 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id 7F8D61F43A35
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1641898669;
 bh=w5BDtpAS0IG8A52FS/8V2a2UttXGE+Cd5hv/CSzivNE=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=YiyLULsgUHw/8bEQUraCWZ47NGhu/oZat3mLwkUxP0OHrHmnIumJbpycM+cDbhcog
 bSF0Rog5BfHklpvJkxJY8oDnhEF9Z7GQGd/RPARulgMY/HjTldhm1SZEtVwZtYlyWP
 AiRk59GOJjVjBhj+SQmmZjPu0Mh3bsNvdAXUvv1HH3OR1Yu2Da+68ocTSP3rIebtkX
 4Gn4UOIbkBSJ9RVrI3KA4aMdwHacS+PmqCBGp7zpHDxu4wvy+21qkz84COAB7a/hiP
 3kkhN2gGyc9hLfo2CVQL1IEqH6lFSniTJfwAGajOkR6Nd8FoA9nk2OTal/BWcKbdhI
 mUaRVU2/OMeyw==
Subject: Re: [PATCH v9 06/15] media: mtk-jpeg: Get rid of mtk_smi_larb_get/put
To: Yong Wu <yong.wu@mediatek.com>, Matthias Brugger
 <matthias.bgg@gmail.com>, Joerg Roedel <joro@8bytes.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 David Airlie <airlied@linux.ie>, Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Xia Jiang <xia.jiang@mediatek.com>,
 Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, Will Deacon <will.deacon@arm.com>,
 dri-devel@lists.freedesktop.org, yf.wang@mediatek.com,
 anthony.huang@mediatek.com, youlin.pei@mediatek.com,
 Rick Chang <rick.chang@mediatek.com>, Evan Green <evgreen@chromium.org>,
 Eizan Miyamoto <eizan@chromium.org>, Matthias Kaehlcke <mka@chromium.org>,
 linux-arm-kernel@lists.infradead.org, mingyuan.ma@mediatek.com,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 Philipp Zabel <p.zabel@pengutronix.de>, libo.kang@mediatek.com,
 yi.kuo@mediatek.com, linux-mediatek@lists.infradead.org,
 Hsin-Yi Wang <hsinyi@chromium.org>, Tiffany Lin <tiffany.lin@mediatek.com>,
 anan.sun@mediatek.com, srv_heupstream@mediatek.com, acourbot@chromium.org,
 linux-kernel@vger.kernel.org, Tomasz Figa <tfiga@chromium.org>,
 iommu@lists.linux-foundation.org, Daniel Vetter <daniel@ffwll.ch>,
 Robin Murphy <robin.murphy@arm.com>
References: <20211112105509.12010-1-yong.wu@mediatek.com>
 <20211112105509.12010-7-yong.wu@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Message-ID: <1003e60d-fa75-d518-943d-72ff88d6b132@collabora.com>
Date: Tue, 11 Jan 2022 11:57:44 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211112105509.12010-7-yong.wu@mediatek.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220111_025751_324132_616E5C1C 
X-CRM114-Status: GOOD (  11.74  )
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
> MediaTek IOMMU has already added device_link between the consumer
> and smi-larb device. If the jpg device call the pm_runtime_get_sync,
> the smi-larb's pm_runtime_get_sync also be called automatically.
> 
> After removing the larb_get operations, then mtk_jpeg_clk_init is
> also unnecessary. Remove it too.
> 
> CC: Rick Chang <rick.chang@mediatek.com>
> CC: Xia Jiang <xia.jiang@mediatek.com>
> Signed-off-by: Yong Wu <yong.wu@mediatek.com>
> Reviewed-by: Evan Green <evgreen@chromium.org>
> Acked-by: Rick Chang <rick.chang@mediatek.com>
> Reviewed-by: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
> Tested-by: Frank Wunderlich <frank-w@public-files.de> # BPI-R2/MT7623

Acked-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
