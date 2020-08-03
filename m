Return-Path: <SRS0=TVmU=BN=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A092CC433DF
	for <linux-mediatek@archiver.kernel.org>; Mon,  3 Aug 2020 06:35:26 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6ED4B20678
	for <linux-mediatek@archiver.kernel.org>; Mon,  3 Aug 2020 06:35:26 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="aNJ3XuTA";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="JLNEaiLZ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6ED4B20678
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=gaaYh8tIJzGMcQghej/peuoTMi5shssvJFwroqF9SbI=; b=aNJ3XuTAu/FtkFtZILLa8Ah9uB
	o0giMrJgK2nQ/tHLijpAFK+hLefuQ6NmtM40wYYqd/aSDWbClncUZGlSw4Dx0U7Vz75rAJiFohlMq
	4KuoQL0ravlncMQYhfO98Xidrsmn+BaNsxX0Xh/qjLJOPatMZvVGjQqC5uxK0/7bmrFDDiizwBjFe
	DE/rDuAYCAL4hWtSVbSZCZz8QOQyCEGg1bNeJVfEWFOeINl8dL3BYpPoKon3PzZKlaXq4ijNoxdj+
	Yxd3mgJnKTdc8kXk47u+ULEu3VNf4aTksIk4yLdQtj5aPz7vSlJGLBAo2HKY/S0FFVDT9ftgXld4n
	N7L5mMSw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k2U47-0001Uj-GP; Mon, 03 Aug 2020 06:35:19 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k2U43-0001TH-AU; Mon, 03 Aug 2020 06:35:16 +0000
X-UUID: 7d9647c28e6e42f39f3535d0e4546c1a-20200802
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=WDU+4JwjqH8BnoC2rwYT+kPVuQ4gCSRqYJmpgGcCCGg=; 
 b=JLNEaiLZJHn3kwVxh44C5ay5GhoN09maiVYRZFGY5SF6jj+ejiYhcfta6FtpQtwBsdys8Xfrcy9lcvhPS7NUMfpdpoi6vmbVLL87TwQhSTDz0MpVupaIFsQFwlA2SIR9MRN0bA4SrBQrLxtDlp9rCe8+O9vt4YcxIixkOhOV7qc=;
X-UUID: 7d9647c28e6e42f39f3535d0e4546c1a-20200802
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <mark-pk.tsai@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 2042748244; Sun, 02 Aug 2020 22:24:40 -0800
Received: from MTKMBS06N1.mediatek.inc (172.21.101.129) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sun, 2 Aug 2020 23:22:53 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs06n1.mediatek.inc (172.21.101.129) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 3 Aug 2020 14:22:52 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Mon, 3 Aug 2020 14:22:52 +0800
From: Mark-PK Tsai <mark-pk.tsai@mediatek.com>
To: <mark-pk.tsai@mediatek.com>
Subject: [PATCH 0/2] irqchip: irq-mt58xx: Add mt58xx series interrupt
Date: Mon, 3 Aug 2020 14:22:12 +0800
Message-ID: <20200803062214.24076-1-mark-pk.tsai@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200803_023515_506632_747516BF 
X-CRM114-Status: UNSURE (   9.63  )
X-CRM114-Notice: Please train this message.
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
 maz@kernel.org, yj.chiang@mediatek.com, linux-kernel@vger.kernel.org,
 robh+dt@kernel.org, linux-mediatek@lists.infradead.org, matthias.bgg@gmail.com,
 tglx@linutronix.de, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Mediatek DTV SoCs contain multiple legacy interrupt controllers that routes
interrupts to the GIC. And all the mt58xx series SoCs have this controller,
hence the name of the driver and binding.

Mark-PK Tsai (2):
  irqchip: irq-mt58xx: Add mt58xx interrupt controller support
  dt-bindings: interrupt-controller: Add MT58XX interrupt controller

 .../mediatek,mt58xx-intc.yaml                 |  70 +++++++
 drivers/irqchip/Kconfig                       |   7 +
 drivers/irqchip/Makefile                      |   1 +
 drivers/irqchip/irq-mt58xx.c                  | 196 ++++++++++++++++++
 4 files changed, 274 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/interrupt-controller/mediatek,mt58xx-intc.yaml
 create mode 100644 drivers/irqchip/irq-mt58xx.c

-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
