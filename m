Return-Path: <SRS0=H0vx=GQ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 640A7C433DB
	for <linux-mediatek@archiver.kernel.org>; Wed, 13 Jan 2021 11:51:25 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F3377233ED
	for <linux-mediatek@archiver.kernel.org>; Wed, 13 Jan 2021 11:51:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F3377233ED
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=l364KI26nrWDHd/gg1kMQId6cyw5eqKMfuxJz9d1UGo=; b=W7l5M90tjhXGNLqQOT7ejVBJ+
	eg72U09qws2oyOCFX33Mvg/5bvueVXoOb+jadXPvIuJR733NEi+cyFV+uMBvAsftKSgqpBMGWvuM4
	w6krIvaVql8HK3e0XzfbGndRyH6ouHJWHW9Erp28dp+CRGJ0F/BiMuaw+L10WBBhEA5+GwNzlX6cG
	QaOoCujnBAsXs1Q4h8qTpMky8Z31gazPt5wW+LhTUU4qziv3TPSPeUpIXF9GFWcSVryZZFz0Lcwzl
	YRhk/2G9PSBUg6RzLu4QVeg06cqK8mKmVmByyA9WFqQ+soeUZh2/0GIrtqIZBf7GFRIv9bTDpdxOe
	foCRS9JnQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kzeg5-0005IY-K3; Wed, 13 Jan 2021 11:51:05 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kzeg0-0005GJ-8V; Wed, 13 Jan 2021 11:51:02 +0000
X-UUID: 9b75f9ab2d2c4079a4c9ac2ef4a36c75-20210113
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=IBp/A1CpHpsjQQ3Z0JOI8uq07ysx/Arc0JDYbEe2TPU=; 
 b=frWGo94vOklTouFSJGxC72GHAUAX5vyiDtpbZrQ6hPHxTJlxtwCn30FB3LlsRXTmTaR40k1rSF6u2SzNN3qj3n8tvXJ24CDfHaJ20HauoNmBW7SYuDFEKVqxXYg28JSdmBXBr5osizQqObO3axx1jT/+GA4ITcTXZTbIvtqOEWQ=;
X-UUID: 9b75f9ab2d2c4079a4c9ac2ef4a36c75-20210113
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <jianjun.wang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1500360988; Wed, 13 Jan 2021 03:50:56 -0800
Received: from mtkmbs05n1.mediatek.inc (172.21.101.15) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 13 Jan 2021 03:41:02 -0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs05n1.mediatek.inc (172.21.101.15) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 13 Jan 2021 19:41:01 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 13 Jan 2021 19:40:59 +0800
From: Jianjun Wang <jianjun.wang@mediatek.com>
To: Bjorn Helgaas <bhelgaas@google.com>, Rob Herring <robh+dt@kernel.org>,
 <maz@kernel.org>, Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>, Ryder Lee
 <ryder.lee@mediatek.com>
Subject: [v7,7/7] MAINTAINERS: Add Jianjun Wang as MediaTek PCI co-maintainer
Date: Wed, 13 Jan 2021 19:40:01 +0800
Message-ID: <20210113114001.5804-8-jianjun.wang@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20210113114001.5804-1-jianjun.wang@mediatek.com>
References: <20210113114001.5804-1-jianjun.wang@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210113_065100_512395_68E91536 
X-CRM114-Status: GOOD (  11.69  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: youlin.pei@mediatek.com, devicetree@vger.kernel.org, drinkcat@chromium.org,
 Rex-BC.Chen@mediatek.com, qizhong.cheng@mediatek.com,
 chuanjia.liu@mediatek.com, linux-pci@vger.kernel.org,
 linux-kernel@vger.kernel.org, anson.chuang@mediatek.com,
 Jianjun Wang <jianjun.wang@mediatek.com>, sin_jieyang@mediatek.com, Sj
 Huang <sj.huang@mediatek.com>, linux-mediatek@lists.infradead.org,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Update entry for MediaTek PCIe controller, add Jianjun Wang
as MediaTek PCI co-maintainer.

Signed-off-by: Jianjun Wang <jianjun.wang@mediatek.com>
Acked-by: Ryder Lee <ryder.lee@mediatek.com>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index e73636b75f29..1a033812c7f9 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -13622,6 +13622,7 @@ F:	drivers/pci/controller/dwc/pcie-histb.c
 
 PCIE DRIVER FOR MEDIATEK
 M:	Ryder Lee <ryder.lee@mediatek.com>
+M:	Jianjun Wang <jianjun.wang@mediatek.com>
 L:	linux-pci@vger.kernel.org
 L:	linux-mediatek@lists.infradead.org
 S:	Supported
-- 
2.25.1
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
