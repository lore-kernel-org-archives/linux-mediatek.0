Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94C60C433EF
	for <linux-mediatek@archiver.kernel.org>; Fri,  1 Apr 2022 08:02:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=pmtdvCiYSevhygWW5OUSly6krmtoXM0QIvpGgRoHUrc=; b=x1mrBK9W4qs8/H
	HJR03vCDsThQVTFqsQ5rqFdiED37LEMlNtGNnqdsWA6CIls/spnHyPYiJCwRg6JHQJw4T87bkwcEP
	sbMWchFttKRWVegvjppjgrQ3RbLeXOjizl4b4pwQANaBxho6Kk7DSdNjGcf8SrEkGrwKuf0GDvF2Y
	SmHvFzPhCyFLSOVvBDOXYbZ6Uv9woFwo1j8fGxn542qZNgyglXAcfKIN0YEb+hjmS6sdZdwOUTpiE
	pYalR0frayHl2CTlreQ6JbOb+M9JpYG8XR6dihYPY130W9HJWgxbh8JzhiA3ooizQLLRI+L6wf2WK
	XeGkqRk+J0hODYQrQp8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1naCF7-004rrZ-Es; Fri, 01 Apr 2022 08:02:49 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1naCEu-004rla-St; Fri, 01 Apr 2022 08:02:38 +0000
X-UUID: 3220f23f814e445a9831cd681fb07fb0-20220401
X-UUID: 3220f23f814e445a9831cd681fb07fb0-20220401
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <johnson.wang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1696954960; Fri, 01 Apr 2022 01:02:29 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 1 Apr 2022 01:02:28 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3; 
 Fri, 1 Apr 2022 16:02:26 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Fri, 1 Apr 2022 16:02:26 +0800
From: Johnson Wang <johnson.wang@mediatek.com>
To: <broonie@kernel.org>, <robh+dt@kernel.org>
CC: <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>, 
 <Project_Global_Chrome_Upstream_Group@mediatek.com>, Johnson Wang
 <johnson.wang@mediatek.com>
Subject: [RESEND v2 0/2] Add support for MediaTek PMIC MT6366
Date: Fri, 1 Apr 2022 16:02:10 +0800
Message-ID: <20220401080212.27383-1-johnson.wang@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220401_010236_971726_184C65F8 
X-CRM114-Status: UNSURE (   7.42  )
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

This patchset adds support for MediaTek PMIC MT6366.
MT6366 is the primary PMIC for MT8186 and probably other SOCs.

Resend v2:
- rebase on Linux 5.17

Changes in v2:
- rebase on Linux 5.17-rc8
- change subject line

Johnson Wang (2):
  regulator: mt6366: Add support for MT6366 regulator
  dt-bindings: regulator: Add BUCK and LDO document for MT6358 and
    MT6366

 .../bindings/regulator/mt6358-regulator.txt   |  22 +-
 drivers/regulator/mt6358-regulator.c          | 213 +++++++++++++++++-
 include/linux/regulator/mt6358-regulator.h    |  45 ++++
 3 files changed, 270 insertions(+), 10 deletions(-)

-- 
2.18.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
