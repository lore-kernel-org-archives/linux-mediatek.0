Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB45FC433EF
	for <linux-mediatek@archiver.kernel.org>; Thu, 10 Feb 2022 07:50:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qBxvWb4Pd/GaHG71W/Ij8p8Hh89Q/yK9eDH/QFNMF6k=; b=Uf8S0gTtsGQ891
	5lKsuwf5W0YM/RF/qhz8E2Y9Bb9DcbMttrwCg6d46KA4mcc66bKvCp9nVWDE3inciwc57N2EuJzLd
	273i5e0yUrITS9NHx3qdCBZvA8uFgHNbZFHqy9FE2JDRckEw35eBzv5QmzklQ68MOLOlucc/mNrYT
	JvchOfNBiCG6x9tpRPpVpIRJBF4FfnrZzpluOxRghm3wj8jk/1s/aiWvbTIwlMD0qo2RvpflPmk1g
	0W2+vXU9vyd9HKZgzD45Mvmx0jKaBeTmVksSRipK+13ftS2+gF1H4C3KLXwvFUq8zSLv7GhSQpAw4
	eKBNVg0H6uqT1WCjfuoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nI4Di-002vuC-7M; Thu, 10 Feb 2022 07:50:26 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nI4DR-002vlN-SZ; Thu, 10 Feb 2022 07:50:11 +0000
X-UUID: a98e9dd5d47d4922ae8a8f547fe0f664-20220210
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=faCuWFRjaTfv9Zgib3R+c+bUwB/LfIm9iz/RWb4LUGs=; 
 b=oIdA8g9WPCIfCSvqYD1Hb0qpDqcUdlE3Z5w/G+LRO5DiQJPBqGL99duRRbI1t80qgMEHT01jNp/jKpvrTSuTjpZo0o5u83rS3cOUzHspL8P2PF/+yubWAm26+sNPki7OmfGLR6aHBWDxLhAqQ62JCtEBtyKcPgUZN37GtHnznTU=;
X-UUID: a98e9dd5d47d4922ae8a8f547fe0f664-20220210
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw02.mediatek.com
 (envelope-from <yong.wu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 171337631; Thu, 10 Feb 2022 00:49:57 -0700
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 9 Feb 2022 23:49:56 -0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 10 Feb 2022 15:49:54 +0800
Received: from mhfsdcap04 (10.17.3.154) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 10 Feb 2022 15:49:53 +0800
Message-ID: <face7ccf80520ecad1b75f01f74314ddb483b88b.camel@mediatek.com>
Subject: Re: [RFC PATCH] component: Add common helpers for compare/release
 functions
From: Yong Wu <yong.wu@mediatek.com>
To: Robin Murphy <robin.murphy@arm.com>, <dri-devel@lists.freedesktop.org>
CC: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, "James
 Wang" <james.qian.wang@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 <iommu@lists.linux-foundation.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Krzysztof Kozlowski
 <krzysztof.kozlowski@canonical.com>, <linux-kernel@vger.kernel.org>, "Joerg
 Roedel" <joro@8bytes.org>, Will Deacon <will@kernel.org>, Arnd Bergmann
 <arnd@arndb.de>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 <linux-mediatek@lists.infradead.org>, Chun-Kuang Hu
 <chunkuang.hu@kernel.org>, <linux-arm-kernel@lists.infradead.org>, "Stephen
 Boyd" <sboyd@kernel.org>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>, Hsin-Yi Wang
 <hsinyi@chromium.org>, Tomasz Figa <tfiga@chromium.org>,
 <srv_heupstream@mediatek.com>, Rob Clark <robdclark@gmail.com>, "Srinivas
 Kandagatla" <srinivas.kandagatla@linaro.org>, Sebastian Reichel
 <sre@kernel.org>
Date: Thu, 10 Feb 2022 15:49:53 +0800
In-Reply-To: <29deffd6-aac4-f085-bcd5-f5a2d02784a8@arm.com>
References: <20220128081101.27837-1-yong.wu@mediatek.com>
 <29deffd6-aac4-f085-bcd5-f5a2d02784a8@arm.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220209_235009_951447_A8B7B5F9 
X-CRM114-Status: GOOD (  21.67  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Fri, 2022-01-28 at 13:04 +0000, Robin Murphy wrote:
> On 2022-01-28 08:11, Yong Wu wrote:
> [...]
> > diff --git a/include/linux/component.h b/include/linux/component.h
> > index 16de18f473d7..5a7468ea827c 100644
> > --- a/include/linux/component.h
> > +++ b/include/linux/component.h
> > @@ -2,6 +2,8 @@
> >   #ifndef COMPONENT_H
> >   #define COMPONENT_H
> >   
> > +#include <linux/device.h>
> > +#include <linux/of.h>
> >   #include <linux/stddef.h>
> >   
> >   
> > @@ -82,6 +84,22 @@ struct component_master_ops {
> >   	void (*unbind)(struct device *master);
> >   };
> >   
> > +/* A set common helpers for compare/release functions */
> > +static inline int compare_of(struct device *dev, void *data)
> > +{
> > +	return dev->of_node == data;
> > +}
> 
> Note that this is effectively just device_match_of_node(), although
> I 
> guess there is an argument that having a nice consistent set of 
> component_match API helpers might be worth more than a tiny code
> saving 
> by borrowing one from a different API.

Thanks for this tip. I could try use this, Let the maintainer decide.

> 
> Either way, however, I don't think there's any good argument for 
> instantiating separate copies of these functions in every driver
> that 
> uses them. If they're used as callbacks then they can't actually be 
> inlined anyway, so they may as well be exported from component.c as 

oh. The MTK iommu keeps this inline for long time... OK, I will try
to move into the component.c and export them.

(Sorry for the late reply due to New Year holidays.)

> normal so that the code really is shared (plus then there's nice 
> symmetry with the aforementioned device_match API helpers too).
> 
> Thanks,
> Robin.
  
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
