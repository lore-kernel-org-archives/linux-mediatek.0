Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CD6CC4332F
	for <linux-mediatek@archiver.kernel.org>; Thu,  3 Nov 2022 05:30:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=b2iRp1cfr6vDNR4Yr5TSDjZmeyWKPW/UQhMJ/2XgeSw=; b=gXzZ6wnnN5uuW+RJYfa+ocCLG7
	CtQwGDl9bBshQ3UtHoxaxawBMZaXyR4gsUdpHZpcrYK1mgDZZleDYiBoOyNqV2AC2gVHj2CBr0ITp
	8CfOBv1YsprONg4MwGEygJ9q3hCh3aRz4x7Qy0zCQeyzpnFdXz11jjPqoQRo0ZySmMXvPOrTK6ZTo
	vM9/Eb6TwXRsbK7V04wB50GF8kh6TZ4DeRtk18XYYu9ySF7KoHgboHLThFQ2Dui5NbnQdZKj9xb+E
	lXekZGnAUyFWlBiZzJsxvGqaXhgEHkANK6gHheN7/JCnnqkLcwXGNkzsJ0+5Mj2R5c3JywOjD6IZp
	/5JIjHSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oqSnp-00G91w-9k; Thu, 03 Nov 2022 05:30:09 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oqSnb-00G8wn-BT; Thu, 03 Nov 2022 05:29:56 +0000
X-UUID: 7da7e324796d45e49aecd02ff6f6052f-20221102
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=b2iRp1cfr6vDNR4Yr5TSDjZmeyWKPW/UQhMJ/2XgeSw=;
	b=NGm25fzEz/9bxFukwe2f6RWlNttTAtZn417r/u3G8sy/VUZdKjYCne3SJmi4+RRE6u86zGN/0pyb+4yq4j+CBYQzdBcpBFaJPOzS5IiI1pEmElmw68JykPK+jFnlTvFvOi0frYql3YYyy2gHOGEihfzopleiEIA2hRcvo403kko=;
X-CID-CACHE: Type:Local,Time:202211022229-07,HitQuantity:1
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.12,REQID:b378d460-c2a6-4277-a904-70a8e5fa9cd7,IP:0,U
	RL:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-25
X-CID-META: VersionHash:62cd327,CLOUDID:8ad17190-1a78-4832-bd08-74b1519dcfbf,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: 7da7e324796d45e49aecd02ff6f6052f-20221102
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <bayi.cheng@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 936407456; Wed, 02 Nov 2022 22:29:49 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Thu, 3 Nov 2022 13:29:12 +0800
Received: from localhost.localdomain (10.17.3.154) by mtkmbs11n2.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.15 via Frontend
 Transport; Thu, 3 Nov 2022 13:29:12 +0800
From: Bayi Cheng <bayi.cheng@mediatek.com>
To: Mark Brown <broonie@kernel.org>
CC: Matthias Brugger <matthias.bgg@gmail.com>, <linux-spi@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	Chuanhong Guo <gch981213@gmail.com>, <linux-kernel@vger.kernel.org>,
	<srv_heupstream@mediatek.com>, Project_Global_Chrome_Upstream_Group
	<Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: [PATCH v1] spi: spi-mtk-nor: Optimize timeout for dma read 
Date: Thu, 3 Nov 2022 13:28:42 +0800
Message-ID: <20221103052843.2025-1-bayi.cheng@mediatek.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221102_222955_418528_843B56BD 
X-CRM114-Status: UNSURE (   6.25  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

bayi cheng (1):
  spi: spi-mtk-nor: Optimize timeout for dma read

 drivers/spi/spi-mtk-nor.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

-- 
2.25.1



