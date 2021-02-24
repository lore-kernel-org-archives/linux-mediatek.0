Return-Path: <SRS0=l1Zb=H2=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1579EC433DB
	for <linux-mediatek@archiver.kernel.org>; Wed, 24 Feb 2021 06:22:48 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8DF3C64EC3
	for <linux-mediatek@archiver.kernel.org>; Wed, 24 Feb 2021 06:22:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8DF3C64EC3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=ZlNJZ+/hInyJXds/Q2qtv5c5BXCccMw447IQlm/KN/4=; b=0Kb45Pr7c21X/qduJFfUZgi0D
	0nQaBpvR0NMQJUaPOgaV7xgXRsp0+4La/zzJUP+zdKXEBd0ZJd7uucocLPpNssGL5NJRq6ttHd81t
	AucTDLsCb9HfLLVOh7Jy5BWpyNPcGVjgqyFpKhaM4Ifb+IbVhLpjHuY68iG7cNrPZaleSPY73cWao
	G+3ZNIPbrkHK/2MJR9GbVo/XpUrKLwQrAt/s62QjBW14M18Bquh6MHOfFYpklXfQwFdZtmOtOPFHm
	GfL/GbN2tlz2f5N1YfviI+wRp/gezapwHdLLCxPI3vvQ8U6drdmWmB82p3Jj6sBnJBDE/a+DLrkwz
	dqEBtlW5w==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1lEnZD-0002RS-BG; Wed, 24 Feb 2021 06:22:35 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1lEnZA-0002Pt-FG; Wed, 24 Feb 2021 06:22:33 +0000
X-UUID: 8b14cdbc1c3d4fe4aba62869ff9ee54d-20210223
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=3GEuAlBCPPrnoIE4XU6juRNKBr7hPpVwiUwL6Wc1vnQ=; 
 b=Sk/CPpaE4I5VDqSDbpzTg3+ELXyNDm6FDJWtdZlttPRbmHs7s3rNzSdlbLTZrhOS7eDODU02hD50326nZ2PWOQuhcusSjImKwTM8qnitqvSAtjnwcCd8nh0pGR9nzu32NzRqSoLWCKdpzFl83nuPD9GGX9GCrRxbkzx3PxI5JSs=;
X-UUID: 8b14cdbc1c3d4fe4aba62869ff9ee54d-20210223
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <jianjun.wang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 268867663; Tue, 23 Feb 2021 22:22:29 -0800
Received: from mtkmbs05n2.mediatek.inc (172.21.101.140) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 23 Feb 2021 22:12:28 -0800
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs05n2.mediatek.inc (172.21.101.140) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 24 Feb 2021 14:12:27 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 24 Feb 2021 14:12:26 +0800
From: Jianjun Wang <jianjun.wang@mediatek.com>
To: Bjorn Helgaas <bhelgaas@google.com>, Rob Herring <robh+dt@kernel.org>,
 <maz@kernel.org>, Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>, Ryder Lee
 <ryder.lee@mediatek.com>
Subject: [v8,2/7] PCI: Export pci_pio_to_address() for module use
Date: Wed, 24 Feb 2021 14:11:27 +0800
Message-ID: <20210224061132.26526-3-jianjun.wang@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20210224061132.26526-1-jianjun.wang@mediatek.com>
References: <20210224061132.26526-1-jianjun.wang@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210224_012232_798692_A4989CB3 
X-CRM114-Status: GOOD (  12.70  )
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

This interface will be used by PCI host drivers for PIO translation,
export it to support compiling those drivers as kernel modules.

Signed-off-by: Jianjun Wang <jianjun.wang@mediatek.com>
---
 drivers/pci/pci.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/pci/pci.c b/drivers/pci/pci.c
index b9fecc25d213..7ce72a82bec5 100644
--- a/drivers/pci/pci.c
+++ b/drivers/pci/pci.c
@@ -4047,6 +4047,7 @@ phys_addr_t pci_pio_to_address(unsigned long pio)
 
 	return address;
 }
+EXPORT_SYMBOL(pci_pio_to_address);
 
 unsigned long __weak pci_address_to_pio(phys_addr_t address)
 {
-- 
2.25.1
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
