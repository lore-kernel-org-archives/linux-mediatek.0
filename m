Return-Path: <SRS0=vV1m=M2=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9C2BAC4338F
	for <linux-mediatek@archiver.kernel.org>; Tue,  3 Aug 2021 07:59:48 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 63D9460F92
	for <linux-mediatek@archiver.kernel.org>; Tue,  3 Aug 2021 07:59:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 63D9460F92
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WFuEIHJFler6YNBaoq+Rp4k3Q6umkhuHHeDNjklvd24=; b=qi5sJJm7PLI5q1
	VHr4zJ8oc/gIGvx/4LKdbhfjIgWSurkyd0LZq1Lz5NzUzUzUeTHdjbBSrmkHLIaldgztj36/jmxIw
	HUGgqIIEff8nzPkOWXO3zuviUg3U5OKyWjsrXlB8as4OqEP5r0voikJeE6ixE0RrSMZLonHtq8Fv/
	LuvWCv92SsdPe2Ia667QithPkbj/whEW6ZtUbEKuUQAcc1Gpl3UbEkYYQ6CVueZRyKy0jIKNJyyup
	LFX9Eatg5f3hVokn4S6fa9VTzJZFeFtQGyKycwp1acuG26sXGTSX/R3RE65RrC/GkT3Bzt+0AVW+j
	tyJv2a2+W/OKZe6zTadQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mApKq-001Uih-FH; Tue, 03 Aug 2021 07:59:36 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mApKl-001Ugx-ER; Tue, 03 Aug 2021 07:59:34 +0000
X-UUID: 564ec525b7244b9197e730dfce1b37c7-20210803
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=6idPv4wujekWL6ElF1hNsHyMHLUvB/7t6JPkkDELwHw=; 
 b=WXsInM9282WoURR8NFTrPFkOfRNrzRdWQLsaGTdTw+e8kSDlJjfLPe4l8wol6P5hL/CD2pKpJmWj7sizBcpQv4GzgqpG7oPBpUDXyAxXN0NPYqg59H/pu5SgP4+jgrunUBbU06NlPkEm1BktwApSowzmPiphBN0zQ/5JD8xoVFk=;
X-UUID: 564ec525b7244b9197e730dfce1b37c7-20210803
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw01.mediatek.com
 (envelope-from <tinghan.shen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1552845839; Tue, 03 Aug 2021 00:59:27 -0700
Received: from MTKMBS02N2.mediatek.inc (172.21.101.101) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 3 Aug 2021 00:59:26 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs02n2.mediatek.inc (172.21.101.101) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 3 Aug 2021 15:59:24 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Tue, 3 Aug 2021 15:59:24 +0800
From: Tinghan Shen <tinghan.shen@mediatek.com>
To: <ohad@wizery.com>, <bjorn.andersson@linaro.org>,
 <mathieu.poirier@linaro.org>, <robh+dt@kernel.org>, <matthias.bgg@gmail.com>, 
 <krzysztof.kozlowski@canonical.com>, <shawnguo@kernel.org>,
 <sam@ravnborg.org>, <linux@rempel-privat.de>, <daniel@0x0f.com>,
 <Max.Merchel@tq-group.com>, <geert+renesas@glider.be>, <fanghao11@huawei.com>
CC: <linux-remoteproc@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>, 
 <linux-kernel@vger.kernel.org>, Tinghan Shen <tinghan.shen@mediatek.com>
Subject: [PATCH v5 2/5] dt-bindings: remoteproc: mediatek: Add binding for
 mt8192 scp
Date: Tue, 3 Aug 2021 15:59:19 +0800
Message-ID: <20210803075922.11611-3-tinghan.shen@mediatek.com>
X-Mailer: git-send-email 2.15.GIT
In-Reply-To: <20210803075922.11611-1-tinghan.shen@mediatek.com>
References: <20210803075922.11611-1-tinghan.shen@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210803_005932_943684_50DB1FDF 
X-CRM114-Status: GOOD (  10.74  )
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

Add mt8192 compatible to binding document.

Acked-by: Rob Herring <robh@kernel.org>
Signed-off-by: Tinghan Shen <tinghan.shen@mediatek.com>
---
 Documentation/devicetree/bindings/remoteproc/mtk,scp.txt | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/remoteproc/mtk,scp.txt b/Documentation/devicetree/bindings/remoteproc/mtk,scp.txt
index d64466eefbe3..88f37dee7bca 100644
--- a/Documentation/devicetree/bindings/remoteproc/mtk,scp.txt
+++ b/Documentation/devicetree/bindings/remoteproc/mtk,scp.txt
@@ -7,14 +7,17 @@ Mediatek SoCs.
 Required properties:
 - compatible		Should be one of:
 				"mediatek,mt8183-scp"
+				"mediatek,mt8192-scp"
 				"mediatek,mt8195-scp"
 - reg			Should contain the address ranges for memory regions:
 			SRAM, CFG, and L1TCM.
 - reg-names		Contains the corresponding names for the memory regions:
 			"sram", "cfg", and "l1tcm".
-- clocks		Required by mt8183. Clock for co-processor (See: ../clock/clock-bindings.txt)
-- clock-names		Required by mt8183. Contains the corresponding name for the clock. This
-			should be named "main".
+- clocks		Required by mt8183 and mt8192. Clock for co-processor
+			(See: ../clock/clock-bindings.txt)
+- clock-names		Required by mt8183 and mt8192. Contains the
+			corresponding name for the clock. This should be
+			named "main".
 
 Subnodes
 --------
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
