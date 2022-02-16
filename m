Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BF27C433EF
	for <linux-mediatek@archiver.kernel.org>; Wed, 16 Feb 2022 06:05:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=g9PqdIxuY3ajVjuW+3wCcvnkTQiD+9W0CulEvEnysp0=; b=GAx4zHfypF4uqh
	6+fol5nTme2WIODhfirOTQ+xrifwrRQ8PP63eHeh1/cUdO27effOOYihM4D6xBd6Pe6y+sZXko1lV
	bjzkbf2jRkwQVGwvmD6w/sU6CfvJ5J/QjgycLWM7KtHayihpgYzHQdOrGxis4+VggcJCHUdWE0E0L
	ie8YD4YLAj4Qi6meIh+o+N20y+swIc6Ik9W/18N7TAbmZZ76IU+9XJyvsdVyqxSckbJr/1kv8Y0mJ
	6UXabYRccQqJN1ARnLNP3v6s+UxEHtlyNOx46fzN5/ZweTkVhQsnQTjH/DOm60vYKhEJ2dBEctjuA
	7DMUAaw4/nt2lOg2GYVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nKDQt-005e5g-J4; Wed, 16 Feb 2022 06:04:55 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nKDQp-005e4V-6u; Wed, 16 Feb 2022 06:04:54 +0000
X-UUID: 63b0bf030a1c4ac0b0c510df0dacddce-20220215
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=JrxS6PGfpKHJ8vzYfVRKxglWcjE53OMwPpMRrAbiNU0=; 
 b=jOilqm4Xy3I7ecfELxH1T68mwCJqf9rry3HPSEndIMbUvURH4aSAwXl4Oil8XGOTygY+CdikP93GoMV6c6djOOIFnDfGSxpKXzZXHbL1lzCFJJ4qjKOPLERFTxqYQlgvDHlxE8CTr1EYUSlwNqyInnctR+5BHpuqgAvoXQ5DUN0=;
X-UUID: 63b0bf030a1c4ac0b0c510df0dacddce-20220215
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <yong.wu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1697190753; Tue, 15 Feb 2022 23:04:43 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 15 Feb 2022 21:55:02 -0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Wed, 16 Feb 2022 13:55:01 +0800
Received: from mhfsdcap04 (10.17.3.154) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 16 Feb 2022 13:54:59 +0800
Message-ID: <d9637b40196873f392ac9cebfe369106a6f0eee7.camel@mediatek.com>
Subject: Re: [PATCH v4 08/35] iommu/mediatek: Use kmalloc for protect buffer
From: Yong Wu <yong.wu@mediatek.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
CC: Robin Murphy <robin.murphy@arm.com>, Krzysztof Kozlowski
 <krzysztof.kozlowski@canonical.com>, Tomasz Figa <tfiga@chromium.org>,
 <linux-mediatek@lists.infradead.org>, <srv_heupstream@mediatek.com>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <iommu@lists.linux-foundation.org>,
 Hsin-Yi Wang <hsinyi@chromium.org>, <youlin.pei@mediatek.com>,
 <anan.sun@mediatek.com>, <xueqi.zhang@mediatek.com>,
 <yen-chang.chen@mediatek.com>, <mingyuan.ma@mediatek.com>,
 <yf.wang@mediatek.com>, <libo.kang@mediatek.com>, <chengci.xu@mediatek.com>,
 Joerg Roedel <joro@8bytes.org>, Rob Herring <robh+dt@kernel.org>, "Matthias
 Brugger" <matthias.bgg@gmail.com>, Will Deacon <will@kernel.org>
Date: Wed, 16 Feb 2022 13:54:59 +0800
In-Reply-To: <ca47becf-adc9-f11e-5e59-03f203920344@collabora.com>
References: <20220125085634.17972-1-yong.wu@mediatek.com>
 <20220125085634.17972-9-yong.wu@mediatek.com>
 <ca47becf-adc9-f11e-5e59-03f203920344@collabora.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220215_220452_694392_E1D4C7DE 
X-CRM114-Status: GOOD (  16.09  )
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

On Thu, 2022-01-27 at 12:08 +0100, AngeloGioacchino Del Regno wrote:
> Il 25/01/22 09:56, Yong Wu ha scritto:
> > No need zero for the protect buffer that is only accessed by the
> > IOMMU HW
> > translation fault happened.
> > 
> > Signed-off-by: Yong Wu <yong.wu@mediatek.com>
> 
> I would rather keep this a devm_kzalloc instead... the cost is very
> minimal and
> this will be handy when new hardware will be introduced, as it may
> require a bigger
> buffer: in that case, "older" platforms will use only part of it and
> we may get
> garbage data at the end.

Currently this is to avoid zero 512 bytes for all the platforms.

Sorry, I don't understand why it is unnecessary when the new hardware
requires a bigger buffer. If the buffer becomes bigger, then clearing
it to 0 need more cost. then this patch is more helpful?

The content in this buffer is garbage, we won't care about or analyse
it.

> 
> Regards,
> Angelo
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
