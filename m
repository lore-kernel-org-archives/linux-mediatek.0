Return-Path: <SRS0=m4qr=PB=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CCB18C433EF
	for <linux-mediatek@archiver.kernel.org>; Wed, 13 Oct 2021 15:57:23 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 80EF9610E6
	for <linux-mediatek@archiver.kernel.org>; Wed, 13 Oct 2021 15:57:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 80EF9610E6
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=agnJMU1aPvkkPhyv+41Zbnxh4A/V6EJQEzY6Og0S+Do=; b=zoP2JRsJF48c/m
	9q3kIVcwx4wajsiGs2dfRgDqxHwE7qz/+iFrqnMffB8/tO510l/+5XtUcK5x2/kfAa2ooAvxGbocU
	usGt5SdaPCUWsufw4M+d0PAjO4U5/QOkw8ujY0H1MPfr1YBipQHsLPs0iNeP1I1F0uVBZEB+njQhB
	ByFVT8mjOsapfgd7iU/dnUksGJldF1tlCYNGE84PCQ+fYYMm9wszxEni3me9ONpAp/YaqMHFTvaAr
	xIIiCfWdg5cjl7su2M64PDOls6/VxMcWyKha0ron6Bs2DExmtqKjqJjhBCaq7l5YATWc6pNcDs+5u
	axQG1IHeDFdrtUiwvYKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1magcx-00HT1s-IX; Wed, 13 Oct 2021 15:57:11 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1magcu-00HT0q-6w
 for linux-mediatek@lists.infradead.org; Wed, 13 Oct 2021 15:57:11 +0000
X-UUID: 2e90026850324c0ab5074b5680449843-20211013
X-UUID: 2e90026850324c0ab5074b5680449843-20211013
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <ryder.lee@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1565007792; Wed, 13 Oct 2021 08:57:05 -0700
Received: from mtkexhb02.mediatek.inc (172.21.101.103) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 13 Oct 2021 08:57:03 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by mtkexhb02.mediatek.inc
 (172.21.101.103) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Wed, 13 Oct 2021 23:56:50 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Wed, 13 Oct 2021 23:56:50 +0800
From: Ryder Lee <ryder.lee@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>
CC: Lorenzo Bianconi <lorenzo.bianconi@redhat.com>, Shayne Chen
 <shayne.chen@mediatek.com>, Evelyn Tsai <evelyn.tsai@mediatek.com>,
 <linux-wireless@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
 "Ryder Lee" <ryder.lee@mediatek.com>
Subject: [PATCH v2] MAINTAINERS: mt76: update MTK folks
Date: Wed, 13 Oct 2021 23:56:41 +0800
Message-ID: <eb888ae0e43a980c2c1aaed372a9b5e8098ea4ef.1634107511.git.ryder.lee@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211013_085708_297505_E97F174A 
X-CRM114-Status: UNSURE (   9.74  )
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

Add more MTK folks to actively maintain the wireless chipsets across
segments. The work is becoming increasingly complicated and various
and we can provides hardware related perspectives to offload 
Felix's workload, especially for the 11ax and upcoming 11be devices

Signed-off-by: Ryder Lee <ryder.lee@mediatek.com>
---
@Kalle, I explain some more in the commit and hope you can rethink this change.
The name we list here will definitely take responsibility.
---
 MAINTAINERS | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index eeb4c70b3d5b..c2ebcf848205 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -11818,7 +11818,9 @@ F:	drivers/mmc/host/mtk-sd.c
 MEDIATEK MT76 WIRELESS LAN DRIVER
 M:	Felix Fietkau <nbd@nbd.name>
 M:	Lorenzo Bianconi <lorenzo.bianconi83@gmail.com>
-R:	Ryder Lee <ryder.lee@mediatek.com>
+M:	Ryder Lee <ryder.lee@mediatek.com>
+R:	Shayne Chen <shayne.chen@mediatek.com>
+R:	Sean Wang <sean.wang@mediatek.com>
 L:	linux-wireless@vger.kernel.org
 S:	Maintained
 F:	drivers/net/wireless/mediatek/mt76/
-- 
2.29.2


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
