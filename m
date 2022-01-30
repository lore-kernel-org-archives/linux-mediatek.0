Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00C55C433F5
	for <linux-mediatek@archiver.kernel.org>; Sun, 30 Jan 2022 01:21:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=iv7J5ycPZn47MICyXze7W17EjEILoZjsuJbrbFEzRo0=; b=NHXbajmoXn+UdC
	QifKBUpHiTWuXoAFEjkNiVVT0Pp66wvQEprODMrqp5qRYZ4908zFhAU6UOo9eIk1UNxTPbNEdiIg4
	alW5LD/47Wp4jm+Jx2CC/W5X2DssEiUYNPdAzMkMCOrVI1kt2eCiTLNe4uQXP9w0/I/gWZlJI5xN0
	qcEG7QOgOdpjePOaQeME+q1MxpKajaVCQBlA5RDHVpreyQ7HrQHhblTkbyLaKPVrD1PBpljI+w4GJ
	wxhhhIrQ2fcUelM3inOCuJhESN7+JJeF4A8W6SBewu2orS60PnwnL8E/2xoRHLs8lH5x6X9etRDZy
	sDPn4gSHauDsp9nP23PQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nDyuM-005gqA-9j; Sun, 30 Jan 2022 01:21:34 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nDyu9-005gmt-Di; Sun, 30 Jan 2022 01:21:22 +0000
X-UUID: 2ba405106e3f48d6826e1e36ce152602-20220129
X-UUID: 2ba405106e3f48d6826e1e36ce152602-20220129
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <chun-jie.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 57194459; Sat, 29 Jan 2022 18:21:13 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sat, 29 Jan 2022 17:21:12 -0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3; 
 Sun, 30 Jan 2022 09:21:10 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Sun, 30 Jan 2022 09:21:10 +0800
From: Chun-Jie Chen <chun-jie.chen@mediatek.com>
To: Enric Balletbo Serra <eballetbo@gmail.com>, Matthias Brugger
 <matthias.bgg@gmail.com>, Nicolas Boichat <drinkcat@chromium.org>, "Rob
 Herring" <robh+dt@kernel.org>
CC: <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
 <srv_heupstream@mediatek.com>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: [v7 0/5] Mediatek MT8195 power domain support
Date: Sun, 30 Jan 2022 09:20:59 +0800
Message-ID: <20220130012104.5292-1-chun-jie.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220129_172121_488692_CB8151C1 
X-CRM114-Status: GOOD (  11.01  )
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

This patch series adds power domain support for MT8195
and is based on 5.17-rc1.

change since v6:
- rebase to 5.17-rc1

change since v5:
- rebase to 5.16-rc1
- add domain capacity in mfg power domain

change since v4:
- rebase to 5.15-rc1 (fix conflict at patch 4 in this series)
- change license

change since v3:
- remove redundant bus protection steps
- remove unused power domain

change since v2:
- move modification of wakeup capacity to single patch

reason for resend v2:
- miss patch version in series

changes since v1:
- fix signed-off name
- describe more detail in patch 3
- move modification of removing redundant macro to single patch

Chun-Jie Chen (5):
  dt-bindings: power: Add MT8195 power domains
  soc: mediatek: pm-domains: Add wakeup capacity support in power domain
  soc: mediatek: pm-domains: Remove unused macro
  soc: mediatek: pm-domains: Move power status offset to power domain
    data
  soc: mediatek: pm-domains: Add support for mt8195

 .../power/mediatek,power-controller.yaml      |   2 +
 drivers/soc/mediatek/mt8167-pm-domains.h      |  16 +-
 drivers/soc/mediatek/mt8173-pm-domains.h      |  22 +-
 drivers/soc/mediatek/mt8183-pm-domains.h      |  32 +-
 drivers/soc/mediatek/mt8192-pm-domains.h      |  44 +-
 drivers/soc/mediatek/mt8195-pm-domains.h      | 613 ++++++++++++++++++
 drivers/soc/mediatek/mtk-pm-domains.c         |  12 +-
 drivers/soc/mediatek/mtk-pm-domains.h         |   8 +-
 include/dt-bindings/power/mt8195-power.h      |  46 ++
 include/linux/soc/mediatek/infracfg.h         |  82 +++
 10 files changed, 862 insertions(+), 15 deletions(-)
 create mode 100644 drivers/soc/mediatek/mt8195-pm-domains.h
 create mode 100644 include/dt-bindings/power/mt8195-power.h

-- 
2.18.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
