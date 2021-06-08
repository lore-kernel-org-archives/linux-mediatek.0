Return-Path: <SRS0=WQwL=LC=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B5878C47082
	for <linux-mediatek@archiver.kernel.org>; Tue,  8 Jun 2021 03:18:31 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 86D6F61108
	for <linux-mediatek@archiver.kernel.org>; Tue,  8 Jun 2021 03:18:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 86D6F61108
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IN/4UslYzQoYVOjkFlvfOyzSVW3c1v4V6txjFwQvpCc=; b=Xv4YThEo5drrGN
	sUm771fAltGEpQ3t3sywMs+BO3u9YGoWjDypAUv2vSfMYKmttnVjdyTC3cjiPBBRal2dQKxM11+ZS
	2p51Mh99yoaDFRZyug7Fr+9Msrk2WA8kHYuDxbuHcQknOE9ydWhpMt5S5D24DO5ifScRlIaThLhrP
	mjH4VnltDR1DeJKFjovYrX1/VG0VdlT4A+OFymd17L4luwSo0K3gCdNr7Z2qWrTcA9x4/wFVyGFLZ
	aJYqB44uVzEnHRWtJqySX58H8Gz/vL7azGqBCqFrRvWFHG1llbkAVxjw/fRZOkhvr9Jj9verkCl0p
	rdqWukOnDIfWlg6qmiMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lqSFf-006EkO-JB; Tue, 08 Jun 2021 03:18:03 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lqSFP-006EgR-AR; Tue, 08 Jun 2021 03:17:51 +0000
X-UUID: 3aa7ea0f2e824767b125821cf5521d3e-20210607
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=Pt3AMawz5FG/qTN6qkhCigOvaWKnxaiX6OvqzCO97sg=; 
 b=N2eVO32J30BTCNOvDkFGGEzu+NDAt9Ql4ga12/TavnKnQQOf7pgqFwbe5pp9HA9/amwcIZ6z4UnIClT5CYbm2SZnzCX9l5IcEyylVJDYdbehrShwjMB9HsvTLmEKrtBcGeETlUHIoO9hXdZPSV5LxVYT9hDQIk01UQAe3pGEYhE=;
X-UUID: 3aa7ea0f2e824767b125821cf5521d3e-20210607
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <kewei.xu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1112376948; Mon, 07 Jun 2021 20:17:43 -0700
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 7 Jun 2021 20:17:41 -0700
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 8 Jun 2021 11:17:40 +0800
Received: from localhost.localdomain (10.17.3.153) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 8 Jun 2021 11:17:39 +0800
From: Kewei Xu <kewei.xu@mediatek.com>
To: <wsa@the-dreams.de>
CC: <matthias.bgg@gmail.com>, <robh+dt@kernel.org>,
 <linux-i2c@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <linux-mediatek@lists.infradead.org>, <srv_heupstream@mediatek.com>,
 <leilk.liu@mediatek.com>, <qii.wang@mediatek.com>,
 <qiangming.xia@mediatek.com>, <kewei.xu@mediatek.com>
Subject: [PATCH 1/3] dt-bindings: i2c: update bindings for MT8195 SoC
Date: Tue, 8 Jun 2021 11:16:38 +0800
Message-ID: <1623122200-1896-2-git-send-email-kewei.xu@mediatek.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1623122200-1896-1-git-send-email-kewei.xu@mediatek.com>
References: <1623122200-1896-1-git-send-email-kewei.xu@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210607_201747_398902_73B2A1D5 
X-CRM114-Status: GOOD (  10.01  )
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

From: "Kewei.Xu" <kewei.xu@mediatek.com>

Add a DT binding documentation for the MT8195 soc.

Signed-off-by: Kewei.Xu <kewei.xu@mediatek.com>
---
 Documentation/devicetree/bindings/i2c/i2c-mt65xx.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/i2c/i2c-mt65xx.txt b/Documentation/devicetree/bindings/i2c/i2c-mt65xx.txt
index 7f0194f..7c4915bc 100644
--- a/Documentation/devicetree/bindings/i2c/i2c-mt65xx.txt
+++ b/Documentation/devicetree/bindings/i2c/i2c-mt65xx.txt
@@ -15,6 +15,7 @@ Required properties:
       "mediatek,mt8173-i2c": for MediaTek MT8173
       "mediatek,mt8183-i2c": for MediaTek MT8183
       "mediatek,mt8192-i2c": for MediaTek MT8192
+      "mediatek,mt8195-i2c", "mediatek,mt8192-i2c": for MediaTek MT8195
       "mediatek,mt8516-i2c", "mediatek,mt2712-i2c": for MediaTek MT8516
   - reg: physical base address of the controller and dma base, length of memory
     mapped region.
-- 
1.9.1
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
