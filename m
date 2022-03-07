Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27CB1C433F5
	for <linux-mediatek@archiver.kernel.org>; Mon,  7 Mar 2022 03:32:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BlTOMt5+YEp5qIhYtRFu1x6+sOKlV9ho3kYHgP45gKs=; b=PddLXtDTedGDNV
	kr+Arl5VD6dqb4Q8Z9x+x9SsxyrRj5Waz6l0ocKP9bj5xMU8S5y8BqRfQXLk8hq+W1GooiRmtoA0F
	1pT57jQmHacbMMmvRB33Ik5SecoVxhvGiaHUZChIkKG3sy1SPfxDHJ54f0h7j3USSZttNFub29eGu
	kH2dX/1klgX3Vp4lYpn0Pl/4XfZOjLHfkzv2rBTZEhIqnzIZXcgTeQqyoIrG7BhjY/CxtRPHydLXM
	SpaL5WHEcK3oA8zPGlUKa9VQwCComSdc5EKYt9IUZ/slRIJTcBxoO2AhEpD7ydfXyLFLUlZ3Ue933
	SSyp4/lZj/HtrmahvV7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nR46l-00FjBO-QZ; Mon, 07 Mar 2022 03:32:27 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nR46V-00Fj4V-Lq; Mon, 07 Mar 2022 03:32:12 +0000
X-UUID: 5558e26e610d47bfb05faedf27a838e8-20220306
X-UUID: 5558e26e610d47bfb05faedf27a838e8-20220306
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <yf.wang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 608191824; Sun, 06 Mar 2022 20:32:07 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sun, 6 Mar 2022 19:24:21 -0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3; 
 Mon, 7 Mar 2022 11:24:19 +0800
Received: from mbjsdccf07.mediatek.inc (10.15.20.246) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Mon, 7 Mar 2022 11:24:18 +0800
From: <yf.wang@mediatek.com>
To: <iommu@lists.linux-foundation.org>
CC: <Libo.Kang@mediatek.com>, <Ning.Li@mediatek.com>, <john.garry@huawei.com>, 
 <joro@8bytes.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
 <matthias.bgg@gmail.com>, <stable@vger.kernel.org>, <will@kernel.org>,
 <wsd_upstream@mediatek.com>, <yf.wang@mediatek.com>
Subject: RE: [PATCH] iommu/iova: Free all CPU rcache for retry when iova alloc
 failure
Date: Mon, 7 Mar 2022 11:18:18 +0800
Message-ID: <20220307031818.22875-1-yf.wang@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <33c2e244-95ef-406a-15eb-574cdf61b159@huawei.com>
References: <33c2e244-95ef-406a-15eb-574cdf61b159@huawei.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220306_193211_740445_11DC657B 
X-CRM114-Status: UNSURE (   9.20  )
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

On 2022-03-04 9:22, John Garry wrote:
> On 04/03/2022 04:46, yf.wang--- via iommu wrote:
> > ************* MEDIATEK Confidentiality Notice ********************
> > The 
> > information contained in this e-mail message (including any
> > attachments) may be confidential, proprietary, privileged, or 
> > otherwise exempt from disclosure under applicable laws. It is
> > intended 
> > to be
> 
> Can you please stop sending patches with this?

Hi John,

I will remote it later.

Thanks,
Yunfei.

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
