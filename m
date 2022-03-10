Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09C98C433F5
	for <linux-mediatek@archiver.kernel.org>; Thu, 10 Mar 2022 02:51:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LJPpsIj10dV9VO1fn3Y1p5jQYVFjiWbLxnJ3Dn4R8Fo=; b=Yu1cZO6+NC93CA
	cq7uX7qQArhsI9CvX9K7SVUrpfc48s2iMKKpvEzos13i89F5QBk1TkHPzOkFGVZlSpMG+cM7+C4gp
	sDRgY1tiD0YufH6IGXe7cI8sQEkiEZbStSUnIEE8cWjhichPsurT+JZSAJ7vNZAwXBKFdpVN/5hTc
	fKZwk/iP4nWfdIqIRkampbUG8RHooJgclcs2LulF0WlSsWpShiTd5e3y2DeAJ+tZpsaM8Fqbhc0L5
	/PNg/c/trEDahgOk9yeIXn/ewXtj1WR4HUvON+OlNMg8Me/GAKeFTfEs9XZa2YOAFCinBAVkZDQwK
	mdyVYKBIvO3XCwRZqHpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nS8u1-00B5qd-IZ; Thu, 10 Mar 2022 02:51:45 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nS8ty-00B5p6-Kc; Thu, 10 Mar 2022 02:51:43 +0000
X-UUID: 8eb83e62e8934176b1e0113ff1f50eab-20220309
X-UUID: 8eb83e62e8934176b1e0113ff1f50eab-20220309
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <nancy.lin@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 281218641; Wed, 09 Mar 2022 19:51:35 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 9 Mar 2022 18:41:33 -0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Thu, 10 Mar 2022 10:41:31 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 10 Mar 2022 10:41:31 +0800
Message-ID: <9576ee1f2e59b3e719f0d4d5f861e1268821e973.camel@mediatek.com>
Subject: Re: [RESEND v13 07/22] soc: mediatek: mmsys: specify 64BIT
 dependency for MTK_MMSYS
From: Nancy.Lin <nancy.lin@mediatek.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, "Rob
 Herring" <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, Philipp Zabel
 <p.zabel@pengutronix.de>, <wim@linux-watchdog.org>, <linux@roeck-us.net>
CC: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, "Nathan
 Chancellor" <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>,
 "jason-jh . lin" <jason-jh.lin@mediatek.com>, Yongqiang Niu
 <yongqiang.niu@mediatek.com>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, <dri-devel@lists.freedesktop.org>,
 <llvm@lists.linux.dev>, <singo.chang@mediatek.com>,
 <srv_heupstream@mediatek.com>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>
Date: Thu, 10 Mar 2022 10:41:31 +0800
In-Reply-To: <d6fa28ef-fdbb-2b6c-acaa-4c35bb631ab4@collabora.com>
References: <20220308093018.24189-1-nancy.lin@mediatek.com>
 <20220308093018.24189-8-nancy.lin@mediatek.com>
 <d6fa28ef-fdbb-2b6c-acaa-4c35bb631ab4@collabora.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220309_185142_692747_ADBD82D2 
X-CRM114-Status: GOOD (  19.04  )
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

Hi Angelo,

Thanks for the review.

On Tue, 2022-03-08 at 14:41 +0100, AngeloGioacchino Del Regno wrote:
> Il 08/03/22 10:30, Nancy.Lin ha scritto:
> > Because mtk-mutex change to use unsigned long mutex module type,
> > it should depend 64BIT. This is a preparation for adding support
> > for
> > mt8195 vdosys1 mutex.
> > 
> > Signed-off-by: Nancy.Lin <nancy.lin@mediatek.com>
> > ---
> >   drivers/soc/mediatek/Kconfig | 1 +
> >   1 file changed, 1 insertion(+)
> > 
> > diff --git a/drivers/soc/mediatek/Kconfig
> > b/drivers/soc/mediatek/Kconfig
> > index fdd8bc08569e..24f792c46444 100644
> > --- a/drivers/soc/mediatek/Kconfig
> > +++ b/drivers/soc/mediatek/Kconfig
> > @@ -68,6 +68,7 @@ config MTK_SCPSYS_PM_DOMAINS
> >   config MTK_MMSYS
> >   	bool "MediaTek MMSYS Support"
> >   	default ARCH_MEDIATEK
> > +	depends on 64BIT
> >   	depends on HAS_IOMEM
> >   	help
> >   	  Say yes here to add support for the MediaTek Multimedia
> 
> Breaking old platforms is forbidden.
> 
> MT2701 and MT7623N are 32-bit ARM SoCs and:
> - mt2701 needs mmsys only; but
> - mt7623n needs mmsys and mutex.
> 
> Besides, this is an easy fix: just change your unsigned long to a
> fixed size u64.

OK, I will change to use fixed size u64. Thanks for your sugguestion.

Regards,
Nancy


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
