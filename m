Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03BFCC433EF
	for <linux-mediatek@archiver.kernel.org>; Mon,  7 Mar 2022 12:43:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=2P9ac6MG0TlCS3TuxG+wMG4DTkMlz2QBhICXLgns7rg=; b=QJDF0bUT/CnKl0
	YkO7c1XicIdYfOvymthJFKX0iSfiqIHBJ43ofrlJLx2zNobwOWsxbTkWGvuVVWeKC0NwSHfikI67U
	imB01t/cZKotgOHgH01TBftk5wPUBQq2XYsZxUkgiUuMf97RoEN7TTBpef40t0vGy4WRlYfZ37nNJ
	Hhxszq9tLtp77OzcJGEjXsCa819qbAFaQ3xjxRpsYEUFWtqvGFC6k5Uv5VmavG/uqpcRolH2+05KW
	goWS4J3r/gXwpydc1mQtIyNZX2ISZ5cDyShQ7wT9pykg0ZsUkK8C9Cth6vE5gSIjXsSlywmb5mlyo
	gKSKkV42eZBk9UlAKOXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nRChU-0004o8-CO; Mon, 07 Mar 2022 12:42:56 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nRCX6-0000zm-O7; Mon, 07 Mar 2022 12:32:14 +0000
X-UUID: f5e9041b1d374636925cee308dd2428f-20220307
X-UUID: f5e9041b1d374636925cee308dd2428f-20220307
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <jia-wei.chang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1700840886; Mon, 07 Mar 2022 05:32:00 -0700
Received: from mtkexhb02.mediatek.inc (172.21.101.103) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 7 Mar 2022 04:21:58 -0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by mtkexhb02.mediatek.inc
 (172.21.101.103) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Mon, 7 Mar 2022 20:21:51 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Mon, 7 Mar 2022 20:21:51 +0800
From: Tim Chang <jia-wei.chang@mediatek.com>
To: "Rafael J . Wysocki" <rafael@kernel.org>, Viresh Kumar
 <viresh.kumar@linaro.org>, Rob Herring <robh+dt@kernel.org>, Liam Girdwood
 <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Jia-Wei Chang <jia-wei.chang@mediatek.com>
CC: <linux-pm@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, <fan.chen@mediatek.com>,
 <louis.yu@mediatek.com>, <roger.lu@mediatek.com>,
 <Allen-yy.Lin@mediatek.com>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>, <hsinyi@google.com>
Subject: [PATCH 0/4] cpufreq: mediatek: introduce mtk cpufreq
Date: Mon, 7 Mar 2022 20:21:47 +0800
Message-ID: <20220307122151.11666-1-jia-wei.chang@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220307_043212_836100_CF10C5C1 
X-CRM114-Status: UNSURE (   8.78  )
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

CPUFREQ is DVFS driver used for power saving by scaling clock frequency
and supply voltage of CPUs. This module cooperates with CCI DEVFREQ for
certain Mediatek SoCs.

Jia-Wei Chang (4):
  dt-bindings: cpufreq: mediatek: transform cpufreq-mediatek into yaml
  dt-bindings: cpufreq: mediatek: add mt8186 cpufreq dt-bindings
  cpufreq: mediatek: clean up cpufreq driver
  cpufreq: mediatek: add platform data and clean up voltage tracking
    logic

 .../bindings/cpufreq/cpufreq-mediatek.yaml    | 172 +++++
 drivers/cpufreq/mediatek-cpufreq.c            | 717 +++++++++---------
 2 files changed, 521 insertions(+), 368 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/cpufreq/cpufreq-mediatek.yaml

-- 
2.18.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
