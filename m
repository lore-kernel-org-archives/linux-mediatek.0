Return-Path: <SRS0=wYRt=DE=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D4B78C4727E
	for <linux-mediatek@archiver.kernel.org>; Sun, 27 Sep 2020 07:49:09 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 410E323977
	for <linux-mediatek@archiver.kernel.org>; Sun, 27 Sep 2020 07:49:09 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="3J/ETDQr";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="R0Bt08Jz"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 410E323977
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=OcosYmUaWdL1E0tk31ze1iwUQpb62YOOmd1Km0oxFic=; b=3J/ETDQreI9sMPqyi+amnxn92
	2NTWfwlZGxiRmGv/mwBjq2n55vtT3biJimDbxMNZ8ndqKvrGLuovuZboO8DOAUuBvYk8zix+wU9A5
	0b6brwave4RUdThX+I3QgmGSohAOBh2ziGl0qigQW8JlHfuXcFhCapTD/mraKRslCMS5WlhdCk/Kq
	hDZnXpVtW+Kf8JhAwSu9tdXyk8nuj1SVrGiAUzpD2DgxpltYxYsXQzHHZp4MXNP4W5YPBGgiJIZXx
	+kXJWOyZCdyCf3FiKTgx6TRs2DYIc4LKwnhOoYXv95RwjnJJUgriDOIk2JfnX7I1wAXHuKFwag+VR
	PRS9Nb/nw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kMRQZ-00045P-84; Sun, 27 Sep 2020 07:48:59 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kMRQR-000422-4e; Sun, 27 Sep 2020 07:48:52 +0000
X-UUID: 91f2507d98c24516b8d2a6261974f1a8-20200926
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=CyTAOKrr53K3SDY9K0q/wmMsGmkcwUYZ/U05kXCMXwE=; 
 b=R0Bt08JznJSmwWIM1dNJBJJUtH4AdYHuu0klo8Zqs6mx2mBR6N0RY3KbNy2TtTLMIjs4q/hPby1w54TYDI9zuGmcmWwa0RZ2xj8ExmSURSjkFsGuK/U2da3QSCrsWjdPV2n1ql1VkQxfCy/r0pileotUtH2JCujA5jKs97YD+PY=;
X-UUID: 91f2507d98c24516b8d2a6261974f1a8-20200926
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <jianjun.wang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 769321380; Sat, 26 Sep 2020 23:48:44 -0800
Received: from mtkmbs08n1.mediatek.inc (172.21.101.55) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sun, 27 Sep 2020 00:48:42 -0700
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs08n1.mediatek.inc (172.21.101.55) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sun, 27 Sep 2020 15:48:29 +0800
Received: from localhost.localdomain (10.17.3.153) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Sun, 27 Sep 2020 15:48:28 +0800
From: Jianjun Wang <jianjun.wang@mediatek.com>
To: Bjorn Helgaas <bhelgaas@google.com>, Rob Herring <robh+dt@kernel.org>,
 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>, Ryder Lee
 <ryder.lee@mediatek.com>
Subject: [v3,3/3] MAINTAINERS: update entry for MediaTek PCIe controller
Date: Sun, 27 Sep 2020 15:45:55 +0800
Message-ID: <20200927074555.4155-4-jianjun.wang@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20200927074555.4155-1-jianjun.wang@mediatek.com>
References: <20200927074555.4155-1-jianjun.wang@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200927_034851_375475_8261F4CC 
X-CRM114-Status: GOOD (  11.99  )
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
Cc: youlin.pei@mediatek.com, devicetree@vger.kernel.org,
 qizhong.cheng@mediatek.com, chuanjia.liu@mediatek.com,
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, linux-pci@vger.kernel.org,
 linux-kernel@vger.kernel.org, Jianjun Wang <jianjun.wang@mediatek.com>,
 sin_jieyang@mediatek.com, Sj
 Huang <sj.huang@mediatek.com>, linux-mediatek@lists.infradead.org,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Matthias Brugger <matthias.bgg@gmail.com>, davem@davemloft.net,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Add maintainer for MediaTek PCIe controller driver.

Signed-off-by: Jianjun Wang <jianjun.wang@mediatek.com>
Acked-by: Ryder Lee <ryder.lee@mediatek.com>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index deaafb617361..5c6110468526 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -13459,6 +13459,7 @@ F:	drivers/pci/controller/dwc/pcie-histb.c
 
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
