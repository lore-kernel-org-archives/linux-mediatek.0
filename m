Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63D38C43334
	for <linux-mediatek@archiver.kernel.org>; Tue, 14 Jun 2022 17:25:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EwDrmIc5rU+tiqToGMcQrC2q9xpnjbOu565KmmjLoUY=; b=MYeh0uUawBJrhZ
	GtUe1/9KpbHmepCgXrvFKqeHCL1sEl5Hl+Yah3xyf72+sYrzsIHZ/2V5dJcTREjw0Xy3k3ONNhVLA
	v6JD19SYYne17LO+oEhvdu9GoPjP4xBpEwZleI9n/63lzpAyBTaW7v63A8uQE1GKlNyJJvLfT8dGM
	Y7XskcSkG2rxia19jY0f7JVYcBw8yELdq0XjKSLBPC40mp5/GmZ02VE5nk1xVEb/tb/lPmIccQF2y
	Uc1Oz640YKfArw45GcYG4sZ1Sn1cJlJoLNOvqFc5G3zk9CMK0mEq6g414B6PrrLfA/0lefc96lz15
	1G+Z/Jj1GRnVAAF+fAyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o1AHt-00AZ3o-2O; Tue, 14 Jun 2022 17:25:09 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o1AHh-00AZ0E-Ac; Tue, 14 Jun 2022 17:24:58 +0000
X-UUID: de71a67a2e834f23ac6886bd7b074583-20220614
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.6,REQID:498778e2-04da-4ba0-a5f1-c03b77c4ef6a,OB:0,LO
	B:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
	ON:release,TS:0
X-CID-META: VersionHash:b14ad71,CLOUDID:99159807-b57a-4a25-a071-bc7b4972bc68,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:-5,EDM:-3,IP:nil,URL:1,File:ni
	l,QS:nil,BEC:nil,COL:0
X-UUID: de71a67a2e834f23ac6886bd7b074583-20220614
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw01.mediatek.com
	(envelope-from <miles.chen@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
	with ESMTP id 793662853; Tue, 14 Jun 2022 10:24:46 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 14 Jun 2022 10:24:44 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.792.3;
 Wed, 15 Jun 2022 01:24:42 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.3 via Frontend Transport; Wed, 15 Jun 2022 01:24:42 +0800
From: Miles Chen <miles.chen@mediatek.com>
To: <yf.wang@mediatek.com>
CC: <Libo.Kang@mediatek.com>, <iommu@lists.linux-foundation.org>,
	<joro@8bytes.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
	<matthias.bgg@gmail.com>, <miles.chen@mediatek.com>, <ning.li@mediatek.com>,
	<will@kernel.org>, <wsd_upstream@mediatek.com>, <yong.wu@mediatek.com>
Subject: Re: [PATCH v8 2/3] iommu/mediatek: Rename MTK_IOMMU_TLB_ADDR to MTK_IOMMU_ADDR
Date: Wed, 15 Jun 2022 01:24:42 +0800
Message-ID: <20220614172442.15826-1-miles.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20220611102656.10954-3-yf.wang@mediatek.com>
References: <20220611102656.10954-3-yf.wang@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220614_102457_404776_86374598 
X-CRM114-Status: UNSURE (   5.71  )
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

> Rename MTK_IOMMU_TLB_ADDR to MTK_IOMMU_ADDR, and update MTK_IOMMU_ADDR
> definition for better generality.
> 
> Signed-off-by: Ning Li <ning.li@mediatek.com>
> Signed-off-by: Yunfei Wang <yf.wang@mediatek.com>

Reviewed-by: Miles Chen <miles.chen@mediatek.com> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
