Return-Path: <SRS0=it3p=NO=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 54FFBC4338F
	for <linux-mediatek@archiver.kernel.org>; Mon, 23 Aug 2021 09:24:47 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2820B61374
	for <linux-mediatek@archiver.kernel.org>; Mon, 23 Aug 2021 09:24:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 2820B61374
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=oU83HuCIb/m4kxrfwtHUEMvdfrTZebAIHNH6PCWRYkg=; b=qW61/tdPYfrPr9
	sxPj1I2sikwOPloe17dMHs7pjrPgzqmGJkkHOIjxHcq+lOfSAFclcauEehWOJIPjgQbbUa6EULt97
	ZnEq/uVoDOhvXDTs6nk7rRWsKv6at8pLZypJ2FGSrLFkLglwHpzLTEteDxcq2gR7k5Kag3pPajvOZ
	10chn4rfmM6zys9uxDIRTFZxVylTBBg9IXzqDgZMeVtHUX8KQ7fKANCdHhti3I6Xz+S/wMOrUng7U
	HFEesHQk7GQksZRrKP3k84rqplBU84R4pN4XhV2hS37gtygPWggkBe+iq003PclAdD1+b3GM12/k7
	bx+A3h4NvkLDBtBPEYQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mI6C1-00G5X8-Mg; Mon, 23 Aug 2021 09:24:33 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mI6Bp-00G5R2-IP; Mon, 23 Aug 2021 09:24:26 +0000
X-UUID: 636a4a87ae534b568933e1203be4caef-20210823
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=Z+YEmRJw5FbOqu3SPoL+KnZLu2Hwn/w60Q8YVv9kIC4=; 
 b=rNXG7jt/Wh3WTOMq9fydW8LfJ3HGBighG1YZLddZhNdeLFILJyPJwJOPJg5aqdvWu7X4NyOwavK2hcsPLn0xlN5Le0tBjosWPqaSzSoKsDiKOZuFgd6z7VsDxGY8FYyfz1FCEO9Dnrk2kTH+2T/iII55xg+stjtaEs9wApes2is=;
X-UUID: 636a4a87ae534b568933e1203be4caef-20210823
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <chun-jie.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 272095220; Mon, 23 Aug 2021 02:24:08 -0700
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 23 Aug 2021 02:24:07 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 23 Aug 2021 17:24:05 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Mon, 23 Aug 2021 17:24:05 +0800
From: Chun-Jie Chen <chun-jie.chen@mediatek.com>
To: Enric Balletbo Serra <eballetbo@gmail.com>, Matthias Brugger
 <matthias.bgg@gmail.com>, Nicolas Boichat <drinkcat@chromium.org>, "Rob
 Herring" <robh+dt@kernel.org>
CC: <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
 <srv_heupstream@mediatek.com>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: [v4 0/5] Mediatek MT8195 power domain support
Date: Mon, 23 Aug 2021 17:23:48 +0800
Message-ID: <20210823092353.3502-1-chun-jie.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210823_022421_668834_D85CF927 
X-CRM114-Status: GOOD (  10.95  )
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
and is based on 5.14-rc1.

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
