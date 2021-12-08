Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0ADCCC433EF
	for <linux-mediatek@archiver.kernel.org>; Wed,  8 Dec 2021 01:21:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=44mFXLw7NPAM+6tVI882jLc7IFAaJhJ58rDUAxvKtg0=; b=j37qfQCl51+77U
	mPJ5WNzAJBxMXEaF3+0HPSJdYY3rAJ1nXJ2qlBxT2IiU5FB79+uFHRev/VfGZABYmKSp08fZUChA8
	JyAv+7CmN0/kp64y0DK9+w0dXxj1TkdDw7x4d7OMEtC34mFiJRWwK/HPZlXVkXNfaQO/3DVkD4f8Q
	dRUrFVmv7y3RXAv7VQgWGLzGO4y3cw4uUqElvBkOiK9vPVopZkPVbm6tzI1TzRgufHJpbQlhDa2PU
	CsBdzoJhjNTRiOZ0dL47NRbpKFKII3aL9pKNC+Ou6kRUNJhrZO8lEvwNU+jAlo6//bwjuyXcVlLtz
	CYUyGkNpUUpP2dGBmhnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1muldd-00AXLR-8x; Wed, 08 Dec 2021 01:20:53 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1muldb-00AXKh-8W; Wed, 08 Dec 2021 01:20:52 +0000
X-UUID: ff8a4405fbf249c79cd37c2c5b90c057-20211207
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=8MEfUWmmn3GyKsBzKhZSTZEmNpkk6avA7qVgY8BtriE=; 
 b=bufZfLL/YW1OXhgCj+OVYknySZMrucfJ73JZdVMLJuvr6GbYOsYUVD2bzTLq9ypD4jcBb7QeISOFvLzW0Bpc+5mmfh2Jxu9+SlyxaOJAOkfY+OeQFGv4azNGjfs6ej4QwmdioYCQmiWUsLGAqO1zijOm1Fd5APfQWPlEP9EaaEg=;
X-UUID: ff8a4405fbf249c79cd37c2c5b90c057-20211207
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <biao.huang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 921920727; Tue, 07 Dec 2021 18:20:47 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 7 Dec 2021 17:20:45 -0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3; 
 Wed, 8 Dec 2021 09:20:44 +0800
Received: from mhfsdcap04 (10.17.3.154) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 8 Dec 2021 09:20:43 +0800
Message-ID: <25e2a50392beeb3e7c7428f53fac617a5a5b30f9.camel@mediatek.com>
Subject: Re: [PATCH v5 0/7] MediaTek Ethernet Patches on MT8195
From: Biao Huang <biao.huang@mediatek.com>
To: Jakub Kicinski <kuba@kernel.org>
CC: <davem@davemloft.net>, Rob Herring <robh+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>, Jose Abreu
 <joabreu@synopsys.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 <netdev@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>,
 <linux-stm32@st-md-mailman.stormreply.com>, <srv_heupstream@mediatek.com>,
 <macpaul.lin@mediatek.com>, <angelogioacchino.delregno@collabora.com>,
 <dkirjanov@suse.de>
Date: Wed, 8 Dec 2021 09:20:38 +0800
In-Reply-To: <20211207064627.5623f3bf@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
References: <20211207015505.16746-1-biao.huang@mediatek.com>
 <20211207064345.2c6427a1@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
 <20211207064627.5623f3bf@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211207_172051_337151_169C6C76 
X-CRM114-Status: GOOD (  18.95  )
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

Dear Jakub,
	Thanks for your comments~
On Tue, 2021-12-07 at 06:46 -0800, Jakub Kicinski wrote:
> On Tue, 7 Dec 2021 06:43:45 -0800 Jakub Kicinski wrote:
> > On Tue, 7 Dec 2021 09:54:58 +0800 Biao Huang wrote:
> > > Changes in v5:
> > > 1. remove useless inclusion in dwmac-mediatek.c as Angelo's
> > > comments.
> > > 2. add acked-by in "net-next: stmmac: dwmac-mediatek: add support
> > > for
> > >    mt8195" patch  
> > 
> > Which tree is this series based on? It doesn't seem to apply to
> > net-next. Also the net-next in the subjects is misplaced. If the
> > series
> > is supposed to be merged to net-next the subject should be like:
> > 
> > [PATCH net-next v5 1/7] stmmac: dwmac-mediatek: add platform level
> > clocks management
> > 
> > You can use --subject-prefix="PATCH net-next v6" in git-format-
> > patch to
> > add the prefix.
> 
> FWIW patch 6 is the one with the conflict: "arm64: dts: mt8195: add
> ethernet device node"
I'll rebase to the latest net-next tree, and fix these issues in next
send
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
