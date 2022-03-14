Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08AAEC433F5
	for <linux-mediatek@archiver.kernel.org>; Mon, 14 Mar 2022 11:12:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ky+cEE6ctYnZjdziJ6v3wlYp+Pmg2ZmynYKdQtiBh5I=; b=cUPFpZYKxU6tOB
	H6QSFXwneTssekP3qfjuuiz/5w6pevYIaG2r7kvF0IHPDOdchuibLL6K5ZdPGR7A8Y6+Agru+3E8w
	5QFF8pAoD4RquOTelxMDPmPFY5V9xH6EmCJZ+Yo8u/yN2+4kb9KBOIKmCHY/47axWp3c78GtFDJhc
	sz2wviN6js4DITxx/7YlkAHeleNruK6oK3c8Y9HdJz+eMMxWK02CnwJdALl/zOi5VcbKy8w1akUaK
	tUx6aCr1J94OUnU1ftuDwGNoy4sjFj59kNCZ0qiuKlaicP3cOJJ/gXXUjNdKputNJ4ial8IihO/LS
	3s5dhyIk9H2ZyJKvcLUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nTicl-0056Vs-WC; Mon, 14 Mar 2022 11:12:28 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nTicY-0056TS-C3; Mon, 14 Mar 2022 11:12:15 +0000
X-UUID: 476a88c9c024404694e83149ccd1193a-20220314
X-UUID: 476a88c9c024404694e83149ccd1193a-20220314
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw01.mediatek.com
 (envelope-from <tinghan.shen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 817448853; Mon, 14 Mar 2022 04:12:06 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 14 Mar 2022 04:12:04 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3; 
 Mon, 14 Mar 2022 19:12:03 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 14 Mar 2022 19:12:02 +0800
Message-ID: <588cb791c2fe3e1db8e0dd9ad66aa6d1bb95b348.camel@mediatek.com>
Subject: Re: [PATCH v2] remoteproc: mediatek: fix side effect of mt8195 sram
 power on
From: Tinghan Shen <tinghan.shen@mediatek.com>
To: Miles Chen <miles.chen@mediatek.com>, <lkp@intel.com>
CC: <Project_Global_Chrome_Upstream_Group@mediatek.com>,
 <angelogioacchino.delregno@collabora.com>, <bjorn.andersson@linaro.org>,
 <kbuild-all@lists.01.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
 <linux-remoteproc@vger.kernel.org>, <mathieu.poirier@linaro.org>,
 <matthias.bgg@gmail.com>
Date: Mon, 14 Mar 2022 19:12:03 +0800
In-Reply-To: <20220313000110.3869-1-miles.chen@mediatek.com>
References: <202203120056.qtDEVoye-lkp@intel.com>
 <20220313000110.3869-1-miles.chen@mediatek.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220314_041214_487206_E05B4E51 
X-CRM114-Status: GOOD (  16.11  )
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

Hi Miles,

On Sun, 2022-03-13 at 08:01 +0800, Miles Chen wrote:
> Hi Tinghan,
> 
> >      418 |                           MT8195_L1TCM_SRAM_PDN_RESERVED_BITS);
> >          |                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> >          |                           MT8195_L1TCM_SRAM_PDN_RESERVED_RSI_BITS
> >    drivers/remoteproc/mtk_scp.c:418:27: note: each undeclared identifier is reported only once
> > for each function it appears in
> >    drivers/remoteproc/mtk_scp.c: In function 'mt8195_scp_stop':
> >    drivers/remoteproc/mtk_scp.c:592:28: error: 'MT8195_L1TCM_SRAM_PDN_RESERVED_BITS' undeclared
> > (first use in this function); did you mean 'MT8195_L1TCM_SRAM_PDN_RESERVED_RSI_BITS'?
> >      592 |                            MT8195_L1TCM_SRAM_PDN_RESERVED_BITS);
> >          |                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> >          |                            MT8195_L1TCM_SRAM_PDN_RESERVED_RSI_BITS
> 
> I tested this patch and it can should be caught by the
> internal build test.
> 
> Could you do the test before submitting patches out?
> 
> 
> Thanks,
> Miles

I'm Sorry. I was too confident for this change.
I'll do the test at next time.
Thank you.


Best regards,
TingHan


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
