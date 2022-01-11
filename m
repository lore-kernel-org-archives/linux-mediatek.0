Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A424C433EF
	for <linux-mediatek@archiver.kernel.org>; Tue, 11 Jan 2022 11:02:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AAx4Ygj5WSeVTldQ+0IS/JLfAWLZi5bWOmOImD0nYbg=; b=We8oiqh4vlpVbghVczwLwcn7zG
	yVbKZUKCdC7BxorHp5kU/UdvdTC0itw3WZhzvnrxd2xQ74WGy/Hvsw68vPt94s1f7Q0BLc8CzJDdS
	rtb9wwWEE1cQ6fc2oQkdWSOTdPkd2IwP8X0c+JbbvstQe1OUSyA0MCyOyGKuHVJivWn79s37plOtq
	Ck4U2rSUjAN1dNtm17kKDHVlBQvZClCnJzWuse/jFAd4uqThPa4qaFJxqnMs7s5S1+cXZeIODV/zX
	Vh26ogh+2ntd+ezJACVEPfgyLrchUrwmWxYvhx6o2N0iPEA9wMrmcge6cUoT/Yn7Dm0A9skllr5Rm
	tFCu83sA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n7Euo-00FvQ9-3r; Tue, 11 Jan 2022 11:02:10 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n7Eqf-00FsYt-GN; Tue, 11 Jan 2022 10:57:59 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id 53B6C1F43A3E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1641898672;
 bh=aSvQDDZiVNuGLK0+g5pmKJt4zz1QTtvk8bu0eYABcYE=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=RRn+gK/K6Oe8djLMwl7E0Zru4jSSkxXRUnWQAAfuLZ0AiA2fLNRpLyLimSJNIhMtu
 GbCmYibe3IdiVyevThwQNpRh3KXcNGbfn7j01ofTIwJnEZPN+qORhigdQ1iVcg8nuS
 ZON68CYWhNbbK5oABT+8xs7E9Oa1MWcR2JGP5Ca0LTcwd+YSk54BB4Kg+Jvof5vkRI
 KzK0frlA9SUROFZNEy2aduPWb5c4FqbSQVdv4RPrj69rUl14uTz3hOMqtH/l+MnsL2
 j7/wUm/JmNhovDWBm9IYHFOnL+5nul/9tnRNeWUnNgejZYTwTHVe0t2PjmYKrTa4Vh
 NmwUYMSMA4pBg==
Subject: Re: [PATCH v9 04/15] iommu/mediatek: Add probe_defer for smi-larb
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
 <20211112105509.12010-5-yong.wu@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Message-ID: <eaf59017-49d2-6579-a106-44bd2a21e5af@collabora.com>
Date: Tue, 11 Jan 2022 11:57:48 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211112105509.12010-5-yong.wu@mediatek.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220111_025753_768076_BCEFEAF6 
X-CRM114-Status: GOOD (  17.41  )
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

Il 12/11/21 11:54, Yong Wu ha scritto:
> Prepare for adding device_link.
> 
> The iommu consumer should use device_link to connect with the
> smi-larb(supplier). then the smi-larb should run before the iommu
> consumer. Here we delay the iommu driver until the smi driver is ready,
> then all the iommu consumers always are after the smi driver.
> 
> When there is no this patch, if some consumer drivers run before
> smi-larb, the supplier link_status is DL_DEV_NO_DRIVER(0) in the
> device_link_add, then device_links_driver_bound will use WARN_ON
> to complain that the link_status of supplier is not right.
> 
> device_is_bound may be more elegant here. but it is not allowed to
> EXPORT from https://lore.kernel.org/patchwork/patch/1334670/.
> 
> Signed-off-by: Yong Wu <yong.wu@mediatek.com>
> Tested-by: Frank Wunderlich <frank-w@public-files.de> # BPI-R2/MT7623

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
