Return-Path: <SRS0=IZYC=FJ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3EB4EC4361A
	for <linux-mediatek@archiver.kernel.org>; Sat,  5 Dec 2020 04:16:22 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A5E5D22E00
	for <linux-mediatek@archiver.kernel.org>; Sat,  5 Dec 2020 04:16:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A5E5D22E00
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=YYSMpkdaZkp1TRUggy+IBJeZEGmlDz70TzOhb0houEg=; b=J77Nn+cs/JDH2bepsogIFcwo4h
	taRj8mgNDXfki9tzlr6m7pNi/nALcFCgSM7GzPGE+YjvnlqrTp9hestOfkdIbMZnCnXboZa10KL9N
	Lrg58ia+NIZRiYLEAm100yaoVc9YyOYOgONOc/Mg8ZLXIl+YbQw3z7IU/WCaMDqvuXSyjCuJ35Lz0
	+z8EmJ2EhIAIZzXYM/5+d4rtUX7yATxBny+dpZ3wnZA+a8mbyGxQUvb7tG5E/YRazHv0496is8r7v
	BheOXC/n8ESFk5W2adGeAbk2iVi/zrEBa1zDqOOfQtmOrdkGQucW7tq44LVKo5oauAly3rcptICS1
	ptD1WuIA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1klOzR-0001kH-LX; Sat, 05 Dec 2020 04:16:09 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1klOzK-0001jO-6G; Sat, 05 Dec 2020 04:16:06 +0000
X-UUID: 026cd10f57444d26a1d770687d1cac73-20201204
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=v+sEnzGOyijNqic4LExgV1BOYUY8rrTZe/MNfRwv+Hk=; 
 b=I4cSGTJJDWhYDSfHoDJgoOIwopOauciPBcHKNJb7ETAoFTCqXWBU+LZf7WG2zf5Gj4nnSH+2cB8OQDoMJZtSHfpLYJHHyiELWQl/tbtK1kPzY65r2eH+Y94Lc6adpsZPDKFYFUJvNCpy3YJ/SxoVgm74PPUQJWGVyqyJKE0g/00=;
X-UUID: 026cd10f57444d26a1d770687d1cac73-20201204
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <yongqiang.niu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1511674860; Fri, 04 Dec 2020 20:15:56 -0800
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 4 Dec 2020 20:15:55 -0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sat, 5 Dec 2020 12:15:29 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Sat, 5 Dec 2020 12:15:32 +0800
From: Yongqiang Niu <yongqiang.niu@mediatek.com>
To: Rob Herring <robh+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, CK Hu <ck.hu@mediatek.com>
Subject: [PATCH v1, 0/5] support gce on mt8192 platform
Date: Sat, 5 Dec 2020 12:15:23 +0800
Message-ID: <1607141728-17307-1-git-send-email-yongqiang.niu@mediatek.com>
X-Mailer: git-send-email 1.8.1.1.dirty
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201204_231602_427950_7AE74EE1 
X-CRM114-Status: GOOD (  10.11  )
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
Cc: Bibby Hsieh <bibby.hsieh@mediatek.com>,
 Jassi Brar <jassisinghbrar@gmail.com>, linux-kernel@vger.kernel.org,
 Dennis YC Hsieh <dennis-yc.hsieh@mediatek.com>,
 linux-mediatek@lists.infradead.org, Yongqiang Niu <yongqiang.niu@mediatek.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

support gce on mt8192 platform

Yongqiang Niu (5):
  dt-binding: gce: add gce header file for mt8192
  arm64: dts: mt8192: add gce node
  mailbox: mediatek: add control_by_sw private data
  soc: mediatek: cmdq: add address shift in jump
  mailbox: cmdq: add mt8192 support

 .../devicetree/bindings/mailbox/mtk-gce.txt        |   7 +-
 arch/arm64/boot/dts/mediatek/mt8192.dtsi           |  11 +
 drivers/mailbox/mtk-cmdq-mailbox.c                 |  15 +-
 include/dt-bindings/gce/mt8192-gce.h               | 419 +++++++++++++++++++++
 4 files changed, 448 insertions(+), 4 deletions(-)
 create mode 100644 include/dt-bindings/gce/mt8192-gce.h

-- 
1.8.1.1.dirty
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
