Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E545DC7EE29
	for <linux-mediatek@archiver.kernel.org>; Fri, 26 May 2023 02:42:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=h85S7n4ra7y6C6Ku/nwotPpHkHNjrVtbzbA/qOuBRO0=; b=BsHsVaO//tzy4ER2Q5UEUYe8+s
	hdnFr45fN6e/jgd5d5/0Mf4aV/gtQujM38OclzqWDAwXS2lbnd33q5soI9LacK/wWS+BCusooQiyb
	JwfLARsqRIMzAH0LB6ZSdO2Qtoc6BL/ZrLG+Omk5429f9EB29XnBObia6EfCERkdeb3AuOc5UdJrU
	rlVouCdOLbdNwI4jXqLffrZxlhQY6iXz4RZ5iy5XcffKpkwW2Y3oqWtz1IxplDPcZCTh3y68vDsli
	CRiE2BeRTMKmYkcQSCdJWVe0/UDhNYU2dwV+P5GM8B7iVEJVprfY7PpG50KLFqND1VWgx2mfQoZo4
	onDOiKXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q2NP2-000maY-0w;
	Fri, 26 May 2023 02:42:04 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q2NOz-000mZg-21;
	Fri, 26 May 2023 02:42:02 +0000
X-UUID: e172e77efb6e11ed83ed1395ce914268-20230525
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=h85S7n4ra7y6C6Ku/nwotPpHkHNjrVtbzbA/qOuBRO0=;
	b=c+9P3LcYRj61RuKVEOYVXyvfd8Rq71Kbz+WqnPm2go/+419inVbWXOGVuJ18kEi+yrnX5nWRxsUWuYcMLxs+bnQUpDVj2zLmysMNwd+ZaNsdkZxvQJIaDDeUJwf+xvBVHCxHL30aWlRP+ToZUXcKTyT77djtf/pDea3hOVK0YWo=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.25,REQID:e79cac68-151e-49ed-a1cb-ffddf55c1ddc,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-5
X-CID-META: VersionHash:d5b0ae3,CLOUDID:23cd983c-7aa7-41f3-a6bd-0433bee822f3,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:11|1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-UUID: e172e77efb6e11ed83ed1395ce914268-20230525
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <haibo.li@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 2038485249; Thu, 25 May 2023 19:41:56 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Fri, 26 May 2023 10:21:27 +0800
Received: from mszsdtlt102.gcn.mediatek.inc (10.16.4.142) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Fri, 26 May 2023 10:21:27 +0800
From: Haibo Li <haibo.li@mediatek.com>
To: <linux-kernel@vger.kernel.org>
CC: Andrew Morton <akpm@linux-foundation.org>, Matthias Brugger
	<matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, <linux-mm@kvack.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	<xiaoming.yu@mediatek.com>, Haibo Li <haibo.li@mediatek.com>
Subject: [PATCH] mm/gup_test:fix ioctl fail for compat task
Date: Fri, 26 May 2023 10:21:25 +0800
Message-ID: <20230526022125.175728-1-haibo.li@mediatek.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230525_194201_668315_ACDDD13C 
X-CRM114-Status: GOOD (  10.13  )
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

When tools/testing/selftests/mm/gup_test.c is compiled as 32bit,
then run on arm64 kernel,
it reports "ioctl: Inappropriate ioctl for device".

Fix it by filling compat_ioctl in gup_test_fops

Signed-off-by: Haibo Li <haibo.li@mediatek.com>
---
 mm/gup_test.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/mm/gup_test.c b/mm/gup_test.c
index 8ae7307a1bb6..c0421b786dcd 100644
--- a/mm/gup_test.c
+++ b/mm/gup_test.c
@@ -381,6 +381,7 @@ static int gup_test_release(struct inode *inode, struct file *file)
 static const struct file_operations gup_test_fops = {
 	.open = nonseekable_open,
 	.unlocked_ioctl = gup_test_ioctl,
+	.compat_ioctl = compat_ptr_ioctl,
 	.release = gup_test_release,
 };
 
-- 
2.25.1


