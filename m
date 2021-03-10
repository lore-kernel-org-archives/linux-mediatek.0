Return-Path: <SRS0=oSKo=II=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 78F52C433E0
	for <linux-mediatek@archiver.kernel.org>; Wed, 10 Mar 2021 06:37:51 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0295461554
	for <linux-mediatek@archiver.kernel.org>; Wed, 10 Mar 2021 06:37:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0295461554
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=7jAWohgqDX+K1CpHZYMX/Xc9AsaLf1a+hmYmCUbzPAc=; b=PjymHl/8hx5CllYjg7MHWbXUo
	kTVlMDsEtAS93XTdiK1pgDCAdgDK5+Lbxg+xp9qeNDKFU66HyNuq+lpWe4e9b42Z1OFXj238onJ6G
	XiUNR0dyo+ISqqAdNyHHOTfLXg/mHrynumGPk4hW7GO+PW+mxGg9Uq0b9Fb8geS0W3iwqx0/ld+y3
	KCMggvGho8653Hmb5btR22hCzXWpSQfasE0x0/9+6fktnKfETU241+w34GTbSJGKjQ0t89n+Ek+EW
	OfK42Ync35vCeuJM1+9jwcN076krttlRByWNZdbBOvRDDOKc7J80nRdfeFwUs9OeXUMbF98J6z5vh
	LbcOfCDJw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lJsTS-0068Mt-63; Wed, 10 Mar 2021 06:37:38 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lJsT1-0068Ih-8n; Wed, 10 Mar 2021 06:37:14 +0000
X-UUID: d68ae19f12cb4ad78b06efce5e236b60-20210309
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=JIcMQYRcDv7SQhpYinYXY0QGj7QnIQrNoKQlscrJVOI=; 
 b=AXaXnofvcFfXlW54NvRot9nsLQMY9Wdr8WLpRhj/qX8V0ZSOaqvFwyj2gP0sy1bTVcpYnu409Y0ryC8QElhWYBx3HGaDAMruI6wBL8ethoC+V09pTUUv45d+CUUFbuERqTYHp801sS9RWxsIJJqVVqpG830wqzEXVjRNdBsSI88=;
X-UUID: d68ae19f12cb4ad78b06efce5e236b60-20210309
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw01.mediatek.com
 (envelope-from <macpaul.lin@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 500376564; Tue, 09 Mar 2021 22:37:04 -0800
Received: from MTKMBS06N2.mediatek.inc (172.21.101.130) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 9 Mar 2021 22:37:02 -0800
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs06n2.mediatek.inc (172.21.101.130) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 10 Mar 2021 14:37:00 +0800
Received: from mtkswgap22.mediatek.inc (172.21.77.33) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Wed, 10 Mar 2021 14:37:00 +0800
From: Macpaul Lin <macpaul.lin@mediatek.com>
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Catalin Marinas
 <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Michael Turquette
 <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Wendell Lin
 <Wendell.Lin@mediatek.com>, Fabien Parent <fparent@baylibre.com>, Weiyi Lu
 <weiyi.lu@mediatek.com>, Mars Cheng <mars.cheng@mediatek.com>, Sean Wang
 <Sean.Wang@mediatek.com>, Macpaul Lin <Macpaul.Lin@mediatek.com>, Owen Chen
 <owen.chen@mediatek.com>, Evan Green <evgreen@chromium.org>,
 <Yong.Wu@mediatek.com>, Joerg Roedel <jroedel@suse.de>, Shawn Guo
 <shawnguo@kernel.org>, Marc Zyngier <marc.zyngier@arm.com>, Ryder Lee
 <Ryder.Lee@mediatek.com>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, <linux-clk@vger.kernel.org>
CC: Ainge Hsu <ainge.hsu@mediatek.com>, Eddie Hung <eddie.hung@mediatek.com>, 
 Mediatek WSD Upstream <wsd_upstream@mediatek.com>, Macpaul Lin
 <macpaul.lin@mediatek.com>, Macpaul Lin <macpaul@gmail.com>, CC Hwang
 <cc.hwang@mediatek.com>, Loda Chou <loda.chou@mediatek.com>
Subject: [PATCH v10 1/4] dt-bindings: mediatek: Add smi dts binding for
 Mediatek MT6765 SoC
Date: Wed, 10 Mar 2021 14:36:55 +0800
Message-ID: <1615358218-6540-2-git-send-email-macpaul.lin@mediatek.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1615358218-6540-1-git-send-email-macpaul.lin@mediatek.com>
References: <1615291538-9799-1-git-send-email-macpaul.lin@mediatek.com>
 <1615358218-6540-1-git-send-email-macpaul.lin@mediatek.com>
MIME-Version: 1.0
X-TM-SNTS-SMTP: FAB197EE1B01A55809C9343ECD748E870B9E627A6B6FFE7075886AA15BD7EA8C2000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210310_063711_738050_BAA73526 
X-CRM114-Status: GOOD (  10.63  )
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

From: Mars Cheng <mars.cheng@mediatek.com>

This patch adds MT6765 smi binding document

Signed-off-by: Mars Cheng <mars.cheng@mediatek.com>
Signed-off-by: Owen Chen <owen.chen@mediatek.com>
Signed-off-by: Macpaul Lin <macpaul.lin@mediatek.com>
Acked-by: Rob Herring <robh@kernel.org>
---
 .../bindings/memory-controllers/mediatek,smi-common.yaml         | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/memory-controllers/mediatek,smi-common.yaml b/Documentation/devicetree/bindings/memory-controllers/mediatek,smi-common.yaml
index a08a32340987..4a4f4377576f 100644
--- a/Documentation/devicetree/bindings/memory-controllers/mediatek,smi-common.yaml
+++ b/Documentation/devicetree/bindings/memory-controllers/mediatek,smi-common.yaml
@@ -31,6 +31,7 @@ properties:
       - enum:
           - mediatek,mt2701-smi-common
           - mediatek,mt2712-smi-common
+          - mediatek,mt6765-smi-common
           - mediatek,mt6779-smi-common
           - mediatek,mt8167-smi-common
           - mediatek,mt8173-smi-common
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
