Return-Path: <SRS0=Fikf=MV=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 014E3C4338F
	for <linux-mediatek@archiver.kernel.org>; Thu, 29 Jul 2021 08:50:47 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B91046103B
	for <linux-mediatek@archiver.kernel.org>; Thu, 29 Jul 2021 08:50:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org B91046103B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=DTEp2u4TyilqPMBWCJsu/7SH72zpUY0kVevnWNDkB0E=; b=L/dPbp6N+epNYO
	xX2pngXRAm9Jb9K9xHnhTnJ1xR6Iq1S5YN/QFYZsDqeRHe+aYPIB272t2wsJpZ/JYq3oB4z53lNWQ
	OfwCukcdm+TOzFuTF3pmTZegDuejI31LADFEUYo4UMqv4e0xOKeJ9ix9ipyEXBCfgAD5fzHOOWAjC
	4OYtKdTpi2ibsH9Bdwut6vmY/F5EdkwIvW6J/GnV31PncEHThDE6WGdYhzPIfGwP6orx4oVqOUz/k
	mVMJW1dKEwL6p4DFfURUm2eZU9T03MnK1hMaYTv5sGgjAtcWTky3i+IfGP0j53PJzIxwmoVDY4cp/
	cSHll9vratNzeyRwFCfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m91kR-003YN9-V6; Thu, 29 Jul 2021 08:50:35 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m91kP-003YLj-14; Thu, 29 Jul 2021 08:50:34 +0000
X-UUID: 137b8e4f3a8641978a96f11ccfac7133-20210729
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=xyl/5sLBXMurzOU5SHjBiLtTJoM0qNXZ07Bx/+sc65I=; 
 b=g32Ulqg3DFyrODyALTq+CE+X6T6UIZpaQTIu4i51I/tz+NN/Pv1/DOLgGU/9YfNOQB5F4bVl+KJueigUZUE2/PjQBjI9aGLxQekpoLe/xX9L5TIvG0XRmCWCI3PWnPc0uCCCmKscV2Uktzrv439o1E0U0IxQLek09y5WTL4/cJg=;
X-UUID: 137b8e4f3a8641978a96f11ccfac7133-20210729
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <zhiyong.tao@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1270803413; Thu, 29 Jul 2021 01:50:27 -0700
Received: from MTKMBS07N2.mediatek.inc (172.21.101.141) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 29 Jul 2021 01:47:14 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 29 Jul 2021 16:47:12 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 29 Jul 2021 16:47:11 +0800
From: Zhiyong Tao <zhiyong.tao@mediatek.com>
To: <timur@kernel.org>, <linux@armlinux.org.uk>, <alcooperx@gmail.com>,
 <tklauser@distanz.ch>, <sean.wang@kernel.org>
CC: <srv_heupstream@mediatek.com>, <zhiyong.tao@mediatek.com>,
 <hui.liu@mediatek.com>, <yuchen.huang@mediatek.com>,
 <huihui.wang@mediatek.com>, <eddie.huang@mediatek.com>,
 <sean.wang@mediatek.com>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, <linux-serial@vger.kernel.org>
Subject: [PATCH v2 0/1] Mediatek uart patch 
Date: Thu, 29 Jul 2021 16:46:39 +0800
Message-ID: <20210729084640.17613-1-zhiyong.tao@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210729_015033_164187_B73CCB29 
X-CRM114-Status: UNSURE (   8.01  )
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

This series includes 1 patches:
1.fix uart corruption issue when rx power off

Changes in patch v2:
1. move the detailed reason explain to patch[1/1].

Changes in patch v1:
1. remove processing mechanism which count value is 0.
2. change patch title and commit message.
3. explain the detailed reason for the patch in changelog.

Zhiyong Tao (1):
  serial: 8250_mtk: fix uart corruption issue when rx power off

 drivers/tty/serial/8250/8250_mtk.c | 5 +++++
 1 file changed, 5 insertions(+)

--
2.18.0

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
