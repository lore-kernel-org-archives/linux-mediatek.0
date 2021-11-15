Return-Path: <SRS0=W1mV=QC=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D6FD9C433EF
	for <linux-mediatek@archiver.kernel.org>; Mon, 15 Nov 2021 01:40:04 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 91EB460FE7
	for <linux-mediatek@archiver.kernel.org>; Mon, 15 Nov 2021 01:40:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 91EB460FE7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jt46saojegFhFrtTJx71HsiwsEga+6vQ3LQX4wzvWCw=; b=vFwS4LUc6ncY4Z
	xQ0sCIiwzYAEUImzP7uzi/3BCdArHHApKTh/5tAJKBOCnHP5DGoHhZMdgkEx3D1GLt2u1vyrAy1Up
	dyQTtauSxgE910adTLEbPXgYfD7uoLBnwAI5vRbl4sgN9drdrZ7AMmHCCmqFirIDd8huj/43quktM
	UrlgBrx23bp8w6pIEz9Fc22kU8YuYBYzbzYV0PZnsE8jrt3ezCJzeF0yfrT8eQs64296LEAtumUGR
	8Ntr+xS3ocp3VL8Z6gUYHW7HKFCSZhw7+SdjSaAjnxHBxXX4lCwQd7ijtcxccfcum6iQEx3LaPiKH
	bCz18bgbXFWphynQYkSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mmQyQ-00EE9T-EJ; Mon, 15 Nov 2021 01:39:54 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mmQyM-00EE8j-G3; Mon, 15 Nov 2021 01:39:52 +0000
X-UUID: f52c0796448c49e3b43675ed7b2190be-20211114
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=m7CZhzDmIxIx57bHGNSmwup8iYmTNmCUfIGDVzGXVbI=; 
 b=ZqA1CGpDxe00eLHYI80qrx8SXmFhx7ISGC+Z0v02SS09MY/ebnzk08QRoVyPGiMZX7DR8ZHkmp4VvPHwLm4vkpy/KlK6F29mm29CW5qJolilbUosI7G2bwpx+IBoHOg8Xhf0c5HcTuExB3X9rL3+Smee34i08ukk8qI4QsWcOeI=;
X-UUID: f52c0796448c49e3b43675ed7b2190be-20211114
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <biao.huang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1699583518; Sun, 14 Nov 2021 18:39:43 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sun, 14 Nov 2021 17:39:41 -0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Mon, 15 Nov 2021 09:39:39 +0800
Received: from mhfsdcap04 (10.17.3.154) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 15 Nov 2021 09:39:38 +0800
Message-ID: <ec7c46b2846a42e18bbaea2f811386bacdd26985.camel@mediatek.com>
Subject: Re: [PATCH v3 4/7] net-next: dt-bindings: dwmac: Convert
 mediatek-dwmac to DT schema
From: Biao Huang <biao.huang@mediatek.com>
To: Rob Herring <robh@kernel.org>
CC: <linux-kernel@vger.kernel.org>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>, <davem@davemloft.net>, Giuseppe Cavallaro
 <peppe.cavallaro@st.com>, Jakub Kicinski <kuba@kernel.org>,
 <linux-arm-kernel@lists.infradead.org>,
 <linux-stm32@st-md-mailman.stormreply.com>, <netdev@vger.kernel.org>, "Jose
 Abreu" <joabreu@synopsys.com>, <macpaul.lin@mediatek.com>,
 <linux-mediatek@lists.infradead.org>,
 <angelogioacchino.delregno@collabora.com>, <srv_heupstream@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>, Rob Herring <robh+dt@kernel.org>,
 <dkirjanov@suse.de>, <devicetree@vger.kernel.org>
Date: Mon, 15 Nov 2021 09:39:38 +0800
In-Reply-To: <1636724917.159298.2463374.nullmailer@robh.at.kernel.org>
References: <20211112093918.11061-1-biao.huang@mediatek.com>
 <20211112093918.11061-5-biao.huang@mediatek.com>
 <1636724917.159298.2463374.nullmailer@robh.at.kernel.org>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211114_173950_562066_ECBF15FD 
X-CRM114-Status: GOOD (  17.47  )
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

Dear Rob,

There is a patch named "[PATCH v3 3/7] arm64: dts: mt2712: update
ethernet device node" to fix these warnings in this series.

Could you give me some hints why these warnings still there, or how to
fix them?

Best Regards!

On Fri, 2021-11-12 at 07:48 -0600, Rob Herring wrote:
> On Fri, 12 Nov 2021 17:39:15 +0800, Biao Huang wrote:
> > Convert mediatek-dwmac to DT schema, and delete old mediatek-
> > dwmac.txt.
> > 
> > Signed-off-by: Biao Huang <biao.huang@mediatek.com>
> > ---
> >  .../bindings/net/mediatek-dwmac.txt           |  91 ----------
> >  .../bindings/net/mediatek-dwmac.yaml          | 157
> > ++++++++++++++++++
> >  2 files changed, 157 insertions(+), 91 deletions(-)
> >  delete mode 100644 Documentation/devicetree/bindings/net/mediatek-
> > dwmac.txt
> >  create mode 100644 Documentation/devicetree/bindings/net/mediatek-
> > dwmac.yaml
> > 
> 
> Running 'make dtbs_check' with the schema in this patch gives the
> following warnings. Consider if they are expected or the schema is
> incorrect. These may not be new warnings.
> 
> Note that it is not yet a requirement to have 0 warnings for
> dtbs_check.
> This will change in the future.
> 
> Full log is available here: 
> https://patchwork.ozlabs.org/patch/1554228
> 
> 
> ethernet@1101c000: clock-names: ['axi', 'apb', 'mac_main', 'ptp_ref']
> is too short
> 	arch/arm64/boot/dts/mediatek/mt2712-evb.dt.yaml
> 
> ethernet@1101c000: clocks: [[27, 34], [27, 37], [6, 154], [6, 155]]
> is too short
> 	arch/arm64/boot/dts/mediatek/mt2712-evb.dt.yaml
> 
> ethernet@1101c000: compatible: ['mediatek,mt2712-gmac'] does not
> contain items matching the given schema
> 	arch/arm64/boot/dts/mediatek/mt2712-evb.dt.yaml
> 
> ethernet@1101c000: compatible: 'oneOf' conditional failed, one must
> be fixed:
> 	arch/arm64/boot/dts/mediatek/mt2712-evb.dt.yaml
> 
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
