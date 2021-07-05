Return-Path: <SRS0=Syrz=L5=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 46DE5C07E98
	for <linux-mediatek@archiver.kernel.org>; Mon,  5 Jul 2021 05:41:31 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0DB27613F1
	for <linux-mediatek@archiver.kernel.org>; Mon,  5 Jul 2021 05:41:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0DB27613F1
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=klodcbOtVtWxKjhYPQqaiVoXFz4ie5mKZy01vDp7EsE=; b=ncjaGquiZDoDtm
	wTNaKYG2EU51FeelOd4cFABNUGN3/W4bQjEnpVnnL3TN/vcQ3dE6ewhl/3BO+nGnyAKBTOWZt0lBi
	JFYfHQZGDNUpIQuWOgKbNxq0a6RQ+H9qq78lzTqMEId2QPFCHMo+Vg5qduzCUIMZzwzvXmJeovNNi
	8PiENb4s9C74lOlR5oQR6rBwSwA7A5ALA7p1NxEAQRARBMvKKfJZRT+sSQmsObygEEY9lzdV6olk8
	R7CNJxpdhYZbKL9hJcApIXtczbripcUSSp9BPh2CEz+SCOOZ4loREKj4xHYvA5ere687im3JDrTMq
	dmo9uR8x9G65C8CaKs+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m0HM9-007tbi-LK; Mon, 05 Jul 2021 05:41:21 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m0HM6-007taG-D5; Mon, 05 Jul 2021 05:41:19 +0000
X-UUID: ebe6bf066d904cf38c092fbdbc12e82c-20210704
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=MAcbra3J1GaPdkP0L95t57ku32jhg3cc9JifZwcukdE=; 
 b=S4c969+FAo3XGPGkkPpghWYED5NzOkzAAmoTyGwII9wLrQ0TAPhr4qGO7jfFsQWmQ4vS1+pcdTMyrCjN0U7hoBPh6iANMKs1dgiMFaNbfC4Fh86inObVhXfxUp4ELXsbSPq1aN4A4CCHVa+RLGy4RW2Pmh/+l5C8+NZ+3FsOAsU=;
X-UUID: ebe6bf066d904cf38c092fbdbc12e82c-20210704
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw01.mediatek.com
 (envelope-from <chun-jie.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1903104237; Sun, 04 Jul 2021 22:41:16 -0700
Received: from MTKMBS07N2.mediatek.inc (172.21.101.141) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sun, 4 Jul 2021 22:41:15 -0700
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 5 Jul 2021 13:41:13 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Mon, 5 Jul 2021 13:41:13 +0800
From: Chun-Jie Chen <chun-jie.chen@mediatek.com>
To: Enric Balletbo i Serra <enric.balletbo@collabora.com>, Matthias Brugger
 <matthias.bgg@gmail.com>, Nicolas Boichat <drinkcat@chromium.org>, "Rob
 Herring" <robh+dt@kernel.org>
CC: <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
 <srv_heupstream@mediatek.com>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: [v3 0/5] Mediatek MT8195 power domain support
Date: Mon, 5 Jul 2021 13:41:06 +0800
Message-ID: <20210705054111.4473-1-chun-jie.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210704_224118_515205_9C8DFA94 
X-CRM114-Status: UNSURE (   9.98  )
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

This patch series adds power domain support for MT8195
and is based on 5.13-rc3.

change since v2:
- move modification of wakeup capacity to single patch

reason for resend v2:
- miss patch version in series

changes since v1:
- fix signed-off name
- describe more detail in patch 3
- move modification of removing redundant macro to single patch

Chun-Jie Chen (5):
  soc: mediatek: pm-domains: Move power status offset to power domain
    data
  dt-bindings: power: Add MT8195 power domains
  soc: mediatek: pm-domains: Add support for mt8195
  soc: mediatek: pm-domains: Add wakeup capacity support in power domain
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
