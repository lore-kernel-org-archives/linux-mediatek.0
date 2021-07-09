Return-Path: <SRS0=yaqe=MB=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A57D1C07E99
	for <linux-mediatek@archiver.kernel.org>; Fri,  9 Jul 2021 12:47:40 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 73F5E6135B
	for <linux-mediatek@archiver.kernel.org>; Fri,  9 Jul 2021 12:47:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 73F5E6135B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=PRMooJyd9U2tkBMrV0UPFw6ItKvKURnydjxgNnGoNio=; b=IeNQIoG6gJkdj/
	Kik01JTad/hXZabx4Hj2GpHjNhOpYB52SjT8Sm+T7MerDHu9f9S7uzTDeCpVBfa3MkD3cZwYA4Fjo
	pfGMKaueU7tr+S2jYLWH55b8RD9Qa087S9Es6NY0pgweU+WO5QM/ey3ukGa0IQM0T+G3R/uqjIGOb
	KZ28H9ZFeTFOprqcX4f8R8VzK6CvMk+uX7KzX0OVY8ptQxIzLMUH/y2H4oWIt1aa2g6DN31Ow/23n
	S6jPb2EVoB1aBgEqWTHHmJ5moborZ/66ijSH/sLPPsM01+J/M5vA7QbqySJq24rpYZFH9e8viUkAp
	MnI8U80nxL1cEvxN8nAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m1pul-001mxW-9A; Fri, 09 Jul 2021 12:47:31 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m1pug-001mvz-Nx; Fri, 09 Jul 2021 12:47:29 +0000
X-UUID: 1eba50e49109429a803bc4d34a78770d-20210709
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=GJ6J9mfFb7Vl+0hlKdtSR+NtmySOOH/cV4WQCclYIP0=; 
 b=uF2CFIZxUOqBKRQLUmM/5uhyQruKqszY9DXvsjxkjk5j8isWarJLhIFX03ZHknmpi4GTJjwIPFPbD787B8sM8+PrOsG6bsb91fkmLYVpYUKVn4SZ1NOrkk4dlrsJNR+tpVGxH6wc061ZsvDmnAoqsTxkXhUo1qElFk3VDkdys3c=;
X-UUID: 1eba50e49109429a803bc4d34a78770d-20210709
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw02.mediatek.com
 (envelope-from <tinghan.shen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 366247882; Fri, 09 Jul 2021 05:47:22 -0700
Received: from MTKMBS07N2.mediatek.inc (172.21.101.141) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 9 Jul 2021 05:47:20 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 9 Jul 2021 20:47:18 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Fri, 9 Jul 2021 20:47:18 +0800
From: Tinghan Shen <tinghan.shen@mediatek.com>
To: <ohad@wizery.com>, <bjorn.andersson@linaro.org>,
 <mathieu.poirier@linaro.org>, <robh+dt@kernel.org>, <matthias.bgg@gmail.com>
CC: <linux-remoteproc@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>, 
 <linux-kernel@vger.kernel.org>, <srv_heupstream@mediatek.com>,
 <tzungbi@google.com>, <Project_Global_Chrome_Upstream_Group@mediatek.com>,
 Tinghan Shen <tinghan.shen@mediatek.com>
Subject: [PATCH 1/2] dt-bindings: remoteproc: mediatek: Add binding for mt8195
 scp
Date: Fri, 9 Jul 2021 20:46:30 +0800
Message-ID: <20210709124631.28312-1-tinghan.shen@mediatek.com>
X-Mailer: git-send-email 2.15.GIT
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210709_054728_228019_166B7DC0 
X-CRM114-Status: GOOD (  11.92  )
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

Add mt8195 compatible to binding document. The description of required
properties are also modified to reflect the hardware change between
mt8183 and mt8195. The mt8195 doesn't have to control the scp clock on
kernel side.

Signed-off-by: Tinghan Shen <tinghan.shen@mediatek.com>
---
 Documentation/devicetree/bindings/remoteproc/mtk,scp.txt | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/remoteproc/mtk,scp.txt b/Documentation/devicetree/bindings/remoteproc/mtk,scp.txt
index 3f5f78764b60..d64466eefbe3 100644
--- a/Documentation/devicetree/bindings/remoteproc/mtk,scp.txt
+++ b/Documentation/devicetree/bindings/remoteproc/mtk,scp.txt
@@ -5,13 +5,15 @@ This binding provides support for ARM Cortex M4 Co-processor found on some
 Mediatek SoCs.
 
 Required properties:
-- compatible		Should be "mediatek,mt8183-scp"
+				"mediatek,mt8183-scp"
+				"mediatek,mt8195-scp"
 - reg			Should contain the address ranges for memory regions:
 			SRAM, CFG, and L1TCM.
 - reg-names		Contains the corresponding names for the memory regions:
 			"sram", "cfg", and "l1tcm".
-- clocks		Clock for co-processor (See: ../clock/clock-bindings.txt)
-- clock-names		Contains the corresponding name for the clock. This
+- clocks		Required by mt8183. Clock for co-processor (See: ../clock/clock-bindings.txt)
+- clock-names		Required by mt8183. Contains the corresponding name for the clock. This
 			should be named "main".
 
 Subnodes
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
