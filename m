Return-Path: <SRS0=l5E7=P7=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 71EBBC433EF
	for <linux-mediatek@archiver.kernel.org>; Fri, 12 Nov 2021 05:08:53 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3EFE460524
	for <linux-mediatek@archiver.kernel.org>; Fri, 12 Nov 2021 05:08:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 3EFE460524
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=tE4q0t6lJ7bVHM5WwTiYcywV3d9cfH0kYxCyeo+0dGg=; b=bH2Z2xOmSbo7uO
	AgKkMr5rS6g9PDy2V5ejZaz4tc9XiMribOEkbkVOSu/D/pZHtjH1x2rz95VsWtb/wiNjr89T1QXyW
	WBqKxHvkLD4/1Cuk2QnVFPTTMcqT6JrOYyXrhZVIX6mIOhC5mioX7yLA1nB1InTAmXN1cQOAGZj3t
	aQYBeEm+RKW7MPbyHnCh3UGNSvbmC2G6q72SLDcBNnxVnpDc8xdT3dH+RqrDuM6anmwf9Gt9kNJRV
	XFgjJfpfRaeRWrYjISF1l/d68Opi4YiHeGB6qbXzCS2tkjn4Lkxoo+DREe7UNwHH5cWLdHFyW2j+a
	MBHfY4cMKMjbniIDVGtA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mlOnv-009OWG-3O; Fri, 12 Nov 2021 05:08:47 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mlOnd-009OR9-Dn; Fri, 12 Nov 2021 05:08:30 +0000
X-UUID: 7a38ee24f7514314ae9da5a6ba920af5-20211111
X-UUID: 7a38ee24f7514314ae9da5a6ba920af5-20211111
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw01.mediatek.com
 (envelope-from <tinghan.shen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 362954356; Thu, 11 Nov 2021 22:08:28 -0700
Received: from mtkexhb02.mediatek.inc (172.21.101.103) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 11 Nov 2021 21:08:26 -0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by mtkexhb02.mediatek.inc
 (172.21.101.103) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Fri, 12 Nov 2021 13:08:12 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Fri, 12 Nov 2021 13:08:12 +0800
From: Tinghan Shen <tinghan.shen@mediatek.com>
To: <robh+dt@kernel.org>, <matthias.bgg@gmail.com>, <bgolaszewski@baylibre.com>
CC: <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>, 
 <Project_Global_Chrome_Upstream_Group@mediatek.com>, Tinghan Shen
 <tinghan.shen@mediatek.com>
Subject: [PATCH v5 0/2] Add basic SoC support for mediatek mt8195
Date: Fri, 12 Nov 2021 13:08:09 +0800
Message-ID: <20211112050811.21202-1-tinghan.shen@mediatek.com>
X-Mailer: git-send-email 2.15.GIT
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211111_210829_509445_8AFDC107 
X-CRM114-Status: GOOD (  10.49  )
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

This series adds basic SoC support for Mediatek's SoC MT8195.

clock nodes depends on [1][2].
phy nodes are reviewed at v2 thread.

[1]
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=01404648df2055ba79f85858528b723d678bd2a8
[2]
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=34d3ed3b9a0022409cf07c810e68b1ab625ab6fd

---
Changes in v5:
  - enable basic nodes in mt8195-evb.dts
  - remove dedicated clock nodes
  - add mmc2 node
  - fix interrupt number of pinctrl node
  - update clock nodes to apply internal fixes
  - add dt-bindings for perficfg node

v4 thread:
https://lore.kernel.org/all/20210922093303.23720-2-seiya.wang@mediatek.com/
v3 thread:
https://lore.kernel.org/all/20210601075350.31515-2-seiya.wang@mediatek.com/
v2 thread:
https://lore.kernel.org/all/20210319023427.16711-10-seiya.wang@mediatek.com/
v1 thread:
https://lore.kernel.org/all/20210316111443.3332-11-seiya.wang@mediatek.com/
---

Tinghan Shen (2):
  dt-bindings: arm: mediatek: add mt8195 pericfg compatible
  arm64: dts: Add mediatek SoC mt8195 and evaluation board

 .../arm/mediatek/mediatek,pericfg.yaml        |    1 +
 arch/arm64/boot/dts/mediatek/Makefile         |    1 +
 arch/arm64/boot/dts/mediatek/mt8195-evb.dts   |  210 ++++
 arch/arm64/boot/dts/mediatek/mt8195.dtsi      | 1044 +++++++++++++++++
 4 files changed, 1256 insertions(+)
 create mode 100644 arch/arm64/boot/dts/mediatek/mt8195-evb.dts
 create mode 100644 arch/arm64/boot/dts/mediatek/mt8195.dtsi

-- 
2.18.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
