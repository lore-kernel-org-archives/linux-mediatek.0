Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11D01C433F5
	for <linux-mediatek@archiver.kernel.org>; Wed, 19 Jan 2022 02:52:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=97qHFuAt7UMyXi41Y8D6rW5Sg6Th0bOxkP/L/gyC/Bo=; b=zUSlgNoAdWXpgM
	c73XRROT6Osw3trVsiNfgEfxFQP0tMZltYAuTq+1y1a6qgzYa45O1AqVfHzZGcobqcXffTh6Xj6Y1
	J3Tjlm688P4h+ee8+uxAlUxH/0zU3nxPCbtCg1yWn8NgUiKGwwsAxmakGlDiyPNUZmXkELmSjbSmZ
	yXxBSk/OWWz1chVIFpnPOzvyPYTMu8qOm9FqmB6PqHgv1KKRxtYOUSMExJecrD3dnmJifAAKFgCtK
	0HCQ4zRdxBkURxGke71XrpueUmJLZ7T2MdnRJCj+Nq3wPqzUtjVJJ6K2dgsP4JflbXqfsjtvy0b8e
	1G1vAU/X/0YCCc6zMgUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nA15H-003c0e-Ka; Wed, 19 Jan 2022 02:52:27 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nA15D-003c0E-E1
 for linux-mediatek@lists.infradead.org; Wed, 19 Jan 2022 02:52:24 +0000
X-UUID: fd4c520f109d4bf297bcd9f5346f4b7d-20220118
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=8f1PE4/V+vCW+Y4M/K9eO7JHqwmCJouOIJqf4mlS/MU=; 
 b=XtNKYZzf1ntOIhOL/KWTEG4kh2QevnZhm84+EY58Xfx8xeennDFtjwi4X9n8w/HsJHX3aSty1wO/Z/HT84FQHgTaHMjMPoKlR+4R4rQYmxSuestmWf2ybCbxy+W8FedOjq0HXzfwMs4rR/0B7PMag+K7RZ3f67Oi3sZMp6m3Lo0=;
X-UUID: fd4c520f109d4bf297bcd9f5346f4b7d-20220118
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <guochun.mao@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1261343565; Tue, 18 Jan 2022 19:52:22 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 18 Jan 2022 18:43:13 -0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Wed, 19 Jan 2022 10:43:12 +0800
Received: from mhfsdcap04 (10.17.3.154) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 19 Jan 2022 10:43:11 +0800
Message-ID: <f360b4f07436ac6c9556f2db7909eba88a2b004c.camel@mediatek.com>
Subject: Re: [PATCH 2/4] spi: spi-mtk-nor: improve device table for adding
 more capabilities
From: Guochun Mao <guochun.mao@mediatek.com>
To: Mark Brown <broonie@kernel.org>
CC: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, "Rob
 Herring" <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
 Zhen Zhang <zhen.zhang@mediatek.com>, Bayi Cheng <bayi.cheng@mediatek.com>,
 Chuanhong Guo <gch981213@gmail.com>, Bin Zhang <bin.zhang@mediatek.com>,
 <linux-mediatek@lists.infradead.org>, <srv_heupstream@mediatek.com>,
 <project_global_chrome_upstream_group@mediatek.com>
Date: Wed, 19 Jan 2022 10:43:11 +0800
In-Reply-To: <YebpfgE+0KiaUn1X@sirena.org.uk>
References: <20220118141942.2624-2-guochun.mao@mediatek.com>
 <YebpfgE+0KiaUn1X@sirena.org.uk>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220118_185223_505772_A929D470 
X-CRM114-Status: GOOD (  14.40  )
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

On Tue, 2022-01-18 at 16:23 +0000, Mark Brown wrote:
> On Tue, Jan 18, 2022 at 10:19:40PM +0800, guochun.mao@mediatek.com
> wrote:
> > From: Guochun Mao <guochun.mao@mediatek.com>
> > 
> > Define a structure for adding more capabilities.
> > Add a item extra_dummy_bit for new SoCs, due to design changed.
> 
> This is patch 2/4 but I don't have any context for the rest of the
> series - what's the story?

Sorry, I don't know why you can't recieve the reset of the esries.
I'll sent these mails to you again.

thanks.

Guochun

> 
> > Signed-off-by: Guochun Mao <guochun.mao@mediatek.com>
> > Signed-off-by: Zhen Zhang <zhen.zhang@mediatek.com>
> > Change-Id: I6f36e6fe1c752e57e85818758f742fb0e575bf7f
> 
> Please drop your internal Change-Ids from upstream submissions, they
> don't mean anything outside of your Gerritt.
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
