Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E25E0C433F5
	for <linux-mediatek@archiver.kernel.org>; Wed, 19 Jan 2022 01:35:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ywcpU2J63LzVQ7DHlsY1F11g7PPT3kMJ5DCaOcCRTiE=; b=XXs2JMbdYxqf58
	3Gv0PjHEgKrStG25I0mr8muvJWX97ixwLP7/QyHkabOL0889VzXzrcQgtZYNx9uZiQJCG2GwQllne
	S0tyRQW5/RQbQrMSrw2c/v9IpAJGa7OBDF0YGNGf0o4THlHX6jVtKDAZk3/Xr/n8ctNlOFM4ZCslm
	pAOcd2zNcbi/59ZB8ukPZ4hA6XkPmaCYbdNWSNP67E8Yxzsq6AesyIdlUq68w2+MN+sxJGyOv7Bf3
	W3lyrEBfUHYZdqFP8S2P97nsZlj+B7roHXU5+WRsS/iNP8/gZLL6okHyY7E95bauD0G+xhoykPqTK
	FfUWE8A235rENxjJBorQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n9zsp-003RuS-Mq; Wed, 19 Jan 2022 01:35:31 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n9zsm-003Rtw-O1
 for linux-mediatek@lists.infradead.org; Wed, 19 Jan 2022 01:35:30 +0000
X-UUID: 5d86a253fc1b428b89de95cf43fc8bfa-20220118
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=m+hMeP0/FyV32JUIEqiBYVZP7bzB/NptEx5fT2S3Nek=; 
 b=P4JwYN2EU5p7vAXWmXqTsWrwdolZyb/WSfWco7ykoYVZLfgPJIV9Bla7Io5FFwg5WcwEY/1v2/QyxzvY0/tnI3baoaqY82Se/JR0uS7pM08/IiyUPOzBVTtshjBoqnaDrxs/kCM3J+o4/L9U+Go4BacXjhuY4WMpoMxqndtnEKc=;
X-UUID: 5d86a253fc1b428b89de95cf43fc8bfa-20220118
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw01.mediatek.com
 (envelope-from <guochun.mao@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 448193925; Tue, 18 Jan 2022 18:35:26 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 18 Jan 2022 17:35:24 -0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3; 
 Wed, 19 Jan 2022 09:35:23 +0800
Received: from mhfsdcap04 (10.17.3.154) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 19 Jan 2022 09:35:22 +0800
Message-ID: <f12ef62b05baf25ed595e0d705f9e5cf5dde9676.camel@mediatek.com>
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
Date: Wed, 19 Jan 2022 09:35:22 +0800
In-Reply-To: <YebpfgE+0KiaUn1X@sirena.org.uk>
References: <20220118141942.2624-2-guochun.mao@mediatek.com>
 <YebpfgE+0KiaUn1X@sirena.org.uk>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220118_173528_814151_1F58F810 
X-CRM114-Status: GOOD (  14.52  )
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
> 
> > Signed-off-by: Guochun Mao <guochun.mao@mediatek.com>
> > Signed-off-by: Zhen Zhang <zhen.zhang@mediatek.com>
> > Change-Id: I6f36e6fe1c752e57e85818758f742fb0e575bf7f
> 
> Please drop your internal Change-Ids from upstream submissions, they
> don't mean anything outside of your Gerritt.

Hi Mark,

Thanks for your review.

I am aware that, so I have sent another email 
"[PATCH v2 2/4] spi: spi-mtk-nor: improve device table for adding more
capabilities"

Sorry for the inconvenience.

BR,
Guochun
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
