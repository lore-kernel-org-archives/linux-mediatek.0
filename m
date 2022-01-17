Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74DF8C433F5
	for <linux-mediatek@archiver.kernel.org>; Mon, 17 Jan 2022 09:51:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WC/r9NLQOL+JNif4mHHbgn2/9It1DoS9LWqBWKN/s74=; b=axHHZID4pH2bzh
	jSkKiODdjM/9ci8R4k2iqHx20mZwBY9giZImBaMs7GBzbwdz1/JaDMsaoHkSrOGEK1no/Dofkx8hb
	peCdoKx/2Q7QQQJA9EHv8rT/IJ586YW88CWCutRXoMF7Xqt2xWDpKlSpUWDpUN3LIfvDRN3iNBqD8
	2LcClkdwxHQEbfPoX+855g2eF9ZyoFbXeQ4hkV2/iSrZaMt8J8Pr1KLrbRHeJ6zcn+10iqThsK9q0
	b/ETKDK21zneskljxxquiL9zOGBX9HsuQ/Uu7lDHtDn8xjkthJfVyK4CRAYLyZRwy4COnDFLa5xTO
	vJaJxttUeczrE1vNmI7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n9OfU-00ELa1-A0; Mon, 17 Jan 2022 09:51:16 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n9Oef-00ELAC-6E; Mon, 17 Jan 2022 09:50:29 +0000
X-UUID: 637426b4385b4eb78f012e3af92ffa70-20220117
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=3NgWli9osbvpGBWKx1IPLvRCzb/Fbp8vn8ZPL/rQ+8I=; 
 b=CPFvM90YWNzsgnCYcTDwvvjlWPg7EOT4yiH7EOx/dcEDC3zejCOGFu9yPEGwkNSG5/LXflHU8P8uNInGEO3aGVlPsJMbtId1DoYeX5HuL+er/qqBEKClRzKbjO1KXTF/Ij+SmMtwPkT1GVXfAxHKsGaQl7Y6c43XNwNYtk7HzYI=;
X-UUID: 637426b4385b4eb78f012e3af92ffa70-20220117
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <yong.wu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1987520484; Mon, 17 Jan 2022 02:50:18 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 17 Jan 2022 01:41:22 -0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3; 
 Mon, 17 Jan 2022 17:41:20 +0800
Received: from mhfsdcap04 (10.17.3.154) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 17 Jan 2022 17:41:19 +0800
Message-ID: <ebbe29162688b230aec208a45762f795c850e396.camel@mediatek.com>
Subject: Re: [PATCH v9 12/15] media: mtk-vcodec: enc: Remove
 mtk_vcodec_release_enc_pm
From: Yong Wu <yong.wu@mediatek.com>
To: Matthias Brugger <matthias.bgg@gmail.com>, Hans Verkuil
 <hverkuil@xs4all.nl>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>
CC: Joerg Roedel <joro@8bytes.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>, David Airlie
 <airlied@linux.ie>, Mauro Carvalho Chehab <mchehab@kernel.org>, "Dafna
 Hirschfeld" <dafna.hirschfeld@collabora.com>, Chun-Kuang Hu
 <chunkuang.hu@kernel.org>, Will Deacon <will.deacon@arm.com>,
 <dri-devel@lists.freedesktop.org>, <yf.wang@mediatek.com>,
 <anthony.huang@mediatek.com>, <youlin.pei@mediatek.com>, Irui Wang
 <irui.wang@mediatek.com>, Evan Green <evgreen@chromium.org>, Eizan Miyamoto
 <eizan@chromium.org>, Matthias Kaehlcke <mka@chromium.org>,
 <linux-arm-kernel@lists.infradead.org>, <mingyuan.ma@mediatek.com>,
 <linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>, Philipp Zabel
 <p.zabel@pengutronix.de>, <libo.kang@mediatek.com>, <yi.kuo@mediatek.com>,
 <linux-mediatek@lists.infradead.org>, Hsin-Yi Wang <hsinyi@chromium.org>,
 Tiffany Lin <tiffany.lin@mediatek.com>, <anan.sun@mediatek.com>,
 <srv_heupstream@mediatek.com>, <acourbot@chromium.org>,
 <linux-kernel@vger.kernel.org>, Tomasz Figa <tfiga@chromium.org>,
 <iommu@lists.linux-foundation.org>, Daniel Vetter <daniel@ffwll.ch>, "Robin
 Murphy" <robin.murphy@arm.com>
Date: Mon, 17 Jan 2022 17:41:18 +0800
In-Reply-To: <e940d705-2057-4d5e-0a21-8464ca04caaf@gmail.com>
References: <20211112105509.12010-1-yong.wu@mediatek.com>
 <20211112105509.12010-13-yong.wu@mediatek.com>
 <68c3a573-8453-38e9-93b2-2067bedcd06f@collabora.com>
 <4bd9e849-96dd-6f1c-2841-979459366ee5@collabora.com>
 <fa9b2b73-c6bb-5737-93ac-ba2ab6b3b771@xs4all.nl>
 <e940d705-2057-4d5e-0a21-8464ca04caaf@gmail.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220117_015025_348210_39F3E664 
X-CRM114-Status: GOOD (  25.92  )
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

On Thu, 2022-01-13 at 17:10 +0100, Matthias Brugger wrote:
> Hi Hans,
> 
> On 13/01/2022 11:15, Hans Verkuil wrote:
> > On 13/01/2022 11:11, AngeloGioacchino Del Regno wrote:
> > > Il 11/01/22 11:57, AngeloGioacchino Del Regno ha scritto:
> > > > Il 12/11/21 11:55, Yong Wu ha scritto:
> > > > > After this patchset, mtk_vcodec_release_enc_pm has only one
> > > > > line.
> > > > > then remove that function, use pm_runtime_disable instead.
> > > > > 
> > > > > meanwhile, mtk_vcodec_init_enc_pm only operate for the
> > > > > clocks,
> > > > > rename it from the _pm to _clk.
> > > > > 
> > > > > No functional change.
> > > > > 
> > > > > CC: Tiffany Lin <tiffany.lin@mediatek.com>
> > > > > CC: Irui Wang <irui.wang@mediatek.com>
> > > > > Signed-off-by: Yong Wu <yong.wu@mediatek.com>
> > > > 
> > > > Reviewed-by: AngeloGioacchino Del Regno <
> > > > angelogioacchino.delregno@collabora.com>
> > > > 
> > > 
> > > Hello Yong,
> > > the mtk-vcodec patches were merged in Yunfei's vcodec patch
> > > series and Hans has
> > > scheduled that for v5.18.
> > > 
> > > Can you please send a v10 and drop patches 10/15, 11/15, 12/15
> > > (all of the
> > > media: mtk-vcodec: *) from this series?

Hi Angelo,

   I have dropped 11/15 and 12/15 in v10 and rebase 10/15 on media tree
manually, thus I didn't keep your A-y for that one.

   Please take a look at that one.
 
   Thanks.

> > > 
> > > For the records, I think that after sending v10 this series is
> > > ready to be merged,
> > > as it was well reviewed and also tested on many MTK platforms.
> > 
> > Good to know. When I have the v10 I'll try to prioritize reviewing
> > it and running
> > my usual tests.

Hi Hans/Matthias,

v10: 
https://patchwork.linuxtv.org/project/linux-media/list/?series=7130

Please help take a look that one.

> > 
> > Yong, please make sure you run 'checkpatch.pl --strict' over the
> > v10 patches and fix
> > any issues (using common sense).

   Have run this on v10.

Thanks.
> > 
> 
> Can you please take me in the look when you take the patches. I'll
> take the DTS 
> related as soon as you queue up the others.
> 
> Thanks!
> Matthias
> 
> > Regards,
> > 
> > 	Hans
> > 
> > > 
> > > Thank you,
> > > - Angelo
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
