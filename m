Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68425C433EF
	for <linux-mediatek@archiver.kernel.org>; Thu, 30 Dec 2021 11:50:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=71zhrlKNHjSLHqZfgAXm85ae7LMBCQHMWfL74/DaRVE=; b=uE/9LicleyKSt+
	NS/54mE/dFe3PFgPNmVArVPVKS7HYA8IPmUio/oFCwtcbCoM1WRTwqnGz0sAwiFU9WUG8dNx8Cv04
	ZFV3InRawyD4i7htf+KRtV+JW6p4aqqvhmCAP+OAyJQkLg/LsMSswIx/JMtHG7X6BLwur3wYnXMbj
	/ZxLUj+keXgcxzmhzkhILfjEdM4ivRbUQ4rHviV9Uf9MFokiNcAG+1l2nI/rYNw3TZBT0tla5YEOl
	SDOPZV5oqGwGe/gsVH3aqo4KcJ1LUQXWvFtURbYFDfJBSDEkokSx5GC5ArtShH8wD09x6fctAxp1w
	2yG4tUlGPcF6MPET+gsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n2twS-004JxX-I1; Thu, 30 Dec 2021 11:49:56 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n2twE-004Jsu-F4; Thu, 30 Dec 2021 11:49:43 +0000
X-UUID: 9f3b1e05d1744511bde67e666ba3d420-20211230
X-UUID: 9f3b1e05d1744511bde67e666ba3d420-20211230
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <johnson.wang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1070014402; Thu, 30 Dec 2021 04:49:38 -0700
Received: from mtkexhb01.mediatek.inc (172.21.101.102) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 30 Dec 2021 03:49:37 -0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by mtkexhb01.mediatek.inc
 (172.21.101.102) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Thu, 30 Dec 2021 19:49:22 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Thu, 30 Dec 2021 19:49:22 +0800
From: Johnson Wang <johnson.wang@mediatek.com>
To: <robh+dt@kernel.org>, <matthias.bgg@gmail.com>
CC: <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>, 
 <Project_Global_Chrome_Upstream_Group@mediatek.com>, Johnson Wang
 <johnson.wang@mediatek.com>
Subject: [PATCH 0/2] Add PMIC wrapper support for Mediatek MT8186 SoC IC
Date: Thu, 30 Dec 2021 19:49:11 +0800
Message-ID: <20211230114913.9829-1-johnson.wang@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211230_034942_524647_E9B1C71F 
X-CRM114-Status: UNSURE (   8.05  )
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

This series add PMIC wrapper support for Mediatek MT8186 SoC IC

Johnson Wang (2):
  soc: mediatek: pwrap: add pwrap driver for MT8186 SoC
  dt-bindings: mediatek: add compatible for MT8186 pwrap

 .../bindings/soc/mediatek/pwrap.txt           |  1 +
 drivers/soc/mediatek/mtk-pmic-wrap.c          | 86 +++++++++++++++++--
 2 files changed, 81 insertions(+), 6 deletions(-)

-- 
2.18.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
