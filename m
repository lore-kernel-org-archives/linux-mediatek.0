Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8900C433EF
	for <linux-mediatek@archiver.kernel.org>; Mon,  7 Mar 2022 12:48:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=+fFUiRpwY3KKKOKgyODICE9ZyCcmBO25iQEpA4/udXo=; b=okmcdvk6z6ShiN
	/Fp3YZ9EwG1/DD34PZy5i1XZZBl5z+pJtFoltjkE86Vdes/S6ReQolOc78Vmj0LphtxydnEDlNirw
	k7TcvvBPB0cP9ZRn3jdl7eN/+gmpvse+PeufOiMvg1/h8MBxqOOthK6iF5HqvJIlm6+TiRd7top02
	5fLPsFAfFQ4FeQ/pYGe4IF2R2kk+s+tGKYNNT/n57tp3JFOmndSztpXGWem2aAQT9vn4RHKY2AbrG
	lvrOtNOqC2TQKW4rf9x8iJy7jgmBQUrDTlFccaYDhgONWwd1xQM0wn+Yr91g5bscFz1L3uy4b4dUA
	gJhyJyxhNOelZeO8/lcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nRCn2-0007A8-QS; Mon, 07 Mar 2022 12:48:40 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nRCa7-0002QR-KO; Mon, 07 Mar 2022 12:35:20 +0000
X-UUID: 33def4b6b24f4182878411c409d1cf07-20220307
X-UUID: 33def4b6b24f4182878411c409d1cf07-20220307
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <jia-wei.chang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 126769639; Mon, 07 Mar 2022 05:35:17 -0700
Received: from mtkexhb01.mediatek.inc (172.21.101.102) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 7 Mar 2022 04:25:15 -0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by mtkexhb01.mediatek.inc
 (172.21.101.102) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Mon, 7 Mar 2022 20:25:14 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Mon, 7 Mar 2022 20:25:13 +0800
From: Tim Chang <jia-wei.chang@mediatek.com>
To: MyungJoo Ham <myungjoo.ham@samsung.com>, Kyungmin Park
 <kyungmin.park@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>, "Rob
 Herring" <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 "Liam Girdwood" <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 "Jia-Wei Chang" <jia-wei.chang@mediatek.com>
CC: <linux-pm@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>, 
 <linux-kernel@vger.kernel.org>, <fan.chen@mediatek.com>,
 <louis.yu@mediatek.com>, <roger.lu@mediatek.com>,
 <Allen-yy.Lin@mediatek.com>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>, <hsinyi@google.com>
Subject: [PATCH 0/3] devfreq: mediatek: introduce MTK cci devfreq
Date: Mon, 7 Mar 2022 20:25:10 +0800
Message-ID: <20220307122513.11822-1-jia-wei.chang@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220307_043519_701316_39E0EB7E 
X-CRM114-Status: GOOD (  10.11  )
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

The Cache Coherent Interconnect (CCI) is the management of cache
coherency by hardware. CCI DEVFREQ is DVFS driver for power saving by
scaling clock frequency and supply voltage of CCI. CCI uses the same
input clock source and power rail as LITTLE CPUs on Mediatek SoCs.

Jia-Wei Chang (3):
  dt-bindings: devfreq: mediatek: add mtk cci devfreq dt-bindings
  devfreq: mediatek: add mt8183 cci devfreq driver
  devfreq: mediatek: add platform data to support mt8186

 .../devicetree/bindings/devfreq/mtk-cci.yaml  |  73 +++
 drivers/devfreq/Kconfig                       |  11 +-
 drivers/devfreq/Makefile                      |   2 +-
 drivers/devfreq/mtk-cci-devfreq.c             | 481 ++++++++++++++++++
 4 files changed, 565 insertions(+), 2 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/devfreq/mtk-cci.yaml
 create mode 100644 drivers/devfreq/mtk-cci-devfreq.c

-- 
2.18.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
