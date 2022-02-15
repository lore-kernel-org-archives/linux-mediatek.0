Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3102C433FE
	for <linux-mediatek@archiver.kernel.org>; Tue, 15 Feb 2022 10:49:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=6B0arKVhtfXYs+EUmNluPA8gfKECq8WJFhjXigVeUtc=; b=oYShbz0BKwLstK
	ZRAFl0lpO6gN0oHDbg2d39Z/qwXZHtzI6crbeVwzCEMay67C2aD9Hu0W6RVBwngEnCyrcmvOk31xK
	mo+blVl/zm/c35eXo0q0m/UJihQgR3XzQ1JiPuQWl5RTXDGPyX8pNvIfB3RBYsTZsgbwDK9q6kD6r
	dsSqRpcycR5EnPRE2IedIWHARZZH215ASfvG4HFaHbYqIdyzPprsb8BB/2Kg3aK0x08ekgvw1Z+aj
	pwg19BtUxbS8PnOPAQct8/xyJSB4NyOAmJfbt8uYxNusXrAqJiMBNCQ7K/CTdfV3p0FiW+Sn89W54
	vCJlbST+12wZJ1aNlWtQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nJvP2-002MLi-P1; Tue, 15 Feb 2022 10:49:48 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nJvOn-002MEB-1x; Tue, 15 Feb 2022 10:49:35 +0000
X-UUID: eef6ec4839f74cbab0ff18b0791ea835-20220215
X-UUID: eef6ec4839f74cbab0ff18b0791ea835-20220215
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw02.mediatek.com
 (envelope-from <chun-jie.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1547879403; Tue, 15 Feb 2022 03:49:30 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 15 Feb 2022 02:49:28 -0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3; 
 Tue, 15 Feb 2022 18:49:26 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Tue, 15 Feb 2022 18:49:26 +0800
From: Chun-Jie Chen <chun-jie.chen@mediatek.com>
To: Enric Balletbo Serra <eballetbo@gmail.com>, Matthias Brugger
 <matthias.bgg@gmail.com>, Nicolas Boichat <drinkcat@chromium.org>, "Rob
 Herring" <robh+dt@kernel.org>
CC: <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
 <srv_heupstream@mediatek.com>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: [v2 0/2] Mediatek MT8186 power domain support
Date: Tue, 15 Feb 2022 18:49:15 +0800
Message-ID: <20220215104917.5726-1-chun-jie.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220215_024933_121475_A8A1C649 
X-CRM114-Status: UNSURE (   9.77  )
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

This patch series adds power domain support for MT8186
and depends on [1] based on 5.17-rc1.

change since v1:
- change to dual license in dt-binding

[1] https://patchwork.kernel.org/project/linux-mediatek/list/?series=609799

Chun-Jie Chen (2):
  dt-bindings: power: Add MT8186 power domains
  soc: mediatek: pm-domains: Add support for mt8186

 .../power/mediatek,power-controller.yaml      |   1 +
 drivers/soc/mediatek/mt8186-pm-domains.h      | 344 ++++++++++++++++++
 drivers/soc/mediatek/mtk-pm-domains.c         |   5 +
 include/dt-bindings/power/mt8186-power.h      |  32 ++
 include/linux/soc/mediatek/infracfg.h         |  48 +++
 5 files changed, 430 insertions(+)
 create mode 100644 drivers/soc/mediatek/mt8186-pm-domains.h
 create mode 100644 include/dt-bindings/power/mt8186-power.h

--
2.18.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
