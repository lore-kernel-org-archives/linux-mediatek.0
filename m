Return-Path: <SRS0=hSNv=LK=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DA6FDC48BE5
	for <linux-mediatek@archiver.kernel.org>; Wed, 16 Jun 2021 00:07:31 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9E4326100A
	for <linux-mediatek@archiver.kernel.org>; Wed, 16 Jun 2021 00:07:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9E4326100A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=mnfpSoj5lzfqKMaFnrO7s2f6ZlqDmOWW05ZHybSfE8E=; b=dFDeoSWxjPPdA9
	Zwz6fkyxd2l/39PmhwvmHtJwf2u9HDoqxZmZj+ZWzyxblE/q/dbmHwBxh/iZxJkFWdGRkY4i3Zp+B
	qBRceTTKjftUN7ORQEenzmfHOpwfMzCTOysGVFHjKDAgSt4M6tJmiQ7YCA62TUbkPCMDzOOUWFoQ9
	UeqjPl0vrbCfcfXIt/ek0GorWXfEk+6hScXJoN0DWHpr61SxRHVS2YlmkZAH0iFouy74zn8nVoEph
	mBY9KUYLsj2pwjnyycmaoC22ceIrYkd4/qNbvw03JXplw8OOVmB0mHGyjIEPyRTUJ4tCDXB1bq+gv
	o+6UtePZn73dMn/XmlDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ltJ5U-00444e-VF; Wed, 16 Jun 2021 00:07:21 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ltJ5R-00443h-Kp; Wed, 16 Jun 2021 00:07:19 +0000
X-UUID: c7ac376ac9b14619ada3644438d312d0-20210615
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=PGPwEW40DStjKiG6ISnWiLSYriD+GftMWjWp/AjqXn8=; 
 b=t/qDDYv+p0XEFdhovfJJExfGWF6KjRkshnFt9LcENXoGq1ciM1tbJAYxFi8W3sVo5wiwtb5fI3CHgrGM+gLSBW5Svw+NLEBIA+6QuAddFdACIuFcbroFlpl625zbpcRvDDb2kKkDWJE5S14dSuXZNJJgxpBcm9rRAWHTAz+/5VU=;
X-UUID: c7ac376ac9b14619ada3644438d312d0-20210615
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <chun-jie.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1370323154; Tue, 15 Jun 2021 17:07:06 -0700
Received: from MTKMBS07N2.mediatek.inc (172.21.101.141) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 15 Jun 2021 17:07:05 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 16 Jun 2021 08:07:03 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Wed, 16 Jun 2021 08:07:03 +0800
From: Chun-Jie Chen <chun-jie.chen@mediatek.com>
To: Enric Balletbo i Serra <enric.balletbo@collabora.com>, Matthias Brugger
 <matthias.bgg@gmail.com>, Nicolas Boichat <drinkcat@chromium.org>, "Rob
 Herring" <robh+dt@kernel.org>
CC: <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
 <srv_heupstream@mediatek.com>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: [RESEND PATCH v2 0/4] Mediatek MT8195 power domain support
Date: Wed, 16 Jun 2021 08:06:54 +0800
Message-ID: <20210616000659.28347-1-chun-jie.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210615_170718_032936_BDBAEF00 
X-CRM114-Status: GOOD (  11.00  )
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
and is based on 5.13-rc3.

reason for resend v2:
- miss patch version in series

change since v1:
- fix signed-off name
- describe more detail in patch 3
- move modification of removing redundant macro to single patch

Chun-Jie Chen (4):
  soc: mediatek: pm-domains: Move power status offset to power domain
    data
  dt-bindings: power: Add MT8195 power domains
  soc: mediatek: pm-domains: Add support for mt8195
  soc: mediatek: pm-domains: Remove unused macro

 .../power/mediatek,power-controller.yaml      |   2 +
 drivers/soc/mediatek/mt8167-pm-domains.h      |  16 +-
 drivers/soc/mediatek/mt8173-pm-domains.h      |  22 +-
 drivers/soc/mediatek/mt8183-pm-domains.h      |  32 +-
 drivers/soc/mediatek/mt8192-pm-domains.h      |  44 +-
 drivers/soc/mediatek/mt8195-pm-domains.h      | 738 ++++++++++++++++++
 drivers/soc/mediatek/mtk-pm-domains.c         |  12 +-
 drivers/soc/mediatek/mtk-pm-domains.h         |   8 +-
 include/dt-bindings/power/mt8195-power.h      |  51 ++
 include/linux/soc/mediatek/infracfg.h         | 103 +++
 10 files changed, 1013 insertions(+), 15 deletions(-)
 create mode 100644 drivers/soc/mediatek/mt8195-pm-domains.h
 create mode 100644 include/dt-bindings/power/mt8195-power.h

--
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
