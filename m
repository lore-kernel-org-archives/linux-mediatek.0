Return-Path: <SRS0=6rwz=CL=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2DD12C433E2
	for <linux-mediatek@archiver.kernel.org>; Wed,  2 Sep 2020 06:44:20 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id ED1CE20826
	for <linux-mediatek@archiver.kernel.org>; Wed,  2 Sep 2020 06:44:19 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="m0soeHR8";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="MXugq3VM"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org ED1CE20826
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=N4ATKQd4tA3tmHwgwTEGe/jDD7Bz2hotAK3v3vp7lAg=; b=m0soeHR8ouEFcQC6ivdsfcjSRt
	23QzQXMVzmZYdM0oLHOrTk3oAK6KHpqwiGjS4Uf64YKwGsKMp/yV/Aecq+Pk/ahGxYvKhUfTZM4Or
	YIPSgxDuwKuiE9j7diGAbJMq2uKPtQYUNAUAoDQBUGIqA5BxNuewqgXmtgDYAt7jHcYzrrXn9r9xy
	BPpi7leii+pbvn03d8Txqrsk1ztGJhT4CM/gQ6UqUmQCScWAAHrzLNPBy2ogWXlvcK2uVYS8/mAXn
	YK0qdAgJhTTiW57gKFlH215LTQ/l93j1ANGw9h1sQgNWW2kDBr0HoAJ67h5toE7GP6HgVjzbJyOar
	xn9FcQtQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kDMV9-0002t7-L7; Wed, 02 Sep 2020 06:44:11 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kDMV5-0002sU-Tb; Wed, 02 Sep 2020 06:44:09 +0000
X-UUID: 154642a99f3c46ca8ca9abaa007ee3b0-20200901
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=53c4sfWtEQp/XsUMnsdRSVYymnKtnC0kh8GaID/rOdQ=; 
 b=MXugq3VMRYL5rjYhb/JoyiA/KO5ioxaPkVh4L1I5VXGd4hcm1pi8ljz/j4YyUaeHIYjlJQylj+oXAsqThnPiWYiCANpvpEL46LZ3kYsR/DimlTzDWqzjugSS9OR7EnMLkFVw23UQTYEZ5Fe5GlGO3HSqSdP+DIpmwIhni0RmfRo=;
X-UUID: 154642a99f3c46ca8ca9abaa007ee3b0-20200901
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <mark-pk.tsai@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 863051134; Tue, 01 Sep 2020 22:44:04 -0800
Received: from MTKMBS06N2.mediatek.inc (172.21.101.130) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 1 Sep 2020 23:34:01 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs06n2.mediatek.inc (172.21.101.130) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 2 Sep 2020 14:34:00 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Wed, 2 Sep 2020 14:33:59 +0800
From: Mark-PK Tsai <mark-pk.tsai@mediatek.com>
To: <maz@kernel.org>, <robh+dt@kernel.org>
Subject: [PATCH v3 0/2] Add MStar interrupt controller support
Date: Wed, 2 Sep 2020 14:33:42 +0800
Message-ID: <20200902063344.1852-1-mark-pk.tsai@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-TM-SNTS-SMTP: 2774D7340570A9ED91DE96DFC9244A13846B9F0DE513AC10544567D01A222CA22000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200902_024408_098996_98401CAC 
X-CRM114-Status: GOOD (  10.64  )
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
 linux-mediatek@lists.infradead.org, mark-pk.tsai@mediatek.com,
 matthias.bgg@gmail.com, tglx@linutronix.de,
 linux-arm-kernel@lists.infradead.org
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

 .../interrupt-controller/mstar,mst-intc.yaml  |  64 ++++++
 MAINTAINERS                                   |   7 +
 drivers/irqchip/Kconfig                       |   8 +
 drivers/irqchip/Makefile                      |   1 +
 drivers/irqchip/irq-mst-intc.c                | 199 ++++++++++++++++++
 5 files changed, 279 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/interrupt-controller/mstar,mst-intc.yaml
 create mode 100644 drivers/irqchip/irq-mst-intc.c

-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
