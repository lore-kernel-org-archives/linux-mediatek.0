Return-Path: <SRS0=5OX0=OD=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BC27BC433F5
	for <linux-mediatek@archiver.kernel.org>; Mon, 13 Sep 2021 10:23:05 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7AA4A60F9B
	for <linux-mediatek@archiver.kernel.org>; Mon, 13 Sep 2021 10:23:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 7AA4A60F9B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=b997Qd1U+HYJ8YbmIQ0GCvT5aqIr/NnjvPDY0WMNWdk=; b=aREuSjhmqb4Vj/
	bUpDJtHKZTHotsViUgjaL4qSH9u/hIpL08I5kQkY93o1YuugDD6KVhp0jlZIPIsZo4XKHKFrk6Yi4
	Gm0PfypiZILOTt5NOXwIQLHrBXcNUzUgGRJS/dy5wfcAjvG/sgqKuKfapEDL1Q1cMDTzeEFfHZKES
	oFWH5Vt9+9cU0l2/5fUFoPdA44zC8/2dIbgd5Xi/iIaay+ScK/zJHTyZzr0vefwVkG+ddNDFWDlOe
	AvsBof4zt9wZS6TMyUrVQ0y022+r7AkzkeHyvu9XtqoywQMu/lSsj667ak40PNGanpgfQriQhzG4g
	UyUXcNWAoL7o0OaCOoXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mPj6y-001FEg-AF; Mon, 13 Sep 2021 10:22:52 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mPj6v-001FDm-7M; Mon, 13 Sep 2021 10:22:51 +0000
X-UUID: a50c9c7971c542b08e539cc0d935b8f7-20210913
X-UUID: a50c9c7971c542b08e539cc0d935b8f7-20210913
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw01.mediatek.com
 (envelope-from <chun-jie.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1664057458; Mon, 13 Sep 2021 03:22:42 -0700
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 13 Sep 2021 03:22:40 -0700
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 13 Sep 2021 18:22:39 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Mon, 13 Sep 2021 18:22:39 +0800
From: Chun-Jie Chen <chun-jie.chen@mediatek.com>
To: Enric Balletbo Serra <eballetbo@gmail.com>, Matthias Brugger
 <matthias.bgg@gmail.com>, Nicolas Boichat <drinkcat@chromium.org>, "Rob
 Herring" <robh+dt@kernel.org>
CC: <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
 <srv_heupstream@mediatek.com>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: [v5 0/5] Mediatek MT8195 power domain support
Date: Mon, 13 Sep 2021 18:22:27 +0800
Message-ID: <20210913102232.26344-1-chun-jie.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210913_032249_315200_367CBB4D 
X-CRM114-Status: GOOD (  10.54  )
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
and is based on 5.15-rc1.

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
