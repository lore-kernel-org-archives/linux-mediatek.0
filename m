Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6120C433EF
	for <linux-mediatek@archiver.kernel.org>; Mon,  7 Mar 2022 03:55:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wjYSEHcfTXHZCxg2WhtPgiPgIjmCrCQbhhZfgvXIZo0=; b=pYr6s+nq6nR2B1
	SFs2PtXmwUskxMTGyVu5jDWVedj/m2CIXa1lHSESg+JnuOiDokThQY7SyorAxlxYpdg2gpS7PEm1H
	NCa0mcx4m3+JZOUuxjK6Gz/J4m5y5DqqgNlgaGQqGmbcjEktN4DbFEFvWPfZDt6Nz54aHg6DMZW2z
	m2X+bCvzd2Az7THSoPBcHaJ7b8ICDdA9zBsSBwEWdq+LE0lvBXdtK+LwbbG5ytBro9UrKjUR38DCm
	Yw9ixb253QdQ8OY2xaiSfqEgli1D6RPLyQapq/SIxsnArFneaBV10GGMPcvIaTFZcXKHxQO4Eupw8
	5oWXW2kac35S+Kb2qG9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nR4TN-00FpqP-FO; Mon, 07 Mar 2022 03:55:49 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nR4TA-00Fpmp-NC; Mon, 07 Mar 2022 03:55:37 +0000
X-UUID: 26900a1557d34641bb639377ecf04bee-20220306
X-UUID: 26900a1557d34641bb639377ecf04bee-20220306
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw01.mediatek.com
 (envelope-from <yf.wang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1552192692; Sun, 06 Mar 2022 20:55:32 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sun, 6 Mar 2022 19:55:30 -0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Mon, 7 Mar 2022 11:55:29 +0800
Received: from mbjsdccf07.mediatek.inc (10.15.20.246) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Mon, 7 Mar 2022 11:55:28 +0800
From: <yf.wang@mediatek.com>
To: <robin.murphy@arm.com>
CC: <Libo.Kang@mediatek.com>, <Ning.Li@mediatek.com>,
 <iommu@lists.linux-foundation.org>, <joro@8bytes.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <linux-mediatek@lists.infradead.org>, <matthias.bgg@gmail.com>,
 <stable@vger.kernel.org>, <will@kernel.org>, <wsd_upstream@mediatek.com>,
 <yf.wang@mediatek.com>
Subject: RE: [PATCH] iommu/iova: Free all CPU rcache for retry when iova alloc
 failure
Date: Mon, 7 Mar 2022 11:49:27 +0800
Message-ID: <20220307034927.23159-1-yf.wang@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <906a446e-3e25-5813-d380-de699a84b6f4@arm.com>
References: <906a446e-3e25-5813-d380-de699a84b6f4@arm.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220306_195536_782498_E6E25EAF 
X-CRM114-Status: UNSURE (   9.60  )
X-CRM114-Notice: Please train this message.
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

On Fri, 2022-03-04 at 14:03 +0000, Robin Murphy wrote:
> 
> OK, so either there's a mystery bug where IOVAs somehow get freed on 
> offline CPUs, or the hotplug notifier isn't working correctly, or
> you've 
> contrived a situation where alloc_iova_fast() is actually racing
> against 
> iova_cpuhp_dead(). In the latter case, the solution is "don't do
> that".
> 
> This change should not be necessary.
> 
> Thanks,
> Robin.

Hi Robin,

You are right, kernel 5.15 already has this patch, but kernel 5.10
not contain.

Thanks,
Yunfei.

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
