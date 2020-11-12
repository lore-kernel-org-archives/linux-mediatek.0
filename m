Return-Path: <SRS0=Fc+n=ES=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4F72FC5517A
	for <linux-mediatek@archiver.kernel.org>; Thu, 12 Nov 2020 07:52:40 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B38B9221FB
	for <linux-mediatek@archiver.kernel.org>; Thu, 12 Nov 2020 07:52:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="JiNnUtiW";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="NwJn6/LR"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B38B9221FB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=fga930NbVZjTsDf7YPVk8Z7UPs/rGQQbm9AK9qj/bC8=; b=JiNnUtiWPNjXypZzll8NQhC6v9
	8+8Fseo6U5Jqi0uoSSWZ7AkUYbV01N6NlTUv2B/Z0IQhXgrq8EoWujnkuvhKeg9C/f149pCBirOkw
	0yuIUaR+ZLftGGd2Vhh43FP8FLXOpFp9Ty4IxJpxVarTrJoGNAoHsyK6OT0NQ4Va7rqbrHzabHzaZ
	arLhowVj2QzZRMBJkvz9aj54TlE3q/9Li1czxP7KCwtCQLPkGj2iWoBTxm6w5ASKwL18KKwm0TAOP
	l4iuk0oK/GV8VEZ7d3jVcj/QTs1eW6l1Msrx4R2p0gO001Kwwbyt7+v1hu3C0P0K6xKygEudpXP12
	CceCe3nw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kd7PC-0006dT-5A; Thu, 12 Nov 2020 07:52:30 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kd7P2-0006aq-SJ; Thu, 12 Nov 2020 07:52:22 +0000
X-UUID: 1fc01d8b0aae48d4808ba51ec69477d2-20201111
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=HRIBWY1x6TEgipWRllyeEf/7f3rrT3UV94QusJIqEec=; 
 b=NwJn6/LRDOAphr9H0rIrqIpmO/+0cTek9ZrmwG4kwbl1uOu+LtqWsD7l5u6NmspN0WZyr0jwVHZnrm2jpScRQzBix/Csexwrvtp0+ozHkORwn6MkDOpuGdnqCwAN3tkwW46XMxD/xG1oz2O0dp+qd2S5Tk/7415U2pQzr4xMFHc=;
X-UUID: 1fc01d8b0aae48d4808ba51ec69477d2-20201111
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <wenbin.mei@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 132372096; Wed, 11 Nov 2020 23:52:06 -0800
Received: from MTKMBS07N2.mediatek.inc (172.21.101.141) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 11 Nov 2020 23:52:11 -0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 12 Nov 2020 15:52:10 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 12 Nov 2020 15:52:09 +0800
From: Wenbin Mei <wenbin.mei@mediatek.com>
To: Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh+dt@kernel.org>
Subject: [PATCH v1 0/3] Set cqe off during suspend flow
Date: Thu, 12 Nov 2020 15:52:05 +0800
Message-ID: <20201112075208.28183-1-wenbin.mei@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201112_025221_068504_522F408D 
X-CRM114-Status: GOOD (  10.34  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 Bradley Bolen <bradleybolen@gmail.com>, Wenbin Mei <wenbin.mei@mediatek.com>,
 Baolin Wang <baolin.wang@linaro.org>,
 Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, irq-linux@rere.qmqm.pl,
 linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org,
 srv_heupstream@mediatek.com, linux-mediatek@lists.infradead.org,
 Ludovic Barre <ludovic.barre@st.com>, Krishna Konda <kkonda@codeaurora.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Chaotian Jing <chaotian.jing@mediatek.com>,
 Veerabhadrarao Badiganti <vbadigan@codeaurora.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Wenbin Mei (3):
  dt-bindings: mmc: Add optional cqe off properties
  arm64: dts: mt8192: Add cqe off flag
  mmc: core: Set cqe off during suspend flow
---
This patch depends on
[PATCH v7 3/4] arm64: dts: mt8192: add mmc device node

Please also accept this patch together with [1]
to avoid build and dt binding check error.
[1] https://patchwork.kernel.org/project/linux-mediatek/list/?series=364279
---
 Documentation/devicetree/bindings/mmc/mmc-controller.yaml | 7 +++++++
 arch/arm64/boot/dts/mediatek/mt8192-evb.dts               | 1 +
 drivers/mmc/core/host.c                                   | 2 ++
 drivers/mmc/core/mmc.c                                    | 5 +++++
 include/linux/mmc/pm.h                                    | 1 +
 5 files changed, 16 insertions(+)

--
2.18.0

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
