Return-Path: <SRS0=3kTb=B5=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E8696C433E1
	for <linux-mediatek@archiver.kernel.org>; Wed, 19 Aug 2020 03:51:51 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B6EBF2078B
	for <linux-mediatek@archiver.kernel.org>; Wed, 19 Aug 2020 03:51:51 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="cujh1cvs";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="EDUlgwlE"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B6EBF2078B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=w45Mpxu/f8M9XOEsCA4cTsRQf27abj1Wm6a1YffgYZw=; b=cujh1cvsNgaSISqGzucmLi1wks
	caBN4xdzCzrL/fp7HA3OScaxKsOP+8Xk2b17RXD+DDvcoCNwoZ4KqRFxdk+0ink9dvGoU2uS2YsVN
	/fGawRTrtsM1mhiDO/U6BcLKhN2NItI9ztEKOithEJEnOwKEjyLJ1O8J7L1HziCXW/cBLwbFxAiZA
	hp3Jj6VUuNOAahaas2XsEP0KuY17QAmi80hl40XxkRzk5xo6D4jkm0OweK+/hTbZcglQDQW5GmwNC
	2mw7yxmHW1WdW3TnqopC1qqvqcdwFMxgDAGoyRrB7WxfLPyGlQT6gxIFCJMYzPXkaGlUNCAy3mgYp
	6GJDtz2g==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k8F8X-0004w8-RR; Wed, 19 Aug 2020 03:51:41 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k8F8U-0004uj-3T; Wed, 19 Aug 2020 03:51:39 +0000
X-UUID: 169279414425473d9cdbe88cb199b795-20200818
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=BBwz+j7u0DHhfO3j7HHVfe4+gppkE3CUJRX7VRb2kew=; 
 b=EDUlgwlEVpbpAng48076fGnq7J9+mYGFgJGxdBSewbG9cbwawTusOLSCGaRhb12Oe2GenPy/BoFKXmW3xEZLgP/0By/qGAel9Lvq8Cuwpf29FJKmcvoBBdwZaHVd/T8IMIOcKd5o8X4XtEm+IyhhHnNsKw/AZMjbvFrk8JEbcbw=;
X-UUID: 169279414425473d9cdbe88cb199b795-20200818
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <mark-pk.tsai@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1053388583; Tue, 18 Aug 2020 19:51:33 -0800
Received: from MTKMBS06N2.mediatek.inc (172.21.101.130) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 18 Aug 2020 20:42:42 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs06n2.mediatek.inc (172.21.101.130) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 19 Aug 2020 11:42:41 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Wed, 19 Aug 2020 11:42:37 +0800
From: Mark-PK Tsai <mark-pk.tsai@mediatek.com>
To: <maz@kernel.org>
Subject: [PATCH 0/2] Add MStar interrupt controller support
Date: Wed, 19 Aug 2020 11:42:29 +0800
Message-ID: <20200819034231.20726-1-mark-pk.tsai@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-TM-SNTS-SMTP: 1570C025066250D22F5BBE36C595C40AD7EEDC98868CD0C0D4C72959324F3BCF2000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200818_235138_370914_69042E34 
X-CRM114-Status: GOOD (  10.86  )
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
Cc: devicetree@vger.kernel.org, alix.wu@mediatek.com, jason@lakedaemon.net,
 yj.chiang@mediatek.com, daniel@0x0f.com, linux-kernel@vger.kernel.org,
 robh+dt@kernel.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, matthias.bgg@gmail.com,
 tglx@linutronix.de, mark-pk.tsai@mediatek.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

MStar contain a legacy interrupt controller that routes interrupts
to the GIC. SigmaStar and Mediatek TV SoCs also have this interrupt
controller IP.

Mark-PK Tsai (2):
  irqchip: irq-mst: Add MStar interrupt controller support
  dt-bindings: interrupt-controller: Add MStar interrupt controller

 .../interrupt-controller/mstar,mst-intc.yaml  |  82 ++++++++
 drivers/irqchip/Kconfig                       |   7 +
 drivers/irqchip/Makefile                      |   1 +
 drivers/irqchip/irq-mst-intc.c                | 195 ++++++++++++++++++
 4 files changed, 285 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/interrupt-controller/mstar,mst-intc.yaml
 create mode 100644 drivers/irqchip/irq-mst-intc.c

-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
