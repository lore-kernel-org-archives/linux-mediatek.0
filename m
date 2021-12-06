Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FE2DC433FE
	for <linux-mediatek@archiver.kernel.org>; Mon,  6 Dec 2021 13:49:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rhOjeym75tNSw3HHyp4uQG6wlKfqAoeSbm/wxhyEs8U=; b=AoJL1GPlHF3jS3
	yx4IuUGFG4HvXEnTQHG52dE4T1lR8q1pMsL7FsUbdhNfiOGZxenc/otxwRSFsIJNv1SZ5i35PeBGZ
	qkq4+aI8R6K1oZ/P6PQysYBoVgOLw2nu0RIbSb+fKP7lVQA/lpGZj/vaO71xJ/Ob1PSdNmxNZ5VYe
	RqF0TZcaCU5/I9rKeMxT9v77xNO6YeSR0gBN/wRrJxgo7AwRNOuWGY+sVXG7YRGrZsnA5aBZ2Tsn3
	7fb5KxHZyA9CYbo6/jWXlYkf+4KlKeyYoah6nqVNZY8lRS6vU1UWiogPt/HOeSFgmwPA2a2rIFY35
	kKWqUbijkzpKKWQsdF0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1muEMe-0044tc-O2; Mon, 06 Dec 2021 13:49:08 +0000
Received: from 8bytes.org ([2a01:238:4383:600:38bc:a715:4b6d:a889]
 helo=theia.8bytes.org)
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1muEMO-0044mU-Gt; Mon, 06 Dec 2021 13:48:53 +0000
Received: by theia.8bytes.org (Postfix, from userid 1000)
 id ED55F396; Mon,  6 Dec 2021 14:48:50 +0100 (CET)
Date: Mon, 6 Dec 2021 14:48:49 +0100
From: Joerg Roedel <joro@8bytes.org>
To: Hans Verkuil <hverkuil@xs4all.nl>
Subject: Re: [PATCH v9 00/15] Clean up "mediatek,larb"
Message-ID: <Ya4UwQ6QhjLA+OiS@8bytes.org>
References: <20211112105509.12010-1-yong.wu@mediatek.com>
 <Ya35hNY0iAR/JPmI@8bytes.org>
 <657ad1fc-0a90-bfc5-d4f1-9ff007f9f672@xs4all.nl>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <657ad1fc-0a90-bfc5-d4f1-9ff007f9f672@xs4all.nl>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211206_054852_733091_87F50CDE 
X-CRM114-Status: GOOD (  11.38  )
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
 Matthias Kaehlcke <mka@chromium.org>, Yong Wu <yong.wu@mediatek.com>,
 mingyuan.ma@mediatek.com, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, Philipp Zabel <p.zabel@pengutronix.de>,
 libo.kang@mediatek.com, yi.kuo@mediatek.com, Rob Herring <robh+dt@kernel.org>,
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

On Mon, Dec 06, 2021 at 01:33:36PM +0100, Hans Verkuil wrote:
> I think it might be easiest if it is all going through the media subsystem
> (except for the dts patches, we don't handle those unless specifically
> requested to do so). I need a resend for jpeg bindings txt to yaml
> conversion series first, though. This time with the linux-media mailinglist
> included :-)
> 
> I would need your Ack for the iommu patches as well, of course.

Okay, makes sense. IOMMU parts are 

Acked-by: Joerg Roedel <jroedel@suse.de>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
